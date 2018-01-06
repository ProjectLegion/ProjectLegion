/*
* Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
* Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
*
* This program is free software; you can redistribute it and/or modify it
* under the terms of the GNU General Public License as published by the
* Free Software Foundation; either version 2 of the License, or (at your
* option) any later version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
* more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see <http://www.gnu.org/licenses/>.
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "Player.h"
#include "SpellScript.h"

#define NPC_WOLF    49871

enum Say
{
    SAY_BLACKROCK_COMBAT = 0,
    SAY_ASSASSIN_COMBAT  = 0
};

enum CreatureIds
{
    NPC_STORMWIND_INFANTRY    = 49869,
    NPC_BLACKROCK_BATTLE_WORG = 49871,
    NPC_BROTHER_PAXTON        = 951,
    NPC_BLACKROCK_SPY         = 49874
};

enum Spells
{
    SPELL_CONVERSATIONS_TRIGGER_01 = 84076,
    SPELL_REVIVE                   = 93799,
    SPELL_PRAYER_OF_HEALING        = 93091,
    SPELL_FLASH_HEAL               = 17843,
    SPELL_PENANCE                  = 47750,
    SPELL_FORTITUDE                = 13864,
    SPELL_SPYING                   = 92857,
    SPELL_SPYGLASS                 = 80676,
    SPELL_SNEAKING                 = 93046
};

/*######
## npc_stormwind_injured_soldier
######*/

#define SPELL_HEAL          93072
#define SPELL_HEAL_VISUAL   93097

class npc_stormwind_injured_soldier : public CreatureScript
{
public:
    npc_stormwind_injured_soldier() : CreatureScript("npc_stormwind_injured_soldier") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_stormwind_injured_soldierAI(creature);
    }

    struct npc_stormwind_injured_soldierAI : public npc_escortAI
    {
        npc_stormwind_injured_soldierAI(Creature* creature) : npc_escortAI(creature) {}

        void Reset() override
        {
            _clicker = nullptr;

            me->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
            me->SetStandState(UNIT_STAND_STATE_DEAD);
        }

        void OnSpellClick(Unit* Clicker, bool& /*result*/) override
        {
            if (!Clicker->IsPlayer())
                return;

            _clicker = Clicker;
            me->CastSpell(me, SPELL_HEAL_VISUAL, true);
            me->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
            me->SetStandState(UNIT_STAND_STATE_STAND);

            me->GetScheduler().Schedule(Milliseconds(1000), [this](TaskContext /*task*/)
            {
                if (_clicker)
                    me->SetFacingToObject(_clicker);

                me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
            });

            me->GetScheduler().Schedule(Milliseconds(3000), [this](TaskContext /*task*/)
            {
                Start(false, true);
            });
        }

        void WaypointReached(uint32 waypointId) override
        {
            if (waypointId == 5)
            {
                me->DespawnOrUnsummon(1000);
                me->SetRespawnDelay(10);
            }
        }

        void EnterCombat(Unit* /*who*/) override
        {
            return;
        }

        Unit* _clicker;
    };
};

/*######
## npc_training_dummy_elwynn
######*/

enum eTrainingDummySpells
{
    SPELL_CHARGE        = 100,
    SPELL_AUTORITE      = 105361, // OnDamage
    SPELL_ASSURE        = 56641,
    SPELL_EVISCERATION  = 2098,
    SPELL_MOT_DOULEUR_1 = 589,
    SPELL_MOT_DOULEUR_2 = 124464, // Je ne sais pas si un des deux est le bon
    SPELL_NOVA          = 122,
    SPELL_CORRUPTION_1  = 172,
    SPELL_CORRUPTION_2  = 87389,
    SPELL_CORRUPTION_3  = 131740,
    SPELL_PAUME_TIGRE   = 100787
};

class npc_training_dummy_start_zones : public CreatureScript
{
public:
    npc_training_dummy_start_zones() : CreatureScript("npc_training_dummy_start_zones") { }

    struct npc_training_dummy_start_zonesAI : Scripted_NoMovementAI
    {
        npc_training_dummy_start_zonesAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {}

        uint32 resetTimer;

        void Reset() override
        {
            me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);//imune to knock aways like blast wave

            resetTimer = 5000;
        }

        void EnterEvadeMode(EvadeReason /*why*/) override
        {
            if (!_EnterEvadeMode())
                return;

            Reset();
        }

        void MoveInLineOfSight(Unit* p_Who) override
        {
            if (!me->IsWithinDistInMap(p_Who, 25.f) && p_Who->IsInCombat())
            {
                me->RemoveAllAurasByCaster(p_Who->GetGUID());
                me->getHostileRefManager().deleteReference(p_Who);
            }
        }

        void DamageTaken(Unit* doneBy, uint32& damage) override
        {
            resetTimer = 5000;
            damage = 0;

            if (doneBy->HasAura(SPELL_AUTORITE))
            {
                if (Player* player = doneBy->ToPlayer())
                {
                    player->KilledMonsterCredit(44175);
                    player->KilledMonsterCredit(44548);

                }
            }
        }

        void EnterCombat(Unit* /*who*/) override
        {
            return;
        }

        void SpellHit(Unit* Caster, const SpellInfo* Spell) override
        {
            switch (Spell->Id)
            {
                case SPELL_CHARGE:
                case SPELL_ASSURE:
                case SPELL_EVISCERATION:
                case SPELL_MOT_DOULEUR_1:
                case SPELL_MOT_DOULEUR_2:
                case SPELL_NOVA:
                case SPELL_CORRUPTION_1:
                case SPELL_CORRUPTION_2:
                case SPELL_CORRUPTION_3:
                case SPELL_PAUME_TIGRE:
                {
                    if (Player* player = Caster->ToPlayer())
                    {
                        player->KilledMonsterCredit(44175);
                        player->KilledMonsterCredit(44548);
                    }
                    break;
                }
                default:
                    break;
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim())
                return;

            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED);//disable rotate

            if (resetTimer <= diff)
            {
                EnterEvadeMode(EVADE_REASON_OTHER);
                resetTimer = 5000;
            }
            else
                resetTimer -= diff;
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_training_dummy_start_zonesAI(creature);
    }
};

/*######
## spell_quest_fear_no_evil
######*/

class spell_quest_fear_no_evil : public SpellScriptLoader
{
public:
    spell_quest_fear_no_evil() : SpellScriptLoader("spell_quest_fear_no_evil") { }

    class spell_quest_fear_no_evil_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_quest_fear_no_evil_SpellScript);

        void OnDummy(SpellEffIndex /*effIndex*/)
        {
            if (GetCaster())
                if (GetCaster()->ToPlayer())
                    GetCaster()->ToPlayer()->KilledMonsterCredit(50047);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_quest_fear_no_evil_SpellScript::OnDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_quest_fear_no_evil_SpellScript();
    }

};

/*######
## spell_quest_extincteur
######*/

enum eSpellQuestExtincteur
{
    NPC_FIRE = 42940,
};

class spell_quest_extincteur : public SpellScriptLoader
{
public:
    spell_quest_extincteur() : SpellScriptLoader("spell_quest_extincteur") { }

    class spell_quest_extincteur_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_quest_extincteur_SpellScript);

        void OnDummy(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Creature* fire = GetHitCreature();

            if (!caster || !fire)
                return;

            if (fire->GetEntry() != NPC_FIRE)
                return;

            if (Player* player = caster->ToPlayer())
                player->KilledMonsterCredit(NPC_FIRE, fire->GetGUID());

            fire->DespawnOrUnsummon();
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_quest_extincteur_SpellScript::OnDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_quest_extincteur_SpellScript();
    }

};


class npc_blackrock_battle_worg : public CreatureScript
{
public:
    npc_blackrock_battle_worg() : CreatureScript("npc_blackrock_battle_worg") { }

    struct npc_blackrock_battle_worgAI : public ScriptedAI
    {
        npc_blackrock_battle_worgAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            m_minHealth = urand(60, 85);
        }

        void DamageTaken(Unit* hitter, uint32& uiDamage) override
        {
            if (Creature* npc = hitter->ToCreature())
                if (npc->GetEntry() == NPC_STORMWIND_INFANTRY && me->GetHealthPct() < m_minHealth)
                    uiDamage = 0;
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            DoAttack();

            if (!UpdateVictim())
               return;

            DoMeleeAttackIfReady();
        }

        void DoAttack()
        {
            if (!me->IsInCombat())
                if (Creature* infantrist = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 7, true))
                {
                    me->Attack(infantrist, true);
                    if (!infantrist->IsInCombat())
                    {
                        infantrist->Attack(me, true);
                        DoStartMovement(infantrist->GetVictim());
                    }
                }
        }

    private:
        uint32 m_minHealth;
    };

       CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_blackrock_battle_worgAI (creature);
    }
};

class npc_brother_paxton : public CreatureScript
{
public:
    npc_brother_paxton() : CreatureScript("npc_brother_paxton") { }

    struct npc_brother_paxtonAI : public ScriptedAI
    {
        npc_brother_paxtonAI(Creature* creature) : ScriptedAI(creature) { }

        float  _angle;

        void InitializeAI() override
        {
            me->GetMotionMaster()->MovePath(951, true);
            _coolDown = 0;
            _phase = 0;
            _angle = 0;
        }

        void CastHeal(Creature* infantry)
        {   
            if (_phase == 0)
            {
                uint8 c = urand(0, 3);
                switch (c)
                {
                case  0:
                    DoCast(infantry, SPELL_FORTITUDE);
                    break;
                case  1:
                    DoCast(infantry, SPELL_FLASH_HEAL);
                    break;
                case  2:
                    DoCast(infantry, SPELL_PENANCE);
                    break;
                case  3:
                    DoCast(infantry, SPELL_PRAYER_OF_HEALING);
                    break;
                }
                _coolDown = 5000;
                _phase = 1;
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (_phase == 1)
            {
                if (_coolDown <= diff)
                    _phase = 0;
            }
            else
                _coolDown -= diff;

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

    private:
        uint32 _phase;
        uint32 _coolDown;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_brother_paxtonAI(creature);
    }
};

class npc_stormwind_infantry : public CreatureScript
{
public:
    npc_stormwind_infantry() : CreatureScript("npc_stormwind_infantry") { }

    struct npc_stormwind_infantryAI : public ScriptedAI
    {
        npc_stormwind_infantryAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            m_SayWorgTimer = urand(30000, 60000);
            m_SayPaxtonCooldownTimer = 0;
            m_minHealth = urand(60, 85);
        }

        void DamageTaken(Unit* attacker, uint32& damage) override
        {
            if (Creature* npc = attacker->ToCreature())
            {
                if (npc->GetEntry() == NPC_BLACKROCK_BATTLE_WORG && me->GetHealthPct() < m_minHealth)
                {
                    if (Creature* paxton = me->FindNearestCreature(NPC_BROTHER_PAXTON, 15.0f, true))
                    {
                        if (m_SayPaxtonCooldownTimer == 0)
                        {
                            Talk(1);

                            if (npc_brother_paxton::npc_brother_paxtonAI* paxtonAI = CAST_AI(npc_brother_paxton::npc_brother_paxtonAI, paxton->AI()))
                                paxtonAI->CastHeal(me);

                            m_SayPaxtonCooldownTimer = 10000;
                        }
                        damage = 0;
                    }
                }
                else
                    damage = 0;

                if (!me->IsInCombat())
                {
                    me->Attack(npc, true);
                }
            }
        }

        void UpdateAI(uint32 diff) override
        {
            DoWorg(diff);
            DoPaxton(diff);

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

        void DoWorg(uint32 diff)
        {
            if (m_SayWorgTimer <= diff)
            {
                if (me->IsInCombat())
                    Talk(0);

                m_SayWorgTimer = urand(30000, 60000);
            }
            else
                m_SayWorgTimer -= diff;
        }

        void DoPaxton(uint32 diff)
        {
            if (m_SayPaxtonCooldownTimer <= diff)
                m_SayPaxtonCooldownTimer = 0;
            else
                m_SayPaxtonCooldownTimer -= diff;
        }

    private:
        uint32 m_SayWorgTimer;
        uint32 m_SayPaxtonCooldownTimer;
        uint32 m_minHealth;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_stormwind_infantryAI (creature);
    }
};

class npc_blackrock_spy : public CreatureScript
{
public:
    npc_blackrock_spy() : CreatureScript("npc_blackrock_spy") { }

    struct npc_blackrock_spyAI : public ScriptedAI
    {
        npc_blackrock_spyAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            _phase = 0;
            _timer = 0;
        }

        void EnterCombat(Unit* who) override
        { 
            Talk(SAY_BLACKROCK_COMBAT);
            me->RemoveAllAuras();
            _phase = 0;
            _timer = 0;
        }

        void MovementInform(uint32 type, uint32 id) override
        {
            if (me->IsInCombat())
                return;

            if (id == 0 || id == 3)
            {
                uint8 r1 = urand(0, 100);
                uint8 r2 = urand(0, 100);
                uint8 r3 = urand(0, 100);
                if (r1 < 33)
                {
                    me->CastSpell(me, SPELL_SPYGLASS);
                    _phase = 1;
                    _timer = 4800;
                }
                if (r2 < 50)
                {
                    me->HandleEmoteCommand(EMOTE_STATE_KNEEL);
                }
                if (r3 < 50)
                    me->CastSpell(me, SPELL_SPYING);
                else
                    me->CastSpell(me, SPELL_SNEAKING);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (_timer <= diff)
                DoWork();
            else
                _timer -= diff;

            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }

        void DoWork()
        {
            if (me->IsInCombat())
                return;

            switch (_phase)
            {
            case 1:
                me->RemoveAllAuras();
                _phase = 0;
                _timer = 0;
                break;
            case 2:
                break;
            }
           
        }
    private:
        uint32 _phase;
        uint32 _timer;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_blackrock_spyAI (creature);
    }
};

class npc_goblin_assassin : public CreatureScript
{
public:
    npc_goblin_assassin() : CreatureScript("npc_goblin_assassin") { }

    struct npc_goblin_assassinAI : public ScriptedAI
    {
        npc_goblin_assassinAI(Creature *c) : ScriptedAI(c) { }

        void EnterCombat(Unit * /*who*/) override
        {
            Talk(SAY_ASSASSIN_COMBAT);
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            if (!UpdateVictim())
                return;

            DoMeleeAttackIfReady();
        }
    };

     CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_goblin_assassinAI (creature);
    }
};

void AddSC_elwyn_forest()
{
    new npc_stormwind_injured_soldier();
    new npc_training_dummy_start_zones();
    new spell_quest_fear_no_evil();
    new spell_quest_extincteur();
    new npc_stormwind_infantry();
    new npc_brother_paxton();
    new npc_blackrock_battle_worg();
    new npc_blackrock_spy();
    new npc_goblin_assassin();
}

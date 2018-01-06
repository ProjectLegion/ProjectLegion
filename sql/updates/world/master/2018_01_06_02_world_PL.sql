UPDATE spell_proc SET SpellPhaseMask = '6' WHERE SpellId = '7434'; 
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '37603';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '38394'; 
UPDATE spell_proc SET SpellPhaseMask = '7' WHERE SpellId = '39958';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '40438';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '40478';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '45054';
UPDATE spell_proc SET SpellPhaseMask = '7' WHERE SpellId = '55380';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '60170'; 
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '60487'; 
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '64752';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '64824';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '64914';
UPDATE spell_proc SET SpellPhaseMask = '1' WHERE SpellId = '70727';
UPDATE spell_proc SET SpellPhaseMask = '7' WHERE SpellId = '70854';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '71606';
UPDATE spell_proc SET SpellPhaseMask = '2' WHERE SpellId = '71637';

DELETE FROM spell_proc WHERE SpellId=53651;
INSERT INTO spell_proc (SpellId, SchoolMask, SpellFamilyName, SpellFamilyMask0, SpellFamilyMask1, SpellFamilyMask2, ProcFlags, SpellTypeMask, SpellPhaseMask, HitMask, AttributesMask, ProcsPerMinute, Chance, Cooldown, Charges) VALUES
(53651, 0, 0, 0x00000000, 0x00000000, 0x00000000, 0x0, 0x2, 0x7, 0x0, 0x2, 0, 0, 0, 0);

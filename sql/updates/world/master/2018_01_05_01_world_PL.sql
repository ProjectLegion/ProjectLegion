UPDATE `creature_template` SET `unit_flags` = '49920' WHERE `entry` = '50047';
UPDATE `creature_template` SET `lootid` = '49874' WHERE `entry` = '49874';

UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '63258' AND `quest` = '31143';
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '911' AND `quest` = '28789';
DELETE FROM `creature_queststarter` WHERE `id` = 197 AND `quest` = 31139;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES ('197', '31139');
DELETE FROM `creature_queststarter` WHERE `id` = 197 AND `quest` = 31140;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES ('197', '31140');
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '43278' AND `quest` = '28780';
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '459' AND `quest` = '28788';
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '925' AND `quest` = '28785';
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '915' AND `quest` = '28787';
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '375' AND `quest` = '28786';
UPDATE `creature_queststarter` SET `id` = '197' WHERE `id` = '198' AND `quest` = '28784';

DELETE FROM `creature_loot_template` WHERE `Entry`=97 AND `Item`=1307;
DELETE FROM `creature_loot_template` WHERE `Entry`=100 AND `Item`=1307;
DELETE FROM `creature_loot_template` WHERE `Entry`=478 AND `Item`=1307;
DELETE FROM `creature_loot_template` WHERE `Entry` = 13159 AND `Item` = 1307;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Chance`) VALUES ('13159', '1307', '88.49');

DELETE FROM `quest_template_addon` WHERE `PrevQuestID`=39 AND `ID`=46;
DELETE FROM `quest_template_addon` WHERE `PrevQuestID`=239 AND `ID`=11;
DELETE FROM `quest_template_addon` WHERE `ID` IN (46, 11);
INSERT INTO `quest_template_addon` (`ID`) VALUES ('46');
INSERT INTO `quest_template_addon` (`ID`) VALUES ('11');

DELETE FROM `quest_template_addon` WHERE `ID` = 239 AND `PrevQuestID` = 76;
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES ('239', '76');

DELETE FROM `quest_template_addon` WHERE `ID` = 26150 AND `PrevQuestID` = 60;
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES ('26150', '60');

UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28823';
UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28819';
UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28817'; -- Hunter
UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28821'; -- Rogue
UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28820'; -- Priest
UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28818'; -- Mage
UPDATE `quest_template_addon` SET `NextQuestID` = '26389' WHERE `ID` = '28822'; -- Warlock
UPDATE `quest_template_addon` SET `NextQuestID` = '28789' WHERE `ID` = '28774';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28774' , `NextQuestID` = '0' WHERE `ID` = '28789';

DELETE FROM `quest_template_addon` WHERE `ID`=31142 AND `NextQuestID`=31143; 
DELETE FROM `quest_template_addon` WHERE `ID`=31140 AND `PrevQuestID`=31139;
DELETE FROM `quest_template_addon` WHERE `ID`=31143 AND `PrevQuestID`=31140;
DELETE FROM `quest_template_addon` WHERE `ID`=31144 AND `PrevQuestID`=31143;
DELETE FROM `quest_template_addon` WHERE `ID`=31145 AND `PrevQuestID`=31144 AND `NextQuestID`=26389;
DELETE FROM `quest_template_addon` WHERE `ID`=31139 AND `AllowableClasses`=512;
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES ('31140', '31139');
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES ('31143', '31140');
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES ('31144', '31143');
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`, `NextQuestID`) VALUES ('31145', '31144', '26389');
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`) VALUES ('31139', '512');
UPDATE `quest_template_addon` SET `NextQuestID` = '28785' WHERE `ID` = '28770';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28770' , `NextQuestID` = '0' WHERE `ID` = '28785';
UPDATE `quest_template_addon` SET `NextQuestID` = '28780' WHERE `ID` = '28759';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28759' , `NextQuestID` = '0' WHERE `ID` = '28780';
UPDATE `quest_template_addon` SET `NextQuestID` = '28787' WHERE `ID` = '28772';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28772' , `NextQuestID` = '0' WHERE `ID` = '28787';
UPDATE `quest_template_addon` SET `NextQuestID` = '28786' WHERE `ID` = '28771';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28771' , `NextQuestID` = '0' WHERE `ID` = '28786';
UPDATE `quest_template_addon` SET `NextQuestID` = '28784' WHERE `ID` = '28769';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28769' , `NextQuestID` = '0' WHERE `ID` = '28784';
UPDATE `quest_template_addon` SET `NextQuestID` = '28788' WHERE `ID` = '28773';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28773' , `NextQuestID` = '0' WHERE `ID` = '28788';

DELETE FROM `creature_queststarter` WHERE `id`=823 AND `quest`=31144;
DELETE FROM `creature_queststarter` WHERE `id`=823 AND `quest`=31145;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES ('823', '31144');
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES ('823', '31145');

UPDATE `quest_template_addon` SET `PrevQuestID` = '-26389' WHERE `ID` = '26391';
UPDATE `creature_queststarter` SET `quest` = '37112' WHERE `id` = '6774' AND `quest` = '2158';

DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (3100, 3101, 26910, 3102, 3103, 3104, 3105);
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES
('1', '3100', 'Deprecated quest: Simple Letter'),
('1', '3101', 'Deprecated quest: Consecrated Letter'),
('1', '26910', 'Deprecated quest: Etched Letter'),
('1', '3102', 'Deprecated quest: Encrypted Letter'),
('1', '3103', 'Deprecated quest: Hallowed Letter'),
('1', '3104', 'Deprecated quest: Glyphic Letter'),
('1', '3105', 'Deprecated quest: Tainted Letter');

DELETE FROM `quest_template_locale` WHERE `ID` = 41217 AND  `locale` = 'ruRU';
DELETE FROM `quest_template_locale` WHERE `ID` = 41218 AND  `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`, `VerifiedBuild`) VALUES ('41217', 'ruRU', 'Будущее Гномрегана', 'Встретьтесь с Маффинусом Хромоваром в Новом Городе Механиков.', 'Мы считаем победой каждый раз, когда нам удается помочь очередному выжившему выбраться из зараженных залов Гномрегана. $c вроде тебя, несомненно, сыграет важную роль в будущем Гномрегана. В связи с этим главный механик Меггакрут собрал команду наставников, чтобы ты $gмог:могла; обучаться своему искусству.\r\n\r\nМаффинус Хромовар поможет тебе с тренировками и с подготовкой к жизни на поверхности. Он ждет тебя у витрин, что через дорогу.', '23222');
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`, `QuestCompletionLog`, `VerifiedBuild`) VALUES('41218','ruRU','Встретиться с главным механиком','Представьтесь главному механику Меггакруту в Новом Городе Механиков.','Не знаю, помнишь ли ты Меггакрута. Невин говорит, что многие выжившие из Гномрегана страдают потерей памяти.\r\n\r\nМеггакрут или, более официально, главный механик Меггакрут – предводитель всех гномов. Он взял за правило лично встречаться со всеми, кому удалось остаться в живых. Тебе следует представиться Меггакруту. Его вместе с его военным консулом можно найти в шатре в центре города.','Представьтесь главному механику Меггакруту в Новом Городе Механиков.','23222');

SET @CGUID := 452864;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+6;
INSERT INTO `creature` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES 
(@CGUID+0, 103614, -5117.28, 430.91, 402.906, 3.4699),
(@CGUID+1, 103617, -5116.88, 429.157, 402.908, 3.48011),
(@CGUID+2, 63238, -5166.31, 464.473, 390.419, 5.25008),
(@CGUID+3, 63241, -5167.29, 460.484, 390.781, 1.40241),
(@CGUID+4, 63239, -5164.2, 460.734, 391.149, 2.06215),
(@CGUID+5, 63242, -5162.41, 463.509, 390.959, 2.87504),
(@CGUID+6, 8503, -5289.26, 458.865, 383.605, 1.71541);

UPDATE `creature` SET `spawntimesecs` = '1500' , `spawndist` = '5' , `MovementType` = '1' WHERE `id` = '8503';
UPDATE `creature` SET `position_x` = '-5559.78' , `position_y` = '714.691' , `position_z` = '379.027' , `orientation` = '4.36951' , `spawntimesecs` = '900' , `MovementType` = '2' WHERE `guid` = '304826';
UPDATE `creature` SET `position_x` = '-4982.38' , `position_y` = '841.342' , `position_z` = '276.233' , `orientation` = '4.69284' WHERE `guid` = '304615';
UPDATE `creature` SET `position_x` = '-4986.59' , `position_y` = '842.045' , `position_z` = '276.233' , `orientation` = '4.64572' WHERE `guid` = '304616';
UPDATE `creature` SET `position_x` = '-4990.12' , `position_y` = '842.499' , `position_z` = '276.233' , `orientation` = '4.63001' WHERE `guid` = '304617';
UPDATE `creature` SET `position_x` = '-4980.49' , `position_y` = '838.054' , `position_z` = '276.233' , `orientation` = '1.50178' WHERE `guid` = '304606';
UPDATE `creature` SET `position_x` = '-4984.13' , `position_y` = '838.393' , `position_z` = '276.233' , `orientation` = '1.49628' WHERE `guid` = '304652';
UPDATE `creature` SET `position_x` = '-4987.17' , `position_y` = '838.622' , `position_z` = '276.232' , `orientation` = '1.46644' WHERE `guid` = '304680';
UPDATE `creature` SET `position_x` = '-5507.77' , `position_y` = '637.892' , `position_z` = '394.701' , `orientation` = '4.05262' WHERE `guid` = '304830';
UPDATE `creature` SET `spawndist` = '4' , `MovementType` = '1' WHERE `id` = '48956';
UPDATE `creature` SET `spawndist` = '10' , `MovementType` = '1' WHERE `id` = '42184';
UPDATE `creature` SET `spawndist` = '10' , `MovementType` = '1' WHERE `id` = '42185';
UPDATE `creature` SET `spawndist` = '6' , `MovementType` = '1' WHERE `id` = '42221'; 
UPDATE `creature` SET `spawndist` = '6' , `MovementType` = '1' WHERE `id` = '42222';
UPDATE `creature` SET `spawndist` = '6' , `MovementType` = '1' WHERE `id` = '43325';
UPDATE `creature_template` SET `minlevel` = '20' , `maxlevel` = '20' , `faction` = '875' , `npcflag` = '3' , `BaseAttackTime` = '2000' , `RangeAttackTime` = '2000' , `unit_flags` = '33536' , `unit_flags2` = '2048' WHERE `entry` = '103614';
UPDATE `creature_template` SET `minlevel` = '20' , `maxlevel` = '20' , `faction` = '875' WHERE `entry` = '103617';
DELETE FROM `creature_queststarter` WHERE `id`=46268 AND `quest`=27671;
DELETE FROM `creature_queststarter` WHERE `id`=42645 AND `quest`=26284; 
DELETE FROM `quest_template_addon` WHERE `ID`=28167 AND `PrevQuestID`=27670;
DELETE FROM `quest_template_addon` WHERE `ID`=28169 AND `PrevQuestID`=27671;
DELETE FROM `quest_template_addon` WHERE `ID`=27674 AND `PrevQuestID`=27635;
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES
('28167', '27670'),
('28169', '27671'),
('27674', '27635');
DELETE FROM `quest_template_addon` WHERE `ID`=26316 AND `PrevQuestID`=26205;
DELETE FROM `quest_template_addon` WHERE `ID`=26339 AND `PrevQuestID`=26333;
DELETE FROM `quest_template_addon` WHERE `ID`=26264 AND `PrevQuestID`=26222;
DELETE FROM `quest_template_addon` WHERE `ID`=26265 AND `PrevQuestID`=26222;
INSERT INTO `quest_template_addon` (`ID`, `PrevQuestID`) VALUES
('26316', '26205'),
('26339', '26333'),
('26264', '26222'),
('26265', '26222');
UPDATE `quest_template_addon` SET `PrevQuestID` = '26316' , `ExclusiveGroup` = '0' WHERE `ID` = '26285';
UPDATE `quest_template_addon` SET `PrevQuestID` = '26316' WHERE `ID` = '26284'; 
UPDATE `quest_template_addon` SET `PrevQuestID` = '26203' WHERE `ID` = '26425';
UPDATE `quest_template_addon` SET `PrevQuestID` = '27674' WHERE `ID` = '26203';
UPDATE `quest_template_addon` SET `PrevQuestID` = '26329' WHERE `ID` = '26333';
UPDATE `quest_template_addon` SET `PrevQuestID` = '28169' WHERE `ID` = '27635';
UPDATE `quest_template_addon` SET `PrevQuestID` = '27674' WHERE `ID` = '26206'; 
UPDATE `quest_template_addon` SET `PrevQuestID` = '26206' WHERE `ID` = '26423'; 
UPDATE `quest_template_addon` SET `PrevQuestID` = '27674' WHERE `ID` = '26199'; 
UPDATE `quest_template_addon` SET `PrevQuestID` = '27674' WHERE `ID` = '26197'; 
UPDATE `quest_template_addon` SET `PrevQuestID` = '27674' WHERE `ID` = '26202'; 
UPDATE `creature_template` SET `unit_flags` = '32768' WHERE `entry` = '42316'; 
UPDATE `creature_template` SET `unit_flags` = '33024' WHERE `entry` = '46447';
UPDATE `creature_template` SET `mingold` = '1' , `maxgold` = '3' WHERE `entry` = '46363';
UPDATE `creature_template` SET `mingold` = '1' , `maxgold` = '5' WHERE `entry` = '42184';
UPDATE `creature_template` SET `mingold` = '1' , `maxgold` = '5' WHERE `entry` = '42221';
UPDATE `creature_template` SET `mingold` = '1' , `maxgold` = '5' WHERE `entry` = '42222';
UPDATE `creature_template` SET `mingold` = '1' , `maxgold` = '5' WHERE `entry` = '43325';
UPDATE `creature_template` SET `lootid` = '42185' , `mingold` = '1' , `maxgold` = '5' WHERE `entry` = '42185';
UPDATE `gameobject_loot_template` SET `MinCount` = '1' , `MaxCount` = '1' WHERE `Entry` = '30020' AND `Item` = '57764';
DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (26204, 26207, 26200, 26198, 26201, 31138);
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES ('1', '26204', 'Deprecated quest: The Arts of a Warrior');
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES ('1', '26207', 'Deprecated quest: The Arts of a Rogue');
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES ('1', '26200', 'Deprecated quest: The Arts of a Priest');
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES ('1', '26198', 'Deprecated quest: The Arts of a Mage');
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES ('1', '26201', 'Deprecated quest: The Power of a Warlock');
INSERT INTO `disables` (`sourceType`, `entry`, `comment`) VALUES ('1', '31138', 'Deprecated quest: The Arts of a Monk');

DELETE FROM `quest_template_addon` WHERE `ID` IN (41217, 31135, 31137, 41218);
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `NextQuestID`) VALUES ('41217', '4', '27674', '41218');
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `PrevQuestID`, `NextQuestID`) VALUES ('31135', '512', '27674', '31137');
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `NextQuestID`) VALUES ('31137', '512', '26208');
INSERT INTO `quest_template_addon` (`ID`, `AllowableClasses`, `NextQuestID`) VALUES('41218','4','26208');

DELETE FROM `creature_queststarter` WHERE `id` = 42396 AND `quest` = 41217;
DELETE FROM `creature_queststarter` WHERE `id` = 103614 AND `quest` = 41218;
DELETE FROM `creature_queststarter` WHERE `id` = 42396 AND `quest` = 31135;
DELETE FROM `creature_queststarter` WHERE `id` = 63238 AND `quest` = 31137;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
('42396', '41217'),
('103614', '41218'),
('42396', '31135'),
('63238', '31137');

DELETE FROM `creature_addon` WHERE `guid` IN (304597, 304826);
INSERT INTO `creature_addon` (`guid`, `bytes1`, `auras`) VALUES ('304597', '7', '29266');
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES ('304826', '3048260');

DELETE FROM `waypoint_data` WHERE `id` = 3048260;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','1','-5570.51','685.956','382.666','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','2','-5570.41','664.255','387.659','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','3','-5563.21','655.185','388.666','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','4','-5535.53','653.993','393.939','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','5','-5526.45','644.176','395.467','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','6','-5516.12','631.608','393.617','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','7','-5527.09','611.291','393.302','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','8','-5544.77','612.167','392.968','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','9','-5536.1','611.829','394.596','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','10','-5525.72','612.591','393.237','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','11','-5517.62','627.621','393.792','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','12','-5518.52','634.559','394.236','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','13','-5529.48','646.778','395.569','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','14','-5541.14','654.568','392.582','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','15','-5562.42','654.617','388.735','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','16','-5570.72','666.53','387.375','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','17','-5570.17','688.493','381.88','0','0','0','0','100','0');
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES('3048260','18','-5559.55','710.666','379.145','0','0','0','0','100','0');

INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','62772','0','68','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','62771','0','10','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','55973','0','0.5','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','55983','0','0.3','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','805','0','0.15','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','4496','0','0.12','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','5571','0','0.11','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','5572','0','0.1','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','828','0','0.1','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42184','7074','0','0.1','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','55973','0','68','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','55983','0','33','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','62772','0','1','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','4496','0','0.16','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','828','0','0.1','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','5572','0','0.08','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','805','0','0.08','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','5571','0','0.06','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42185','62771','0','0.01','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42221','117','0','11','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42221','159','0','7','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42221','828','0','0.16','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42222','117','0','16','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42222','159','0','8','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('42222','2589','0','1','0','1','0','1','2');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','117','0','6','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','159','0','3','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','2589','0','4','0','1','0','1','2');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','2213','0','2','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','2138','0','1','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','1415','0','0.2','0','1','0','1','1');
INSERT IGNORE INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES('43325','3370','0','0.2','0','1','0','1','1');

UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_blackrock_battle_worg' WHERE `entry` = 49871;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_brother_paxton' WHERE `entry` = 951;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_stormwind_infantry' WHERE `entry` = 49869;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_blackrock_spy' WHERE `entry` = 49874;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_goblin_assassin' WHERE `entry` = 50039;

UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=49874;

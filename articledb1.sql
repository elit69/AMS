/*
Navicat PGSQL Data Transfer

Source Server         : postgres
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : articledb
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2015-12-24 14:44:04
*/


-- ----------------------------
-- Sequence structure for tbarticle_id_seq
-- ----------------------------
DROP SEQUENCE "tbarticle_id_seq";
CREATE SEQUENCE "tbarticle_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 596
 CACHE 1;
SELECT setval('"public"."tbarticle_id_seq"', 596, true);

-- ----------------------------
-- Sequence structure for tbrole_id_seq
-- ----------------------------
DROP SEQUENCE "tbrole_id_seq";
CREATE SEQUENCE "tbrole_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."tbrole_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for tbuser_id_seq
-- ----------------------------
DROP SEQUENCE "tbuser_id_seq";
CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 38
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 38, true);

-- ----------------------------
-- Table structure for tbarticle
-- ----------------------------
DROP TABLE IF EXISTS "tbarticle";
CREATE TABLE "tbarticle" (
"id" int8 DEFAULT nextval('tbarticle_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"userid" int4 NOT NULL,
"content" text COLLATE "default",
"publish_date" timestamp(6),
"enable" bool NOT NULL,
"image" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbarticle
-- ----------------------------
BEGIN;
INSERT INTO "tbarticle" VALUES ('1', 'The Pr', '2', 'The Project Gutenberg EBook of War and Peace, by Leo Tolstoy', '2015-11-17 00:00:00', 't', '1ae2d9fc-4b3a-41ad-9787-05444195bf89.jpg');
INSERT INTO "tbarticle" VALUES ('2', 'This e', '3', 'This eBook is for the use of anyone anywhere at no cost and with almost', '2015-11-17 00:00:00', 't', 'a5fe1722-2e01-41b9-b254-c42385b6f147.jpg');
INSERT INTO "tbarticle" VALUES ('3', 'no res', '1', 'no restrictions whatsoever.  You may copy it, give it away or re-use it', '2015-11-17 00:00:00', 't', '38698a60-ba45-4c21-8311-58d7e72fabf7.jpg');
INSERT INTO "tbarticle" VALUES ('4', 'under ', '4', 'under the terms of the Project Gutenberg License included with this', '2015-11-17 00:00:00', 't', '3a0967db-4869-4e5e-a718-dce150793f96.jpg');
INSERT INTO "tbarticle" VALUES ('5', 'eBook ', '1', 'eBook or online at www.gutenberg.org', '2015-11-17 00:00:00', 't', 'e4d96486-32e1-45b4-9155-9f210bfc7754.jpg');
INSERT INTO "tbarticle" VALUES ('6', 'Title:', '4', 'Title: War and Peace', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('7', 'Author', '3', 'Author: Leo Tolstoy', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('8', 'Transl', '5', 'Translators: Louise and Aylmer Maude', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('9', 'Postin', '3', 'Posting Date: January 10, 2009 [EBook #2600]', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('10', 'Last U', '2', 'Last Updated: March 15, 2013', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('11', 'Langua', '2', 'Language: English', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('12', 'Charac', '4', 'Character set encoding: ASCII', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('13', '*** ST', '4', '*** START OF THIS PROJECT GUTENBERG EBOOK WAR AND PEACE ***', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('14', 'An Ano', '2', 'An Anonymous Volunteer, and David Widger', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('15', 'WAR AN', '4', 'WAR AND PEACE', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('16', 'By Leo', '4', 'By Leo Tolstoy/Tolstoi', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('17', 'CONTEN', '5', 'CONTENTS', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('18', 'BOOK O', '3', 'BOOK ONE: 1805', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('19', 'CHAPTE', '6', 'CHAPTER I', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('20', 'CHAPTE', '3', 'CHAPTER II', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('25', 'The Pr', '2', 'The Project Gutenberg EBook of War and Peace, by Leo Tolstoy', '2015-11-17 00:00:00', 't', '765f0154-343e-4ca4-9979-aa9e00a7d03c.jpg');
INSERT INTO "tbarticle" VALUES ('26', 'The Pr', '2', 'The Project Gutenberg EBook of War and Peace, by Leo Tolstoy', '2015-11-17 00:00:00', 't', 'df641531-c24e-4721-863b-ccc4588e3300.jpg');
INSERT INTO "tbarticle" VALUES ('27', 'newwwwPr', '2', 'The Project Gutenberg EBook of War and Peace, by Leo Tolstoy', '2015-11-17 00:00:00', 't', '30563708-5421-41f2-ba00-32db242ba440.jpg');
INSERT INTO "tbarticle" VALUES ('28', 'newwdwwPr', '2', 'The Project Gutenberg EBook of War and Peace, by Leo Tolstoy', '2015-11-17 00:00:00', 't', 'e3328d21-7fb0-41a7-93fc-12cd03fc1d6c.jpg');
INSERT INTO "tbarticle" VALUES ('29', '	Big Brother Is Watc ', '5', '	Big Brother Is Watching You ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('30', '	It was a bright, co ', '1', '	It was a bright, cold day in April and the clocks were striking thirteen. Winston Smith hurried home to Victory Mansions with his head down to escape the terrible wind. A cloud of dust blew inside with him, and the hall smelled of dust and yesterday''s food. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('31', '	At the end of the h ', '5', '	At the end of the hall, a poster covered one wall. It showed an enormous face, more than a metre wide: the face of a handsome man of about forty-five, with a large, black moustache. The man''s eyes seemed to follow Winston as he moved. Below the face were the words BIG BROTHER IS WATCHING YOU. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('32', '	Winston went up the ', '6', '	Winston went up the stairs. He did not even try the lift. It rarely worked and at the moment the electricity was switched off during the day to save money for Hate Week. The flat was on the seventh floor and Winston, who was thirty-nine and had a bad knee, went slowly, resting several times on the way. Winston was a small man and looked even smaller in the blue overalls of the Party. His hair was fair and the skin on his face, which used to be pink, was red and rough from cheap soap, old razor blades and the cold of the winter that had just ended. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('33', '	Inside his flat, a  ', '2', '	Inside his flat, a voice was reading out a list of figures for last year''s production of iron. The voice came from a metal square, a telescreen, in the right-hand wall. Winston turned it down, but there was no way of turning it off completely. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('34', '	He moved to the win ', '4', '	He moved to the window. Outside, the world looked cold. The wind blew dust and bits of paper around in the street and there seemed to be no colour in anything, except in the posters that were everywhere. The face with the black moustache looked down from every corner. There was one on the house opposite. BIG BROTHER IS WATCHING YOU, it said, and the eyes looked into Winston''s. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('35', '	Behind him the voic ', '4', '	Behind him the voice from the telescreen was still talking about iron. There was now even more iron in Oceania than the Ninth Three-Year Plan had demanded. The telescreen had a microphone, so the Thought Police could listen to Winston at any time of the day or night. They could also watch him through the telescreen. Nobody knew how often they actually did that but everybody behaved correctly all the time because the Thought Police might be watching and listening. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('36', '	Winston kept his ba ', '5', '	Winston kept his back to the telescreen. It was safer that way - they couldn''t see your face. He looked out over London, the biggest city in this part of Oceania. The nineteenth-century houses were all falling down. There were holes in the streets where the bombs had fallen. Had it always been like this? He tried to think back to the time when he was a boy, but he could remember nothing. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('37', '	He stared at the Mi ', '3', '	He stared at the Ministry of Truth, where he worked. It was an enormous white building, three hundred metres high. You could see the white roof, high above the houses, even a kilometre away. From Winston''s flat it was just possible to see the three slogans of the Party written in enormous letters on the side of the building: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('38', '	IGNORANCE IS STRENG ', '4', '	IGNORANCE IS STRENGTH ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('39', '	The Ministry of Tru ', '4', '	The Ministry of Truth was called Minitrue in Newspeak, the new language of Oceania. Minitrue, it was said, had more than three thousand rooms above the ground and a similar number below. The people there worked mainly on news and entertainment. High above the surrounding buildings, Winston could also see the Ministry of Peace, where they worked on war. It was called Minipax in Newspeak. And the Ministry of Plenty - Miniplenty - which was responsible for the economy. And he could see the Ministry of Love - Miniluv - which was responsible for law and order. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('40', '	The Ministry of Lov ', '6', '	The Ministry of Love was the really frightening one. There were no windows in it. Nobody could get anywhere near it unless they had business there. There were guards with guns in black uniforms even in the streets half a kilometre away. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('41', '	Winston turned roun ', '1', '	Winston turned round quickly. He smiled. It was a good idea to look happy when you were facing the telescreen. He went to his small kitchen. He had not had lunch in the canteen before he left work, but there was no food there except a piece of dark, hard bread for tomorrow''s breakfast. He poured himself a cup of colourless, oily gin and drank it down like medicine. It burned him inside, but he felt more cheerful afterwards. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('42', '	He went back to the ', '5', '	He went back to the living room and sat down at a small table to the left of the telescreen. It was the only place in the room where the telescreen could not see him. From a drawer in the table he took out a pen and a big diary with beautiful cream paper, which he had bought in an old-fashioned shop in a poor part of the town. Party members like Winston were not allowed to go into ordinary shops, but many of them did. It was the only way to get things like razor blades. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('43', '	Winston opened the  ', '2', '	Winston opened the diary. This was not illegal. Nothing was illegal, as there were no laws now. But if the diary was found they would punish him with death or with twenty-five years in a prison camp. He took the pen in his hand, then stopped. He felt sick. It was a decisive act to start writing. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('44', '	Earlier that mornin ', '2', '	Earlier that morning, a terrible noise from the big telescreen at the Ministry of Truth had called all the workers to the centre of the hall for the Two Minutes Hate. The face of Emmanuel Goldstein, Enemy of the People, filled the telescreen. It was a thin, clever face, with its white hair and small beard, but there was something unpleasant about it. Goldstein began to speak in his sheep-like voice: criticising the Party, making nasty attacks on Big Brother, demanding peace with Eurasia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('45', '	In the past (nobody ', '6', '	In the past (nobody knew exactly when) Goldstein had been almost as important in the Party as Big Brother himself, but then he had worked against the Party. Before he could be punished with death, he had escaped - nobody knew how, exactly. Somewhere he was still alive, and all crimes against the Party came from his teaching. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('46', '	Behind Goldstein''s  ', '1', '	Behind Goldstein''s face on the telescreen were thousands of Eurasian soldiers. Oceania was always at war with either Eurasia or Eastasia. That changed, but the hate for Goldstein never did. The Thought Police found his spies every day. They were called ''the Brotherhood'', people said, although Winston sometimes asked himself if the Brotherhood really existed. Goldstein had also written a book, a terrible book, a book against the Party. It had no title; it was just known as the book. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('47', '	As Goldstein''s face ', '5', '	As Goldstein''s face filled the telescreen and Eurasian soldiers marched behind him, the Hate grew. People jumped up and down, shouting and screaming so they could not hear Goldstein''s voice. Winston was shouting too; it was impossible not to. A girl behind him, with thick, dark hair was screaming ''Pig! Pig!'' at Goldstein, and suddenly she picked up a heavy Newspeak dictionary and threw it at the telescreen. It hit Goldstein on the nose and fell to the floor. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('48', '	Winston had often s ', '1', '	Winston had often seen this girl at the Ministry but he had never spoken to her. He did not know her name, but he knew she worked in the Fiction Department. He had seen her with tools so he guessed she was a mechanic on the story-writing machines. She was a confident-looking girl of about twenty-seven, and she walked quickly. She wore the narrow red belt of the Young People''s League tied tightly round her overalls. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('49', '	Winston had dislike ', '3', '	Winston had disliked her from the first moment he saw her. He disliked nearly all women, especially young and pretty ones. The young women were always most loyal to the Party and were happiest to spy on others. But this girl was especially dangerous, he thought. Once, when he had seen her in the canteen, she had looked at him in a way that filled him with black terror. He even thought she might be working for the Thought Police. As the screaming at Goldstein increased, Winston''s dislike of the girl turned to hate. He hated her because she was young and pretty. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('50', '	Suddenly he noticed ', '4', '	Suddenly he noticed someone else, sitting near the girl, wearing the black overalls of an Inner Party member. O''Brien was a large man with a thick neck and glasses. Although he looked frightening, Winston was interested in him. There was sometimes an intelligence in his face that suggested - perhaps - that he might question the official Party beliefs. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('51', '	Winston had seen O'' ', '3', '	Winston had seen O''Brien about twelve times in almost as many years. Years ago he had dreamed about O''Brien. He was in a dark room and O''Brien had said to him, ''We shall meet in the place where there is no dark.'' Winston did not know what that meant, but he was sure it would happen, one day. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('52', '	The Hate increased. ', '2', '	The Hate increased. The screaming increased. The voice and face of Goldstein became the voice and face of a real sheep. Then the sheep-face became a Eurasian soldier, walking towards them with his gun, so close that some people shut their eyes for a second and moved back in their seats. But at the same moment the soldier became the face of Big Brother, black-haired, moustached, filling the telescreen. Nobody could hear what Big Brother said, but it was enough that he was speaking to them. Then the face of Big Brother disappeared from the telescreen and the Party slogans came up instead: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('53', '	IGNORANCE IS STRENG ', '6', '	IGNORANCE IS STRENGTH ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('54', '	Then everybody star ', '5', '	Then everybody started shouting ''B-B! B-B!'' again and again, slowly, with a long pause between the first B and the second. Of course Winston shouted too – you had to. But there was a second when the look on his face showed what he was thinking. And at that exact moment his eyes met O''Brien''s. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('55', '	O''Brien was pushing ', '3', '	O''Brien was pushing his glasses up his nose. But Winston knew – yes he knew – that O''Brien was thinking the same thing as he was. ''I am with you,'' O''Brien seemed to say to him. ''I hate all this too.'' And then the moment of intelligence was gone and O''Brien''s face looked like everybody else''s. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('56', '	Winston wrote the d ', '6', '	Winston wrote the date in his diary: April 4th 1984. Then he stopped. He did not know definitely that this was 1984. He was thirty-nine, he believed – he had been born in 1944 or 1945. But nobody could be sure of dates, not really. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('57', '	''Who am I writing t ', '2', '	''Who am I writing this diary for?'' he asked himself suddenly. For the future, for the unborn. But if the future was like the present, it would not listen to him. And if it was different, his situation would be meaningless. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('58', '	The telescreen was  ', '3', '	The telescreen was playing marching music. What had he intended to say? Winston stared at the page, then began to write: Freedom is the freedom to say that two and two make four. If you have that, everything else follows... He stopped. Should he go on? If he wrote more or did not write more, the result would be the same. The Thought Police would get him. Even before he wrote anything, his crime was clear. Thoughtcrime, they called it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('59', '	It was always at ni ', '5', '	It was always at night – the rough hand on your shoulder, the lights in your face. People just disappeared, always during the night. And then your name disappeared, your existence was denied and then forgotten. You were, in Newspeak, vaporized. Suddenly he wanted to scream. He started writing, fast: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('60', '	DOWN WITH BIG BROTH ', '3', '	DOWN WITH BIG BROTHER ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('61', '	DOWN WITH BIG BROTH ', '5', '	DOWN WITH BIG BROTHER ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('62', '	DOWN WITH BIG BROTH ', '4', '	DOWN WITH BIG BROTHER ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('63', '	There was a knock o ', '3', '	There was a knock on the door. Already! He sat as quietly as a mouse, hoping that they would go away. But no, there was another knock. He could not delay – that would be the worst thing he could do. His heart was racing but even now his face, from habit, probably showed nothing. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('64', '	He got up and walke ', '3', '	He got up and walked heavily towards the door. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('65', '	As he opened the do ', '5', '	As he opened the door, Winston saw that he had left the diary open on the table. DOWN WITH BIG BROTHER was written in it, in letters you could almost read across the room. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('66', '	But everything was  ', '6', '	But everything was all right. A small, sad-looking woman was standing outside. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('67', '	''Oh, Comrade Smith, ', '5', '	''Oh, Comrade Smith,'' she said, in a dull little voice, ''do you think you could come across and help me with our kitchen sink? The water isn''t running away and...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('68', '	It was Mrs Parsons, ', '4', '	It was Mrs Parsons, his neighbour. She was about thirty but looked much older. Winston followed her into her flat. These repairs happened almost daily. The Victory Mansions flats were old, built in about 1930, and they were falling to pieces. Unless you did the repairs yourself, the Party had to agree to them. It could take two years to get new glass in a window. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('69', '	''Tom isn''t home,'' M ', '2', '	''Tom isn''t home,'' Mrs Parsons explained. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('70', '	The Parsons'' flat w ', '3', '	The Parsons'' flat was bigger than Winston''s and unattractive in a different way. Everything was broken. There were sports clothes and sports equipment all over the floor, and dirty dishes on the table. On the walls were the red flags of the Young People''s League and the Spies and a full-sized poster of Big Brother. There was the usual smell of old food, but also the smell of old sweat. In another room someone was singing with the marching music that was still coming from the telescreen. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('71', '	''It''s the children, ', '4', '	''It''s the children,'' said Mrs Parsons, looking in fear at the door to the other room. ''They haven''t been out today and of course...'' She often stopped without finishing her sentences. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('72', '	In the kitchen, the ', '6', '	In the kitchen, the sink was full of dirty green water. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('73', '	''Of course if Tom w ', '4', '	''Of course if Tom was home...'' Mrs Parsons started. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('74', '	Tom Parsons worked  ', '6', '	Tom Parsons worked with Winston at the Ministry of Truth. He was a fat but active man who was unbelievably stupid and endlessly enthusiastic. He was a follower with no mind of his own - the type that the Party needed even more than they needed the Thought Police. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('75', '	At thirty-five Tom  ', '4', '	At thirty-five Tom Parsons had only just been thrown out of the Young People''s League, although he had wanted to stay. Before that he had continued in the Spies for a year beyond the official age. At the Ministry he had a job which needed no intelligence, but he worked for the Party every evening, organizing walks and other activities. The smell of his sweat filled every room he was in and stayed there after he had gone. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('76', '	Winston repaired th ', '5', '	Winston repaired the sink, taking out the unpleasant knot of hair that was stopping the water running away. He washed his hands and went back to the other room. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('77', '	''Put your hands up! ', '2', '	''Put your hands up!'' shouted a voice. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('78', '	A big, handsome boy ', '4', '	A big, handsome boy of nine was pointing a toy gun at him. His small sister, about two years younger, pointed a piece of wood. Both were dressed in the blue, grey and red uniforms of the Spies. Winston put his hands up. The look of hate on the boy''s face made him feel that it was not quite a game. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('79', '	''You''re a Eurasian  ', '4', '	''You''re a Eurasian spy!'' screamed the boy. ''You''re a thoughtcriminal! I''ll shoot you, I''ll vaporize you!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('80', '	Suddenly they were  ', '6', '	Suddenly they were both running round him, shouting ''Spy! Thoughtcriminal!'' The little girl did everything seconds after her older brother did it. It was frightening, like the games of young, dangerous wild animals that will soon be man-eaters. Winston could see that the boy really wanted to hit or kick him, and was nearly big enough to do so. He was glad that the gun in the boy''s hand was only a toy. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('81', '	''They wanted to see ', '2', '	''They wanted to see the Eurasian prisoners hang. But I''m too busy to take them and Tom''s at...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('82', '	''We want to see the ', '6', '	''We want to see them hang!'' shouted the boy, and then the girl started shouting it too. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('83', '	Some Eurasian priso ', '4', '	Some Eurasian prisoners, guilty of war crimes against Oceania, were going to hang slowly in the park that evening. This happened every month or two and was a popular evening''s entertainment. Children were often taken to see it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('84', '	Winston said goodby ', '1', '	Winston said goodbye to Mrs Parsons and walked towards the door. He heard a loud noise as a bomb fell. About twenty or thirty of them were falling on London each week. Then he felt a terrible pain in the back of his neck. He turned and saw Mrs Parsons trying to take some sharp stones from her son''s hand. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('85', '	''Goldstein!'' scream ', '4', '	''Goldstein!'' screamed the boy. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('86', '	But Winston was mos ', '1', '	But Winston was most shocked by the look of helpless terror on Mrs Parsons'' grey face. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('87', '	The Ministry of Tru ', '3', '	The Ministry of Truth ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('88', '	Winston pulled the  ', '6', '	Winston pulled the speakwrite towards him and put on his glasses. To the right of the speakwrite there was a small hole, to the left a larger one. In the office wall there was a third hole, larger than the other two. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('89', '	Messages came to Wi ', '4', '	Messages came to Winston''s office through the smallest hole. Newspapers came to him through the middle hole. The largest hole was for waste paper; hot air carried that away. These large holes were called ''memory holes'', for some reason. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('90', '	Today four messages ', '2', '	Today four messages had come through the smallest hole, onto his desk. The messages were about changes to the Times newspaper. For example, in Big Brother''s speech in the Times of 17 March, he had said that South India was safe. The Eurasians would attack North Africa. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('91', '	This had not happen ', '3', '	This had not happened. The Eurasians had attacked South India, not North Africa. Winston had to re-write part of Big Brother''s speech so you could read in the Times for 17 March that Big Brother had known about the attack before it happened. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('92', '	When Winston had fi ', '1', '	When Winston had finished, his changes to the Times went with the newspaper down the middle hole. A new edition would soon appear, with his changes. Every copy of the old edition would disappear. Destroyed. The message to Winston with the changes would disappear down the memory hole, to be burned. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('93', '	Every day newspaper ', '3', '	Every day newspapers, magazines, photographs, films, posters and books were all changed. The past was changed. The Party was always right. The Party had always been right. The Records Department, where they destroyed all the old copies of everything, was the largest department in the Ministry of Truth, but there was no truth. The new copies were not true and the old copies had not been true either. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('94', '	For example, the Mi ', '1', '	For example, the Ministry of Plenty had said they would make 145 million pairs of boots last year. Sixty-two million pairs were made. Winston changed 145 million to 57 million. So the Party had made five million more boots last year than they expected to. But it was possible that no boots at all were made last year. And it was possible that nobody knew or cared how many boots were made. You could read in the newspapers that five million extra pairs of boots had been made and you could see that half the people in Oceania had no boots. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('95', '	Winston looked arou ', '2', '	Winston looked around the office. A woman with fair hair spent all day looking for the names of people who had been vaporized. Each of them was, in Newspeak, an unperson. She took their names out of every newspaper, book, letter... Her own husband had been vaporized last year. She took his name out too. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('96', '	People disappeared  ', '6', '	People disappeared from the newspapers when they were vaporized and they could also appear in the newspapers when they did not exist. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('97', '	Winston remembered  ', '4', '	Winston remembered Mr Ogilvy. He had appeared in the newspapers because he had led the sort of life the Party wanted. Ogilvy had joined the Spies at the age of six. At eleven he told the Thought Police that his uncle was a criminal. At seventeen he had been an organizer in the Young People''s League. At nineteen he had invented a new bomb which had killed thirty-one Eurasians when it was first tried. At twenty-three, Ogilvy had died like a hero, fighting the Eurasians. There were photographs of Ogilvy, but there had been no Ogilvy. Not really. The photographs were made at the Ministry of Truth. Ogilvy was part of a past that never happened. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('98', '	Anything could be c ', '5', '	Anything could be changed. A dreamy man with hairy ears called Ampleforth re-wrote old poems until they supported everything the Party believed in. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('99', '	But all this work,  ', '4', '	But all this work, all these changes, were not the main work of the Ministry of Truth. Most workers in the Ministry were busy writing everything that the people of Oceania read or saw: all the newspapers, films, plays, poems, school books, telescreen programmes and songs, the Newspeak dictionaries and children''s spelling books. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('100', '	After his morning''s ', '5', '	After his morning''s work, Winston went to the canteen. It was full, very noisy and smelled of cheap food and the gin that was sold from a hole in the wall. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('101', '	''Ah, I was looking  ', '3', '	''Ah, I was looking for you,'' said a voice behind Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('102', '	It was Syme, his fr ', '6', '	It was Syme, his friend from the Dictionary Department. Perhaps ''friend'' was not exactly the right word. You did not have friends these days, you had comrades. But some comrades were more interesting than others. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('103', '	Syme was working on ', '1', '	Syme was working on the eleventh edition of the Newspeak Dictionary. He was a small man, even smaller than Winston, with dark hair and large eyes. These eyes were sad but they seemed to laugh at you and to search your face closely when he talked to you. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('104', '	''Have you got any r ', '5', '	''Have you got any razor blades?'' asked Syme. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('105', '	''None,'' said Winsto ', '4', '	''None,'' said Winston quickly, perhaps too quickly. ''I''ve looked for them everywhere.'' Everyone was asking for razor blades. There had been none in the Party shops for months. There was always something which the Party could not make enough of. Sometimes it was buttons, sometimes it was wool; now it was razor blades. ''I''ve been using the same blade for six weeks,'' he lied. He actually had two new ones at home. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('106', '	The people waiting  ', '6', '	The people waiting for food and gin moved forward, slowly. Winston and Syme took dirty plates from the pile. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('107', '	''Did you go to the  ', '6', '	''Did you go to the park yesterday?'' asked Syme. ''All the Eurasian prisoners were hanged.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('108', '	''I was working,'' sa ', '5', '	''I was working,'' said Winston. ''I''ll see it at the cinema.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('109', '	''That''s not as good ', '3', '	''That''s not as good,'' said Syme. His eyes looked hard at Winston''s face. ''I know you,'' they seemed to say. ''I know why you didn''t go to see the prisoners die.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('110', '	Syme was an enthusi ', '2', '	Syme was an enthusiastic supporter of the Party''s decisions about war, prisoners, thoughtcrime, the deaths in the underground rooms below the Ministry of Love. Winston always tried to move conversation with him away from all that. Syme knew a lot about Newspeak and when he talked about language he was interesting. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('111', '	''The prisoners kick ', '3', '	''The prisoners kicked when they were hanged,'' said Syme. ''I always like that. It spoils it when their legs are tied together. And one of them had his tongue hanging right out of his mouth. It was quite a bright blue. I like that kind of detail.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('112', '	''Next, please,'' cal ', '6', '	''Next, please,'' called the prole who was giving out the food, and Winston and Syme gave her their plates. She put some grey meat on each one. There was also some bread, a small piece of cheese and a cup of sugarless black coffee. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('113', '	''There''s a table th ', '3', '	''There''s a table there, under that telescreen,'' said Syme. ''Let''s get a gin and sit there.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('114', '	The gin was poured  ', '2', '	The gin was poured for them into big cups and they walked through the crowded canteen to a metal table. There were some pieces of meat on the table from the last person''s meal. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('115', '	They ate in silence ', '3', '	They ate in silence. Winston drank down his gin, which brought tears to his eyes. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('116', '	''How''s the Dictiona ', '3', '	''How''s the Dictionary?'' he said, speaking loudly because of the noise. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('117', '	''I''m on the adjecti ', '6', '	''I''m on the adjectives,'' said Syme. ''It''s wonderful work.'' His eyes shone. He pushed his plate away, took his bread in one pale hand and his cheese in the other, and put his mouth near Winston''s ear so he did not have to shout. ''The eleventh edition is the final one,'' he said. ''We''re building a new language. When we''ve finished, people like you will have to learn to speak again. You think the main job is inventing new words, don''t you? Wrong! We''re destroying words - lots of them, hundreds of them, every day. We''re only leaving the really necessary ones, and they''ll stay in use for a long time.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('118', '	He ate his bread hu ', '1', '	He ate his bread hungrily. His thin, dark face had come alive and his eyes were shining like the eyes of a man in love. ''It''s a beautiful thing to destroy words,'' he said. ''For example, a word like "good". If you have "good" in the language, you don''t need "bad". You can say "ungood".'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('119', '	Winston smiled. It  ', '4', '	Winston smiled. It was safer not to say anything. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('120', '	Syme continued. ''Do ', '3', '	Syme continued. ''Do you understand? The aim of Newspeak is to narrow thought. In the end we will make thoughtcrime impossible, because people won''t have the words to think the crime. By the year 2050 there will be nobody alive who could even understand this conversation.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('121', '	''Except . . .''Winst ', '6', '	''Except . . .''Winston began and then stopped. He wanted to say, ''Except the proles''. But he was not sure if the Party would accept the thought. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('122', '	Syme had guessed wh ', '6', '	Syme had guessed what he was going to say. ''The proles are not really people,'' he said. ''By 2050 – earlier, probably – you won''t need a slogan like "freedom is slavery". The word "freedom" won''t exist, so the whole idea of freedom won''t exist either. The good Party member won''t have ideas. If you''re a good Party member, you won''t need to think.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('123', '	One of these days,  ', '5', '	One of these days, thought Winston, Syme will be vaporized. He is too intelligent. He sees too clearly and speaks too openly. He goes to the Chestnut Tree Cafe, where the painters and musicians go and where Goldstein himself used to go. The Party does not like people like that. One day he will disappear. It is written in his face. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('124', '	Syme looked up. ''He ', '2', '	Syme looked up. ''Here comes Parsons,'' he said. You could hear his opinion of Parsons in his voice. He thought Parsons was a fool. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('125', '	Winston''s neighbour ', '6', '	Winston''s neighbour from Victory Mansions was coming towards them. He was a fat, middle-sized man with fair hair and an ugly face. He looked like a little boy in a man''s clothes. Winston imagined him wearing not his blue Party overalls but the uniform of the Spies. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('126', '	Parsons shouted ''He ', '6', '	Parsons shouted ''Hello, hello'' happily and sat down at the table. He smelled of sweat. Syme took a piece of paper from his pocket with a list of words on it and studied the words with an ink-pencil between his fingers. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('127', '	''Look at him, worki ', '4', '	''Look at him, working in the lunch hour!'' said Parsons. ''What have you got there, old boy? Something a bit too clever for me, I expect. Smith, old boy, I''ll tell you why I''m chasing you. It''s the money you forgot to give me.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('128', '	''What money?'' said  ', '6', '	''What money?'' said Winston, feeling for money in his pocket. About a quarter of your earnings were paid back to the Party in different ways. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('129', '	''The money for Hate ', '5', '	''The money for Hate Week. You know I collect the money for Victory Mansions, and we''re going to have the best flags around. Two dollars you promised me.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('130', '	Winston found two d ', '5', '	Winston found two dirty dollar notes and gave them to Parsons. Parsons wrote ''Two dollars'' very carefully in small clear letters next to Winston''s name in a little notebook. It was clear that he rarely read or wrote. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('131', '	''Oh, Smith, old boy ', '6', '	''Oh, Smith, old boy,'' he said. ''I hear that son of mine threw stones at you yesterday. I talked to him about it. He won''t do it again, believe me.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('132', '	''I think he was ang ', '5', '	''I think he was angry because he couldn''t see the Eurasian prisoners hang,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('133', '	''Yes! Well, that sh ', '1', '	''Yes! Well, that shows what good children they are, doesn''t it? Both of them. They only think about the Spies - and the war, of course. Do you know what my girl did last week? She was on a walk in the country with the Spies and she saw a strange man. She and two other girls followed him and then told the police about him.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('134', '	''What did they do t ', '5', '	''What did they do that for?'' Winston asked, shocked. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('135', '	''They thought he wa ', '1', '	''They thought he was a Eurasian spy,'' said Parsons. ''They noticed his shoes were different,'' he added proudly. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('136', '	Winston looked at t ', '1', '	Winston looked at the dirty canteen, looked at all the ugly people in their ugly overalls, ate the terrible food and listened to the telescreen. A voice from the Ministry of Plenty was saying that they were all going to get more chocolate - twenty grammes a week. Was he the only one who remembered that last week they got thirty grammes? They were getting less chocolate, not more. But Parsons would not remember. And even a clever man like Syme found a way to believe it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('137', '	Winston came out of ', '1', '	Winston came out of his sad dream. The girl with dark hair, who he remembered from the Two Minutes Hate, was at the next table. She was looking at him, but when he looked back at her she looked away again. Winston was suddenly afraid. Why was she watching him? Was she following him? Perhaps she was not in the Thought Police, but Party members could be even more dangerous as spies. How had he looked when the telescreen voice told them about the chocolate? It was dangerous to look disbelieving. There was even a word for it in Newspeak: facecrime, it was called. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('138', '	The girl had turned ', '3', '	The girl had turned her back to him again. At that moment the telescreen told them all to return to work and the three men jumped to their feet. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('139', '	Winston sat at the  ', '1', '	Winston sat at the table and opened his diary. He thought of his parents. He was, he thought, about ten or eleven years old when his mother disappeared. She was a tall, silent woman with lovely fair hair. He could not remember his father so well. He was dark and thin and always wore dark clothes. They had both been vaporized in the 1950s. His thoughts moved to other women and he started writing in the diary: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('140', '	It was three years  ', '6', '	It was three years ago. It was on a dark evening, in a narrow side-street near one of the big railway stations. She had a young face with thick make-up. I liked the make-up. The whiteness and the bright red lips. No woman in the Party wore make-up. There was nobody else in the street and no telescreens. She said two dollars. I... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('141', '	It was too difficul ', '3', '	It was too difficult to continue. Winston wanted to hit his head against the wall, to kick the table over and throw the diary through the window – anything to stop the memory of that night. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('142', '	It was, of course,  ', '4', '	It was, of course, illegal to pay a woman for sex. But the punishment was about five years in a work camp, not death. The Party knew it happened. Some prole women sold themselves for a bottle of gin and the Party didn''t worry much about that. The Party wanted to stop love and pleasure in sex, not sex itself. A request to marry would be refused if a man and a woman found each other attractive. Sex, to the Party, was only necessary to make children. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('143', '	He thought of Kathe ', '1', '	He thought of Katherine, his wife. Winston had been married. He was probably still married; if his wife was dead, nobody had told him. They had lived together for about fifteen months, nine, ten, eleven years ago. Katherine was a tall, fair-haired girl who moved well. She had an interesting face, until you found out that there was almost nothing behind it. She believed everything the Party said. She had sex only because it was her duty to try and have children. When no children came, they agreed to separate. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('144', '	Every two or three  ', '6', '	Every two or three years since then, Winston had found a prole woman who had agreed to have sex for money. But he wanted his own woman. He finished the story in his diary: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('145', '	When I saw her in t ', '3', '	When I saw her in the light she was quite an old woman. She had no teeth at all. But I had sex with her. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('146', '	He had written it d ', '1', '	He had written it down at last, but it did not help. He still wanted to shout and scream. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('147', '	He had walked sever ', '3', '	He had walked several kilometres. It was the second time in three weeks that he had missed an evening at the Party Members'' Club. This was not a good idea; your attendance at the Club was carefully checked. A Party member had no free time and was never alone except in bed. It was dangerous to do anything alone, even go for a walk. There was a word for it in Newspeak: ownlife, it was called, meaning separation from everybody else. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('148', '	He was walking in a ', '3', '	He was walking in a prole area near a building that had, in the past, been an important railway station. The houses were small and dirty and reminded him of rat-holes. There were hundreds of people in the streets: pretty young girls, young men chasing the girls, fat old women – the pretty girls in ten years time. Dirty children with no shoes ran through the mud. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('149', '	The people looked a ', '4', '	The people looked at him strangely. The blue overalls of the Party were an unusual sight in a street like this. It was unwise to be seen in such places, unless you had a definite reason to be there. The Thought Police would stop you if they saw you. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('150', '	Suddenly everybody  ', '5', '	Suddenly everybody was shouting and screaming and running back into their rat-hole houses. A man in a black suit ran past Winston and pointed at the sky. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('151', '	''Bomb,'' he shouted. ', '6', '	''Bomb,'' he shouted. ''Up there! Bomb!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('152', '	Winston threw himse ', '3', '	Winston threw himself to the ground. The proles were usually right when they warned you that a bomb was falling. When he stood up, he was covered with bits of glass from the nearest window. He continued walking. The bomb had destroyed a group of houses two hundred metres up the street and in front of him he saw a human hand, cut off at the wrist. He kicked it to the side of the road and turned right, away from the crowd. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('153', '	He was in a narrow  ', '1', '	He was in a narrow street with a few dark little shops among the houses. He seemed to know the place. Of course! He was standing outside the shop where he had bought the diary. He was afraid, suddenly. He had been mad to buy the diary, and he had promised himself he would never come near this place again. But he noticed that the shop was still open, although it was nearly twenty-one hours. He would be safer inside than standing there doing nothing outside, so he went in. If anyone asked, he could say he was trying to buy a razor blade. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('154', '	The owner had just  ', '3', '	The owner had just lit a hanging oil lamp which smelled unclean but friendly. He was a small, gentle-looking man of about sixty with a long nose and thick glasses. His hair was almost white but the rest of his face looked surprisingly young. He looked like a writer, or perhaps a musician. His voice was soft and he didn''t speak like a prole. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('155', '	''I recognized you w ', '1', '	''I recognized you when you were outside,'' he said immediately. ''You''re the gentleman who bought the diary. There''s beautiful paper in that diary. No paper like that has been made for – oh, I''d say fifty years.'' He looked at Winston over the top of his glasses. ''Is there anything special I can do for you? Or did you just want to look round?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('156', '	''I was... er... pas ', '2', '	''I was... er... passing,'' said Winston. ''And I just came in. I don''t want to buy anything.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('157', '	''Well, that''s all r ', '1', '	''Well, that''s all right,'' said the shop owner, ''because I haven''t got much to sell you.'' He looked round the shop sadly. ''Don''t tell anyone I said so, but it''s difficult to get old things these days. And when you can get them nobody wants them.'' The old man''s shop was full of things, but they were all cheap and dirty and useless. ''There''s another room upstairs that you could look at,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('158', '	Winston followed th ', '3', '	Winston followed the man upstairs. The room was a bedroom with furniture in it. There was a bed under the window, taking nearly a quarter of the room. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('159', '	''We lived here for  ', '2', '	''We lived here for thirty years until my wife died,'' said the old man sadly. ''I''m selling the furniture, slowly. That''s a beautiful bed, but perhaps it would be too big for you?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('160', '	Winston thought he  ', '2', '	Winston thought he could probably rent the room for a few dollars a week, if he dared to. It would be so peaceful to live as people used to live in the past, with no voice talking to you, nobody watching you... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('161', '	''There''s no telescr ', '4', '	''There''s no telescreen'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('162', '	''Ah!'' said the old  ', '1', '	''Ah!'' said the old man. ''I never had one. Too expensive.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('163', '	There was a picture ', '4', '	There was a picture on the wall. It showed a London church that used to be famous, in the days when churches were famous and people still went to them. Winston did not buy the picture, but he stayed in the room talking to the old man whose name, he discovered, was Charrington. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('164', '	Even when he left h ', '2', '	Even when he left he was still thinking about renting the room. But then, as he stepped into the street, his heart turned to ice. A woman in blue overalls was walking towards him, not ten metres away. It was the girl with dark hair, the one in the Young People''s League. The girl must be following him. Even if she was not in the Thought Police, she must be a spy. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('165', '	The Thought Police  ', '3', '	The Thought Police would come for him one night. They always came at night and they always caught you. And before they killed you, before you asked them on your knees to forgive you for your thoughtcrime, there would be a lot of pain. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('166', '	Four days later he  ', '4', '	Four days later he saw the girl with dark hair again. He was walking to the toilets at the Ministry of Truth and she was coming towards him. She had hurt her hand. She had probably hurt it on one of the story-writing machines - it was a common accident in that department. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('167', '	The girl was about  ', '6', '	The girl was about four metres away when she fell forwards. As she fell, she hit her hand again and cried out in pain. Winston stopped. The girl got to her knees. Her face had turned a milky yellow colour, making her mouth look redder than ever. She looked at him and her face seemed to show more fear than pain. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('168', '	Winston felt a stra ', '1', '	Winston felt a strange mix of emotions. In front of him was an enemy who was trying to kill him: in front of him, also, was a human being, in pain and perhaps with a broken bone. Already he had started to help her. He felt that her pain was in some strange way his own. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('169', '	''You''re hurt?'' he s ', '6', '	''You''re hurt?'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('170', '	''It''s nothing. My a ', '3', '	''It''s nothing. My arm. It''ll be all right in a second.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('171', '	''It''s nothing,'' she ', '3', '	''It''s nothing,'' she repeated. ''Thanks, Comrade.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('172', '	She walked away qui ', '5', '	She walked away quickly. Winston was standing in front of a telescreen, so he did not show any surprise on his face, although it was difficult not to. As he had helped her up, she had put something in his hand. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('173', '	It was a piece of p ', '4', '	It was a piece of paper. He opened it carefully in his hand in the toilet, but did not try to read it. You could be certain the telescreens would be watching in the toilets. Back in his office, he put the piece of paper down on his desk among the other papers. A few minutes later he pulled it towards him, with the next job he had to do. On it, in large letters, was written: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('174', '	For the rest of the ', '5', '	For the rest of the morning it was very difficult to work. At lunchtime in the canteen the fool Parsons, still smelling of sweat, did not stop talking to him about all the work he was doing for Hate Week. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('175', '	He saw the girl at  ', '1', '	He saw the girl at the other end of the canteen, at a table with two other girls, but she did not look in his direction. In the afternoon he looked at the words I love you again and life seemed better. He believed her. He did not think she was in the Thought Police, not now. He wanted to see her again. How? How could he arrange a meeting? ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('176', '	It was a week befor ', '4', '	It was a week before he saw her again, in the canteen. He sat at her table and at that moment saw Ampleforth, the dreamy man with hairy ears who re-wrote poems. Ampleforth was walking around with his lunch, looking for a place to sit down. He would certainly sit with Winston if he saw him. Winston had about a minute to arrange something with the girl. He started to eat the watery soup they had been given for lunch. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('177', '	''What time do you l ', '4', '	''What time do you leave work?'' he said to the girl. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('178', '	''Where can we meet? ', '5', '	''Where can we meet?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('179', '	''Victory Square, ne ', '3', '	''Victory Square, near the picture of Big Brother.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('180', '	''It''s full of teles ', '5', '	''It''s full of telescreens.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('181', '	''It doesn''t matter  ', '4', '	''It doesn''t matter if there''s a crowd. But don''t come near me until you see me among a lot of people. And don''t look at me. Just follow me.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('182', '	Ampleforth did not  ', '4', '	Ampleforth did not see Winston and sat down at another table. Winston and the girl did not speak again and they did not look at each another. The girl finished her lunch quickly and left, while Winston stayed to smoke a cigarette. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('183', '	He arrived at Victo ', '6', '	He arrived at Victory Square early. Big Brother''s picture looked up at the skies where he had beaten the Eurasian aeroplanes (or Eastasian aeroplanes - it had been a few years ago) in the Great Air War. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('184', '	Five minutes after  ', '1', '	Five minutes after the time they had arranged, Winston saw the girl near Big Brother''s picture, but it was not safe to move closer to her yet; there were not enough people around. But suddenly some Eurasian prisoners were brought out and everyone started running across the park. Winston ran too, next to the girl, lost in the crowd. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('185', '	''Can you hear me?''  ', '2', '	''Can you hear me?'' she said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('186', '	''Are you working th ', '6', '	''Are you working this Sunday afternoon?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('187', '	''Then listen carefu ', '1', '	''Then listen carefully. Go ...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('188', '	Like a general in t ', '4', '	Like a general in the army she told him exactly where to go. A half-hour railway journey; turn left outside the station; two kilometres along the road; a gate; a path across a field. She seemed to have a map inside her head. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('189', '	''Can you remember a ', '2', '	''Can you remember all that?'' she said, finally. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('190', '	''About fifteen hour ', '5', '	''About fifteen hours. You may have to wait. I''ll get there by another way.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('191', '	She moved away from ', '1', '	She moved away from him. But at the last moment, while the crowd was still around them, her hand touched his - though they did not dare look at each other. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('192', '	Winston opened the  ', '4', '	Winston opened the gate and walked along the path across the field. The air was soft and the birds sang. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('193', '	You were not safer  ', '5', '	You were not safer in the country than in London. There were no telescreens of course, but there were microphones and the Thought Police often waited at railway stations. But the girl was clearly experienced, which made him feel braver. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('194', '	He had no watch but ', '4', '	He had no watch but it could not be fifteen hours yet, so he started to pick flowers. A hand fell lightly on his shoulder. He looked up. It was the girl, shaking her head as a warning to stay silent. She walked ahead of him and it was clear to Winston that she had been this way before. He followed, carrying his flowers, feeling that he was not good enough for her. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('195', '	They were in an ope ', '4', '	They were in an open space of grass between tall trees when the girl stopped and turned. ''Here we are,'' she said. He stood quite close to her but did not dare move nearer. ''I didn''t want to say anything on the path because there might be microphones there. But we''re all right here.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('196', '	He still was not br ', '5', '	He still was not brave enough to go near her. ''We''re all right here?'' he repeated stupidly. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('197', '	''Yes, look at the t ', '1', '	''Yes, look at the trees.'' They were small and thin. ''There''s nothing big enough to hide a microphone in. And I''ve been here before.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('198', '	He had managed to m ', '2', '	He had managed to move closer to her now. She stood in front of him with a smile on her face. His flowers had fallen to the ground. He took her hand. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('199', '	''Until now I didn''t ', '5', '	''Until now I didn''t even know what colour your eyes were,'' he said. They were brown, light brown. ''And now you''ve seen what I''m really like, can you even look at me?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('200', '	''I''m thirty-nine ye ', '1', '	''I''m thirty-nine years old. I''ve got a wife that I can''t get rid of. I''ve got a bad knee. I''ve got five false teeth.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('201', '	''I don''t care,'' sai ', '4', '	''I don''t care,'' said the girl. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('202', '	The next moment she ', '2', '	The next moment she was in his arms on the grass. But the truth was that although he felt proud, he also felt disbelief. He had no physical desire; it was too soon. Her beauty frightened him. Perhaps he was just used to living without women... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('203', '	The girl sat up and ', '4', '	The girl sat up and pulled a flower out of her hair. ''Don''t worry, dear. There''s no hurry. Isn''t this a wonderful place? I found it when I got lost once on a walk in the country with the Young People''s League. If anyone was coming, you could hear them a hundred metres away.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('204', '	''What''s your name?'' ', '4', '	''What''s your name?'' asked Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('205', '	''Julia. I know your ', '5', '	''Julia. I know yours. It''s Winston - Winston Smith. Tell me, dear, what did you think of me before I gave you the note?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('206', '	He did not even thi ', '5', '	He did not even think of lying to her. It was like an offer of love to tell her the truth. ''I hated the sight of you,'' he said. ''If you really want to know, I thought you were in the Thought Police.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('207', '	The girl laughed, c ', '1', '	The girl laughed, clearly pleased that she had hidden her true feelings so well. She pulled out some chocolate from the pocket of her overalls, broke it in half and gave one of the pieces to Winston. It was very good chocolate. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('208', '	''Where did you get  ', '5', '	''Where did you get it?'' he asked. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('209', '	''Oh, there are plac ', '5', '	''Oh, there are places,'' she said. ''It''s easier if you seem to be a good Party member like me. I''m good at games. I was a Group Leader in the Spies. I work three evenings a week for the Young People''s League. I spend hours and hours putting up posters all over London. I do anything they want and I always look happy about it. It''s the only way to be safe.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('210', '	The taste of the ex ', '1', '	The taste of the excellent chocolate was still in Winston''s mouth. ''You are very young,'' he said. ''You''re ten or fifteen years younger than I am. What did you find attractive in a man like me?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('211', '	''It was something i ', '1', '	''It was something in your face. I thought I''d take a chance. I''m good at finding people who don''t belong. When I first saw you I knew you were against them! ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('212', '	When Julia said the ', '6', '	When Julia said them she meant the Party, especially the Inner Party. She spoke about them with real hate, using bad words. Winston did not dislike that. It was part of her personal war against the Party. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('213', '	He kissed her softl ', '1', '	He kissed her softly and took her hands in his. ''Have you done this before?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('214', '	''Of course. Hundred ', '4', '	''Of course. Hundreds of times - well, a lot of times.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('215', '	''With Party members ', '1', '	''With Party members?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('216', '	''With members of th ', '6', '	''With members of the Inner Party?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('217', '	''Not with those pig ', '6', '	''Not with those pigs, no. But there are plenty that would if they got the chance. They''re not as pure as they pretend to be.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('218', '	His heart raced. He ', '5', '	His heart raced. He hoped that the Party was weakened by a lie. ''Listen. The more men you''ve had, the more I love you. Do you understand that?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('219', '	''You like doing thi ', '1', '	''You like doing this? I don''t mean just me. I mean the thing itself?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('220', '	That was what he wa ', '5', '	That was what he wanted to hear. The need for sex, not the love of one person, would finish the Party. He pressed her down on the grass. This time there was no difficulty. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('221', '	Afterwards they fel ', '6', '	Afterwards they fell asleep and slept for about half an hour. Their love, their sex together, had beaten the Party. It was a political act. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('222', '	They Can''t Get Insi ', '6', '	They Can''t Get Inside You ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('223', '	Winston looked roun ', '2', '	Winston looked round the little room above Mr Charrington''s shop. As he had thought, Mr Charrington had been happy to rent it to him. He did not even mind that Winston wanted the room to meet his lover. Everyone, he had said, wanted a place where they could be alone and private occasionally. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('224', '	They had taken the  ', '1', '	They had taken the room because during the month of May they had made love only one more time. (''It''s safe to meet anywhere twice,'' Julia had said). Then they had had to see each other in the street, in a different place every evening and never for more than half an hour at a time. The idea of having their own hiding place, indoors and near home, had been exciting for both of them. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('225', '	They were fools, Wi ', '2', '	They were fools, Winston thought again. It was impossible to come here for more than a few weeks without being caught. But he needed her and he felt he deserved her. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('226', '	Julia was twenty-si ', '3', '	Julia was twenty-six years old. She lived in a Party building with thirty other girls (''Always the smell of women! I hate women!'' she said) and she worked, as he had guessed, on the story-writing machines. She enjoyed her job, looking after a powerful electric motor. She was ''not clever'' and ''did not much enjoy reading'' but she liked machinery. Life, as she saw it, was quite simple. You wanted a good time, they (meaning the Party) wanted to stop you having it, so you broke the rules as well as you could. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('227', '	At that moment he h ', '1', '	At that moment he heard her on the stairs outside and then she ran into the room. She was carrying a bag. She went down on her knees, took packets of food from the bag and put them on the floor. She had real sugar, real bread, real jam. All the good food that nobody had seen for years. And then... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('228', '	''This is the one I'' ', '3', '	''This is the one I''m really proud of. I had to put paper round it because...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('229', '	But she did not hav ', '4', '	But she did not have to tell him why she had paper round it. The smell was already filling the room. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('230', '	''It''s coffee,'' he s ', '6', '	''It''s coffee,'' he said softly. ''Real coffee.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('231', '	''It''s Inner Party c ', '5', '	''It''s Inner Party coffee. There''s a whole kilo here,'' she said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('232', '	''How did you get it ', '3', '	''How did you get it?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('233', '	''There''s nothing th ', '5', '	''There''s nothing those Inner Party pigs don''t have. But of course waiters and servants steal things, and - look, I got a little packet of tea as well.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('234', '	Winston opened the  ', '4', '	Winston opened the packet. ''It''s real tea, not fruit leaves.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('235', '	''Yes,'' she said. ''B ', '4', '	''Yes,'' she said. ''But listen, dear. I want you to turn your back on me for three minutes. Go and sit on the other side of the bed. And don''t turn round until I tell you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('236', '	Winston looked out  ', '4', '	Winston looked out of the window. He listened to a woman singing outside with deep feeling. Winston thought she would be quite happy if that June evening never ended. He had never heard a member of the Party sing like that. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('237', '	''You can turn round ', '4', '	''You can turn round now'' said Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('238', '	He turned round and ', '5', '	He turned round and for a second almost did not recognize her. He thought she had taken her clothes off. But the change in her was more surprising than that. She had painted her face. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('239', '	He thought the make ', '1', '	He thought the make-up must be from a shop in the prole area. Her lips were red, her face was smooth; there was even something under her eyes to make them brighter. It was not well done, but Winston did not know that. He had never before seen a woman in the Party with make-up on. Julia looked prettier and much more like a woman. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('240', '	He took her in his  ', '1', '	He took her in his arms. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('241', '	''Do you know what I ', '3', '	''Do you know what I''m going to do next?'' she said. ''I''m going to get a real woman''s dress from somewhere and wear it instead of these horrible overalls. In this room I''m going to be a woman, not a Party comrade.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('242', '	After they made lov ', '5', '	After they made love they fell asleep, and when Winston woke up the hands on the clock showed nearly nine - twenty-one hours. He did not move because Julia was sleeping with her head on his arm. Most of her make-up was on the pillow or on him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('243', '	They had never talk ', '5', '	They had never talked about marriage; it was impossible, even if Katherine died. Winston had told Julia about Katherine. She was goodthinkful, in Newspeak, unable to think a bad thought. She did not like sex. It was just... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('244', '	''Our duty to the Pa ', '6', '	''Our duty to the Party.'' Julia had said it for him. Just to have children. Children who would one day spy on their parents and tell the Party if they said or did anything wrong. In this way the family had become part of the Thought Police. Katherine had not told the Thought Police about Winston only because she was too stupid to understand his opinions. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('245', '	Winston had thought ', '3', '	Winston had thought about killing Katherine and once nearly did. But now he and Julia were dead. When you disobeyed the Party you were dead. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('246', '	Julia woke up and p ', '4', '	Julia woke up and put her hands over her eyes. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('247', '	''We are the dead,''  ', '6', '	''We are the dead,'' Winston said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('248', '	''We''re not dead yet ', '2', '	''We''re not dead yet,'' said Julia, pressing her body against his. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('249', '	''We may be together ', '1', '	''We may be together for another six months - a year. When they find us there will be nothing either of us can do for the other.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('250', '	''We will tell them  ', '5', '	''We will tell them everything,'' she said. ''Everybody always does. They make you feel so much pain.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('251', '	''Even if we tell th ', '4', '	''Even if we tell them everything, that''s not a betrayal. The betrayal would only be if they made me stop loving you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('252', '	She thought about t ', '2', '	She thought about that. ''They can''t do that,'' she said finally. ''It''s the one thing they can''t do. They can make you say anything – anything – but they can''t make you believe it. They can''t get inside you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('253', '	''No,'' he said, a li ', '6', '	''No,'' he said, a little more hopefully. ''No, that''s quite true. They can''t get inside you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('254', '	''I''ll get up and ma ', '3', '	''I''ll get up and make some coffee,'' she said. We''ve got an hour. What time do they turn the lights off at your flats?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('255', '	''Twenty-three thirt ', '1', '	''Twenty-three thirty.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('256', '	''It''s twenty-three  ', '2', '	''It''s twenty-three hours at the Party building. But you have to get in earlier than that because...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('257', '	She suddenly reache ', '2', '	She suddenly reached down from the bed to the floor, picked up a shoe and threw it hard into the corner of the room. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('258', '	''What was it?'' he s ', '5', '	''What was it?'' he said in surprise. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('259', '	''A rat. I saw his h ', '5', '	''A rat. I saw his horrible little nose. There''s a hole down there. I frightened him, I think.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('260', '	''Rats!'' said Winsto ', '2', '	''Rats!'' said Winston quietly. ''In this room!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('261', '	''They''re everywhere ', '2', '	''They''re everywhere,'' said Julia, without much interest, as she lay down again. ''We''ve even got them in the kitchen at the Party building. Did you know they attack children? In some parts of London a woman daren''t leave a baby alone for two minutes. The big brown ones are the worst. They...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('262', '	''Stop! Stop!'' said  ', '1', '	''Stop! Stop!'' said Winston, his eyes tightly shut. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('263', '	''Dearest! You''ve go ', '2', '	''Dearest! You''ve gone quite pale. What''s the matter?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('264', '	''They are the most  ', '6', '	''They are the most horrible things in the world - rats!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('265', '	She put her arms ro ', '1', '	She put her arms round him but he did not re-open his eyes immediately. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('266', '	''I''m sorry,'' he sai ', '4', '	''I''m sorry,'' he said. ''It''s nothing. I don''t like rats, that''s all.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('267', '	''Don''t worry, dear. ', '2', '	''Don''t worry, dear. We won''t have the dirty animals in here. I''ll put something over the hole before we go.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('268', '	Julia got out of be ', '6', '	Julia got out of bed, put on her overalls and made the coffee. The smell was so powerful and exciting that they shut the window, worried that somebody outside would notice it and ask questions. And they could taste the real sugar in the coffee – it was even better than the taste of the coffee itself. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('269', '	Julia walked round  ', '5', '	Julia walked round the room with one hand in her pocket and a piece of bread and jam in the other. She looked at the books without interest. She told Winston the best way to repair the table. She sat down in the old armchair to see if it was comfortable. She smiled at the old twelve-hour clock. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('270', '	''How old is that pi ', '2', '	''How old is that picture over there, do you think?'' she asked. ''A hundred years old?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('271', '	''More. Two hundred. ', '6', '	''More. Two hundred. But it''s impossible to discover the age of anything these days.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('272', '	She looked at it. '' ', '2', '	She looked at it. ''What is this place?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('273', '	''It''s a church. Wel ', '4', '	''It''s a church. Well, that''s what it used to be.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('274', '	When Winston got ou ', '2', '	When Winston got out of bed it was dark. The room was a world, a past world, and they were the last two people from it who were still living. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('275', '	Our Leader, Emmanue ', '4', '	Our Leader, Emmanuel Goldstein ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('276', '	They vaporized Syme ', '5', '	They vaporized Syme. One morning he was not at work; a few careless people talked about his absence. On the next day nobody talked about him. His name disappeared from lists and newspapers. He did not exist. He had never existed. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('277', '	Parsons was helping ', '6', '	Parsons was helping to organize Hate Week. He was completely happy, running around painting posters, singing the new Hate Song, smelling even more strongly of sweat in the hot weather. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('278', '	Daily life no longe ', '6', '	Daily life no longer caused Winston pain: He had stopped drinking gin at all hours and his knee felt better. He did not want to shout angry words at the telescreen all the time. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('279', '	He met Julia four,  ', '4', '	He met Julia four, five, six - seven times during the month of June. It was so hot at the end of the month that they lay on the bed in the room over Mr Charrington''s shop without clothes on. The rat had never come back. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('280', '	Sometimes they talk ', '4', '	Sometimes they talked about a more open war against the Party, but they did not know how to begin. Winston told her about the strange understanding that seemed to exist between himself and O''Brien. He sometimes felt like going to see him, telling him he was the enemy of the Party, demanding O''Brien''s help. Strangely, Julia did not think this was a wild idea. She judged people by their faces and it seemed natural to her that the look in O''Brien''s eyes made Winston believe in him. Also, she thought that everybody secretly hated the Party, although she did not believe in Goldstein and the Brotherhood; she thought the Party had invented them. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('281', '	And then at last it ', '3', '	And then at last it happened. All his life, it seemed to him, he had been waiting for this: there was a message from O''Brien. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('282', '	Winston was outside ', '4', '	Winston was outside his office at the Ministry when he heard a small cough behind him and turned. It was O''Brien. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('283', '	''I was reading your ', '1', '	''I was reading your Newspeak article the other day. You know a lot about Newspeak, I believe.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('284', '	''Oh, not really. I'' ', '4', '	''Oh, not really. I''ve never invented any of the words ...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('285', '	''But you write it v ', '2', '	''But you write it very well,'' said O''Brien. ''That is not only my own opinion. I was talking recently to a friend of yours who knows a lot about Newspeak. I can''t remember his name at the moment.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('286', '	Winston''s heart jum ', '6', '	Winston''s heart jumped. This could only mean Syme. But Syme was not only dead, he was vaporized, an unperson. It was dangerous to talk about an unperson; they could kill you for it. O''Brien was sharing a thoughtcrime with him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('287', '	''In your Newspeak a ', '5', '	''In your Newspeak article you used two words which we have recently taken out of the language,'' said O''Brien. ''Have you seen the new tenth edition?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('288', '	''No,'' said Winston. ', '3', '	''No,'' said Winston. ''We still have the ninth in the office.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('289', '	''The tenth will not ', '3', '	''The tenth will not be sent to offices for some months, but I have one. Would you like to see it, perhaps?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('290', '	''Yes, very much,'' s ', '5', '	''Yes, very much,'' said Winston, who could see where this was leading. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('291', '	''You will be intere ', '6', '	''You will be interested, I''m sure. You will like the smaller number of verbs. Shall I send someone to you with the Dictionary? But I always forget that kind of thing. Perhaps you could collect it from my flat at a convenient time? Wait. Let me give you my address.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('292', '	They were standing  ', '1', '	They were standing in front of a telescreen which could see what he was writing. He wrote an address in a notebook, pulled out the page and gave it to Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('293', '	''I am usually at ho ', '6', '	''I am usually at home in the evenings,'' he said. ''If not, my servant will give you the Dictionary.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('294', '	And then he was gon ', '1', '	And then he was gone. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('295', '	They had done it, t ', '2', '	They had done it, they had done it at last! ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('296', '	The room was long,  ', '3', '	The room was long, carpeted and softly lit; the sound from the telescreen was low. At the far end of the room O''Brien was sitting under a lamp with papers on either side of him. He did not look up when the servant showed Winston and Julia in. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('297', '	Winston''s heart was ', '3', '	Winston''s heart was beating fast. It was dangerous to arrive with Julia, although they had met only outside O''Brien''s flat. And although O''Brien had invited him, he was still afraid of the black-uniformed guards in this enormous building with its strange smells of good food and tobacco. But the guards had not ordered him out. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('298', '	O''Brien continued t ', '6', '	O''Brien continued to work and did not look pleased at the visit. It seemed quite possible to Winston that he had just made a stupid mistake. He could not even pretend that he had come only to borrow the Dictionary – if he had, why was Julia here? ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('299', '	O''Brien got up slow ', '2', '	O''Brien got up slowly from his chair and came towards them across the thick carpet. He pressed a switch on the wall and the voice from the telescreen stopped. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('300', '	Julia gave a small  ', '6', '	Julia gave a small cry of surprise and without thinking Winston said, ''You can turn it off!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('301', '	''Yes,'' said O''Brien ', '6', '	''Yes,'' said O''Brien. ''We can turn it off. We in the Inner Party are allowed to do that.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('302', '	Nobody spoke. Witho ', '4', '	Nobody spoke. Without the voice from the telescreen the room was completely silent. Then O''Brien smiled. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('303', '	''Shall I say it or  ', '4', '	''Shall I say it or will you?'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('304', '	''I will say it,'' sa ', '4', '	''I will say it,'' said Winston immediately. ''That thing is really turned off?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('305', '	''Yes. We are alone. ', '1', '	''Yes. We are alone.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('306', '	Winston paused. He  ', '1', '	Winston paused. He did not know exactly what he expected from O''Brien. Then he continued, ''We believe that there is a secret organization working against the Party and that you are part of it. We want to join it and work for it. We are enemies of the Party. We are lovers, and we are thoughtcriminals. And now we are in your power.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('307', '	O''Brien took a bott ', '6', '	O''Brien took a bottle and filled three glasses with dark red liquid. It reminded Winston of something he had seen a long time ago. Julia picked up her glass and smelled the liquid with great interest. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('308', '	''It is called wine, ', '3', '	''It is called wine,'' said O''Brien with a small smile. ''Not much of it gets to ordinary Party members, I''m afraid.'' His face became serious again, and he lifted his glass: ''To our Leader,'' he said. ''To Emmanuel Goldstein.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('309', '	Winston lifted his  ', '2', '	Winston lifted his glass, wide-eyed. Wine was a thing he had read and dreamed about. For some reason he always thought it tasted sweet. But it tasted of nothing. The truth was that after years of drinking gin he could taste almost nothing. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('310', '	''So Goldstein is a  ', '3', '	''So Goldstein is a real person?'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('311', '	''Yes he is, and he  ', '1', '	''Yes he is, and he is alive. Where, I do not know.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('312', '	''And the Brotherhoo ', '3', '	''And the Brotherhood is real, too? It was not invented by the Thought Police?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('313', '	''No, it is real. Bu ', '3', '	''No, it is real. But you will never learn much more about the Brotherhood than that.'' He looked at his watch. ''It is unwise even for me to turn the telescreen off for more than half an hour. It was a mistake for both of you to arrive here together, and you, Comrade,'' – he looked at Julia – ''will have to leave first. We have about twenty minutes. Now, what are you prepared to do?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('314', '	''Anything that we c ', '3', '	''Anything that we can,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('315', '	O''Brien had turned  ', '5', '	O''Brien had turned himself a little in his chair so that he was looking at Winston. He seemed to think that Winston could answer for Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('316', '	''You are willing to ', '5', '	''You are willing to give your lives?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('317', '	''You are willing to ', '1', '	''You are willing to murder another person?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('318', '	''You are willing to ', '1', '	''You are willing to cause the death of hundreds of innocent people?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('319', '	''If, for example, i ', '2', '	''If, for example, it would help us to blind a child and destroy its face - would you do that?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('320', '	''Are you willing to ', '2', '	''Are you willing to kill yourselves, if we order you to do so?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('321', '	''You are willing, t ', '6', '	''You are willing, the two of you, to separate and never see each other again?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('322', '	''No!'' shouted Julia ', '5', '	''No!'' shouted Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('323', '	It seemed to Winsto ', '6', '	It seemed to Winston that a long time passed before he answered. ''No,'' he said finally. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('324', '	''You did well to te ', '4', '	''You did well to tell me,'' said O''Brien. ''It is necessary for us to know everything.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('325', '	O''Brien started wal ', '4', '	O''Brien started walking up and down, one hand in the pocket of his black overalls, the other holding a cigarette. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('326', '	''You understand,'' h ', '5', '	''You understand,'' he said, ''that secrets will always be kept from you. You will receive orders and you will obey them without knowing why. Later I shall send you a book by Emmanuel Goldstein. When you have read the book you will be full members of the Brotherhood. When you are finally caught you will get no help. Sometimes we are able to get a razor blade into the prison to silence someone, but you are more likely to tell them all you know - although you will not know very much. We are the dead. We are fighting for a better life for people in the future.'' He stopped and looked at his watch. ''It is almost time for you to leave, Comrade,'' he said to Julia. ''Wait. There is still some wine.'' He filled the glasses and held up his own glass. ''What shall we drink to? To the death of Big Brother? To the future?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('327', '	''To the past,'' said ', '6', '	''To the past,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('328', '	''Yes, the past is m ', '5', '	''Yes, the past is more important,'' said O''Brien seriously. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('329', '	They finished the w ', '2', '	They finished the wine and a moment later Julia stood up to go. When she had left, Winston stood up and he and O''Brien shook hands. At the door he looked back, but O''Brien was already at his desk, doing his important work for the Party. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('330', '	On the sixth day of ', '1', '	On the sixth day of Hate Week, just before two thousand Eurasian prisoners were hanged in the park, the people of Oceania were told that they were not at war with Eurasia now. They were at war with Eastasia and Eurasia was a friend. You could hear it on the telescreens - Oceania was at war with Eastasia: Oceania had always been at war with Eastasia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('331', '	Winston had worked  ', '4', '	Winston had worked more than ninety hours in the last five days of Hate Week. Now he had finished and he had nothing to do, no Party work until tomorrow morning. Slowly, in the afternoon sunshine, he walked up a narrow street to Mr Charrington''s shop, watching for the Thought Police, but sure - although he had no reason to be sure - that he was safe. In his case, heavy against his legs, he carried the book, Goldstein''s book. He had had it for six days but had not looked at it yet. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('332', '	Tired but not sleep ', '3', '	Tired but not sleepy, he climbed the stairs above Mr Charrington''s shop. He opened the window and put the water on for coffee. Julia would be here soon. He took Goldstein''s book out of his case and opened it. Then he heard Julia coming up the stairs and jumped out of his chair to meet her. She put her brown tool bag on the floor and threw herself into his arms. It was more than a week since they had seen each other. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('333', '	''I''ve got the book'' ', '3', '	''I''ve got the book'', he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('334', '	''Oh, you''ve got it? ', '5', '	''Oh, you''ve got it? Good,'' she said without much interest, and almost immediately bent down to make the coffee. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('335', '	They did not talk a ', '5', '	They did not talk about the book again until they had been in bed for half an hour. It was evening and just cool enough to have a blanket over them. Julia was falling asleep by his side. Winston picked the book up from the floor and sat up in bed. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('336', '	''We must read it,''  ', '5', '	''We must read it,'' he said. ''You too. All members of the Brotherhood have to read it.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('337', '	''You read it,'' she  ', '6', '	''You read it,'' she said with her eyes shut. ''Read it to me, that''s the best way. Then you can explain it to me.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('338', '	The clock''s hands s ', '3', '	The clock''s hands said six, meaning eighteen. They had three or four hours ahead of them. He put the book against his knee and began reading: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('339', '	There have always b ', '3', '	There have always been three kinds of people in the world, the High, the Middle and the Low. The world has changed but society always contains these three groups. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('340', '	''Julia, are you awa ', '3', '	''Julia, are you awake?'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('341', '	''Yes, my love, I''m  ', '3', '	''Yes, my love, I''m listening.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('342', '	The aims of the thr ', '4', '	The aims of the three groups are completely different. The High want to stay where they are. The Middle want to change places with the High. Sometimes the Low have no aim at all, because they are too tired from endless boring work to have an aim. If they do have one, they want to live in a new world where all people are equal. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('343', '	At the beginning of ', '2', '	At the beginning of the twentieth century this equality became possible for the first time because machines did so much of the work. A centuries-old dream seemed to becoming true. But in the early 1930s the High group saw the danger to them of equality for all and did everything possible to stop it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('344', '	The individual suff ', '3', '	The individual suffered in ways that he had not suffered for centuries. Prisoners of war were sent into slavery or hanged. Thousands were sent to prison although they had broken no law. The populations of whole countries were forced to leave their homes. And all this was defended and even supported by people who said they believed in progress. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('345', '	The people who ente ', '4', '	The people who entered the new High group were from the professions: scientists, teachers, journalists. They used newspapers, radio, film and television to control people''s thoughts. When a television that could both send and receive information was invented, private life came to an end. Every individual, or at least every important individual, could be watched twenty-four hours a day. For the first time it was possible to force people to obey the Party and to share the Party''s opinion on all subjects. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('346', '	After the 1950s and ', '4', '	After the 1950s and 1960s the danger of equality had been ended and society had re-grouped itself, as always, into High, Middle and Low. But the new High group, for the first time, knew how to stay in that position for ever. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('347', '	First, in the middl ', '3', '	First, in the middle years of the twentieth century, the Party made sure that it owned all the property- all the factories, land, houses, everything except really small pieces of personal property. This meant that a few people (the Inner Party) owned almost everything and the Middle and Low groups owned nearly nothing. There was therefore no hope of moving up in society by becoming richer and owning more. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('348', '	But the problem of  ', '2', '	But the problem of staying in power is more complicated than that. In the past, High groups have fallen from power either because they have lost control of the Middle or Low groups or because they have become too weak, or because they have been attacked and beaten by an army from outside. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('349', '	After the middle of ', '4', '	After the middle of the century there was really no more danger from the Middle or Low groups. The Party had made itself stronger by killing all of its first leaders (people like Jones, Aaronson and Rutherford). By 1970 Big Brother was the only leader and Emmanuel Goldstein was in hiding somewhere. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('350', '	The Party then kept ', '2', '	The Party then kept itself strong. The child of Inner Party parents is not born into the Inner Party; there is an examination, taken at the age of sixteen. Weak Inner Party members are moved down and clever Outer Party members are allowed to move up. Although proles do not usually move up into the Party, the Party always stops itself from becoming stupid or weak. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('351', '	The Party has also  ', '4', '	The Party has also made attack from the outside impossible. There are now only three great countries in the world. They are always at war but none of them can win or even wishes to win these wars. Following the idea of ''doublethink'' the mind of the Party, which controls us all, both knows and does not know the aim of these wars. The aim is to use everything that a country produces without making its people richer. If people became richer, there would be an end to the world of the High, the Middle and the Low. The Low and the Middle would not wish to stay in their places and would not need to. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('352', '	The Middle and Low  ', '6', '	The Middle and Low are kept in their places by their belief in the wars that none of the three countries can win. So the Party has to end independent thought and make people believe everything they are told. The Party must know what every person is thinking, so they never want to end the war. War continues, always and for ever. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('353', '	People are given so ', '2', '	People are given somewhere to live, something to wear and something to eat. That is all they need and they must never want more. They are given work, but only the Thought Police do their work really well. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('354', '	All good things in  ', '3', '	All good things in the world of Oceania today, all knowledge, all happiness, come from Big Brother. Nobody has ever seen Big Brother. He is a face on posters, a voice on the telescreen. We can be sure that he will never die. Big Brother is the way the Party shows itself to the people. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('355', '	Below Big Brother c ', '4', '	Below Big Brother comes the Inner Party, which is now six million people, less than 2% of the population of Oceania. Below the Inner Party comes the Outer Party. The Inner Party is like the mind of the Party and the Outer Party is like its hands. Below that come the millions of people we call ''the proles'', about 85% of the population. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('356', '	A Party member live ', '3', '	A Party member lives under the eye of the Thought Police from birth to death. Even when he is alone he can never be sure he is alone. He will never make a free choice in his life. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('357', '	But there is no law ', '1', '	But there is no law and there are no rules. They are not necessary. Most people know what they must do - in Newspeak they are ''goodthinkers''. And since Party members were children they have been trained in three more Newspeak words: ''crimestop'', ''blackwhite'' and ''doublethink''. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('358', '	Even young children ', '2', '	Even young children are taught ''crimestop''. It means stopping before you think a wrong thought. When you are trained in ''crimestop'' you cannot think a thought against the Party. You think only what the Party wants you to think. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('359', '	But the Party wants ', '5', '	But the Party wants people to think different thoughts all the time. The important word here is ''blackwhite.'' Like many Newspeak words, this has two meanings. Enemies say that black is white - they tell lies. But Party members say that black is white because the Party tells them to and because they believe it. They must forget that they ever had a different belief. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('360', '	''Blackwhite'' and ''c ', '4', '	''Blackwhite'' and ''crimestop'' are both part of ''doublethink''. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('361', '	''Doublethink'' allow ', '6', '	''Doublethink'' allows people to hold two different ideas in their minds at the same time - and to accept both of them. In this way they can live with a changing reality including a changing past. The past must be changed all the time because the Party can never make a mistake. That is the most important reason. It is also important that nobody can remember a time better than now and so become unhappy with the present. By using ''doublethink'' the Party has been able to stop history, keep power and... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('362', '	''Julia, are you awa ', '1', '	''Julia, are you awake?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('363', '	No answer. She was  ', '3', '	No answer. She was asleep. He shut the book, put it carefully on the floor, lay down and put the blanket over both of them. The book had not told him anything he did not already know, but after reading it he knew he was not mad. He shut his eyes. He was safe, everything was all right. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('364', '	When he woke he tho ', '3', '	When he woke he thought he had slept a long time but, looking at the old clock, he saw it was only twenty-thirty. Outside he could hear singing. It was a song written in the Ministry of Truth and a prole woman was singing it. If there was hope, thought Winston, it was because of the proles. Even without reading the end of Goldstein''s book, he knew that was his message. The future belonged to the proles; Party members were the dead. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('365', '	''We are the dead,''  ', '1', '	''We are the dead,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('366', '	''We are the dead,''  ', '5', '	''We are the dead,'' agreed Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('367', '	''You are the dead,'' ', '5', '	''You are the dead,'' said a voice behind them. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('368', '	They jumped away fr ', '1', '	They jumped away from each other. Winston felt his blood go cold. Julia''s face had turned a milky yellow. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('369', '	''You are the dead,'' ', '2', '	''You are the dead,'' repeated the voice. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('370', '	''It was behind the  ', '4', '	''It was behind the picture,'' breathed Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('371', '	''It was behind the  ', '2', '	''It was behind the picture,'' said the voice. ''Stay exactly where you are. Do not move until we order you to.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('372', '	It was starting, it ', '6', '	It was starting, it was starting at last! They could do nothing except look into each other''s eyes. They did not even think of running for their lives or getting out of the house before it was too late. It was unthinkable to disobey the voice from the wall. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('373', '	There was a crash o ', '6', '	There was a crash of breaking glass. The picture had fallen to the floor. There was a telescreen behind it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('374', '	''Now they can see u ', '1', '	''Now they can see us,'' said Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('375', '	''Now we can see you ', '2', '	''Now we can see you,'' said the voice. ''Stand in the middle of the room. Stand back to back. Put your hands behind your heads. Do not touch each other.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('376', '	''I suppose we shoul ', '3', '	''I suppose we should say goodbye,'' said Julia. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('377', '	''You should say goo ', '2', '	''You should say goodbye,'' said the voice. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('378', '	There was a crash a ', '1', '	There was a crash as a ladder broke through the window. Soldiers came in; more came crashing in through the door. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('379', '	Winston did not mov ', '3', '	Winston did not move, not even his eyes. Only one thing mattered: don''t give them an excuse to hit you. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('380', '	One of the soldiers ', '1', '	One of the soldiers hit Julia hard in the stomach. She fell to the floor, fighting to breathe. Then two of them picked her up and carried her out of the room, holding her by the knees and shoulders. Winston saw her face, yellow with pain, with her eyes tightly shut as they took her away from him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('381', '	He did not move. No ', '2', '	He did not move. No one had hit him yet. He wondered if they had got Mr Charrington. He wanted to go to the toilet. The clock said nine, meaning twenty-one hours, but the light seemed too strong for evening. Was it really nine in the morning? Had he and Julia slept all that time? ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('382', '	Mr Charrington came ', '1', '	Mr Charrington came into the room and Winston suddenly realized whose voice he had heard on the telescreen. Mr Charrington still had his old jacket on, but his hair, which had been almost white, was now black. His body was straighter and looked bigger. His face was the clear-thinking, cold face of a man of about thirty-five. Winston realized that for the first time in his life he was looking at a member of the Thought Police. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('383', '	He did not know whe ', '5', '	He did not know where he was. He thought he was in the Ministry of Love, Miniluv, but he could not be certain. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('384', '	He was in a high-ce ', '3', '	He was in a high-ceilinged, windowless cell with white stone walls. It was bright with cold light. In this place, he felt, the lights would never be turned out. One moment he felt certain that it was bright day outside and the next moment he was equally certain that it was black night. ''We shall meet in the place where there is no dark,'' O''Brien had said to him. In the Ministry of Love there were no windows. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('385', '	He thought of O''Bri ', '6', '	He thought of O''Brien more often than Julia. He loved Julia and would not betray her, but he did not think about what was happening to her. Sometimes he thought about what they would do to him. He saw himself on the floor, screaming through broken teeth for them to stop hitting him. O''Brien must know he was here. O''Brien said the Brotherhood never tried to save its members. But they would send him a razor blade if they could. One cut and it would all be finished. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('386', '	In his cell, there  ', '2', '	In his cell, there was a continuous noise from the machine that brought air in from outside. A narrow shelf went round the wall, stopping only at the door, and at the end opposite the door there was a toilet with no wooden seat. There were four telescreens, one in each wall. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('387', '	He was hungry. It m ', '2', '	He was hungry. It might be twenty-four hours since he had eaten, it might be thirty-six. He still did not know, probably never would know, if it had been morning or evening when the soldiers took him. Since then he had been given no food. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('388', '	He sat on the narro ', '3', '	He sat on the narrow shelf without moving, with his hands crossed on his knees. He had already learned not to move too much. If you moved around they shouted at you from the telescreen. But he wanted food so badly, especially a piece of bread. He thought perhaps there was a small piece in the pocket of his overalls. His need for the bread grew stronger than the fear; he put a hand in his pocket. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('389', '	''Smith!'' shouted a  ', '4', '	''Smith!'' shouted a voice from the telescreen. ''6079 Smith W! Hands out of pockets in the cells!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('390', '	He crossed his hand ', '2', '	He crossed his hands on his knee again. There was a sound of marching boots outside. A young officer, black-uniformed, with an emotionless face, stepped into the cell. He waved to the guards behind him and they brought in a man who they were holding by the arms. It was Ampleforth, the man who re-wrote poems for the Party. The cell door closed behind him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('391', '	Ampleforth walked u ', '2', '	Ampleforth walked up and down the cell. He had not yet noticed Winston. He was dirty, wore no shoes and had not shaved for several days. The hairy half-beard gave him a criminal look that was strange, with his large weak body and nervous movements. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('392', '	Winston thought qui ', '4', '	Winston thought quickly. He must speak to Ampleforth even if they shouted at him through the telescreen. It was possible that Ampleforth had the razor blade for him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('393', '	''Ampleforth,'' he sa ', '1', '	''Ampleforth,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('394', '	There was no shout  ', '3', '	There was no shout from the telescreen. Ampleforth stopped walking up and down. He seemed surprised. It took him a moment to recognize Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('395', '	''Ah, Smith!'' he sai ', '1', '	''Ah, Smith!'' he said. ''You too!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('396', '	''What are you in fo ', '5', '	''What are you in for?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('397', '	Ampleforth put a ha ', '6', '	Ampleforth put a hand to his head, trying to remember. ''There is something...'' he said. ''We were working on a poem and I didn''t change the word "God". It was necessary, in the poem. There was no other word. So I left it.'' For a moment he looked happy, pleased with his work on the poem. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('398', '	''Do you know what t ', '1', '	''Do you know what time of day it is?'' asked Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('399', '	Ampleforth looked s ', '2', '	Ampleforth looked surprised. ''I hadn''t thought about it. They took me – it could be two days ago – perhaps three.'' He looked round the cell. ''There is no difference between night and day in this place. You can never know the time.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('400', '	They talked for a f ', '6', '	They talked for a few minutes, then, for no clear reason, a voice from the telescreen told them to be silent. Winston sat quietly, his hands crossed. Ampleforth was too large for the narrow shelf and moved from side to side. Time passed – twenty minutes, an hour. Again there was a sound of boots. Winston''s stomach turned to water. Soon, very soon, perhaps now, the boots would come for him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('401', '	The door opened. Th ', '1', '	The door opened. The cold-faced young officer stepped into the cell. He waved his arm at Ampleforth. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('402', '	''Room 101,'' he said ', '4', '	''Room 101,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('403', '	Ampleforth marched  ', '2', '	Ampleforth marched out between the guards. He looked a little worried but did not seem to understand what was happening to him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('404', '	More time passed. I ', '3', '	More time passed. It seemed like a long time to Winston. He had only six thoughts: the pain in his stomach; a piece of bread; the blood and the screaming; O''Brien; Julia; the razor blade. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('405', '	Then his stomach tu ', '4', '	Then his stomach turned to water again as he heard the boots outside. The door was opened and a smell of sweat came in with the cold air. Parsons walked into the cell. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('406', '	''You here!'' Winston ', '1', '	''You here!'' Winston cried out in surprise. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('407', '	Parsons did not see ', '6', '	Parsons did not seem interested in Winston or surprised to see him. He looked completely without hope. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('408', '	''What are you in fo ', '4', '	''What are you in for?'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('409', '	''Thoughtcrime'' said ', '6', '	''Thoughtcrime'' said Parsons, almost crying. ''They won''t shoot me, will they? I mean, they don''t shoot you when you haven''t done anything – just thought? And they''ll know everything I''ve done for the Party, won''t they? I''ll just get five years, don''t you think? Or even ten years? Someone like me could really help the Party in prison. They wouldn''t shoot me for just one mistake?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('410', '	''Are you guilty?'' s ', '1', '	''Are you guilty?'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('411', '	''Of course I''m guil ', '6', '	''Of course I''m guilty!'' said Parsons, looking at the telescreen as he spoke. ''I wouldn''t be here if I wasn''t. Thoughtcrime is a terrible thing. Do you know how it happened? In my sleep! Yes, there I was working away for the Party - I never knew I had any bad stuff in my mind at all. And then I started talking in my sleep. Do you know what I said? I said "Down with Big Brother!" Do you know what I''m going to say to them? I''m going to say, "Thank you for saving me." '' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('412', '	''Who told them abou ', '5', '	''Who told them about you?'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('413', '	''My little daughter ', '1', '	''My little daughter,'' said Parsons, sad but proud. He walked up and down a few more times, looking hard at the toilet. ''Excuse me, old man,'' he said. ''I can''t help it. It''s the waiting.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('414', '	Parsons took his tr ', '2', '	Parsons took his trousers down. Winston covered his face with his hands. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('415', '	''Smith!'' shouted th ', '1', '	''Smith!'' shouted the voice from the telescreen. ''6079 Smith W! Uncover your face. No faces covered in the cells.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('416', '	Winston uncovered h ', '1', '	Winston uncovered his face. Parsons used the toilet, loudly and horribly. The cell smelled terrible for hours afterwards. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('417', '	Parsons was taken o ', '2', '	Parsons was taken out. More men and women were brought in and taken out again by the guards. One woman was sent to ''Room 101'' and seemed to become smaller and change colour as she heard the words. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('418', '	''Comrade! Officer!'' ', '1', '	''Comrade! Officer!'' she cried. ''You don''t have to take me to that place! Haven''t I told you everything already? I''ll say anything. Just write it down and I''ll say it! Not Room 101.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('419', '	''Room 101,'' said th ', '5', '	''Room 101,'' said the guard. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('420', '	A long time passed. ', '4', '	A long time passed. Winston was alone and had been alone for hours. Sometimes he thought of O''Brien and the razor blade, but with less and less hope. He also thought, less clearly, of Julia. He thought that if she were in pain and he could double his own pain to help her, he would do it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('421', '	He heard the boots  ', '1', '	He heard the boots again. O''Brien came in. Winston got to his feet. The shock made him forget the telescreen for the first time in years. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('422', '	''They''ve got you to ', '2', '	''They''ve got you too!'' he shouted out. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('423', '	''They got me a long ', '5', '	''They got me a long time ago,'' said O''Brien with a small smile. He stepped to one side. Behind him there was a large guard with a heavy stick in his hand. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('424', '	''You knew this, Win ', '6', '	''You knew this, Winston,'' said O''Brien. ''You have always known it.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('425', '	Yes, he had always  ', '1', '	Yes, he had always known it. But there was no time to think of that. The heavy stick in the guard''s hand might hit him anywhere, on his head, ear, arm, elbow... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('426', '	The elbow! He had g ', '1', '	The elbow! He had gone down on his knees, holding the pain in his elbow with the other hand. There was an explosion of yellow light. The pain was unbelievable, but the guard had only hit him once. They were both looking down at him and the guard was laughing. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('427', '	Well, one question  ', '6', '	Well, one question was answered. You could never, for any reason on earth, wish for more pain. You only wished for one thing – that it would stop. Nothing in the world was as bad as physical pain. With pain there are no heroes, no heroes, he thought again and again as he lay screaming on the floor, holding his useless left arm. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('428', '	Two and Two Make Fi ', '4', '	Two and Two Make Five ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('429', '	He was lying on a b ', '6', '	He was lying on a bed and he could not move. There was a strong light in his face. The damage to his elbow had only been the start of it. Five or six men in black uniforms had hit him with sticks or iron bars, kicked him with their boots... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('430', '	He could not rememb ', '2', '	He could not remember how many times they had hit him or how long this punishment had lasted. Sometimes he told them what they wanted to know before they even touched him. Other times they hit him again and again before he said a word. And all this was just the start - the first stage of questioning that everyone in the cells of the Ministry of Love had to suffer. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('431', '	Later the questione ', '4', '	Later the questioners were not guards but Party men in suits who asked him questions for ten to twelve hours before they let him sleep. They made sure he was not comfortable and was in slight pain. They made a fool of him, made him cry. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('432', '	Sometimes they said ', '2', '	Sometimes they said they would call the guards and their sticks again. Other times they called him ''Comrade'' and asked him in the name of Big Brother to say he was sorry. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('433', '	He told them he was ', '6', '	He told them he was responsible for every imaginable crime. He said he was an Eastasian spy. He said he had murdered his wife, although they knew very well she was still alive. He said he knew Goldstein... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('434', '	He did not remember ', '3', '	He did not remember when the questions had stopped. There was a time when everything was black and then he was in this room, lying on this bed, unable to move. O''Brien was looking down at him. His hand was on a machine. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('435', '	''I told you,'' said  ', '1', '	''I told you,'' said O''Brien, ''that if we met again it would be here.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('436', '	''Yes,'' said Winston ', '4', '	''Yes,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('437', '	O''Brien''s hand touc ', '4', '	O''Brien''s hand touched a lever on the machine and a wave of pain passed through Winston''s body. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('438', '	''That was forty,'' s ', '4', '	''That was forty,'' said O''Brien. ''The numbers on the dial of this machine go up to a hundred. Please remember that I can make you feel a lot of pain at any time. If you lie, if you don''t answer the question or even if you answer with less than your usual intelligence, you will feel pain. Do you understand that?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('439', '	''Yes,'' said Winston ', '3', '	''Yes,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('440', '	''Do you remember,''  ', '3', '	''Do you remember,'' O''Brien continued, ''writing in your diary, "Freedom is the freedom to say that two and two make four"?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('441', '	''Yes,'' said Winston ', '2', '	''Yes,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('442', '	O''Brien held up his ', '6', '	O''Brien held up his left hand, its back towards Winston, with the thumb hidden and four fingers pointing forward. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('443', '	''How many fingers a ', '6', '	''How many fingers am I holding up, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('444', '	''And if the Party s ', '6', '	''And if the Party says that it is not four but five - then how many?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('445', '	The word ended in a ', '2', '	The word ended in a shout of pain. The dial on the machine showed fifty-five. Winston could not stop himself from crying. O''Brien touched the lever, moving it just a little, and the pain grew slightly less. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('446', '	''How many fingers,  ', '1', '	''How many fingers, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('447', '	O''Brien moved the l ', '2', '	O''Brien moved the lever and the dial showed sixty. ''How many fingers, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('448', '	''Four! Four! What e ', '3', '	''Four! Four! What else can I say? Four!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('449', '	The fingers swam in ', '3', '	The fingers swam in front of his eyes, unclear, but still four, four of them. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('450', '	''How many fingers,  ', '3', '	''How many fingers, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('451', '	''Four! Stop it, sto ', '3', '	''Four! Stop it, stop it! How can you continue? Four! Four!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('452', '	''How many fingers,  ', '5', '	''How many fingers, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('453', '	''No, Winston. That'' ', '4', '	''No, Winston. That''s no use. You are lying. You still think there are four. How many fingers, please?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('454', '	''Four! Five! Four!  ', '3', '	''Four! Five! Four! Any thing you like. Only stop it, stop the pain!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('455', '	Suddenly he was sit ', '2', '	Suddenly he was sitting up with O''Brien''s arm round his shoulders. He felt very cold and shook uncontrollably. O''Brien held him like a baby and he felt much better. He felt that the pain was something that came from outside, and that O''Brien would save him from it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('456', '	''You are a slow lea ', '4', '	''You are a slow learner, Winston,'' said O''Brien gently. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('457', '	''How can I help it? ', '3', '	''How can I help it?'' cried Winston, through his tears. ''How can I help seeing what is in front of my eyes? Two and two are four.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('458', '	''Sometimes, Winston ', '3', '	''Sometimes, Winston. Sometimes they are five. Sometimes they are three. Sometimes they are all of them. You must try harder.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('459', '	He put Winston back ', '4', '	He put Winston back down on the bed. ''Again,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('460', '	The pain flamed thr ', '1', '	The pain flamed through Winston''s body. The dial was at seventy, then seventy-five. He had shut his eyes this time. He knew that the fingers were still there, and still four. He had to stay alive until the pain was over. He did not notice whether he was crying out or not. The pain grew less again. He opened his eyes. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('461', '	''How many fingers,  ', '5', '	''How many fingers, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('462', '	''Four. I would see  ', '5', '	''Four. I would see five if l could. I am trying to see five.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('463', '	''Which do you wish: ', '3', '	''Which do you wish: to make me believe that you see five, or really to see them?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('464', '	''Really to see them ', '3', '	''Really to see them.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('465', '	''Again,'' said O''Bri ', '2', '	''Again,'' said O''Brien. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('466', '	Perhaps the machine ', '2', '	Perhaps the machine was at eighty - ninety. Winston could remember only now and again why the pain was happening. In front of his eyes a forest of fingers seemed to be moving in a kind of dance. He was trying to count them, he could not remember why. He knew only that it was impossible to count them and this was because four was in some strange way the same as five. He shut his eyes again. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('467', '	''How many fingers a ', '3', '	''How many fingers am I holding up, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('468', '	''I don''t know. I do ', '1', '	''I don''t know. I don''t know. You will kill me if you do that again. Four, five, six - I honestly don''t know.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('469', '	''Better,'' said O''Br ', '3', '	''Better,'' said O''Brien. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('470', '	Winston wanted to r ', '2', '	Winston wanted to reach out his hand and touch O''Brien''s arm, but he could not move. The old feeling about him came back. It did not matter if O''Brien was a friend or an enemy. O''Brien was a person he could talk to. Perhaps people did not want to be loved as much as understood. O''Brien had caused him unbelievable pain and soon would probably kill him. It made no difference. They shared the same experiences; there was a place where they could meet and talk. O''Brien was looking down at him with a look that suggested he felt the same thing. When he spoke, it was like talking to a friend. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('471', '	''Do you know where  ', '1', '	''Do you know where you are, Winston?'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('472', '	''I don''t know. I ca ', '2', '	''I don''t know. I can guess. In the Ministry of Love.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('473', '	''Do you know how lo ', '3', '	''Do you know how long you have been here?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('474', '	''I don''t know. Days ', '1', '	''I don''t know. Days, weeks, months - I think it is months.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('475', '	''And why do you thi ', '5', '	''And why do you think we bring people to this place?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('476', '	''To make them tell  ', '4', '	''To make them tell you about their crimes.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('477', '	''No, that is not th ', '5', '	''No, that is not the reason.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('478', '	''No!'' shouted O''Bri ', '6', '	''No!'' shouted O''Brien. His face and voice were angry. ''No! Not just to hear about your crimes. Not just to punish you. Shall I tell you why we have brought you here? To make you better. Your crimes do not interest us. Your actions do not interest us. We are interested in your thoughts. We do not destroy our enemies, we change them. We change their thoughts. Do you understand what I mean?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('479', '	''Yes,'' said Winston ', '2', '	''Yes,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('480', '	A man in a white co ', '4', '	A man in a white coat came into the room and put a heavy machine behind his head. O''Brien had sat down beside the bed so he could look into Winston''s eyes. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('481', '	''This time it will  ', '6', '	''This time it will not hurt,'' said O''Brien. ''Keep looking at me.'' Then he turned to the man in the white coat. ''Three thousand,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('482', '	Winston felt the ma ', '6', '	Winston felt the machine against his head. He heard a lever pulled. Then it was like an explosion inside his head, though it was not certain if there was any noise. There was blinding light and the feeling that he had been thrown back on the bed where he already was. Something had happened inside his head. As he opened his eyes he remembered who he was, and where he was, and he recognized the face that was looking down into his own; but something was empty inside his head. It felt like a piece had been taken out of his brain. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('483', '	''Look me in the eye ', '2', '	''Look me in the eyes,'' said O''Brien. He held up the four fingers of his left hand with the thumb behind the hand. ''There are five fingers there. Do you see five fingers?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('484', '	''Yes.'' And he did s ', '5', '	''Yes.'' And he did see them, just for a second. O''Brien''s words filled the hole in his mind with the complete truth. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('485', '	'' You see now,'' sai ', '5', '	'' You see now,'' said O''Brien, ''that it is possible.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('486', '	''Yes,'' said Winston ', '6', '	''Yes,'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('487', '	O''Brien smiled. ''I  ', '5', '	O''Brien smiled. ''I enjoy talking to you,'' he said. ''Your mind is like mine, except that you are mad. Before we finish you can ask me a few questions, if you want to.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('488', '	''Any question I lik ', '4', '	''Any question I like?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('489', '	''Anything.'' He saw  ', '3', '	''Anything.'' He saw that Winston''s eyes were on the machine. ''It is switched off. What is your first question?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('490', '	''What have you done ', '1', '	''What have you done with Julia?'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('491', '	O''Brien smiled agai ', '3', '	O''Brien smiled again. ''She betrayed you, Winston. Immediately, completely. I have never seen anybody obey us so quickly. All her feelings against the Party have been burned out of her. She has changed herself completely.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('492', '	''Did you use this m ', '3', '	''Did you use this machine?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('493', '	O''Brien did not ans ', '5', '	O''Brien did not answer. ''Next question,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('494', '	''Does Big Brother e ', '1', '	''Does Big Brother exist?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('495', '	''Of course he exist ', '2', '	''Of course he exists. The Party exists. Big Brother is the face of the Party.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('496', '	''Does he exist in t ', '5', '	''Does he exist in the same way that I exist?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('497', '	''You do not exist,'' ', '2', '	''You do not exist,'' said O''Brien. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('498', '	How could he not ex ', '6', '	How could he not exist? But what use was it to say so? O''Brien would argue with him and win - again. ''I think I exist,'' he said carefully. ''I was born and I will die. I have arms and legs. In that sense, does Big Brother exist?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('499', '	''It is not importan ', '3', '	''It is not important. But, yes, Big Brother exists.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('500', '	''Of course not. How ', '6', '	''Of course not. How could he die? Next question.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('501', '	''Does the Brotherho ', '6', '	''Does the Brotherhood exist?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('502', '	''That, Winston, you ', '3', '	''That, Winston, you will never know. If we choose to free you and if you live to be ninety years old, you will never learn whether the answer to that question is Yes or No.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('503', '	Winston lay silent. ', '2', '	Winston lay silent. His chest moved up and down as he breathed. He still had not asked the first question that had come into his mind. He wanted to ask it but he could not move his tongue. O''Brien was smiling. He knows, thought Winston suddenly, he knows what I am going to ask. As he thought that, the words fell out of his mouth: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('504', '	''What is in Room 10 ', '1', '	''What is in Room 101?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('505', '	O''Brien was still s ', '1', '	O''Brien was still smiling. ''You know what is in Room 101, Winston. Everyone knows what is in Room 101.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('506', '	''There are three st ', '2', '	''There are three stages in returning you to society,'' said O''Brien. ''There is learning, there is understanding and there is acceptance. It is time for you to begin the second stage.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('507', '	As always, Winston  ', '2', '	As always, Winston was lying flat on his back. He was still tied to the bed, but these days he was not tied so tightly. The machine, too, was less frightening. He could stop them using it if he thought quickly enough. O''Brien pulled the lever only when he said something stupid. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('508', '	Winston could not r ', '4', '	Winston could not remember how long this stage had lasted - weeks possibly - or how many times he had lain down on the bed, talking to O''Brien. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('509', '	''You have read the  ', '3', '	''You have read the book, Goldstein''s book, or parts of it,'' said O''Brien. ''Did it tell you anything that you did not know already?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('510', '	''You have read it?'' ', '5', '	''You have read it?'' said Winston. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('511', '	''I wrote it. I was  ', '5', '	''I wrote it. I was one of the people who wrote it. No book is written by one person, as you know.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('512', '	''Is any of it true? ', '4', '	''Is any of it true?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('513', '	''It describes our s ', '2', '	''It describes our situation truthfully, yes. Its solutions make no sense at all. The proles will never attack the Party or even criticize it. Not in a thousand years or a million. They cannot. I do not have to tell you the reason: you know it already. The Party will rule for all time. Make that the starting point of your thoughts. Now, let us turn to the question of why we are ruling. What do you think?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('514', '	Winston said what h ', '5', '	Winston said what he thought O''Brien wanted to hear. ''You are ruling over us for our own good,'' he said. ''You believe that people are not able to govern themselves and so...'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('515', '	He screamed. Pain h ', '3', '	He screamed. Pain had shot through his body. The machine showed thirty-five. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('516', '	''That was stupid, W ', '1', '	''That was stupid, Winston, stupid!'' said O''Brien. ''You should know better than to say a thing like that.'' He switched the machine off and continued. ''Now I will tell you the answer to my question. The Party is only interested in power - not in the happiness of others, or money, or long life. We want power, only power, pure power. And we will never, never let it go. Now do you begin to understand me?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('517', '	Winston thought how ', '2', '	Winston thought how tired O''Brien looked. O''Brien moved forward in his chair, bringing his face close to Winston''s. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('518', '	''You are thinking,'' ', '1', '	''You are thinking,'' he said, ''that my face is old and tired. You are thinking that I talk of power but I cannot stop my own body getting old. Can you not understand, Winston, that each person is only a very small part of something much bigger? And when the small part needs changing, the whole grows stronger. Do you die when you cut your hair?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('519', '	O''Brien turned away ', '1', '	O''Brien turned away from the bed and began to walk up and down. ''You must understand that power belongs to the group, not to one person. An individual has power only when he belongs to a group so completely that he is not an individual any more. The Party says that "Freedom is Slavery" but the opposite is also true. Slavery is Freedom. Alone - free - a human being will die in the end. But it he can be completely part of the Party, not an individual, then he can do anything and he lives for all time. The second thing is that power means power over the human body but, above all, power over the human mind. We already control everything else.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('520', '	For a moment Winsto ', '4', '	For a moment Winston forgot about the machine. ''How can you say that you control everything? You can''t control the weather. You don''t even control the Earth. What about Eurasia and Eastasia? You don''t control them.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('521', '	''Unimportant. We sh ', '1', '	''Unimportant. We shall control them when we want to. And if we did not, what difference would it make? Oceania is the world. Have you forgotten doublethink?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('522', '	Winston lay back on ', '3', '	Winston lay back on the bed. He knew he was right. O''Brien was saying that nothing exists outside your own mind. There must be a way of showing this was wrong? ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('523', '	O''Brien was smiling ', '5', '	O''Brien was smiling. ''The real power,'' he said, ''is not power over things, but over men.'' He paused and for a moment looked like a teacher talking to a clever schoolboy. ''How does one man show that he has power over another man, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('524', '	Winston thought. ''B ', '2', '	Winston thought. ''By making him suffer,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('525', '	''Exactly. By making ', '5', '	''Exactly. By making him suffer. Power means causing pain. Power lies in taking human minds to pieces and putting them together again in new shapes of your own choice. Do you begin to see, then, what kind of world we are making? It is the opposite of the stupid worlds which people used to imagine, worlds of love and pleasure. We have built a world of fear and suffering and hate. We shall destroy everything else - everything. We are destroying the love between child and parent, between man and man, and between man and woman. In the future there will be no wives and no friends. Children will be taken from their mothers when they are born. There will be no love, except the love of Big Brother. Nobody will laugh, except at an enemy they have destroyed. There will be no art, no literature, no science. If you want a picture of the future, Winston, imagine a boot stamping on a human face - for ever.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('526', '	Winston could not s ', '5', '	Winston could not say anything. His heart seemed frozen. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('527', '	O''Brien continued:  ', '1', '	O''Brien continued: ''You are beginning, I can see, to understand what that world will be like. But in the end you will do more than understand it. You will accept it, welcome it, become part of it.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('528', '	Winston was still j ', '5', '	Winston was still just strong enough to speak. ''You can''t,'' he said weakly. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('529', '	''What do you mean,  ', '2', '	''What do you mean, Winston?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('530', '	''If a society were  ', '4', '	''If a society were built on hate, it would fall to pieces.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('531', '	''No, no. You think  ', '3', '	''No, no. You think that hating is more tiring than loving. Why should it be? And even if it was true, what difference would it make?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('532', '	Winston was helples ', '4', '	Winston was helpless again, unable to argue, unable to find the words to explain the horror that he felt. ''Something will beat you,'' he said, finally. ''Life will beat you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('533', '	''We control life, W ', '5', '	''We control life, Winston. And we control the way people are. People can be changed very easily, you know.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('534', '	''No! I know that yo ', '5', '	''No! I know that you will fail. There is something in all human beings that will beat you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('535', '	''And are you a huma ', '5', '	''And are you a human being, Winston? Are you a man?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('536', '	''If you are a man,  ', '3', '	''If you are a man, Winston, you are the last man. Your kind of man is finished. Do you understand that you are alone? Yon are outside history, you do not exist.'' His voice changed as he gave Winston a hard look. ''And you think you are better than us, because we hate and cause pain?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('537', '	''Yes, I think I am  ', '4', '	''Yes, I think I am better.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('538', '	O''Brien did not spe ', '5', '	O''Brien did not speak. Two other voices were speaking. After a moment Winston recognized one of the voices as his own. It was the conversation he had had with O''Brien on the night he had joined the Brotherhood. He heard himself promising to murder another person, to cause the death of hundreds of innocent people, to make a child blind and destroy its face. O''Brien pressed a switch and the voices stopped. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('539', '	''Get up from the be ', '5', '	''Get up from the bed,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('540', '	Winston got off the ', '4', '	Winston got off the bed and stood up with difficulty. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('541', '	''You are the last m ', '6', '	''You are the last man,'' said O''Brien. ''Are you really better than us? You''re going to see yourself as you are. Take off your clothes.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('542', '	Winston took his di ', '4', '	Winston took his dirty overalls off and saw himself in a three-sided mirror at the end of the room. He cried out at the horrible sight. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('543', '	''Move closer,'' said ', '4', '	''Move closer,'' said O''Brien. ''Look at yourself closely in the three mirrors.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('544', '	Winston had stopped ', '3', '	Winston had stopped walking towards the mirror because he was frightened. A bent, grey-coloured thing was walking towards him in the mirror. His face was completely changed. He had very little hair, his back was bent, he was terribly thin. This looked like the body of an old, dying man. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('545', '	''You have thought s ', '2', '	''You have thought sometimes,'' said O''Brien, ''that my face - the face of a member of the Inner Party - looks old and tired. What do you think of your own face?'' He pulled out a handful of Winston''s hair. ''Even your hair is coming out in handfuls. Open your mouth. Nine, ten, eleven teeth left. How many did you have when you came to us? And they are dropping out of your head. Look here!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('546', '	He took hold of one ', '6', '	He took hold of one of Winston''s few front teeth between his thumb and two fingers. Pain filled Winston''s face. O''Brien had pulled out the loose tooth. He threw it across the cell. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('547', '	''You are falling to ', '3', '	''You are falling to pieces,'' he said. ''You are dirty. Did you know you smell like a dog? What are you? Just a dirty animal. Now look into that mirror again. That is the last man.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('548', '	Before he knew what ', '3', '	Before he knew what he was doing, Winston had sat on a small chair near the mirror and started to cry. ''You did it!'' he said, through his tears. ''You made me look like this.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('549', '	O''Brien put a hand  ', '1', '	O''Brien put a hand on his shoulder, almost kindly. ''No, Winston. You did it yourself when you stopped obeying the Party'' He paused for a moment and then continued. ''We have beaten you, Winston. We have broken you. You have seen your body. Your mind is in the same state. There is nothing that we did not make you do.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('550', '	Winston stopped cry ', '3', '	Winston stopped crying. ''I have not betrayed Julia,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('551', '	O''Brien looked down ', '6', '	O''Brien looked down at him thoughtfully. ''No,'' he said. ''No, that is true. You have not betrayed Julia.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('552', '	Winston thought aga ', '3', '	Winston thought again how intelligent O''Brien was. Nothing, it seemed, could stop him admiring the man. O''Brien had understood that Winston still loved Julia and that meant more than betraying the details of their meetings. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('553', '	''Tell me,'' he said. ', '2', '	''Tell me,'' he said. ''How soon will they shoot me?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('554', '	''It might be a long ', '3', '	''It might be a long time,'' said O''Brien. ''You are a difficult case. But don''t give up hope. Everyone is cured sooner or later. In the end we shall shoot you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('555', '	He was much better. ', '2', '	He was much better. He was getting fatter and stronger every day. The new cell was more comfortable than the others he had been in. There was a bed and a chair to sit on. There was paper and an ink-pencil. They had given him a bath and they let him wash frequently in a metal bowl. They even gave him warm water to wash with. They had given him new overalls, pulled out the rest of his teeth and given him new false teeth. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('556', '	Weeks had passed, p ', '3', '	Weeks had passed, perhaps months. He could count time passing by his meals; he received, he thought, three meals in twenty-four hours. The food was surprisingly good, with meat every third meal. Once there was even a packet of cigarettes. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('557', '	His mind grew more  ', '5', '	His mind grew more active. He sat down on his bed, his back against the wall, and began to re-train his mind. He belonged to them now, that was agreed. As he realized now, he had given in, he had been ready to belong to them, a long time before he had made the decision. From his first moment inside the Ministry of Love - and yes, even when he and Julia stood helpless in front of the telescreen in Charrington''s room - he had understood that it had been stupid to fight against the power of the Party. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('558', '	He knew that for se ', '3', '	He knew that for seven years the Thought Police had watched him, looking down on him like an insect walking along a path. They knew everything that he had said or done. They had played his voice back to him, shown him photographs. Some of them were photographs of Julia and himself. Yes, even... He could not fight against the Party now. And why should he? The Party was right. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('559', '	He began to write,  ', '1', '	He began to write, with big child-like letters: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('560', '	TWO AND TWO MAKE FI ', '1', '	TWO AND TWO MAKE FIVE ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('561', '	And while he worked ', '1', '	And while he worked on crimestop inside his mind, he wondered when they would shoot him. They might keep him here for years, they might let him out for a short time - as they sometimes did. But one day they would shoot him. You never knew when. Often they shot you from behind, in the back of the head. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('562', '	One day - or one ni ', '2', '	One day - or one night perhaps - he had a dream. He was waiting for them to shoot him. He was out in the sunshine and he called out, ''Julia! Julia! My love! Julia!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('563', '	He lay back on the  ', '4', '	He lay back on the bed, frightened. How many years had he added to his time in this cell by shouting out her name? ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('564', '	There was the noise ', '5', '	There was the noise of boots outside. O''Brien walked into the cell. Behind him were the officer with the emotionless face and the black-uniformed guards. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('565', '	''You have had thoug ', '4', '	''You have had thoughts of betraying me,'' he said. ''That was stupid. Tell me, Winston - and tell me the truth because I will know if you are lying - tell me, what do you really think of Big Brother?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('566', '	''You hate him. Good ', '2', '	''You hate him. Good. Then the time has come for you to take the last step. You must love Big Brother.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('567', '	He pushed Winston t ', '3', '	He pushed Winston towards the guards. ''Room 101,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('568', '	Winston always knew ', '1', '	Winston always knew if the cells were high up or low down in the building. The air was different. This place was many metres underground, as deep down as it was possible to go. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('569', '	It was bigger than  ', '4', '	It was bigger than most of the cells he had been in. There were two small tables in front of him. One was a metre or two away, the other was near the door. He was tied to a chair so tightly that he could not move, not even his head. He had to look straight in front of him. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('570', '	O''Brien came in. ''Y ', '1', '	O''Brien came in. ''You asked me once,'' he said, ''what was in Room 101. I said that you knew the answer already. Everyone knows it. In Room 101 there is the worst thing in the world.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('571', '	The door opened aga ', '3', '	The door opened again. A guard came in carrying a box. There was a tube at the front of it. He put it down on the table near the door. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('572', '	''The worst thing in ', '2', '	''The worst thing in the world,'' said O''Brien, ''is different for each person. It may be death by fire, or by water, or fifty other deaths. Sometimes it is something quite small, that does not even kill you.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('573', '	He had moved to one ', '3', '	He had moved to one side and Winston could now see what was on the table. It was a big metal box and through holes in the sides he could see movement. Rats. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('574', '	''For you,'' said O''B ', '6', '	''For you,'' said O''Brien, ''the worst thing in the world is rats.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('575', '	Winston had been af ', '6', '	Winston had been afraid before, but suddenly he understood what the tube was for. He felt very, very sick. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('576', '	''You can''t do that! ', '3', '	''You can''t do that!'' he screamed. ''O''Brien! What do you want me to do?'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('577', '	''Pain alone,'' said  ', '3', '	''Pain alone,'' said O''Brien quietly, ''is not always enough. The rat,'' he continued, like a teacher giving a lesson, ''eats meat. In the poor parts of the town a mother cannot leave her baby outside because in ten minutes there will only be bones left. Rats are also very intelligent. They know when a human being is helpless.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('578', '	The rats were big a ', '6', '	The rats were big and brown, they were making little high cries, fighting with each other. O''Brien moved the box until it was a metre from Winston''s face. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('579', '	''You understand thi ', '3', '	''You understand this box and tube? One end of the tube goes into the box and the other, wider end goes over your face. When I press this switch, a door into the tube will open and the rats will run along it towards your face. Sometimes they attack the eyes first. Sometimes they eat through the face, into the tongue.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('580', '	One end of the tube ', '5', '	One end of the tube was put over his face. He could see the first rat, its face, its teeth. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('581', '	He knew there was o ', '1', '	He knew there was only one hope, one last hope. He needed to put someone else between himself and that rat. He needed to give them someone else. And he heard himself shouting, screaming, ''Do it to Julia! Do it to Julia! Not me! Julia! I don''t care what you do to her. Destroy her face, leave only bones. Not me! Julia! Not me!'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('582', '	He heard O''Brien to ', '3', '	He heard O''Brien touch the switch and knew he had closed the door to the tube, not opened it. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('583', '	The Chestnut Tree C ', '2', '	The Chestnut Tree Cafe was almost empty. It was the lonely time of fifteen hours. Music came from the telescreens now but Winston was listening for news of the war. Oceania was at war with Eurasia. Oceania had always been at war with Eurasia. He drank a glass of gin, although it tasted terrible. A waiter brought him that day''s Times. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('584', '	His finger moved on ', '5', '	His finger moved on the table. He wrote in the dust: ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('585', '	''They can''t get ins ', '4', '	''They can''t get inside you,'' she had said. But they could get inside you. And when they did, something inside you died. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('586', '	He had seen her; he ', '1', '	He had seen her; he had even spoken to her. There was no danger in it. He knew that. They took no interest in him now. They could even see each other again if either of them wanted to. But they did not want to. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('587', '	He had met her by c ', '6', '	He had met her by chance in the park on a cold day in March. She was fatter now. She had walked away from him at first. When he caught her, he put his arm round her waist but did not try to kiss her. He did not want to kiss her. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('588', '	They sat down on tw ', '3', '	They sat down on two iron chairs, not too close together. There were no telescreens here but possibly hidden microphones. It did not matter. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('589', '	''I betrayed you,'' s ', '5', '	''I betrayed you,'' she said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('590', '	''I betrayed you, to ', '5', '	''I betrayed you, too,'' he said. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('591', '	''In the end they do ', '3', '	''In the end they do something so terrible that you say "Don''t do it to me, do it to somebody else, do it to the person I love." You only care about yourself.'' ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('592', '	''You only care abou ', '2', '	''You only care about yourself,'' he had agreed. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('593', '	And he had meant it ', '5', '	And he had meant it. He had not just said it, he had wished it. He had wanted her at the end of the tube when they... ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('594', '	Something changed o ', '5', '	Something changed on the telescreen in the Chestnut Tree Cafe. The music stopped and the face of Big Brother filled the telescreen. Winston looked up at the enormous face with the moustache. Tears ran down his face and he was happy. He had won the fight with himself. He loved Big Brother. ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('595', '	Hope you have enjoy ', '2', '	Hope you have enjoyed the reading! ', '2015-12-09 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('596', '	Come back to http:/ ', '3', '	Come back to http://english-e-books.net/ to find more fascinating and exciting stories! ', '2015-12-09 00:00:00', 't', 'some image');
COMMIT;

-- ----------------------------
-- Table structure for tbrole
-- ----------------------------
DROP TABLE IF EXISTS "tbrole";
CREATE TABLE "tbrole" (
"id" int4 DEFAULT nextval('tbrole_id_seq'::regclass) NOT NULL,
"role" varchar(20) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbrole
-- ----------------------------
BEGIN;
INSERT INTO "tbrole" VALUES ('1', 'ROLE_ADMIN');
INSERT INTO "tbrole" VALUES ('2', 'ROLE_AUTHOR');
COMMIT;

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS "tbuser";
CREATE TABLE "tbuser" (
"id" int4 DEFAULT nextval('tbuser_id_seq'::regclass) NOT NULL,
"username" varchar COLLATE "default" NOT NULL,
"password" varchar COLLATE "default" NOT NULL,
"enable" bool NOT NULL,
"email" varchar COLLATE "default",
"address" varchar COLLATE "default",
"phone" varchar COLLATE "default",
"name" varchar COLLATE "default",
"gender" varchar COLLATE "default",
"image" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
BEGIN;
INSERT INTO "tbuser" VALUES ('1', 'admin', '1', 't', 'admin@gmail.com', 'btb', '3452', 'admin00', 'm', 'default.jpg');
INSERT INTO "tbuser" VALUES ('2', 'author', '1', 't', 'author@gmail.com', 'sr', '2322', 'author00', 'f', 'default.jpg');
INSERT INTO "tbuser" VALUES ('3', 'admin1', '1', 't', 'admin1@gmail.com', 'pp', '8313', 'admin01', 'm', 'default.jpg');
INSERT INTO "tbuser" VALUES ('4', 'user1', '1', 'f', 'admin1@gmail.com', 'pp', '8331', 'author01', 'm', 'default.jpg');
INSERT INTO "tbuser" VALUES ('5', 'admin2', '1', 'f', 'admin2@gmail.com', 'sr', '2242', 'admin02', 'f', 'default.jpg');
INSERT INTO "tbuser" VALUES ('6', 'author2', '1', 't', 'author2@gmail.com', 'sr', '2342', 'author02', 'f', 'default.jpg');
INSERT INTO "tbuser" VALUES ('7', '23', '253434', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('10', 'string', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('12', 'st2ring', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('14', 'st23ring', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('16', 'st23r33ing', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('17', 'ddddddddddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('19', 'dddddddddddddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('20', 'dddddddddddddddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('21', 'dddddaddddddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('22', 'dd3333dddaddddddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('25', 'dd3333ddda3ddddddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('27', 'dd3333ddda3dddd5ddddd', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('28', 'strgaying', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('30', 'klit', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('31', 'klit1', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('32', 'klit11', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('33', 'klit111', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('34', 'klit3111', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('35', 'klit3d111', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('37', 'klitkj3d111', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
INSERT INTO "tbuser" VALUES ('38', 'klitkj34d111', 'string', 't', 'string', 'string', 'string', 'string', 'string', 'string');
COMMIT;

-- ----------------------------
-- Table structure for tbuser_role
-- ----------------------------
DROP TABLE IF EXISTS "tbuser_role";
CREATE TABLE "tbuser_role" (
"id" int4 NOT NULL,
"user_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbuser_role
-- ----------------------------
BEGIN;
INSERT INTO "tbuser_role" VALUES ('1', '1');
INSERT INTO "tbuser_role" VALUES ('1', '3');
INSERT INTO "tbuser_role" VALUES ('1', '4');
INSERT INTO "tbuser_role" VALUES ('1', '5');
INSERT INTO "tbuser_role" VALUES ('1', '6');
INSERT INTO "tbuser_role" VALUES ('1', '25');
INSERT INTO "tbuser_role" VALUES ('1', '27');
INSERT INTO "tbuser_role" VALUES ('1', '28');
INSERT INTO "tbuser_role" VALUES ('1', '31');
INSERT INTO "tbuser_role" VALUES ('1', '32');
INSERT INTO "tbuser_role" VALUES ('1', '33');
INSERT INTO "tbuser_role" VALUES ('1', '34');
INSERT INTO "tbuser_role" VALUES ('2', '2');
INSERT INTO "tbuser_role" VALUES ('2', '4');
INSERT INTO "tbuser_role" VALUES ('2', '6');
INSERT INTO "tbuser_role" VALUES ('2', '31');
COMMIT;

-- ----------------------------
-- View structure for v_get_user_roles
-- ----------------------------
CREATE OR REPLACE VIEW "v_get_user_roles" AS 
 SELECT a.id,
    c.role
   FROM ((tbuser a
   JOIN tbuser_role b ON ((a.id = b.user_id)))
   JOIN tbrole c ON ((b.id = c.id)));

-- ----------------------------
-- View structure for v_list_all_article
-- ----------------------------
CREATE OR REPLACE VIEW "v_list_all_article" AS 
 SELECT tbarticle.id,
    tbarticle.title,
    tbarticle.publish_date,
    tbarticle.enable,
    tbarticle.image,
    tbarticle.content,
    tbarticle.userid,
    tbuser.name
   FROM (tbarticle
   JOIN tbuser ON ((tbarticle.userid = tbuser.id)));

-- ----------------------------
-- View structure for v_login_user_role
-- ----------------------------
CREATE OR REPLACE VIEW "v_login_user_role" AS 
 SELECT a.username,
    c.role
   FROM ((tbuser a
   JOIN tbuser_role b ON ((a.id = b.user_id)))
   JOIN tbrole c ON ((b.id = c.id)));

-- ----------------------------
-- Function structure for f_list_article
-- ----------------------------
CREATE OR REPLACE FUNCTION "f_list_article"(int4, int4)
  RETURNS "pg_catalog"."json" AS $BODY$ SELECT
	array_to_json (ARRAY_AGG(row_to_json(T)))
FROM
	(
		SELECT tbarticle.id,
    tbarticle.title,
    tbarticle.publish_date,
    tbarticle.enable,
    tbarticle.image,
    tbarticle.content,
    tbarticle.userid,
    tbuser.name
   FROM (tbarticle
   JOIN tbuser ON ((tbarticle.userid = tbuser.id)))
   	ORDER BY ID
		LIMIT $1 OFFSET $2
	) T ; $BODY$
  LANGUAGE 'sql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for search_article_content
-- ----------------------------
CREATE OR REPLACE FUNCTION "search_article_content"(keyword varchar, lm int4, o int4)
  RETURNS SETOF "public"."v_list_all_article" AS $BODY$
BEGIN
  RETURN QUERY  SELECT
*
  FROM
    v_list_all_article
  WHERE
    LOWER(CONTENT) LIKE LOWER('%' || keyword || '%')
  ORDER BY
    ID
  LIMIT lm OFFSET o ;
  END $BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
 ROWS 1000
;

-- ----------------------------
-- Function structure for search_article_content_json
-- ----------------------------
CREATE OR REPLACE FUNCTION "search_article_content_json"(keyword varchar, lm int4, o int4)
  RETURNS "pg_catalog"."json" AS $BODY$
SELECT
    array_to_json (ARRAY_AGG(row_to_json(T)))
  FROM
    (
      SELECT
        ID,
        title,
        userid,
        CONTENT,
        publish_date,
        ENABLE,
        image,
        name
      FROM
        v_list_all_article
      WHERE
        LOWER(CONTENT) LIKE LOWER('%' || keyword || '%')
      ORDER BY
        ID
      LIMIT lm OFFSET o
    ) T ;
$BODY$
  LANGUAGE 'sql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for search_article_title
-- ----------------------------
CREATE OR REPLACE FUNCTION "search_article_title"(keyword varchar, lm int4, o int4)
  RETURNS SETOF "public"."v_list_all_article" AS $BODY$
BEGIN
  RETURN QUERY  SELECT
*
  FROM
    v_list_all_article
  WHERE
    LOWER(TITLE) LIKE LOWER('%' || keyword || '%')
  ORDER BY
    ID
  LIMIT lm OFFSET o ;
  END $BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
 ROWS 1000
;

-- ----------------------------
-- Function structure for search_article_title_json
-- ----------------------------
CREATE OR REPLACE FUNCTION "search_article_title_json"(keyword varchar, lm int4, o int4)
  RETURNS "pg_catalog"."json" AS $BODY$
SELECT
    array_to_json (ARRAY_AGG(row_to_json(T)))
  FROM
    (
      SELECT
        ID,
        title,
        userid,
        CONTENT,
        publish_date,
        ENABLE,
        image,
        name
      FROM
        v_list_all_article
      WHERE
        LOWER(CONTENT) LIKE LOWER('%' || keyword || '%')
      ORDER BY
        ID
      LIMIT lm OFFSET o
    ) T ;
$BODY$
  LANGUAGE 'sql' VOLATILE COST 100
;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "tbarticle_id_seq" OWNED BY "tbarticle"."id";
ALTER SEQUENCE "tbrole_id_seq" OWNED BY "tbrole"."id";
ALTER SEQUENCE "tbuser_id_seq" OWNED BY "tbuser"."id";

-- ----------------------------
-- Primary Key structure for table tbarticle
-- ----------------------------
ALTER TABLE "tbarticle" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbrole
-- ----------------------------
ALTER TABLE "tbrole" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table tbuser
-- ----------------------------
ALTER TABLE "tbuser" ADD UNIQUE ("username");

-- ----------------------------
-- Primary Key structure for table tbuser
-- ----------------------------
ALTER TABLE "tbuser" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tbuser_role
-- ----------------------------
ALTER TABLE "tbuser_role" ADD PRIMARY KEY ("id", "user_id");

-- ----------------------------
-- Foreign Key structure for table "tbarticle"
-- ----------------------------
ALTER TABLE "tbarticle" ADD FOREIGN KEY ("userid") REFERENCES "tbuser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbuser_role"
-- ----------------------------
ALTER TABLE "tbuser_role" ADD FOREIGN KEY ("user_id") REFERENCES "tbuser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbuser_role" ADD FOREIGN KEY ("id") REFERENCES "tbrole" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

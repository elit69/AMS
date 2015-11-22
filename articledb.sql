/*
Navicat PGSQL Data Transfer

Source Server         : Spring
Source Server Version : 90303
Source Host           : localhost:5432
Source Database       : articledb
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90303
File Encoding         : 65001

Date: 2015-11-18 17:05:48
*/


-- ----------------------------
-- Sequence structure for tbarticle_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbarticle_id_seq" CASCADE;
CREATE SEQUENCE "tbarticle_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 20
 CACHE 1;
SELECT setval('"public"."tbarticle_id_seq"', 20, true);

-- ----------------------------
-- Sequence structure for tbrole_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbrole_id_seq" CASCADE;
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
DROP SEQUENCE IF EXISTS "tbuser_id_seq" CASCADE;
CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 6
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 6, true);

-- ----------------------------
-- Table structure for tbarticle
-- ----------------------------
DROP TABLE IF EXISTS "tbarticle" CASCADE;
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
INSERT INTO "tbarticle" VALUES ('1', 'The Pr', '2', 'The Project Gutenberg EBook of War and Peace, by Leo Tolstoy', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('2', 'This e', '3', 'This eBook is for the use of anyone anywhere at no cost and with almost', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('3', 'no res', '1', 'no restrictions whatsoever.  You may copy it, give it away or re-use it', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('4', 'under ', '4', 'under the terms of the Project Gutenberg License included with this', '2015-11-17 00:00:00', 't', 'some image');
INSERT INTO "tbarticle" VALUES ('5', 'eBook ', '1', 'eBook or online at www.gutenberg.org', '2015-11-17 00:00:00', 't', 'some image');
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
COMMIT;

-- ----------------------------
-- Table structure for tbrole
-- ----------------------------
DROP TABLE IF EXISTS "tbrole" CASCADE;
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
DROP TABLE IF EXISTS "tbuser" CASCADE;
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
INSERT INTO "tbuser" VALUES ('6', 'author2', '1', 'f', 'author2@gmail.com', 'sr', '2342', 'author02', 'f', 'default.jpg');
COMMIT;

-- ----------------------------
-- Table structure for tbuser_role
-- ----------------------------
DROP TABLE IF EXISTS "tbuser_role" CASCADE;
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
INSERT INTO "tbuser_role" VALUES ('1', '5');
INSERT INTO "tbuser_role" VALUES ('2', '2');
INSERT INTO "tbuser_role" VALUES ('2', '4');
INSERT INTO "tbuser_role" VALUES ('2', '6');
COMMIT;
-- ----------------------------
-- View structure for v_article
-- ----------------------------
CREATE OR REPLACE VIEW "v_article" AS 
 SELECT art.id,
    art.title,
    us.name,
    art.content,
    art.publish_date,
    art.image
   FROM (tbarticle art
   JOIN tbuser us ON ((art.userid = us.id)))
  WHERE (art.enable = true) AND (us.enable = true);

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

CREATE VIEW "public"."v_login_user_role" AS 
 SELECT a.username,
    c.role
   FROM ((tbuser a
     JOIN tbuser_role b ON ((a.id = b.user_id)))
     JOIN tbrole c ON ((b.id = c.id)));;

ALTER TABLE "public"."v_login_user_role" OWNER TO "postgres";


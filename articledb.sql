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

Date: 2015-11-17 08:36:22
*/


-- ----------------------------
-- Sequence structure for tbarticle_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbarticle_id_seq";
CREATE SEQUENCE "tbarticle_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 14
 CACHE 1;
SELECT setval('"public"."tbarticle_id_seq"', 14, true);

-- ----------------------------
-- Sequence structure for tbrole_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "tbrole_id_seq";
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
DROP SEQUENCE IF EXISTS "tbuser_id_seq";
CREATE SEQUENCE "tbuser_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 13
 CACHE 1;
SELECT setval('"public"."tbuser_id_seq"', 13, true);

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
INSERT INTO "tbarticle" VALUES ('1', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('2', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('3', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('4', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('5', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('6', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('7', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('8', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('9', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('10', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('11', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('12', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('13', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
INSERT INTO "tbarticle" VALUES ('14', 'sdf', '1', 'sdf', '2010-02-01 00:00:00', 't', null);
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
INSERT INTO "tbuser" VALUES ('1', 'admin', '1', 't', null, null, null, null, null, null);
INSERT INTO "tbuser" VALUES ('2', 'author', '1', 't', null, null, null, null, null, null);
INSERT INTO "tbuser" VALUES ('13', 'user', '1', 't', null, null, null, null, null, null);
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
INSERT INTO "tbuser_role" VALUES ('1', '2');
COMMIT;

-- ----------------------------
-- View structure for v_list_all_article
-- ----------------------------
CREATE OR REPLACE VIEW "v_list_all_article" AS 
 SELECT tbarticle.id,
    tbarticle.title,
    tbuser.name,
    tbarticle.publish_date,
    tbarticle.enable,
    tbarticle.image,
    tbarticle.content
   FROM (tbarticle
   JOIN tbuser ON ((tbarticle.userid = tbuser.id)));

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

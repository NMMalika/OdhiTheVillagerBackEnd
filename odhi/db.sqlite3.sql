BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "odhi_album" (
	"id"	integer NOT NULL,
	"title"	varchar(255) NOT NULL,
	"description"	text,
	"cover_image"	varchar(100) NOT NULL,
	"SoundCloud"	varchar(200) NOT NULL,
	"release_date"	date NOT NULL,
	"apple_music_link"	varchar(200),
	"boomplay_link"	varchar(200),
	"hustlesasa_link"	varchar(200),
	"spotify_link"	varchar(200),
	"youtube_link"	varchar(200),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_blogs" (
	"id"	integer NOT NULL,
	"blog_image"	varchar(100),
	"category"	varchar(100),
	"title"	varchar(255) NOT NULL,
	"author"	varchar(100) NOT NULL,
	"created_at"	datetime NOT NULL,
	"link"	varchar(200),
	"content"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_comment" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"blog_id"	bigint NOT NULL,
	"approved"	bool NOT NULL,
	"comment"	text NOT NULL,
	"created_at"	datetime NOT NULL,
	"phone_number"	varchar(15),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("blog_id") REFERENCES "odhi_blogs"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "odhi_eventmusic" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"artist"	varchar(100) NOT NULL,
	"cover_image"	varchar(100) NOT NULL,
	"preview_duration"	integer NOT NULL,
	"audio_file"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_eventtype" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"icon"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_faq" (
	"id"	integer NOT NULL,
	"question"	varchar(255) NOT NULL,
	"answer"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_generalinfo" (
	"id"	integer NOT NULL,
	"email"	varchar(100) NOT NULL,
	"phone"	varchar(15) NOT NULL,
	"facebook"	varchar(200),
	"instagram"	varchar(200),
	"twitter"	varchar(200),
	"linkedin"	varchar(200),
	"youtube"	varchar(200),
	"logo"	varchar(100),
	"location"	varchar(100),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_hero" (
	"id"	integer NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"image"	varchar(100),
	"youtube_link"	varchar(200),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_historicaleventtype" (
	"id"	bigint NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"icon"	varchar(100) NOT NULL,
	"history_id"	integer NOT NULL,
	"history_date"	datetime NOT NULL,
	"history_change_reason"	varchar(100),
	"history_type"	varchar(1) NOT NULL,
	"history_user_id"	integer,
	PRIMARY KEY("history_id" AUTOINCREMENT),
	FOREIGN KEY("history_user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "odhi_historicalgeneralinfo" (
	"id"	bigint NOT NULL,
	"logo"	text,
	"location"	varchar(100),
	"email"	varchar(100) NOT NULL,
	"phone"	varchar(15) NOT NULL,
	"facebook"	varchar(200),
	"instagram"	varchar(200),
	"twitter"	varchar(200),
	"linkedin"	varchar(200),
	"youtube"	varchar(200),
	"history_id"	integer NOT NULL,
	"history_date"	datetime NOT NULL,
	"history_change_reason"	varchar(100),
	"history_type"	varchar(1) NOT NULL,
	"history_user_id"	integer,
	PRIMARY KEY("history_id" AUTOINCREMENT),
	FOREIGN KEY("history_user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "odhi_historicalhero" (
	"id"	bigint NOT NULL,
	"title"	varchar(100) NOT NULL,
	"description"	text NOT NULL,
	"image"	text,
	"youtube_link"	varchar(200),
	"history_id"	integer NOT NULL,
	"history_date"	datetime NOT NULL,
	"history_change_reason"	varchar(100),
	"history_type"	varchar(1) NOT NULL,
	"history_user_id"	integer,
	PRIMARY KEY("history_id" AUTOINCREMENT),
	FOREIGN KEY("history_user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "odhi_latesttrack" (
	"id"	integer NOT NULL,
	"title"	varchar(255) NOT NULL,
	"artist"	varchar(255) NOT NULL,
	"cover_image"	varchar(100) NOT NULL,
	"audio_preview"	varchar(100),
	"buy_link"	varchar(200) NOT NULL,
	"created_at"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_newslettersubscriber" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"email"	varchar(254) NOT NULL UNIQUE,
	"subscribed_at"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_othervideo" (
	"id"	integer NOT NULL,
	"title"	varchar(255) NOT NULL,
	"caption"	varchar(255) NOT NULL,
	"youtube_link"	varchar(200) NOT NULL,
	"artist"	varchar(100) NOT NULL,
	"year"	varchar(10) NOT NULL,
	"created_at"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "odhi_subscriber" (
	"id"	integer NOT NULL,
	"email"	varchar(254) NOT NULL UNIQUE,
	"date_subscribed"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_generalinfo','Can add generalinfo');
INSERT INTO "auth_permission" VALUES (26,7,'change_generalinfo','Can change generalinfo');
INSERT INTO "auth_permission" VALUES (27,7,'delete_generalinfo','Can delete generalinfo');
INSERT INTO "auth_permission" VALUES (28,7,'view_generalinfo','Can view generalinfo');
INSERT INTO "auth_permission" VALUES (29,8,'add_historicalgeneralinfo','Can add historical General Info');
INSERT INTO "auth_permission" VALUES (30,8,'change_historicalgeneralinfo','Can change historical General Info');
INSERT INTO "auth_permission" VALUES (31,8,'delete_historicalgeneralinfo','Can delete historical General Info');
INSERT INTO "auth_permission" VALUES (32,8,'view_historicalgeneralinfo','Can view historical General Info');
INSERT INTO "auth_permission" VALUES (33,9,'add_hero','Can add Hero');
INSERT INTO "auth_permission" VALUES (34,9,'change_hero','Can change Hero');
INSERT INTO "auth_permission" VALUES (35,9,'delete_hero','Can delete Hero');
INSERT INTO "auth_permission" VALUES (36,9,'view_hero','Can view Hero');
INSERT INTO "auth_permission" VALUES (37,10,'add_historicalhero','Can add historical Hero');
INSERT INTO "auth_permission" VALUES (38,10,'change_historicalhero','Can change historical Hero');
INSERT INTO "auth_permission" VALUES (39,10,'delete_historicalhero','Can delete historical Hero');
INSERT INTO "auth_permission" VALUES (40,10,'view_historicalhero','Can view historical Hero');
INSERT INTO "auth_permission" VALUES (41,11,'add_othervideo','Can add Other Video');
INSERT INTO "auth_permission" VALUES (42,11,'change_othervideo','Can change Other Video');
INSERT INTO "auth_permission" VALUES (43,11,'delete_othervideo','Can delete Other Video');
INSERT INTO "auth_permission" VALUES (44,11,'view_othervideo','Can view Other Video');
INSERT INTO "auth_permission" VALUES (45,12,'add_historicalothervideo','Can add historical Other Video');
INSERT INTO "auth_permission" VALUES (46,12,'change_historicalothervideo','Can change historical Other Video');
INSERT INTO "auth_permission" VALUES (47,12,'delete_historicalothervideo','Can delete historical Other Video');
INSERT INTO "auth_permission" VALUES (48,12,'view_historicalothervideo','Can view historical Other Video');
INSERT INTO "auth_permission" VALUES (49,13,'add_eventtype','Can add Event Type');
INSERT INTO "auth_permission" VALUES (50,13,'change_eventtype','Can change Event Type');
INSERT INTO "auth_permission" VALUES (51,13,'delete_eventtype','Can delete Event Type');
INSERT INTO "auth_permission" VALUES (52,13,'view_eventtype','Can view Event Type');
INSERT INTO "auth_permission" VALUES (53,14,'add_historicaleventtype','Can add historical Event Type');
INSERT INTO "auth_permission" VALUES (54,14,'change_historicaleventtype','Can change historical Event Type');
INSERT INTO "auth_permission" VALUES (55,14,'delete_historicaleventtype','Can delete historical Event Type');
INSERT INTO "auth_permission" VALUES (56,14,'view_historicaleventtype','Can view historical Event Type');
INSERT INTO "auth_permission" VALUES (57,15,'add_eventmusic','Can add Event Music');
INSERT INTO "auth_permission" VALUES (58,15,'change_eventmusic','Can change Event Music');
INSERT INTO "auth_permission" VALUES (59,15,'delete_eventmusic','Can delete Event Music');
INSERT INTO "auth_permission" VALUES (60,15,'view_eventmusic','Can view Event Music');
INSERT INTO "auth_permission" VALUES (61,16,'add_historicaleventmusic','Can add historical Event Music');
INSERT INTO "auth_permission" VALUES (62,16,'change_historicaleventmusic','Can change historical Event Music');
INSERT INTO "auth_permission" VALUES (63,16,'delete_historicaleventmusic','Can delete historical Event Music');
INSERT INTO "auth_permission" VALUES (64,16,'view_historicaleventmusic','Can view historical Event Music');
INSERT INTO "auth_permission" VALUES (65,17,'add_latesttrack','Can add Latest Track');
INSERT INTO "auth_permission" VALUES (66,17,'change_latesttrack','Can change Latest Track');
INSERT INTO "auth_permission" VALUES (67,17,'delete_latesttrack','Can delete Latest Track');
INSERT INTO "auth_permission" VALUES (68,17,'view_latesttrack','Can view Latest Track');
INSERT INTO "auth_permission" VALUES (69,18,'add_album','Can add Album');
INSERT INTO "auth_permission" VALUES (70,18,'change_album','Can change Album');
INSERT INTO "auth_permission" VALUES (71,18,'delete_album','Can delete Album');
INSERT INTO "auth_permission" VALUES (72,18,'view_album','Can view Album');
INSERT INTO "auth_permission" VALUES (73,19,'add_faq','Can add FAQ');
INSERT INTO "auth_permission" VALUES (74,19,'change_faq','Can change FAQ');
INSERT INTO "auth_permission" VALUES (75,19,'delete_faq','Can delete FAQ');
INSERT INTO "auth_permission" VALUES (76,19,'view_faq','Can view FAQ');
INSERT INTO "auth_permission" VALUES (77,20,'add_subscriber','Can add subscriber');
INSERT INTO "auth_permission" VALUES (78,20,'change_subscriber','Can change subscriber');
INSERT INTO "auth_permission" VALUES (79,20,'delete_subscriber','Can delete subscriber');
INSERT INTO "auth_permission" VALUES (80,20,'view_subscriber','Can view subscriber');
INSERT INTO "auth_permission" VALUES (81,21,'add_blogs','Can add Blog');
INSERT INTO "auth_permission" VALUES (82,21,'change_blogs','Can change Blog');
INSERT INTO "auth_permission" VALUES (83,21,'delete_blogs','Can delete Blog');
INSERT INTO "auth_permission" VALUES (84,21,'view_blogs','Can view Blog');
INSERT INTO "auth_permission" VALUES (85,22,'add_newslettersubscriber','Can add newsletter subscriber');
INSERT INTO "auth_permission" VALUES (86,22,'change_newslettersubscriber','Can change newsletter subscriber');
INSERT INTO "auth_permission" VALUES (87,22,'delete_newslettersubscriber','Can delete newsletter subscriber');
INSERT INTO "auth_permission" VALUES (88,22,'view_newslettersubscriber','Can view newsletter subscriber');
INSERT INTO "auth_permission" VALUES (89,23,'add_comment','Can add comment');
INSERT INTO "auth_permission" VALUES (90,23,'change_comment','Can change comment');
INSERT INTO "auth_permission" VALUES (91,23,'delete_comment','Can delete comment');
INSERT INTO "auth_permission" VALUES (92,23,'view_comment','Can view comment');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$720000$iAcRbBcrRhNhDrY9qBcpGf$hCiDm4/Fd0q/mchJq4obP8kqIG/+Uqh+BsYOXyhaF1U=','2025-08-09 18:01:32.969943',1,'Nim','','rodlinya@gmail.com',1,1,'2025-07-14 15:53:11.855399','');
INSERT INTO "django_admin_log" VALUES (1,'1','General Info',1,'[{"added": {}}]',7,1,'2025-07-18 09:08:30.624046');
INSERT INTO "django_admin_log" VALUES (2,'1','General Info',3,'',7,1,'2025-07-18 09:34:28.946067');
INSERT INTO "django_admin_log" VALUES (3,'2','General Info',1,'[{"added": {}}]',7,1,'2025-07-18 09:34:51.743313');
INSERT INTO "django_admin_log" VALUES (4,'1','My Love',1,'[{"added": {}}]',9,1,'2025-07-21 07:55:46.156026');
INSERT INTO "django_admin_log" VALUES (5,'1','My Love',1,'[{"added": {}}]',11,1,'2025-07-21 08:45:20.948735');
INSERT INTO "django_admin_log" VALUES (6,'2','mwlo',1,'[{"added": {}}]',11,1,'2025-07-21 08:46:31.142132');
INSERT INTO "django_admin_log" VALUES (7,'2','mwlo',2,'[{"changed": {"fields": ["Thumbnail"]}}]',11,1,'2025-07-21 10:04:19.035581');
INSERT INTO "django_admin_log" VALUES (8,'2','Mwolo',2,'[{"changed": {"fields": ["Title", "Youtube link"]}}]',11,1,'2025-07-23 15:41:43.424053');
INSERT INTO "django_admin_log" VALUES (9,'1','Wadagi',2,'[{"changed": {"fields": ["Title", "Caption", "Youtube link"]}}]',11,1,'2025-07-23 15:43:29.712458');
INSERT INTO "django_admin_log" VALUES (10,'1','Wadagi',2,'[{"changed": {"fields": ["Caption"]}}]',11,1,'2025-07-23 15:45:48.604778');
INSERT INTO "django_admin_log" VALUES (11,'2','Mwolo',2,'[{"changed": {"fields": ["Caption"]}}]',11,1,'2025-07-23 15:46:51.092671');
INSERT INTO "django_admin_log" VALUES (12,'2','Mwolo',2,'[{"changed": {"fields": ["Caption"]}}]',11,1,'2025-07-23 15:47:44.421029');
INSERT INTO "django_admin_log" VALUES (13,'3','My Love',1,'[{"added": {}}]',11,1,'2025-07-23 15:50:00.550359');
INSERT INTO "django_admin_log" VALUES (14,'1','Wedding',1,'[{"added": {}}]',13,1,'2025-07-23 19:49:55.216239');
INSERT INTO "django_admin_log" VALUES (15,'2','Clubs and bar',1,'[{"added": {}}]',13,1,'2025-07-23 19:54:28.430692');
INSERT INTO "django_admin_log" VALUES (16,'3','Corporate events',1,'[{"added": {}}]',13,1,'2025-07-23 19:55:49.882280');
INSERT INTO "django_admin_log" VALUES (17,'4','Live Events',1,'[{"added": {}}]',13,1,'2025-07-23 19:56:46.461413');
INSERT INTO "django_admin_log" VALUES (18,'1','Odhi the villager experience - Odhi The Villager',1,'[{"added": {}}]',15,1,'2025-07-25 07:57:41.434354');
INSERT INTO "django_admin_log" VALUES (19,'1','Odhi the villager experience - Odhi The Villager',2,'[{"changed": {"fields": ["Youtube link"]}}]',15,1,'2025-07-25 08:03:20.223991');
INSERT INTO "django_admin_log" VALUES (20,'1','Odhi the villager experience - Odhi The Villager',2,'[{"changed": {"fields": ["Audio file", "Cover image"]}}]',15,1,'2025-07-26 07:44:33.860679');
INSERT INTO "django_admin_log" VALUES (21,'1','Wedding',2,'[{"changed": {"fields": ["Icon"]}}]',13,1,'2025-07-26 08:34:25.842611');
INSERT INTO "django_admin_log" VALUES (22,'1','Wedding',2,'[{"changed": {"fields": ["Icon"]}}]',13,1,'2025-07-26 08:36:42.267656');
INSERT INTO "django_admin_log" VALUES (23,'1','Alam mar Duondwa - Odhi The Villager',1,'[{"added": {}}]',17,1,'2025-07-26 09:05:31.692637');
INSERT INTO "django_admin_log" VALUES (24,'2','S.U.R - Odhi The Villager',1,'[{"added": {}}]',17,1,'2025-07-26 09:07:42.781365');
INSERT INTO "django_admin_log" VALUES (25,'3','Onyale - Odhi The Villager',1,'[{"added": {}}]',17,1,'2025-07-26 09:11:25.596693');
INSERT INTO "django_admin_log" VALUES (26,'1','The Village Experience 4',1,'[{"added": {}}]',18,1,'2025-07-26 13:14:09.613703');
INSERT INTO "django_admin_log" VALUES (27,'3','Onyale - Odhi The Villager',2,'[]',17,1,'2025-07-26 13:37:38.630214');
INSERT INTO "django_admin_log" VALUES (28,'1','How can I book you for a performance or event?',1,'[{"added": {}}]',19,1,'2025-07-26 13:58:39.308738');
INSERT INTO "django_admin_log" VALUES (29,'2','Are you available for interviews (TV, radio, podcast)?',1,'[{"added": {}}]',19,1,'2025-07-26 13:59:13.560287');
INSERT INTO "django_admin_log" VALUES (30,'3','Can I collaborate with you on a Benga project?',1,'[{"added": {}}]',19,1,'2025-07-29 07:44:22.152217');
INSERT INTO "django_admin_log" VALUES (31,'4','Do you collaborate with artists from other genres (Afrobeat, Hip-Hop, Reggae, etc.)?',1,'[{"added": {}}]',19,1,'2025-07-29 07:44:52.305659');
INSERT INTO "django_admin_log" VALUES (32,'5','Are you open to performing at cultural festivals or private events?',1,'[{"added": {}}]',19,1,'2025-07-29 07:45:44.160571');
INSERT INTO "django_admin_log" VALUES (33,'6','How do I stay updated on your latest releases and events?',1,'[{"added": {}}]',19,1,'2025-07-29 07:46:16.185961');
INSERT INTO "django_admin_log" VALUES (34,'1','S.U.R',2,'[{"changed": {"fields": ["Title"]}}]',9,1,'2025-07-30 10:52:01.917558');
INSERT INTO "django_admin_log" VALUES (35,'4','GEN FRANCIS OMONDI OGOLLA _ RIP',1,'[{"added": {}}]',11,1,'2025-07-30 10:55:56.765806');
INSERT INTO "django_admin_log" VALUES (36,'2','General Info',2,'[{"changed": {"fields": ["Email"]}}]',7,1,'2025-07-30 10:58:08.412675');
INSERT INTO "django_admin_log" VALUES (37,'2','General Info',2,'[{"changed": {"fields": ["Email"]}}]',7,1,'2025-07-30 10:58:36.827662');
INSERT INTO "django_admin_log" VALUES (38,'1','Benga Music story telling',1,'[{"added": {}}]',21,1,'2025-07-31 14:44:20.316730');
INSERT INTO "django_admin_log" VALUES (39,'1','Benga Music story telling',2,'[{"changed": {"fields": ["Link"]}}]',21,1,'2025-07-31 16:58:50.459571');
INSERT INTO "django_admin_log" VALUES (40,'1','Benga Music story telling',2,'[]',21,1,'2025-08-01 09:38:01.055185');
INSERT INTO "django_admin_log" VALUES (41,'2','STORY BEHIND THE SONG. ISANDA',1,'[{"added": {}}]',21,1,'2025-08-02 10:20:51.111502');
INSERT INTO "django_admin_log" VALUES (42,'1','Nimrod Mulinya - nice article',2,'[{"changed": {"fields": ["Approved"]}}]',23,1,'2025-08-08 07:36:42.478735');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'odhi','generalinfo');
INSERT INTO "django_content_type" VALUES (8,'odhi','historicalgeneralinfo');
INSERT INTO "django_content_type" VALUES (9,'odhi','hero');
INSERT INTO "django_content_type" VALUES (10,'odhi','historicalhero');
INSERT INTO "django_content_type" VALUES (11,'odhi','othervideo');
INSERT INTO "django_content_type" VALUES (12,'odhi','historicalothervideo');
INSERT INTO "django_content_type" VALUES (13,'odhi','eventtype');
INSERT INTO "django_content_type" VALUES (14,'odhi','historicaleventtype');
INSERT INTO "django_content_type" VALUES (15,'odhi','eventmusic');
INSERT INTO "django_content_type" VALUES (16,'odhi','historicaleventmusic');
INSERT INTO "django_content_type" VALUES (17,'odhi','latesttrack');
INSERT INTO "django_content_type" VALUES (18,'odhi','album');
INSERT INTO "django_content_type" VALUES (19,'odhi','faq');
INSERT INTO "django_content_type" VALUES (20,'odhi','subscriber');
INSERT INTO "django_content_type" VALUES (21,'odhi','blogs');
INSERT INTO "django_content_type" VALUES (22,'odhi','newslettersubscriber');
INSERT INTO "django_content_type" VALUES (23,'odhi','comment');
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2025-07-14 08:05:06.290790');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2025-07-14 08:05:06.972144');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2025-07-14 08:05:07.571702');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2025-07-14 08:05:07.741710');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2025-07-14 08:05:07.951426');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2025-07-14 08:05:08.247873');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2025-07-14 08:05:08.825975');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2025-07-14 08:05:09.176295');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2025-07-14 08:05:09.580748');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2025-07-14 08:05:09.855441');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2025-07-14 08:05:10.029503');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2025-07-14 08:05:10.196006');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2025-07-14 08:05:10.353464');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2025-07-14 08:05:10.519880');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2025-07-14 08:05:10.693666');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2025-07-14 08:05:10.876127');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2025-07-14 08:05:11.033632');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2025-07-14 08:05:11.369273');
INSERT INTO "django_migrations" VALUES (19,'odhi','0001_initial','2025-07-17 12:20:06.895701');
INSERT INTO "django_migrations" VALUES (20,'odhi','0002_remove_generalinfo_name_generalinfo_logo_and_more','2025-07-17 15:47:46.002506');
INSERT INTO "django_migrations" VALUES (21,'odhi','0003_alter_generalinfo_options','2025-07-17 16:26:06.701595');
INSERT INTO "django_migrations" VALUES (22,'odhi','0004_historicalgeneralinfo','2025-07-18 11:01:25.349735');
INSERT INTO "django_migrations" VALUES (23,'odhi','0005_hero_historicalhero','2025-07-21 07:32:29.154361');
INSERT INTO "django_migrations" VALUES (24,'odhi','0006_rename_name_hero_title_and_more','2025-07-21 07:35:24.631835');
INSERT INTO "django_migrations" VALUES (25,'odhi','0007_othervideo_historicalothervideo','2025-07-21 08:34:10.127567');
INSERT INTO "django_migrations" VALUES (26,'odhi','0008_remove_othervideo_thumbnail_and_more','2025-07-21 10:48:44.357985');
INSERT INTO "django_migrations" VALUES (27,'odhi','0009_alter_othervideo_caption_alter_othervideo_title_and_more','2025-07-22 14:01:04.454541');
INSERT INTO "django_migrations" VALUES (28,'odhi','0010_othervideo_artist_othervideo_year_and_more','2025-07-23 15:37:51.930168');
INSERT INTO "django_migrations" VALUES (29,'odhi','0011_eventtype_historicaleventtype','2025-07-23 16:15:33.935813');
INSERT INTO "django_migrations" VALUES (30,'odhi','0012_eventmusic_remove_eventtype_audio_file_and_more','2025-07-23 19:40:09.086079');
INSERT INTO "django_migrations" VALUES (31,'odhi','0013_remove_eventmusic_audio_file_and_more','2025-07-25 07:53:07.966249');
INSERT INTO "django_migrations" VALUES (32,'odhi','0014_remove_eventmusic_youtube_link_eventmusic_audio_file_and_more','2025-07-26 06:55:28.696679');
INSERT INTO "django_migrations" VALUES (33,'odhi','0015_latesttrack','2025-07-26 09:01:00.727309');
INSERT INTO "django_migrations" VALUES (34,'odhi','0016_album','2025-07-26 11:58:39.940154');
INSERT INTO "django_migrations" VALUES (35,'odhi','0017_rename_album_link_album_soundcloud_and_more','2025-07-26 12:25:30.852016');
INSERT INTO "django_migrations" VALUES (36,'odhi','0018_alter_album_soundcloud_alter_album_apple_music_link_and_more','2025-07-26 13:00:36.281335');
INSERT INTO "django_migrations" VALUES (37,'odhi','0019_album_youtube_link','2025-07-26 13:07:11.102483');
INSERT INTO "django_migrations" VALUES (38,'odhi','0020_faq','2025-07-26 13:46:44.807286');
INSERT INTO "django_migrations" VALUES (39,'odhi','0021_alter_faq_options_remove_faq_order','2025-07-26 14:21:57.445819');
INSERT INTO "django_migrations" VALUES (40,'odhi','0022_subscriber','2025-07-29 08:38:52.442742');
INSERT INTO "django_migrations" VALUES (41,'odhi','0023_blogs','2025-07-31 14:14:06.030689');
INSERT INTO "django_migrations" VALUES (42,'odhi','0024_blogs_link','2025-07-31 16:57:53.659265');
INSERT INTO "django_migrations" VALUES (43,'odhi','0025_newslettersubscriber','2025-08-02 19:49:57.240737');
INSERT INTO "django_migrations" VALUES (44,'odhi','0026_alter_blogs_content','2025-08-07 19:57:07.662738');
INSERT INTO "django_migrations" VALUES (45,'odhi','0027_comment','2025-08-08 06:00:59.637717');
INSERT INTO "django_migrations" VALUES (46,'odhi','0028_alter_comment_options_rename_active_comment_approved_and_more','2025-08-08 07:35:08.213869');
INSERT INTO "django_session" VALUES ('cwo3bd125tyi5d37193c0jeul6hde8m7','.eJxVjDsOwjAQBe_iGln-xjYlPWewdr0bHECOFCcV4u4QKQW0b2beS2TY1pq3zkueSJyFFqffDaE8uO2A7tBusyxzW5cJ5a7Ig3Z5nYmfl8P9O6jQ67cOwRljDTE5VM4PzFA8jDaSVgWU9wGGEJ1iZ0pIlMCixjElGwOCjyjeH9uoN9M:1ucRKg:b9C5slX7xXP8zqtNzj3tBb6HnEZNzcU_U8s6KAfaCNQ','2025-07-31 16:19:42.672506');
INSERT INTO "django_session" VALUES ('9likcwyn6fl3cx2w0ax6v7hfgqpygvgl','.eJxVjEEOwiAQRe_C2hDoUCAu3XsGMsMwUjU0Ke3KeHdt0oVu_3vvv1TCba1p62VJE6uzsur0uxHmR2k74Du226zz3NZlIr0r-qBdX2cuz8vh_h1U7PVbEwPEKJzFkwN02QRgEDt4ocAQDbkQTMyOrKfirAQaUUawPAhEIPX-APT8OCk:1uknsr:PQg1R_jmdGU5KxJjj4cHY5EmlsDiqrv2HMHOSmaMOlU','2025-08-23 18:01:33.035544');
INSERT INTO "odhi_album" VALUES (1,'The Village Experience 4','The Village Experience 4 has 17 melodic tracks','album_covers/villageexperience.png','https://soundcloud.com/odhi-the-villager','2025-07-26','https://music.apple.com/tz/artist/odhi-the-villager/1716322210',NULL,'https://odhithevillager.hustlesasa.shop/',NULL,'https://www.youtube.com/channel/UCNiYiWzepYmSS_xnTeZ04vg');
INSERT INTO "odhi_blogs" VALUES (1,'blog_images/isanda.png','Benga','Benga Music story telling','Kepher Odhiambo Mak''Anyengo','2025-07-31 14:41:58','https://www.youtube.com/watch?v=JjgfEkXezTg','This song may go down in history as one of the last songs the legendary Tedd Josiah recorded
                            for public consumption.
                            However, for reasons, beyond human control, but which I wouldn''t like to go into here, he
                            was unable to complete the
                            project, so the final bits were tied up elsewhere.
                            A few years ago, I was introduced to Tedd by Titi Solomon, who had in turn Ben introduced to
                            me buy my friend
                            Makadem, who both felt that Tedd would bring out an angle from my music which had not come
                            out in my earlier
                            recordings. We had initially only planned for 1 song, but within 5 days, we''d agreed to do 2
                            songs, one of which
                            (Jawar Nitie), has already been shared in both YouTube and Facebook "Odhi the Villager"
                            pages. In the course of our
                            studio engagements, I informed Tedd that at home in Homa Bay I had regular gigs with the
                            living legend, him of Benga
                            history, Samuel Akech Jabuya, aka Akech Oyosi - the man who at around age 20 years actually
                            imagined and founded the
                            then revolutionary Benga sound (now world-renowned) in early 1960s, while a member of Ogara
                            Boys Band. Tedd was very
                            excited, and asked me to bring along Oyosi at the earliest opportunity.
                            When Akech came, he was adamant that he would not record (or even play) Benga, stating that,
                            as a creative artist,
                            he no longer found any excitement in the genre. He had carried along a self-made xylophone,
                            on which he had creating
                            new sounds. So as a compromise with Tedd, he only agreed to do a remix of one of his older
                            songs before recording
                            his xylophone song.');
INSERT INTO "odhi_blogs" VALUES (2,'blog_images/makadem.png','MUSIC','STORY BEHIND THE SONG. ISANDA','Kepher Odhiambo Mak''Anyengo','2025-08-02 10:18:57','https://www.youtube.com/watch?v=JjgfEkXezTg&feature=youtu.be','This song may go down in history as one of the last songs the legendary Tedd Josiah recorded for public consumption. However, for reasons, beyond human control, but which I wouldn''t like to go into here, he was unable to complete the project, so the final bits were tied up elsewhere. A few years ago, I was introduced to Tedd by Titi Solomon, who had in turn Ben introduced to me buy my friend Makadem, who both felt that Tedd would bring out an angle from my music which had not come out in my earlier recordings. We had initially only planned for 1 song, but within 5 days, we''d agreed to do 2 songs, one of which (Jawar Nitie), has already been shared in both YouTube and Facebook "Odhi the Villager" pages. In the course of our studio engagements, I informed Tedd that at home in Homa Bay I had regular gigs with the living legend, him of Benga history, Samuel Akech Jabuya, aka Akech Oyosi - the man who at around age 20 years actually imagined and founded the then revolutionary Benga sound (now world-renowned) in early 1960s, while a member of Ogara Boys Band. Tedd was very excited, and asked me to bring along Oyosi at the earliest opportunity. When Akech came, he was adamant that he would not record (or even play) Benga, stating that, as a creative artist, he no longer found any excitement in the genre. He had carried along a self-made xylophone, on which he had creating new sounds. So as a compromise with Tedd, he only agreed to do a remix of one of his older songs before recording his xylophone song. .

Meanwhile, I had also come along with my long time Duol companion, master orutu player Kenneth Oguda JaMariri, with the intention of spicing one of my songs. Oguda and I come a long way, and have a load of songs composed - only a few released so far. At one point during the recording, Akech excused himself to have a short puff (as a doctor I''ve had a futile prolonged struggle to have him even just reduce on his tobacco consumption!). Tedd also went to warm for us some drinking water (we like sipping that a lot when recording), as Oguda and I rehearsed an old mournful orutu tune we loved to do during interludes. When Tedd came back, he asked me to call Akech back in. I playfully called out his name loudly. He didn''t respond! I called out louder. Still silent. The third time I was much louder, but mockingly made it sound like the way mothers call out a child in the village. He then mumbled some incoherent response, which made all of us burst out laughing. Tedd excitedly noted: "That sounds very interesting", and suggested that instead of adding the orutu skit to the previous songs I''d done, we use it to create a new song, with that playful call (and response) as a nidus. So as Oguda continued playing the mournful orutu skit, I immediately created a simple 2-chord backing rhythm. Tedd quietly muttered: "Perfect!", hooked the orutu to a mike, and the basic first 3 tracks of a new song were made. He released us, till the next day, to work further on the song, especially the lyrics!

The following day, I only had a few lines of lyrics, but I suggested the theme name "Ichanda" ("You are disturbing me"), from the skeleton I was creating. Meanwhile, Tedd completed Oyosi''s songs and gave us a break a 3-week break. I felt that "persecution" (sand) and "ill-will" would create a more powerful theme than "disturbance" (chand) or thak (frustration). I was especially focused on the evil meted by people who are paradoxically considered "good" by society - people with power and authority, and the ability to hide their "badness", as they publicise their goodness, yet, under this cover, are terribly evil. I thought of the worldwide ubiquitous story of the generous woman and the "thankless" hunchback/beggar (etc) whose only response to any assistance the woman gave was (in the Dholuo version): "Itimo marach itimo ne in! Itimo maber itimo ne in" ("The evil you do, you do to yourself! The good you do, you do to yourself"). The Hindu version, adopted by English speakers go: "“The evil you do, remains with you: The good you do, comes back to you!” You probably know others with slight variations. .

When we came back 3 weeks later, I had officially changed the title to "Isanda" (You are persecuting me"). We all agreed to make the song short and very simple! A keyboard solo track was recorded (but we all agreed it was weak). (Much later, I discarded it, preferring a lower-octave orutu instead). The songs were thereafter in limbo for a number of years, as I tried to look for a production engineer who would complete them, with the same original spirit intact. I head intended to release it late last year, but for some reasons, my spirit refused! It has now agreed!😀');
INSERT INTO "odhi_comment" VALUES (1,'Nimrod Mulinya','rodlinya@gmail.com',2,1,'nice article','2025-08-08 07:36:09','0708831776');
INSERT INTO "odhi_eventmusic" VALUES (1,'Odhi the villager experience','Odhi The Villager','covers/serviceodhi_kfRV8AN.jpg',60,'music/Isanda_-_ODHI_THE_VILLAGER.mp3');
INSERT INTO "odhi_eventtype" VALUES (1,'Wedding','Bring unforgettable rhythm and soul to your special day with live Benga performances that connect hearts and cultures. Let love dance to the beat of tradition and joy.','bi bi-balloon-heart-fill');
INSERT INTO "odhi_eventtype" VALUES (2,'Clubs and bar','Turn any night into a cultural celebration! Our Benga sets ignite the dance-floor with live beats, vocals, and electric vibes that keep your crowd moving all night.','fas fa-guitar');
INSERT INTO "odhi_eventtype" VALUES (3,'Corporate events','Add authentic Kenyan flavor to your company events with engaging, energetic Benga music that inspires, uplifts, and entertains teams and guests alike.','fas fa-drum');
INSERT INTO "odhi_eventtype" VALUES (4,'Live Events','Whether it’s a festival, community gathering, or special event, Odhi The Villager brings Benga music to life with powerful performances rooted in tradition and passion.','fas fa-drum-steelpan');
INSERT INTO "odhi_faq" VALUES (1,'How can I book you for a performance or event?','You can book me by sending an inquiry through the booking form on my website or contacting my management via email at bookings@odhithevillager.com or WhatsApp at +254 7XX XXX XXX.');
INSERT INTO "odhi_faq" VALUES (2,'Are you available for interviews (TV, radio, podcast)?','Yes, I am open to interviews that promote Benga music and creative storytelling. Please reach out to my team with details of the platform, date, and time. Media kits are available on request.');
INSERT INTO "odhi_faq" VALUES (3,'Can I collaborate with you on a Benga project?','Absolutely! I’m always open to collaborations that align with authentic sound and culture. Kindly email your concept, links to past work, and proposed timelines');
INSERT INTO "odhi_faq" VALUES (4,'Do you collaborate with artists from other genres (Afrobeat, Hip-Hop, Reggae, etc.)?','Yes. I enjoy fusing Benga with other genres to create unique sounds. Genre crossover projects are welcome, as long as they respect the roots of Benga music.');
INSERT INTO "odhi_faq" VALUES (5,'Are you open to performing at cultural festivals or private events?','Yes, I perform at festivals, community events, and private functions. I tailor each performance to the event’s tone and audience. Please contact my bookings team early for scheduling.');
INSERT INTO "odhi_faq" VALUES (6,'How do I stay updated on your latest releases and events?','Follow me on all platforms @odhithevillager or subscribe to my newsletter on my website. You’ll get updates on music, tours, and exclusive behind-the-scenes content.');
INSERT INTO "odhi_generalinfo" VALUES (2,'rodlinya@gmail.com','0708831776','https://www.facebook.com/profile.php?id=100064333500687&sk=photos',NULL,NULL,NULL,'https://www.youtube.com/channel/UC6wASZmQ4WLv84sNQM51W5w','logos/logo.png','Kisii,Kenya');
INSERT INTO "odhi_hero" VALUES (1,'S.U.R','A heartfelt conversation with My Love, a companion for over four decades, this song remains true to its origins, composed shortly after our meeting.
Despite the passage of time, the lyrics retain their honesty, reflecting the enduring bond we share.
Together, we''ve weathered life''s highs and lows, grateful for each moment.','heroes/mylove_RCto0uQ.jpg','https://www.youtube.com/watch?v=mf24_dUoxac');
INSERT INTO "odhi_historicaleventtype" VALUES (1,'Wedding','Bring unforgettable rhythm and soul to your special day with live Benga performances that connect hearts and cultures. Let love dance to the beat of tradition and joy.','fa-solid fa-rings-wedding',1,'2025-07-23 19:49:55.211948',NULL,'+',1);
INSERT INTO "odhi_historicaleventtype" VALUES (2,'Clubs and bar','Turn any night into a cultural celebration! Our Benga sets ignite the dance-floor with live beats, vocals, and electric vibes that keep your crowd moving all night.','fas fa-guitar',2,'2025-07-23 19:54:28.368408',NULL,'+',1);
INSERT INTO "odhi_historicaleventtype" VALUES (3,'Corporate events','Add authentic Kenyan flavor to your company events with engaging, energetic Benga music that inspires, uplifts, and entertains teams and guests alike.','fas fa-drum',3,'2025-07-23 19:55:49.879891',NULL,'+',1);
INSERT INTO "odhi_historicaleventtype" VALUES (4,'Live Events','Whether it’s a festival, community gathering, or special event, Odhi The Villager brings Benga music to life with powerful performances rooted in tradition and passion.','fas fa-drum-steelpan',4,'2025-07-23 19:56:46.457355',NULL,'+',1);
INSERT INTO "odhi_historicaleventtype" VALUES (1,'Wedding','Bring unforgettable rhythm and soul to your special day with live Benga performances that connect hearts and cultures. Let love dance to the beat of tradition and joy.','bi bi-boombox',5,'2025-07-26 08:34:25.707624',NULL,'~',1);
INSERT INTO "odhi_historicaleventtype" VALUES (1,'Wedding','Bring unforgettable rhythm and soul to your special day with live Benga performances that connect hearts and cultures. Let love dance to the beat of tradition and joy.','bi bi-balloon-heart-fill',6,'2025-07-26 08:36:42.264897',NULL,'~',1);
INSERT INTO "odhi_historicalgeneralinfo" VALUES (2,'logos/logo.png','Kisii,Kenya','odhithevillager@gmail.com','0708831776','https://www.facebook.com/profile.php?id=100064333500687&sk=photos',NULL,NULL,NULL,'https://www.youtube.com/channel/UC6wASZmQ4WLv84sNQM51W5w',1,'2025-07-30 10:58:08.408331',NULL,'~',1);
INSERT INTO "odhi_historicalgeneralinfo" VALUES (2,'logos/logo.png','Kisii,Kenya','rodlinya@gmail.com','0708831776','https://www.facebook.com/profile.php?id=100064333500687&sk=photos',NULL,NULL,NULL,'https://www.youtube.com/channel/UC6wASZmQ4WLv84sNQM51W5w',2,'2025-07-30 10:58:36.824963',NULL,'~',1);
INSERT INTO "odhi_historicalhero" VALUES (1,'My Love','A heartfelt conversation with My Love, a companion for over four decades, this song remains true to its origins, composed shortly after our meeting.
Despite the passage of time, the lyrics retain their honesty, reflecting the enduring bond we share.
Together, we''ve weathered life''s highs and lows, grateful for each moment.','heroes/mylove_RCto0uQ.jpg','https://www.youtube.com/watch?v=mf24_dUoxac',1,'2025-07-21 07:55:46.153428',NULL,'+',1);
INSERT INTO "odhi_historicalhero" VALUES (1,'S.U.R','A heartfelt conversation with My Love, a companion for over four decades, this song remains true to its origins, composed shortly after our meeting.
Despite the passage of time, the lyrics retain their honesty, reflecting the enduring bond we share.
Together, we''ve weathered life''s highs and lows, grateful for each moment.','heroes/mylove_RCto0uQ.jpg','https://www.youtube.com/watch?v=mf24_dUoxac',2,'2025-07-30 10:52:01.914767',NULL,'~',1);
INSERT INTO "odhi_latesttrack" VALUES (1,'Alam mar Duondwa','Odhi The Villager','track_covers/alamar.jpeg','audio_previews/Isanda_-_ODHI_THE_VILLAGER.mp3','https://checkout.hustlesasa.shop/checkout/R1CQ7QQH','2025-07-26 09:05:31.689985');
INSERT INTO "odhi_latesttrack" VALUES (2,'S.U.R','Odhi The Villager','track_covers/SUR.jpeg','audio_previews/Isanda_-_ODHI_THE_VILLAGER_eRWqYbH.mp3','https://checkout.hustlesasa.shop/checkout/QLPNIUSP','2025-07-26 09:07:42.780472');
INSERT INTO "odhi_latesttrack" VALUES (3,'Onyale','Odhi The Villager','track_covers/Onyale.jpeg','audio_previews/Isanda_-_ODHI_THE_VILLAGER_AyUDHAQ.mp3','https://checkout.hustlesasa.shop/checkout/VTYTMRQK','2025-07-26 09:11:25.595593');
INSERT INTO "odhi_othervideo" VALUES (1,'Wadagi','The song draws inspiration from Poxy Presha''s term "polluticians," reflecting on corrupt leaders','https://www.youtube.com/watch?v=6JvIeB0k2Dk&list=RD6JvIeB0k2Dk&start_radio=1','Odhi The Villager','2018','2025-07-21 08:45:20');
INSERT INTO "odhi_othervideo" VALUES (2,'Mwolo','This song is a personal statement on behalf of introverted, humble, and shy individuals like me, affirming that they''re normal, not weak, and may excel in building lasting relationships due to their fear of starting anew.','https://www.youtube.com/watch?v=aj9mTzknbRk&list=RDaj9mTzknbRk&start_radio=1','Odhi The Villager','2018','2025-07-21 08:46:31');
INSERT INTO "odhi_othervideo" VALUES (3,'My Love','A heartfelt conversation with My Love, a companion for over four decades, this song remains true to its origins, composed shortly after our meeting.','https://www.youtube.com/watch?v=mf24_dUoxac&list=RDmf24_dUoxac&start_radio=1','Odhi The Villager','2018','2025-07-23 15:49:23');
INSERT INTO "odhi_othervideo" VALUES (4,'GEN FRANCIS OMONDI OGOLLA _ RIP','Tribute to General Francis Omondi Ogolla','https://www.youtube.com/watch?v=AGBoSl6srCI&list=RDAGBoSl6srCI&start_radio=1','Odhi The Villager','2024','2025-07-30 10:54:02');
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "odhi_comment_blog_id_aeb003ca" ON "odhi_comment" (
	"blog_id"
);
CREATE INDEX IF NOT EXISTS "odhi_historicaleventtype_history_date_88b03138" ON "odhi_historicaleventtype" (
	"history_date"
);
CREATE INDEX IF NOT EXISTS "odhi_historicaleventtype_history_user_id_3649e2fb" ON "odhi_historicaleventtype" (
	"history_user_id"
);
CREATE INDEX IF NOT EXISTS "odhi_historicaleventtype_id_0ec0b888" ON "odhi_historicaleventtype" (
	"id"
);
CREATE INDEX IF NOT EXISTS "odhi_historicalgeneralinfo_history_date_a57f077a" ON "odhi_historicalgeneralinfo" (
	"history_date"
);
CREATE INDEX IF NOT EXISTS "odhi_historicalgeneralinfo_history_user_id_60beeeb7" ON "odhi_historicalgeneralinfo" (
	"history_user_id"
);
CREATE INDEX IF NOT EXISTS "odhi_historicalgeneralinfo_id_ff5c4242" ON "odhi_historicalgeneralinfo" (
	"id"
);
CREATE INDEX IF NOT EXISTS "odhi_historicalhero_history_date_f24f416a" ON "odhi_historicalhero" (
	"history_date"
);
CREATE INDEX IF NOT EXISTS "odhi_historicalhero_history_user_id_f03415ed" ON "odhi_historicalhero" (
	"history_user_id"
);
CREATE INDEX IF NOT EXISTS "odhi_historicalhero_id_d401638a" ON "odhi_historicalhero" (
	"id"
);
COMMIT;

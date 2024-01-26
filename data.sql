BEGIN TRANSACTION;
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES(5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES(9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES(13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES(21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES(25,7,'add_conversation','Can add conversation');
INSERT INTO "auth_permission" VALUES(26,7,'change_conversation','Can change conversation');
INSERT INTO "auth_permission" VALUES(27,7,'delete_conversation','Can delete conversation');
INSERT INTO "auth_permission" VALUES(28,7,'view_conversation','Can view conversation');
INSERT INTO "auth_permission" VALUES(29,8,'add_conversationmessage','Can add conversation message');
INSERT INTO "auth_permission" VALUES(30,8,'change_conversationmessage','Can change conversation message');
INSERT INTO "auth_permission" VALUES(31,8,'delete_conversationmessage','Can delete conversation message');
INSERT INTO "auth_permission" VALUES(32,8,'view_conversationmessage','Can view conversation message');
INSERT INTO "auth_permission" VALUES(33,9,'add_category','Can add category');
INSERT INTO "auth_permission" VALUES(34,9,'change_category','Can change category');
INSERT INTO "auth_permission" VALUES(35,9,'delete_category','Can delete category');
INSERT INTO "auth_permission" VALUES(36,9,'view_category','Can view category');
INSERT INTO "auth_permission" VALUES(37,10,'add_item','Can add item');
INSERT INTO "auth_permission" VALUES(38,10,'change_item','Can change item');
INSERT INTO "auth_permission" VALUES(39,10,'delete_item','Can delete item');
INSERT INTO "auth_permission" VALUES(40,10,'view_item','Can view item');
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$720000$bb2QlF3CMZZyTu2xUolrTA$6i6OD3DIyBEAiF7cs13WLh+e4uQR71tfmtwCJMA6DjY=','2023-12-30 14:30:48.690901',1,'admin','','',1,1,'2023-12-29 14:48:23.081394','');
INSERT INTO "auth_user" VALUES(2,'pbkdf2_sha256$720000$GFfxwW7uAUFVhRHX2LgyGi$29qP2lpfOpdSeGXeoQ7R5Gc9QbjOvIB76Y4y5Akea9I=','2023-12-30 14:26:40.476809',0,'alibouzena','','a_bouzena@estin.dz',0,1,'2023-12-29 14:58:28.290665','');
INSERT INTO "auth_user" VALUES(3,'pbkdf2_sha256$720000$EAbtHWot9PtoOdJfrUlTkf$5F0GtFSOCl8OBiqYCiRJhtdZ4T1M+/+t2MWn3vU7FAQ=','2023-12-30 14:20:23.644677',0,'meyssa','','r_saoudi@estin.dz',0,1,'2023-12-30 14:20:12.848343','');
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE "conversation_conversation" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "created_at" datetime NOT NULL, "modified_at" datetime NOT NULL, "item_id" bigint NOT NULL REFERENCES "item_item" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "conversation_conversation" VALUES(3,'2023-12-30 14:11:54.230823','2023-12-30 14:15:39.945705',7);
INSERT INTO "conversation_conversation" VALUES(4,'2023-12-30 14:27:12.599950','2023-12-30 14:31:38.796986',13);
CREATE TABLE "conversation_conversation_members" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "conversation_id" bigint NOT NULL REFERENCES "conversation_conversation" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "conversation_conversation_members" VALUES(5,3,2);
INSERT INTO "conversation_conversation_members" VALUES(6,3,1);
INSERT INTO "conversation_conversation_members" VALUES(7,4,2);
INSERT INTO "conversation_conversation_members" VALUES(8,4,1);
CREATE TABLE "conversation_conversationmessage" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content" text NOT NULL, "created_at" datetime NOT NULL, "conversation_id" bigint NOT NULL REFERENCES "conversation_conversation" ("id") DEFERRABLE INITIALLY DEFERRED, "created_by_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "conversation_conversationmessage" VALUES(5,'hello Mr I want to buy this item','2023-12-30 14:11:54.300828',3,2);
INSERT INTO "conversation_conversationmessage" VALUES(6,'hello, yes ofc give me those information and I will send it to you 
- full name
- address
- phone number','2023-12-30 14:13:58.611922',3,1);
INSERT INTO "conversation_conversationmessage" VALUES(7,'okey here are the informations: - Ali BOUZENA - 123 test Address - 0123456789','2023-12-30 14:15:39.926698',3,2);
INSERT INTO "conversation_conversationmessage" VALUES(8,'hello I want to buy this item','2023-12-30 14:27:12.674621',4,2);
INSERT INTO "conversation_conversationmessage" VALUES(9,'okey just send me those information so I can deliver it to you : -full name - adress - phone number','2023-12-30 14:31:38.779752',4,1);
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO "django_admin_log" VALUES(1,'1','Toys',1,'[{"added": {}}]',9,1,'2023-12-29 14:48:56.628156');
INSERT INTO "django_admin_log" VALUES(2,'2','Clothes',1,'[{"added": {}}]',9,1,'2023-12-29 14:49:05.427352');
INSERT INTO "django_admin_log" VALUES(3,'3','furnitures',1,'[{"added": {}}]',9,1,'2023-12-29 14:49:10.355029');
INSERT INTO "django_admin_log" VALUES(4,'4','Books',1,'[{"added": {}}]',9,1,'2023-12-29 14:49:20.777566');
INSERT INTO "django_admin_log" VALUES(5,'6','The Children''s Place Boys'' Multipack Basic Straight Leg Jeans',3,'',10,1,'2023-12-30 10:23:35.779197');
INSERT INTO "django_admin_log" VALUES(6,'5','Teddy bear',3,'',10,1,'2023-12-30 10:23:35.800908');
INSERT INTO "django_admin_log" VALUES(7,'4','car',3,'',10,1,'2023-12-30 10:23:35.816188');
INSERT INTO "django_admin_log" VALUES(8,'3','chair',3,'',10,1,'2023-12-30 10:23:35.834356');
INSERT INTO "django_admin_log" VALUES(9,'2','shoes',3,'',10,1,'2023-12-30 10:23:35.848217');
INSERT INTO "django_admin_log" VALUES(10,'1','paper plane',3,'',10,1,'2023-12-30 10:23:35.861264');
INSERT INTO "django_admin_log" VALUES(11,'5','jewelry',1,'[{"added": {}}]',9,1,'2023-12-30 10:43:28.187049');
INSERT INTO "django_admin_log" VALUES(12,'6','Electronics',1,'[{"added": {}}]',9,1,'2023-12-30 10:44:00.048682');
INSERT INTO "django_admin_log" VALUES(13,'7','Pet Supplies',1,'[{"added": {}}]',9,1,'2023-12-30 10:44:31.878931');
INSERT INTO "django_admin_log" VALUES(14,'8','Luggage',1,'[{"added": {}}]',9,1,'2023-12-30 10:44:40.291550');
INSERT INTO "django_admin_log" VALUES(15,'9','Software',1,'[{"added": {}}]',9,1,'2023-12-30 10:44:46.530938');
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','permission');
INSERT INTO "django_content_type" VALUES(3,'auth','group');
INSERT INTO "django_content_type" VALUES(4,'auth','user');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'conversation','conversation');
INSERT INTO "django_content_type" VALUES(8,'conversation','conversationmessage');
INSERT INTO "django_content_type" VALUES(9,'item','category');
INSERT INTO "django_content_type" VALUES(10,'item','item');
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2023-12-29 14:47:29.357381');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2023-12-29 14:47:29.429789');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2023-12-29 14:47:29.481251');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2023-12-29 14:47:29.544237');
INSERT INTO "django_migrations" VALUES(5,'admin','0003_logentry_add_action_flag_choices','2023-12-29 14:47:29.583219');
INSERT INTO "django_migrations" VALUES(6,'contenttypes','0002_remove_content_type_name','2023-12-29 14:47:29.664631');
INSERT INTO "django_migrations" VALUES(7,'auth','0002_alter_permission_name_max_length','2023-12-29 14:47:29.704949');
INSERT INTO "django_migrations" VALUES(8,'auth','0003_alter_user_email_max_length','2023-12-29 14:47:29.753601');
INSERT INTO "django_migrations" VALUES(9,'auth','0004_alter_user_username_opts','2023-12-29 14:47:29.799321');
INSERT INTO "django_migrations" VALUES(10,'auth','0005_alter_user_last_login_null','2023-12-29 14:47:29.852489');
INSERT INTO "django_migrations" VALUES(11,'auth','0006_require_contenttypes_0002','2023-12-29 14:47:29.868785');
INSERT INTO "django_migrations" VALUES(12,'auth','0007_alter_validators_add_error_messages','2023-12-29 14:47:29.909702');
INSERT INTO "django_migrations" VALUES(13,'auth','0008_alter_user_username_max_length','2023-12-29 14:47:29.966346');
INSERT INTO "django_migrations" VALUES(14,'auth','0009_alter_user_last_name_max_length','2023-12-29 14:47:30.015447');
INSERT INTO "django_migrations" VALUES(15,'auth','0010_alter_group_name_max_length','2023-12-29 14:47:30.064900');
INSERT INTO "django_migrations" VALUES(16,'auth','0011_update_proxy_permissions','2023-12-29 14:47:30.097436');
INSERT INTO "django_migrations" VALUES(17,'auth','0012_alter_user_first_name_max_length','2023-12-29 14:47:30.163021');
INSERT INTO "django_migrations" VALUES(18,'item','0001_initial','2023-12-29 14:47:30.220207');
INSERT INTO "django_migrations" VALUES(19,'conversation','0001_initial','2023-12-29 14:47:30.318639');
INSERT INTO "django_migrations" VALUES(20,'sessions','0001_initial','2023-12-29 14:47:30.352063');
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO "django_session" VALUES('qoumgv7i0em59htn8vr1uj7ef0kjgmib','.eJxVjMsOwiAQRf-FtSEMb1y69xsIDINUDU1KuzL-uzbpQrf3nHNfLKZtbXEbtMSpsDMDdvrdcsIH9R2Ue-q3mePc12XKfFf4QQe_zoWel8P9O2hptG8dHKhUKXujRYakhdFkEb02ARWgDBZFDkU5VwVkECilktYGXT2RcY69P86gNxQ:1rJaMS:p7YiR7W8GQJc09rovFaAABlXDrS864ioybGBIvYmCLQ','2024-01-13 14:30:48.712890');
CREATE TABLE "item_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL);
INSERT INTO "item_category" VALUES(1,'Toys');
INSERT INTO "item_category" VALUES(2,'Clothes');
INSERT INTO "item_category" VALUES(3,'furnitures');
INSERT INTO "item_category" VALUES(4,'Books');
INSERT INTO "item_category" VALUES(5,'jewelry');
INSERT INTO "item_category" VALUES(6,'Electronics');
INSERT INTO "item_category" VALUES(7,'Pet Supplies');
INSERT INTO "item_category" VALUES(8,'Luggage');
INSERT INTO "item_category" VALUES(9,'Software');
CREATE TABLE "item_item" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(255) NOT NULL, "description" text NULL, "price" real NOT NULL, "image" varchar(100) NULL, "is_sold" bool NOT NULL, "created_at" datetime NOT NULL, "category_id" bigint NOT NULL REFERENCES "item_category" ("id") DEFERRABLE INITIALLY DEFERRED, "created_by_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO "item_item" VALUES(7,'Legendary Whitetails Men''s Recluse Henley','About this item
Distressed seams for a rugged look
Easy-moving raglan long sleeves
Soft, sueded finish
4-button placket for easy on/off
Legendary label at hem',37.99,'item_images/item2_Xqib8yK.jpg',0,'2023-12-30 10:27:30.158107',2,1);
INSERT INTO "item_item" VALUES(8,'The Children''s Place Boys'' Multipack Basic Straight Leg Jeans','About this item
Pre-washed for added softness and to reduce shrinkage, these come in durable cotton for comfortable daily wear that holds up
A classic straight leg 2-pack with 5-pocket styling, inner adjustable waist tabs and a tagless label
Snap closure with zipper fly for sizes 4-7, button closure with zipper fly for sizes 8-16
Stock up on fit-for-many-occasion everyday jeans that are great with polos and graphic tees alike
The Children''s Place offers value-priced clothes and apparel that are fun and easy to put together',50.99,'item_images/item1.jpg',0,'2023-12-30 10:28:59.552677',2,1);
INSERT INTO "item_item" VALUES(9,'Black chair','a wooden black chair',70.89,'item_images/chair2.jpg',0,'2023-12-30 10:29:45.115804',3,1);
INSERT INTO "item_item" VALUES(10,'white chair','a comfy white chair',120.55,'item_images/chair1.jpg',0,'2023-12-30 10:30:51.133035',3,1);
INSERT INTO "item_item" VALUES(11,'Teddy bear','',20.33,'item_images/teddy-bear.jpg',0,'2023-12-30 10:31:25.993737',1,1);
INSERT INTO "item_item" VALUES(12,'Car','A car toy',90.32,'item_images/toy-car.jpg',0,'2023-12-30 10:34:53.122318',1,1);
INSERT INTO "item_item" VALUES(13,'Black shoes','',120.99,'item_images/shoe-1.jpg',0,'2023-12-30 10:35:42.107049',2,1);
INSERT INTO "item_item" VALUES(14,'McFarlane Toys - DC Multiverse Justice Buster (Batman: Endgame) Mega Figure','Megafigs are large figures to match their 7” scale figure counterparts based off the DC Multiverse
Designed with Ultra Articulation with up to 22 moving parts for full range of posing and play
Justice Buster Batman comes with base
Includes collectible art card with character art on the front, and character biography on the back
Collect all McFarlane Toys DC Multiverse Figures',33.99,'item_images/toy.jpg',0,'2023-12-30 10:37:58.991096',1,1);
INSERT INTO "item_item" VALUES(16,'18K Gold Necklace','About this item
This product was previously sold as Amazon Collection and now as Amazon Essentials.
STYLE: This lovely 18k rose gold over sterling silver knotted motif pendant 16.77 mm in width and 16.32 mm in length is embellished with Diamond accents
MATERIAL: Round White Diamond,IJ,I2-I3,0.02 Carats. Carat weight is the total carat weight for all stones.
DETAILS: 18" rolo chain with lobster claw clasp
CARE: Plated with anti-tarnish coating; store in a cool, dry place in its own container or compartment; limit exposure to extreme temperatures, perfume, and household cleaning products',33.2,'item_images/necklace.jpg',1,'2023-12-30 14:29:27.034784',5,2);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "item_item_category_id_7971a411" ON "item_item" ("category_id");
CREATE INDEX "item_item_created_by_id_abf41b7a" ON "item_item" ("created_by_id");
CREATE INDEX "conversation_conversation_item_id_228c4088" ON "conversation_conversation" ("item_id");
CREATE UNIQUE INDEX "conversation_conversation_members_conversation_id_user_id_8676b40f_uniq" ON "conversation_conversation_members" ("conversation_id", "user_id");
CREATE INDEX "conversation_conversation_members_conversation_id_c146fce9" ON "conversation_conversation_members" ("conversation_id");
CREATE INDEX "conversation_conversation_members_user_id_226f9afc" ON "conversation_conversation_members" ("user_id");
CREATE INDEX "conversation_conversationmessage_conversation_id_fdd084d4" ON "conversation_conversationmessage" ("conversation_id");
CREATE INDEX "conversation_conversationmessage_created_by_id_aa6cea66" ON "conversation_conversationmessage" ("created_by_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('django_migrations',20);
INSERT INTO "sqlite_sequence" VALUES('django_admin_log',15);
INSERT INTO "sqlite_sequence" VALUES('django_content_type',10);
INSERT INTO "sqlite_sequence" VALUES('auth_permission',40);
INSERT INTO "sqlite_sequence" VALUES('auth_group',0);
INSERT INTO "sqlite_sequence" VALUES('auth_user',3);
INSERT INTO "sqlite_sequence" VALUES('item_category',9);
INSERT INTO "sqlite_sequence" VALUES('item_item',16);
INSERT INTO "sqlite_sequence" VALUES('conversation_conversation',4);
INSERT INTO "sqlite_sequence" VALUES('conversation_conversation_members',8);
INSERT INTO "sqlite_sequence" VALUES('conversation_conversationmessage',9);
COMMIT;

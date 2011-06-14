

CREATE TABLE "assets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "caption" varchar(255), "title" varchar(255), "asset_file_name" varchar(255), "asset_content_type" varchar(255), "asset_file_size" integer, "created_by_id" integer, "updated_by_id" integer, "created_at" datetime, "updated_at" datetime, "uuid" varchar(255), "original_width" integer, "original_height" integer, "original_extension" varchar(255));


CREATE TABLE "config" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "key" varchar(40) DEFAULT '' NOT NULL, "value" varchar(255) DEFAULT '');
INSERT INTO "config" VALUES (1, 'admin.title', 'Radiant CMS');
INSERT INTO "config" VALUES (2, 'admin.subtitle', 'Publishing for Small Teams');
INSERT INTO "config" VALUES (3, 'defaults.page.parts', 'body, extended');
INSERT INTO "config" VALUES (4, 'defaults.page.status', 'Published');
INSERT INTO "config" VALUES (5, 'defaults.page.fields', 'Keywords, Description');
INSERT INTO "config" VALUES (6, 'session_timeout', '1209600');
INSERT INTO "config" VALUES (7, 'default_locale', 'en');
INSERT INTO "config" VALUES (8, 'pagination.param_name', 'page');
INSERT INTO "config" VALUES (9, 'pagination.per_page_param_name', 'per_page');
INSERT INTO "config" VALUES (10, 'admin.pagination.per_page', '50');
INSERT INTO "config" VALUES (11, 'site.title', 'Radiant Forum');
INSERT INTO "config" VALUES (12, 'site.host', 'radiant.spanner.org');
INSERT INTO "config" VALUES (13, 'user.allow_password_reset?', 'true');
INSERT INTO "config" VALUES (14, 'paperclip.url', '/:class/:id/:basename:no_original_style.:extension');
INSERT INTO "config" VALUES (15, 'paperclip.path', ':rails_root/public/:class/:id/:basename:no_original_style.:extension');
INSERT INTO "config" VALUES (16, 'paperclip.skip_filetype_validation', 'true');
INSERT INTO "config" VALUES (17, 'paperclip.storage', 'filesystem');
INSERT INTO "config" VALUES (18, 'assets.create_image_thumbnails?', 'true');
INSERT INTO "config" VALUES (19, 'assets.create_video_thumbnails?', 'true');
INSERT INTO "config" VALUES (20, 'assets.create_pdf_thumbnails?', 'true');
INSERT INTO "config" VALUES (21, 'assets.thumbnails.image', 'normal:size=640x640>,format=original|small:size=320x320>,format=original');
INSERT INTO "config" VALUES (22, 'assets.thumbnails.video', 'normal:size=640x640>,format=jpg|small:size=320x320>,format=jpg');
INSERT INTO "config" VALUES (23, 'assets.thumbnails.pdf', 'normal:size=640x640>,format=jpg|small:size=320x320>,format=jpg');
INSERT INTO "config" VALUES (24, 'assets.max_asset_size', '5');
INSERT INTO "config" VALUES (25, 'assets.display_size', 'normal');
INSERT INTO "config" VALUES (26, 'assets.insertion_size', 'normal');
INSERT INTO "config" VALUES (27, 'forum.public?', 'true');
INSERT INTO "config" VALUES (28, 'forum.toolbar?', 'true');
INSERT INTO "config" VALUES (29, 'forum.editable_period', '60');
INSERT INTO "config" VALUES (30, 'forum.allow_page_comments?', 'true');
INSERT INTO "config" VALUES (31, 'forum.allow_attachments?', 'true');
INSERT INTO "config" VALUES (32, 'forum.attachment.max_size', '10');
INSERT INTO "config" VALUES (33, 'forum.paginate_posts?', 'true');
INSERT INTO "config" VALUES (34, 'forum.posts_per_page', '20');
INSERT INTO "config" VALUES (35, 'forum.commentable_period', '7');
INSERT INTO "config" VALUES (36, 'forum.allow_search_by_reader?', 'true');
INSERT INTO "config" VALUES (37, 'reader.allow_registration?', 'true');
INSERT INTO "config" VALUES (38, 'reader.require_confirmation?', 'true');
INSERT INTO "config" VALUES (39, 'reader.use_honorifics?', 'false');
INSERT INTO "config" VALUES (40, 'forum.layout', 'standard');
INSERT INTO "config" VALUES (41, 'email.prefix', '');
INSERT INTO "config" VALUES (42, 'email.layout', '');
INSERT INTO "config" VALUES (43, 'forum.attachment.content_types', '');
INSERT INTO "config" VALUES (44, 'dev.host', '');
INSERT INTO "config" VALUES (45, 'local.timezone', '');
INSERT INTO "config" VALUES (46, 'defaults.locale', '');
INSERT INTO "config" VALUES (47, 'defaults.page.filter', '');
INSERT INTO "config" VALUES (48, 'defaults.snippet.filter', '');
INSERT INTO "config" VALUES (49, 'email.name', 'Radiant');
INSERT INTO "config" VALUES (50, 'email.address', 'radiant@spanner.org');
INSERT INTO "config" VALUES (51, 'reader.layout', 'standard');
INSERT INTO "config" VALUES (52, 'forum.offer_rss?', 'false');
INSERT INTO "config" VALUES (53, 'reader.get_profile?', 'true');


CREATE TABLE "extension_meta" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "schema_version" integer DEFAULT 0, "enabled" boolean DEFAULT 't');


CREATE TABLE "forums" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text, "position" integer, "lock_version" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "old_id" integer);
INSERT INTO "forums" VALUES (1, 'Normal', '', NULL, 0, '2011-06-13 12:44:46', '2011-06-13 12:44:46', NULL, NULL, NULL);
INSERT INTO "forums" VALUES (2, 'Other', '', NULL, 0, '2011-06-13 12:44:56', '2011-06-13 12:44:56', NULL, NULL, NULL);
INSERT INTO "forums" VALUES (3, 'Misc', '', NULL, 0, '2011-06-13 12:45:05', '2011-06-13 12:45:05', NULL, NULL, NULL);


CREATE TABLE "groups" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" text, "notes" text, "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "homepage_id" integer, "site_id" integer, "lock_version" integer, "public" boolean, "invitation" text);


CREATE TABLE "layouts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100), "content" text, "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "content_type" varchar(40), "lock_version" integer DEFAULT 0);
INSERT INTO "layouts" VALUES (1, 'standard', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
  "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
  <head>
    <title>Forum : <r:content part="pagetitle" /></title>
    <link rel="stylesheet" href="/stylesheets/forum_demo.css" type="text/css" media="all" />
    <script src="http://code.jquery.com/jquery-1.5.js" type="text/javascript"></script>
  </head>
  <body>
    <div id="container">
      <div id="header">
        <div id="masthead">
          <div id="search"><r:content part="search" /></div>
          <p id="sitetitle"><a href="/"><span class="logo">☆</span> Radiant Forum</a></p>
          <p id="navigation">
            <r:navigation paths="home: / | installation: /install | documentation: /docs | demo: /forum">
              <r:normal><a href="<r:path />"><r:title /></r:normal>
              <r:selected><a href="<r:path />" class="here"><r:title /></r:selected>
            </r:navigation>
            <a href="https://github.com/spanner/radiant-forum-extension">code</a>
            <a href="https://github.com/spanner/radiant-forum-extension/issues">issues</a>
          </p>
        </div>
      </div>
      <div id="page">
        <h1 class="title">
          <span class="breadhead"><r:content part="breadhead" /></span>
          <r:title />
        </h1>
        <r:content part="signals" />
        <div id="marginalia">
          <r:content part="sidebar" />
        </div>
        <div id="main">
          <r:if_content part="introduction">
            <div id="introduction"><r:content part="introduction" /></div>
          </r:if_content>
          <r:content />
        </div>
      </div>
      <div id="footer">
        <div id="colophon">
          <r:content part="controls" />
          <r:content part="section_navigation" />
        </div>
      </div>
    </div>

    <r:content part="reader_js" />
    <r:content part="forum_js" />
    <r:content part="toolbar_js" />
  </body>
</html>
', '2011-06-08 12:06:03', '2011-06-13 15:45:46', NULL, 1, '', 31);


CREATE TABLE "memberships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "group_id" integer, "reader_id" integer);


CREATE TABLE "message_readers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "site_id" integer, "message_id" integer, "reader_id" integer, "sent_at" datetime);


CREATE TABLE "messages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "site_id" integer, "subject" varchar(255), "body" text, "filter_id" text, "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "lock_version" integer, "function_id" varchar(255), "status_id" integer DEFAULT 1, "layout_id" integer, "sent_at" datetime, "group_id" integer);
INSERT INTO "messages" VALUES (1, NULL, 'Welcome!', '
<p>Hello <r:recipient:name />.</p>

<p>Welcome to the <strong><a href="<r:site:url />"><r:site:name /></a></strong> site, and thank you for persevering with the registration process. Your account is now active and you will have been logged in automatically.</p>

<p>You can put in a bit more information about yourself at any time by visiting <a href="<r:recipient:edit_url />">your preferences page</a>.</p>

<p>Next time you visit, you will need to log in. Here''s another reminder before we discard the plain text version of your password:</p>

<ul>
  <li>username: <strong><r:recipient:login /></strong></li>
  <li>password: <strong><r:recipient:password /></strong></li>
</ul>

<p>Best wishes,</p>

<p><r:sender:name /></p>
      ', NULL, '2011-06-08 12:06:02', '2011-06-08 12:06:03', 1, NULL, 3, 'welcome', 100, NULL, '2011-06-08 12:06:02', NULL);
INSERT INTO "messages" VALUES (2, NULL, 'Please activate your account', '
<p>Hello <r:recipient:name />.</p>

<p>Welcome! Your account has been created at the <strong><r:site:name /></strong> site. To activate it, all you have to do is <strong><a href="<r:recipient:activation_url />">click on this link</a></strong>.</p>

<p>On this first visit you''ll be logged in automatically, but next time you''ll need to know your username and password:</p>

<ul>
<li>username: <strong><r:recipient:login /></strong></li>
<li>password: <strong><r:recipient:password /></strong></li>
</ul>

<p>To see yourself as others might see you, have a look at <a href="<r:recipient:url />">your page</a>. You can change that listing in your <a href="<r:recipient:edit_url />">preferences</a> and if you''d like a picture to appear, you need a <a href="http://www.gravatar.com/signup">gravatar</a>.</p>

<p>We''re about to forget your password, so we won''t be able to remind you what it is, but if you get stuck you can always make a new one by clicking on the ''forgot my password'' link on the login page.</p>

<p>Best wishes,</p>

<p><r:sender:name /></p>
      ', NULL, '2011-06-08 12:06:02', '2011-06-08 12:06:03', 1, NULL, 3, 'activation', 100, NULL, '2011-06-08 12:06:02', NULL);
INSERT INTO "messages" VALUES (3, NULL, 'You are invited!', '
<p>Hello <r:recipient:name />.</p>

<p>You are invited to join the <strong><r:site:name /></strong> site. To accept the invitation, all you have to do is  <strong><a href="<r:recipient:activation_url />">click on this link</a></strong>.</p>

<p>On this first visit you''ll be logged in automatically, but next time you''ll need to know your username and password. Most of this has been generated automatically:</p>

<ul>
  <li>username: <strong><r:recipient:login /></strong></li>
  <li>password: <strong><r:recipient:password /></strong></li>
</ul>

So you will want to change it in your <a href="<r:recipient:edit_url />">preferences</a>, where you can also edit the text that will appear on your <a href="<r:recipient:url />">listing page</a> whenever someone follows a link from one of your contributions to the site.</p>

<p>Once you''ve logged in we''ll forget your password, so we won''t be able to remind you what it is. If you get stuck you can always make a new one by clicking on the ''forgot my password'' link on the login page.</p>

<p>Best wishes,</p>

<p><r:sender:name /></p>
      ', NULL, '2011-06-08 12:06:02', '2011-06-08 12:06:03', 1, NULL, 3, 'invitation', 100, NULL, '2011-06-08 12:06:02', NULL);
INSERT INTO "messages" VALUES (4, NULL, 'Reset your password', '
<p>Hello <r:recipient:name />.</p>

<p>Someone has requested that a new password be generated for your account at the <strong><a href="<r:site:url />"><r:site:name /></a></strong> site. If that person wasn''t you, please don''t be concerned: you are seeing this message, not they, and your password hasn''t changed. You can safely delete this message and forget about it.</p>

<p>If that person was you, please <strong><a href="<r:recipient:repassword_url />">click here to enter a new password</a></strong>. Nothing will actually change until you submit the password-reset form.</p>

<p>If you have remembered your current password and all you want to do is change it, you can skip this step and go straight to your <a href="<r:recipient:edit_url />">preferences</a>.</p>
      ', NULL, '2011-06-08 12:06:02', '2011-06-08 12:06:03', 1, NULL, 3, 'password_reset', 100, NULL, '2011-06-08 12:06:02', NULL);


CREATE TABLE "page_attachments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "asset_id" integer, "page_id" integer, "position" integer);


CREATE TABLE "page_fields" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "page_id" integer, "name" varchar(255), "content" varchar(255));
INSERT INTO "page_fields" VALUES (1, 1, 'Keywords', '');
INSERT INTO "page_fields" VALUES (2, 1, 'Description', '');


CREATE TABLE "page_parts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100), "filter_id" varchar(25), "content" text, "page_id" integer);
INSERT INTO "page_parts" VALUES (1, 'body', '', 'This is an empty site for integration-testing of the reader extension family. No fun here.', 1);
INSERT INTO "page_parts" VALUES (2, 'extended', '', '', 1);


CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "slug" varchar(100), "breadcrumb" varchar(160), "class_name" varchar(25), "status_id" integer DEFAULT 1 NOT NULL, "parent_id" integer, "layout_id" integer, "created_at" datetime, "updated_at" datetime, "published_at" datetime, "created_by_id" integer, "updated_by_id" integer, "virtual" boolean DEFAULT 'f' NOT NULL, "lock_version" integer DEFAULT 0, "commentable" boolean DEFAULT 't', "comments_closed" boolean DEFAULT 'f');
INSERT INTO "pages" VALUES (1, 'home', '/', 'home', '', 100, NULL, NULL, '2011-06-08 12:27:59', '2011-06-08 12:29:22', '2011-06-08 12:29:22', 1, 1, 'f', 1, 't', 'f');


CREATE TABLE "permissions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "group_id" integer, "permitted_id" integer, "permitted_type" varchar(255));


CREATE TABLE "post_attachments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "post_id" integer, "reader_id" integer, "position" integer, "file_file_name" varchar(255), "file_content_type" varchar(255), "file_file_size" integer, "file_updated_at" datetime, "created_at" datetime, "updated_at" datetime, "old_id" integer);


CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "reader_id" integer, "topic_id" integer, "body" text, "created_at" datetime, "updated_at" datetime, "old_id" integer, "page_id" integer, "search_text" text);
INSERT INTO "posts" VALUES (1, 1, 1, 'Otherwise he was a very kind-hearted man, good to his comrades, and ready to oblige; but the rank of general threw him completely off his balance. On receiving that rank, he became confused, as it were, lost his way, and never knew what to do. If he chanced to be with his equals, he was still a very nice kind of man—a very good fellow in many respects, and not stupid: but just the moment that he happened to be in the society of people but one rank lower than himself, he was simply incomprehensible; he became silent; and his situation aroused sympathy, the more so, as he felt himself that he might have made an incomparably better use of the time. In his eyes, there was sometimes visible a desire to join some interesting conversation and circle; but he was held back by the thought, Would it not be a very great condescension on his part? Would it not be familiar? and would he not thereby lose his importance? And in consequence of such reflections, he remained ever in the same dumb state, uttering only occasionally a few monosyllabic sounds, and thereby earning the name of the most tiresome of men.<br/>', '2011-06-08 13:38:05', '2011-06-13 12:48:09', NULL, NULL, 'loose discussion kind hearted man good comrades ready oblige rank general threw completely balance receiving rank confused lost way knew chanced equals nice kind man—a good fellow respects stupid just moment happened society people rank lower himself simply incomprehensible silent situation aroused sympathy felt himself incomparably better use time eyes visible desire join interesting conversation circle held thought great condescension familiar lose importance consequence reflections remained dumb state uttering occasionally monosyllabic sounds earning tiresome men br ');
INSERT INTO "posts" VALUES (2, 1, 1, '“What, what, what!” said the important personage. “Where did you get such courage? Where did you get such ideas? What impudence towards their chiefs and superiors has spread among the young generation!” The prominent personage apparently had not observed that Akakii Akakievich was already in the neighborhood of fifty. If he could be called a young man, then it must have been in comparison with some one who was seventy. “Do you know to whom you speak? Do you realize who stands before you? Do you realize it? do you realize it? I ask you!” Then he stamped his foot, and raised his voice to such a pitch that it would have frightened even a different man from Akakii Akakievich. 8|<br/><br/>Akakii Akakievich’s senses failed him; he staggered, trembled in every limb, and could not stand; if the porters had not run in to support him, he would have fallen to the floor. They carried him out insensible. But the prominent personage, gratified that the effect should have surpassed his expectations, and quite intoxicated with the thought that his word could even deprive a man of his senses, glanced sideways at his friend in order to see how he looked upon this, and perceived, not without satisfaction, that his friend was in a most undecided frame of mind, and even beginning, on his side, to feel a trifle frightened.<br/>', '2011-06-13 08:01:46', '2011-06-13 12:42:14', NULL, NULL, 'testing forumless discussion “what ” said important personage “where did courage did ideas impudence chiefs superiors spread young generation ” prominent personage apparently observed akakii akakievich neighborhood fifty called young man comparison seventy “do know speak realize stands realize realize ask ” stamped foot raised voice pitch frightened different man akakii akakievich 8 br br akakii akakievich’s senses failed staggered trembled limb stand porters run support fallen floor carried insensible prominent personage gratified effect surpassed expectations quite intoxicated thought word deprive man senses glanced sideways friend order looked perceived satisfaction friend undecided frame mind beginning feel trifle frightened br ');
INSERT INTO "posts" VALUES (3, 1, 2, 'Did Akakii Akakievich hear these fatal words? and, if he heard them, did they produce any overwhelming effect upon him? Did he lament the bitterness of his life?—We know not, for he continued in a raving, parching condition. Visions incessantly appeared to him, each stranger than the other: now he saw Petrovich, and ordered him to make a coat, with some traps for robbers, who seemed to him to be always under the bed; and he cried, every moment, to the landlady to pull one robber from under his coverlet: then he inquired why his old “mantle” hung before him when he had a new overcoat; then he fancied that he was standing before the general, listening to a thorough setting-down, and saying, “Forgive, your excellency!” but at last he began to curse, uttering the most horrible words, so that his aged landlady crossed herself, never in her life having heard anything of the kind from him—the more so, as those words followed directly after the words your excellency. Later he talked utter nonsense, of which nothing could be understood: all that was evident, was that his incoherent words and thoughts hovered ever about one thing—his coat.<br/><br/>At last poor Akakii Akakievich breathed his last. They sealed up neither his room nor his effects, because, in the first place, there were no heirs, and, in the second, there was very little inheritance; namely, a bunch of goose-quills, a quire of white official paper, three pairs of socks, two or three buttons which had burst off his trousers, and the “mantle” already known to the reader. To whom all this fell, God knows. I confess that the person who told this tale took no interest in the matter. They carried Akakii Akakievich out, and buried him. And Petersburg was left without Akakii Akakievich, as though he had never lived there. A being disappeared, and was hidden, who was protected by none, dear to none, interesting to none, who never even attracted to himself the attention of an observer of nature, who omits no opportunity of thrusting a pin through a common fly, and examining it under the microscope—a being who bore meekly the jibes of the department, and went to his grave without having done one unusual deed, but to whom, nevertheless, at the close of his life, appeared a bright visitant in the form of a coat, which momentarily cheered his poor life, and upon whom, thereafter, an intolerable misfortune descended, just as it descends upon the heads of the mighty of this world!<br type="_moz"/><br/>', '2011-06-13 12:45:54', '2011-06-13 12:45:54', NULL, NULL, 'filed discussion did akakii akakievich hear fatal words heard did produce overwhelming effect did lament bitterness life —we know continued raving parching condition visions incessantly appeared stranger saw petrovich ordered make coat traps robbers bed cried moment landlady pull robber coverlet inquired old “mantle” hung new overcoat fancied standing general listening thorough setting saying “forgive excellency ” began curse uttering horrible words aged landlady crossed herself life having heard kind him—the words followed directly words excellency later talked utter nonsense understood evident incoherent words thoughts hovered thing—his coat br br poor akakii akakievich breathed sealed room effects place heirs second little inheritance bunch goose quills quire white official paper pairs socks buttons burst trousers “mantle” known reader fell god knows confess person told tale took matter carried akakii akakievich buried petersburg left akakii akakievich lived disappeared hidden protected dear interesting attracted himself attention observer nature omits opportunity thrusting pin common fly examining microscope—a bore meekly jibes department went grave having unusual deed close life appeared bright visitant form coat momentarily cheered poor life intolerable misfortune descended just descends heads mighty world br type _moz br ');
INSERT INTO "posts" VALUES (4, 1, 3, '<b>Having seized him by the collar, </b>he summoned, with a shout, two of his comrades, whom he enjoined to hold him fast, while he himself felt for a moment in his boot, in order to draw thence his snuff-box, to refresh his six times forever frozen nose; but the snuff was of a sort which even a corpse could not endure. The policeman had no sooner succeeded, having closed his right nostril with his finger, in holding half a handful up to the left, than the corpse sneezed so violently that he completely filled the eyes of all three. While they raised their fists to wipe them, the dead man vanished utterly, so that they positively did not know whether they had actually had him in their hands at all. Thereafter the watchmen conceived such a terror of dead men, that they were afraid even to seize the living; and only screamed from a distance, “Hey, there! go your way!” and the dead official began to appear, even beyond the Kalinkin Bridge, causing no little terror to all timid people.<br type="_moz"/><br/>', '2011-06-13 12:50:51', '2011-06-13 12:50:51', NULL, NULL, 'sticky discussion b having seized collar b summoned shout comrades enjoined hold fast himself felt moment boot order draw snuff box refresh times forever frozen nose snuff sort corpse endure policeman sooner succeeded having closed right nostril finger holding half handful left corpse sneezed violently completely filled eyes raised fists wipe dead man vanished utterly positively did know actually hands watchmen conceived terror dead men afraid seize living screamed distance “hey way ” dead official began appear kalinkin bridge causing little terror timid people br type _moz br ');
INSERT INTO "posts" VALUES (5, 1, 4, 'This one should appear second. <br/><br/>Wishing to divert his mind in some way, and forget the disagreeable impression, he set out that evening for one of his friends’ houses, where he found quite a large party assembled; and, what was better, nearly every one was of the same rank, so that he need not feel in the least constrained. This had a marvellous effect upon his mental state. He expanded, made himself agreeable in conversation, charming: in short, he passed a delightful evening. After supper he drank a couple of glasses of champagne—not a bad recipe for cheerfulness, as every one knows. The champagne inclined him to various out-of-the-way adventures; and, in particular, he determined not to go home, but to go to see a certain well-known lady, Karolina Ivanovna, a lady, it appears, of German extraction, with whom he felt on a very friendly footing.<br type="_moz"/><br/>', '2011-06-13 12:52:40', '2011-06-13 12:52:40', NULL, NULL, 'unsticky discussion appear second br br wishing divert mind way forget disagreeable impression set evening friends’ houses quite large party assembled better nearly rank need feel constrained marvellous effect mental state expanded himself agreeable conversation charming short passed delightful evening supper drank couple glasses champagne—not bad recipe cheerfulness knows champagne inclined various way adventures particular determined home certain known lady karolina ivanovna lady appears german extraction felt friendly footing br type _moz br ');


CREATE TABLE "readers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "site_id" integer, "name" varchar(100), "email" varchar(255), "login" varchar(40) DEFAULT '' NOT NULL, "crypted_password" varchar(255), "description" text, "notes" text, "trusted" boolean DEFAULT 't', "receive_email" boolean DEFAULT 'f', "receive_essential_email" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "password_salt" varchar(255), "session_token" varchar(255), "provisional_password" varchar(255), "activated_at" datetime, "honorific" varchar(255), "user_id" integer, "last_request_at" datetime, "last_login_at" datetime, "persistence_token" varchar(255) DEFAULT '' NOT NULL, "single_access_token" varchar(255) DEFAULT '' NOT NULL, "perishable_token" varchar(255) DEFAULT '' NOT NULL, "login_count" integer DEFAULT 0 NOT NULL, "failed_login_count" integer DEFAULT 0 NOT NULL, "current_login_ip" varchar(255), "last_login_ip" varchar(255), "clear_password" varchar(255), "forename" varchar(255), "phone" varchar(255), "organisation" varchar(255), "post_building" varchar(255), "post_street" varchar(255), "post_place" varchar(255), "post_town" varchar(255), "post_county" varchar(255), "postcode" varchar(255), "posts_count" integer DEFAULT 0, "old_id" integer);
INSERT INTO "readers" VALUES (1, NULL, 'Administrator', 'admin@spanner.org', 'admin', 'c04d0d01862cf5a95c01bdc02f3a2a0ae281d1d0', 'Administrator is a frustrated herb gardener who in another age would have enjoyed a happy life as a Benedictine cook, but in the 21st century finds himself lodged in a drab world of data integrity and serial disappointment.', NULL, 't', 'f', 't', '2011-06-08 11:42:06', '2011-06-14 12:50:44', 1, 1, 'dfce9511ed579f5e96f53135f7ee362a63f66504', NULL, NULL, '2011-06-08 11:42:06', NULL, 1, '2011-06-14 12:50:44', NULL, '7f492e26af3346fd8ee781066c50436dfa02d7efb18b8cb79a1b1b408d2221fbcad5bc0260af271d829cf710047d8515d13e530438d0b83cb64c4b1905d9dfde', '1OZTOaN1n5xEGckw8Rd', 'c90qkeRUygYuRovkctyC', 517, 0, '127.0.0.1', '127.0.0.1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);


CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES ('1');
INSERT INTO "schema_migrations" VALUES ('2');
INSERT INTO "schema_migrations" VALUES ('3');
INSERT INTO "schema_migrations" VALUES ('4');
INSERT INTO "schema_migrations" VALUES ('5');
INSERT INTO "schema_migrations" VALUES ('6');
INSERT INTO "schema_migrations" VALUES ('7');
INSERT INTO "schema_migrations" VALUES ('8');
INSERT INTO "schema_migrations" VALUES ('9');
INSERT INTO "schema_migrations" VALUES ('10');
INSERT INTO "schema_migrations" VALUES ('11');
INSERT INTO "schema_migrations" VALUES ('12');
INSERT INTO "schema_migrations" VALUES ('13');
INSERT INTO "schema_migrations" VALUES ('14');
INSERT INTO "schema_migrations" VALUES ('15');
INSERT INTO "schema_migrations" VALUES ('16');
INSERT INTO "schema_migrations" VALUES ('17');
INSERT INTO "schema_migrations" VALUES ('18');
INSERT INTO "schema_migrations" VALUES ('19');
INSERT INTO "schema_migrations" VALUES ('20');
INSERT INTO "schema_migrations" VALUES ('21');
INSERT INTO "schema_migrations" VALUES ('20081203140407');
INSERT INTO "schema_migrations" VALUES ('20090226140109');
INSERT INTO "schema_migrations" VALUES ('20090929164633');
INSERT INTO "schema_migrations" VALUES ('20091003095744');
INSERT INTO "schema_migrations" VALUES ('20100805154952');
INSERT INTO "schema_migrations" VALUES ('20100805155020');
INSERT INTO "schema_migrations" VALUES ('20100810151922');
INSERT INTO "schema_migrations" VALUES ('Clipped-1');
INSERT INTO "schema_migrations" VALUES ('Clipped-2');
INSERT INTO "schema_migrations" VALUES ('Clipped-3');
INSERT INTO "schema_migrations" VALUES ('Clipped-4');
INSERT INTO "schema_migrations" VALUES ('Clipped-5');
INSERT INTO "schema_migrations" VALUES ('Clipped-20090316132151');
INSERT INTO "schema_migrations" VALUES ('Clipped-20110513205050');
INSERT INTO "schema_migrations" VALUES ('Clipped-20110606111250');
INSERT INTO "schema_migrations" VALUES ('Reader-1');
INSERT INTO "schema_migrations" VALUES ('Reader-2');
INSERT INTO "schema_migrations" VALUES ('Reader-3');
INSERT INTO "schema_migrations" VALUES ('Reader-4');
INSERT INTO "schema_migrations" VALUES ('Reader-5');
INSERT INTO "schema_migrations" VALUES ('Reader-7');
INSERT INTO "schema_migrations" VALUES ('Reader-20090921125653');
INSERT INTO "schema_migrations" VALUES ('Reader-20090924164413');
INSERT INTO "schema_migrations" VALUES ('Reader-20090925081225');
INSERT INTO "schema_migrations" VALUES ('Reader-20091006102438');
INSERT INTO "schema_migrations" VALUES ('Reader-20091010083503');
INSERT INTO "schema_migrations" VALUES ('Reader-20091019124021');
INSERT INTO "schema_migrations" VALUES ('Reader-20091020133533');
INSERT INTO "schema_migrations" VALUES ('Reader-20091020135152');
INSERT INTO "schema_migrations" VALUES ('Reader-20091111090819');
INSERT INTO "schema_migrations" VALUES ('Reader-20091119092936');
INSERT INTO "schema_migrations" VALUES ('Reader-20100922152338');
INSERT INTO "schema_migrations" VALUES ('Reader-20101004074945');
INSERT INTO "schema_migrations" VALUES ('Reader-20101019094714');
INSERT INTO "schema_migrations" VALUES ('Forum-1');
INSERT INTO "schema_migrations" VALUES ('Forum-2');
INSERT INTO "schema_migrations" VALUES ('Forum-3');
INSERT INTO "schema_migrations" VALUES ('Forum-4');
INSERT INTO "schema_migrations" VALUES ('Forum-5');
INSERT INTO "schema_migrations" VALUES ('Forum-6');
INSERT INTO "schema_migrations" VALUES ('Forum-7');
INSERT INTO "schema_migrations" VALUES ('Forum-8');
INSERT INTO "schema_migrations" VALUES ('Forum-20090824111005');
INSERT INTO "schema_migrations" VALUES ('Forum-20101222160900');
INSERT INTO "schema_migrations" VALUES ('Forum-20101222163605');
INSERT INTO "schema_migrations" VALUES ('Forum-20110105103827');
INSERT INTO "schema_migrations" VALUES ('Forum-20110127113852');
INSERT INTO "schema_migrations" VALUES ('Reader Group-1');
INSERT INTO "schema_migrations" VALUES ('Reader Group-20090921125654');
INSERT INTO "schema_migrations" VALUES ('Reader Group-20091120083119');
INSERT INTO "schema_migrations" VALUES ('Reader Group-20110214101339');
INSERT INTO "schema_migrations" VALUES ('Group Forum-1');
INSERT INTO "schema_migrations" VALUES ('Group Forum-20091008101339');
INSERT INTO "schema_migrations" VALUES ('Reader-20110214101339');
INSERT INTO "schema_migrations" VALUES ('Reader-20090921125654');
INSERT INTO "schema_migrations" VALUES ('Reader-20091120083119');
INSERT INTO "schema_migrations" VALUES ('Clipped-20110609101438');
INSERT INTO "schema_migrations" VALUES ('Forum-20110613112823');
INSERT INTO "schema_migrations" VALUES ('Forum-20110111080550');
INSERT INTO "schema_migrations" VALUES ('Forum-20110613130230');


CREATE TABLE "sessions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" varchar(255), "data" text, "updated_at" datetime);


CREATE TABLE "snippets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100) DEFAULT '' NOT NULL, "filter_id" varchar(25), "content" text, "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "lock_version" integer DEFAULT 0);


CREATE TABLE "topics" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "forum_id" integer, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "replied_at" datetime, "hits" integer DEFAULT 0, "sticky" boolean DEFAULT 'f', "locked" boolean DEFAULT 'f', "replied_by_id" integer, "old_id" integer);
INSERT INTO "topics" VALUES (1, 3, 'Loose discussion', '2011-06-08 13:38:05', '2011-06-13 12:48:09', '2011-06-13 08:01:46', 0, 'f', 'f', 1, NULL);
INSERT INTO "topics" VALUES (2, 1, 'Filed discussion', '2011-06-13 12:45:54', '2011-06-13 12:45:54', '2011-06-13 12:45:54', 0, 'f', 'f', 1, NULL);
INSERT INTO "topics" VALUES (3, 3, 'Sticky discussion', '2011-06-13 12:50:51', '2011-06-13 12:50:51', '2011-06-13 12:50:51', 0, 't', 'f', 1, NULL);
INSERT INTO "topics" VALUES (4, 3, 'Unsticky discussion', '2011-06-13 12:52:40', '2011-06-13 12:52:40', '2011-06-13 12:52:40', 0, 'f', 'f', 1, NULL);


CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100), "email" varchar(255), "login" varchar(40) DEFAULT '' NOT NULL, "password" varchar(40), "created_at" datetime, "updated_at" datetime, "created_by_id" integer, "updated_by_id" integer, "admin" boolean DEFAULT 'f' NOT NULL, "designer" boolean DEFAULT 'f' NOT NULL, "notes" text, "lock_version" integer DEFAULT 0, "salt" varchar(255), "session_token" varchar(255), "locale" varchar(255));
INSERT INTO "users" VALUES (1, 'Administrator', 'admin@spanner.org', 'admin', 'c04d0d01862cf5a95c01bdc02f3a2a0ae281d1d0', '2011-06-08 11:42:06', '2011-06-13 14:49:31', NULL, 1, 't', 'f', NULL, 2, 'dfce9511ed579f5e96f53135f7ee362a63f66504', '0455c803263595a2b98ed41aa6346c9055cd1de1', NULL);

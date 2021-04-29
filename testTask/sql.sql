CREATE  TABLE "public".roles ( 
	id                   uuid  NOT NULL ,
	role_name            text  NOT NULL ,
	CONSTRAINT pk_roles_id PRIMARY KEY ( id )
 );

CREATE  TABLE "public".users ( 
	id                   uuid  NOT NULL ,
	name                 text  NOT NULL ,
	CONSTRAINT pk_users_id PRIMARY KEY ( id )
 );

CREATE  TABLE "public".userrole ( 
	user_id              uuid  NOT NULL ,
	role_id              uuid  NOT NULL 
 );

ALTER TABLE "public".userrole ADD CONSTRAINT fk_userrole_users FOREIGN KEY ( user_id ) REFERENCES "public".users( id );

ALTER TABLE "public".userrole ADD CONSTRAINT fk_userrole_roles FOREIGN KEY ( role_id ) REFERENCES "public".roles( id );

INSERT INTO 
    users (id, name)
VALUES
    ('79458942-2614-4a4c-be19-e5bf65a9e8ce','user name 1'),
    ('f4db87e9-855a-4034-9427-68435e0f7695','user name 2'),
    ('8d53b565-347b-4e60-81b9-ae7123e2080e','user name 3'),
    ('ee31c683-2add-4e4e-bcbc-6fe50a40c755','user name 4'),
    ('c228775d-aa28-4dcd-b2be-f79ebd146a67','user name 5'),
    ('a8edea48-6d82-4c8f-aace-ae065da1f82b','user name 6'),
    ('e57ce460-4dcc-40a0-9c9d-a42634eaa079','user name 7'),
    ('6c693fa8-7b36-4266-a22e-b97668ec71bc','user name 8'),
    ('a68139aa-0083-4fd9-ab3e-044a0258c1bb','user name 9'),
	('f0921150-c1eb-4f78-ba36-08cb58ceb897','user name 10');
	
INSERT INTO 
    roles (id, role_name)
VALUES
    ('f7ed9b56-d351-4d1e-b2ab-ec326a000342','role name 1'),
    ('882a7b5e-cfdc-4ab9-a69f-1bf5192894ee','role name 2'),
    ('77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1','role name 3');
	
INSERT INTO 
    userrole (user_id, role_id)
VALUES
    ('79458942-2614-4a4c-be19-e5bf65a9e8ce','f7ed9b56-d351-4d1e-b2ab-ec326a000342'),
    ('f4db87e9-855a-4034-9427-68435e0f7695','882a7b5e-cfdc-4ab9-a69f-1bf5192894ee'),
    ('8d53b565-347b-4e60-81b9-ae7123e2080e','77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1'),
    ('ee31c683-2add-4e4e-bcbc-6fe50a40c755','882a7b5e-cfdc-4ab9-a69f-1bf5192894ee'),
    ('c228775d-aa28-4dcd-b2be-f79ebd146a67','882a7b5e-cfdc-4ab9-a69f-1bf5192894ee'),
    ('a8edea48-6d82-4c8f-aace-ae065da1f82b','77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1'),
    ('e57ce460-4dcc-40a0-9c9d-a42634eaa079','882a7b5e-cfdc-4ab9-a69f-1bf5192894ee'),
    ('6c693fa8-7b36-4266-a22e-b97668ec71bc','77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1'),
    ('a68139aa-0083-4fd9-ab3e-044a0258c1bb','77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1'),
	('f0921150-c1eb-4f78-ba36-08cb58ceb897','77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1'),
    ('79458942-2614-4a4c-be19-e5bf65a9e8ce','882a7b5e-cfdc-4ab9-a69f-1bf5192894ee'),
    ('f4db87e9-855a-4034-9427-68435e0f7695','f7ed9b56-d351-4d1e-b2ab-ec326a000342'),
    ('8d53b565-347b-4e60-81b9-ae7123e2080e','f7ed9b56-d351-4d1e-b2ab-ec326a000342'),
    ('ee31c683-2add-4e4e-bcbc-6fe50a40c755','77bbdcd0-13a3-4bbb-8d6b-e4fa218323f1'),
    ('c228775d-aa28-4dcd-b2be-f79ebd146a67','f7ed9b56-d351-4d1e-b2ab-ec326a000342'),
    ('ee31c683-2add-4e4e-bcbc-6fe50a40c755','f7ed9b56-d351-4d1e-b2ab-ec326a000342');
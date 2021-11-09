CREATE TABLE users(
ID						VARCHAR2(20)	NOT NULL  PRIMARY KEY,
uname					VARCHAR2(10)	NOT NULL,
nickname				VARCHAR2(20)	NOT NULL,
password				VARCHAR2(20)	NOT NULL,
email					VARCHAR2(50)	NOT NULL UNIQUE,
phone					VARCHAR2(14)	NULL ,
address1				VARCHAR2(150)	NULL ,
address2				VARCHAR2(50)	NULL ,
gender					VARCHAR(10) 	NULL ,
birth					DATE NOT NULL,
rdate					DATE NOT NULL,
fileName				VARCHAR2(50)  NOT NULL,
grade					VARCHAR2(1)  DEFAULT 'H'  NOT NULL
);

COMMENT ON TABLE users is '회원';
COMMENT ON COLUMN users.ID is '아이디';
COMMENT ON COLUMN users.uname is '성명';
COMMENT ON COLUMN users.nickname is '별명';
COMMENT ON COLUMN users.password is '비밀번호';
COMMENT ON COLUMN users.email is '이메일';
COMMENT ON COLUMN users.phone is '전화번호';
COMMENT ON COLUMN users.address1 is '주소';
COMMENT ON COLUMN users.address2 is '상세주소';
COMMENT ON COLUMN users.gender is '성별';
COMMENT ON COLUMN users.rdate is '가입일';
COMMENT ON COLUMN users.fileName is '회원사진';
COMMENT ON COLUMN users.grade is '회원등급';


CREATE TABLE tour(
tID                  number                                              NOT NULL           PRIMARY KEY,
title                varchar2(100)                                       NOT NULL,
writer               varchar2(20)                                        NOT NULL,
rdate                DATE                                                NOT NULL,
viewcnt              number              DEFAULT 0           NOT NULL,
score                number                DEFAULT 0         NOT NULL
                                                                                        CHECK (score BETWEEN 0 AND 5.1),
contents              clob                                               NOT NULL,
password             varchar2(20)                                    NOT NULL,
ID                   varchar2(20)                                    NOT NULL,
fileName             varchar2(45)                                NULL,
       
FOREIGN KEY (ID)    REFERENCES USERS
);

CREATE TABLE reply (
       trID                 number                      NOT NULL,
       content              long                        NOT NULL,
       tID                  NUMBER                  NOT NULL,
       ID                   VARCHAR2(20)        NOT NULL,
       rdate                DATE                        NOT NULL,
    
        PRIMARY KEY (trID),
        FOREIGN KEY (tID)    REFERENCES spot,
        FOREIGN KEY (ID)     REFERENCES USERS

);

CREATE TABLE office (
        oID                  number NOT NULL,

       uname                varchar2(20) NOT NULL,
       Address              varchar2(60) NOT NULL,
       WebAddress           varchar2(40) NULL,
       phone                varchar2(14) NOT NULL,
       fileName             varchar2(45) NOT NULL,
       content              clob NOT NULL,
       ID                   VARCHAR2(20)        NOT NULL,
       
        PRIMARY KEY (oID),
        FOREIGN KEY (ID)     REFERENCES USERS
);



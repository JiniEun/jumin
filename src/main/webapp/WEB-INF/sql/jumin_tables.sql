-- table 생성 부분 합친 sql 파일.


-- eunjin
-- users
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
fileName				VARCHAR2(50) NOT NULL,
grade					VARCHAR2(1)  DEFAULT 'H'  NOT NULL
); --13

ALTER TABLE users MODIFY fileName VARCHAR2(50) NULL;
ALTER TABLE users ADD regionID NUMBER NULL;

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


CREATE TABLE notice(
  nID			NUMBER			NOT NULL PRIMARY KEY,
  title         VARCHAR2(300)			NOT NULL,
  content       CLOB					NOT NULL,
  viewcnt       NUMBER(10)  DEFAULT 0   NOT NULL ,
  rdate         DATE					NOT NULL,
  ID			VARCHAR2(20)				NOT NULL,
  FOREIGN KEY (ID) REFERENCES users    
);
--ALTER TABLE notice ADD uname VARCHAR2(10)	NOT NULL;
--ALTER TABLE notice DROP COLUMN uname;
--ALTER TABLE notice ADD CONSTRAINT FK_uname FOREIGN KEY(uname) REFERENCES users(uname);



COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.nID is '글 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.password is '패스워드';
COMMENT ON COLUMN notice.viewcnt is '조회수';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.ID is '작성자 아이디';

CREATE TABLE spot(
sID                  number       		NOT NULL	PRIMARY KEY,
title                varchar2(100)		NOT NULL,
writer               varchar2(20)		NOT NULL,
rdate                DATE				NOT NULL,
viewcnt              number              DEFAULT 0           NOT NULL,
score                number                DEFAULT 0         NOT NULL
    				CHECK (score BETWEEN 0 AND 5.1),
contents              clob				NOT NULL,
password             varchar2(20)		NOT NULL,
ID                   varchar2(20)		NOT NULL,
fileName             varchar2(45)		NULL,
       
FOREIGN KEY (ID)    REFERENCES users
);

CREATE TABLE sreply (
       srID                 number                      NOT NULL,
       content              long                        NOT NULL,
       sID                  NUMBER                  NOT NULL,
       ID                   VARCHAR2(20)        NOT NULL,
       rdate                DATE                        NOT NULL,
    
        PRIMARY KEY (srID),
        FOREIGN KEY (sID)    REFERENCES spot,
        FOREIGN KEY (ID)     REFERENCES users

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
        FOREIGN KEY (ID)     REFERENCES users
);


CREATE TABLE friend(
fID                  NUMBER  NOT NULL  PRIMARY KEY,
rID                  VARCHAR2(20)  NOT NULL,
fbID                 NUMBER  NOT NULL,
FOREIGN KEY(rID) REFERENCES users(ID) ON DELETE CASCADE,
FOREIGN KEY(fbID) REFERENCES fboard(fbID) ON DELETE CASCADE,
userID                  VARCHAR2(20)  NOT NULL,
status               VARCHAR2(10)  NULL,
rdate                DATE          NOT NULL
);

COMMENT ON TABLE friend is '친구매칭';
COMMENT ON COLUMN friend.fID is '매칭번호';
COMMENT ON COLUMN friend.rID is '신청자 아이디';
COMMENT ON COLUMN friend.fbID is '작성글 번호';
COMMENT ON COLUMN friend.userID is '작성자 아이디';
COMMENT ON COLUMN friend.status is '매칭상태';
COMMENT ON COLUMN friend.rdate is '매칭일';


CREATE TABLE fboard(
fbID                           NUMBER  NOT NULL  PRIMARY KEY,
category                       VARCHAR2(5) NOT NULL,
title                          VARCHAR2(100)  NOT NULL,
content                        CLOB NOT NULL ,
password                       VARCHAR2(20)  NOT NULL,
viewcnt                        NUMBER DEFAULT 0,
rdate                          DATE          NOT NULL,
userID 						VARCHAR2(20)	NOT NULL,
FOREIGN KEY(userID) REFERENCES users(ID) ON DELETE CASCADE
);

ALTER TABLE fboard ADD nickname VARCHAR2(20)	NOT NULL;
ALTER TABLE fboard ADD regionID NUMBER NULL;

COMMENT ON TABLE fboard is '매칭게시판';
COMMENT ON COLUMN fboard.fbID is '글 번호';
COMMENT ON COLUMN fboard.category is '카테고리';
COMMENT ON COLUMN fboard.title is '제목';
COMMENT ON COLUMN fboard.content is '내용';
COMMENT ON COLUMN fboard.password is '패스워드';
COMMENT ON COLUMN fboard.viewcnt is '조회수';
COMMENT ON COLUMN fboard.rdate is '등록일';
COMMENT ON COLUMN fboard.userID is '작성자 아이디';
COMMENT ON COLUMN fboard.nickname is '작성자 별명';

CREATE TABLE club(
clID                           NUMBER  NOT NULL  PRIMARY KEY,
title                          VARCHAR2(100)  NOT NULL,
content                        CLOB NOT NULL ,
password                       VARCHAR2(20)  NOT NULL,
viewcnt                        NUMBER DEFAULT 0,
rdate                          DATE          NOT NULL,
fileName                       VARCHAR2(50)  NULL,
ID 						VARCHAR2(20)	NOT NULL,
FOREIGN KEY(ID) REFERENCES users(ID) ON DELETE CASCADE
);

ALTER TABLE club ADD nickname VARCHAR2(20)	NOT NULL;

COMMENT ON TABLE club is '동호회게시판';
COMMENT ON COLUMN club.clID is '글 번호';
COMMENT ON COLUMN club.title is '제목';
COMMENT ON COLUMN club.content is '내용';
COMMENT ON COLUMN club.password is '패스워드';
COMMENT ON COLUMN club.viewcnt is '조회수';
COMMENT ON COLUMN club.rdate is '등록일';
COMMENT ON COLUMN club.fileName is '업로드사진';
COMMENT ON COLUMN club.ID is '작성자 아이디';
COMMENT ON COLUMN club.nickname is '작성자 별명';


CREATE TABLE clReply(
clrID                          NUMBER  NOT NULL  PRIMARY KEY,
content                        LONG NOT NULL ,
rdate                          DATE          NOT NULL,
clID                           NUMBER  NOT NULL,
ID 						VARCHAR2(20)	NOT NULL,
FOREIGN KEY(clID) REFERENCES club(clID) ON DELETE CASCADE,
FOREIGN KEY(ID) REFERENCES users(ID) ON DELETE CASCADE
);

ALTER TABLE clReply ADD nickname VARCHAR2(20)	NOT NULL;

COMMENT ON TABLE clReply is '동호회게시판 댓글';
COMMENT ON COLUMN clReply.clrID is '댓글 번호';
COMMENT ON COLUMN clReply.content is '내용';
COMMENT ON COLUMN clReply.rdate is '등록일';
COMMENT ON COLUMN clReply.clID is '동호회 글 번호';
COMMENT ON COLUMN clReply.ID is '작성자 아이디';
COMMENT ON COLUMN clReply.nickname is '작성자 별명';

CREATE TABLE market(
                mId         NUMBER           NOT NULL,
                viewcnt     NUMBER           NOT NULL,
                rdate       DATE             NOT NULL,
                title       VARCHAR2(300)    NOT NULL,
                content     VARCHAR2(500)    NOT NULL,
                id          VARCHAR2(20)     NOT NULL,
                category    VARCHAR2(5)      NOT NULL,
                fileName    VARCHAR2(50)     NOT NULL,
               
        PRIMARY KEY (mId),
        FOREIGN KEY (id) REFERENCES users     
);
ALTER TABLE market ADD nickname VARCHAR2(20)	NOT NULL;
 
 
CREATE TABLE mReply(
            mrId        NUMBER           NOT NULL,
            rdate       DATE             NOT NULL,
            content     VARCHAR2(500)    NOT NULL,
            mId         NUMBER           NOT NULL,
            id          VARCHAR2(20)     NOT NULL,

        PRIMARY KEY (mrId),
        FOREIGN KEY (mId) REFERENCES market,
        FOREIGN KEY (id) REFERENCES users
);

ALTER TABLE mReply ADD nickname VARCHAR2(20)	NOT NULL;

CREATE TABLE community(
                cId         NUMBER           NOT NULL,
                viewcnt     NUMBER           NOT NULL,
                rdate       DATE             NOT NULL,
                title       VARCHAR2(300)    NOT NULL,
                content     VARCHAR2(500)    NOT NULL,
                id          VARCHAR2(20)     NOT NULL,
                category    VARCHAR2(5)      NOT NULL,
                
               
        PRIMARY KEY (cId),
        FOREIGN KEY (id) REFERENCES users  
);

ALTER TABLE community ADD nickname VARCHAR2(20)	NOT NULL;

CREATE TABLE cReply(
            crID        NUMBER           NOT NULL,
            rdate       DATE             NOT NULL,
            content     VARCHAR2(500)    NOT NULL,
            cID         NUMBER           NOT NULL,
            id          VARCHAR2(20)     NOT NULL,

        PRIMARY KEY (crID),
        FOREIGN KEY (cID) REFERENCES community,
        FOREIGN KEY (id) REFERENCES users
);

ALTER TABLE cReply ADD nickname VARCHAR2(20)	NOT NULL;

CREATE TABLE regioncode(
codeID	NUMBER  NOT NULL  PRIMARY KEY,
codenum VARCHAR2(3)  NOT NULL,
region	VARCHAR2(10) NOT NULL
);

insert into regioncode values(1, '02','서울');
insert into regioncode values(2, '051','부산');
insert into regioncode values(3, '053','대구');
insert into regioncode values(4, '032','인천');
insert into regioncode values(5, '062','광주');
insert into regioncode values(6, '042','대전');
insert into regioncode values(7, '052','울산');
insert into regioncode values(8, '044','세종');
insert into regioncode values(9, '031','경기');
insert into regioncode values(10, '033','강원');
insert into regioncode values(11, '043','충북');
insert into regioncode values(12, '041','충남');
insert into regioncode values(13, '063','전북');
insert into regioncode values(14, '061','전남');
insert into regioncode values(15, '054','경북');
insert into regioncode values(16, '055','경남');
insert into regioncode values(17, '064','제주');




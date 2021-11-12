
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
fileName				VARCHAR2(50)  NOT NULL,
grade					VARCHAR2(1)  DEFAULT 'H'  NOT NULL
); --13

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
  password      VARCHAR2 (20)			NULL,
  viewcnt       NUMBER(10)  DEFAULT 0   NOT NULL ,
  rdate         DATE					NOT NULL,
  ID			VARCHAR2(20)				NOT NULL,
  FOREIGN KEY (ID) REFERENCES users    
);

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.nID is '글 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.password is '패스워드';
COMMENT ON COLUMN notice.viewcnt is '조회수';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.ID is '작성자 아이디';









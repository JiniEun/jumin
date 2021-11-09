CREATE TABLE fboard(
fbID                           NUMBER  NOT NULL  PRIMARY KEY,
category                       VARCHAR2(5) NOT NULL,
title                          VARCHAR2(100)  NOT NULL,
content                        CLOB NOT NULL ,
password                       VARCHAR2(20)  NOT NULL,
viewcnt                        NUMBER DEFAULT 0,
rdate                          DATE          NOT NULL,
FOREIGN KEY(uID) REFERENCES user(ID) ON DELETE CASCADE
);

COMMENT ON TABLE fboard is '매칭게시판';
COMMENT ON COLUMN fboard.fbID is '글 번호';
COMMENT ON COLUMN fboard.category is '카테고리';
COMMENT ON COLUMN fboard.title is '제목';
COMMENT ON COLUMN fboard.content is '내용';
COMMENT ON COLUMN fboard.password is '패스워드';
COMMENT ON COLUMN notice.viewcnt is '조회수';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.uID is '작성자 아이디';
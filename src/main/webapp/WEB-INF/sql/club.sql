CREATE TABLE club(
clID                           NUMBER  NOT NULL  PRIMARY KEY,
title                          VARCHAR2(100)  NOT NULL,
content                        CLOB NOT NULL ,
password                       VARCHAR2(20)  NOT NULL,
viewcnt                        NUMBER DEFAULT 0,
rdate                          DATE          NOT NULL,
fileName                       VARCHAR2(50)  NULL,
FOREIGN KEY(ID) REFERENCES user(ID) ON DELETE CASCADE
);

COMMENT ON TABLE club is '동호회게시판';
COMMENT ON COLUMN notice.clID is '글 번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.password is '패스워드';
COMMENT ON COLUMN notice.viewcnt is '조회수';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.fileName is '업로드사진';
COMMENT ON COLUMN notice.ID is '작성자 아이디';




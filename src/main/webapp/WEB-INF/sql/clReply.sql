CREATE TABLE clReply(
clrID                          NUMBER  NOT NULL  PRIMARY KEY,
content                        LONG NOT NULL ,
rdate                          DATE          NOT NULL,
FOREIGN KEY(clID) REFERENCES club(clID) ON DELETE CASCADE,
FOREIGN KEY(ID) REFERENCES user(ID) ON DELETE CASCADE
);

COMMENT ON TABLE clReply is '동호회게시판 댓글';
COMMENT ON COLUMN clReply.fbID is '댓글 번호';
COMMENT ON COLUMN clReply.content is '내용';
COMMENT ON COLUMN clReply.rdate is '등록일';
COMMENT ON COLUMN clReply.clID is '동호회 글 번호';
COMMENT ON COLUMN clReply.ID is '작성자 아이디';
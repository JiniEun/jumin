CREATE TABLE friend(
fID                  NUMBER  NOT NULL  PRIMARY KEY,
FOREIGN KEY(rID) REFERENCES user(ID) ON DELETE CASCADE,
FOREIGN KEY(fbID) REFERENCES fboard(fbID) ON DELETE CASCADE,
uID                  VARCHAR2(20)  NOT NULL,
status               VARCHAR2(10)  NULL,
rdate                DATE          NOT NULL
);

COMMENT ON TABLE friend is '친구매칭';
COMMENT ON COLUMN friend.fID is '매칭번호';
COMMENT ON COLUMN friend.rID is '신청자 아이디';
COMMENT ON COLUMN friend.fbID is '작성글 번호';
COMMENT ON COLUMN friend.uID is '작성자 아이디';
COMMENT ON COLUMN friend.status is '매칭상태';
COMMENT ON COLUMN friend.rdate is '매칭일';
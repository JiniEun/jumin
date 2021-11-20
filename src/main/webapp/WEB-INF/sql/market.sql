CREATE TABLE market(
                mId         NUMBER           NOT NULL,
                viewcnt     NUMNER           NOT NULL,
                rdate       DATE             NOT NULL,
                title       VARCHAR2(300)    NOT NULL,
                content     VARCHAR2(500)    NOT NULL,
                id          VARCHAR2(20)     NOT NULL,
                category    VARCHAR2(5)      NOT NULL,
                fileName    VARCHAR2(50)     NOT NULL,
               
        PRIMARY KEY (mId),
        FOREIGN KEY (id) REFERENCES user     
);

insert into market(mId, viewcnt, title, content, id, category, rdate, fileName)
values((select nvl(max(mId),0)+1 from market), 0, '의자 팔아요', 
'의자 팝니다.', 'user1', '전자제품', sysdate, 'chair.PNG');

select mId, viewcnt, title, content, id, category, rdate, fileName, r
from (
    select mId, viewcnt, title, content, id, category, rdate, fileName, rownum r
    from(
        select mId, viewcnt, title, content, id, category, rdate, fileName
        from market
        order by mId desc
    )
)where r >= 1 and r <= 12;

select * from market
ORDER BY mId DESC;

DELETE FROM market
WHERE mId=1;
 
 
CREATE TABLE mReply(
            mrId        NUMBER           NOT NULL,
            rdate       DATE             NOT NULL,
            content     VARCHAR2(500)    NOT NULL,
            mId         NUMBER           NOT NULL,
            id          VARCHAR2(20)     NOT NULL,

        PRIMARY KEY (mrId),
        FOREIGN KEY (mId) REFERENCES market,
        FOREIGN KEY (id) REFERENCES user
);
insert into mReply(mrId, rdate, content, mId, id)
values((select nvl(max(mrId),0)+1 from mReply), sysdate, '댓글답니다.', 1, 'user1');


CREATE TABLE community(
                cId         NUMBER           NOT NULL,
                viewcnt     NUMNER           NOT NULL,
                rdate       DATE             NOT NULL,
                title       VARCHAR2(300)    NOT NULL,
                content     VARCHAR2(500)    NOT NULL,
                id          VARCHAR2(20)     NOT NULL,
                category    VARCHAR2(50)      NOT NULL,
                
               
        PRIMARY KEY (cId),
        FOREIGN KEY (id) REFERENCES user     
);

insert into community(cId, viewcnt, title, content, id, category, rdate)
values((select nvl(max(cId),0)+1 from community), 0, '동네 커뮤니티입니다.', 
'자유롭게 작성하세요.', 'user1', '동네소식', sysdate);

select * from community
ORDER BY cId DESC;

select cId, viewcnt, title, content, id, category, rdate, r
from(
    SELECT cId, viewcnt, title, content, id, category, rdate, rownum r
    FROM(
            select cId, viewcnt, title, content, id, category, rdate
            from community
            ORDER BY cId DESC
        )
)where rownum <= 10;

UPDATE community
SET viewcnt = viewcnt + 1
WHERE cId=1;

UPDATE community
SET title='동네 커뮤니티 수정하기', content='수정 내용을 자유롭게 작성하세요.', id='user1'
WHERE cId=1;

DELETE FROM community
WHERE cId=1;


CREATE TABLE cReply(
            crID        NUMBER           NOT NULL,
            rdate       DATE             NOT NULL,
            content     VARCHAR2(500)    NOT NULL,
            cID         NUMBER           NOT NULL,
            id          VARCHAR2(20)     NOT NULL,

        PRIMARY KEY (crID),
        FOREIGN KEY (cID) REFERENCES community,
        FOREIGN KEY (id) REFERENCES user
);

insert into cReply(crID, rdate, content, cId, id)
values((select nvl(max(crId),0)+1 from cReply), sysdate, '댓글답니다.', 1, 'user1');
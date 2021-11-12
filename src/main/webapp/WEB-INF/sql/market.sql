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

CREATE TABLE community(
                cId         NUMBER           NOT NULL,
                viewcnt     NUMNER           NOT NULL,
                rdate       DATE             NOT NULL,
                title       VARCHAR2(300)    NOT NULL,
                content     VARCHAR2(500)    NOT NULL,
                id          VARCHAR2(20)     NOT NULL,
                category    VARCHAR2(5)      NOT NULL,
                
               
        PRIMARY KEY (cId),
        FOREIGN KEY (id) REFERENCES user     
);

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
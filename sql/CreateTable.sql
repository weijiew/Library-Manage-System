USE LMS

-- 书籍表
GO
CREATE TABLE Book (
    BNO VARCHAR(20) NOT NULL,
    BNAME VARCHAR(50) NULL,
    BAUTHOR VARCHAR(30) NULL,
    BPUB VARCHAR(30) NULL,
    BPRICE FLOAT NULL,
    PRIMARY KEY (BNO)
)
GO

-- 读者表
GO
CREATE TABLE Reader (
    RNO VARCHAR(10) NOT NULL,
    RNAME VARCHAR(8) NOT NULL,
    RSEX VARCHAR(2) NOT NULL,
    RTEL VARCHAR(8) NULL,
    RDEP VARCHAR(30) NULL,
    PRIMARY KEY (RNO)
)
GO

-- 借阅表
GO
CREATE TABLE BR (
    RNO VARCHAR(10) NOT NULL,
    BNO VARCHAR(20) NOT NULL,
    OUTDATE DATE NOT NULL,
    INDATE DATE NULL,
    -- PRIMARY KEY (RNO,BNO), 不能设置成主键，因为存在重复数据。
    FOREIGN KEY (RNO) REFERENCES reader(RNO),
    FOREIGN KEY (BNO) REFERENCES book(BNO)
)
GO

-- 用户表
GO
CREATE TABLE Userss (
    id INT NOT NULL, -- 用户 id
    username VARCHAR(50) NOT NULL, -- 用户名
    password VARCHAR(50) NOT NULL, -- 用户密码
    superUser int NOT NULL,     -- 超级用户 0 否 1 是
    RNO VARCHAR(10) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (RNO) REFERENCES reader(RNO),
)
GO

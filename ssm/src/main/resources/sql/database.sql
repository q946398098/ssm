-- ssmbuild.books definition

CREATE TABLE `books` (
                         `bookId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
                         `bookName` varchar(100) NOT NULL COMMENT '图书名称',
                         `bookCounts` int(11) NOT NULL COMMENT '馆藏数量',
                         `detail` varchar(100) NOT NULL,
                         `pictureUrl` varchar(100) DEFAULT NULL,
                         PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='图书表';

INSERT INTO ssmbuild.books (bookId, bookName, bookCounts, detail, pictureUrl) VALUES(1, 'Mysql', 10, '这是课本1的详情', '/img/mysql.png');
INSERT INTO ssmbuild.books (bookId, bookName, bookCounts, detail, pictureUrl) VALUES(2, 'Pgsql', 1, '这是课本1的详情', '/img/pgsql.png');
INSERT INTO ssmbuild.books (bookId, bookName, bookCounts, detail, pictureUrl) VALUES(3, 'Oracle', 1, '这是课本1的详情', '/img/oracle.png');
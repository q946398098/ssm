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



-- ssmbuild.`USER` definition

CREATE TABLE `USER` (
                        `cd_user` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
                        `ds_username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `ds_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `ds_sex` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `ds_city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `ds_sign` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `nr_money` decimal(10,0) DEFAULT NULL,
                        `ds_ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `nr_checkin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `dt_record` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                        `ds_password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'MD5',
                        UNIQUE KEY `cd_user` (`cd_user`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
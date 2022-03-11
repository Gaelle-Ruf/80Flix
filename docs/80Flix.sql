-- Adminer 4.8.1 MySQL 8.0.27-0ubuntu0.20.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `character`;
CREATE TABLE `character` (
    `id` int NOT NULL AUTO_INCREMENT,
    `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `bio` longtext COLLATE utf8mb4_unicode_ci,
    `age` int DEFAULT NULL,
    `truename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `img_upload` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `character_tv_show`;
CREATE TABLE `character_tv_show` (
    `character_id` int NOT NULL,
    `tv_show_id` int NOT NULL,
    PRIMARY KEY (`character_id`,`tv_show_id`),
    KEY `IDX_989C1BA01136BE75` (`character_id`),
    KEY `IDX_989C1BA05E3A35BB` (`tv_show_id`),
    CONSTRAINT `FK_989C1BA01136BE75` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_989C1BA05E3A35BB` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `episode`;
CREATE TABLE `episode` (
    `id` int NOT NULL AUTO_INCREMENT,
    `season_id` int NOT NULL,
    `episode_number` int NOT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `published_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
    `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
    `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    PRIMARY KEY (`id`),
    KEY `IDX_DDAA1CDA4EC001D1` (`season_id`),
    CONSTRAINT `FK_DDAA1CDA4EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `season`;
CREATE TABLE `season` (
    `id` int NOT NULL AUTO_INCREMENT,
    `tv_show_id` int NOT NULL,
    `season_number` int NOT NULL,
    `published_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
    `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
    `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    PRIMARY KEY (`id`),
    KEY `IDX_F0E45BA95E3A35BB` (`tv_show_id`),
    CONSTRAINT `FK_F0E45BA95E3A35BB` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tv_show`;
CREATE TABLE `tv_show` (
    `id` int NOT NULL AUTO_INCREMENT,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `nb_likes` int DEFAULT NULL,
    `published_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
    `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tv_show_category`;
CREATE TABLE `tv_show_category` (
    `tv_show_id` int NOT NULL,
    `category_id` int NOT NULL,
    PRIMARY KEY (`tv_show_id`,`category_id`),
    KEY `IDX_82897B525E3A35BB` (`tv_show_id`),
    KEY `IDX_82897B5212469DE2` (`category_id`),
    CONSTRAINT `FK_82897B5212469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_82897B525E3A35BB` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tv_show_user`;
CREATE TABLE `tv_show_user` (
    `tv_show_id` int NOT NULL,
    `user_id` int NOT NULL,
    PRIMARY KEY (`tv_show_id`,`user_id`),
    KEY `IDX_B57C2DB55E3A35BB` (`tv_show_id`),
    KEY `IDX_B57C2DB5A76ED395` (`user_id`),
    CONSTRAINT `FK_B57C2DB55E3A35BB` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE CASCADE,
    CONSTRAINT `FK_B57C2DB5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` int NOT NULL AUTO_INCREMENT,
    `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
    `roles` json NOT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
    `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
    `activation_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2022-03-07 17:16:43

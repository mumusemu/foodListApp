-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 08 Kas 2021, 12:19:18
-- Sunucu sürümü: 10.4.21-MariaDB
-- PHP Sürümü: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `selin_schema_task`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `foodText` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `foods`
--

INSERT INTO `foods` (`id`, `title`, `foodText`, `username`, `createdAt`, `updatedAt`, `UserId`) VALUES
(1, 'title1', 'foood', 'selinsezer', '2021-11-08 00:55:35', '2021-11-08 00:56:06', 2),
(2, 'title3', 'feşfke', 'selinsezer', '2021-11-08 00:58:07', '2021-11-08 00:58:07', 2),
(3, '4dsfsdf', 'dfsdfs', 'selinsezer', '2021-11-08 00:58:13', '2021-11-08 00:58:13', 2),
(4, '2.1', 'fodd2', 'selinsezer', '2021-11-08 07:40:56', '2021-11-08 08:35:52', 2),
(5, '5.1', 'ddd5', 'selinsezer', '2021-11-08 07:41:12', '2021-11-08 08:35:32', 2),
(6, 'ffff6', 'fff6', 'selinsezer', '2021-11-08 07:41:23', '2021-11-08 07:41:23', 2),
(8, 'dsd111', '1111', 'ayse', '2021-11-08 09:50:02', '2021-11-08 09:59:58', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `FoodId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'hon123', '$2b$10$qh1YoOtRebNdxE0xqo1qmu2vxysRXLTDpLy8jOn9An8qN.guQbFUW', '2021-11-08 00:27:56', '2021-11-08 00:27:56'),
(2, 'selinsezer', '$2b$10$Fb8tv0gUyjOery6c9XcNyuHP1bWENYAkN0G58iZgZej45X52QIYg.', '2021-11-08 00:30:53', '2021-11-08 00:30:53'),
(3, 'sifre', '$2b$10$4Kfkkaxd15xsSnkpJwMO0eUVzp/rqamWadChd3ZbTxQIRO.tyKhpe', '2021-11-08 00:48:04', '2021-11-08 00:48:04'),
(4, 'ayse', '$2b$10$cUuJoJ70yLsx1z/fmnq10ehcF6rFkoepkdWaMcvnFl4vLD4lJfD3a', '2021-11-08 09:26:39', '2021-11-08 09:26:39');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`);

--
-- Tablo için indeksler `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FoodId` (`FoodId`),
  ADD KEY `UserId` (`UserId`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

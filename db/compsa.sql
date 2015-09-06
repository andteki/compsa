-- phpMyAdmin SQL Dump
-- version 4.2.9.1
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2015. Sze 06. 21:07
-- Szerver verzió: 5.5.44-0ubuntu0.14.04.1
-- PHP verzió: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `compsa`
--
CREATE DATABASE IF NOT EXISTS `compsa` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `compsa`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `archive`
--

CREATE TABLE IF NOT EXISTS `archive` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `topic` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `solving` text COLLATE utf8_hungarian_ci NOT NULL,
  `exerciseId` int(11) NOT NULL,
  `class` varchar(10) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `exercises`
--

CREATE TABLE IF NOT EXISTS `exercises` (
`id` int(11) NOT NULL,
  `topic` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `exercise` text COLLATE utf8_hungarian_ci NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `pass` varchar(10) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `exercises`
--

INSERT INTO `exercises` (`id`, `topic`, `date`, `exercise`, `enable`, `teacherId`, `pass`) VALUES
(1, 'teszt dolgozat', '2015-09-03 18:44:26', '1.) Írd le a neved\r\n\r\n2.) Írd le mikor születtél\r\n\r\n3.) Írd le mi a dolgod\r\n', 0, 1, ''),
(2, 'Második tesztdolgozat', '2015-09-03 18:44:35', '1.) Írd le milyen nap van ma\r\n\r\n2.) Írd le te milyen napot szeretnél.', 0, 1, ''),
(3, 'Harmadik tesztdolgozat', '2015-08-03 19:54:21', '1.) Írd le, mit gondolsz erről a dologról\r\n\r\n2.) Írd le, hogyan tovább?', 0, 1, ''),
(5, 'A hasító táblák', '2015-09-03 18:44:39', '1.) Milyen hasító táblákat ismer?\n\n2.) Mire való a hasítótábla?\n\n3.) Mi a neved?', 0, 1, ''),
(6, 'A felületek felismerése', '2015-08-03 20:25:28', '1.) Milyen felületeket ismer?\n\n2.) Mi a felületfelismerés haszna?', 0, 1, ''),
(7, 'Könyvgyártás', '2015-08-03 19:54:36', '1.) Mikor kezdtek könyveket készíteni?\n\n2.) Hány könyv van a világon?', 1, 1, ''),
(8, 'Programozás felmérő', '2015-09-05 22:51:59', '1.) Mi a tömb?\r\n\r\n2.) Mi a különbség a fordítós és az interpreteres technika között?\r\n\r\n3.) Írj le pszeudokóddal a következőt:\r\nAdott egy tömb 5 tetszőleges elemmel.\r\nVálassza ki a legnagyobb elemet.\r\n\r\n4.) Mi az állandó?\r\n\r\n5.) Írjon példát az állandó használatára a tanult programozási nyelven. Írj le a választott nyelv nevét is.\r\n\r\n6.) Mit jelent, hogy egy ciklus hátultesztelő', 1, 1, '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `slog`
--

CREATE TABLE IF NOT EXISTS `slog` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msg` varchar(200) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `solvings`
--

CREATE TABLE IF NOT EXISTS `solvings` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `studentName` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `topic` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `solving` text COLLATE utf8_hungarian_ci NOT NULL,
  `exerciseId` int(11) NOT NULL,
  `class` varchar(10) COLLATE utf8_hungarian_ci NOT NULL,
  `teacherName` varchar(50) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `solvings`
--

INSERT INTO `solvings` (`id`, `date`, `ip`, `studentName`, `topic`, `solving`, `exerciseId`, `class`, `teacherName`) VALUES
(1, '2015-08-03 18:12:32', '127.0.0.1', 'Jóska', 'Könyvgyártás', '1.) Mikor kezdtek könyveket készíteni?\nNem tudom.\n2.) Hány könyv van a világon?\nEzt sem tudom', 7, '09a', '0'),
(2, '2015-08-03 18:26:54', '127.0.0.1', 'Nagy József', 'Második tesztdolgozat', '1.) Írd le milyen nap van ma\nNem tudom\n2.) Írd le te milyen napot szeretnél.\nNem tudom', 2, '09a', '0'),
(3, '2015-08-03 20:15:17', '127.0.0.1', 'Nagy János', 'A hasító táblák', '1.) Milyen hasító táblákat ismer?\nNem tudom\n2.) Mire való a hasítótábla?\nNem tudom\n3.) Mi a neved?', 5, '09a', '0'),
(4, '2015-08-03 20:15:26', '127.0.0.1', 'Nagy János', 'Könyvgyártás', '1.) Mikor kezdtek könyveket készíteni?\nNem tudom\n2.) Hány könyv van a világon?\nNem tudom', 7, '09a', '0'),
(5, '2015-08-03 20:23:59', '127.0.0.1', 'Nagy János', 'A hasító táblák', '1.) Milyen hasító táblákat ismer?\nNem tudom\n2.) Mire való a hasítótábla?\nNem tudom\n3.) Mi a neved?\nNem tudom', 5, '09a', 'Próba Ferenc');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
`id` int(11) NOT NULL,
  `teacherName` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `enable` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `teachers`
--

INSERT INTO `teachers` (`id`, `teacherName`, `enable`) VALUES
(1, 'Sallai András', 1),
(2, 'Teszt János', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
 ADD PRIMARY KEY (`id`), ADD KEY `ExerciseTeacherLink` (`teacherId`);

--
-- Indexes for table `slog`
--
ALTER TABLE `slog`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solvings`
--
ALTER TABLE `solvings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `slog`
--
ALTER TABLE `slog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `solvings`
--
ALTER TABLE `solvings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `exercises`
--
ALTER TABLE `exercises`
ADD CONSTRAINT `ExerciseTeacherLink` FOREIGN KEY (`teacherId`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

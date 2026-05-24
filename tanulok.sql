-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 07. 08:52
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tanulok`
--
CREATE DATABASE IF NOT EXISTS `tanulok` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `tanulok`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `osztalyok`
--

CREATE TABLE `osztalyok` (
  `oaz` int(11) NOT NULL,
  `osztaly` varchar(16) COLLATE utf8_hungarian_ci NOT NULL,
  `ofonev` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `ofokep` varchar(256) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `osztalyok`
--

INSERT INTO `osztalyok` (`oaz`, `osztaly`, `ofonev`, `ofokep`) VALUES
(1, '11/A', 'Arató János', 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/351ae779-4325-4a1c-9897-cd38247bcb3d/a08a3de1-9d96-492e-b506-b59db54709a1.png'),
(2, '10/A', 'Eleven Mónika', 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/d4d52c4d-0ea6-427e-b2cf-3e1619975e8c/2ddbeca0-e0ba-4619-9b02-9ee6e85bac4c.png'),
(3, '12/A', 'Nagy Ferenc', 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/336870ab-3e2e-48de-b78c-80aa8e04b0c5/ea88dbe1-c9f1-4a45-9cd5-b1c7ee24fec0.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanulok`
--

CREATE TABLE `tanulok` (
  `taz` int(11) NOT NULL,
  `nev` varchar(32) COLLATE utf8_hungarian_ci NOT NULL,
  `nem` char(1) COLLATE utf8_hungarian_ci NOT NULL,
  `kor` int(11) NOT NULL,
  `kep` varchar(256) COLLATE utf8_hungarian_ci NOT NULL,
  `oaz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tanulok`
--

INSERT INTO `tanulok` (`taz`, `nev`, `nem`, `kor`, `kep`, `oaz`) VALUES
(1, 'Molnár Kevin', 'F', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/0e555ac7-bd77-4a6f-a5ed-c8e06e8061cc/2cfa599b-b26d-4147-9a02-72d2c09c3bce.png', 1),
(2, 'Balogh Richárd', 'F', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/3c0773e3-1146-4f45-a7f1-cd9378d78e43/c098a99a-9ccc-4ac1-9db6-e50ea5fe96d2.png', 1),
(3, 'Kiss Péter', 'F', 15, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/e7b9f4ca-7d01-4e46-a2b6-eb8dd3f330a1/ef065249-b7e2-4240-bcad-b6643b763b50.png', 2),
(4, 'Szabó János', 'F', 15, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/3d2c0cf0-5eed-4ccf-8710-d4dc22c845e5/5e6f6baf-b4e1-49dc-baf9-a1f8cc7970da.png', 2),
(5, 'Kovács Zoltán', 'F', 17, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/08f66451-53e5-4d99-bf10-5a4f3b4ab1dd/898d1615-e3a4-4484-9876-7aaf40fe8a1e.png', 3),
(6, 'Baranyi András', 'F', 17, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/08079e4b-bb65-445a-a89c-f8f0f08f4f09/f5c58508-2c33-468a-a0da-e22b6e057a05.png', 3),
(7, 'Fekete András', 'F', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/c4e08960-42c9-42f5-b09d-b5c64cf4c52c/b08d3101-cc47-4521-b07c-b32b29ed5c4c.png', 1),
(8, 'Szabó Dóra', 'L', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://api.easy-peasy.ai/storage/v1/object/public/images/4d4745df-c355-4955-882f-e91971ddf7a3/c800dadb-df65-4b3e-a07d-b7137e932eed.png', 1),
(9, 'Horváth Sára', 'L', 17, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/edea60b0-b942-46e9-aecc-be3d80c1a3de/28ebe178-31c7-4e50-a13b-02e4124af299.png', 3),
(10, 'Szentesi Andrea', 'L', 17, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/3cbe60bc-9810-4de9-9ac1-669ea9914356/2024-09-19T16:37:08.746Z.jpg', 3),
(11, 'Tóth Benedek', 'F', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/71d7d3f6-01f7-4e30-b0b7-d803888d03e0/e0aff3b9-eeb1-4f91-863c-91225ac7bbfb.png', 1),
(12, 'Farkas Károly', 'F', 15, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/d60cb7d5-2949-4604-a466-83034e345dac/173989bb-5a06-45f9-917b-4471e6bb83ca.png', 1),
(13, 'Marton Piroska', 'L', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/147cf32d-5bfd-4ec5-a2bd-79ae5e38ea48/4624d0fc-3383-4c93-aa4c-6151147d0c13.png', 2),
(14, 'Varga Krisztián', 'F', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/906fb2d2-d0f8-45b0-8ae5-52cc99b34b97/d4768ddc-ccea-4c83-af4e-00213ab0d4e6.png', 2),
(15, 'Faragó Ádám', 'F', 18, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/b8b359e0-004b-4888-833b-e4ce20704989/8d86c282-b0a4-4b27-b346-fb2f485866d3.png', 3),
(16, 'Magyar Márton', 'F', 16, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/039cde6b-a742-44fa-9293-f6a460488648/fe172926-ebce-46ba-a3dd-7ab0389e7938.png', 3),
(17, 'Nagy Réka', 'L', 15, 'https://easy-peasy.ai/cdn-cgi/image/quality=70,format=auto,width=300/https://media.easy-peasy.ai/1ad4442b-a212-4f31-bb5e-03a4dd462d8e/fa03692b-207b-4541-b2fa-18978f3cbc5f.png', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `osztalyok`
--
ALTER TABLE `osztalyok`
  ADD PRIMARY KEY (`oaz`);

--
-- A tábla indexei `tanulok`
--
ALTER TABLE `tanulok`
  ADD PRIMARY KEY (`taz`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `osztalyok`
--
ALTER TABLE `osztalyok`
  MODIFY `oaz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `tanulok`
--
ALTER TABLE `tanulok`
  MODIFY `taz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Lis 2019, 22:43
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `biblioteka`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czytelnicy`
--

CREATE TABLE `czytelnicy` (
  `id_czytelnika` int(11) NOT NULL,
  `imie` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nazwisko` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nr_telefonu` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nr_karty` int(11) DEFAULT NULL,
  `liczba_wypozyczen` int(11) DEFAULT NULL,
  `ostatnio_obsluzony_przez` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `czytelnicy`
--

INSERT INTO `czytelnicy` (`id_czytelnika`, `imie`, `nazwisko`, `nr_telefonu`, `nr_karty`, `liczba_wypozyczen`, `ostatnio_obsluzony_przez`) VALUES
(1, 'Tomasz', 'Karolak', '883946376', 111, 23, 3),
(2, 'Karol', 'Tomczak', '389392884', 112, 12, 7),
(3, 'Barbara', 'Tutaj', '439386228', 143, 54, 6),
(4, 'Antonina', 'Wernychola', '579667852', 154, 30, 3),
(5, 'Aleksandra', 'Tamta', '467975885', 205, 3, 5),
(6, 'Mateusz', 'Stanowski', '873325243', 226, 17, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id_ksiazki` int(11) NOT NULL,
  `tytul` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autor` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wydawnictwo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ISBN` varchar(17) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sztuki` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`id_ksiazki`, `tytul`, `autor`, `wydawnictwo`, `ISBN`, `sztuki`) VALUES
(1, 'Władca pierścieni: Drużyna pierścienia', 'Tolkien John Ronald Reuel', 'Iskry', '978-5-8159-6679-6', 86),
(2, 'Władca pierścieni: Dwie wieże', 'Tolkien John Ronald Reuel', 'Iskry', '978-4-6317-3815-7', 92),
(3, 'Władca pierścieni: Powrót króla', 'Tolkien John Ronald Reuel', 'Iskry', '978-3-9453-1817-7', 102),
(4, 'Metro 2033', 'Glukhovsky Dmitry', 'Insignis', '978-4-6870-8261-5', 42),
(5, 'Metro 2034', 'Glukhovsky Dmitry', 'Insignis', '978-6-7082-8290-7', 12),
(6, 'Metro 2035', 'Glukhovsky Dmitry', 'Insignis', '978-6-4536-8551-6', 46),
(7, 'Pan Lodowego Ogrodu tom 1', 'Grzędowicz Jarosław', 'Fabryka słów', '978-1-7100-8629-3', 63),
(8, 'Pan Lodowego Ogrodu tom 2', 'Grzędowicz Jarosław', 'Fabryka słów', '978-4-2604-1687-8', 72),
(9, 'Pan Lodowego Ogrodu tom 3', 'Grzędowicz Jarosław', 'Fabryka słów', '978-1-9768-7784-3', 94),
(10, 'Pan Lodowego Ogrodu tom 4', 'Grzędowicz Jarosław', 'Fabryka słów', '978-6-6822-7354-9', 51);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownika` int(11) NOT NULL,
  `imie` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nazwisko` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stanowisko` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownika`, `imie`, `nazwisko`, `stanowisko`) VALUES
(1, 'Karolina', 'Skok', 'dyrektorka'),
(2, 'Małgorzata', 'Konieczna', 'sekretarka'),
(3, 'Bartłomiej', 'Drzwi', 'bibliotekarz'),
(4, 'Natalia', 'Piwnica', 'bibliotekarka'),
(5, 'Wiktoria', 'Kokon', 'bibliotekarka'),
(6, 'Agnieszka', 'Zaparta', 'bibliotekarka'),
(7, 'Ksawery', 'Zaręba', 'bibliotekarz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowiska`
--

CREATE TABLE `stanowiska` (
  `stanowisko` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `liczba_pracownikow` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `stanowiska`
--

INSERT INTO `stanowiska` (`stanowisko`, `liczba_pracownikow`) VALUES
('bibliotekarka', 2),
('bibliotekarz', 2),
('dyrektor', 0),
('dyrektorka', 1),
('sekretarka', 1),
('sekretarz', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `login` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `haslo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imie` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nazwisko` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `login`, `haslo`, `imie`, `nazwisko`) VALUES
(1, 'kskok', '$2y$10$GXA1745b2Khc8dgyxtO2n.lJTl6GhZFxpqd08sR5NCQ7cp3WkJSDS', 'Karolina', 'Skok'),
(2, 'mkoni', 'C9X7cSwPPJ', 'Małgorzata', 'Konieczna'),
(3, 'bdrzw', 'oFSPTNad9d', 'Bartłomiej', 'Drzwi'),
(4, 'npiwn', 'E25scS48hr', 'Natalia', 'Piwnica'),
(5, 'wkoko', 'YkYnQBEMRU', 'Wiktoria', 'Kokon'),
(6, 'azapa', 'WEZfUktuX3', 'Agnieszka', 'Zaparta'),
(7, 'kzare', '83uBU6UoDB', 'Ksawery', 'Zaręba');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenia`
--

CREATE TABLE `wypozyczenia` (
  `id_wypozyczenia` int(11) NOT NULL,
  `id_ksiazki` int(11) DEFAULT NULL,
  `id_czytelnika` int(11) DEFAULT NULL,
  `termin_wypozyczenia` date DEFAULT NULL,
  `termin_oddania` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `wypozyczenia`
--

INSERT INTO `wypozyczenia` (`id_wypozyczenia`, `id_ksiazki`, `id_czytelnika`, `termin_wypozyczenia`, `termin_oddania`) VALUES
(1, 2, 3, '2019-03-24', '2019-04-24'),
(2, 10, 5, '2019-04-12', '2019-05-12'),
(3, 7, 1, '2019-07-01', '2019-08-01'),
(4, 3, 6, '2019-08-20', '2019-09-20'),
(5, 8, 5, '2019-09-15', '2019-10-15'),
(6, 3, 1, NULL, NULL),
(7, 3, 1, NULL, NULL),
(8, 3, 1, NULL, NULL),
(9, 3, 1, NULL, NULL),
(10, 3, 1, NULL, NULL),
(11, 3, 1, NULL, NULL),
(12, 3, 1, NULL, NULL),
(13, 3, 1, NULL, NULL),
(14, 3, 1, NULL, NULL),
(15, 3, 1, NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `czytelnicy`
--
ALTER TABLE `czytelnicy`
  ADD PRIMARY KEY (`id_czytelnika`),
  ADD KEY `ostatnio_obsluzony_przez` (`ostatnio_obsluzony_przez`);

--
-- Indeksy dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id_ksiazki`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownika`),
  ADD KEY `stanowisko` (`stanowisko`);

--
-- Indeksy dla tabeli `stanowiska`
--
ALTER TABLE `stanowiska`
  ADD PRIMARY KEY (`stanowisko`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeksy dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD PRIMARY KEY (`id_wypozyczenia`),
  ADD KEY `id_ksiazki` (`id_ksiazki`),
  ADD KEY `id_czytelnika` (`id_czytelnika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `czytelnicy`
--
ALTER TABLE `czytelnicy`
  MODIFY `id_czytelnika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id_ksiazki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `id_pracownika` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  MODIFY `id_wypozyczenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `czytelnicy`
--
ALTER TABLE `czytelnicy`
  ADD CONSTRAINT `czytelnicy_ibfk_1` FOREIGN KEY (`ostatnio_obsluzony_przez`) REFERENCES `pracownicy` (`id_pracownika`);

--
-- Ograniczenia dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`stanowisko`) REFERENCES `stanowiska` (`stanowisko`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `pracownicy` (`id_pracownika`);

--
-- Ograniczenia dla tabeli `wypozyczenia`
--
ALTER TABLE `wypozyczenia`
  ADD CONSTRAINT `wypozyczenia_ibfk_1` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazki` (`id_ksiazki`),
  ADD CONSTRAINT `wypozyczenia_ibfk_2` FOREIGN KEY (`id_czytelnika`) REFERENCES `czytelnicy` (`id_czytelnika`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

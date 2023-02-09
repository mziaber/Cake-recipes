-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Czas generowania: 09 Lut 2023, 20:14
-- Wersja serwera: 8.0.32
-- Wersja PHP: 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `Cakes`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category` text COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(1, 'Serniki'),
(2, 'Torty'),
(3, 'Ciasta z kremem'),
(4, 'Ciasta z owocami'),
(5, 'Ciasteczka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `images`
--

CREATE TABLE `images` (
  `image_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `image_path` text COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Zrzut danych tabeli `images`
--

INSERT INTO `images` (`image_id`, `recipe_id`, `image_path`) VALUES
(1, 1, 'https://images.unsplash.com/photo-1595272568891-123402d0fb3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
(2, 2, 'https://plus.unsplash.com/premium_photo-1674068280136-5801f98c685d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
(3, 3, 'https://images.unsplash.com/photo-1560180474-e8563fd75bab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
(4, 4, 'https://images.unsplash.com/photo-1571115177098-24ec42ed204d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
(5, 5, 'https://images.unsplash.com/photo-1516054575922-f0b8eeadec1a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
(6, 6, 'https://images.unsplash.com/photo-1614145121029-83a9f7b68bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ingridients`
--

CREATE TABLE `ingridients` (
  `ingridient_id` int NOT NULL,
  `ingridient` text COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Zrzut danych tabeli `ingridients`
--

INSERT INTO `ingridients` (`ingridient_id`, `ingridient`) VALUES
(1, '300g mąki pszennej'),
(2, '300g masła'),
(3, '2 zółtka'),
(4, '4 łyżki wody'),
(5, '1l mleka'),
(6, '180g cukru'),
(7, '50g mąki ziemniaczanej'),
(8, '100g mąki pszennej'),
(9, '2 cukry waniliowe'),
(10, '1 łyżeczka masła'),
(11, '3 żółtka'),
(12, '2 całe jajka'),
(13, '200g mąki pszennej'),
(14, '50g cukru pudru'),
(15, 'Pół łyżeczki soli'),
(16, '150g masła'),
(17, '700g twarogu półtłustego, trzykrotnie mielonego'),
(18, '125ml śmietanki 30%'),
(19, '5 jajek'),
(20, '3/4 szklanki cukru'),
(21, '1 łyżeczka pasty z wanilii'),
(22, '225g białej czekolady'),
(23, 'Szklanka cukru'),
(24, 'Masło'),
(25, 'Śmietanka 30%'),
(26, 'Sól');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL,
  `recipe_name` text COLLATE utf8mb3_polish_ci NOT NULL,
  `ingridients_list` text COLLATE utf8mb3_polish_ci NOT NULL,
  `steps_list` text COLLATE utf8mb3_polish_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb3_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Zrzut danych tabeli `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `ingridients_list`, `steps_list`, `category_id`) VALUES
(1, 'Kremówka', '[1,2,3,4,5,6,7,8,9,10,11,12]', '[1,2,3]', '3'),
(2, 'Sernik z białą czekoladą i karmelem\r\n', '[13,14,15,16,17,18,19,20,21,22,23,24,25,26]', '[4,5,6]', '1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `steps`
--

CREATE TABLE `steps` (
  `step_id` int NOT NULL,
  `step_name` text COLLATE utf8mb3_polish_ci NOT NULL,
  `step` text COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Zrzut danych tabeli `steps`
--

INSERT INTO `steps` (`step_id`, `step_name`, `step`) VALUES
(1, 'Ciasto kruche', 'Mąkę przesiać, dodać zimne masło i zasiekać. Następnie dodać żółtka oraz wodę i zagnieść ciasto. Aby ciasto kruche  wyszło idealne, nie należy wyrabiać go zbyt długo. Gotowe ciasto podzielić na dwie równe części i  rozwałkować na kształt dwóch równych prostokątów. Piec w temperaturze 180 stopni Celsjusza, krótko do zrumienienia ciasta (15/20 min). Wyjąć do przestygnięcia.'),
(2, 'Krem', 'Do garnka z podwójnym dnem wlać 800 ml mleka i wsypać cukier. Doprowadzić do wrzenia co jakiś czas mieszając. W międzyczasie w osobnym naczyniu umieścić pozostałe 200ml mleka, mąkę pszenną i ziemniaczaną, jajka oraz żółtka. Wszystko dokładnie wymieszać i wlać do gotującego się mleka energicznie mieszając. Dodać masło i gotować jeszcze kilka minut to zgęstnienia. Zdjąć z palnika i pozostawić do całkowitego przestudzenia.'),
(3, 'Złożenie', 'Na jeden z blatów ciasta kruchego wyłożyć przestudzony krem. Ostrożnie przykryć drugim blatem ciasta, gdyż jest ono bardzo kruche. Posypać cukrem pudrem dla dekoracji.'),
(4, 'Ciasto kruche', 'Masło umieścić w rondelku. Gotować na średnim ogniu, często mieszając aż do momentu złotobrązowego koloru i pojawienia się ciemnych plamek. Zdjąć z palnika i przestudzić. Mąkę wymieszać z solą i cukrem. Dodać przestudzone masło i zagnieść ciasto. Wyłożyć na tortownicę o średnicy 23cm (spód oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a następnie przestudzić.'),
(5, 'Masa Serowa', 'W misie umieścić wszystkie składniki na masę serową. Powinny mieć temperaturę pokojową. Wymieszać mikserem tylko do uzyskania gładkiej masy. Nie miksować długo, by  nie napowietrzyć masy co mogłoby skutkować opadnięciem sernika po wyjęciu z piekarnika. Masę wylać na przestudzony spód. Piec w temperaturze 160 stopni Celsjusza przez ok. 80 minut. Wyjąć z piekarnika i wystudzić. Po tym czasie schłodzić w lodówce przez całą noc.'),
(6, 'Solony Karmel', 'Cukier wysypać na patelnię i podgrzewać na małym ogniu, bez mieszania do rozpuszczenia. Dodać masło cały czas mieszając. Gdy składniki się połączą wlać odrobinę kremówki i wymieszać. Jeśli karmel będzie za gęsty dodać więcej śmietanki. Dodać szczyptę soli i zdjąć z palnika. Zimnym karmelem polać schłodzony sernik.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

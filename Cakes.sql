-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 07, 2023 at 09:58 AM
-- Wersja serwera: 8.0.32
-- Wersja PHP: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Cakes`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category` varchar(50) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Dumping data for table `categories`
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
  `recipe_id` int DEFAULT NULL,
  `image_path` varchar(100) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `recipe_id`, `image_path`) VALUES
(1, 1, '/static/IMG_6481.jpg'),
(2, 2, '/static/IMG_4992.jpg'),
(3, 3, '/static/IMG_6626.jpg'),
(4, 4, '/static/IMG_0560.jpg'),
(5, 5, '/static/IMG_6539.jpg'),
(6, 6, '/static/4647ac56-8c67-42c9-8c6e-cde64c05faa5.jpg'),
(7, 7, '/static/IMG_0209.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int NOT NULL,
  `recipe_id` int DEFAULT NULL,
  `ingredient` varchar(255) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `recipe_id`, `ingredient`) VALUES
(1, 1, '300g mąki pszennej'),
(2, 1, '300g masła'),
(3, 1, '2 zółtka'),
(4, 1, '4 łyżki wody'),
(5, 1, '1l mleka'),
(6, 1, '180g cukru'),
(7, 1, '50g mąki ziemniaczanej'),
(8, 1, '100g mąki pszennej'),
(9, 1, '2 cukry waniliowe'),
(10, 1, '1 łyżeczka masła'),
(11, 1, '3 zółtka'),
(12, 1, '2 całe jaja'),
(13, 2, '200g mąki pszennej'),
(14, 2, '50g cukru pudru'),
(15, 2, 'Pół łyżeczki soli'),
(16, 2, '150g masła'),
(17, 2, '700g twarogu półtłustego, trzykrotnie mielonego'),
(18, 2, '125ml śmietanki 30%'),
(19, 2, '5 jajek'),
(20, 2, '3/4 szklanki cukru'),
(21, 2, '1 łyżeczka pasty z wanilii'),
(22, 2, '225g białej czekolady'),
(23, 2, 'Szklanka cukru'),
(24, 2, 'Masło'),
(25, 2, 'Śmietanka 30%'),
(26, 2, 'Sól'),
(27, 3, '650g mąki'),
(28, 3, '70g cukru'),
(29, 3, '15g suchych drożdży'),
(30, 3, '100g roztopionego masła'),
(31, 3, '400ml mleka'),
(32, 3, '2 jajka'),
(33, 3, 'poł łyżeczki soli'),
(34, 3, '90g roztopionego masła'),
(35, 3, '120g cukru'),
(36, 3, '2 łyżeczki cynamonu'),
(37, 3, '1 jajko'),
(38, 4, '1 i 3/4 szklanki mąki pszennej (220g'),
(39, 4, '1 łyżeczka cukru'),
(40, 4, 'szczypta soli'),
(41, 4, '150g serka kremowego'),
(42, 4, '200g masła'),
(43, 4, '1 łyżka kwaśnej śmietany'),
(44, 4, 'krem pistacjowy/domowy dżem'),
(45, 4, '1 jajko na glazurę'),
(46, 5, '6 białek'),
(47, 5, '300g cukru'),
(48, 5, '1 łyżeczka mąki ziemniaczanej'),
(49, 5, '250g schłodzonego mascarpone'),
(50, 5, '400g schłodzonej śmietanki 30%'),
(51, 5, '2-3 łyżki cukru pudru'),
(52, 5, '450g wiśni (świeżych lub mrożonych)'),
(53, 5, 'Mąka ziemniaczana i cukier do konfitury'),
(54, 6, '100g masła'),
(55, 6, '1 zółtko'),
(56, 6, '2 łyżki cukru pudru'),
(57, 6, 'szczypta soli'),
(58, 6, '1 litr mleka'),
(59, 6, '180g cukru'),
(60, 6, '50g mąki ziemniaczanej'),
(61, 6, '100g mąki pszennej'),
(62, 6, '2 cukry waniliowe'),
(63, 6, '1 łyżeczka masła'),
(64, 6, '3 żółtka'),
(65, 6, '2 całe jajka'),
(66, 6, 'truskawki'),
(67, 7, '200g mąki pszennej'),
(68, 7, '50g cukru pudru'),
(69, 7, 'pół łyżeczki soli'),
(70, 7, '150g masła'),
(71, 7, '750g serka typu Philadelphia'),
(72, 7, '250g gęstego jogurtu naturalnego'),
(73, 7, '250g cukru'),
(74, 7, '6 jajek'),
(75, 7, '400ml śmietanki 36%'),
(76, 7, '1 łyżeczka soli'),
(77, 7, '1 łyżeczka pasty z wanilii'),
(78, 7, '2 łyżki cukru pudru');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL,
  `recipe_name` varchar(100) COLLATE utf32_polish_ci NOT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `category_id`) VALUES
(1, 'Kremówka', 3),
(2, 'Sernik z białą czekoladą i karmelem', 1),
(3, 'Cynamonki', 5),
(4, 'Rogaliki', 5),
(5, 'Beza z konfiturą wiśniową', 4),
(6, 'Tarta z truskawkami', 4),
(7, 'Sernik baskijski', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `steps`
--

CREATE TABLE `steps` (
  `step_id` int NOT NULL,
  `recipe_id` int DEFAULT NULL,
  `step_name` varchar(100) COLLATE utf32_polish_ci NOT NULL,
  `step` text COLLATE utf32_polish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`step_id`, `recipe_id`, `step_name`, `step`) VALUES
(1, 1, 'Ciasto kruche', 'Mąkę przesiać, dodać zimne masło i zasiekać. Następnie dodać żółtka oraz wodę i zagnieść ciasto. Aby ciasto kruche  wyszło idealne, nie należy wyrabiać go zbyt długo. Gotowe ciasto podzielić na dwie równe części i  rozwałkować na kształt dwóch równych prostokątów. Piec w temperaturze 180 stopni Celsjusza, krótko do zrumienienia ciasta (15/20 min). Wyjąć do przestygnięcia.'),
(2, 1, 'Krem', 'Do garnka z podwójnym dnem wlać 800 ml mleka i wsypać cukier. Doprowadzić do wrzenia co jakiś czas mieszając. W międzyczasie w osobnym naczyniu umieścić pozostałe 200ml mleka, mąkę pszenną i ziemniaczaną, jajka oraz żółtka. Wszystko dokładnie wymieszać i wlać do gotującego się mleka energicznie mieszając. Dodać masło i gotować jeszcze kilka minut to zgęstnienia. Zdjąć z palnika i pozostawić do całkowitego przestudzenia.'),
(3, 1, 'Złożenie', 'Na jeden z blatów ciasta kruchego wyłożyć przestudzony krem. Ostrożnie przykryć drugim blatem ciasta, gdyż jest ono bardzo kruche. Posypać cukrem pudrem dla dekoracji.'),
(4, 2, 'Ciasto kruche', 'Masło umieścić w rondelku. Gotować na średnim ogniu, często mieszając aż do momentu złotobrązowego koloru i pojawienia się ciemnych plamek. Zdjąć z palnika i przestudzić. Mąkę wymieszać z solą i cukrem. Dodać przestudzone masło i zagnieść ciasto. Wyłożyć na tortownicę o średnicy 23cm (spód oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a następnie przestudzić.'),
(5, 2, 'Masa Serowa', 'W misie umieścić wszystkie składniki na masę serową. Powinny mieć temperaturę pokojową. Wymieszać mikserem tylko do uzyskania gładkiej masy. Nie miksować długo, by  nie napowietrzyć masy co mogłoby skutkować opadnięciem sernika po wyjęciu z piekarnika. Masę wylać na przestudzony spód. Piec w temperaturze 160 stopni Celsjusza przez ok. 80 minut. Wyjąć z piekarnika i wystudzić. Po tym czasie schłodzić w lodówce przez całą noc.'),
(6, 2, 'Solony Karmel', 'Cukier wysypać na patelnię i podgrzewać na małym ogniu, bez mieszania do rozpuszczenia. Dodać masło cały czas mieszając. Gdy składniki się połączą wlać odrobinę kremówki i wymieszać. Jeśli karmel będzie za gęsty dodać więcej śmietanki. Dodać szczyptę soli i zdjąć z palnika. Zimnym karmelem polać schłodzony sernik.'),
(7, 3, 'Ciasto', 'Mąkę wymieszać z drożdżami, następnie dodać cukier, masło, letnie mleko, jajka oraz szczyptę soli. Zagnieść ciasto i wyrabiać odpowiednio długo, aż będzie miękkie i elastyczne. Uformować kulę i włożyć do miski opruszonej mąką. Odstawić w ciepłe miejsce do wyrośnięcia (ok.1,5h).'),
(8, 3, 'Nadzienie', 'Roztopione masło połączyć z cukrem i cynamonem.'),
(9, 3, 'Formowanie bułczek', 'Wyrośnięte ciasto rozwałkować na kształt prostokąta. Wyłożyć nadzienie na 2/3 ciasta (dłuższego boku prostokąta). Następnie 1/3 ciasta nieposmarowanego i 1/3 ciasta z nadzieniem złożyć na zakładkę, tak by powstały trzy piętra ciasta przełożone dwoma warstwami nadzienia. Prostokąt rozwałkować na grubość 1-1,5cm i kroić na ok.2 cm paski. Każdy z nich zrolować. Bułeczki formować oplatając trzy place rulonem ciasta a następnie przekładając końcówkę od dołu do góry przez powstały otwór. Bułeczki wyłożyć na blaszkę i pozostawić na kilkanaście minut do wyrośnięcia. Posmarować roztrzepanym jajkiem i piec w temperaturze 180 stopni przed 20-25 min. (do zrumienienia).'),
(10, 4, 'Ciasto', 'Wszystkie składniki powinny znajdować się w temperaturze pokojowej. Zagnieść ciasto i odstawić do lodówki na min. 1 godzinę. Porcje schłodzonego ciasta rozwałkować, pokroić w trójkąty, wyłożyć nadzienie i formować rogaliki. Tak przygotowane rogaliki posmarować jajkiem, a następnie posypać kryształkami cukru. Piec w temperaturze 180 stopni Celsjusza do zrumienienia.'),
(11, 5, 'Beza', 'Białka ubić z cukrem na sztywną pianę. Pod koniec ubijania dodać łyżeczkę mąki ziemniaczanej. Bezę wyłożyć na blaszkę i wsadzić do rozgrzanego do 130 stopni Celsjusza piekarnika. Włączyć termoobieg i obniżyć temperaturę do 100 stopni. Suszyć przez 3 godziny. '),
(12, 5, 'Krem śmietanowy', 'Schłodzoną śmietankę 30% oraz mascarpone ubić na sztywny, puszysty krem. Pod koniec ubijania dodać cukier puder wedle uznania.'),
(13, 5, 'Konfitura wiśniowa', 'Wiśnie umieścić w garnku i podgrzewać na małym ogniu. Dodać cukier według własnych preferencji. Gotować przez kilka minut, a następnie dodać 1 łyżeczkę mąki ziemniaczanej. Gotować jeszcze ok. 2 minut do zgęstnienia. Jeśli konsystencja będzie zbyt lejąca dodać odrobinę więcej mąki i ponownie zagotować. Zdjąć z palnika i odłożyć do przestudzenia.'),
(14, 6, 'Ciasto kruche', 'Masło, mąkę, sól oraz cukier puder zasiekać. Dodać żółtko i zagnieść ciasto. Formę do tarty posmarować masłem i obsypać bułką tartą. Ciasto wyłożyć na formę i piec w temperaturze 180 stopni Celsjusza do zrumienienia'),
(15, 6, 'Krem budyniowy', 'Mleko z cukrem i cukrem waniliowym podgrzewać do zagotowania od czasu do czasu mieszając. Mąki, żółtka oraz jajka wymieszać w osobnej misce. Gdy mleko zacznie się gotować, dodać powstałą masę z mąki i jajek, a następnie łyżeczkę masła. Energicznie mieszać do zgęstnienia kremu. Zdjąć z ognia i odstawić do przestudzenia. Krem wyłożyć na upieczony i przestudzony spód, a na wierzch wyłożyć truskawki pokrojone w połówki lub ćwiartki.'),
(16, 7, 'Ciasto kruche', 'Masło umieścić w rondelku. Gotować na średnim ogniu, często mieszając aż do momentu złotobrązowego koloru i pojawienia się ciemnych plamek. Zdjąć z palnika i przestudzić. Mąkę wymieszać z solą i cukrem. Dodać przestudzone masło i zagnieść ciasto. Wyłożyć na tortownicę o średnicy 23cm (spód oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a następnie przestudzić.'),
(17, 7, 'Masa serowa', 'Ser, cukier, jajka i śmietankę umieścić w jednym naczyniu. Dodać cukier oraz pastę waniliową. Zmiksować do połączenia i nie dłużej niż to konieczne, aby nie napowietrzyć masy serowej. Masę wylać na podpieczony spód i posypać dwoma łyżkami cukru pudru, skarmelizuje się podczas pieczenia. Piec 30min w temperaturze 220 stopni Celsjusza. Po wyciągnięciu sernik powinien być ścięty przy brzegach. Przestudzić i włożyć do lodówki na minimum całą noc.');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksy dla tabeli `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksy dla tabeli `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indeksy dla tabeli `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`step_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `steps`
--
ALTER TABLE `steps`
  MODIFY `step_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `steps_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

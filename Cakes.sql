-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Feb 20, 2023 at 08:25 PM
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
  `category` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

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
  `recipe_id` int NOT NULL,
  `image_path` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`image_id`, `recipe_id`, `image_path`) VALUES
(1, 1, '/static/IMG_6481.jpg'),
(2, 2, '/static/IMG_4992.jpg'),
(14, 25, '/static/IMG_6626.jpg'),
(28, 39, '/static/IMG_0560.jpg'),
(31, 44, '/static/IMG_6539.jpg'),
(32, 45, '/static/4647ac56-8c67-42c9-8c6e-cde64c05faa5.jpg'),
(33, 46, '/static/IMG_0209.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ingridients`
--

CREATE TABLE `ingridients` (
  `ingridient_id` int NOT NULL,
  `ingridient` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Dumping data for table `ingridients`
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
(26, 'Sól'),
(70, '650g mąki'),
(71, '70g cukru'),
(72, '15g suchych drożdży'),
(73, '100g roztopionego masła'),
(74, '400ml mleka'),
(75, '2 jajka'),
(76, 'poł łyżeczki soli'),
(77, '90g roztopionego masła'),
(78, '120g cukru'),
(79, '2 łyżeczki cynamonu'),
(80, '1 jajko'),
(118, '1 i 3/4 szklanki mąki pszennej (220g)'),
(119, '1 łyżeczka cukru'),
(120, 'szczypta soli'),
(121, '150g serka kremowego'),
(122, '200g masła'),
(123, '1 łyżka kwaśnej śmietany'),
(124, 'krem pistacjowy/domowy dżem'),
(125, '1 jajko na glazurę'),
(134, '6 białek'),
(135, '300g cukru'),
(136, '1 łyżeczka mąki ziemniaczanej'),
(137, '250g schłodzonego mascarpone'),
(138, '400g schłodzonej śmietanki 30%'),
(139, '2-3 łyżki cukru pudru'),
(140, '450g wiśni (świeżych lub mrożonych)'),
(141, 'Mąka ziemniaczana i cukier do konfitury'),
(142, '1 szklanka mąki pszennej (180g)'),
(143, '100g masła'),
(144, '1 zółtko'),
(145, '2 łyżki cukru pudru'),
(146, 'szczypta soli'),
(147, '1 litr mleka'),
(148, '180g cukru'),
(149, '50g mąki ziemniaczanej'),
(150, '100g mąki pszennej'),
(151, '2 cukry waniliowe'),
(152, '1 łyżeczka masła'),
(153, '3 żółtka'),
(154, '2 całe jajka'),
(155, 'truskawki'),
(156, '200g mąki pszennej'),
(157, '50g cukru pudru'),
(158, 'pół łyżeczki soli'),
(159, '150g masła'),
(160, '750g serka typu Philadelphia'),
(161, '250g gęstego jogurtu naturalnego'),
(162, '250g cukru'),
(163, '6 jajek'),
(164, '400ml śmietanki 36%'),
(165, '1 łyżeczka soli'),
(166, '1 łyżeczka pasty z wanilii'),
(167, '2 łyżki cukru pudru');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL,
  `recipe_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `ingridients_list` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `steps_list` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `ingridients_list`, `steps_list`, `category_id`) VALUES
(1, 'Kremówka', '[1,2,3,4,5,6,7,8,9,10,11,12]', '[1,2,3]', 3),
(2, 'Sernik z białą czekoladą i karmelem\r\n', '[13,14,15,16,17,18,19,20,21,22,23,24,25,26]', '[4,5,6]', 1),
(25, 'Cynamonki', '[70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80]', '[24, 25, 26]', 5),
(39, 'Rogaliki', '[118, 119, 120, 121, 122, 123, 124, 125]', '[43]', 5),
(44, 'Beza z konfiturą wiśniową', '[134, 135, 136, 137, 138, 139, 140, 141]', '[47, 48, 49]', 4),
(45, 'Tarta z truskawkami', '[142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155]', '[50, 51]', 4),
(46, 'Sernik baskijski', '[156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167]', '[52, 53]', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `steps`
--

CREATE TABLE `steps` (
  `step_id` int NOT NULL,
  `step_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL,
  `step` text CHARACTER SET utf8mb3 COLLATE utf8mb3_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_polish_ci;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`step_id`, `step_name`, `step`) VALUES
(1, 'Ciasto kruche', 'Mąkę przesiać, dodać zimne masło i zasiekać. Następnie dodać żółtka oraz wodę i zagnieść ciasto. Aby ciasto kruche  wyszło idealne, nie należy wyrabiać go zbyt długo. Gotowe ciasto podzielić na dwie równe części i  rozwałkować na kształt dwóch równych prostokątów. Piec w temperaturze 180 stopni Celsjusza, krótko do zrumienienia ciasta (15/20 min). Wyjąć do przestygnięcia.'),
(2, 'Krem', 'Do garnka z podwójnym dnem wlać 800 ml mleka i wsypać cukier. Doprowadzić do wrzenia co jakiś czas mieszając. W międzyczasie w osobnym naczyniu umieścić pozostałe 200ml mleka, mąkę pszenną i ziemniaczaną, jajka oraz żółtka. Wszystko dokładnie wymieszać i wlać do gotującego się mleka energicznie mieszając. Dodać masło i gotować jeszcze kilka minut to zgęstnienia. Zdjąć z palnika i pozostawić do całkowitego przestudzenia.'),
(3, 'Złożenie', 'Na jeden z blatów ciasta kruchego wyłożyć przestudzony krem. Ostrożnie przykryć drugim blatem ciasta, gdyż jest ono bardzo kruche. Posypać cukrem pudrem dla dekoracji.'),
(4, 'Ciasto kruche', 'Masło umieścić w rondelku. Gotować na średnim ogniu, często mieszając aż do momentu złotobrązowego koloru i pojawienia się ciemnych plamek. Zdjąć z palnika i przestudzić. Mąkę wymieszać z solą i cukrem. Dodać przestudzone masło i zagnieść ciasto. Wyłożyć na tortownicę o średnicy 23cm (spód oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a następnie przestudzić.'),
(5, 'Masa Serowa', 'W misie umieścić wszystkie składniki na masę serową. Powinny mieć temperaturę pokojową. Wymieszać mikserem tylko do uzyskania gładkiej masy. Nie miksować długo, by  nie napowietrzyć masy co mogłoby skutkować opadnięciem sernika po wyjęciu z piekarnika. Masę wylać na przestudzony spód. Piec w temperaturze 160 stopni Celsjusza przez ok. 80 minut. Wyjąć z piekarnika i wystudzić. Po tym czasie schłodzić w lodówce przez całą noc.'),
(6, 'Solony Karmel', 'Cukier wysypać na patelnię i podgrzewać na małym ogniu, bez mieszania do rozpuszczenia. Dodać masło cały czas mieszając. Gdy składniki się połączą wlać odrobinę kremówki i wymieszać. Jeśli karmel będzie za gęsty dodać więcej śmietanki. Dodać szczyptę soli i zdjąć z palnika. Zimnym karmelem polać schłodzony sernik.'),
(24, 'Ciasto', 'Mąkę wymieszać z drożdżami, następnie dodać cukier, masło, letnie mleko, jajka oraz szczyptę soli. Zagnieść ciasto i wyrabiać odpowiednio długo, aż będzie miękkie i elastyczne. Uformować kulę i włożyć do miski opruszonej mąką. Odstawić w ciepłe miejsce do wyrośnięcia (ok.1,5h).   '),
(25, 'Nadzienie', 'Roztopione masło połączyć z cukrem i cynamonem. '),
(26, 'Formowanie bułczek', 'Wyrośnięte ciasto rozwałkować na kształt prostokąta. Wyłożyć nadzienie na 2/3 ciasta (dłuższego boku prostokąta). Następnie 1/3 ciasta nieposmarowanego i 1/3 ciasta z nadzieniem złożyć na zakładkę, tak by powstały trzy piętra ciasta przełożone dwoma warstwami nadzienia. Prostokąt rozwałkować na grubość 1-1,5cm i kroić na ok.2 cm paski. Każdy z nich zrolować. Bułeczki formować oplatając trzy place rulonem ciasta a następnie przekładając końcówkę od dołu do góry przez powstały otwór. Bułeczki wyłożyć na blaszkę i pozostawić na kilkanaście minut do wyrośnięcia. Posmarować roztrzepanym jajkiem i piec w temperaturze 180 stopni przed 20-25 min. (do zrumienienia).'),
(43, 'Ciasto', 'Wszystkie składniki powinny znajdować się w temperaturze pokojowej. Zagnieść ciasto i odstawić do lodówki na min. 1 godzinę. Porcje schłodzonego ciasta rozwałkować, pokroić w trójkąty, wyłożyć nadzienie i formować rogaliki. Tak przygotowane rogaliki posmarować jajkiem, a następnie posypać kryształkami cukru. Piec w temperaturze 180 stopni Celsjusza do zrumienienia.'),
(47, 'Beza', 'Białka ubić z cukrem na sztywną pianę. Pod koniec ubijania dodać łyżeczkę mąki ziemniaczanej. Bezę wyłożyć na blaszkę i wsadzić do rozgrzanego do 130 stopni Celsjusza piekarnika. Włączyć termoobieg i obniżyć temperaturę do 100 stopni. Suszyć przez 3 godziny. '),
(48, 'Krem śmietanowy', 'Schłodzoną śmietankę 30% oraz mascarpone ubić na sztywny, puszysty krem. Pod koniec ubijania dodać cukier puder wedle uznania.'),
(49, 'Konfitura wiśniowa', 'Wiśnie umieścić w garnku i podgrzewać na małym ogniu. Dodać cukier według własnych preferencji. Gotować przez kilka minut, a następnie dodać 1 łyżeczkę mąki ziemniaczanej. Gotować jeszcze ok. 2 minut do zgęstnienia. Jeśli konsystencja będzie zbyt lejąca dodać odrobinę więcej mąki i ponownie zagotować. Zdjąć z palnika i odłożyć do przestudzenia.  '),
(50, 'Ciasto kruche', 'Masło, mąkę, sól oraz cukier puder zasiekać. Dodać żółtko i zagnieść ciasto. Formę do tarty posmarować masłem i obsypać bułką tartą. Ciasto wyłożyć na formę i piec w temperaturze 180 stopni Celsjusza do zrumienienia'),
(51, 'Krem budyniowy', 'Mleko z cukrem i cukrem waniliowym podgrzewać do zagotowania od czasu do czasu mieszając. Mąki, żółtka oraz jajka wymieszać w osobnej misce. Gdy mleko zacznie się gotować, dodać powstałą masę z mąki i jajek, a następnie łyżeczkę masła. Energicznie mieszać do zgęstnienia kremu. Zdjąć z ognia i odstawić do przestudzenia. Krem wyłożyć na upieczony i przestudzony spód, a na wierzch wyłożyć truskawki pokrojone w połówki lub ćwiartki.'),
(52, 'Ciasto kruche', 'Masło umieścić w rondelku. Gotować na średnim ogniu, często mieszając aż do momentu złotobrązowego koloru i pojawienia się ciemnych plamek. Zdjąć z palnika i przestudzić. Mąkę wymieszać z solą i cukrem. Dodać przestudzone masło i zagnieść ciasto. Wyłożyć na tortownicę o średnicy 23cm (spód oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a następnie przestudzić.'),
(53, 'Masa serowa', 'Ser, cukier, jajka i śmietankę umieścić w jednym naczyniu. Dodać cukier oraz pastę waniliową. Zmiksować do połączenia i nie dłużej niż to konieczne, aby nie napowietrzyć masy serowej. Masę wylać na podpieczony spód i posypać dwoma łyżkami cukru pudru, skarmelizuje się podczas pieczenia. Piec 30min w temperaturze 220 stopni Celsjusza. Po wyciągnięciu sernik powinien być ścięty przy brzegach. Przestudzić i włożyć do lodówki na minimum całą noc.');

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
  ADD PRIMARY KEY (`image_id`);

--
-- Indeksy dla tabeli `ingridients`
--
ALTER TABLE `ingridients`
  ADD PRIMARY KEY (`ingridient_id`);

--
-- Indeksy dla tabeli `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indeksy dla tabeli `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`step_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `ingridients`
--
ALTER TABLE `ingridients`
  MODIFY `ingridient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `steps`
--
ALTER TABLE `steps`
  MODIFY `step_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

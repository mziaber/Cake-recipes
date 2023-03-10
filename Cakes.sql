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
(1, 1, '300g m??ki pszennej'),
(2, 1, '300g mas??a'),
(3, 1, '2 z????tka'),
(4, 1, '4 ??y??ki wody'),
(5, 1, '1l mleka'),
(6, 1, '180g cukru'),
(7, 1, '50g m??ki ziemniaczanej'),
(8, 1, '100g m??ki pszennej'),
(9, 1, '2 cukry waniliowe'),
(10, 1, '1 ??y??eczka mas??a'),
(11, 1, '3 z????tka'),
(12, 1, '2 ca??e jaja'),
(13, 2, '200g m??ki pszennej'),
(14, 2, '50g cukru pudru'),
(15, 2, 'P???? ??y??eczki soli'),
(16, 2, '150g mas??a'),
(17, 2, '700g twarogu p????t??ustego, trzykrotnie mielonego'),
(18, 2, '125ml ??mietanki 30%'),
(19, 2, '5 jajek'),
(20, 2, '3/4 szklanki cukru'),
(21, 2, '1 ??y??eczka pasty z wanilii'),
(22, 2, '225g bia??ej czekolady'),
(23, 2, 'Szklanka cukru'),
(24, 2, 'Mas??o'),
(25, 2, '??mietanka 30%'),
(26, 2, 'S??l'),
(27, 3, '650g m??ki'),
(28, 3, '70g cukru'),
(29, 3, '15g suchych dro??d??y'),
(30, 3, '100g roztopionego mas??a'),
(31, 3, '400ml mleka'),
(32, 3, '2 jajka'),
(33, 3, 'po?? ??y??eczki soli'),
(34, 3, '90g roztopionego mas??a'),
(35, 3, '120g cukru'),
(36, 3, '2 ??y??eczki cynamonu'),
(37, 3, '1 jajko'),
(38, 4, '1 i 3/4 szklanki m??ki pszennej (220g'),
(39, 4, '1 ??y??eczka cukru'),
(40, 4, 'szczypta soli'),
(41, 4, '150g serka kremowego'),
(42, 4, '200g mas??a'),
(43, 4, '1 ??y??ka kwa??nej ??mietany'),
(44, 4, 'krem pistacjowy/domowy d??em'),
(45, 4, '1 jajko na glazur??'),
(46, 5, '6 bia??ek'),
(47, 5, '300g cukru'),
(48, 5, '1 ??y??eczka m??ki ziemniaczanej'),
(49, 5, '250g sch??odzonego mascarpone'),
(50, 5, '400g sch??odzonej ??mietanki 30%'),
(51, 5, '2-3 ??y??ki cukru pudru'),
(52, 5, '450g wi??ni (??wie??ych lub mro??onych)'),
(53, 5, 'M??ka ziemniaczana i cukier do konfitury'),
(54, 6, '100g mas??a'),
(55, 6, '1 z????tko'),
(56, 6, '2 ??y??ki cukru pudru'),
(57, 6, 'szczypta soli'),
(58, 6, '1 litr mleka'),
(59, 6, '180g cukru'),
(60, 6, '50g m??ki ziemniaczanej'),
(61, 6, '100g m??ki pszennej'),
(62, 6, '2 cukry waniliowe'),
(63, 6, '1 ??y??eczka mas??a'),
(64, 6, '3 ??????tka'),
(65, 6, '2 ca??e jajka'),
(66, 6, 'truskawki'),
(67, 7, '200g m??ki pszennej'),
(68, 7, '50g cukru pudru'),
(69, 7, 'p???? ??y??eczki soli'),
(70, 7, '150g mas??a'),
(71, 7, '750g serka typu Philadelphia'),
(72, 7, '250g g??stego jogurtu naturalnego'),
(73, 7, '250g cukru'),
(74, 7, '6 jajek'),
(75, 7, '400ml ??mietanki 36%'),
(76, 7, '1 ??y??eczka soli'),
(77, 7, '1 ??y??eczka pasty z wanilii'),
(78, 7, '2 ??y??ki cukru pudru');

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
(1, 'Krem??wka', 3),
(2, 'Sernik z bia???? czekolad?? i karmelem', 1),
(3, 'Cynamonki', 5),
(4, 'Rogaliki', 5),
(5, 'Beza z konfitur?? wi??niow??', 4),
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
(1, 1, 'Ciasto kruche', 'M??k?? przesia??, doda?? zimne mas??o i zasieka??. Nast??pnie doda?? ??????tka oraz wod?? i zagnie???? ciasto. Aby ciasto kruche  wysz??o idealne, nie nale??y wyrabia?? go zbyt d??ugo. Gotowe ciasto podzieli?? na dwie r??wne cz????ci i  rozwa??kowa?? na kszta??t dw??ch r??wnych prostok??t??w. Piec w temperaturze 180 stopni Celsjusza, kr??tko do zrumienienia ciasta (15/20 min). Wyj???? do przestygni??cia.'),
(2, 1, 'Krem', 'Do garnka z podw??jnym dnem wla?? 800 ml mleka i wsypa?? cukier. Doprowadzi?? do wrzenia co jaki?? czas mieszaj??c. W mi??dzyczasie w osobnym naczyniu umie??ci?? pozosta??e 200ml mleka, m??k?? pszenn?? i ziemniaczan??, jajka oraz ??????tka. Wszystko dok??adnie wymiesza?? i wla?? do gotuj??cego si?? mleka energicznie mieszaj??c. Doda?? mas??o i gotowa?? jeszcze kilka minut to zg??stnienia. Zdj???? z palnika i pozostawi?? do ca??kowitego przestudzenia.'),
(3, 1, 'Z??o??enie', 'Na jeden z blat??w ciasta kruchego wy??o??y?? przestudzony krem. Ostro??nie przykry?? drugim blatem ciasta, gdy?? jest ono bardzo kruche. Posypa?? cukrem pudrem dla dekoracji.'),
(4, 2, 'Ciasto kruche', 'Mas??o umie??ci?? w rondelku. Gotowa?? na ??rednim ogniu, cz??sto mieszaj??c a?? do momentu z??otobr??zowego koloru i pojawienia si?? ciemnych plamek. Zdj???? z palnika i przestudzi??. M??k?? wymiesza?? z sol?? i cukrem. Doda?? przestudzone mas??o i zagnie???? ciasto. Wy??o??y?? na tortownic?? o ??rednicy 23cm (sp??d oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a nast??pnie przestudzi??.'),
(5, 2, 'Masa Serowa', 'W misie umie??ci?? wszystkie sk??adniki na mas?? serow??. Powinny mie?? temperatur?? pokojow??. Wymiesza?? mikserem tylko do uzyskania g??adkiej masy. Nie miksowa?? d??ugo, by  nie napowietrzy?? masy co mog??oby skutkowa?? opadni??ciem sernika po wyj??ciu z piekarnika. Mas?? wyla?? na przestudzony sp??d. Piec w temperaturze 160 stopni Celsjusza przez ok. 80 minut. Wyj???? z piekarnika i wystudzi??. Po tym czasie sch??odzi?? w lod??wce przez ca???? noc.'),
(6, 2, 'Solony Karmel', 'Cukier wysypa?? na patelni?? i podgrzewa?? na ma??ym ogniu, bez mieszania do rozpuszczenia. Doda?? mas??o ca??y czas mieszaj??c. Gdy sk??adniki si?? po????cz?? wla?? odrobin?? krem??wki i wymiesza??. Je??li karmel b??dzie za g??sty doda?? wi??cej ??mietanki. Doda?? szczypt?? soli i zdj???? z palnika. Zimnym karmelem pola?? sch??odzony sernik.'),
(7, 3, 'Ciasto', 'M??k?? wymiesza?? z dro??d??ami, nast??pnie doda?? cukier, mas??o, letnie mleko, jajka oraz szczypt?? soli. Zagnie???? ciasto i wyrabia?? odpowiednio d??ugo, a?? b??dzie mi??kkie i elastyczne. Uformowa?? kul?? i w??o??y?? do miski opruszonej m??k??. Odstawi?? w ciep??e miejsce do wyro??ni??cia (ok.1,5h).'),
(8, 3, 'Nadzienie', 'Roztopione mas??o po????czy?? z cukrem i cynamonem.'),
(9, 3, 'Formowanie bu??czek', 'Wyro??ni??te ciasto rozwa??kowa?? na kszta??t prostok??ta. Wy??o??y?? nadzienie na 2/3 ciasta (d??u??szego boku prostok??ta). Nast??pnie 1/3 ciasta nieposmarowanego i 1/3 ciasta z nadzieniem z??o??y?? na zak??adk??, tak by powsta??y trzy pi??tra ciasta prze??o??one dwoma warstwami nadzienia. Prostok??t rozwa??kowa?? na grubo???? 1-1,5cm i kroi?? na ok.2 cm paski. Ka??dy z nich zrolowa??. Bu??eczki formowa?? oplataj??c trzy place rulonem ciasta a nast??pnie przek??adaj??c ko??c??wk?? od do??u do g??ry przez powsta??y otw??r. Bu??eczki wy??o??y?? na blaszk?? i pozostawi?? na kilkana??cie minut do wyro??ni??cia. Posmarowa?? roztrzepanym jajkiem i piec w temperaturze 180 stopni przed 20-25 min. (do zrumienienia).'),
(10, 4, 'Ciasto', 'Wszystkie sk??adniki powinny znajdowa?? si?? w temperaturze pokojowej. Zagnie???? ciasto i odstawi?? do lod??wki na min. 1 godzin??. Porcje sch??odzonego ciasta rozwa??kowa??, pokroi?? w tr??jk??ty, wy??o??y?? nadzienie i formowa?? rogaliki. Tak przygotowane rogaliki posmarowa?? jajkiem, a nast??pnie posypa?? kryszta??kami cukru. Piec w temperaturze 180 stopni Celsjusza do zrumienienia.'),
(11, 5, 'Beza', 'Bia??ka ubi?? z cukrem na sztywn?? pian??. Pod koniec ubijania doda?? ??y??eczk?? m??ki ziemniaczanej. Bez?? wy??o??y?? na blaszk?? i wsadzi?? do rozgrzanego do 130 stopni Celsjusza piekarnika. W????czy?? termoobieg i obni??y?? temperatur?? do 100 stopni. Suszy?? przez 3 godziny. '),
(12, 5, 'Krem ??mietanowy', 'Sch??odzon?? ??mietank?? 30% oraz mascarpone ubi?? na sztywny, puszysty krem. Pod koniec ubijania doda?? cukier puder wedle uznania.'),
(13, 5, 'Konfitura wi??niowa', 'Wi??nie umie??ci?? w garnku i podgrzewa?? na ma??ym ogniu. Doda?? cukier wed??ug w??asnych preferencji. Gotowa?? przez kilka minut, a nast??pnie doda?? 1 ??y??eczk?? m??ki ziemniaczanej. Gotowa?? jeszcze ok. 2 minut do zg??stnienia. Je??li konsystencja b??dzie zbyt lej??ca doda?? odrobin?? wi??cej m??ki i ponownie zagotowa??. Zdj???? z palnika i od??o??y?? do przestudzenia.'),
(14, 6, 'Ciasto kruche', 'Mas??o, m??k??, s??l oraz cukier puder zasieka??. Doda?? ??????tko i zagnie???? ciasto. Form?? do tarty posmarowa?? mas??em i obsypa?? bu??k?? tart??. Ciasto wy??o??y?? na form?? i piec w temperaturze 180 stopni Celsjusza do zrumienienia'),
(15, 6, 'Krem budyniowy', 'Mleko z cukrem i cukrem waniliowym podgrzewa?? do zagotowania od czasu do czasu mieszaj??c. M??ki, ??????tka oraz jajka wymiesza?? w osobnej misce. Gdy mleko zacznie si?? gotowa??, doda?? powsta???? mas?? z m??ki i jajek, a nast??pnie ??y??eczk?? mas??a. Energicznie miesza?? do zg??stnienia kremu. Zdj???? z ognia i odstawi?? do przestudzenia. Krem wy??o??y?? na upieczony i przestudzony sp??d, a na wierzch wy??o??y?? truskawki pokrojone w po????wki lub ??wiartki.'),
(16, 7, 'Ciasto kruche', 'Mas??o umie??ci?? w rondelku. Gotowa?? na ??rednim ogniu, cz??sto mieszaj??c a?? do momentu z??otobr??zowego koloru i pojawienia si?? ciemnych plamek. Zdj???? z palnika i przestudzi??. M??k?? wymiesza?? z sol?? i cukrem. Doda?? przestudzone mas??o i zagnie???? ciasto. Wy??o??y?? na tortownic?? o ??rednicy 23cm (sp??d oraz boki). Podpiec przez ok.10 min w temperaturze 180 stopni Celsjusza, a nast??pnie przestudzi??.'),
(17, 7, 'Masa serowa', 'Ser, cukier, jajka i ??mietank?? umie??ci?? w jednym naczyniu. Doda?? cukier oraz past?? waniliow??. Zmiksowa?? do po????czenia i nie d??u??ej ni?? to konieczne, aby nie napowietrzy?? masy serowej. Mas?? wyla?? na podpieczony sp??d i posypa?? dwoma ??y??kami cukru pudru, skarmelizuje si?? podczas pieczenia. Piec 30min w temperaturze 220 stopni Celsjusza. Po wyci??gni??ciu sernik powinien by?? ??ci??ty przy brzegach. Przestudzi?? i w??o??y?? do lod??wki na minimum ca???? noc.');

--
-- Indeksy dla zrzut??w tabel
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

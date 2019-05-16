-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Sty 2019, 04:14
-- Wersja serwera: 10.1.36-MariaDB
-- Wersja PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `piwne_smaki`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `like_unlike`
--

CREATE TABLE `like_unlike` (
  `id_like` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `type` int(2) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `like_unlike`
--

INSERT INTO `like_unlike` (`id_like`, `userid`, `postid`, `type`, `timestamp`) VALUES
(1, 1, 1, 1, '2018-02-21 14:29:39'),
(2, 2, 1, 1, '2018-02-21 14:45:51'),
(3, 3, 1, 1, '2018-11-30 00:50:45'),
(4, 4, 1, 1, '2018-02-21 14:50:56'),
(6, 5, 2, 0, '2018-02-21 17:49:55'),
(7, 3, 3, 1, '2018-02-21 15:11:56'),
(8, 4, 2, 0, '2018-02-21 15:11:56'),
(9, 6, 1, 1, '2018-02-21 15:11:56'),
(10, 7, 2, 0, '2018-02-21 15:11:56'),
(11, 9, 2, 1, '2018-11-30 19:02:52'),
(12, 9, 3, 1, '2018-11-30 11:02:29'),
(13, 9, 1, 0, '2019-01-08 15:38:40'),
(14, 9, 7, 0, '2018-11-29 23:49:51'),
(15, 9, 6, 0, '2018-11-30 10:15:08'),
(16, 9, 9, 1, '2018-11-30 00:03:22'),
(17, 9, 8, 1, '2018-11-30 10:17:57'),
(18, 3, 6, 1, '2018-11-30 00:50:50'),
(19, 3, 4, 1, '2018-11-30 00:50:54'),
(20, 3, 10, 1, '2018-11-30 00:50:58'),
(21, 9, 4, 1, '2018-11-30 10:17:38'),
(22, 9, 10, 1, '2018-12-08 18:19:24'),
(23, 9, 14, 1, '2018-12-06 02:47:36'),
(24, 9, 16, 1, '2018-11-30 09:14:42'),
(25, 9, 12, 1, '2018-11-30 10:15:14'),
(26, 9, 17, 0, '2018-11-30 11:02:38'),
(27, 3, 7, 1, '2018-12-01 15:58:20'),
(28, 9, 5, 1, '2018-12-14 10:42:13'),
(29, 3, 2, 1, '2018-12-02 12:40:28'),
(30, 9, 15, 1, '2018-12-05 22:19:17'),
(31, 9, 18, 1, '2018-12-07 08:49:18'),
(32, 11, 1, 1, '2019-01-04 02:36:27'),
(33, 12, 1, 1, '2019-01-13 00:36:19'),
(34, 12, 4, 0, '2019-01-13 00:36:23'),
(35, 12, 8, 1, '2019-01-13 00:36:26'),
(36, 12, 14, 1, '2019-01-13 00:36:29'),
(37, 12, 9, 1, '2019-01-13 00:36:35'),
(38, 12, 16, 1, '2019-01-13 00:36:38'),
(39, 12, 18, 1, '2019-01-13 00:36:42'),
(40, 12, 13, 1, '2019-01-13 00:36:45');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przepisy`
--

CREATE TABLE `przepisy` (
  `id_rodzaju_piwa` int(11) NOT NULL,
  `id_skladnika` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje`
--

CREATE TABLE `rodzaje` (
  `id_rodzaju_skladnika` int(11) NOT NULL,
  `nazwa` text CHARACTER SET ucs2 COLLATE ucs2_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `smak` text COLLATE utf8_polish_ci NOT NULL,
  `kraj_pochodzenia` text COLLATE utf8_polish_ci NOT NULL,
  `jak_zrobic` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rodzaje`
--

INSERT INTO `rodzaje` (`id_rodzaju_skladnika`, `nazwa`, `opis`, `smak`, `kraj_pochodzenia`, `jak_zrobic`) VALUES
(1, 'Lager', 'Piwo dolnej fermentacji. Ma delikatny zapach i łagodny, wytrawny smak, słody i chmiele są mało wyczuwalne. Jest niezbyt treściwe, ale mocno nagazowane. Występują również w wersjach bursztynowych i ciemnych, które ciemniejszy kolor i karmelowe posmaki zawdzięczają dodatkowi słodu karmelowego bądź palonego.', 'Smak jest łagodny i wytrawny. Chmiele i słód słabo wyczuwalne.', 'Do 19-tego wieku produkowany w Niemczech', 'Jeszcze niy wiym'),
(2, 'Pilzner', 'Piwo dolnej fermentacji. W porównaniu z lagerem słód jest w nim bardziej wyczuwalny, głównie jako posmak biszkoptowy. Piwo to jest również nieco bardziej nachmielone- można wyczuć kwiatowe aromaty.', 'Smak jest bardziej wyrazisty, goryczkowaty. Spowodowane większą ilością chmielu', 'Pilzno Czechy (Bochemia) Wyprodukowany w 1842r. Pilsner Urquell znany do dziś.', 'Na pewno musi być grube szkło z Czech.'),
(3, 'Koźlak', 'Piwo dolnej fermentacji. W smaku wyczuwa się wyraźnie biszkoptowo-karmelowy słód, chmiel zaś jest słabo wyczuwalny bądź w ogóle niewyczuwalny', 'Smak wyraźnie biszkoptowo-karmelowy słód jest wyczuwalny.', 'Bock (niem. kozioł) Wywodzi się z Niemiec gdzie sięga początków XIIIw.', ''),
(4, 'Piwo hybrydowe', 'Piwo fermentowane w sposób łączący fermentację górną oraz dolną- zwykle używa się drożdzy górnej fermentacji i fermentuje się w 15st.', 'Różny. W zależności jaka została zastosowana hybryda smakowa', 'Wywodzi się z USA, a pierwszy browar to wręcz ikona stylu - Anchor Stteam z Anchor Brewing Company ', ''),
(5, 'Ale', 'Piwo górnej fermentacji i występuje w licznych odmianach. Jest mało lub średnio chmielone, a jego smak zależy od użytych surowców oraz sposobu ich użycia. Zwykle ma jasny kolor, jednak do tej kategorii zaliczają się też piwa czerwone lub brązowe', 'Słabo wyczuwalna goryczka co jest spowodowane małym zachmieleniem. Piwo jest różne w smaku w zależności od zastosowanych surowców ', 'Piwo o wielowiekowej tradycji. W średniowieczu stanowiło jedną z głónych źródeł diety. W opactwie Selby nawet, gdy mąż z żoną przeszli na emeryturę otrzymywali 2 litry piwa dziennie(brzmi ciekawie).', 'Jak Ale to tylko Gerald z Rivii!!'),
(6, 'Bitter', 'Odmiana angielskiego ale. Niezbyt intensywny aromat chmielu i słodu przy wysokim nagazowaniu i wysyceniu tworzy piwo wytrawne, nieco wodniste i bardzo łatwo pijalne. ', 'Odmiana piwa ale, jednak zastosowane większe nachmielenie sprawia, że piwo jest bardziej goryczkowate i wytrawne. ', 'Najwcześniejsze wzmianki o pochodzeniu piwa rodzaju Bitter sięgają starożytnego Egyptu.', ''),
(7, 'Porter', 'Jest to ciemne piwo górnej fermentacji. Charakteryzuje się czekoladowym posmakiem i bardzo słabo wyczuwalnym aromatem chmielu.', 'Piwo ciemne. Słabo wyczuwalna goryczka.', 'Piwo było znane już w 1721r. Jednak prawdziwie rozpowszechnione zostało przez brytyjskiego pisarza Johna Feltmana w 1802r.', ''),
(8, 'Porter bałtycki', 'Mocne piwo dolnej fermentacji o dużej ilości alkoholu oraz silnym palonym i kawowym smaku. Nadaje się do długiego leżakowania- z czasem jego smak się zmienia, po kilku latach może pojawić się w nim np. posmak suszonej śliwki.', 'Smak z czasem się zmienia. Z czasem pojawia się posmak suszonej śliwki', 'Piwo wywodzi się z krajów  basenu morza bałtyckiego. Polski porter bałtycki (np. Żywiec porter) jest uważany za jedenego z najlepszych w gatunku.', ''),
(9, 'Stout', 'Piwo ciemne górnej fermentacji. Jest podobne do portera, warzy się je jednak w większej ilości słodu palonego, dzięki czemu uzyskuje się smak kawowy lub nawet palony. Istnieje wiele odmian tego stylu. Najpopularniejsze to dry stout (wytrawny, palony), milk stout (z dodatkiem laktozy, która nadaje kremową słodycz), a także oatmeal stout (z dodatkiem płatków owsianych, które dają piwo bardziej kremowe i o lepszej pianie)', 'Smak kawowy, nawet palony.', 'Pierwsze wzmianki pochodzą z zapisków kościelnych Egerton w Anglii i sięgają 1677r.', ''),
(10, 'India pale ale', 'IPA to piwo górnej fermentacji, bogate w posmaki chmielowe. Charakteryzuje się dużą zawartością alkoholu i mocną goryczką. Ze względu na pochodzenie chmieli użytych w trakcie warzenia można wyróżnić kilka odmian, jak American IPA czy EnglishIPA', 'Piwo mocno nachmielone. Bardzo gorzkie.', 'Piwo było eksportowane z Indii, a rozpowszechnione w Angli jako India Pale Ale.', ''),
(11, 'Hefeweizen ', 'Jest to niemieckie piwo górnej fermentacji, warzone w dużej części ze słodu pszenicznego. Dzięki zastoowaniu specjalnych drożdzy jego smak to połączenie bananów i goździków w różnych proporcjach, zależnych od temperatury fermentacji. Mętny kolor dzięki zawiesinie drożdzowej oraz mocna piana dopełniają charakteru piwa.', 'Smak to połączenie bananów i goździków.', 'Piwo pszeniczne wywodzące się z Niemiec.', ''),
(12, 'Witbier', 'Belgijska odmiana piwa pszenicznego, warzona przy użyciu specjalnych drożdży oraz dużej ilości przypraw, zwykle korzennych. Piwo charakteryzuje się właśnie przyprawowym smakiem.', 'Smak bardzo podobny jak w hefeweizenie. Wyczuwalny posmak goździków. Zawiera większe ilości przypraw.', 'Piwo początkowo było głównie produkowane w Belgii oraz Holandii.', ''),
(13, 'Grodziskie', 'Polski styl piwa!, historycznie warzony w Grodzisku Wielkopolskim. Jest to piwo pszeniczne jednak różni się od innych piw pszenicznych dużym lub nawet stu procentowym udziałem słodu pszenicznego wędzonego, co daję w pierwszej kolejności posmaki wędzarnicze. Warzone w Polsce i w USA', 'Bardzo mocno wyczuwalny posmak wędzarniczy.', 'Piwo poczatkowo było produkowane tylko w Grodzisku Wielkopolskim w XIV i XV wieku. Tradycyjny polski styl piwa.', ''),
(14, 'Belgijskie mocne', 'opis do uzupełnienia', 'Piwo bardzo słodkie, lekko karmelowe, często posmak jabłka oraz bananów.', 'Jest to mocne piwo pochodzące z Belgii. Piwa wywodzące się z tego kraju charakteryzują się posiadaną wyższą zawartością alkoholu od innych rodzajów piwa.', ''),
(15, 'Barley wine', 'Angielskie mocne, jasny odpowiednik piwa typu russian imperial stout. Zawiera dużo alkoholu, często ma karmelowy aromat i lekką goryczkę, co upodabnia je do piwa typu tripel, choć bywa mocniejsze.', 'Bardzo słodkie piwo.', 'Piwo początkowo było tworzone w starożytnej Armenii oraz Grecji. Jedno z najstarszych pochodzeń do dziś tworzonego piwa barley wine to Anglia gdzię było produkowane już w XV wieku. ', ''),
(16, 'Saison', 'Piwo górnej fermentacji, przyprawowe, lekko korzenne. Zwykle używa się do jego produkcji specjalnych drożdzy, które wytwarzają te smaki, proces fermentacji przebiega też w nieco wyższych temperaturach - około 25st. ', 'Przy produkcji dodaje się skórkę gorzkiej pomarańczy (curacao) by podkreślić przyprawowo - korzenny aromat drożdzy.', 'Początkowo był tworzony w Walonii, czyli części Belgi francuskojęzycznej.', ''),
(17, 'Lambic', 'Lambiki to piwa górnej fermentacji, do których wykorzystuje się dzikie drożdże oraz bakterii kwasu mlekowego. Wymagają bardzo długiego leżakowania - przeciętnie około roku. ', 'Charakterystyczny jest bardzo kwaśny smak, wytrawność. Występują w różnych wariantach, często z dodatkami owocowymi.', 'Jest to także piwo belgijskie produkowane w regionach brukseli oraz regionie Pajottenland.', ''),
(18, 'Piwa z dodatkami ', 'Do produkcji tego piwa można wykorzystać różne składniki, w zależności od tego, co chce się uzyskać. Piwowarzy domowi oraz browary rzemieślnicze chętnie sięgają na przykład po dodatek dyni, opiekanego drewna, owoców, miodu, soku owocowego, przypraw albo innych alkoholi.', 'Często w nazwach piw pojawiają się dodatkowe informacje, które precyzują użyte surowce i spodziewany smak. Przykłady to single hop - czyli piwo robione z jednego rodzaju chmielu. Single malt - piwo robione z jednego rodzaju słodu.', 'Piwo jest produkowane w znacznej ilości i trudno określić, kto był protoplastą tego gatunku piwa.', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skladniki`
--

CREATE TABLE `skladniki` (
  `id_skladnika` int(11) NOT NULL,
  `nazwa` text COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `id_rodzaju_skladnika` text COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `skladniki`
--

INSERT INTO `skladniki` (`id_skladnika`, `nazwa`, `opis`, `id_rodzaju_skladnika`) VALUES
(1, 'Słód pilzneński', 'Słód pilzneński odznaczający się krótkim kiełkiem. Szczególnie dobrze nadają się do piw typu pilzneńskiego (pilzner) o mocnym nachmieleniu, pełnym smaku i dobrej pienistości. Może stanowić 100% zasypu. Nadaje się do ciemnych piw, zarówno dolnej jak i górnej fermentacji.', 'Słód podstawowy'),
(2, 'Słód monachijski ', 'Słód monachijski posiada ciemną barwę, produkowany jest z jęczmienia o wyższej zawartości białka. Piwo warzone na tym słodzie ma ciemniejszą barwę, ostrzejszy zapach   i smak z wyczuwalną nutą słodową. Zwykle stosowany w ilości 10-60% zasypu.', 'Słód podstawowy'),
(3, 'Słód wiedeński ', 'Słód wiedeński stanowi typ przejściowy pomiędzy słodem jasnym a ciemnym. Stosowany w celu pogłębienia pełności smakowej piw marcowych, koźlaków majowych, Oktoberfestbier, Golden Ale i porterów.', 'Słód podstawowy'),
(4, 'Słód pale ale', 'Słód pale ale  wywodzący się z Wielkiej Brytanii i stosowany do produkcji piw o brytyjskich korzeniach. Przystosowany do zacierania infuzyjnego, jedno temperaturowego. Cechuje się wyższym stopniem rozluźnienia, nieco niższą aktywnością enzymatyczną i nieco wyższą barwą (4,5 - 8EBC) w porównaniu ze słodem pilzneńskim. Ze względu na niską zawartość białka można pominąć przerwę białkową w procesie zacierania. Słód ten może stanowić do 100% zasypu. Odpowiedni przede wszystkim do piw o pochodzeniu brytyjskim: ale, stout, porter.', 'Słód podstawowy'),
(5, 'Słód pszeniczny ', 'Słód pszeniczny jest używany nie tylko do produkcji piwa pszenicznego, ale także do produkcji innych typów piwa jak np. niemieckiego piwa Koelsch. \r\nW porównaniu z jęczmieniem, pszenica wyróżnia się przede wszystkim brakiem łuski i wyższą zawartością białka. Dodatek kilku procent słodów pszenicznych przy produkcji piw ze słodu jęczmiennego korzystnie wpływa na pienistość piwa. Podstawowymi odmianami jest słód pszeniczny jasny, ciemny, karmelowy i czekoladowy.', 'Słód specjalny'),
(6, 'Słód karmelowy ', 'Słód karmelowy otrzymywany jest ze słodu mokrego, poddanego prażeniu w temp. 150-180°C. Zwiększa on intensywność barwy brzeczki, nadaje piwu słodki, karmelowy smak. Stosuje się go do produkcji piwa ciemnego.', 'Słód specjalny '),
(7, 'Słody palone, barwiące, czekoladowe, czarne', 'Słody palone, barwiące, czekoladowe, czarne otrzymywane są przez prażenie słodu jęczmiennego lub słodu mokrego w temp. 200-220°C. Zadaniem tych słodów jest nadanie piwom ciemnego koloru. Ponadto wnoszą aromaty karmelowe, kawowe, orzechowe, a w większych ilościach i źle zastosowane mogą wnosić do piwa posmak spalenizny. Używa się ich zwykle w ilościach nieprzekraczających kilku procent.', 'Słód specjalny'),
(8, 'Słody specjalne inne', 'zakwaszający, melanoidynowy, wędzony, żytni, orkiszowy.', 'Słód specjalny'),
(9, 'Apollo', 'Amerykański chmiel supergoryczkowy (15-19% alfa-kwasów). Nadaje delikatny posmak graipefruitów.', 'Chmiel goryczkowy'),
(10, 'Bravo', 'Amerykański chmiel supergoryczkowy(14-17% alfa-kwasów). Wykorzystywany głównie do piw górnej fermentacji.', 'Chmiel goryczkowy'),
(11, 'Brewer\'s Gold', 'Chmiel uprawiany w Anglii, Niemczech i w USA. W każdym z tych państw ma nieco inne właściwości i poziom alfa-kwasów (8-11%).', 'Chmiel goryczkowy'),
(12, 'Columbus', 'Chmiel supergoryczkowy (14-17% alfa-kwasów) o delikatnym aromacie cytrusów, podobny do chmieli Tomahawk i Zeus.', 'Chmiel goryczkowy'),
(13, 'Lunga', 'Polski chmiel supergoryczkowy (10-14% alfa-kwasów). Cechuje się łagodną, krótką goryczką', 'Chmiel goryczkowy'),
(14, 'Magnum', 'Chmiel goryczkowy (11-16% alfa-kwasów), który uprawiany jest w USA i w Niemczech. Daje czystą i krótką goryczkę.', 'Chmiel goryczkowy'),
(15, 'Marynka ', 'Polski chmiel goryczkowy (6-12% alfa-kwasów), który można stosować w małych ilościach jako chmiel aromatyczny- nadaje wtedy piwu aromaty żywiczne.', 'Chmiel goryczkowy'),
(16, 'Target', 'Angielski chmiel goryczkowy (9-12% alfa_kwasów) o ciekawym, ziołowym aromacie. Z tego względu czasem jest wykorzystywany do chmielenia na zimno angielskich ale.', 'Chmiel goryczkowy'),
(17, 'Tomahawk', 'Podobny do Columbusa i Zeusa chmiel goryczkowy (14,5-17% alfa-kwasów), jednak najbardziej aromatyczny spośród tej trójki. Nadaje piwu posmak cytrusów i wnosi aromaty estrowo-kwiatowe.', 'Chmiel goryczkowy'),
(18, 'Zeus', 'Zbliżony smakiem do Columbusa i Tomahawka chmiel supergoryczkowy (12-16,5% alfa-kwasów). Ma aromat cytrusowy z małą domieszką żywicy', 'Chmiel goryczkowy'),
(19, 'Admiral', 'Chmiel angielski pdobny nieco do targetu. Zawiera dużą ilość alfa-kwasów (13-16%), więc może być stosowany również jako chmiel goryczkowy. Polecany, jak Target, do angielskich piw tradycyjnych.', 'Chmiel cytrusowy'),
(20, 'Athanum', 'Nowofalowy chmiel z USA, o średniej goryczce (5-6$ alfa kwasów) i ciekawym bukiecie, łączącym cytrusy z nutami kwaitowymi. Polecanyc szczególnie do chmielenia na zimno.', 'Chmiel nowofalowy'),
(21, 'Amarillo', 'Cjmiel dualny o bardzo intensywnym cytrusowym aromacie, nadający się również do nadawania goryczki (8-11% alfa-kwasów).', 'Chmiel nowofalowy'),
(22, 'Cascade', 'Chmiel uprawiany w Nowej Zelandii, USA i w Niemczech. W zależności od pochodzenia zawiera różną ilość alfa-kwasów (4-9%) i ma nieco inny aromat. ', 'Chmiel nowofalowy'),
(23, 'Centennial', 'Chmiel dualny o smaku zbliżonym do Cascade, jednak o większej zawartości alfa-kwasów(9-12%). Wnosi posmaki cytrusowe.', 'Chmiel nowofalowy'),
(24, 'Citra', 'Pochodzący z USA popularny chmiel dualny (11-13% alfa-kwasów) dające zróżnicowane smaki cytrusowe i owocowe polecany jako dodatek do fermentacji cichej.', 'Chmiel nowofalowy'),
(25, 'Mosaic', 'Chmiel dualny (11-13,5% alfa-kwasów). Wnosi wiele aromatów owocowo-cytrusowych, takich jak mango czy limonka, z lekką nutą borówki amerykańskiej. Bardzo podobny do Citry, lecz daje intensywniejsze posmaki', 'Chmiel nowofalowy'),
(26, 'Simcoe', 'Chmiel dualny (12-14% alfa-kwasów), nadający intensywną goryczkę i aromaty cytrusowe', 'Chmiel nowofalowy'),
(27, 'Agnus', 'Nowofalowa czeska odmiana chmielu dualnego. Zawiera 9-12% alfa-kwasów, co pozwala używać go jako chmielu goryczkowego. Daje delikatne aromaty korzenne.', 'Chmiel korzenny'),
(28, 'Challenger', 'Angielski chmiel dualny, o średniej zawartości alfa-kwasów (6-8%). Nadaje piwu lekkie posmaki owocowe oraz korzenne ', 'Chmiel korzenny'),
(29, 'Lomik', 'Używany przy produkcji piwa grodziskiego polski chmiel o niewielkiej goryczce(3-5% alfa-kwasów) oraz smaku zbliżonym di Lubelskiego, jednak o mniejszej zawartości olejków eterycznych', 'Chmiel korzenny'),
(30, 'Lubelski', 'Super aromatyczny chmiel o niewielkiej goryczce (3-4,5% alfa-kwasów), lecz bardzo przyjemnym, delikatnym aromacie korzenno-ziołowym', 'Chmiel korzenny'),
(31, 'Saaz', 'Czeski chmiel zbliżony parametrami do Lubelskiego, o nieco mocniejszej goryczce (3-6% alfa-kwasów). Podobnie jak chmiel Lubelski nadaje piwu aromaty korzenno-ziołowe. Na rynku dostępny także pod nazwą Żatecki. ', 'Chmiel korzenny'),
(32, 'Aurora', 'Słoweński chmiel średniogoryczkowy (7-9% alfa-kwasów). Ma dosyć wyraźny aromat kwiatowo-ziołowy', 'Chmiele różne'),
(33, 'Bramling Cross', 'Średniogoryczkowy (6-8% alfa-kwasów) stary chmiel angielski, o ciekawym posmaku czarnej porzeczki.', 'Chmiel różny'),
(34, 'Calypso', 'Nowofalowy, dualny chmiel z USA o wysokiej zawartości alfa-kwasów (12-14%) oraz silnym smaku owoców: brzoskwini, gruszki lub wiśnii, z lekką nutą cytrusów', 'Chmiel różny'),
(35, 'Chinook', 'Amerykański chmiel supergoryczkowy(12-14% alfa-kwasów), który daje aromaty żywiczne i posmak graipfruta. Polecany do mocno goryczkowych piw jako dodatek do fermentacji cichej.', 'Chmiel różny'),
(36, 'Fuggle', 'Angielski chmiel supergoryczkowy(3-6% alfa-kwasów), o silnych aromatach owoców i przypraw. Często stosowany na zimno.', 'Chmiel różny'),
(37, 'Hallertau', 'Stary chmiel niemiecki, występującyy w wielu różniących się od siebie odmianach. Najpopularniejsze to: Hallertau Merkur, Mittelfruh, Tradition.', 'Chmiel różny'),
(38, 'Perle', 'Niemiecki chcmiel dualny (4-9%alfa-kwasów) o ciekawym, miętowo-przyprawowym aromacie.', 'Chmiel różny'),
(39, 'Drożdże dolnej fermentacji', '', ''),
(40, 'Drożdże górnej fermentacji', '', ''),
(41, 'Kłaczkowanie', '', ''),
(42, 'Stopień odfermentowania', '', ''),
(43, 'Temperatura fermentacji', '', ''),
(44, 'Wytrzymałość na alkohol', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`) VALUES
(3, 'Wojtek', 'wojtek@gmail.com', '4c1e5feb718356b4f8bf245f3305bb82'),
(4, 'Damian', 'damian@gmail.com', '8a381c095dd96c5e8c78882b3d260cd1'),
(9, 'a', 'a@gmail.com', '0cc175b9c0f1b6a831c399e269772661'),
(10, 'as', 'as@gmail.com', 'f970e2767d0cfe75876ea857f92e319b'),
(11, 'CEO', 'CEO@gmail.com', '55161575f3e05dfb61145c5d63d67d29'),
(12, 'Jan', 'jan@gmail.com', 'fa27ef3ef6570e32a79e74deca7c1bc3');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `like_unlike`
--
ALTER TABLE `like_unlike`
  ADD PRIMARY KEY (`id_like`);

--
-- Indeksy dla tabeli `przepisy`
--
ALTER TABLE `przepisy`
  ADD PRIMARY KEY (`id_rodzaju_piwa`);

--
-- Indeksy dla tabeli `rodzaje`
--
ALTER TABLE `rodzaje`
  ADD PRIMARY KEY (`id_rodzaju_skladnika`);

--
-- Indeksy dla tabeli `skladniki`
--
ALTER TABLE `skladniki`
  ADD PRIMARY KEY (`id_skladnika`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `like_unlike`
--
ALTER TABLE `like_unlike`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

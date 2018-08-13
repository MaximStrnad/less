-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 09. srp 2018, 08:38
-- Verze serveru: 10.1.22-MariaDB
-- Verze PHP: 7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `c1ddd`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `d3_druhy_projektu`
--

CREATE TABLE `d3_druhy_projektu` (
  `id` int(11) NOT NULL,
  `nazev` varchar(30) NOT NULL,
  `barva` varchar(20) NOT NULL,
  `kod` varchar(20) NOT NULL,
  `poradi` int(11) NOT NULL,
  `styl` varchar(30) NOT NULL,
  `nazev_en` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `d3_druhy_projektu`
--

INSERT INTO `d3_druhy_projektu` (`id`, `nazev`, `barva`, `kod`, `poradi`, `styl`, `nazev_en`) VALUES
(1, 'loga', 'tyrkis', 'logo', 1, 'logo', 'logos'),
(2, 'weby', 'yellow', 'web', 2, 'webdesign', 'websites'),
(3, 'tiskoviny', 'red', 'tisk', 3, 'print', 'prints'),
(4, 'obaly', 'green', 'obal', 4, 'packaging', 'packaging'),
(5, 'indoor/outdoor', 'orange', 'inout', 5, 'inout', 'indoor/outdoor'),
(6, 'appky', '', 'app', 6, '', 'apps');

-- --------------------------------------------------------

--
-- Struktura tabulky `d3_klienti`
--

CREATE TABLE `d3_klienti` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(30) NOT NULL,
  `mesto` varchar(50) NOT NULL,
  `popisek` text NOT NULL,
  `poradi` int(11) NOT NULL,
  `rok` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  `poznamka` text NOT NULL,
  `popisek_en` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `d3_klienti`
--

INSERT INTO `d3_klienti` (`id`, `jmeno`, `mesto`, `popisek`, `poradi`, `rok`, `url`, `poznamka`, `popisek_en`) VALUES
(3, 'Bláha', 'Vrané', 'Pro muzea v celé Evropě navrhuje a vyrábí systémy pro uschování i prezentaci předmětů všech druhů', 900, 2006, 'www.regal.cz', '', 'A company that designs and manufactures systems for the storage and presentation of objects of all kinds for museums across Europe'),
(2, 'Beznoska', 'Kladno', 'Tradiční český rodinný podnik, výrobce kloubních náhrad a chirurgických nástrojů', 3900, 2006, 'www.beznoska.cz', '', 'Traditional Czech family business, a manufacturer of artificial joints and surgical instruments'),
(1, 'MTB', 'Praha', 'Populární výrobce modelů lokomotiv, vagónů, a dalších prvků modelové železnice', 3100, 2011, 'www.mtb-model.com', '', 'Popular manufacturer of models of locomotives, wagons and other elements of the model railroad'),
(70, 'Kovona', 'Lysá nad Labem', 'Kvalitní kovový nábytek pro šatny, dílny, kanceláře, ordinace, sklady i domácnosti', 0, 2014, 'www.kovona.com', '', 'High-quality metal furniture for dressing rooms, workshops, offices, warehouses and households'),
(71, 'Dřevošrot', 'Mníšek pod Brdy', 'Zpracovatel dřevního odpadu na materiál pro spalování', 0, 2016, 'www.drevosrot.cz', '', 'Wood waste processor for combustion material'),
(72, 'KKZPP', 'Plzeň', 'Klub klíčových zákazníků Plzeňského Prazdroje', 0, 2016, '', '', 'Club of key customers of Plzeňský Prazdroj'),
(73, 'Miloš Nemčko', 'Praha', 'Osobní kouč a mentor', 0, 2014, 'www.nemcko.cz', '', 'Personal coach and mentor'),
(74, 'PCO Horský', 'Kladno', 'Lokální bezpečnostní agentura a pult centralizované ochrany', 0, 2014, 'www.pcohorsky.cz', '', 'Local Security Agency and Centralized Protection Desk'),
(75, 'Stablo', 'Kladno', 'Produktová značka betonových výrobků od Destro', 0, 2016, 'www.stablo.cz', '', 'Product brand for concrete products from Destro'),
(76, 'Avert', 'Náchod', 'Bezpečnostní a realitní agentura s působností na Kladensku a Náchodsku', 0, 2014, 'www.avertservice.cz', '', 'Security and real estate agency with jurisdiction in Kladno and Nachod'),
(77, 'Outfits 4 Events', 'Kadaň', 'Eshop s vybavením pro historické hry a replikami historických předmětů', 0, 2015, 'www.o4e.eu', '', 'Eshop with equipment for historical games and replicas of historical objects'),
(78, 'Turistické trasy', 'Olomouc', 'Turistická aplikace která propaguje zajímavá místa v Česku', 0, 2017, '', '', 'A tourist application that promotes interesting places in the Czech Republic'),
(79, 'Navaro', 'Praha', 'Známý kouzelník s bublinami, který se věnuje především dětskému publiku', 0, 2015, 'www.navaro.cz', '', 'A well-known magician with bubbles who is especially dedicated to a child audience'),
(80, 'Goldcars', 'Kladno', 'Prodejce nových i zánovních luxusních automobilů', 0, 2016, '', '', 'Retailer of new and used luxury cars'),
(81, 'Elnet System', 'Kladno', 'Firma pro projekty a montáže elektronických zařízení do budov', 0, 2016, 'www.elnetsys.cz', '', 'Company for projects and installation of electronic equipment in buildings'),
(82, 'Společnost Edvarda Beneše', 'Praha', 'Vzpomínková organizace připomínající život a dílo druhého československého prezidenta', 0, 2005, 'www.seb.cz', '', 'An organization commemorating the life and work of the second Czechoslovak president'),
(83, 'Dům kultury Kladno', 'Kladno', 'Největší dům kultury ve středočeském kraji provozuje společnost Dystan', 0, 2005, 'www.dumkultury.cz', '', 'Largest public hall in central Bohemia operated by company Dystan'),
(32, 'Pozemky Braškov-Valdek', 'Braškov', 'Krásna lokalita vesnického prostředí, příjemné místo s nabídkou stavebních pozemků', 1900, 2011, 'www.pozemky-braskov-valdek.cz', '', 'Beautiful location of a rural environment and a cozy place with a range of building plots'),
(31, 'POLDI Hütte', 'Kladno', 'Tradiční český výrobce kvalitní oceli světoznámé značky', 400, 2009, 'www.poldi.cz', '', 'Top technology of a traditional Czech manufacturer of world famous high-quality steel'),
(30, 'PentaGen', 'Kladno', 'Distributor testů pro laboratorní diagnostiku a ostatního diagnostického materiálu', 2150, 2012, 'www.pentagen.cz', '', 'Distributor of laboratory diagnosis tests and other diagnostic material'),
(28, 'Naven', 'Kladno', 'Prodejny s kvalitním outdoorovým vybavením, s vybavením na ven', 1300, 2008, 'www.naven.cz', '', 'Shop with quality outdoor equipment'),
(27, 'Mediaticus', 'Praha', 'Institut řešení sporů za pomoci mediátora', 225, 2013, 'www.mediaticus.cz', '', 'An institute to resolve disputes with the help of a mediator'),
(26, 'Lebak', 'Vinařice', 'Lebak je kabel obráceně. Velkoobchod s kabely', 825, 2012, 'www.lebak.cz', '', 'Lebak is cable (kabel in czech) said backwards. Wholesale of cables'),
(25, 'Masna Příbram', 'Příbram', 'Výrobce uzenin s dlouholetou historií ve městě pod Svatou horou', 1350, 2006, 'www.masna-pribram.cz', '', 'The sausage maker with a long history in the town below the Holy Mountain'),
(24, 'Malina Safety', 'Jablonec', 'Výrobce speciální pracovní přetlakové dýchací techniky pro použití v průmyslu', 3300, 2006, 'www.malina-safety.cz', '', 'Manufacturer of special working pressurized breathing equipment for use in industry'),
(23, 'Kotlín', 'Kladno', 'Výrobce elektrických a elektronických senzorů vlastního vývoje', 4300, 2006, 'www.kotlin.cz', '', 'Manufacturer of electrical and electronic sensors in his own development'),
(22, 'KönigFrankstahl', 'Modletice', 'Významný dodavatel ocelových profilů, ocelových trubek, válcované a tažené oceli', 1000, 2011, 'www.ocel.cz', '', 'A major supplier of steel profiles, steel pipes, rolled and drawn steel'),
(21, 'Brainway Inc', 'Praha', 'Výrobce potravinových doplňků a přípravků pro podporu léčby', 950, 2013, 'www.bwy.cz', '', 'Manufacturer of nutritional supplements and products to support medical treatment'),
(20, 'KOMA', 'Benešov', 'Velkoobchod pracovními osobními ochrannými pomůckami a vlastní zakázkovou výrobou', 3700, 2005, 'www.koma-benesov.cz', '', 'Wholesale with a personal protective equipment and its own custom manufacturing'),
(19, 'KETTLER', 'Praha', 'Německý výrobce zahradního nábytku a především sportovního náčiní', 3800, 2010, 'www.kettler.cz', '', 'German manufacturer of garden furniture and especially sports equipment'),
(18, 'arcadehry.cz', 'Červený Újezd', 'Největší retro-arkádová videoherna a muzeum v Evropě kousek od Prahy', 2200, 2011, 'www.arcadehry.cz', '', 'The biggest retro-arcade video game and museum in Europe located near Prague'),
(17, 'IZOS', 'Kladno', 'Foukaná tepelná i zvuková izolace staveb, odvětrávané fasády i sádrokarton', 600, 2011, 'www.izos-kladno.cz', '', 'Blown thermal and sound insulation of buildings, ventilated facades and plasterboards'),
(16, 'SKUPINA IPO', 'Ostrava', 'Bezpečnostní a úklidová agentura s osobním přístupem ke klientům', 700, 2011, 'www.ipo.eu', '', 'Security and housekeeping agency with a personal approach to clients'),
(15, 'Invera', 'Rakovník', 'Výrobce vstřikovacích lisů na plasty, gumu a syntetické materiály', 1500, 2006, 'www.invera.cz', '', 'Manufacturers of injection presses for plastics, rubber and synthetic materials'),
(14, 'IC Trading', 'Kladno', 'Velkoobchod s brýlovými obrubami a zákazníky z několika evropských zemí', 4400, 2005, 'www.ictrading.cz', '', 'Wholesale of spectacle frames and with customers from several European countries'),
(13, 'GreenFeeClub', 'Praha', 'Golfový klub nabízející několik exkluzivních hřišť v okolí Prahy za nejlepší ceny', 2400, 2009, 'www.dostdobrydesign.cz', '', 'Golf club offering several exclusive courses in the vicinity of Prague at the best prices'),
(12, 'Freshdays PROTECTOR', 'Kroměříž', 'Značka komfortních papírových hygienických podpažních vložek proti pocení', 100, 2012, 'www.freshdays.cz', '', 'A brand of comfortable underarm sanitary paper napkins against perspiration'),
(11, 'EXPRIT', 'Praha', 'Dnes již neexistující dodavatel software pro správu spisů ve státních úřadech', 2300, 2005, 'www.exprit.cz', '', 'Former supplier of software for managing files in government offices'),
(9, 'entrée.ing', 'Praha', 'Projekční a engineeringová kancelář se zaměřením na zateplování panelových domů', 1800, 2009, 'www.entree-ing.cz', '', 'Design and engineering company focusing on insulation in prefabricated houses'),
(10, 'e-place', 'Aš', 'Instalace bezpečnostních zařízení, solárních panelů a tepelných čerpadel', 3000, 2010, 'www.dostdobrydesign.cz', '', 'Installation of security equipment, solar panels and heat pumps'),
(8, 'DHL Express', 'Praha', 'DHL Express je renomovaná nadnárodní dopravní a logistická společnost', 1400, 2007, 'www.dhl.cz', '', 'DHL Express is a renowned multinational transport and logistics company'),
(7, 'Destro', 'Kladno', 'Recyklací stavebních a ocelárenských odpadů vyrábí štěrky pro stavbu komunikací, betony a další', 2100, 2004, 'www.destro.cz', '', 'Produces aggregates for road construction by recycling the construction and steelmaking waste'),
(5, 'CRAMO', 'Praha', 'Půjčovna stavební a zahradní techniky, vysokozdvižných plošin a ručního nářadí', 4100, 2010, 'www.cramo.cz', '', 'Rental of construction and garden equipment, high-lift platforms and tools'),
(6, 'Dava', 'Kladno', 'Zkušená středočeská stavební společnost s divizí pro samonivelační lité podlahy', 3200, 2009, 'www.dava.cz', '', 'Experienced construction company from middle Bohemia with divisions for self-poured floors'),
(4, 'BRAMKO', 'Semice', 'Pěstitel a velkoobchod bramborami a ostatní zeleninou se sídlem na východ od Prahy', 3500, 2008, 'www.bramko.cz', '', 'Grower and wholesaler of potatoes and other vegetables based in the east of Prague'),
(62, 'TreeKey', 'Králův Dvůr', 'Zahradní architektonický ateliér s komplexními realizačními službami', 175, 2013, '', '', 'Garden architectural studio with complex realization services'),
(63, 'FER', 'Kladno', 'Velkoobchod s několika druhy vysoce kvalitní oceli', 125, 2013, 'www.ferkladno.cz', '', 'Wholesale of several kinds of high quality steel'),
(64, 'Amond', 'Kladno', 'Dealer nových vozů Škoda, VW a Hyundai s příkladnou péčí o zákazníka', 1250, 2013, 'www.amond.cz', '', 'Dealer of a brand new Skoda, VW and Hyundai automobiles with exemplary customer care'),
(65, 'Comet', 'Kladno', 'Comet 3 je unikátní redakční systém pro správu obsahu webu', 90, 2013, 'www.systemcomet.cz', '', 'Comet 3 is a unique content management system'),
(66, 'AK Heyduk Voglová', 'Praha', 'Advokáti, kteří se nebojí velkých úkolů a pomáhají v nich i zahraničním klientům', 0, 2016, 'www.heyduk.eu', '', 'Lawyers who are not afraid of big tasks and are able to help clients all over Europe'),
(56, 'APP', 'Kladno', 'Velkoobchod oleji, pohonnými hmotami a ochrannými pomůckami', 4250, 2008, 'www.app.cz', '', 'Wholesale of oil, fuel and protective equipment'),
(55, 'střižna.cz', 'Praha', 'Internetová televize zaměřená na přenosy sportovních i kulturních událostí', 850, 2012, 'www.strizna.cz', '', 'Internet TV broadcasts aimed at sports and cultural events'),
(54, 'Omnis', 'Olomouc', 'Přední pořadatel výstav a veletrhů ve všech regionech ČR', 2050, 2010, 'www.omnis.cz', '', 'A leading organizer of exhibitions and fairs in all regions of the country'),
(51, 'Kompek', 'Kladno', 'Kombinát pekařské a cukrářské výroby. Průmyslová pekárna v Kladně', 1250, 2005, 'www.kompek.cz', '', 'Combine of bakery and confectionery production. Industrial bakery in Kladno'),
(52, 'Plzeňský Prazdroj', 'Plzeň', 'Největší pivovar v ČR s bohatou základnou oblíbených značek', 1950, 2008, 'www.prazdroj.cz', '', 'The largest brewery in the Czech Republic with a wide base of popular brands'),
(53, 'Nevecom', 'Kladno', 'Kladenský prodejce a servis vozů Škoda, Renault a Dacia', 1750, 2005, 'www.nevecom.cz', '', 'Kladno seller and service of Skoda, Renault and Dacia'),
(50, 'Rocket', 'Karlovy Vary', 'Rocket GOLD je značka energetického nápoje od Velta Tea z Karlových Varů', 2000, 2010, 'www.dostdobrydesign.cz', '', 'Rocket GOLD is a brand of energy drink from Velta Tea from Karlovy Vary'),
(49, 'PTS Praha', 'Praha', 'Letní i zimní úklid a údržba komunikační zeleně a komunální služby', 800, 2010, 'www.ptspraha.cz', '', 'Summer and winter cleaning and maintenance of urban greenery and communal services'),
(48, 'ZOO Praha', 'Praha', 'Zoologická zahrada v Praze, která pomáhá zachraňovat řadu ohrožených živočichů', 4200, 2010, 'www.zoopraha.cz', '', 'Prague Zoo which helps to save many endangered animals'),
(47, 'ZÓNA', 'Praha', 'Řetězec maloobchodních prodejen mnoha značek kvalitní obuvi', 2600, 2006, 'www.obuvzona.cz', '', 'Chain of retail stores of many brands of quality footwear'),
(46, 'zdm', 'Aš', 'Zakázkově orientovaný výrobce reklamního a sportovního textilu a tiskárna', 2700, 2009, 'www.zdm.cz', '', 'Custom-oriented production of advertising and sports textiles and also a printing house'),
(45, 'Z GRUNTU', 'České Budějovice', 'Privátní značka prémiových uzenin Jednoty České Budějovice', 85, 2011, 'www.jednotacb.cz', '', 'Private label of premium sausages from Jednota České Budějovice'),
(44, 'Vyšehrad 2000', 'Praha', 'Cateringová společnost, která navíc provozuje několik restaurací v Praze a okolí', 4000, 2007, 'www.vysehrad2000.cz', '', 'Catering company, which also operates several restaurants in and around Prague'),
(43, 'VESTAV', 'Kladno', 'Prodejce hutního materiálu, barevných kovů a odpadních systémů KG', 3600, 2008, 'www.vestav.cz', '', 'Seller of metallurgical materials, non-ferrous metals and KG sewage systems'),
(41, 'Extreme Clean', 'Praha', 'Firma provádějící čištění parou. Projekt TeenChallenge', 2500, 2010, 'www.teenchallenge.cz', '', 'The firm conducting steam cleaning. The TeenChallenge project'),
(42, 'Univers', 'Kladno', 'Výrobce a dodavatel žaluzií a veškeré stínící a garážové techniky', 3400, 2010, 'www.univers.cz', '', 'Manufacturer and supplier of blinds and all the shading and garage equipment'),
(40, 'Strojírny POLDI', 'Kladno', 'Tradiční strojírenská firma vyrábí především klikové hřídele a jiné strojní součásti', 1700, 2006, 'www.strojpoldi.cz', '', 'Traditional engineering company producing mainly crankshafts and other machine parts'),
(39, 'STRABAG', 'Praha', 'Přední stavební společnost pro odvětví dopravního, pozemního a inženýrského stavitelství', 1600, 2008, 'www.strabag.cz', '', 'Leading construction company for the transport industry, building and civil engineering'),
(38, 'Sommer&vnuk', 'Hostivice', 'Dodavatel ručně sbíraných sušených, mražených a nakládaných hub pro gastronomii', 99, 2009, 'www.sommeravnuk.cz', '', 'Supplier of hand-harvested dried, frozen and pickled mushrooms for gastronomy'),
(37, 'SBS Services', 'Kladno', 'Bezpečnostní agentura se širokým spektrem poskytovaných služeb', 1200, 2006, 'www.sbs-security.eu', '', 'Security agency with a wide range of services'),
(36, 'RYOR', 'Praha', 'Známý český výrobce přírodní kosmetiky s důrazem na individuální péči', 2900, 2008, 'www.ryor.cz', '', 'Known Czech producer of natural cosmetics with an emphasis on individual care'),
(35, 'ROTO Interiéry', 'Kladno', 'Kuchyňské a interiérové studio, které spolupracuje se značkou Hanák', 200, 2009, 'www.rotointeriery.cz', '', 'Kitchen and interior design studio that works with the Hanak brand'),
(34, 'ROCK-N-ROLL', 'Kladno', 'Kladenská stylová hudební restaurace, která pořádá i koncerty. Amerika na Kladně', 1100, 2006, 'www.rockrestaurant.cz', '', 'A stylish musical restaurant from the city of Kladno which also organizes concerts. America in Kladno'),
(33, 'PSP.ADV', 'Praha', 'Stavební společnost provádějící zateplování a rekonstrukce budov', 2800, 2009, 'www.pspadv.cz', '', 'The construction company carrying out insulation and renovation of buildings'),
(61, 'POLDI', 'Kladno', 'Pokračovatel hutní výroby v Kladně po POLDI Hütte', 95, 2013, 'www.poldi.cz', '', 'Follower of metallurgical production for POLDI Hütte in Kladno'),
(60, 'AV tank', 'R7', 'Čerpací stanice a truck centrum při rychlostní silnici R7 z Prahy na Chomutov', 250, 2013, '', '', 'Petrol station and truck center at the R7 highway from Prague to Chomutov'),
(57, 'Bartoň', 'Kladno', 'Bartoňova zásahovka jezdí svým vozem malovat, natírat, čistit a izolovat', 1150, 2012, 'www.ji-ba.cz', '', 'Bartoň emergency car drives around the town to paint, clean and isolate buildings'),
(68, 'Tachtech', 'Straškov-Vodochody', 'Přední stavitel průmyslových pecí a dodavatel žáruvzdorných izolačních materiálů', 0, 2016, 'www.tachtech.cz', '', 'Leading builder of industrial furnaces and supplier of refractory insulating materials'),
(67, 'Petráčkovy Hořické trubičky', 'Hořice', 'Více než 20 let tradice výroby podle legendárního receptu z dob císaře Napoleona', 0, 2015, 'www.horicke-trubicky.eu', '', 'More than 20 years of production tradition according to the legendary recipe from the times of Emperor Napoleon'),
(59, 'SayAction', 'Kladno', 'Agentura pro foto, video a pořádání firemních eventů i exklusivních svateb', 150, 2012, 'www.sayaction.cz', '', 'Agency for photo, video, and organizing corporate events and exclusive weddings'),
(58, 'Lucy Clay', 'Plzeň', 'Profesionální polymerová modelovací hmota pro nadšené kreativce a nástroje na její zpracování', 500, 2012, 'www.lucyclay.eu', '', 'Professional polymer modeling clay for enthusiastic creatives'),
(69, 'Care 2 Grow', 'Praha', 'Organizace výkonnostní péče o zákazníka a řízení projektových týmů', 0, 2016, 'www.care2grow.cz', '', 'Organization of performance customer care and project team management');

-- --------------------------------------------------------

--
-- Struktura tabulky `d3_novinky`
--

CREATE TABLE `d3_novinky` (
  `id` int(11) NOT NULL,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `titulek` text NOT NULL,
  `titulek_en` text NOT NULL,
  `text` text NOT NULL,
  `text_en` text NOT NULL,
  `soubor` varchar(1024) NOT NULL,
  `youtube` varchar(256) NOT NULL,
  `kategorie` enum('novinky','clanky') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `d3_novinky`
--

INSERT INTO `d3_novinky` (`id`, `datum`, `titulek`, `titulek_en`, `text`, `text_en`, `soubor`, `youtube`, `kategorie`) VALUES
(2, '2010-01-13 00:00:00', 'Článek na podnikatel.cz', '', 'Zmínili se o nás v článku na podnikatel.cz. Odpověděli jsme redakci na pár otázek o moderním přístupu k logotypům.', '', '', '', 'clanky'),
(3, '2010-01-19 00:00:00', 'LOGO', '', 'Před několika dny vydalo studio HRaNa knihu, která mapuje česká loga od roku 1989 do roku 2008. Najdete v ní také naše loga obuvi Zóna, obchodu Naven a nerealizované logo firmy Beznoska.', '', 'logo_zona.jpg', '', 'clanky'),
(4, '2010-06-10 00:00:00', 'Logobox.cz', '', 'Na žádost pana Eduarda Zemana napsal Zdeněk pro jeho webový portál logobox.cz kratičký článek, proč se logem vůbec zabývat. Je třeba vyvrátit mýtus, že mít dobré logo (resp. vizuální identitu) je důležité proto, že je krásné. Není to pravda. Mít dobré logo je důležité, protože takové logo pomůže najít vašemu produktu víc zákazníků a vám přinese možnost účtovat si za něj vyšší cenu.', '', '', '', 'clanky'),
(5, '2010-07-12 00:00:00', 'Typopravítko', '', 'Vydali jsme praktickou pomůcku – laminovanou kartu formátu A5 s přehledem nejzákladnějších typografických pravidel pro každodenní použití v kanceláři. Máte-li o tuto pomůcku zájem, kontaktujte nás. Součástí našeho mateřského jazyka jsou také pravidla pro psaní různých značek. Přinášíme vám přehled těch nejzákladnějších. Na porušování normy se ve velké míře bohužel podílejí i profesionálové v oblasti zpracování textu.', '', 'typo_pravitko.jpg', '', 'clanky'),
(6, '2010-07-14 00:00:00', 'Hospodářské noviny', '', 'Již před loňskými Vánocemi vyšel na serveru Hospodářských novin článek o tištěných i elektronických novoročenkách. Zdeněk Sládek odpověděl na několik otázek.', '', '', '', 'clanky'),
(7, '2011-08-17 00:00:00', 'mf DNES', '', 'V pátek 12. srpna 2011 jsme poskytli Mladé frontě rozhovor a dnes to vyšlo! V příloze Léto v rámci seriálu o rodinných firmách vychází v sešitu B rozhovor se Zdeňkem a Milanem Sládkovými.', '', 'mfdnes.jpg', '', 'clanky'),
(8, '2011-09-16 00:00:00', 'Font č. 118', '', 'Děkujeme redakci prvního grafického časopisu Font, že uveřejnila v rámci tématu zářijového vydání Bezpečnostní služby naši komplexní práci pro kladenskou agenturu SBS Services. Ukázku s textem naleznete na straně 35.', '', 'font_sbs.jpg', '', 'clanky'),
(9, '2011-09-21 00:00:00', 'Vystoupení na rádiu Leonardo', '', 'Debaty na kanále Českého rozhlasu zaměřeného na popularizaci vědy se zúčastnili kromě předsedy UGD Ing. Milana Sládka ze studia Dost dobrý design také další dva zakládající členové Unie grafického designu pánové Filip Blažek a Jan Tippman.', '', '', '', 'clanky'),
(10, '2011-10-19 00:00:00', 'Svět reklamy 2011', '', 'Pod záštitou Unie grafického designu se na jedné z přednášek doprovodného programu veletrhu Svět reklamy, který pořádá společnost Omnis, představil také Ing. Zdeněk Sládek. Veletrh se konal 20. 9. 2011 v Brně v kongresovém hotelu Voroněž, který naleznete jen pár kroků od brněnského výstaviště. Tématem přednášky byly nejčastější typografické chyby. Svět reklamy se pak i se svým doprovodným programem a touto přednáškou přesunul do Prahy do hotelu Diplomat, kde slavil snad ještě větší úspěch než při první repríze v Brně. Termín byl stanoven na 4. 10. 2011 v 11.40 hod. Velká část všech typografických chyb má co dělat s mezerami, které někde přebývají, jinde chybí. Správné použití mezer má v několika případech kromě čistě formální správnosti vliv i na význam sdělení.', '', 'sr2011.jpg', '', 'clanky'),
(11, '2011-10-19 00:00:00', 'Marketing & komunikace 3/2011', '', 'Časopis České marketingové společnosti otisknul náš článek Grafický design a grafický designér, který má za cíl všem marketérům více přiblížit profesi grafického (komunikačního) designéra. Autorem článku je Ing. Zdeněk Sládek. Článek prošel schvalovacím řízením redakční rady, kterou vede prof. Gustav Tomek. Naleznete ho v čísle 3/2011 na straně 14. Pokud se podíváme do anglického slovníku, u hesla „design“ najdeme české ekvivalenty „projektovat, plánovat, koncipovat, zamýšlet“. Stejně tak např. ve strojírenství se k českému „konstruovat“ používá stejný anglický ekvivalent. Jsou to ve všech případech pojmy velmi racionálního obsahu popisující analytickou a následnou tvůrčí činnost, která je skutečnou náplní činnosti grafického – komunikačního designéra. Grafický design tedy není prosté vytváření obrázků.', '', 'mak3-11.jpg', '', 'clanky'),
(12, '2012-03-23 00:00:00', 'Marketing & komunikace 1/2012', '', 'Časopis České marketingové společnosti otisknul další ze série článků s názvem Jak vybrat grafického designéra/studio pro spolupráci. Autorem článku je Ing. Zdeněk Sládek. Článek prošel schvalovacím řízením redakční rady, kterou vede prof. Gustav Tomek. Naleznete ho v čísle 1/2012 na straně 25. Mohlo by se zdát, že o úrovni grafického designu rozhodují grafici a grafičtí designéři. Není tomu tak úplně. Rozhodnutí o zlepšení leží více v rukou osvícených a poučených zadavatelů.', '', 'mak1-12.jpg', '', 'clanky'),
(13, '2012-04-17 00:00:00', 'Ročenka UGD', '', 'Několik našich prací se leskne na stránkách první ročenky Unie grafického designu. Na obrázku je patrné logo Z GRUNTU i logo ROTO. Náklad ročenky 1500 ks. Ročenka byla vydána také k příležitosti stánku na veletrhu Reklama/polygraf v Holešovicích v Praze, na kterém jsme se také krátce zastavili.', '', 'ugd_rocenka_1.jpg', '', 'clanky'),
(14, '2012-05-12 00:00:00', 'Noviny pro grafický průmysl', '', 'Noviny pro grafický průmysl přinášejí rozhovor s Ing. Zdeňkem Sládkem na téma současnost a budoucnost trhu.', '', 'novinygp.jpg', '', 'clanky'),
(15, '2012-06-17 00:00:00', 'Typografia 6/2012', '', 'V čísle 6/2012 najdete stručný rozhovor s Ing. Zdeňkem Sládkem na téma propagace tiskáren.', '', '', '', 'clanky'),
(16, '2012-09-19 00:00:00', 'Marketing & komunikace 3/2012', '', 'Na konci měsíce září vychází další číslo časopisu Marketing&komunikace, který pro své členy i širší odbornou veřejnost vydává Česká marketingová společnost. V novém čísle najdete třetí pokračování naší série o grafickém designu. Nejnovější článek má název „Jak rozpoznat dobrý design“. Je dobré si uvědomit, že grafický design nemůže nefungovat, nemůže nepůsobit. Grafický design ale může velice snadno působit odlišně, než bylo zadáním stanoveno.', '', 'mak3-12.jpg', '', 'clanky'),
(17, '2012-10-16 00:00:00', 'Seminář UGD', '', 'V pořadí 26. červnový seminář UGD se pokusil ukázat na klíčové momenty komunikace s klientem. Zdeněk Sládek si pro demonstraci vybral zakázku na vytvoření značky a zaváděcí kampaně Z GRUNTU. Seminář se konal 11. června v HUBu Praha od 19 hodin. Smyslem tohoto prakticky zaměřeného semináře bylo vysvětlit, že „ti lidé z marketingu“ na straně klienta, nejsou žádní nepřátelé. „Těm lidem z marketingu“ musíme my grafičtí designéři vysvětlovat naši práci, objasňovat důvody proč, co a jak děláme. Stejně tak musíme naslouchat jejich potřebám a umět jim nabídnout ještě lepší řešení, než si dovedli představit. Video ze semináře najdete na youtube.com. Tíha zodpovědnosti za komunikace a vysvětlování padá na bedra grafických designérů jakožto dodavatelů. Dejte proto klientovi vědět v pravý čas ty pravé věci. Na úvod mu vysvětlete celý postup.', '', '26ugd.jpg', '', 'clanky'),
(18, '2012-12-20 00:00:00', 'Typografia 12/2012', '', 'V čísle 12/2012 najdete stručný rozhovor s Ing. Zdeňkem Sládkem na téma typografie napříč médii.', '', '', '', 'clanky'),
(19, '2013-04-12 00:00:00', 'Marketing & komunikace 1/2013', '', 'Před několika dny vyšlo nové číslo časopisu Marketing&komunikace, který vydává Česká marketingová společnost. Nový článek nese název „Zadání zakázky grafickému studiu“. Kromě několika tipů pro přípravu podkladů se zabývá otázkou rozdílu mezi zakázkami typu „vytvořte podle pokynů“ a „vymyslete“. Při koupi automobilu, fotoaparátu nebo výrobního celku je evidentní, že je nutné o kupovaném zboží vědět co nejvíce. Znát způsob, jakým věci fungují, jak jsou vyrobeny, jaké mají parametry apod. V případě zadání služeb grafického studia platí to stejné, jen to není na první pohled zřejmé. Vaše maximální míra informovanosti a vlastních zkušeností dovolí vyhnout se případným nedorozuměním.', '', 'mak1-13.jpg', '', 'clanky'),
(20, '2013-09-12 00:00:00', 'Font č. 130', '', 'První grafický časopis Font otiskl článek o našem redesignu tradiční české značky POLDI, který proběhl letos na jaře. Článek a ukázky najdete na straně 19.', '', 'font_poldi.jpg', '', 'clanky'),
(21, '2013-10-03 00:00:00', 'Svět reklamy 2013', '', 'Po roční přestávce se na doprovodném programu veletrhu Svět reklamy, který pořádá společnost Omnis, podílela znovu Unie grafického designu. Na jedné z přednášek vystoupil také Ing. Zdeněk Sládek. Veletrh se konal nejprve 24. 9.2011 v Brně ve Wannieck galerii, která se nachází ve středu města nedaleko obchodního centra Vaňkovka. Tématem přednášky bylo srovnání vlastnosti webů a tiskovin. Svět reklamy se pak i se svým doprovodným programem a touto přednáškou přesunul do Prahy do hotelu Diplomat. Termín byl stanoven na 1. 10. 2011. Weby mají neskutečné množství funkcí, přesto neumí některé banální věci. Web vnímáme totiž jen zrakem, velmi omezeně. Z webu není často vidět ani jedna celá strana. Naproti tomu tiskovinu můžete vnímat prakticky všemi smysly.', '', 'sr2013.jpg', '', 'clanky'),
(22, '2013-10-11 00:00:00', 'Marketing & komunikace 3/2013', '', 'Opět vyšlo nové číslo časopisu Marketing&komunikace, který čtvrtletně vychází u České marketingové společnosti. Nový článek nese jednoduchý název „Logo“. V článku se Zdeněk pokouší rozbourat některé mýty, které tvrdí, že logo musí být vždy takové nebo makové. V poslední době jsem se setkal s několika re-designy starších českých log, které byly svým řemeslným provedením poplatné době svého vzniku v raných devadesátých letech. Měly však v sobě zahrnutého svého génia, měly výrazný charakter. Mnohá tato loga jsou nahrazována novými, která jsou provedena korektně soudobým způsobem. Charakter ale ztrácí.', '', 'mak3-13.jpg', '', 'clanky'),
(23, '2013-10-25 00:00:00', 'Konference Dialog se zákazníkem', '', 'V prostorách ČSVTS v Praze na Novotného lávce proběhla 23. října 2013 konference Dialog se zákazníkem, jejíž součástí byl i diskusní panel odborníků. Ing. Zdeněk Sládek byl jedním z panelistů bloku Jak prodat zákazníkovi více.', '', 'cms-konference2013.jpg', '', 'clanky'),
(24, '2014-01-09 00:00:00', 'Typografia 09/2013', '', 'V čísle 09/2013 najdete stručný rozhovor s Ing. Zdeňkem Sládkem na téma marketing tiskáren.', '', '', '', 'clanky'),
(25, '2014-03-07 00:00:00', 'Typografia 1&ndash;2/2014', '', 'Nachystali jsme náš první odborný článek v tomto časopise. Článek vychází z tématu přednášky na veletrhu Svět reklamy na podzim 2013, zabývá se srovnáním webů a tiskovin. Na rozdíl od tiskoviny nemáte na první pohled ponětí o skutečném rozsahu webu.', '', 'typografia14_1-2.jpg', '', 'clanky'),
(26, '2014-05-16 00:00:00', 'Reklama Polygraf 2014', '', 'Na veletrhu Reklama Polygraf se v poslední den doprovodného programu objevil tajuplný přednášející Sven Ekstrøm. Byl to ale zase Zdeněk Sládek v roli zahraničního designéra. Na přednášce o namingu, tedy o pojmenovávání, by totiž se svým vlastním jménem příliš dojmů neudělal. Že jste tu, je odpověď na otázku, proč je název důležitý.', '', '', '', 'clanky'),
(27, '2014-05-16 00:00:00', 'Marketing & komunikace 1/2014', '', 'Nedávno vyšlo další číslo časopisu Marketing&komunikace, který vydává Česká marketingová společnost, s článkem od Zdeňka. Ten nese název „Než začnete navrhovat logo“. Věnuje se přípravě, volbou jména a shromažďování informací před tvorbou loga. Je vhodné, aby mezi konkrétním provedením celého loga a jeho ideovou podstatou existovala určitá mezera, která poskytne prostor pro divákovu fantazii, zaujme jeho pozornost.', '', 'mak1-14.jpg', '', 'clanky'),
(28, '2014-07-20 00:00:00', 'Typografia 7&ndash;8/2014', '', 'První z plánované řady kratších článků, které budou bourat některé zavadené mýty. První se věnuje známému pořekadlu, že obrázek vydá za tisíc slov. Je třeba si ale zejména uvědomit správnou posloupnost obsaženou v této větě.', '', 'typografia14_7-8.jpg', '', 'clanky'),
(29, '2014-08-27 00:00:00', 'Font č. 135', '', 'V tradičním hodnocení log na dané téma se tentokrát hodnotila loga kuchyňských studií a náš zástupce nedopadl, přes v tomto časopise obvykle drtivě kritické komentáře, vůbec špatně.', '', 'font_roto.jpg', '', 'clanky'),
(30, '2014-09-10 00:00:00', 'Typografia 9&ndash;10/2014', '', 'Druhý článek o bourání mýtů v grafickém designu ukazuje, že uspořádat výběrové řízení není zdaleka taková výhra, jak se na první pohled jeví. V situaci, kdy vybírá mezi slabšími řešeními, ani nemá dostatečné znalosti, aby vybral správně.', '', 'typografia14_9-10.jpg', '', 'clanky'),
(31, '2014-10-07 00:00:00', 'Svět reklamy 2014', '', 'Již potřetí vystupujeme v rámci doprovodného programu veletrhu Svět reklamy, který pořádá společnost Omnis Olomouc. Opět pod odbornou patronací Unie grafického designu. Vytřískejte maximum ze svého grafického designéra, to je název Zdeňkova příspěvku. Přednáška poskytne vodítka pro rozhodování co škrtnout. Veletrh se konal nejprve 28. 9. 2011 v Brně v hotelu Voroněž hned vedle brněnského výstaviště. Pak se i se svým doprovodným programem přesunul do Prahy do hotelu Diplomat.', '', '', 'cM0h1IbiBZ8', 'clanky'),
(32, '2014-11-20 00:00:00', 'Marketing & komunikace 4/2014', '', 'Na světě je nové číslo časopisu, který vydává Česká marketingová společnost, s článkem Navrhujeme logo od Zdeňka. Je to závěrečný díl trojice článků věnované tématu loga. Tentokrát skutečně o tom, jak by takové logo mohlo vypadat. Říká se, že logo má mít nápad. Pohybuji se aktivně v oboru přibližně 15 let a nevím, co to je. Za nápad je obvykle považováno překvapivé řešení. ', '', 'mak4-14.jpg', '', 'clanky'),
(33, '2014-11-26 00:00:00', 'Typografia 11&ndash;12/2014', '', 'Třetí článek o bourání mýtů v grafickém designu ukazuje, že grafický design je součást velkého soukolí. Nikdo ze čtenářů totiž nemá možnost vůbec jen tušit, že šiřitel by byl býval měl v úmyslu sdělovat něco docela odlišného, než hotový tiskový materiál ve skutečnosti sděluje.', '', 'typografia14_11-12.jpg', '', 'clanky'),
(34, '2015-09-22 00:00:00', 'Marketing Mix 2015', '', 'Zdeněk opět přednášel na Marketing Mixu v Praze a v Brně. Tyto přednášky měly na jaře 2016 také reprízy v Ostravě a v Hradci Králové. Dozvěděli jste se, jak poznat, že máte blbé logo. Záznam přednášky pochází z Marketing Mixu 2017 v Brně. Omluvte zhoršenou kvalitu záznamu, přednášku rušil hluk ze sousedního výstavního sálu.', '', '', 'nkqkTM61TBY', 'clanky'),
(35, '2016-09-05 00:00:00', 'Marketing Mix 2016', '', 'Na Marketing Mixu měl Zdeněk další přednášku. Jmenovala se Budování grafické značky pro budování skutečné značky. Představila jak a kde grafickou značku smysluplně prezentovat a jaké k tomu použít nástroje. Navštívit jste ji mohli v Praze a v Brně. Záznam přednášky z Marketing Mixu v Praze je zde.', '', '', 'ltH18GBqx0Q', 'clanky'),
(1, '2008-09-09 21:21:40', 'EWDS', '', 'Na půdě Rakouského kulturního fóra v Praze přednáší Zdeněk referát o zkušenostech s designem mezi malými a středními podniky na mezinárodním workshopu EWDS o podpoře designu.', '', 'ewds_2.jpg', '', 'clanky'),
(36, '2017-09-30 19:12:24', 'Marketing Mix 2017', '', 'Zdeňkova přednáška na Marketing Mixu se Už pomalu stává tradicí. Tentokrát to bylo o prezentacích a o jejich bolestivém vzniku. Uslyšíte tipy, které tři snímky nesmí ve vaší prezentaci chybět a které tři naopak raději vypusťte. Přišlo hodně lidí a ohlasy byly velmi příjemné. Téma jste mohli slyšet jako obvykle v Praze, odkud pochází záznam, i v Brně.', '', '', 'RDDZzPUN_-A', 'clanky');

-- --------------------------------------------------------

--
-- Struktura tabulky `d3_obrazky`
--

CREATE TABLE `d3_obrazky` (
  `id` int(11) NOT NULL,
  `soubor` varchar(256) NOT NULL,
  `titulek` varchar(256) NOT NULL,
  `popisek` text NOT NULL,
  `druh` int(1) NOT NULL,
  `poradi` int(11) NOT NULL,
  `titulka` int(11) NOT NULL,
  `rok` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  `klient` int(11) NOT NULL,
  `poznamka` text NOT NULL,
  `titulek_en` varchar(256) NOT NULL,
  `popisek_en` text NOT NULL,
  `poznamka_en` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `d3_obrazky`
--

INSERT INTO `d3_obrazky` (`id`, `soubor`, `titulek`, `popisek`, `druh`, `poradi`, `titulka`, `rok`, `url`, `klient`, `poznamka`, `titulek_en`, `popisek_en`, `poznamka_en`) VALUES
(142, '/extremeclean/extreme_clean_vizitka', 'vizitka', 'Vizitka doplňuje leták', 3, 2, 1, 2008, '', 41, '', 'business card', 'Business card complements the leaflet', ''),
(141, '/extremeclean/extreme_clean_logo', 'logo', 'Extrémní typografie pro extrémní čištění', 1, 1, 1, 2008, '', 41, '', 'logo', 'Extreme typography for extreme cleaning', ''),
(139, '/strojpoldi/strojpoldi_web', 'web', 'Webové stránky s flashovou animací', 2, 2, 1, 2010, 'www.strojpoldi.cz', 40, '', 'website', 'Website with flash animations', ''),
(140, '/extremeclean/extreme_clean_letak', 'leták', 'Propagační materiál o extra účinném čištění suchou párou', 3, 2, 1, 2008, '', 41, '', 'leaflet', 'Promotional material about extra effective dry steam cleaning', ''),
(150, '/vysehrad/vysehrad_logo', 'logo', 'Logo cateringové společnosti', 1, 1, 1, 2009, '', 44, '', 'logo', 'Catering company logo', ''),
(151, '/zgruntu/zgruntu_a4', 'inzerát', 'Ukázka inzerce ze zaváděcí kampaně', 3, 2, 1, 2011, '', 45, '', 'advertisement', 'Showcase of the launch campaign\'s ads', ''),
(149, '/vysehrad/vyseherad_manual', 'logomanuál', 'Základní logomanuál k logu Vyšehrad 2000', 3, 2, 1, 2009, '', 44, '', 'logo manual', 'Basic logo manual for the Vyšehrad 2000 logo', ''),
(148, '/vestav/vestav_web', 'web', 'Webové stránky s podrobnými tabulkami vlastností materiálů uvnitř', 2, 1, 1, 2010, '', 43, '', 'website', 'Website with large spreadsheets of materials', ''),
(147, '/vestav/vestav_vizitky', 'vizitka', 'Vizitka jako součást zamýšleného vizuálního stylu', 3, 2, 1, 2011, '', 43, 'nerealizováno', 'business card', 'Business card as a part of the intended visual style', 'not implemented'),
(146, '/vestav/vestav_dl_navysku', 'novoročenka', 'Novoročenka s vánočním stromkem z ocelových profilů a plastových trubek', 3, 3, 1, 2009, '', 43, '', 'new year\'s eve greeting', 'New Year\'s greeting card with a Christmas tree made from steel and plastic pipes', ''),
(143, '/univers/univers_a4_3', 'inzerát', 'Jeden z několika inzerátů kampaně', 3, 2, 1, 2010, '', 42, '', 'advertisement', 'One of several campaign ads', ''),
(144, '/univers/univers_a5_nasirku', 'leták', 'Leták jako poukaz na slevu', 3, 2, 1, 2009, '', 42, '', 'leaflet', 'Flyer as a discount voucher', ''),
(145, '/univers/univers_prezent', 'pdf prezentace', 'Elektronická prezentace pro rozesílání', 3, 3, 1, 2010, '', 42, '', 'pdf presentation', 'Electronic presentation intended for distribution in PDF', ''),
(349, '/stablo/rollup', 'roll-up', 'Vizuální styl využívá také geometrické obrázky betonových bloků', 5, 1, 1, 2016, '', 75, '', 'banner', 'The identity contains also geometrical icons of concrete blocks', ''),
(152, '/zgruntu/zgruntu_leporelo', 'leporelo', 'Malé leporelo, které slouží také jako drobný katalog výrobků', 3, 2, 0, 2011, '', 45, '', 'folding picture-book', 'Small folding picture-book which also serves as a small product catalog', ''),
(153, '/zgruntu/zgruntu_logo', 'logo', 'Značka, která zdůrazňuje tradiční původ výrobků', 1, 1, 1, 2011, '', 45, '', 'logo', 'A brand that emphasizes the traditional origin of the goods', ''),
(154, '/zgruntu/zgruntu_stojan', 'POS poutač', 'Vytvořili jsme 2 m vysoký kartonový poutač', 5, 3, 1, 2011, '', 45, '', 'POS eye-catcher', 'We\'ve created a 2 m tall cardboard banner', ''),
(155, '/zdm/zdm_logo', 'logo', 'Redesign, který si z původního loga vypůjčil pruhy', 1, 1, 1, 2008, '', 46, '', 'logo', 'A redesign which borrows stripes from the original logo', ''),
(156, '/zdm/zdm_manual', 'logomanuál', 'Základní logomanuál k logu zdm', 3, 2, 1, 2008, '', 46, '', 'logo manual', 'Basic logo manual for the ZDM logo', ''),
(351, '/pcohorsky/vizitka', 'vizitka', 'Styl využívá výraznou červenou barvu', 3, 1, 1, 2014, '', 74, '', 'business card', 'Identity uses strong red color', ''),
(209, '/sayaction/sayaction_inzerce_a5', 'inzerát', 'Inzerát do svatebních periodik', 3, 2, 1, 2012, '', 59, '', 'advertisement', 'Advert for the wedding magazines', ''),
(207, '/lucyclay/lucyclay_tools_logo', 'logo', 'Logo produktové řady nástrojů na zpracování modelovací hmoty', 1, 7, 0, 2013, '', 58, '', 'logo', 'Logo of the derived product line', ''),
(157, '/zdm/zdm_vizitky', 'vizitka', 'Vizitka jako součást vizuálního stylu', 3, 2, 1, 2008, '', 46, '', 'business card', 'Business card as a part of the visual style', ''),
(324, '/arcadehry/arcadehry_web_2011', 'historický web', 'Původní web s programem', 2, 1, 1, 2011, '', 18, ' ', 'old website', 'Website with schedule', ''),
(161, '/zona/zona_logo', 'logo', 'Logo, které se dostalo na stránky výběrové publikace logo', 1, 1, 1, 2007, '', 47, 'oceněno', 'logo', 'Logo that became a part of the selection of the LOGO publication', 'awarded'),
(162, '/zoo/zoo_a4', 'dopisní papír', 'Soutěžní návrh dopisního papíru zoo praha', 3, 2, 1, 2009, '', 48, 'nerealizováno', 'notepaper', 'Competition design of a notepaper for ZOO Prague', 'not implemented'),
(163, '/zoo/zoo_dl', 'obálka', 'Návrh obálky do soutěže vyhlášené ZOO Praha', 3, 2, 1, 2011, '', 48, 'nerealizováno', 'envelope', 'Cover design for the contest announced by the ZOO Prague', 'not implemented'),
(164, '/zoo/zoo_logo', 'logo', 'Návrh loga do soutěže vyhlášené ZOO Praha publikovaný na serveru designportal.cz', 1, 1, 1, 2011, '', 48, 'nerealizováno', 'logo', 'Logo design for a contest announced by the ZOO Prague and published at designportal.cz', 'not implemented'),
(165, '/zoo/zoo_vizitky', 'vizitka', 'Návrh vizitky do soutěže vyhlášené ZOO Praha', 3, 2, 1, 2011, '', 48, 'nerealizováno', 'business card', 'Design of a business card for a competition announced by the ZOO Prague', 'not implemented'),
(166, '/pts/pts_brozura', 'brožura', 'Přehled nabídky služeb', 3, 2, 1, 2011, '', 49, '', 'brochure', 'Overview of services', ''),
(167, '/pts/pts_cardesign', 'cardesign', 'Celopolep kabiny vozidla Avia s kontejnerem', 5, 2, 1, 2011, '', 49, '', 'cardesign', 'Car design of the Avia vehicle with a container', ''),
(168, '/pts/pts_logo', 'logo', 'Pozitivně laděné logo technických služeb', 1, 1, 1, 2011, '', 49, '', 'logo', 'Brand new logo of the PTS company', ''),
(169, '/pts/pts_vizitky', 'vizitka', 'Vizuální styl je založen na kombinaci zelené a bílé barvy', 3, 2, 0, 2011, '', 49, '', 'business card', 'The visual style is based on a combination of green and white colors', ''),
(170, '/pts/pts_web', 'web', 'Jednoduchý a čistý web s ilustracemi', 2, 2, 1, 2011, 'www.ptspraha.cz', 49, '', 'website', 'Simple and clean website with illustrations', ''),
(171, '/rocket/obaly_rocket', 'ALU plechovka', 'Plechovka 0,2 l', 4, 1, 1, 2010, '', 50, '', 'ALU canister', '0.2 liter can', ''),
(172, '/kompek/kompek_a5', 'série letáků', 'Ukázka z ucelené řady produktových letáků', 3, 2, 1, 2010, '', 51, '', 'a series of leaflets', 'A showcase of a comprehensive range of product flyers', ''),
(173, '/kompek/kompek_budaky', 'etikety', 'Ukázka etikety na buďáky', 4, 1, 1, 2012, '', 51, '', 'a set of labels', 'A sample of a label for Buďák', ''),
(174, '/kompek/kompek_pf', 'novoročenka', 'PF 2011', 3, 2, 1, 2010, '', 51, '', 'new year\'s eve greeting', '2011\'s New Years Eve greeting card', ''),
(175, '/ppas/manual_usb_karta', 'korporátní grafický manuál', 'Nový manuál korporátní komunikace na usb', 5, 1, 1, 2011, '', 52, '', 'corporate design manual', 'No more printed manuals, no more CD\'s – new manual of corporate communications on USB', ''),
(176, '/ppas/primus_a3', 'POS materiály', 'Vytvořili jsme POS materiály pro zavedení 1,5l pet značek primus a klasik', 3, 2, 1, 2009, '', 52, '', 'pos materials', 'We\'ve created POS materials for the introduction of the Primus and Klasik brands in a 1.5 PET packaging', ''),
(177, '/ppas/pu_nafukovadlo', 'nafukovadlo', 'Podklady pro výrobu foto realistických nafukovadel pro více značek', 5, 3, 1, 2010, '', 52, 'nerealizováno', 'inflatable', 'We\'ve created the basis for the production of photo realistic inflatables for several brands', 'not implemented'),
(178, '/ppas/textil_kozel', 'reklamní textil', 'Předlohy pro výrobu textilní kolekce značky velkopopovický kozel', 5, 4, 1, 2009, '', 52, '', 'promotional textile', 'We\'ve prepared a template for producing textile collection by Velkopopovický Kozel', ''),
(179, '/nevecom/nevecom_a4', 'inzerát', 'Inzerce v místním tisku', 3, 4, 1, 2005, '', 53, '', 'advertisement', 'In the local press', ''),
(180, '/nevecom/nevecom_autoatlas', 'autoatlas', 'Obálka autoatlasu', 3, 3, 1, 2005, '', 53, '', 'road atlas', 'Road atlas cover', ''),
(181, '/nevecom/nevecom_bill', 'billboard', 'Kampaň založena na rodinném charakteru vozů škoda', 5, 2, 1, 2005, '', 53, '', 'billboard', 'Campaign was based on the family nature of the Skoda cars', ''),
(182, '/nevecom/nevecom_logo', 'logo', 'Redesign tradičního loga nevecom používaný v naší kampani', 1, 1, 1, 2005, '', 53, '', 'logo', 'Redesign of the traditional Nevecom logo used in our campaign', ''),
(183, '/nevecom/nevecom_vstup', 'orientační systém', 'Tabule s uvítáním a přehledem služeb', 5, 5, 0, 2005, '', 53, '', 'sign', 'A board with a welcome and overview of services', ''),
(184, '/omnis/omnis1_a3', 'plakát', 'Plakát pro veletrh se zahradní tématikou', 3, 1, 1, 2011, '', 54, '', 'poster', 'Poster for the fair with a garden theme', ''),
(185, '/omnis/omnis_a3', 'plakát', 'Plakáty pro sérii městských veletrhů', 3, 2, 1, 2010, '', 54, '', 'poster', 'Posters for the series of urban fairs', ''),
(186, '/strizna/strizna1', 'titulek obrazovky', 'Grafika na úvod hokejového zápasu', 5, 1, 1, 2012, '', 55, '', 'screen title', 'Graphics for the hockey game intro', ''),
(187, '/strizna/strizna2', 'titulek obrazovky', 'Tabulka s nadcházejícími přenosy', 5, 2, 1, 2012, '', 55, '', 'screen title', 'Table with upcoming live broadcasts', ''),
(188, '/strizna/strizna3', 'titulek obrazovky', 'Časomíra s průbežným výsledkem', 5, 3, 1, 2012, '', 55, '', 'screen title', 'Timekeeper with an intermediate result', ''),
(346, '/naven/naven_plakat', 'plakát', 'Plakát CLV z podzimní kampaně', 5, 1, 1, 2009, '', 28, '', 'poster', 'CLV from campaign', ''),
(191, '/app/app_cedulka', 'dveřní štítek', 'Jedna z cedulek', 5, 3, 1, 2008, '', 56, '', 'doorplate', 'One of the sings', ''),
(192, '/app/app_logo', 'logo', 'Žluto-černé logo společnosti APP', 1, 1, 1, 2008, '', 56, '', 'logo', 'APP logo in yellow and black', ''),
(193, '/app/app_vizitka', 'vizitka', 'S tvarovým výsekem', 3, 2, 1, 2008, '', 56, '', 'business card', 'With a shaped cut-out', ''),
(194, '/barton/barton_cardesign', 'cardesign', 'Dacia Logan jako zásahové vozidlo', 5, 4, 1, 2013, '', 57, '', 'cardesign', 'Dacia Logan as an emergency vehicle', ''),
(195, '/barton/barton_letak', 'leták', 'Leták s nabídkou služeb', 3, 2, 1, 2012, '', 57, '', 'leaflet', 'Leaflet with services offering', ''),
(196, '/barton/barton_logo', 'logo', 'Logo kombinuje papírovou malířskou čepici a hasičskou helmu, protože vymalovat přijede zásahovka pekelně rychle', 1, 1, 1, 2012, '', 57, '', 'logo', 'Logo combines the paper painting hat and a fire helmet, because the emergency car will come to paint fast as a lightning', ''),
(197, '/barton/barton_vizitka', 'vizitka', 'Jednoduchá vizitka', 3, 3, 0, 2012, '', 57, '', 'business card', 'Simple business card', ''),
(198, '/barton/barton_web', 'web', 'Stránky mají tři sekce podle druhů služeb bartoňovy zásahovky', 2, 5, 1, 2012, '', 57, '', 'website', 'Website has three sections according to the types of services of the Bartoň company', ''),
(199, '/lucyclay/lucyclay_a3', 'plakát', 'Ukázka plakátů k workshopům, které pořádá lucy clay', 3, 6, 1, 2012, '', 58, '', 'poster', 'Lucy Clay also organizes workshops and seminars which need to have posters', ''),
(200, '/lucyclay/lucyclay_krab24', 'krabička', 'Obal modelovací hmoty, barva č. 24', 4, 3, 0, 2012, '', 58, '', 'packaging', 'color no. 24', ''),
(201, '/lucyclay/lucyclay_krab30', 'krabička', 'Obal modelovací hmoty, barva č. 30', 4, 3, 0, 2012, '', 58, '', 'packaging', 'color no. 30', ''),
(202, '/lucyclay/lucyclay_krab48', 'krabička', 'Obal modelovací hmoty, barva č. 48', 4, 3, 0, 2012, '', 58, '', 'packaging', 'color no. 48', ''),
(203, '/lucyclay/lucyclay_logo', 'logo', 'Typografické logo s novým slitkem LC', 1, 1, 1, 2012, '', 58, '', 'logo', 'Typographic logo with a new LC brand', ''),
(204, '/lucyclay/lucyclay_obaly', 'krabičky', 'Existuje mnoho barevných odstínů polymerové hmoty Lucy Clay', 4, 2, 1, 2012, '', 58, '', 'packaging', 'There are many shades of the Lucy Clay polymer materials', ''),
(205, '/lucyclay/lucyclay_vizitky', 'vizitka', 'Stylová vizitka LC', 3, 5, 0, 2012, '', 58, '', 'business card', 'Stylish LC business card', ''),
(206, '/lucyclay/lucyclay_poutac', 'roll-up', 'Poutač na výstavu kreativních řemesel', 5, 4, 1, 2013, '', 58, '', 'banner', 'Banner for the exhibition of creative crafts', ''),
(213, '/sayaction/sayaction_web', 'web', 'Imageová prezentace eventové agentury', 2, 4, 1, 2012, '', 59, '', 'website', 'Web presentation of the event agency', ''),
(210, '/sayaction/sayaction_logo', 'logo', 'Sayaction je výkřik, když vše začíná', 1, 1, 1, 2012, '', 59, '', 'logo', 'SayAction is a shout when everything starts', ''),
(211, '/sayaction/sayaction_poutac', 'roll-up', 'Poutač v podobě roll-upu', 5, 3, 1, 2012, '', 59, '', 'banner', 'Banner in the form of a roll-up', ''),
(212, '/sayaction/sayaction_vizitky', 'vizitka', 'Vizitka majitelky agentury', 3, 2, 0, 2012, '', 59, '', 'business card', 'Business card for the agency owner', ''),
(290, '/sommeravnuk/sav_vanicka_liska', 'obal', 'Řada rukávů na mražené houby', 4, 0, 0, 2015, '', 38, '', 'packaging', 'A range of frozen mushroom labels', ''),
(289, '/sommeravnuk/sav_sumavska_smes', 'etiketa', 'Řada etiket na mražené houby', 4, 0, 0, 2016, '', 38, '', 'label', 'A range of frozen mushroom labels', ''),
(214, '/avtank/av_tank_logo', 'logo', 'Důkladný redesign původního loga', 1, 1, 1, 2013, '', 60, '', 'logo', 'Thorough redesign of the original logo', ''),
(215, '/avtank/av_tank_vizitka', 'vizitka', 'Základ vizuálního stylu s charakteristickou texturou pozadí', 3, 2, 1, 2013, '', 60, '', 'business card', 'Basis of a visual style with a distinctive texture in the background', ''),
(216, '/poldi/poldi_brozura_a4', 'brožura', 'Výrobní program', 3, 2, 1, 2013, '', 61, '', 'brochure', 'Manufacturing program', ''),
(217, '/poldi/poldi_brozura_a4_1', 'brožura', 'Úvodní dvojstrana', 3, 3, 0, 2013, '', 61, '', 'brochure', 'Introductory centerfold', ''),
(218, '/poldi/poldi_brozura_a4_2', 'brožura', 'Tabulková část', 3, 3, 0, 2013, '', 61, '', 'brochure', 'Product data', ''),
(219, '/poldi/poldi_cedulka', 'orientační systém', 'Interiérový orientační systém', 5, 7, 1, 2013, '', 61, '', 'guidance system', 'Interior orientation system', ''),
(220, '/poldi/poldi_hutte_logo', 'logo', 'Tradiční logo v našem redesignu', 1, 1, 1, 2013, '', 61, '', 'logo', 'Traditional logo in our redesign', ''),
(221, '/poldi/poldi_vizitka', 'vizitka', 'Nový korporátní styl s důrazem na tradiční logo', 3, 6, 1, 2013, '', 61, '', 'business card', 'New corporate style with an emphasis on the traditional logo', ''),
(222, '/treekey/treekey_logo', 'logo', 'Logo je klíč k zahradám', 1, 1, 1, 2013, '', 62, '', 'logo', 'Treekey is a tree and key', ''),
(223, '/treekey/treekey_vizitka_1', 'vizitka', 'Skládačková vizitka', 3, 2, 1, 2013, '', 62, '', 'business card', 'folding business card', ''),
(224, '/treekey/treekey_vizitka_2', 'vizitka', 'Rozložená vizitka s kontakty', 3, 3, 0, 2013, '', 62, '', 'business card', 'distributed business card contacts', ''),
(225, '/fer/fer_logo', 'logo', 'Vědecké logo se strukturou oceli', 1, 1, 1, 2013, '', 63, '', 'logo', 'Scientific logo with a structure of steel', ''),
(226, '/fer/fer_vizitka', 'vizitka', 'Ukázka minimalistického vizuálního stylu', 3, 3, 1, 2013, '', 63, '', 'business card', 'Simple visual style', ''),
(227, '/fer/fer_vp', 'výrobní program', 'Přehled služeb a sortimentu', 3, 2, 1, 2013, '', 63, '', 'production program', 'Overview of services and product range', ''),
(228, '/amond/amond_desky', 'desky na dokumenty', 'Zdůrazňují pozitivní přístup ke klientům', 3, 1, 1, 2012, '', 64, '', 'folder', 'Emphasize on a positive approach to clients', ''),
(229, '/comet/comet_intuigui', 'logo', 'Logo klíčové vlastnosti, která má tři pilíře', 1, 3, 0, 2013, '', 65, '', 'logo', 'The key attribute has three pillars', ''),
(230, '/comet/comet_krabice', 'obal', 'Propagační obal produktu', 4, 2, 1, 2013, '', 65, '', 'packaging', 'Promotional product packaging', ''),
(231, '/comet/comet_logo', 'logo', 'Logo třetí verze systému comet', 1, 1, 1, 2013, '', 65, '', 'logo', 'Logo of the third version of Comet', ''),
(232, '/comet/comet_web1', 'web', 'Singlepage prezentace', 2, 5, 1, 2013, '', 65, '', 'website', 'Singlepage presentation', ''),
(323, '/pcohorsky/web', 'web', 'Jednoduchý web bezpečnostní agentury', 2, 1, 1, 2014, '', 74, '', 'website', 'Simple website', ''),
(234, '/treekey/treekey_kryci_list', 'krycí list nabídek', 'Titulní strana sjednocující všechny vydané nabídky', 3, 4, 1, 2013, '', 62, '', 'cover sheet', 'Title page unifying all issued deals', ''),
(235, '/fer/fer_vp2', 'výrobní program', 'Druhá strana výrobního programu s rozsáhlou tabulkou', 3, 2, 0, 2013, '', 63, '', 'production program', 'The other side of the production program with an extensive table', ''),
(236, '/fer/fer_web', 'web', 'Webové stránky s interaktivním katalogem ocelí a poptávkovým systémem', 2, 4, 1, 2013, '', 63, '', 'website', 'A website with an interactive catalog of steel and inquiry system', ''),
(237, '/mediaticus/mediaticus_logo', 'logo', 'Figura mediatica a levitující zářivá koule představující křehkou dohodu', 1, 1, 1, 2013, '', 27, '', 'logo', 'Figura Mediatica and levitating glowing sphere representing the fragile agreement', ''),
(238, '/mediaticus/mediaticus_a4', 'leták', 'Obsahuje základní vlastnosti mediace', 3, 2, 1, 2013, '', 27, '', 'leaflet', 'It contains the basic properties of mediation', ''),
(239, '/mediaticus/mediaticus_vizitky', 'vizitka', 'Součást půleného grafického stylu', 3, 3, 1, 2013, '', 27, '', 'business card', 'A part of a graphic style', ''),
(240, '/mediaticus/mediaticus_a4_1', 'leták', 'Zadní strana letáku', 3, 2, 0, 2013, '', 27, '', 'leaflet', 'The back side of the leaflet', ''),
(241, '/comet/comet_skladacka', 'leták', 'Přehled funkcí v tištěné podobě', 3, 4, 1, 2013, '', 65, '', 'leaflet', 'Overview of features in printed form', ''),
(242, '/lebak/lebak_car', 'cardesign', 'Polep Peugeotu Partner', 5, 3, 1, 2014, '', 26, '', 'cardesign', 'Ads on Peugeot Partner', ''),
(244, '/akhv/akhv_logo', 'logo', 'Logo má hned dvě plus', 1, 0, 0, 2016, '', 66, '', 'logo', 'The logo has two plus', ''),
(245, '/akhv/akhv_roll-up', 'roll-up', 'Poutač na akce nebo do firemní lobby', 5, 0, 0, 2016, '', 66, '', 'banner', 'A banner for event or into a corporate lobby', ''),
(246, '/akhv/akhv_vizitka', 'vizitka', 'Vizitka pro jednoho z advokátů', 3, 0, 0, 2016, '', 66, '', 'business card', 'A business card for one of the attorneys', ''),
(247, '/akhv/akhv_web', 'web', 'Web s efektním posunem panelů', 2, 0, 0, 2016, 'www.heyduk.eu', 66, '', 'website', 'A web with a distinct scrolling function', ''),
(248, '/care2grow/care2grow_brozura', 'brožura', 'Představení společnosti a jejího zaměření', 3, 0, 0, 2016, '', 69, '', 'brochure', 'Introducing the company and its focus', ''),
(249, '/care2grow/care2grow_logo', 'logo', 'Logo, které má stoupající křivku', 1, 0, 0, 2016, '', 69, '', 'logo', 'A logo that has a rising curve', ''),
(250, '/care2grow/care2grow_ppt', 'prezentace', 'Elektronická prezentace společnosti', 5, 0, 0, 2016, '', 69, '', 'presentation', 'Electronic presentation of the company', ''),
(251, '/care2grow/care2grow_roll-up', 'roll-up', 'Poutač na akce nebo do firemní lobby', 5, 0, 0, 2016, '', 69, '', 'banner', 'A banner for event or into a corporate lobby', ''),
(252, '/care2grow/care2grow_vizitka', 'vizitka', 'Součástí vizuálního stylu je i vizitka', 3, 0, 0, 2016, '', 69, '', 'business card', 'Part of the visual style is also a business card', ''),
(253, '/care2grow/care2grow_web', 'web', 'Web musí ve vteřině říci to skutečně důležité', 2, 0, 0, 2016, 'www.care2grow.cz', 69, '', 'website', 'The web must say the really important things in a second', ''),
(254, '/destro/destro_a4_vizual_2016', 'leták', 'Materiál nemusí být krásný, aby stvořil něco výjimečného', 3, 0, 0, 2016, '', 7, '', 'leaflet', 'Material doesn\'t need not be beautiful to create something extraordinary', ''),
(255, '/destro/destro_katalog_2017-1', 'katalog', 'Kompletní přehled o službách a materiálech', 3, 0, 0, 2017, '', 7, '', 'catalog', 'A complete overview of services and materials', ''),
(256, '/destro/destro_katalog_2017-2', 'katalog', 'Kompletní přehled o službách a materiálech', 3, 0, 0, 2017, '', 7, '', 'catalog', 'A complete overview of services and materials', ''),
(257, '/destro/destro_logo_4', 'logo', 'Poslední redesign loga', 1, 0, 0, 2016, '', 7, '', 'logo', 'The last redesign of the logo', ''),
(258, '/destro/destro_roll-up', 'roll-up', 'Řada poutačů, které se na sebe graficky vždy napojí', 5, 0, 0, 2016, '', 7, '', 'banner', 'Series of banners that are always graphically connected', ''),
(259, '/destro/destro_vizitka_2017', 'vizitka', 'Výrazná vizitka pro výraznou firmu', 3, 0, 0, 2017, '', 7, '', 'business card', 'A distinctive business card for a distinctive company', ''),
(260, '/destro/web_2017', 'web', 'Nový web s přehledným výběrem materiálů a služeb', 2, 0, 0, 2017, '', 7, '', 'website', 'A new website with a clear selection of materials and services', ''),
(261, '/drevosrot/drevosrot_katalog', 'katalog', 'Katalog se službami a schématem celého výrobního procesu', 3, 0, 0, 2016, '', 71, '', 'catalog', 'Catalog with services and diagram of the whole production process', ''),
(262, '/drevosrot/drevosrot_logo', 'logo', 'Přívětivé logo přívětivé firmě', 1, 0, 0, 2016, '', 71, '', 'logo', 'Friendly logo for a friendly company', ''),
(263, '/drevosrot/drevosrot_vizitka', 'vizitka', 'Ilustrace dřeva ve spojení s plamínky je základem vizuálního stylu', 3, 0, 0, 2016, '', 71, '', 'business card', 'The illustration of wood in conjunction with flames is the basis of visual style', ''),
(264, '/drevosrot/drevosrot_web', 'web', 'Web s praktickou poradnou pro návštěvníky', 2, 0, 0, 2016, 'www.drevosrot.cz', 71, '', 'website', 'Site with a practical Q&A section', ''),
(265, '/kkzpp/KKZPP_logo', 'logo', 'Honosný a majestátní redesign loga', 1, 0, 0, 2016, '', 72, '', 'logo', 'Redesign of the key customer club logo', ''),
(266, '/kkzpp/KKZPP_manual', 'logomanuál', 'Manuál pro práci s logem a dalšími grafickými prvky', 3, 0, 0, 2016, '', 72, '', 'logo manual', 'A manual how to work with the logo and other graphic elements', ''),
(267, '/kkzpp/KKZPP_obleceni', 'reklamní textil', 'Součástí identity je i design oblečení', 5, 0, 0, 2016, '', 72, '', 'promotional textile', 'Part of the identity is clothing design', ''),
(268, '/kkzpp/KKZPP_plakat', 'plakát', 'Plakát na akci s programem pro návštěvníky', 3, 0, 0, 2016, '', 72, '', 'poster', 'Poster for an event with a program for visitors', ''),
(269, '/kkzpp/KKZPP_pozvanka', 'pozvánka', 'Pozvánka k zaslání poštou', 3, 0, 0, 2016, '', 72, '', 'invitation card', 'Invitation to be sent in a mail', ''),
(270, '/kkzpp/KKZPP_roll-up', 'roll-up', 'Poutač umisťovaný na akcích', 5, 0, 0, 2016, '', 72, '', 'banner', 'Banner for an event', ''),
(271, '/kovona/kovona_katalog', 'katalog', 'Katalog kovového nábytku', 3, 0, 0, 2015, '', 70, '', 'catalog', 'Catalog of metal furniture', ''),
(272, '/kovona/kovona_logo', 'logo', 'Redesign loga v tradiční modré', 1, 0, 0, 2015, '', 70, '', 'logo', 'Redesigned logo in traditional blue', ''),
(273, '/kovona/kovona_manual', 'logomanuál', 'Manuál pro práci s logem a dalšími grafickými prvky', 3, 0, 0, 2015, '', 70, '', 'logo manual', 'A manual how to work with the logo and other graphic elements', ''),
(274, '/kovona/kovona_web', 'web', 'E-shop s kovovým nábytkem v pěti jazycích', 2, 0, 0, 2014, '', 70, '', 'website', 'E-shop with metal furniture in five languages', ''),
(275, '/ppas/ppas_pivni-styly', 'brožura', 'Dvoulist pivních stylů s vylamovacími okénky jako vánoční kalendář', 3, 0, 0, 2017, '', 52, '', 'brochure', 'A folded A4 about beer styles with breakout windows like a Christmas calendar', ''),
(276, '/ppas/ppas_pp', 'prezentace', 'Aplikace pro prezentování produktů majitelům hospod', 5, 0, 0, 2016, '', 52, '', 'presentation', 'An app for presenting products to pub owners', ''),
(350, '/stablo/cenik', 'ceník', 'Ceník s ikonami bloků', 3, 1, 1, 2016, '', 75, '', 'price list', 'We have included icons of blocks also in price list', ''),
(278, '/ppas/ppas_prazdroj-menu', 'šablona webů', 'Každá hospoda či restaurace vytvoří rychle svou prezentaci včetně menu', 2, 0, 0, 2016, '', 52, '', 'website template', 'Every pub or restaurant can quickly create a presentation including a menu', ''),
(279, '/sommeravnuk/sav_brusinky_sklo', 'etikety', 'Obaly pro další lesní plody', 4, 0, 0, 2016, '', 38, '', 'a set of labels', 'The company also works with other forest fruits', ''),
(281, '/sommeravnuk/sav_hrib_smrkovy', 'etiketa', 'Řada etiket na mražené houby', 4, 0, 0, 2016, '', 38, '', 'label', 'A range of frozen mushroom labels', ''),
(284, '/sommeravnuk/sav_chaluparska_smes', 'etiketa', 'Řada etiket na mražené houby', 4, 0, 0, 2016, '', 38, '', 'label', 'A range of frozen mushroom labels', ''),
(286, '/sommeravnuk/sav_liska_velka_krajena', 'etiketa', 'Řada etiket na mražené houby', 4, 0, 0, 2016, '', 38, '', 'label', 'A range of frozen mushroom labels', ''),
(138, '/strojpoldi/strojpoldi_wc', 'orientační systém', 'Kostka nad toaletami', 5, 5, 0, 2008, '', 40, '', 'guidance system', 'Cube over toilets', ''),
(137, '/strojpoldi/strojpoldi_poutace', 'roll-up', 'Roll-up s klikovou hřídelí', 5, 3, 1, 2011, '', 40, '', 'banner', 'Roll-up with the crankshaft', ''),
(135, '/strojpoldi/strojpoldi_dvere', 'dveřní štítek', 'Dveřní cedulka', 5, 4, 1, 2008, '', 40, '', 'doorplate', 'Door sign', ''),
(136, '/strojpoldi/strojpoldi_logo', 'logo', 'Redesign tradičního loga', 1, 1, 1, 2006, '', 40, '', 'logo', 'Redesign of the traditional logo', ''),
(348, '/stablo/vizitka', 'vizitka', 'Ukázka geometrického vizuálního stylu', 3, 1, 1, 2016, '', 75, '', 'business card', 'An example of geometrical identity', ''),
(133, '/strabag/strabag_pf', 'novoročenka', 'Silnice jako vánoční dárek', 3, 1, 1, 2010, '', 39, '', 'new year\'s eve greeting', 'Road as a Christmas gift', ''),
(132, '/sommeravnuk/sav_web', 'web', 'Webové stránky s objednávkovým systémem a flashovou animací', 2, 2, 1, 2006, 'www.sommeravnuk.cz', 38, '', 'website', 'Website with the ordering system and a flash animations', ''),
(131, '/sommeravnuk/sav_vizitky', 'vizitka', 'Vizitka s řezem houby', 3, 2, 1, 2011, '', 38, '', 'business card', 'Business card with a cut mushroom', ''),
(130, '/sommeravnuk/sav_obaly', 'etikety', 'Vytvořili jsme také tyto 3D vizualizace na nové dózy s houbami', 4, 2, 1, 2011, '', 38, '', 'a set of labels', 'We\'ve created these 3D visualizations of the new mushroom jars', ''),
(129, '/sommeravnuk/sav_logo', 'logo', 'Elegantní logo s malým vtipem', 1, 1, 1, 2011, '', 38, '', 'logo', 'Elegant logo with a funny detail', ''),
(128, '/sbs/stanek_sbs', 'stánek', 'Prvky výstavního stánku', 5, 5, 0, 2008, '', 37, '', 'stand', 'Elements of the exhibition stand', ''),
(127, '/sbs/sbs_web', 'web', 'Inovovaná prezentace se zjednodušeným a zpřehledněným obsahem', 2, 3, 1, 2012, 'www.sbs-security.eu', 37, '', 'website', 'Innovated presentation with simplified and well-arranged content', ''),
(126, '/sbs/sbs_vizitky', 'vizitka', 'Vizuální styl je založen na šedých pruzích', 3, 4, 1, 2011, '', 37, '', 'business card', 'Visual style is based on gray stripes', ''),
(124, '/sbs/sbs_cedulka', 'tabulka', 'Tabulka s výstrahou', 5, 5, 0, 2008, '', 37, '', 'table', 'Chart with an alert', ''),
(125, '/sbs/sbs_logo', 'logo', 'Výrazný redesign původního firemního erbu', 1, 1, 1, 2006, '', 37, '', 'logo', 'Significant redesign of the company\'s original coat of arms', ''),
(123, '/sbs/sbs_a5_1', 'profil společnosti', 'Leták s prezentací služeb a velkým schématem', 3, 2, 1, 2012, '', 37, '', 'company profile', 'Leaflet with a presentation of services and a big diagram', ''),
(122, '/sbs/sbs_a5', 'profil společnosti', 'Otevřená brožura', 3, 2, 0, 2008, '', 37, '', 'company profile', 'Opened brochure', ''),
(121, '/sbs/samolepka_sbs', 'samolepka', 'Na označení chráněného objektu', 5, 5, 0, 2008, '', 37, '', 'sticker', 'To label the protected object', ''),
(120, '/ryor/obal_ryor2', 'obaly', 'Dva obaly ze zamýšlené řady kosmetiky', 4, 2, 1, 2011, '', 36, 'nerealizováno', 'packaging', 'Two packages of the intended line of cosmetics', 'not implemented'),
(119, '/ryor/obal_ryor1', 'krabička', 'Všimněte si zejména horní strany krabičky', 4, 2, 1, 2011, '', 36, 'nerealizováno', 'packaging', 'Especially note the upper side of the box', 'not implemented'),
(118, '/roto/roto_web', 'web', 'Zlaté stránky na webu nejsou jen ty s telefonním seznamem', 2, 2, 1, 2010, '', 35, '', 'website', 'Yellow Pages on the web are not just the ones with the phonebook', ''),
(117, '/roto/roto_logo', 'logo', 'Roto znamená Robert a Tomáš, v logu je vidět rotace', 1, 1, 1, 2010, '', 35, '', 'logo', 'ROTO is Robert and Tomáš', ''),
(116, '/roto/roto_inzerce', 'inzerát', 'Inzerce v lokálním tisku', 3, 2, 1, 2010, '', 35, '', 'advertisement', 'Advertising in local press', ''),
(115, '/roto/roto_desky', 'desky na dokumenty', 'Desky s chlopněmi tištěné zlatou barvou doplněnou o parciální lesklý lak', 3, 2, 1, 2010, '', 35, '', 'folder', 'Folders with tabs printed in gold and accompanied by partial gloss', ''),
(113, '/rockandroll/rnr_cedule_logo', 'logo', 'Ilustrace loga ve stylu ameriky šedesátých let', 1, 1, 1, 2012, '', 34, '', 'logo', 'Logo illustration in the US 60\'s style', ''),
(112, '/rockandroll/rnr_atika', 'billboard', 'Dvojice billboardů přímo u restaurace', 5, 5, 1, 2012, '', 34, '', 'billboard', 'A pair of billboards right next to the restaurant', ''),
(111, '/rockandroll/rnr_a5_navysku', 'leták', 'Burgery jsou v rock\'n\'rollu za hvězdy, zde v letáku s perforací', 3, 2, 1, 2012, '', 34, '', 'leaflet', 'Burgers are the ROCK\'n\'ROLL\'s stars', ''),
(110, '/rockandroll/rnr_a3', 'plakát', 'Plakát ke kampani na propagaci burgerů', 3, 4, 1, 2012, '', 34, '', 'poster', 'Campaign poster to promote burgers', ''),
(108, '/pspadv/pspadv_logo', 'logo', 'Výrazný redesign původního loga', 1, 1, 1, 2010, '', 33, '', 'logo', 'Redesign with a major evolution', ''),
(109, '/pspadv/pspadv_vizitky', 'vizitka', 'Vizitka se zajímavým výsekem', 3, 2, 1, 2010, '', 33, 'nerealizováno', 'business card', 'Business card with an interesting cut-out', 'not implemented'),
(107, '/pspadv/pspadv_a4', 'krycí list nabídek', 'Slouží jako titulní stránka velké hromady dokumentů', 3, 2, 1, 2010, '', 33, 'nerealizováno', 'cover sheet', 'They serve as the home page for a large pile of documents', 'not implemented'),
(106, '/pbv/bav_pozemky_web', 'web', 'Fullscreen prezentace krásné lokality', 2, 1, 1, 2011, '', 32, '', 'website', 'Fullscreen slideshow of a beautiful location', ''),
(105, '/pbv/bav_a4', 'leták', 'Informační leták k nabídce na webu', 3, 2, 1, 2011, '', 32, '', 'leaflet', 'An information leaflet to complement the website', ''),
(104, '/poldihutte/vp_poldi_hutte_a4', 'výrobní program', 'Přehled výrobních možností tyčové oceli', 3, 2, 1, 2012, '', 31, '', 'prouction program', 'Overview of the steel bars production possibilities', ''),
(103, '/poldihutte/poldi_hutte_web', 'web', 'Webové stránky hned na první straně prezentují produkty a materiály poldi', 2, 1, 1, 2011, 'www.poldi.cz', 31, '', 'website', 'Website is presenting Poldi products and materials right on the first page', ''),
(102, '/poldihutte/poldi_cedulka', 'orientační systém', 'Dveřní tabulka pro kancelář vedení společnosti', 5, 3, 1, 2012, '', 31, '', 'guidance system', 'Management offices door sign', ''),
(100, '/naven/naven_web', 'e-shop', 'Přehledný elektronický obchod s redakčním systémem comet', 2, 2, 1, 2009, '', 28, '', 'e-commerce', 'Well-arranged e-shop with CMS Comet', ''),
(101, '/pentagen/pentagen_a4', 'katalogový list', 'Prezentace vlastností diagnostického testu rakouského výrobce', 3, 2, 1, 2005, '', 30, 'nerealizováno', 'datasheet', 'Properties presentation with a diagnostic test of an Austrian manufacturer', 'not implemented'),
(99, '/naven/naven_vizitky', 'vizitka', 'Vizuální identita je založená na výrazné kombinaci barev', 3, 2, 1, 2012, '', 28, '', 'business card', 'Visual identity is based on a distinctive combination of colors', ''),
(98, '/naven/naven_logo', 'logo', 'Logo s kopci, mraky a drobným vtipem ve výběrové publikaci logo', 1, 1, 1, 2006, '', 28, 'oceněno', 'logo', 'Logo with hills, clouds and small joke in the selection publication LOGO', 'awarded'),
(96, '/lebak/lebak_logo', 'logo', 'Logo jako řez kabelem.', 1, 1, 1, 2012, '', 26, '', 'logo', 'Logo as a cable cut', ''),
(97, '/lebak/lebak_web', 'web', 'Katalog s aktuálními skladovými zásobami', 2, 2, 1, 2012, '', 26, '', 'website', 'Catalog with current inventory levels', ''),
(95, '/masnapribram/masna_pribram_logo', 'logo', 'Základní provedení loga', 1, 1, 1, 2006, '', 25, '', 'logo', 'Basic logo design', ''),
(94, '/masnapribram/logomanual_masna_pribram', 'logomanuál', 'Stručný logomanuál', 3, 2, 1, 2006, '', 25, '', 'logo manual', 'A brief logo manual', ''),
(335, '/navaro/web', 'web', 'Kouzelné stránky kouzelníka', 2, 1, 1, 2015, '', 79, '', 'website', 'Magical pages', ''),
(336, '/goldcars/web', 'návrh webu', 'Nerealizovaný návrh webu', 2, 1, 1, 2016, '', 80, 'nerealizováno', 'website proposal', 'Proposal', 'not implemented'),
(334, '/o4e/web', 'web', 'Webový rozcestník jako první příležitost pro použití nového loga', 2, 1, 1, 2015, '', 77, '', 'website', 'Frist usage of logo', ''),
(332, '/strojpoldi/strojpoldi_web_alt', 'návrh webu', 'Nerealizovaná modernizace webu', 2, 1, 1, 2007, '', 40, 'nerealizováno', 'website proposal', 'Alternative proposal', 'not implemented'),
(329, '/o4e/o4e_logo', 'logo', 'Logo s trumpetkami', 1, 1, 1, 2015, '', 77, '', 'logo', 'Logo with trumpets', ''),
(330, '/tur_trasy/tur_logo', 'logo', 'Logo pro aplikaci', 1, 1, 1, 2017, '', 78, '', 'logo', 'logo for turist app', ''),
(331, '/sbs/sbs_web_old', 'historický web', 'První web, který jsme vytvořili pro tuto agenturu', 2, 1, 1, 2006, '', 37, '', 'old website', 'First website for this agency', ''),
(89, '/kotlin/obaly_kotlin', 'krabičky', 'Obaly na elektrické senzory', 4, 2, 1, 2008, '', 23, '', 'packaging', 'Packaging for electrical sensors', ''),
(88, '/kotlin/kotlin_logo', 'logo', 'Logo umístěné do grafického prvku vizuálního stylu', 1, 1, 1, 2005, '', 23, '', 'logo', 'Logo placed in the graphic element of the visual style', ''),
(87, '/kotlin/kotlin_katalog1', 'katalog', 'Katalog čítá celkem 300 stran', 3, 2, 0, 2008, '', 23, '', 'catalog', 'Catalog has a total of 300 pages', ''),
(86, '/kotlin/kotlin_katalog', 'katalog', 'Obálka rozsáhlé tiskoviny', 3, 2, 1, 2008, '', 23, '', 'catalog', 'Cover for an extensive print', ''),
(85, '/kfs/kfs_letak', 'katalogový list', 'Velké ikony a přehledný sortiment', 3, 1, 1, 2012, '', 22, '', 'datasheet', 'Large icons and well-arranged selection', ''),
(84, '/kfs/kfs_katalog2_2', 'katalog', 'Světlá versus tmavá strana', 3, 3, 0, 2013, '', 22, '', 'catalog', 'Light versus dark', ''),
(83, '/kfs/kfs_katalog2_1', 'katalog', 'Obálka s 3D renderem', 3, 2, 1, 2013, '', 22, '', 'catalog', 'Cover with a 3D render', ''),
(81, '/kfs/kfs_katalog1_1', 'katalog', 'Katalog tyčové oceli produktové značky rhs – tabulky uvnitř katalogu', 3, 4, 1, 2012, '', 22, '', 'catalog', 'Catalog of bar steel products of the RHS brand - tables inside the catalog', ''),
(82, '/kfs/kfs_katalog1_2', 'katalog', 'Pokračování v linkovaném vizuálním stylu', 3, 5, 0, 2011, '', 22, '', 'catalog', 'Continuing with the lined visual style', ''),
(80, '/kfs/kfs_blok', 'poznámkový blok', 'Firemní blok s vrtanými otvory', 3, 6, 1, 2011, '', 22, '', 'notepad', 'Corporate block with drilled holes', ''),
(79, '/brainway/tryptofan', 'krabička', 'L-tryptofan je proti úzkosti a depresi, zlepšuje usínání a spánek', 4, 2, 1, 2013, '', 21, 'nerealizováno', 'packaging', 'L-Tryptophan hepls with anxiety and depression, also improves your sleep', 'not implemented'),
(78, '/brainway/gurmar', 'krabička', 'Gurmar pomáhá při léčbě diabetu', 4, 1, 1, 2013, '', 21, 'nerealizováno', 'packaging', 'Gurmar helps in the treatment of diabetes', 'not implemented'),
(341, '/destro/web_2014', 'web', 'Efektní web s parallaxem', 2, 1, 1, 2014, '', 7, '', 'website', 'With parallax effect', ''),
(345, '/mtb/mtb_katalog', 'katalog', 'Titulní strana katalogu, uvnitř samé mašinky', 3, 1, 1, 2012, '', 1, '', 'catalog', 'main page', ''),
(75, '/koma/koma_pf', 'novoročenka', 'Vtipná novoročenka, jejíž fotografii otiskly hospodářské noviny', 3, 2, 1, 2008, '', 20, 'v odborném tisku', 'new year\'s eve greeting', 'Funny New Year\'s greeting that has been noticed by the economic newspaper', 'in professional press'),
(74, '/koma/koma_logo', 'logo', 'Redesign loga společnosti, která dodává ochranné pracovní pomůcky', 1, 1, 1, 2008, '', 20, '', 'logo', 'Logo redesign of the company that supplies protective equipment', ''),
(73, '/koma/koma_cardesign', 'cardesign', 'Polep distribučního vozidla', 5, 2, 1, 2008, '', 20, '', 'cardesign', 'Ads on a distribution vehicle', ''),
(72, '/kettler/kettler_a4', 'inzerát', 'Inzerát na zahradní nábytek známé značky', 3, 2, 1, 2009, '', 19, '', 'advertisement', 'Listings for garden furniture of a known brand', ''),
(71, '/arcadehry/arcadehry_web', 'web', 'Webové stránky s programem akcí muzea', 2, 2, 1, 2017, 'www.arcadehry.cz', 18, '', 'website', 'Website with a program of the museum events', ''),
(70, '/arcadehry/arcadehry_logo', 'logo', 'Ve stylu arkádových herních automatů', 1, 1, 1, 2011, '', 18, '', 'logo', 'In a style of arcade game machines', ''),
(69, '/izos/izos_web', 'web', 'Webové stránky s on-line kalkulátorem', 2, 2, 1, 2011, 'www.izos-kladno.cz', 17, '', 'website', 'Website with online calculator', ''),
(67, '/izos/izos_logo', 'logo', 'Logo, které tvoří přechod mezi zimou a teplem', 1, 1, 1, 2010, '', 17, '', 'logo', 'Logo which forms the transition between cold and heat', ''),
(65, '/izos/izos_cardesign', 'cardesign', 'Polep aplikačního automobilu', 5, 2, 1, 2008, '', 17, '', 'cardesign', 'Ads on the application car', ''),
(64, '/ipo/ipo_web', 'web', 'Webové stránky s fotografiemi pracovníků skupiny ipo', 2, 3, 1, 2010, 'www.ipo.eu', 16, '', 'website', 'Website with photographs of IPO employees', ''),
(63, '/ipo/ipo_poutac', 'roll-up', 'Plakát pro umístění na společenské akci', 5, 2, 0, 2013, '', 16, '', 'banner', 'Poster for placement at a social event', ''),
(62, '/ipo/ipo_logo', 'logo', 'Redesign loga za pomoci 3D modelace', 1, 1, 1, 2011, '', 16, '', 'logo', 'Logo redesign with the help of 3D modeling', ''),
(61, '/ipo/ipo_desky', 'desky na dokumenty', 'S ikonkami typových produktů', 3, 2, 0, 2012, '', 16, '', 'folder', 'With icons of typical products', ''),
(60, '/ipo/ipo_cedulky', 'tabulky', 'Označení střežených objektů', 5, 2, 0, 2012, '', 16, '', 'tables', 'Designation of a guarded objects', ''),
(59, '/ipo/ipo_a5_nasirku', 'profil společnosti', 'Efektní brožura se speciálním zubatým výsekem', 3, 2, 1, 2011, '', 16, '', 'company profile', 'Fancy brochure with a special jagged cut-out', ''),
(347, '/pcohorsky/cardesign', 'cardesign', 'Výrazný polep zásahového vozidla', 5, 1, 1, 2014, '', 74, '', 'cardesign', 'significant design of the intervention vehicle', ''),
(58, '/invera/invera_vizitky', 'vizitka', 'Vizitka s výsekem, který rozvíjí tvary vizuálního stylu', 3, 2, 1, 2006, '', 15, 'nerealizováno', 'business card', 'Business card with a cut-out, which develops forms of visual style', 'not implemented'),
(340, '/destro/web_2010', 'historický web', 'Jeden z původních webů od nás pro destro', 2, 1, 1, 2010, '', 7, '', 'old website', 'Original website', ''),
(57, '/invera/invera_logo', 'logo', 'Redesign loga, který sice zachoval původní myšlenku, celek je ale nyní výrazně modernější', 1, 1, 1, 2011, '', 15, '', 'logo', 'Logo redesign which has retained the original idea, but the whole is much more modern now', ''),
(338, '/seb/web', 'web', 'Dnes již staré webové stránky vzpomínající na E. B.', 2, 1, 1, 2005, '', 82, '', 'website', 'Website', ''),
(339, '/destro/web_usa', 'web', 'Prezentace zahraniční divize v angličtině', 2, 1, 1, 2016, '', 7, '', 'website', 'Web in english for foreign division', ''),
(46, '/freshdays/freshdays_poutace', 'POS stojan', 'Kovový stojan do prodejen', 5, 2, 1, 2012, '', 12, '', 'POS stand', 'Metal stand for stores', ''),
(47, '/freshdays/freshdays_web', 'web', 'Webové stránky s možností objednávky', 2, 3, 1, 2012, 'www.freshdays.cz', 12, '', 'website', 'Website with an option to place orders', ''),
(48, '/freshdays/obaly_freshdays_man', 'obal', 'Motýlek na krk pro obal určený mužům', 4, 2, 0, 2012, '', 12, '', 'packaging', 'Butterfly on the neck for men', ''),
(49, '/freshdays/obaly_freshdays_woman', 'obal', 'Poletující motýlek pro obal určený ženám', 4, 2, 0, 2012, '', 12, '', 'packaging', 'Butterfly flying around for women', ''),
(50, '/greenfeeclub/gfc_dl', 'voucher', 'Poukázka na hru jako výhra v soutěži', 3, 2, 1, 2010, '', 13, '', 'voucher', 'Game voucher as a contest prize', ''),
(51, '/greenfeeclub/gfc_logo', 'logo', 'Logo tak trochu evokuje golfový míček', 1, 1, 1, 2010, '', 13, '', 'logo', 'Logo resembles the golf ball', ''),
(52, '/greenfeeclub/gfc_poutace', 'POS poutač', 'Infokiosek s informacemi o hřištích a hracích programech', 5, 2, 1, 2010, '', 13, '', 'POS eye-catcher', 'Info stand with information about the courses and playing programs', ''),
(53, '/greenfeeclub/gfc_web', 'web', 'Webové stránky golfového klubu s přehledem programů', 2, 2, 1, 2010, '', 13, '', 'website', 'Golf club website with an overview of programs', ''),
(45, '/freshdays/freshdays_obaly', 'krabičky', 'Dvě verze krabiček, jedna pro muže a druhá pro ženy', 4, 2, 1, 2012, '', 12, '', 'packaging', 'Two versions of boxes, one for men and one for women', ''),
(44, '/freshdays/freshdays_logo', 'logo', 'Graficky jednoduchá, ale o to silnější značka produktu', 1, 1, 1, 2012, '', 12, '', 'logo', 'Graphically simple, but very powerful brand of product', ''),
(325, '/stablo/stablo_logo', 'logo', 'Logo pevných betonových výrobků', 1, 1, 1, 2016, '', 75, '', 'logo', 'Logo for concrete products', ''),
(43, '/freshdays/freshdays_a4', 'salesprezenter', 'Významná pomůcka obchodních zástupců s informacemi v českém a anglickém jazyce', 3, 2, 0, 2012, '', 12, '', 'sales presentation', 'Important tool for sales representatives with information in Czech and English', ''),
(41, '/exprit/exprit_a4', 'katalogový list', 'Materiál s grafem, který odhaluje jednotlivé vrstvy software', 3, 2, 1, 2004, '', 11, 'nerealizováno', 'datasheet', 'Material with a chart which reveals the various layers of software', 'not implemented'),
(326, '/avert/avert_logo', 'logo', 'Logo pro vícefunkční agenturu', 1, 1, 1, 2014, '', 76, '', 'logo', 'Logo for agency', ''),
(291, '/sommeravnuk/sav_vanicka_sumava', 'obal', 'Řada rukávů na mražené houby', 4, 0, 0, 2015, '', 38, '', 'packaging', 'A range of frozen mushroom labels', ''),
(39, '/eplace/eplace_vizitky', 'vizitka', 'Styl je založen na rastru z erbů a domků v různých odstínech', 3, 4, 1, 2009, '', 10, '', 'business card', 'Style is based on a grid of coats of arms and houses in different shades', ''),
(38, '/eplace/eplace_logo', 'logo', 'Jednoduchá explikace: ochrana domova', 1, 1, 1, 2009, '', 10, '', 'logo', 'Simple explication: home protection', ''),
(37, '/eplace/eplace_a5_1', 'brožura', 'Obálka s plyšovým pejskem hlídačem', 3, 2, 1, 2009, '', 10, '', 'brochure', 'Envelope with a teddy dog watcher', ''),
(342, '/blaha/3D_ikona', 'ikona', 'Jedna z 3D ikonek používaná v aplikacích', 5, 1, 1, 2012, '', 3, '', 'icon', 'One od 3D icons', ''),
(343, '/dystan/dystan_a4', 'plakát', 'Přehled programu na celý podzim', 3, 1, 1, 2013, '', 83, '', 'poster', 'Program for autumn', ''),
(344, '/kfs/kfs_ikona', 'ikona', 'Ukazuje styl používaných ilustrací', 5, 1, 1, 2013, '', 22, '', 'icon', 'Illustration', ''),
(30, '/dhl/dhl_a5', 'brožura', 'Informace k produktu dhl sameday', 3, 2, 1, 2008, '', 8, '', 'brochure', 'Information for the DHL SameDay product', ''),
(32, '/dhl/dhl_a5_nasirku', 'karta', 'Jiný materiál k produktu dhl sameday', 3, 4, 1, 2008, '', 8, '', 'card', 'Other material for the DHL SameDay product', ''),
(33, '/entree/entree_a4', 'profil společnosti', 'Koncept brožury představující činnost projekční společnosti', 3, 2, 1, 2010, '', 9, 'nerealizováno', 'company profile', 'Concept of a brochure presenting the activities of the designer company', 'not implemented'),
(34, '/entree/entree_logo', 'logo', 'Logo, které obejme celou tiskovinu', 1, 1, 1, 2010, '', 9, 'nerealizováno', 'logo', 'Logo which embraces the whole pamphlet', 'not implemented'),
(35, '/entree/entree_vizitky', 'vizitka', 'Výrazná barevnost, ovály, ale pouze jednoduchý nápis', 3, 2, 1, 2010, '', 9, 'nerealizováno', 'business card', 'Bright color and ovals, but only simple inscription', 'not implemented'),
(9, '/blaha/blaha_poutace', 'roll-up', 'S ikonkami typových produktů v 3D provedení', 5, 5, 0, 2012, '', 3, 'nerealizováno', 'banner', 'With icons of typical products in 3D design', 'not implemented'),
(8, '/blaha/blaha_obalka', 'obálka', 'Formát dl s okénkem', 3, 4, 0, 2013, '', 3, '', 'envelope', 'DL format with window', ''),
(6, '/blaha/blaha_blok', 'poznámkový blok', 'S ikonami a čtvercovým rastrem', 3, 3, 0, 2013, '', 3, '', 'notepad', 'With icons and square grid', ''),
(5, '/beznoska/beznoska_vizitky', 'vizitka', 'Součást návrhu vizuálního stylu', 3, 2, 1, 2005, '', 2, 'nerealizováno', 'business card', 'A part of the visual style design', 'not implemented'),
(4, '/beznoska/beznoska_logo', 'logo', 'Vize loga se dostala na stránky výběrové publikace logo', 1, 1, 1, 2005, '', 2, 'nerealizováno, oceněno', 'logo', 'Vision of a logo that became a part of the selection of the LOGO publication', 'not implemented, awarded'),
(3, '/beznoska/beznoska_a4', 'katalogový list', 'Koncept vizuálního stylu s mřížkou vycházející z loga', 3, 2, 1, 2005, '', 2, 'nerealizováno', 'datasheet', 'A visual style concept with a grid based on the logo', 'not implemented'),
(2, '/mtb/obal_mtb', 'krabička', 'Obal na model lokomotivy v měřítku tt', 4, 2, 1, 2010, '', 1, '', 'packaging', 'Packaging for a model locomotive in a TT scale', ''),
(1, '/mtb/mtb_logo', 'logo', 'Logo, které tvaroslovím připomíná železniční koleje', 1, 1, 1, 2010, '', 1, '', 'logo', 'Logo which resembles the morphology of railroad tracks', ''),
(29, '/dhl/dhl_a4', 'leták', 'Součást kampaně u příležitosti otevření terminálů v ostravě a olomouci', 3, 1, 1, 2008, '', 8, 'oceněno', 'leaflet', 'A part of a campaign to mark the opening of the terminal in Ostrava and Olomouc', 'awarded'),
(10, '/blaha/blaha_vizitka', 'vizitka', 'Vizitka s kulatými rohy', 3, 2, 1, 2013, '', 3, '', 'business card', 'Business card with rounded corners', ''),
(11, '/blaha/blaha_web', 'web', 'Webové stránky obsahující dvě hlavní produktové sekce', 2, 6, 1, 2012, 'www.regal.cz', 3, '', 'website', 'Website that contains two main product section', ''),
(12, '/bramko/bramko_logo', 'logo', 'Značka, ve které zelenina přímo roste', 1, 1, 1, 2005, '', 4, 'nerealizováno', 'logo', 'A brand which grows vegetables', 'not implemented'),
(13, '/bramko/obal_bramko', 'etiketa', 'Etiketa s výrazným označením hmotnosti', 4, 2, 1, 2006, '', 4, 'nerealizováno', 'label', 'Label with a distinctive weight marking', 'not implemented'),
(14, '/cramo/cramo_cardesign', 'cardesign', 'Škoda Octavia s polepem', 5, 1, 1, 2011, '', 5, '', 'cardesign', 'Skoda Octavia with ads', ''),
(15, '/cramo/cramo_cardesign2', 'cardesign', 'Škoda Roomster s polepem', 5, 2, 0, 2011, '', 5, '', 'cardesign', 'Skoda Roomster with ads', ''),
(18, '/dava/dava_a4', 'leták', 'Popisuje výhody samonivelačních litých podlah', 3, 2, 1, 2008, '', 6, '', 'leaflet', 'It describes the advantages of self-leveling cast floors', ''),
(19, '/dava/dava_cardesign', 'cardesign', 'Ford Transit slouží divizi stavba, obdobný slouží divizi litých podlah', 5, 2, 1, 2008, '', 6, '', 'cardesign', 'Ford Transit for the construction division and a similar one for cast floors division', ''),
(20, '/dava/dava_logo', 'logo', 'Mírný redesign loga', 1, 1, 1, 2005, '', 6, '', 'logo', 'Minor logo redesign', ''),
(21, '/dava/dava_web', 'web', 'Společnost má dvě divize, stránky tomu odpovídají', 2, 2, 1, 2010, '', 6, '', 'website', 'The company has two divisions and a corresponding website', ''),
(26, '/destro/destro_kalend', 'kalendář', 'Stylový kalendář s bronzovou titulkou a akty nafocenými na firemní haldě', 3, 6, 1, 2011, '', 7, '', 'calendar', 'Stylish calendar with bronze headlines and nude photos taken on the corporate heap', ''),
(27, '/destro/destro_logo_2', 'logo', 'Jeden z postupných redesignů historického loga', 1, 1, 1, 2006, '', 7, '', 'logo', 'Redesign of the historic logo', ''),
(321, '/lucyclay/lucyclay_web', 'web', 'Produktový web s parallaxovým efektem', 2, 1, 1, 2013, '', 58, '', 'website', 'Product web with parallax effect', ''),
(322, '/nemcko/web', 'web', 'Web s parallaxovým efektem', 2, 1, 1, 2014, '', 73, '', 'website', 'Website with parallax effect', ''),
(292, '/sommeravnuk/sav_obaly_sklo', 'etikety', 'Vytvořili jsme také tyto 3D vizualizace na nové dózy s houbami', 4, 0, 0, 2011, '', 38, '', 'a set of labels', 'A range of frozen mushroom labels', ''),
(293, '/tachtech/tachtech_katalog', 'katalog', 'Katalog s přehledem služeb', 3, 0, 0, 2016, '', 68, '', 'catalog', 'Catalog with service overview', ''),
(294, '/tachtech/tachtech_logo', 'logo', 'Redesign loga s novou typografií', 1, 0, 0, 2016, '', 68, '', 'logo', 'New logo redesign', ''),
(295, '/tachtech/tachtech_ppt', 'prezentace', 'Elektronická prezentace společnosti', 5, 0, 0, 2016, '', 68, '', 'presentation', 'Electronic presentation of the company', ''),
(296, '/tachtech/tachtech_vizitka', 'vizitka', 'Vizitka v novém vizuálním stylu', 3, 0, 0, 2016, '', 68, '', 'business card', 'Business card in a new visual style', '');
INSERT INTO `d3_obrazky` (`id`, `soubor`, `titulek`, `popisek`, `druh`, `poradi`, `titulka`, `rok`, `url`, `klient`, `poznamka`, `titulek_en`, `popisek_en`, `poznamka_en`) VALUES
(297, '/tachtech/tachtech_web', 'web', 'Web s průmyslovými pecemi v hlavní roli', 2, 0, 0, 2016, 'www.tachtech.cz', 68, '', 'website', 'Website with industrial furnaces in the lead role', ''),
(298, '/lucyclay/lucyclay_dl', 'slevový kupon', 'Kupon na slevu při nákupu', 3, 0, 0, 2013, '', 58, '', 'discount coupon', 'Discount coupon for use when buying online', ''),
(299, '/lucyclay/lucyclay_krabice', 'etiketa', 'Etiketa na krabici s modelovacími nástroji', 4, 0, 0, 2013, '', 58, '', 'label', 'Label on a box with modeling tools', ''),
(300, '/lucyclay/lucyclay_tubus', 'obal', 'Tubus na základní modelovací sadu', 4, 0, 0, 2013, '', 58, '', 'packaging', 'A tube for a basic modeling kit', ''),
(301, '/pht/pht_krab_kak', 'obal', 'Krabička na rodinné balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'A box for a family packaging of wafers', ''),
(302, '/pht/pht_krab_kak_dia', 'obal', 'Krabička na rodinné balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'A box for a family packaging of wafers', ''),
(303, '/pht/pht_krab_kak_pol', 'obal', 'Krabička na rodinné balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'A box for a family packaging of wafers', ''),
(304, '/pht/pht_krab_lik', 'obal', 'Krabička na rodinné balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'A box for a family packaging of wafers', ''),
(306, '/pht/pht_krab_napol', 'obal', 'Krabička na rodinné balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'A box for a family packaging of wafers', ''),
(307, '/pht/pht_krab_sypane', 'obal', 'Krabička na rodinné balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'A box for a family packaging of wafers', ''),
(309, '/pht/pht_logo', 'logo', 'Redesign loga, které ctí tradici', 1, 0, 0, 2016, '', 67, '', 'logo', 'Logo redesign that honors the tradition', ''),
(310, '/pht/pht_plech', 'obal', 'Dárkové balení trubiček v plechovce', 4, 0, 0, 2016, '', 67, '', 'packaging', 'Gift packaging in a tin box', ''),
(311, '/pht/pht_roll-up', 'roll-up', 'Poutač s novými obaly', 5, 0, 0, 2016, '', 67, '', 'banner', 'Banner with new packaging design', ''),
(312, '/pht/pht_slidy_kak', 'obal', 'Nový obal na kapesní balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'New packaging for a pocket pack of wafers', ''),
(313, '/pht/pht_slidy_kak_dia', 'obal', 'Nový obal na kapesní balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'New packaging for a pocket pack of wafers', ''),
(314, '/pht/pht_slidy_kak_pol', 'obal', 'Nový obal na kapesní balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'New packaging for a pocket pack of wafers', ''),
(315, '/pht/pht_slidy_liker', 'obal', 'Nový obal na kapesní balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'New packaging for a pocket pack of wafers', ''),
(317, '/pht/pht_slidy_napol', 'obal', 'Nový obal na kapesní balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'New packaging for a pocket pack of wafers', ''),
(319, '/pht/pht_slidy_stevie', 'obal', 'Nový obal na kapesní balení trubiček', 4, 0, 0, 2016, '', 67, '', 'packaging', 'New packaging for a pocket pack of wafers', ''),
(320, '/pht/pht_web', 'web', 'Web s přehledným e-shopem', 2, 0, 0, 2016, 'www.horicke-trubicky.eu', 67, '', 'website', 'Website with an online store', '');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `d3_druhy_projektu`
--
ALTER TABLE `d3_druhy_projektu`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `d3_klienti`
--
ALTER TABLE `d3_klienti`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `d3_novinky`
--
ALTER TABLE `d3_novinky`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `d3_obrazky`
--
ALTER TABLE `d3_obrazky`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `d3_druhy_projektu`
--
ALTER TABLE `d3_druhy_projektu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pro tabulku `d3_novinky`
--
ALTER TABLE `d3_novinky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT pro tabulku `d3_obrazky`
--
ALTER TABLE `d3_obrazky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

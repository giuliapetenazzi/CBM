-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2017 at 04:18 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CBM`
--

-- --------------------------------------------------------

--
-- Table structure for table `AssDisabilita`
--

CREATE TABLE `AssDisabilita` (
  `id_ass_disabilita` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `id_disabilita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AssDisabilita`
--

INSERT INTO `AssDisabilita` (`id_ass_disabilita`, `id_progetto`, `id_disabilita`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `AssSettori`
--

CREATE TABLE `AssSettori` (
  `id_ass_progetti` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `id_settore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AssSettori`
--

INSERT INTO `AssSettori` (`id_ass_progetti`, `id_progetto`, `id_settore`) VALUES
(1, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `AssStrumenti`
--

CREATE TABLE `AssStrumenti` (
  `id_ass_strumento` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `id_strumento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AssStrumenti`
--

INSERT INTO `AssStrumenti` (`id_ass_strumento`, `id_progetto`, `id_strumento`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Budjets`
--

CREATE TABLE `Budjets` (
  `id_budjet` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `budjet_totale_cbm_italia` float DEFAULT NULL,
  `speso_effettivo_cbm_italia` float DEFAULT NULL,
  `budjet_totale` float DEFAULT NULL,
  `budjet_residuo_effettivo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Contatti`
--

CREATE TABLE `Contatti` (
  `id_contatto` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `telefono` varchar(64) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `skype` varchar(64) DEFAULT NULL,
  `indirizzo` varchar(64) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Disabilita`
--

CREATE TABLE `Disabilita` (
  `id_disabilita` int(11) NOT NULL,
  `tipologia` enum('visiva','uditiva','fisica','mentale') DEFAULT NULL,
  `nome` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Disabilita`
--

INSERT INTO `Disabilita` (`id_disabilita`, `tipologia`, `nome`) VALUES
(1, 'visiva', 'Oncocerosi'),
(2, 'visiva', 'Cataratta'),
(3, 'visiva', 'Tracoma'),
(4, 'visiva', 'Errori refrattivi'),
(5, 'visiva', 'Ipovisione'),
(6, 'fisica', 'Osteomelite'),
(7, 'visiva', 'Retinopatia diabetica'),
(8, 'visiva', 'Glaucoma'),
(9, 'visiva', 'Retinopatia del prematuro ROP'),
(10, 'fisica', 'Piede torto'),
(11, 'fisica', 'Palatoschisi'),
(12, 'fisica', 'Deformita arti'),
(13, 'mentale', 'Paralisi celebrale'),
(14, 'fisica', 'ENT'),
(15, 'visiva', 'Altro'),
(16, 'uditiva', 'Altro'),
(17, 'fisica', 'Altro'),
(18, 'mentale', 'Altro');

-- --------------------------------------------------------

--
-- Table structure for table `Donazioni`
--

CREATE TABLE `Donazioni` (
  `id_donazione` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `nominativo_donatore` varchar(64) DEFAULT NULL,
  `persona_di_riferimento` varchar(64) DEFAULT NULL,
  `data_donazione` date DEFAULT NULL,
  `telefono` varchar(64) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `position_number` int(11) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `budjet_preventivo` float DEFAULT NULL,
  `budjet_consuntivo` float DEFAULT NULL,
  `tipologia` enum('privato','azienda','ente_istituzionale') DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Finanziatori`
--

CREATE TABLE `Finanziatori` (
  `id_finanziatore` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `data_inizio_finanziamento` date DEFAULT NULL,
  `data_fine_finanziamento` date DEFAULT NULL,
  `importo` float DEFAULT NULL,
  `telefono` varchar(64) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `skype` varchar(64) DEFAULT NULL,
  `tipologia` enum('privato','azienda','ente_istituzionale') DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GruppiBeneficiari`
--

CREATE TABLE `GruppiBeneficiari` (
  `id_gruppo_beneficiario` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `anno_beneficiari` int(11) DEFAULT NULL,
  `donne` tinyint(1) DEFAULT NULL,
  `uomini` tinyint(1) DEFAULT NULL,
  `adulti` tinyint(1) DEFAULT NULL,
  `bambini` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Missioni`
--

CREATE TABLE `Missioni` (
  `id_missione` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `luogo` varchar(64) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Missioni`
--

INSERT INTO `Missioni` (`id_missione`, `id_progetto`, `luogo`, `note`) VALUES
(1, 1, 'Africa', 'nessuna nota');

-- --------------------------------------------------------

--
-- Table structure for table `PartnersLocali`
--

CREATE TABLE `PartnersLocali` (
  `id_partner_locale` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `anno_partnership` int(11) DEFAULT NULL,
  `ruolo` varchar(64) DEFAULT NULL,
  `sito_web` varchar(64) DEFAULT NULL,
  `tipologia` enum('privato','azienda','ente_istituzionale') DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Progetti`
--

CREATE TABLE `Progetti` (
  `id_progetto` int(11) NOT NULL,
  `titolo` varchar(64) DEFAULT NULL,
  `codice_vecchio` int(11) DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione_testuale` varchar(255) DEFAULT NULL,
  `emergenza_si_no` tinyint(1) DEFAULT NULL,
  `tipologia_geografica` enum('internazionale','nazionale','regionale','locale') DEFAULT NULL,
  `luogo_geografico` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Progetti`
--

INSERT INTO `Progetti` (`id_progetto`, `titolo`, `codice_vecchio`, `data_inizio`, `data_fine`, `descrizione_testuale`, `emergenza_si_no`, `tipologia_geografica`, `luogo_geografico`) VALUES
(1, 'ProgettoDiProva', 123, '0000-00-00', '0000-00-00', 'Descrizione testuale del progetto di prova', 1, 'nazionale', 'Congo');

-- --------------------------------------------------------

--
-- Table structure for table `PuntiDiInteresse`
--

CREATE TABLE `PuntiDiInteresse` (
  `id_punto_di_interesse` int(11) NOT NULL,
  `id_progetto` int(11) DEFAULT NULL,
  `nome` varchar(64) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Settori`
--

CREATE TABLE `Settori` (
  `id_settore` int(11) NOT NULL,
  `macro_settore` varchar(64) DEFAULT NULL,
  `dettaglio_settore` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Settori`
--

INSERT INTO `Settori` (`id_settore`, `macro_settore`, `dettaglio_settore`) VALUES
(1, 'Salute', 'Promozione'),
(2, 'Salute', 'Prevenzione'),
(3, 'Salute', 'Cure mediche'),
(4, 'Salute', 'Riabilitazione'),
(5, 'Salute', 'Ausili'),
(6, 'Salute', 'Formazione professionale medici infermieri'),
(7, 'Altro', 'Formazione personale e avviamento lavoro'),
(8, 'Educazione', 'Pre-scolastica'),
(9, 'Educazione', 'Informale'),
(10, 'Educazione', 'Elementare'),
(11, 'Educazione', 'Superiore universitaria'),
(12, 'Educazione', 'Formazione continua'),
(13, 'Livelihood', 'Formazione professionale'),
(14, 'Livelihood', 'Servizi finanziari per avviamento attivita'),
(15, 'Livelihood', 'Attivita generatrici di reddito o impresa autogestiti'),
(16, 'Livelihood', 'Lavoro'),
(17, 'Livelihood', 'Protezione delle categorie sociali'),
(18, 'Sociale', 'Accesso giustizia e protezione legale'),
(19, 'Sociale', 'Religione cultura e arte'),
(20, 'Sociale', 'Sport tempo libero e attivita creative'),
(21, 'Sociale', 'Relazioni sociali matrimonio e famiglia'),
(22, 'Sociale', 'Assistenza personale'),
(23, 'Empowerment', 'Gruppi di aiuto-aiuto'),
(24, 'Empowerment', 'Organizzazioni di persone con disabilita'),
(25, 'Empowerment', 'Sensibilizzazione'),
(26, 'Empowerment', 'Partecipazione attiva alla politica'),
(27, 'Empowerment', 'Comunicazione');

-- --------------------------------------------------------

--
-- Table structure for table `Strumenti`
--

CREATE TABLE `Strumenti` (
  `id_strumento` int(11) NOT NULL,
  `nome` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Strumenti`
--

INSERT INTO `Strumenti` (`id_strumento`, `nome`) VALUES
(1, 'Ausili motori'),
(2, 'Ausili ipovedenti'),
(3, 'Occhiali'),
(4, 'Ausili uditivi'),
(5, 'Tonometro'),
(6, 'Microscopio'),
(7, 'Costruzione'),
(8, 'Veicoli'),
(9, 'Cliniche mobili'),
(10, 'Antibiotici'),
(11, 'Laboratorio ottico'),
(12, 'Altro');

-- --------------------------------------------------------

--
-- Table structure for table `Uploaded`
--

CREATE TABLE `Uploaded` (
  `id_uploaded` int(11) NOT NULL,
  `id_progetto` int(11) NOT NULL,
  `nome_file` varchar(255) NOT NULL,
  `payload` longblob NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Uploaded`
--

INSERT INTO `Uploaded` (`id_uploaded`, `id_progetto`, `nome_file`, `payload`, `note`) VALUES
(1, 1, 'file_di_prova.txt', 0x70726f76610a, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AssDisabilita`
--
ALTER TABLE `AssDisabilita`
  ADD PRIMARY KEY (`id_ass_disabilita`),
  ADD KEY `id_progetto` (`id_progetto`),
  ADD KEY `id_disabilita` (`id_disabilita`);

--
-- Indexes for table `AssSettori`
--
ALTER TABLE `AssSettori`
  ADD PRIMARY KEY (`id_ass_progetti`),
  ADD KEY `id_progetto` (`id_progetto`),
  ADD KEY `id_settore` (`id_settore`);

--
-- Indexes for table `AssStrumenti`
--
ALTER TABLE `AssStrumenti`
  ADD PRIMARY KEY (`id_ass_strumento`),
  ADD KEY `id_progetto` (`id_progetto`),
  ADD KEY `id_strumento` (`id_strumento`);

--
-- Indexes for table `Budjets`
--
ALTER TABLE `Budjets`
  ADD PRIMARY KEY (`id_budjet`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `Contatti`
--
ALTER TABLE `Contatti`
  ADD PRIMARY KEY (`id_contatto`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `Disabilita`
--
ALTER TABLE `Disabilita`
  ADD PRIMARY KEY (`id_disabilita`);

--
-- Indexes for table `Donazioni`
--
ALTER TABLE `Donazioni`
  ADD PRIMARY KEY (`id_donazione`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `Finanziatori`
--
ALTER TABLE `Finanziatori`
  ADD PRIMARY KEY (`id_finanziatore`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `GruppiBeneficiari`
--
ALTER TABLE `GruppiBeneficiari`
  ADD PRIMARY KEY (`id_gruppo_beneficiario`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `Missioni`
--
ALTER TABLE `Missioni`
  ADD PRIMARY KEY (`id_missione`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `PartnersLocali`
--
ALTER TABLE `PartnersLocali`
  ADD PRIMARY KEY (`id_partner_locale`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `Progetti`
--
ALTER TABLE `Progetti`
  ADD PRIMARY KEY (`id_progetto`);

--
-- Indexes for table `PuntiDiInteresse`
--
ALTER TABLE `PuntiDiInteresse`
  ADD PRIMARY KEY (`id_punto_di_interesse`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- Indexes for table `Settori`
--
ALTER TABLE `Settori`
  ADD PRIMARY KEY (`id_settore`);

--
-- Indexes for table `Strumenti`
--
ALTER TABLE `Strumenti`
  ADD PRIMARY KEY (`id_strumento`);

--
-- Indexes for table `Uploaded`
--
ALTER TABLE `Uploaded`
  ADD PRIMARY KEY (`id_uploaded`),
  ADD KEY `id_progetto` (`id_progetto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AssDisabilita`
--
ALTER TABLE `AssDisabilita`
  MODIFY `id_ass_disabilita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `AssSettori`
--
ALTER TABLE `AssSettori`
  MODIFY `id_ass_progetti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `AssStrumenti`
--
ALTER TABLE `AssStrumenti`
  MODIFY `id_ass_strumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Budjets`
--
ALTER TABLE `Budjets`
  MODIFY `id_budjet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Contatti`
--
ALTER TABLE `Contatti`
  MODIFY `id_contatto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Disabilita`
--
ALTER TABLE `Disabilita`
  MODIFY `id_disabilita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `Donazioni`
--
ALTER TABLE `Donazioni`
  MODIFY `id_donazione` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Finanziatori`
--
ALTER TABLE `Finanziatori`
  MODIFY `id_finanziatore` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GruppiBeneficiari`
--
ALTER TABLE `GruppiBeneficiari`
  MODIFY `id_gruppo_beneficiario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Missioni`
--
ALTER TABLE `Missioni`
  MODIFY `id_missione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `PartnersLocali`
--
ALTER TABLE `PartnersLocali`
  MODIFY `id_partner_locale` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Progetti`
--
ALTER TABLE `Progetti`
  MODIFY `id_progetto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `PuntiDiInteresse`
--
ALTER TABLE `PuntiDiInteresse`
  MODIFY `id_punto_di_interesse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Settori`
--
ALTER TABLE `Settori`
  MODIFY `id_settore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `Strumenti`
--
ALTER TABLE `Strumenti`
  MODIFY `id_strumento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `Uploaded`
--
ALTER TABLE `Uploaded`
  MODIFY `id_uploaded` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `AssDisabilita`
--
ALTER TABLE `AssDisabilita`
  ADD CONSTRAINT `AssDisabilita_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AssDisabilita_ibfk_2` FOREIGN KEY (`id_disabilita`) REFERENCES `Disabilita` (`id_disabilita`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AssSettori`
--
ALTER TABLE `AssSettori`
  ADD CONSTRAINT `AssSettori_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AssSettori_ibfk_2` FOREIGN KEY (`id_settore`) REFERENCES `Settori` (`id_settore`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AssStrumenti`
--
ALTER TABLE `AssStrumenti`
  ADD CONSTRAINT `AssStrumenti_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AssStrumenti_ibfk_2` FOREIGN KEY (`id_strumento`) REFERENCES `Strumenti` (`id_strumento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Budjets`
--
ALTER TABLE `Budjets`
  ADD CONSTRAINT `Budjets_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Contatti`
--
ALTER TABLE `Contatti`
  ADD CONSTRAINT `Contatti_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Donazioni`
--
ALTER TABLE `Donazioni`
  ADD CONSTRAINT `Donazioni_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Finanziatori`
--
ALTER TABLE `Finanziatori`
  ADD CONSTRAINT `Finanziatori_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `GruppiBeneficiari`
--
ALTER TABLE `GruppiBeneficiari`
  ADD CONSTRAINT `GruppiBeneficiari_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Missioni`
--
ALTER TABLE `Missioni`
  ADD CONSTRAINT `Missioni_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PartnersLocali`
--
ALTER TABLE `PartnersLocali`
  ADD CONSTRAINT `PartnersLocali_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PuntiDiInteresse`
--
ALTER TABLE `PuntiDiInteresse`
  ADD CONSTRAINT `PuntiDiInteresse_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Uploaded`
--
ALTER TABLE `Uploaded`
  ADD CONSTRAINT `Uploaded_ibfk_1` FOREIGN KEY (`id_progetto`) REFERENCES `Progetti` (`id_progetto`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

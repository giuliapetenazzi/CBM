DROP TABLE IF EXISTS Progetti;
DROP TABLE IF EXISTS Disabilita;
DROP TABLE IF EXISTS AssDisabilita;
DROP TABLE IF EXISTS Settori;
DROP TABLE IF EXISTS AssSettori;
DROP TABLE IF EXISTS Missioni;
DROP TABLE IF EXISTS Budjet;
DROP TABLE IF EXISTS Finanziatori;
DROP TABLE IF EXISTS GruppiBeneficiari;
DROP TABLE IF EXISTS PartnersLocali;
DROP TABLE IF EXISTS Donazioni;
DROP TABLE IF EXISTS Contatti;
DROP TABLE IF EXISTS Strumenti;
DROP TABLE IF EXISTS AssStrumenti;
DROP TABLE IF EXISTS PuntiDiInteresse;

/*TO DO
chiavi esterne
inserire il file del documento di riconoscimento del donatore
controllare mail correttiva del tizio
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE  Progetti (
  id_progetto int(11)  AUTO_INCREMENT,
  titolo varchar(64),
  codice_vecchio int(11),
  data_inizio date,
  data_fine date,
  descrizione_testuale varchar(255),
  emergenza_si_no tinyint(1),
  tipologia_geografica enum('internazionale','nazionale','regionale','locale'),
  luogo_geografico varchar(64),
  PRIMARY KEY (id_progetto)
);


CREATE TABLE  Disabilita (
  id_disabilita int(11) AUTO_INCREMENT PRIMARY KEY,
  tipologia enum('visiva','uditiva','fisica','mentale'),
  nome varchar(64)
);


CREATE TABLE  Settori (
  id_settore int(11) AUTO_INCREMENT PRIMARY KEY,
  macro_settore varchar(64),
  dettaglio_settore varchar(64)
);


CREATE TABLE  AssDisabilita (
  id_ass_disabilita int(11) AUTO_INCREMENT PRIMARY KEY,
  id_progetto int(11),
  id_disabilita int(11),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
  FOREIGN KEY (id_disabilita)
				REFERENCES Disabilita(id_disabilita)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  AssSettori (
  id_ass_progetti int(11)  AUTO_INCREMENT PRIMARY KEY,
  id_progetto int(11),
  id_settore int(11),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
  FOREIGN KEY (id_settore)
				REFERENCES Settori(id_settore)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  Missioni (
  id_missione int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  luogo varchar(64),
  note varchar(255),
  PRIMARY KEY (id_missione),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  Budjets (
  id_budjet int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  budjet_totale_cbm_italia float,
  speso_effettivo_cbm_italia float,
  budjet_totale float,
  budjet_residuo_effettivo float,
  PRIMARY KEY (id_budjet),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  Finanziatori (
  id_finanziatore int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  nome varchar(64),
  data_inizio_finanziamento date,
  data_fine_finanziamento date,
  importo float,
  telefono varchar(64),
  mail varchar(64),
  skype varchar(64),
  tipologia enum('privato','azienda','ente_istituzionale'),
  note varchar(255),
  PRIMARY KEY (id_finanziatore),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  GruppiBeneficiari (
  id_gruppo_beneficiario int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  anno_beneficiari int,
  donne boolean,
  uomini boolean,
  adulti boolean,
  bambini boolean,
  PRIMARY KEY (id_gruppo_beneficiario),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  PartnersLocali (
  id_partner_locale int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  nome varchar(64),
  anno_partnership int,
  ruolo varchar(64),
  sito_web varchar(64),
  tipologia enum('privato','azienda','ente_istituzionale'),
  note varchar(255),
  PRIMARY KEY (id_partner_locale),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  Donazioni (
  id_donazione int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  nominativo_donatore varchar(64),
  persona_di_riferimento varchar(64),
  data_donazione date,
  telefono varchar(64),
  mail varchar(64),
  position_number int (11),
  documento varchar(255),
  budjet_preventivo float,
  budjet_consuntivo float,
  tipologia enum('privato','azienda','ente_istituzionale'),
  note varchar(255),
  PRIMARY KEY (id_donazione),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  Contatti (
  id_contatto int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  nome varchar(64),
  telefono varchar(64),
  mail varchar(64),
  skype varchar(64),
  indirizzo varchar(64),
  note varchar(255),
  PRIMARY KEY (id_contatto),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);



CREATE TABLE  AssStrumenti (
  id_ass_strumento int(11) AUTO_INCREMENT PRIMARY KEY,
  id_progetto int(11),
  id_strumento int(11),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE,
  FOREIGN KEY (id_strumento)
				REFERENCES Strumenti(id_strumento)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);


CREATE TABLE  Strumenti (
  id_strumento int(11) AUTO_INCREMENT PRIMARY KEY,
  nome varchar(64)
);


CREATE TABLE  PuntiDiInteresse (
  id_punto_di_interesse int(11)  AUTO_INCREMENT,
  id_progetto int(11),
  nome varchar(64),
  mail varchar(64),
  note varchar(255),
  PRIMARY KEY (id_punto_di_interesse),
  FOREIGN KEY (id_progetto)
				REFERENCES Progetti(id_progetto)
				ON DELETE SET NULL
				ON UPDATE CASCADE
);

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO Disabilita (id_disabilita, tipologia, nome) VALUES
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


INSERT INTO Settori (id_settore, macro_settore, dettaglio_settore) VALUES
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


INSERT INTO Strumenti (id_strumento, nome) VALUES
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

INSERT INTO Progetti(id_progetto, titolo, codice_vecchio, data_inizio, data_fine, descrizione_testuale, emergenza_si_no, tipologia_geografica, luogo_geografico) VALUES
(1, 'ProgettoDiProva', 123, 2016-12-06, 2016-12-06, 'Descrizione testuale del progetto di prova', TRUE, 'nazionale', 'Congo');

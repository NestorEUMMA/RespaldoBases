-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: db_clinica
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bajalotes`
--

DROP TABLE IF EXISTS `bajalotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bajalotes` (
  `CodigoLote` varchar(45) NOT NULL,
  `Fecha` datetime NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  KEY `fk_bajavencimiento_usuario1_idx` (`IdUsuario`),
  CONSTRAINT `fk_bajavencimiento_usuario1_idx` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bajalotes`
--

LOCK TABLES `bajalotes` WRITE;
/*!40000 ALTER TABLE `bajalotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bajalotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCategoria` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Antibioticos'),(2,'Hipoglucemiantes'),(3,'Antihistaminicos'),(4,'Antihistaminicos'),(5,'Antipireticos'),(6,'Antitusivos'),(7,'Vitaminas'),(8,'Antiparasitarios'),(9,'Antiparasitarios'),(10,'Antiinflamatorios');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clase` (
  `IdClase` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la clase del estudio socio economico ',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Indica el nombre de la clase',
  `RangoIni` float DEFAULT NULL COMMENT 'Indica el rango inicial ',
  `RangoFin` float DEFAULT NULL COMMENT 'Indica el rango final ',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción de la clase del estudio socioeconomico ',
  `PorcentajeSubsidio` float DEFAULT NULL COMMENT 'Indica el porcentaje del subsidio a aplicar ',
  `Activo` bit(1) DEFAULT NULL COMMENT 'Indica el estado (activo o inactivo)',
  PRIMARY KEY (`IdClase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `IdConsulta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la consulta',
  `IdUsuario` int(11) DEFAULT NULL COMMENT 'Es el identificador del medico ',
  `IdPersona` int(11) DEFAULT NULL COMMENT 'Es el identificador de la persona (paciente)',
  `IdModulo` int(11) DEFAULT NULL COMMENT 'Es el identifiador del modulo o areas ',
  `Diagnostico` longtext COMMENT 'Diagnostico de la consulta ',
  `Comentarios` longtext COMMENT 'Comentarios extras de la consulta',
  `Otros` longtext COMMENT 'Espacio para anotaciones libres ',
  `IdEnfermedad` int(11) DEFAULT NULL COMMENT 'Es el identificador de la enfermedad',
  `FechaConsulta` date DEFAULT NULL COMMENT 'Indica la fecha de la consulta',
  `Activo` int(11) DEFAULT NULL,
  `IdEstado` int(2) DEFAULT NULL,
  `Status` int(2) DEFAULT NULL,
  `EstadoNutricional` longtext,
  `CirugiasPrevias` longtext,
  `MedicamentosActuales` longtext,
  `ExamenFisica` longtext,
  `PlanTratamiento` longtext,
  `FechaProxVisita` date DEFAULT NULL,
  `Alergias` longtext,
  PRIMARY KEY (`IdConsulta`),
  KEY `fk_tbl_consulta_tbl_persona1_idx` (`IdPersona`),
  KEY `fk_tbl_consulta_tbl_enfermedad1_idx` (`IdEnfermedad`),
  KEY `fk_tbl_consulta_Modulo1_idx` (`IdModulo`),
  KEY `fk_tbl_consulta_Estado1_idx` (`IdEstado`),
  CONSTRAINT `fk_tbl_consulta_Estado1` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_consulta_Modulo1` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_consulta_tbl_enfermedad1` FOREIGN KEY (`IdEnfermedad`) REFERENCES `enfermedad` (`IdEnfermedad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_consulta_tbl_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,4,2,3,NULL,NULL,NULL,NULL,'2018-10-16',0,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,2,3,' una enfermedad',' ',' ',4,'2018-10-18',0,2,1,'un estado ','una cirugia ',' ',' ',' ','2018-11-11','una alergia '),(3,4,2,3,' una enfermedad','  ','  ',4,'2018-10-18',0,2,1,'un estado ','una cirugia dental ',' ',' ','  ','2018-02-22','una alergia  '),(4,7,2,6,NULL,NULL,NULL,NULL,'2018-10-18',0,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,7,2,6,' una enfermedad','  ','  ',7,'2018-10-18',0,2,1,'estado nutricional ','ninguna ',' ',' ','  ','2018-12-12',' alergias'),(6,7,2,6,' UNA ENFERMEDAD','  ','  ',40,'2018-10-19',0,2,1,'ESTADO NUTRICIONAL ','NINGUNA ',' ',' ','  ','2018-12-30','ALERGIAS '),(7,4,2,6,' UNA ENFERMEDAD','  ','  ',15,'2018-10-19',0,2,1,'ESTADO NUTRICIONAL NORMA;L ','NINGUNA CIRUGIA ',' ',' ','  ','2019-02-18','SIN NINGUNA ALERGIA '),(8,4,2,5,NULL,NULL,NULL,NULL,'2018-11-29',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,4,2,5,'  una enfermedad','  ','  ',20,'2018-11-29',0,2,1,'estado nutricional  ','cirugias previas  ','  ','  ','  ','2019-01-10','alergias  '),(10,4,2,5,NULL,NULL,NULL,NULL,'2018-11-29',0,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,4,3,6,NULL,NULL,NULL,NULL,'2018-12-20',0,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,4,2,6,'  una enfermedad','Nada  ','  este es una prueba 12012019',7,'2019-01-11',0,2,1,'estado nutricional  ','ninguna  ','ningun medicamento tomado','examen fisica  ','  este es una prueba 12012019 tratamiento','2019-01-15','una alargia  '),(13,4,2,6,NULL,NULL,NULL,NULL,'2019-01-14',1,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultaindicador`
--

DROP TABLE IF EXISTS `consultaindicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultaindicador` (
  `IdConsulta` int(11) NOT NULL COMMENT 'Es el identificador de la consulta ',
  `IdEnfermedad` int(11) NOT NULL COMMENT 'Es el identificador de la enfermedad ',
  PRIMARY KEY (`IdConsulta`,`IdEnfermedad`),
  KEY `fk_tbl_consulta_indicador_tbl_enfermedad1_idx` (`IdEnfermedad`),
  CONSTRAINT `fk_tbl_consulta_indicador_tbl_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_consulta_indicador_tbl_enfermedad1` FOREIGN KEY (`IdEnfermedad`) REFERENCES `enfermedad` (`IdEnfermedad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultaindicador`
--

LOCK TABLES `consultaindicador` WRITE;
/*!40000 ALTER TABLE `consultaindicador` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultaindicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `IdEnfermedad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la enfermedad ',
  `Codigo` varchar(45) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL COMMENT 'Indica el nombre de la enfermedad ',
  `IdTipoDiagnostico` int(11) NOT NULL,
  `CodigoICD` varchar(45) DEFAULT NULL,
  `NombreTraduc` varchar(45) NOT NULL,
  PRIMARY KEY (`IdEnfermedad`),
  KEY `fk_enfermedad_tipoDiagnostico_idx` (`IdTipoDiagnostico`),
  CONSTRAINT `fk_enfermedad_tipoDiagnostico1` FOREIGN KEY (`IdTipoDiagnostico`) REFERENCES `tipodiagnostico` (`IdTipoDiagnostico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
INSERT INTO `enfermedad` VALUES (4,'12540',7,'Aborto',1,'123-456-789','Miscarriage'),(5,'12536',3,'Afeccion de la vista',1,'123-456-789','Eye complaints'),(6,'12539',6,'Afeccion Ginecologica',1,'123-456-789','Gynecological complaints'),(7,'12560',27,'Afecciones Bucales',1,'123-456-789','Oral/mouth complaints'),(8,'12553',20,'Afecciones Cardiacas',1,'123-456-789','Cardiac complaints'),(9,'12695',35,'Afecciones de columna',1,'123-456-789','Back/spinal complaints'),(10,'12546',13,'Afecciones de la piel',1,'123-456-789','Skin complaints'),(11,'12561',28,'Afecciones del sistema Venoso',1,'123-456-789','Circulatory complaints'),(12,'12559',26,'Afecciones Endocrinas',1,'123-456-789','Endocrine complaints'),(13,'12563',30,'Afecciones Psicologicas y Psiquiatricas',1,'123-456-789','Psychological/psychiatric complaints'),(14,'12694',34,'Amputaciones',1,'123-456-789','Amputations'),(15,'12552',19,'Aparato Genitourinario',1,'123-456-789','Genitalurinary system'),(16,'12538',5,'Desnutricion',1,'123-456-789','Malnutrition'),(17,'12544',11,'Disfunciones Organicas',1,'123-456-789','Organic disfunctions'),(18,'12550',17,'Dolores Diversos',1,'123-456-789','Pain'),(19,'12555',22,'Embarazo',1,'123-456-789','Pregnancy'),(20,'12541',8,'Enfermedades Infecto Contagiosas',1,'123-456-789','Infectious disease'),(21,'12545',12,'Enfermedades Artriticas',1,'123-456-789','Arthritic illness'),(22,'12562',29,'Enfermedades Carenciales',1,'123-456-789',''),(23,'12692',32,'Enfermedades del sistema musculo esqueletico',1,'123-456-789',''),(24,'12543',10,'Enfermedades Venereas',1,'123-456-789',''),(25,'12564',31,'Fallecimientos',1,'123-456-789',''),(26,'12548',15,'Heridas y Traumatismos',1,'123-456-789',''),(27,'12696',36,'Hernias',1,'123-456-789',''),(28,'12542',9,'Infecciones Diversas',1,'123-456-789',''),(29,'12551',18,'Intoxicaciones',1,'123-456-789',''),(30,'12693',33,'Lesion de nervios perifericos',1,'123-456-789',''),(31,'12535',2,'Oido, Nariz y Garganta',1,'123-456-789',''),(32,'12547',14,'Parasitismo',1,'123-456-789',''),(33,'12680',0,'Persona Sana',1,'123-456-789',''),(34,'12556',23,'Planificacion Familiar',1,'123-456-789',''),(35,'12549',16,'Procesos Febril no determinado ',1,'123-456-789',''),(36,'12557',24,'Quemaduras',1,'123-456-789',''),(37,'12554',21,'Sistema Nervioso',1,'123-456-789',''),(38,'12558',25,'Tumores',1,'123-456-789',''),(39,'12537',4,'Vias Digestivas',1,'123-456-789',''),(40,'12534',1,'Vias Respiratorias',1,'123-456-789',''),(41,'12604',94,'Accidentes de Trabajo',2,'123-456-789',''),(42,'12669',166,'Alcoholismo',2,'123-456-789',''),(43,'12612',106,'Amibiasis',2,'123-456-789',''),(44,'12668',165,'Ansiedad',2,'123-456-789',''),(45,'12653',149,'Bocio Endemico',2,'123-456-789',''),(46,'12644',140,'Brucelosis',2,'123-456-789',''),(47,'12594',63,'Cancer Cervico-Uterino',2,'123-456-789',''),(48,'12646',142,'Cancer mamario',2,'123-456-789',''),(49,'12626',120,'Candidiasis de vulva y vagina',2,'123-456-789',''),(50,'12643',139,'Carbunco (ANTRAX)',2,'123-456-789',''),(51,'12624',118,'Chancro blando',2,'123-456-789',''),(52,'12575',15,'Colera',2,'123-456-789',''),(53,'12622',116,'Condiloma acuminado',2,'123-456-789',''),(54,'12633',128,'Conjuntivitis bacteriana agud',2,'123-456-789',''),(55,'12583',39,'Conjuntivitis Hemorragica',2,'123-456-789',''),(56,'12586',48,'Dengue Clasico',2,'123-456-789',''),(57,'12587',49,'Dengue Hemorragico',2,'123-456-789',''),(58,'12667',164,'Depresion',2,'123-456-789',''),(59,'12656',152,'Desnutri proteicocal Leve',2,'123-456-789',''),(60,'12655',151,'Desnutri proteicocal Modera',2,'123-456-789',''),(61,'12654',150,'Desnutri proteicocal Severa',2,'123-456-789',''),(62,'12652',148,'Diabetes Mellitus',2,'123-456-789',''),(63,'12619',113,'Diarrea Enteritis y Gastroenteritis',2,'123-456-789',''),(64,'12607',1,'Difteria',2,'123-456-789',''),(65,'12679',135,'Encefalitis viral no especifi',2,'123-456-789',''),(66,'12637',132,'Enferm Virica de Marburg y E',2,'123-456-789',''),(67,'12638',133,'Enferm de chagas aguda',2,'123-456-789',''),(68,'12640',136,'Fiebre amarilla',2,'123-456-789',''),(69,'12588',50,'Fiebre Equina Venezolana',2,'123-456-789',''),(70,'12576',17,'Fiebre Tifoidea',2,'123-456-789',''),(71,'12613',107,'Giardiasis',2,'123-456-789',''),(72,'12645',141,'Hanta Virus',2,'123-456-789',''),(73,'12681',177,'Helmintiasis',2,'123-456-789',''),(74,'12571',9,'Hepatitis Aguda B',2,'123-456-789',''),(75,'12572',10,'Hepatitis Aguda Viral A',2,'123-456-789',''),(76,'12671',168,'Herida x arma blanca',2,'123-456-789',''),(77,'12670',167,'Herida x arma de fuego',2,'123-456-789',''),(78,'12621',115,'Herpes Genital',2,'123-456-789',''),(79,'12595',67,'Hipertension Arterial',2,'123-456-789',''),(80,'12630',125,'Infecc Aguda VRespira Sup',2,'123-456-789',''),(81,'12577',27,'Infeccion Gonococ Tracto GU',2,'123-456-789',''),(82,'12578',28,'Infeccion VIH',2,'123-456-789',''),(83,'12682',178,'Influenza',2,'123-456-789',''),(84,'12651',147,'Insuficiencia renal cronica',2,'123-456-789',''),(85,'12665',162,'Intento de Suicidio (Conducta Suicida)',2,'123-456-789',''),(86,'12685',181,'Intoxicacion Alimentaria Aguda',2,'123-456-789',''),(87,'12589',53,'Leishmaniasis',2,'123-456-789',''),(88,'12584',45,'Lepra',2,'123-456-789',''),(89,'12592',60,'Leptospirosis',2,'123-456-789',''),(90,'12623',117,'Linfogranuloma venereo',2,'123-456-789',''),(91,'12686',182,'Maltrato Fisico',2,'123-456-789',''),(92,'12582',35,'Meningitis Meningococica',2,'123-456-789',''),(93,'12565',2,'Meningitis Tuberculosa',2,'123-456-789',''),(94,'12627',121,'Meningitis x hemofilos',2,'123-456-789',''),(95,'12599',82,'Mordedura por Animales Rabioso',2,'123-456-789',''),(96,'12664',161,'Mordedura x Serpiente Venenosa',2,'123-456-789',''),(97,'12683',179,'Neumonias',2,'123-456-789',''),(98,'12590',55,'Paludismo',2,'123-456-789',''),(99,'12566',4,'Paralisis Flacida',2,'123-456-789',''),(100,'12573',11,'Parotiditis infecciosa',2,'123-456-789',''),(101,'12663',160,'Picadura x Abeja africanizada',2,'123-456-789',''),(102,'12600',84,'Por Vehiculo Automotor',2,'123-456-789',''),(103,'12593',61,'Rabia Humana',2,'123-456-789',''),(104,'12611',105,'Rubeola congenita',2,'123-456-789',''),(105,'12574',12,'Rubeola',2,'123-456-789',''),(106,'12580',32,'SΦilis Congenita',2,'123-456-789',''),(107,'12567',5,'Sarampion',2,'123-456-789',''),(108,'12579',30,'SIDA ',2,'123-456-789',''),(109,'12620',114,'Sifilis adquirida y no espec',2,'123-456-789',''),(110,'12684',180,'Sindrome Respiratorio Agudo Severo (SARS)',2,'123-456-789',''),(111,'12610',104,'Tetanos Neonatal',2,'123-456-789',''),(112,'12568',6,'Tetanos',2,'123-456-789',''),(113,'12641',137,'Tifus Epidemico',2,'123-456-789',''),(114,'12569',7,'Tos ferina',2,'123-456-789',''),(115,'12601',88,'Trastornos x Drogo Dependencia',2,'123-456-789',''),(116,'12625',119,'Tricomoniasis Urogenital',2,'123-456-789',''),(117,'12570',8,'Tuberculosis Pulmonar',2,'123-456-789',''),(118,'12585',47,'Varicela',2,'123-456-789',''),(119,'12603',93,'Violacion Sexual',2,'123-456-789','');
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeriaprocedimiento`
--

DROP TABLE IF EXISTS `enfermeriaprocedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermeriaprocedimiento` (
  `IdEnfermeriaProcedimiento` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  `FechaProcedimiento` date DEFAULT NULL,
  `Observaciones` longtext,
  `IdMotivoProcedimiento` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdModulo` int(11) NOT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdEnfermeriaProcedimiento`),
  KEY `fk_enfermeriaprocedimiento_movimientoprocedimiento1_idx` (`IdMotivoProcedimiento`),
  KEY `fk_enfermeriaprocedimiento_persona1_idx` (`IdPersona`),
  KEY `fk_enfermeriaprocedimiento_usuario1_idx` (`IdUsuario`),
  KEY `fk_enfermeriaprocedimiento_modulo1_idx` (`IdModulo`),
  CONSTRAINT `fk_enfermeriaprocedimiento_modulo1` FOREIGN KEY (`IdModulo`) REFERENCES `modulo` (`IdModulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermeriaprocedimiento_movimientoprocedimiento1` FOREIGN KEY (`IdMotivoProcedimiento`) REFERENCES `motivoprocedimiento` (`IdMotivoProcedimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermeriaprocedimiento_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermeriaprocedimiento_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeriaprocedimiento`
--

LOCK TABLES `enfermeriaprocedimiento` WRITE;
/*!40000 ALTER TABLE `enfermeriaprocedimiento` DISABLE KEYS */;
INSERT INTO `enfermeriaprocedimiento` VALUES (1,2,'2018-10-18',' Se suturo la pierna',6,3,5,'2'),(6,2,'2018-12-06',' No tenia nada!',1,1,5,'2');
/*!40000 ALTER TABLE `enfermeriaprocedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas` (
  `IdUsuario` int(11) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `IdMovimiento` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  KEY `fk_entradas_usuario1_idx` (`IdUsuario`),
  KEY `fk_entradas_medicamento1_idx` (`IdMedicamento`),
  KEY `fk_entradas_movimiento1_idx` (`IdMovimiento`),
  CONSTRAINT `fk_entradas_medicamentos1_idx` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entradas_movimientos1_idx` FOREIGN KEY (`IdMovimiento`) REFERENCES `movimientos` (`IdMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_entradas_usuario1_idx` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `IdEstado` int(11) NOT NULL AUTO_INCREMENT,
  `NombreEstado` varchar(45) NOT NULL,
  PRIMARY KEY (`IdEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'SIN CONSULTA'),(2,'CONSULTA (PROCESO COMPLETO)'),(3,'EXAMENES LABORATORIO (SIN CONSULTA PREVIA)'),(4,'ENFERMERIA (PROCEDIMIENTOS)'),(5,'SIGNOS VITALES'),(6,'CONSULTA MEDICA');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocivil` (
  `IdEstadoCivil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador del estado civil ',
  `Nombre` varchar(50) DEFAULT NULL COMMENT 'Indica el nombre del estado civil ',
  PRIMARY KEY (`IdEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'Soltero'),(2,'Casado'),(3,'Divorciado');
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenesvarios`
--

DROP TABLE IF EXISTS `examenesvarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examenesvarios` (
  `IdExamenesVarios` int(11) NOT NULL AUTO_INCREMENT,
  `IdListaExamen` int(11) NOT NULL,
  `IdTipoExamen` int(11) NOT NULL,
  `IdConsulta` int(11) DEFAULT NULL,
  `IdPersona` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Resultado` varchar(5000) DEFAULT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`IdExamenesVarios`,`IdTipoExamen`,`IdPersona`,`IdUsuario`,`IdListaExamen`),
  KEY `fk_examenesVarios_tipoExamen1_idx` (`IdTipoExamen`),
  KEY `fk_examenesVarios_persona1_idx` (`IdPersona`),
  KEY `fk_examenesVarios_usuario1_idx` (`IdUsuario`),
  KEY `fk_examenesVarios_consulta1_idx` (`IdConsulta`),
  KEY `fk_examenesVarios_listaexamen1_idx` (`IdListaExamen`),
  CONSTRAINT `fk:examenesVarios_listaExamen` FOREIGN KEY (`IdListaExamen`) REFERENCES `listaexamen` (`IdListaExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenesVarios_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenesVarios_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenesVarios_tipoExamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenesVarios_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenesvarios`
--

LOCK TABLES `examenesvarios` WRITE;
/*!40000 ALTER TABLE `examenesvarios` DISABLE KEYS */;
INSERT INTO `examenesvarios` VALUES (1,18,5,NULL,2,1,'2019-01-11 11:12:31','examenes varios 2019',1);
/*!40000 ALTER TABLE `examenesvarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenheces`
--

DROP TABLE IF EXISTS `examenheces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examenheces` (
  `IdExamenHeces` int(11) NOT NULL AUTO_INCREMENT,
  `IdListaExamen` int(11) NOT NULL,
  `IdTipoExamen` int(11) NOT NULL,
  `IdConsulta` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Color` varchar(45) DEFAULT NULL,
  `Consistencia` varchar(45) DEFAULT NULL,
  `Mucus` varchar(45) DEFAULT NULL,
  `Hematies` varchar(45) DEFAULT NULL,
  `Leucocitos` varchar(45) DEFAULT NULL,
  `RestosAlimenticios` varchar(45) DEFAULT NULL,
  `Macrocopicos` varchar(45) DEFAULT NULL,
  `Microscopicos` varchar(45) DEFAULT NULL,
  `FloraBacteriana` varchar(45) DEFAULT NULL,
  `Otros` varchar(45) DEFAULT NULL,
  `PActivos` varchar(45) DEFAULT NULL,
  `PQuistes` varchar(45) DEFAULT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`IdExamenHeces`,`IdListaExamen`,`IdTipoExamen`,`IdUsuario`,`IdPersona`),
  KEY `fk_examenHeces_tipoExamen1_idx` (`IdTipoExamen`),
  KEY `fk_examenHeces_usuario1_idx` (`IdUsuario`),
  KEY `fk_examenHeces_persona1_idx` (`IdPersona`),
  KEY `fk_examenHeces_consulta1_idx` (`IdConsulta`),
  KEY `fk_examenHeces_listaExamen1_idx` (`IdListaExamen`),
  CONSTRAINT `fk_examenHeces_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHeces_listaExamen1` FOREIGN KEY (`IdListaExamen`) REFERENCES `listaexamen` (`IdListaExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHeces_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHeces_tipoExamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHeces_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenheces`
--

LOCK TABLES `examenheces` WRITE;
/*!40000 ALTER TABLE `examenheces` DISABLE KEYS */;
INSERT INTO `examenheces` VALUES (1,1,2,1,5,2,'2018-10-18','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL',1);
/*!40000 ALTER TABLE `examenheces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenhemograma`
--

DROP TABLE IF EXISTS `examenhemograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examenhemograma` (
  `IdExamenHemograma` int(11) NOT NULL AUTO_INCREMENT,
  `IdListaExamen` int(11) NOT NULL,
  `IdTipoExamen` int(11) NOT NULL,
  `IdConsulta` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `GlobulosRojos` varchar(45) DEFAULT NULL,
  `Hemoglobina` varchar(45) DEFAULT NULL,
  `Hematocrito` varchar(45) DEFAULT NULL,
  `Vgm` varchar(45) DEFAULT NULL,
  `Hcm` varchar(45) DEFAULT NULL,
  `Chcm` varchar(45) DEFAULT NULL,
  `Leucocitos` varchar(45) DEFAULT NULL,
  `NeutrofilosEnBanda` varchar(45) DEFAULT NULL,
  `Linfocitos` varchar(45) DEFAULT NULL,
  `Monocitos` varchar(45) DEFAULT NULL,
  `Eosinofilos` varchar(45) DEFAULT NULL,
  `Basofilos` varchar(45) DEFAULT NULL,
  `Plaquetas` varchar(45) DEFAULT NULL,
  `Eritrosedimentacion` varchar(45) DEFAULT NULL,
  `Otros` varchar(45) DEFAULT NULL,
  `NeutrofilosSegmentados` varchar(45) DEFAULT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`IdExamenHemograma`,`IdListaExamen`,`IdTipoExamen`,`IdUsuario`,`IdPersona`),
  KEY `fk_examenHemograma_persona1_idx` (`IdPersona`),
  KEY `fk_examenHemograma_usuario1_idx` (`IdUsuario`),
  KEY `fk_examenHemograma_tipoExamen1_idx` (`IdTipoExamen`),
  KEY `fk_examenHemograma_consulta1` (`IdConsulta`),
  KEY `fk_examenHemograma_listaExamen1` (`IdListaExamen`),
  CONSTRAINT `fk_examenHemograma_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHemograma_listaExamen1` FOREIGN KEY (`IdListaExamen`) REFERENCES `listaexamen` (`IdListaExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHemograma_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHemograma_tipoExamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenHemograma_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenhemograma`
--

LOCK TABLES `examenhemograma` WRITE;
/*!40000 ALTER TABLE `examenhemograma` DISABLE KEYS */;
INSERT INTO `examenhemograma` VALUES (1,2,1,NULL,5,2,'2018-10-18','','','','','','','','','','','','','','','','',1),(2,3,1,NULL,5,2,'2018-10-18','Globulos Rojos','Homoglobina','Hematocrito','VGM','HCM','CHCM','LEUCOCITOS','NEUTROFILOS','LINFOCITOS','MONOCITOS','EOSINOFILOS','BASOFILOS','PLAQUETAS','ERITROSE','OTROS','NEUTROFI',1),(3,5,1,7,1,2,'2019-01-11','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','ESTA ES UNA PRUEBA','2019',1),(4,16,1,9,1,2,'2019-01-11','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','2019 - 1','ESTA ES UNA PRUEBA 2019 - 1','2019 - 1',1);
/*!40000 ALTER TABLE `examenhemograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenorina`
--

DROP TABLE IF EXISTS `examenorina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examenorina` (
  `IdExamenOrina` int(11) NOT NULL AUTO_INCREMENT,
  `IdListaExamen` int(11) NOT NULL,
  `IdTipoExamen` int(11) NOT NULL,
  `IdConsulta` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Color` varchar(45) DEFAULT NULL,
  `Olor` varchar(45) DEFAULT NULL,
  `Aspecto` varchar(45) DEFAULT NULL,
  `Densidad` varchar(45) DEFAULT NULL,
  `Ph` varchar(45) DEFAULT NULL,
  `Proteinas` varchar(45) DEFAULT NULL,
  `Glucosa` varchar(45) DEFAULT NULL,
  `SagreOculta` varchar(45) DEFAULT NULL,
  `CuerposCetomicos` varchar(45) DEFAULT NULL,
  `Urobilinogeno` varchar(45) DEFAULT NULL,
  `Bilirrubina` varchar(45) DEFAULT NULL,
  `EsterasaLeucocitaria` varchar(45) DEFAULT NULL,
  `Cilindros` varchar(45) DEFAULT NULL,
  `Hematies` varchar(45) DEFAULT NULL,
  `Leucocitos` varchar(45) DEFAULT NULL,
  `CelulasEpiteliales` varchar(45) DEFAULT NULL,
  `ElementosMinerales` varchar(45) DEFAULT NULL,
  `Parasitos` varchar(45) DEFAULT NULL,
  `Observaciones` varchar(5000) DEFAULT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`IdExamenOrina`,`IdListaExamen`,`IdTipoExamen`,`IdUsuario`,`IdPersona`),
  KEY `fk_examenOrina_tipoExamen1_idx` (`IdTipoExamen`),
  KEY `fk_examenOrina_persona1_idx` (`IdPersona`),
  KEY `fk_examenOrina_usuario1_idx` (`IdUsuario`),
  KEY `fk_examenOrina_consulta1_idx` (`IdConsulta`),
  KEY `fk_examenOrina_listaExamen_idx` (`IdListaExamen`),
  CONSTRAINT `fk_examenOrina_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenOrina_listaExamen1` FOREIGN KEY (`IdListaExamen`) REFERENCES `listaexamen` (`IdListaExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenOrina_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenOrina_tipoExamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenOrina_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenorina`
--

LOCK TABLES `examenorina` WRITE;
/*!40000 ALTER TABLE `examenorina` DISABLE KEYS */;
INSERT INTO `examenorina` VALUES (1,4,3,6,5,2,'2018-10-19','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NORMAL','NOARMAL','NORMAL','NORMAL','NOARMAL','NORMAL','NORMAL','','','','','','','',1),(2,15,3,9,1,2,'2019-01-11','2018','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','2019','OTROS 2019',1);
/*!40000 ALTER TABLE `examenorina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenquimica`
--

DROP TABLE IF EXISTS `examenquimica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examenquimica` (
  `IdExamenQuimica` int(11) NOT NULL AUTO_INCREMENT,
  `IdListaExamen` int(11) NOT NULL,
  `IdTipoExamen` int(11) NOT NULL,
  `IdConsulta` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Glucosa` varchar(45) DEFAULT NULL,
  `GlucosaPost` varchar(45) DEFAULT NULL,
  `ColesterolTotal` varchar(45) DEFAULT NULL,
  `Triglicerido` varchar(45) DEFAULT NULL,
  `AcidoUrico` varchar(45) DEFAULT NULL,
  `Creatinina` varchar(45) DEFAULT NULL,
  `NitrogenoUreico` varchar(45) DEFAULT NULL,
  `Urea` varchar(45) DEFAULT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`IdExamenQuimica`,`IdListaExamen`,`IdTipoExamen`,`IdUsuario`,`IdPersona`),
  KEY `fk_examenQuimica_tipoExamen1_idx` (`IdTipoExamen`),
  KEY `fk_examenQuimica_persona1_idx` (`IdPersona`),
  KEY `fk_examenQuimica_usuario1_idx` (`IdUsuario`),
  KEY `fk_examenQuimica_consulta1_idx` (`IdConsulta`),
  KEY `fk_examenQuimica_listaExamen1_idx` (`IdListaExamen`),
  CONSTRAINT `fk_examenQuimica_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenQuimica_tipoExamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_examenQuimica_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `k_examenQuimica_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `k_examenQuimica_listaExamen1` FOREIGN KEY (`IdListaExamen`) REFERENCES `listaexamen` (`IdListaExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenquimica`
--

LOCK TABLES `examenquimica` WRITE;
/*!40000 ALTER TABLE `examenquimica` DISABLE KEYS */;
INSERT INTO `examenquimica` VALUES (1,17,4,9,1,2,'2019-01-11 00:00:00','123','12','123','123','132','312','12','132',1),(3,19,4,NULL,1,2,'2019-01-12 09:24:42','','','','','','','','',1);
/*!40000 ALTER TABLE `examenquimica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factor`
--

DROP TABLE IF EXISTS `factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factor` (
  `IdFactor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador del factor socioeconomico ',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Indica el nombre del factor ',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción del factor ',
  `Ponderacion` float DEFAULT NULL COMMENT 'Indica la ponderación del factor ',
  `Activo` bit(1) DEFAULT NULL COMMENT 'Indica el estado (activo o inactivo)',
  PRIMARY KEY (`IdFactor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factor`
--

LOCK TABLES `factor` WRITE;
/*!40000 ALTER TABLE `factor` DISABLE KEYS */;
INSERT INTO `factor` VALUES (1,'Socioeconómico','Test Socioeconómico',0,''),(2,'Historial clinico','Historial Clinico',0,''),(3,'Vacunación','Vacunación',0,'');
/*!40000 ALTER TABLE `factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geografia`
--

DROP TABLE IF EXISTS `geografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geografia` (
  `IdGeografia` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'Es el identificador de la zona geografica ',
  `Nombre` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'Indica el nombre de la zona geografica ',
  `IdPadre` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Es el identificador del padre de la zona ',
  `Nivel` int(11) NOT NULL COMMENT 'Indica el nivel de la zona ',
  `Jerarquia` varchar(900) CHARACTER SET utf8 NOT NULL COMMENT 'Indica la jerarquia de la zona ',
  PRIMARY KEY (`IdGeografia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geografia`
--

LOCK TABLES `geografia` WRITE;
/*!40000 ALTER TABLE `geografia` DISABLE KEYS */;
INSERT INTO `geografia` VALUES ('0','Geografia No Definida','NULL',0,'.0.'),('01','AHUACHAPAN','3',1,'.3.01.'),('0101','AHUACHAPAN','01',2,'.3.01.0101.'),('0102','APANECA','01',2,'.3.01.0102.'),('0103','ATIQUIZAYA','01',2,'.3.01.0103.'),('0104','CONCEPCION DE ATACO','01',2,'.3.01.0104.'),('0105','EL REFUGIO','01',2,'.3.01.0105.'),('0106','GUAYMANGO','01',2,'.3.01.0106.'),('0107','JUJUTLA','01',2,'.3.01.0107.'),('0108','SAN FRANCISCO MENENDEZ','01',2,'.3.01.0108.'),('0109','SAN LORENZO','01',2,'.3.01.0109.'),('0110','SAN PEDRO PUXTLA','01',2,'.3.01.0110.'),('0111','TACUBA','01',2,'.3.01.0111.'),('0112','TURIN','01',2,'.3.01.0112.'),('02','SANTA ANA','3',1,'.3.02.'),('0201','SANTA ANA','02',2,'.3.02.0201.'),('0202','CANDELARIA DE LA FRONTERA','02',2,'.3.02.0202.'),('0203','COATEPEQUE','02',2,'.3.02.0203.'),('0204','CHALCHUAPA','02',2,'.3.02.0204.'),('0205','EL CONGO','02',2,'.3.02.0205.'),('0206','EL PORVENIR','02',2,'.3.02.0206.'),('0207','MASAHUAT','02',2,'.3.02.0207.'),('0208','METAPAN','02',2,'.3.02.0208.'),('0209','SAN ANTONIO PAJONAL','02',2,'.3.02.0209.'),('0210','SAN SEBASTIAN SALITRILLO','02',2,'.3.02.0210.'),('0211','SANTA ROSA GUACHIPILIN','02',2,'.3.02.0211.'),('0212','SANTIAGO DE LA FRONTERA','02',2,'.3.02.0212.'),('0213','TEXISTEPEQUE','02',2,'.3.02.0213.'),('03','SONSONATE','3',1,'.3.03.'),('0301','SONSONATE','03',2,'.3.03.0301.'),('0302','ACAJUTLA','03',2,'.3.03.0302.'),('0303','ARMENIA','03',2,'.3.03.0303.'),('0304','CALUCO','03',2,'.3.03.0304.'),('0305','CUISNAHUAT','03',2,'.3.03.0305.'),('0306','IZALCO','03',2,'.3.03.0306.'),('0307','JUAYUA','03',2,'.3.03.0307.'),('0308','NAHUIZALCO','03',2,'.3.03.0308.'),('0309','NAHUILINGO','03',2,'.3.03.0309.'),('0310','SALCOATITAN','03',2,'.3.03.0310.'),('0311','SAN ANTONIO DEL MONTE','03',2,'.3.03.0311.'),('0312','SAN JULIAN','03',2,'.3.03.0312.'),('0313','SANTA CATARINA MASAHUAT','03',2,'.3.03.0313.'),('0314','SANTA ISABEL ISHUATAN','03',2,'.3.03.0314.'),('0315','SANTO DOMINGO DE GUZMAN','03',2,'.3.03.0315.'),('0316','SONZACATE','03',2,'.3.03.0316.'),('04','CHALATENANGO','1',1,'.1.04.'),('0401','CHALATENANGO','04',2,'.1.04.0401.'),('0402','AGUA CALIENTE','04',2,'.1.04.0402.'),('0403','ARCATAO','04',2,'.1.04.0403.'),('0404','AZACUALPA','04',2,'.1.04.0404.'),('0405','CANCASQUE','04',2,'.1.04.0405.'),('0406','CITALA','04',2,'.1.04.0406.'),('0407','COMALAPA','04',2,'.1.04.0407.'),('0408','CONCEPCION QUEZALTEPEQUE','04',2,'.1.04.0408.'),('0409','DULCE NOMBRE DE MARIA','04',2,'.1.04.0409.'),('0410','EL CARRIZAL','04',2,'.1.04.0410.'),('0411','EL PARAISO','04',2,'.1.04.0411.'),('0412','LA LAGUNA','04',2,'.1.04.0412.'),('0413','LA PALMA','04',2,'.1.04.0413.'),('0414','LA REINA','04',2,'.1.04.0414.'),('0415','LAS FLORES','04',2,'.1.04.0415.'),('0416','LAS VUELTAS','04',2,'.1.04.0416.'),('0417','NOMBRE DE JESUS','04',2,'.1.04.0417.'),('0418','NUEVA CONCEPCION','04',2,'.1.04.0418.'),('0419','NUEVA TRINIDAD','04',2,'.1.04.0419.'),('0420','OJOS DE AGUA','04',2,'.1.04.0420.'),('0421','POTONICO','04',2,'.1.04.0421.'),('0422','SAN ANTONIO DE LA CRUZ','04',2,'.1.04.0422.'),('0423','SAN ANTONIO DE LOS RANCHOS','04',2,'.1.04.0423.'),('0424','SAN FERNANDO','04',2,'.1.04.0424.'),('0425','SAN FRANCISCO LEMPA','04',2,'.1.04.0425.'),('0426','SAN FRANCISCO MORAZAN','04',2,'.1.04.0426.'),('0427','SAN IGNACIO','04',2,'.1.04.0427.'),('0428','SAN ISIDRO LABRADOR','04',2,'.1.04.0428.'),('0429','SAN LUIS DEL CARMEN','04',2,'.1.04.0429.'),('0430','SAN MIGUEL DE MERCEDES','04',2,'.1.04.0430.'),('0431','SAN RAFAEL','04',2,'.1.04.0431.'),('0432','SANTA RITA','04',2,'.1.04.0432.'),('0433','TEJUTLA','04',2,'.1.04.0433.'),('05','LA LIBERTAD','1',1,'.1.05.'),('0501','SANTA TECLA','05',2,'.1.05.0501.'),('0502','ANTIGUO CUSCATLAN','05',2,'.1.05.0502.'),('0503','CIUDAD ARCE','05',2,'.1.05.0503.'),('0504','COLON','05',2,'.1.05.0504.'),('0505','COMASAGUA','05',2,'.1.05.0505.'),('0506','CHILTIUPAN','05',2,'.1.05.0506.'),('0507','HUIZUCAR','05',2,'.1.05.0507.'),('0508','JAYAQUE','05',2,'.1.05.0508.'),('0509','JICALAPA','05',2,'.1.05.0509.'),('0510','LA LIBERTAD','05',2,'.1.05.0510.'),('0511','NUEVO CUSCATLAN','05',2,'.1.05.0511.'),('0512','SAN JUAN OPICO','05',2,'.1.05.0512.'),('0513','QUEZALTEPEQUE','05',2,'.1.05.0513.'),('0514','SACACOYO','05',2,'.1.05.0514.'),('0515','SAN JOSE VILLANUEVA','05',2,'.1.05.0515.'),('0516','SAN MATIAS','05',2,'.1.05.0516.'),('0517','SAN PABLO TACACHICO','05',2,'.1.05.0517.'),('0518','TALNIQUE','05',2,'.1.05.0518.'),('0519','TAMANIQUE','05',2,'.1.05.0519.'),('0520','TEOTEPEQUE','05',2,'.1.05.0520.'),('0521','TEPECOYO','05',2,'.1.05.0521.'),('0522','ZARAGOZA','05',2,'.1.05.0522.'),('06','SAN SALVADOR','1',1,'.1.06.'),('0601','SAN SALVADOR','06',2,'.1.06.0601.'),('0602','AGUILARES','06',2,'.1.06.0602.'),('0603','APOPA','06',2,'.1.06.0603.'),('0604','AYUTUXTEPEQUE','06',2,'.1.06.0604.'),('0605','CUSCATANCINGO','06',2,'.1.06.0605.'),('0606','CIUDAD DELGADO','06',2,'.1.06.0606.'),('0607','EL PAISNAL','06',2,'.1.06.0607.'),('0608','GUAZAPA','06',2,'.1.06.0608.'),('0609','ILOPANGO','06',2,'.1.06.0609.'),('0610','MEJICANOS','06',2,'.1.06.0610.'),('0611','NEJAPA','06',2,'.1.06.0611.'),('0612','PANCHIMALCO','06',2,'.1.06.0612.'),('0613','ROSARIO DE MORA','06',2,'.1.06.0613.'),('0614','SAN MARCOS','06',2,'.1.06.0614.'),('0615','SAN MARTIN','06',2,'.1.06.0615.'),('0616','SANTIAGO TEXACUANGOS','06',2,'.1.06.0616.'),('0617','SANTO TOMAS','06',2,'.1.06.0617.'),('0618','SOYAPANGO','06',2,'.1.06.0618.'),('0619','TONACATEPEQUE','06',2,'.1.06.0619.'),('07','CUSCATLAN','4',1,'.4.07.'),('0701','COJUTEPEQUE','07',2,'.4.07.0701.'),('0702','CANDELARIA','07',2,'.4.07.0702.'),('0703','EL CARMEN','07',2,'.4.07.0703.'),('0704','EL ROSARIO','07',2,'.4.07.0704.'),('0705','MONTE SAN JUAN','07',2,'.4.07.0705.'),('0706','ORATORIO DE CONCEPCION','07',2,'.4.07.0706.'),('0707','SAN BARTOLOME PERULAPIA','07',2,'.4.07.0707.'),('0708','SAN CRISTOBAL','07',2,'.4.07.0708.'),('0709','SAN JOSE GUAYABAL','07',2,'.4.07.0709.'),('0710','SAN PEDRO PERULAPAN','07',2,'.4.07.0710.'),('0711','SAN RAFAEL CEDROS','07',2,'.4.07.0711.'),('0712','SAN RAMON','07',2,'.4.07.0712.'),('0713','SANTA CRUZ ANALQUITO','07',2,'.4.07.0713.'),('0714','SANTA CRUZ MICHAPA','07',2,'.4.07.0714.'),('0715','SUCHITOTO','07',2,'.4.07.0715.'),('0716','TENANCINGO','07',2,'.4.07.0716.'),('08','LA PAZ','4',1,'.4.08.'),('0801','ZACATECOLUCA','08',2,'.4.08.0801.'),('0802','CUYULTITAN','08',2,'.4.08.0802.'),('0803','EL ROSARIO','08',2,'.4.08.0803.'),('0804','JERUSALEN','08',2,'.4.08.0804.'),('0805','MERCEDES LA CEIBA','08',2,'.4.08.0805.'),('0806','OLOCUILTA','08',2,'.4.08.0806.'),('0807','PARAISO DE OSORIO','08',2,'.4.08.0807.'),('0808','SAN ANTONIO MASAHUAT','08',2,'.4.08.0808.'),('0809','SAN EMIGDIO','08',2,'.4.08.0809.'),('0810','SAN FRANCISCO CHINAMECA','08',2,'.4.08.0810.'),('0811','SAN JUAN NONUALCO','08',2,'.4.08.0811.'),('0812','SAN JUAN TALPA','08',2,'.4.08.0812.'),('0813','SAN JUAN TEPEZONTES','08',2,'.4.08.0813.'),('0814','SAN LUIS TALPA','08',2,'.4.08.0814.'),('0815','SAN LUIS LA HERRADURA','08',2,'.4.08.0815.'),('0816','SAN MIGUEL TEPEZONTES','08',2,'.4.08.0816.'),('0817','SAN PEDRO MASAHUAT','08',2,'.4.08.0817.'),('0818','SAN PEDRO NONUALCO','08',2,'.4.08.0818.'),('0819','SAN RAFAEL OBRAJUELO','08',2,'.4.08.0819.'),('0820','SANTA MARIA OSTUMA','08',2,'.4.08.0820.'),('0821','SANTIAGO NONUALCO','08',2,'.4.08.0821.'),('0822','TAPALHUACA','08',2,'.4.08.0822.'),('09','CABAÑAS','4',1,'.4.09.'),('0901','SENSUNTEPEQUE','09',2,'.4.09.0901.'),('0902','CINQUERA','09',2,'.4.09.0902.'),('0903','DOLORES','09',2,'.4.09.0903.'),('0904','GUACOTECTI','09',2,'.4.09.0904.'),('0905','ILOBASCO','09',2,'.4.09.0905.'),('0906','JUTIAPA','09',2,'.4.09.0906.'),('0907','SAN ISIDRO','09',2,'.4.09.0907.'),('0908','TEJUTEPEQUE','09',2,'.4.09.0908.'),('0909','VICTORIA','09',2,'.4.09.0909.'),('1','ZONA CENTRAL','NULL',0,'.1.'),('10','SAN VICENTE','4',1,'.4.10.'),('1001','SAN VICENTE','10',2,'.4.10.1001.'),('100101','CALDERAS','1001',3,'.4.10.1001.100101.'),('100102','EL GUAYABO','1001',3,'.4.10.1001.100102.'),('100103','LAS MINAS','1001',3,'.4.10.1001.100103.'),('100104','SAN FELIPE','1001',3,'.4.10.1001.100104.'),('100105','SAN JACINTO','1001',3,'.4.10.1001.100105.'),('100106','SAN JUAN DE MERINO','1001',3,'.4.10.1001.100106.'),('100107','SAN NICOLAS','1001',3,'.4.10.1001.100107.'),('100108','SAN PEDRO','1001',3,'.4.10.1001.100108.'),('100109','CUTUMAYO','1001',3,'.4.10.1001.100109.'),('100110','SAN JOSE ALMENDROS','1001',3,'.4.10.1001.100110.'),('1002','APASTEPEQUE','10',2,'.4.10.1002.'),('100201','GUADALUPE','1002',3,'.4.10.1002.100201.'),('100202','JOYA DE MUNGUIA','1002',3,'.4.10.1002.100202.'),('100203','SAN JOSE CARBONERA','1002',3,'.4.10.1002.100203.'),('100204','SAN FRANCISCO AGUA AGRIA','1002',3,'.4.10.1002.100204.'),('100205','SAN ANTONIO LOS RANCHOS','1002',3,'.4.10.1002.100205.'),('100206','SAN BENITO PIEDRA GORDA','1002',3,'.4.10.1002.100206.'),('100207','SAN EMIGDIO EL TABLON','1002',3,'.4.10.1002.100207.'),('1003','GUADALUPE','10',2,'.4.10.1003.'),('100301','CANDELARIA','1003',3,'.4.10.1003.100301.'),('100302','SAN JOSE CERRO GRANDE','1003',3,'.4.10.1003.100302.'),('1004','SAN CAYETANO ISTEPEQUE','10',2,'.4.10.1004.'),('100401','AGUA HELADA','1004',3,'.4.10.1004.100401.'),('100402','EL ROSARIO','1004',3,'.4.10.1004.100402.'),('100403','SAN JERONIMO','1004',3,'.4.10.1004.100403.'),('100404','SANTA ROSA','1004',3,'.4.10.1004.100404.'),('100405','EL TORTUGUERO','1004',3,'.4.10.1004.100405.'),('100406','SAN JUAN DE MERINOS','1004',3,'.4.10.1004.100406.'),('1005','SAN ESTEBAN CATARINA','10',2,'.4.10.1005.'),('100501','EL REFUGIO','1005',3,'.4.10.1005.100501.'),('100502','LOS RODRIGUEZ','1005',3,'.4.10.1005.100502.'),('100503','TALPETATES','1005',3,'.4.10.1005.100503.'),('100504','SAN ANTONIO IZCANALEZ','1005',3,'.4.10.1005.100504.'),('1006','SAN ILDEFONSO','10',2,'.4.10.1006.'),('100601','AMATITAN ABAJO','1006',3,'.4.10.1006.100601.'),('100602','AMATITAN ARRIBA','1006',3,'.4.10.1006.100602.'),('100603','SAN ESTEBAN','1006',3,'.4.10.1006.100603.'),('100604','SANTA CATARINA','1006',3,'.4.10.1006.100604.'),('100605','SAN ILDEFONSO','1006',3,'.4.10.1006.100605.'),('100606','SAN JACINTO LA BURRERA','1006',3,'.4.10.1006.100606.'),('1007','SAN LORENZO','10',2,'.4.10.1007.'),('100701','CANDELARIA LEMPA','1007',3,'.4.10.1007.100701.'),('100702','GUACHIPILIN','1007',3,'.4.10.1007.100702.'),('100703','LAJAS Y CANOAS','1007',3,'.4.10.1007.100703.'),('100704','SAN FRANCISCO','1007',3,'.4.10.1007.100704.'),('100705','SAN LORENZO','1007',3,'.4.10.1007.100705.'),('100706','SAN PABLO CAÑALES','1007',3,'.4.10.1007.100706.'),('1008','SAN SEBASTIAN','10',2,'.4.10.1008.'),('100801','LA CRUZ','1008',3,'.4.10.1008.100801.'),('100802','LAS ANIMAS','1008',3,'.4.10.1008.100802.'),('100803','SAN FRANCISCO','1008',3,'.4.10.1008.100803.'),('100804','SANTA LUCIA','1008',3,'.4.10.1008.100804.'),('1009','SANTA CLARA','10',2,'.4.10.1009.'),('100901','EL PARAISO','1009',3,'.4.10.1009.100901.'),('100902','EL PORVENIR AGUACAYO','1009',3,'.4.10.1009.100902.'),('100903','LA ESPERANZA','1009',3,'.4.10.1009.100903.'),('100904','LA LABOR','1009',3,'.4.10.1009.100904.'),('100905','LAS ROSAS','1009',3,'.4.10.1009.100905.'),('100906','LOS LAURELES','1009',3,'.4.10.1009.100906.'),('100907','SAN FRANCISCO','1009',3,'.4.10.1009.100907.'),('100908','SANTA ELENA','1009',3,'.4.10.1009.100908.'),('100909','SANTA TERESA','1009',3,'.4.10.1009.100909.'),('1010','SANTO DOMINGO','10',2,'.4.10.1010.'),('101001','CANTON LAS FLORES','1010',3,'.4.10.1010.101001.'),('101002','CHUCUYO','1010',3,'.4.10.1010.101002.'),('101003','DOS QUEBRADAS','1010',3,'.4.10.1010.101003.'),('101004','EL MARQUEZADO','1010',3,'.4.10.1010.101004.'),('101005','EL REBELDE','1010',3,'.4.10.1010.101005.'),('101006','LA JOYA','1010',3,'.4.10.1010.101006.'),('101007','LA SOLEDAD','1010',3,'.4.10.1010.101007.'),('101008','LOS LAURELES','1010',3,'.4.10.1010.101008.'),('101009','LOS POZOS','1010',3,'.4.10.1010.101009.'),('101010','OBRAJUELO LEMPA','1010',3,'.4.10.1010.101010.'),('101011','PARRAS LEMPA','1010',3,'.4.10.1010.101011.'),('101012','SAN ANTONIO CAMINOS','1010',3,'.4.10.1010.101012.'),('101013','SAN DIEGO','1010',3,'.4.10.1010.101013.'),('101014','SAN JACINTO','1010',3,'.4.10.1010.101014.'),('101015','SAN JOSE RIO FRIO','1010',3,'.4.10.1010.101015.'),('101016','SANTA GERTRUDIS','1010',3,'.4.10.1010.101016.'),('101017','LLANOS DE ACHICHILCO','1010',3,'.4.10.1010.101017.'),('101018','SAN JUAN BUENAVISTA','1010',3,'.4.10.1010.101018.'),('101019','SAN ANTONIO ACHICHILCO','1010',3,'.4.10.1010.101019.'),('101020','SAN ANTONIO TRA','1010',3,'.4.10.1010.101020.'),('101021','SAN BARTOLO ICHANMICO','1010',3,'.4.10.1010.101021.'),('101022','SAN FRANCISCO CHAMOCO','1010',3,'.4.10.1010.101022.'),('1011','TECOLUCA','10',2,'.4.10.1011.'),('101101','EL ARCO','1011',3,'.4.10.1011.101101.'),('101102','EL CAMPANARIO','1011',3,'.4.10.1011.101102.'),('101103','EL CARAO','1011',3,'.4.10.1011.101103.'),('101104','EL COYOLITO','1011',3,'.4.10.1011.101104.'),('101105','EL PACUN','1011',3,'.4.10.1011.101105.'),('101106','EL PALOMAR','1011',3,'.4.10.1011.101106.'),('101107','EL PERICAL','1011',3,'.4.10.1011.101107.'),('101108','EL PUENTE','1011',3,'.4.10.1011.101108.'),('101109','EL SOCORRO','1011',3,'.4.10.1011.101109.'),('101110','LA ESPERANZA','1011',3,'.4.10.1011.101110.'),('101111','LAS ANONAS','1011',3,'.4.10.1011.101111.'),('101112','LAS MESAS','1011',3,'.4.10.1011.101112.'),('101113','SAN JOSE LLANO GRANDE','1011',3,'.4.10.1011.101113.'),('101114','SAN ANTONIO ACH','1011',3,'.4.10.1011.101114.'),('101115','SAN BENITO','1011',3,'.4.10.1011.101115.'),('101116','SAN CARLOS','1011',3,'.4.10.1011.101116.'),('101117','SAN FRANCISCO ANGULO','1011',3,'.4.10.1011.101117.'),('101118','SAN FERNANDO','1011',3,'.4.10.1011.101118.'),('101119','SAN NICOLAS LEMPA','1011',3,'.4.10.1011.101119.'),('101120','SAN RAMON GRIFAL','1011',3,'.4.10.1011.101120.'),('101121','SANTA BARBARA','1011',3,'.4.10.1011.101121.'),('101122','SANTA CRUZ','1011',3,'.4.10.1011.101122.'),('101123','LAS PAMPAS','1011',3,'.4.10.1011.101123.'),('101124','SANTA CRUZ PORRILLO','1011',3,'.4.10.1011.101124.'),('101125','EL PORTILLO','1011',3,'.4.10.1011.101125.'),('101126','SAN ANDRES ACHI','1011',3,'.4.10.1011.101126.'),('101127','BARRIO NUEVO','1011',3,'.4.10.1011.101127.'),('101128','SANTA MARTA','1011',3,'.4.10.1011.101128.'),('1012','TEPETITAN','10',2,'.4.10.1012.'),('101201','LA VIRGEN','1012',3,'.4.10.1012.101201.'),('101202','LOMA ALTA','1012',3,'.4.10.1012.101202.'),('101203','CONCEPCION DE CAÑAS','1012',3,'.4.10.1012.101203.'),('1013','VERAPAZ','10',2,'.4.10.1013.'),('101301','EL CARMEN','1013',3,'.4.10.1013.101301.'),('101302','MOLINEROS','1013',3,'.4.10.1013.101302.'),('101303','SAN ANTONIO JIBOA','1013',3,'.4.10.1013.101303.'),('101304','SAN ISIDRO','1013',3,'.4.10.1013.101304.'),('101305','SAN JERONIMO LIMON','1013',3,'.4.10.1013.101305.'),('101306','SAN JOSE BORJA','1013',3,'.4.10.1013.101306.'),('101307','SAN JUAN BUENAVISTA','1013',3,'.4.10.1013.101307.'),('101308','SAN PEDRO AGUA CALIENTE','1013',3,'.4.10.1013.101308.'),('11','USULUTAN','2',1,'.2.11.'),('1101','USULUTAN','11',2,'.2.11.1101.'),('110101','ZAPOTILLO','1101',3,'.2.11.1101.110101.'),('110102','APASTEPEQUE','1101',3,'.2.11.1101.110102.'),('110103','LAS CASITAS','1101',3,'.2.11.1101.110103.'),('110104','LA PEÑA','1101',3,'.2.11.1101.110104.'),('110105','MONTAÑITA','1101',3,'.2.11.1101.110105.'),('110106','QUEBRACHO','1101',3,'.2.11.1101.110106.'),('110107','SAN JUAN','1101',3,'.2.11.1101.110107.'),('110108','YOMO','1101',3,'.2.11.1101.110108.'),('1102','ALEGRIA','11',2,'.2.11.1102.'),('110201','COLON','1102',3,'.2.11.1102.110201.'),('110202','CONCEPCION','1102',3,'.2.11.1102.110202.'),('110203','EL COROZAL','1102',3,'.2.11.1102.110203.'),('110204','EL TABLON','1102',3,'.2.11.1102.110204.'),('110205','LA UNION','1102',3,'.2.11.1102.110205.'),('110206','LAS DELICIAS','1102',3,'.2.11.1102.110206.'),('110207','LAS PILETAS','1102',3,'.2.11.1102.110207.'),('110208','LOS TALPETATES','1102',3,'.2.11.1102.110208.'),('110209','SAN FELIPE','1102',3,'.2.11.1102.110209.'),('110210','SAN FRANCISCO','1102',3,'.2.11.1102.110210.'),('110211','SAN ISIDRO','1102',3,'.2.11.1102.110211.'),('110212','SAN JOSE','1102',3,'.2.11.1102.110212.'),('110213','SAN JUAN LOMA ALTA','1102',3,'.2.11.1102.110213.'),('110214','SAN LORENZO','1102',3,'.2.11.1102.110214.'),('110215','SANTA CRUZ','1102',3,'.2.11.1102.110215.'),('110216','VIRGINIA','1102',3,'.2.11.1102.110216.'),('1103','BERLIN','11',2,'.2.11.1103.'),('110301','EL POZON','1103',3,'.2.11.1103.110301.'),('1104','CALIFORNIA','11',2,'.2.11.1104.'),('110401','EL PARAISAL','1104',3,'.2.11.1104.110401.'),('110402','HACIENDA NUEVA','1104',3,'.2.11.1104.110402.'),('110403','LA ANCHILA','1104',3,'.2.11.1104.110403.'),('110404','LA DANTA','1104',3,'.2.11.1104.110404.'),('110405','SAN ANTONIO','1104',3,'.2.11.1104.110405.'),('110406','SAN FELIPE','1104',3,'.2.11.1104.110406.'),('110407','SAN ILDEFONSO','1104',3,'.2.11.1104.110407.'),('110408','EL CAÑAL','1104',3,'.2.11.1104.110408.'),('110409','EL PORVENIR','1104',3,'.2.11.1104.110409.'),('1105','CONCEPCION BATRES','11',2,'.2.11.1105.'),('110501','EL PALON','1105',3,'.2.11.1105.110501.'),('110502','EL JICARITO','1105',3,'.2.11.1105.110502.'),('110503','SAN ANTONIO','1105',3,'.2.11.1105.110503.'),('110504','LA PALMERA','1105',3,'.2.11.1105.110504.'),('110505','LOS NOVILLOS','1105',3,'.2.11.1105.110505.'),('1106','EL TRIUNFO','11',2,'.2.11.1106.'),('110601','ANALCO','1106',3,'.2.11.1106.110601.'),('110602','LA CEIBA','1106',3,'.2.11.1106.110602.'),('110603','LOS ENCUENTROS','1106',3,'.2.11.1106.110603.'),('110604','MACULIS','1106',3,'.2.11.1106.110604.'),('1107','EREGUAYQUIN','11',2,'.2.11.1107.'),('110701','CONDADILLO','1107',3,'.2.11.1107.110701.'),('110702','ESCARBADERO','1107',3,'.2.11.1107.110702.'),('110703','LA CRUZ','1107',3,'.2.11.1107.110703.'),('110704','PUENTE CUSCATLAN','1107',3,'.2.11.1107.110704.'),('110705','SAN PEDRO','1107',3,'.2.11.1107.110705.'),('110706','EL CARAGUAL','1107',3,'.2.11.1107.110706.'),('110707','EL OJUSHTE','1107',3,'.2.11.1107.110707.'),('110708','EL TECOMATAL','1107',3,'.2.11.1107.110708.'),('110709','POTRERO DE JOCO','1107',3,'.2.11.1107.110709.'),('110710','SITIO SAN ANTONIO','1107',3,'.2.11.1107.110710.'),('1108','ESTANZUELAS','11',2,'.2.11.1108.'),('110801','AGUACAYO','1108',3,'.2.11.1108.110801.'),('110802','BOLIVAR','1108',3,'.2.11.1108.110802.'),('110803','CABOS NEGROS','1108',3,'.2.11.1108.110803.'),('110804','CALIFORNIA','1108',3,'.2.11.1108.110804.'),('110805','CEIBA GACHA','1108',3,'.2.11.1108.110805.'),('110806','CRUZADILLA DE SAN JUAN','1108',3,'.2.11.1108.110806.'),('110807','EL CARMEN','1108',3,'.2.11.1108.110807.'),('110808','EL COYOLITO','1108',3,'.2.11.1108.110808.'),('110809','EL PARAISO','1108',3,'.2.11.1108.110809.'),('110810','HULE CHACHO','1108',3,'.2.11.1108.110810.'),('110811','LA CANOA','1108',3,'.2.11.1108.110811.'),('110812','LA CONCORDIA','1108',3,'.2.11.1108.110812.'),('110813','LA TIRANA','1108',3,'.2.11.1108.110813.'),('110814','LAS FLORES','1108',3,'.2.11.1108.110814.'),('110815','LOS CAMPOS','1108',3,'.2.11.1108.110815.'),('110816','LOS LIMONES','1108',3,'.2.11.1108.110816.'),('110817','NUEVA CALIFORNIA','1108',3,'.2.11.1108.110817.'),('110818','PUERTO LOS AVALOS','1108',3,'.2.11.1108.110818.'),('110819','ROQUINTE','1108',3,'.2.11.1108.110819.'),('110820','SALINAS DE SISIGUAYO','1108',3,'.2.11.1108.110820.'),('110821','SAN JOSE','1108',3,'.2.11.1108.110821.'),('110822','SAN JUAN DE LETRAN','1108',3,'.2.11.1108.110822.'),('110823','SAN JUAN DEL GOZO','1108',3,'.2.11.1108.110823.'),('110824','SAN JUDAS','1108',3,'.2.11.1108.110824.'),('110825','SAN MARCOS LEMPA','1108',3,'.2.11.1108.110825.'),('110826','SAN PEDRO','1108',3,'.2.11.1108.110826.'),('110827','TABURETE JAGUAL','1108',3,'.2.11.1108.110827.'),('110828','TIERRA BLANCA','1108',3,'.2.11.1108.110828.'),('110829','CARRIZAL','1108',3,'.2.11.1108.110829.'),('110830','EL CASTAÑO','1108',3,'.2.11.1108.110830.'),('110831','ISLA MENDEZ','1108',3,'.2.11.1108.110831.'),('110832','LA NORIA','1108',3,'.2.11.1108.110832.'),('110833','LAS ESPERANZA','1108',3,'.2.11.1108.110833.'),('110834','EL MARILLO','1108',3,'.2.11.1108.110834.'),('110835','SALINAS EL POTRERO','1108',3,'.2.11.1108.110835.'),('110836','ZAMORAN','1108',3,'.2.11.1108.110836.'),('110837','MONTECRISTO','1108',3,'.2.11.1108.110837.'),('110838','TABURETE LOS CLAROS','1108',3,'.2.11.1108.110838.'),('110839','SAN ANTONIO POTRERIO','1108',3,'.2.11.1108.110839.'),('1109','JIQUILISCO','11',2,'.2.11.1109.'),('110901','EL AMATON','1109',3,'.2.11.1109.110901.'),('110902','EL CHAGUITE','1109',3,'.2.11.1109.110902.'),('110903','EL NISPERO','1109',3,'.2.11.1109.110903.'),('110904','LLANO DE CHILAM','1109',3,'.2.11.1109.110904.'),('110905','LOMA DE LA CRUZ','1109',3,'.2.11.1109.110905.'),('110906','TEPESQUILLO ALTO','1109',3,'.2.11.1109.110906.'),('110907','TEPESQUILLO BAJO','1109',3,'.2.11.1109.110907.'),('110908','LLANO EL CHILAMATE','1109',3,'.2.11.1109.110908.'),('110909','LLANO GRANDE DE JUCUAPA','1109',3,'.2.11.1109.110909.'),('110910','SANTA CRUZ','1109',3,'.2.11.1109.110910.'),('1110','JUCUAPA','11',2,'.2.11.1110.'),('111001','EL JICARO','1110',3,'.2.11.1110.111001.'),('111002','EL JUTAL','1110',3,'.2.11.1110.111002.'),('111003','EL LLANO','1110',3,'.2.11.1110.111003.'),('111004','EL PROGRESO','1110',3,'.2.11.1110.111004.'),('111005','EL ZAPOTE','1110',3,'.2.11.1110.111005.'),('111006','LA CRUZ','1110',3,'.2.11.1110.111006.'),('111007','SAMURIA','1110',3,'.2.11.1110.111007.'),('1111','JUCUARAN','11',2,'.2.11.1111.'),('111101','EL CAULOTE','1111',3,'.2.11.1111.111101.'),('111102','EL JICARO','1111',3,'.2.11.1111.111102.'),('111103','EL JOCOTILLO','1111',3,'.2.11.1111.111103.'),('111104','LA PUERTA','1111',3,'.2.11.1111.111104.'),('111105','LOS HORCONES','1111',3,'.2.11.1111.111105.'),('111106','LOS TALNETES','1111',3,'.2.11.1111.111106.'),('111107','SAN BENITO','1111',3,'.2.11.1111.111107.'),('111108','SANTA ANITA','1111',3,'.2.11.1111.111108.'),('111109','LA MONTAÑITA','1111',3,'.2.11.1111.111109.'),('1112','MERCEDES UMAÑA','11',2,'.2.11.1112.'),('111201','AZACUALPIA DE GUALCHO','1112',3,'.2.11.1112.111201.'),('111202','AZACUALPIA DE JOCO','1112',3,'.2.11.1112.111202.'),('111203','EL AMATILLO','1112',3,'.2.11.1112.111203.'),('111204','JOCOMONTIQUE','1112',3,'.2.11.1112.111204.'),('111205','LA ISLETA','1112',3,'.2.11.1112.111205.'),('111206','LAS LLAVES','1112',3,'.2.11.1112.111206.'),('111207','LA PALOMILLA','1112',3,'.2.11.1112.111207.'),('111208','LEPAZ','1112',3,'.2.11.1112.111208.'),('111209','NUEVO CARRIZAL','1112',3,'.2.11.1112.111209.'),('111210','POTRERO DE JOCO','1112',3,'.2.11.1112.111210.'),('111211','SAN JOSE','1112',3,'.2.11.1112.111211.'),('111212','LOS TALNETES','1112',3,'.2.11.1112.111212.'),('1113','NUEVA GRANADA','11',2,'.2.11.1113.'),('111301','EL DELIRIO','1113',3,'.2.11.1113.111301.'),('111302','EL PALMITAL','1113',3,'.2.11.1113.111302.'),('111303','JOYA DEL PILAR','1113',3,'.2.11.1113.111303.'),('111304','LA POZA','1113',3,'.2.11.1113.111304.'),('111305','LAS TRANCAS','1113',3,'.2.11.1113.111305.'),('111306','LA BREÑA','1113',3,'.2.11.1113.111306.'),('1114','OZATLAN','11',2,'.2.11.1114.'),('111401','CORRAL DE MULAS','1114',3,'.2.11.1114.111401.'),('111402','EL ESPIRITU SANTO','1114',3,'.2.11.1114.111402.'),('111403','MADRE SAL','1114',3,'.2.11.1114.111403.'),('111404','SITIO DE SANTA LUCIA','1114',3,'.2.11.1114.111404.'),('1115','PUERTO EL TRIUNFO','11',2,'.2.11.1115.'),('111501','BUENOS AIRES','1115',3,'.2.11.1115.111501.'),('111502','EL COROZO','1115',3,'.2.11.1115.111502.'),('111503','EL JICARO','1115',3,'.2.11.1115.111503.'),('111504','EL JOCOTE','1115',3,'.2.11.1115.111504.'),('111505','EL RODEO','1115',3,'.2.11.1115.111505.'),('111506','EL ZAPOTE','1115',3,'.2.11.1115.111506.'),('111507','GALINGAGUA','1115',3,'.2.11.1115.111507.'),('111508','LA MORA','1115',3,'.2.11.1115.111508.'),('111509','LA QUESERA','1115',3,'.2.11.1115.111509.'),('111510','LINARES','1115',3,'.2.11.1115.111510.'),('111511','LOS EUCALIPTOS','1115',3,'.2.11.1115.111511.'),('111512','LOS PLANES','1115',3,'.2.11.1115.111512.'),('111513','NOMBRE DE DIOS','1115',3,'.2.11.1115.111513.'),('111514','TRES CALLES','1115',3,'.2.11.1115.111514.'),('111515','LOS ARROZALES','1115',3,'.2.11.1115.111515.'),('111516','JOBAL ARROZALES','1115',3,'.2.11.1115.111516.'),('111517','LA CEIBA','1115',3,'.2.11.1115.111517.'),('111518','LINARES CAULOTA','1115',3,'.2.11.1115.111518.'),('1116','SAN AGUSTIN','11',2,'.2.11.1116.'),('111601','EL ACEITUNO','1116',3,'.2.11.1116.111601.'),('111602','EL SEMILLERO','1116',3,'.2.11.1116.111602.'),('111603','LA CARIDAD','1116',3,'.2.11.1116.111603.'),('111604','LA TRONCONADA','1116',3,'.2.11.1116.111604.'),('111605','LOS CHARCOS','1116',3,'.2.11.1116.111605.'),('111606','LOS ESPINOS','1116',3,'.2.11.1116.111606.'),('111607','LAS CHARCAS','1116',3,'.2.11.1116.111607.'),('1117','SAN BUENAVENTURA','11',2,'.2.11.1117.'),('111701','IGLESIA VIEJA','1117',3,'.2.11.1117.111701.'),('111702','MUNDO NUEVO','1117',3,'.2.11.1117.111702.'),('111703','SAN FRANCISCO','1117',3,'.2.11.1117.111703.'),('111704','LOS SALINAS','1117',3,'.2.11.1117.111704.'),('1118','SAN DIONISIO','11',2,'.2.11.1118.'),('111801','CERRO EL NANZAL','1118',3,'.2.11.1118.111801.'),('111802','EL REBALSE','1118',3,'.2.11.1118.111802.'),('111803','EL VOLCAN','1118',3,'.2.11.1118.111803.'),('111804','JOYA ANCHA ABAJO','1118',3,'.2.11.1118.111804.'),('111805','JOYA ANCHA ARRIBA','1118',3,'.2.11.1118.111805.'),('111806','LAS CRUCES','1118',3,'.2.11.1118.111806.'),('111807','EL NISPERAL','1118',3,'.2.11.1118.111807.'),('111808','EL AMATE','1118',3,'.2.11.1118.111808.'),('111809','PIEDRA AGUA','1118',3,'.2.11.1118.111809.'),('1119','SAN FRANCISCO JAVIER','11',2,'.2.11.1119.'),('111901','EL PALMO','1119',3,'.2.11.1119.111901.'),('111902','EL TABLON','1119',3,'.2.11.1119.111902.'),('111903','EL ZUNGANO','1119',3,'.2.11.1119.111903.'),('111904','LOS HORCONES','1119',3,'.2.11.1119.111904.'),('111905','LOS HORNOS','1119',3,'.2.11.1119.111905.'),('111906','LOS RIOS','1119',3,'.2.11.1119.111906.'),('111907','JOBAL HORNOS','1119',3,'.2.11.1119.111907.'),('111908','LA CRUZ','1119',3,'.2.11.1119.111908.'),('111909','LA PEÑA','1119',3,'.2.11.1119.111909.'),('1120','SANTA ELENA','11',2,'.2.11.1120.'),('112001','MEJICAPA','1120',3,'.2.11.1120.112001.'),('112002','SAN FRANCISCO','1120',3,'.2.11.1120.112002.'),('1121','SANTA MARIA','11',2,'.2.11.1121.'),('112101','BATRES','1121',3,'.2.11.1121.112101.'),('112102','CERRO VERDE','1121',3,'.2.11.1121.112102.'),('112103','EL TIGRE','1121',3,'.2.11.1121.112103.'),('112104','LAS FLORES','1121',3,'.2.11.1121.112104.'),('112105','LAS PLAYAS','1121',3,'.2.11.1121.112105.'),('112106','MEJICANOS','1121',3,'.2.11.1121.112106.'),('112107','EL MARQUEZADO','1121',3,'.2.11.1121.112107.'),('112108','LOMAS DE LOS GONZALEZ','1121',3,'.2.11.1121.112108.'),('1122','SANTIAGO DE MARIA','11',2,'.2.11.1122.'),('112201','CERRO VERDE','1122',3,'.2.11.1122.112201.'),('112202','EL JICARO','1122',3,'.2.11.1122.112202.'),('112203','LOS CHAPETONES','1122',3,'.2.11.1122.112203.'),('112204','LOS HORCONES','1122',3,'.2.11.1122.112204.'),('112205','PASO DE GUALACHE','1122',3,'.2.11.1122.112205.'),('1123','TECAPAN','11',2,'.2.11.1123.'),('112301','BUENA VISTA','1123',3,'.2.11.1123.112301.'),('112302','EL CERRITO','1123',3,'.2.11.1123.112302.'),('112303','EL TRILLO','1123',3,'.2.11.1123.112303.'),('112304','LA JOYA DE TOMASICO','1123',3,'.2.11.1123.112304.'),('112305','LA LAGUNA','1123',3,'.2.11.1123.112305.'),('112306','LA PRESA','1123',3,'.2.11.1123.112306.'),('112307','LAS SALINAS','1123',3,'.2.11.1123.112307.'),('112308','EL OBRAJUELO','1123',3,'.2.11.1123.112308.'),('112309','PALO GALAN','1123',3,'.2.11.1123.112309.'),('112310','SANTA BARBARA','1123',3,'.2.11.1123.112310.'),('112311','TALPETATE','1123',3,'.2.11.1123.112311.'),('112312','EL OJUSTE','1123',3,'.2.11.1123.112312.'),('112313','LA PEÑA','1123',3,'.2.11.1123.112313.'),('112314','OJO DE AGUA','1123',3,'.2.11.1123.112314.'),('112315','HACIENDA LA CARRERA','1123',3,'.2.11.1123.112315.'),('112316','PUERTO PARADA','1123',3,'.2.11.1123.112316.'),('112317','OBRAJUELO','1123',3,'.2.11.1123.112317.'),('112318','LAZO','1123',3,'.2.11.1123.112318.'),('112319','LAS CONCHAS','1123',3,'.2.11.1123.112319.'),('12','SAN MIGUEL','2',1,'.2.12.'),('1201','SAN MIGUEL','12',2,'.2.12.1201.'),('120101','LA CEIBITA','1201',3,'.2.12.1201.120101.'),('120102','LA ORILLA','1201',3,'.2.12.1201.120102.'),('120103','MIRACAPA','1201',3,'.2.12.1201.120103.'),('120104','ROSAS NACASPILO','1201',3,'.2.12.1201.120104.'),('120105','SOLEDAD TERRERO','1201',3,'.2.12.1201.120105.'),('1202','CAROLINA','12',2,'.2.12.1202.'),('120201','BELEN','1202',3,'.2.12.1202.120201.'),('120202','LLANO EL ANGEL','1202',3,'.2.12.1202.120202.'),('120203','NUEVO PORVENIR','1202',3,'.2.12.1202.120203.'),('120204','SAN CRISTOBAL','1202',3,'.2.12.1202.120204.'),('120205','SAN JUAN','1202',3,'.2.12.1202.120205.'),('120206','SAN LUISITO','1202',3,'.2.12.1202.120206.'),('120207','SAN MATIAS','1202',3,'.2.12.1202.120207.'),('120208','TEPONAHUASTE','1202',3,'.2.12.1202.120208.'),('120209','GUANASTE','1202',3,'.2.12.1202.120209.'),('120210','LAS TORRECILLAS','1202',3,'.2.12.1202.120210.'),('120211','LA MONTAÑITA','1202',3,'.2.12.1202.120211.'),('1203','CIUDAD BARRIOS','12',2,'.2.12.1203.'),('120301','CANDELARIA','1203',3,'.2.12.1203.120301.'),('120302','EL COLORADO','1203',3,'.2.12.1203.120302.'),('120303','PLATANARILLO','1203',3,'.2.12.1203.120303.'),('120304','EL HORMIGUERO','1203',3,'.2.12.1203.120304.'),('120305','EL JICARAL','1203',3,'.2.12.1203.120305.'),('1204','COMACARAN','12',2,'.2.12.1204.'),('120401','CERCAS DE PIEDRA','1204',3,'.2.12.1204.120401.'),('120402','LA TRINIDAD','1204',3,'.2.12.1204.120402.'),('120403','LOS AMATES','1204',3,'.2.12.1204.120403.'),('120404','SAN JERONIMO','1204',3,'.2.12.1204.120404.'),('120405','SAN PEDRO','1204',3,'.2.12.1204.120405.'),('120406','CUALAMA','1204',3,'.2.12.1204.120406.'),('1205','CHAPELTIQUE','12',2,'.2.12.1205.'),('120501','BOQUERON','1205',3,'.2.12.1205.120501.'),('120502','CHAMBALA','1205',3,'.2.12.1205.120502.'),('120503','CONACASTAL','1205',3,'.2.12.1205.120503.'),('120504','COPINOL PRIMERO','1205',3,'.2.12.1205.120504.'),('120505','COPINOL SEGUNDO','1205',3,'.2.12.1205.120505.'),('120506','JOCOTE DULCE','1205',3,'.2.12.1205.120506.'),('120507','LA CRUZ PRIMERA','1205',3,'.2.12.1205.120507.'),('120508','LA CRUZ SEGUNDA','1205',3,'.2.12.1205.120508.'),('120509','LAS MARIAS','1205',3,'.2.12.1205.120509.'),('120510','LAS MESAS','1205',3,'.2.12.1205.120510.'),('120511','LOS PLANES PRIMERO','1205',3,'.2.12.1205.120511.'),('120512','LOS PLANES SEGUNDO','1205',3,'.2.12.1205.120512.'),('120513','LOS PLANES TERCERO','1205',3,'.2.12.1205.120513.'),('120514','OJO DE AGUA','1205',3,'.2.12.1205.120514.'),('120515','OROMONTIQUE','1205',3,'.2.12.1205.120515.'),('120516','SAN ANTONIO','1205',3,'.2.12.1205.120516.'),('120517','ZARAGOZA','1205',3,'.2.12.1205.120517.'),('120518','EL JOCOTE SAN ISIDRO','1205',3,'.2.12.1205.120518.'),('120519','LA PEÑA','1205',3,'.2.12.1205.120519.'),('120520','SAN PEDRO ARENALES','1205',3,'.2.12.1205.120520.'),('1206','CHINAMECA','12',2,'.2.12.1206.'),('120601','CHILANGUERA','1206',3,'.2.12.1206.120601.'),('120602','EL CAPULIN','1206',3,'.2.12.1206.120602.'),('120603','GUADALUPE','1206',3,'.2.12.1206.120603.'),('120604','HOJA DE SAL','1206',3,'.2.12.1206.120604.'),('120605','LA ESTRECHURA','1206',3,'.2.12.1206.120605.'),('120606','NUEVA CONCEPCION','1206',3,'.2.12.1206.120606.'),('120607','SAN JOSE GUALOSO','1206',3,'.2.12.1206.120607.'),('120608','SAN PEDRO','1206',3,'.2.12.1206.120608.'),('120609','TIERRA BLANCA','1206',3,'.2.12.1206.120609.'),('120610','LLANO DE LAS ROSAS','1206',3,'.2.12.1206.120610.'),('120611','SAN RAMON','1206',3,'.2.12.1206.120611.'),('120613','EL CUCO','1206',3,'.2.12.1206.120613.'),('1207','CHIRILAGUA','12',2,'.2.12.1207.'),('120701','CALLE NUEVA','1207',3,'.2.12.1207.120701.'),('120702','LLANO DEL COYOL','1207',3,'.2.12.1207.120702.'),('120703','MOROPALA','1207',3,'.2.12.1207.120703.'),('120704','PRIMAVERA','1207',3,'.2.12.1207.120704.'),('120705','EL BORBOLLON','1207',3,'.2.12.1207.120705.'),('1208','EL TRANSITO','12',2,'.2.12.1208.'),('120801','AMAYA','1208',3,'.2.12.1208.120801.'),('120802','CONCEPCION','1208',3,'.2.12.1208.120802.'),('120803','EL JICARO','1208',3,'.2.12.1208.120803.'),('120804','EL NANCITO','1208',3,'.2.12.1208.120804.'),('120805','EL PALON','1208',3,'.2.12.1208.120805.'),('120806','LAS VENTAS','1208',3,'.2.12.1208.120806.'),('120807','SAN FRANCISCO','1208',3,'.2.12.1208.120807.'),('120808','SANTA BARBARA','1208',3,'.2.12.1208.120808.'),('120809','VALENCIA','1208',3,'.2.12.1208.120809.'),('1209','LOLOTIQUE','12',2,'.2.12.1209.'),('120901','EL CERRO','1209',3,'.2.12.1209.120901.'),('120902','EL JOBO','1209',3,'.2.12.1209.120902.'),('120903','EL PAPALON','1209',3,'.2.12.1209.120903.'),('120904','EL PLATANAR','1209',3,'.2.12.1209.120904.'),('120905','EL RODEO','1209',3,'.2.12.1209.120905.'),('120906','SALAMAR','1209',3,'.2.12.1209.120906.'),('120907','LA ESTANCIA','1209',3,'.2.12.1209.120907.'),('120908','LA FRAGUA','1209',3,'.2.12.1209.120908.'),('120909','LOS EJIDOS','1209',3,'.2.12.1209.120909.'),('120910','SANTA BARBARA','1209',3,'.2.12.1209.120910.'),('120911','LA FRAGUA','1209',3,'.2.12.1209.120911.'),('120912','TONGOLONA','1209',3,'.2.12.1209.120912.'),('120913','VALLE ALEGRE','1209',3,'.2.12.1209.120913.'),('1210','MONCAGUA','12',2,'.2.12.1210.'),('121001','PLANES DE SAN SEBASTIAN','1210',3,'.2.12.1210.121001.'),('121002','SAN LUIS','1210',3,'.2.12.1210.121002.'),('1211','NUEVA GUADALUPE','12',2,'.2.12.1211.'),('121101','JARDIN','1211',3,'.2.12.1211.121101.'),('121102','OJEO','1211',3,'.2.12.1211.121102.'),('121103','QUESERAS','1211',3,'.2.12.1211.121103.'),('121104','SAN SEBASTIAN','1211',3,'.2.12.1211.121104.'),('121105','LAURELES','1211',3,'.2.12.1211.121105.'),('121106','CUCURUCHO','1211',3,'.2.12.1211.121106.'),('121107','MONTECILLO','1211',3,'.2.12.1211.121107.'),('1212','NUEVO EDEN DE SAN JUAN','12',2,'.2.12.1212.'),('121201','EL OBRAJUELO','1212',3,'.2.12.1212.121201.'),('121202','EL TAMBORAL','1212',3,'.2.12.1212.121202.'),('121203','SAN ANTONIO','1212',3,'.2.12.1212.121203.'),('121204','SAN JOSE','1212',3,'.2.12.1212.121204.'),('1213','QUELEPA','12',2,'.2.12.1213.'),('121301','SAN DIEGO','1213',3,'.2.12.1213.121301.'),('121302','SAN MARCOS','1213',3,'.2.12.1213.121302.'),('1214','SAN ANTONIO','12',2,'.2.12.1214.'),('121401','LA JOYA','1214',3,'.2.12.1214.121401.'),('121402','LA LAGUNA','1214',3,'.2.12.1214.121402.'),('121403','QUEBRACHO','1214',3,'.2.12.1214.121403.'),('121404','SAN JERONIMO','1214',3,'.2.12.1214.121404.'),('1215','SAN GERARDO','12',2,'.2.12.1215.'),('121501','CANDELARIA','1215',3,'.2.12.1215.121501.'),('121502','JOYA DE VENTURA','1215',3,'.2.12.1215.121502.'),('121503','LA CEIBA','1215',3,'.2.12.1215.121503.'),('121504','LA MORITA','1215',3,'.2.12.1215.121504.'),('121505','SAN JULIAN','1215',3,'.2.12.1215.121505.'),('1216','SAN JORGE','12',2,'.2.12.1216.'),('121601','EL JUNQUILLO','1216',3,'.2.12.1216.121601.'),('121602','OSTUCAL','1216',3,'.2.12.1216.121602.'),('121603','SAN ANTONIO','1216',3,'.2.12.1216.121603.'),('121604','SAN JUAN','1216',3,'.2.12.1216.121604.'),('1217','SAN LUIS DE LA REINA','12',2,'.2.12.1217.'),('121701','ALTOMIRO','1217',3,'.2.12.1217.121701.'),('121702','ANCHICO','1217',3,'.2.12.1217.121702.'),('121703','CERRO BONITO','1217',3,'.2.12.1217.121703.'),('121704','CONCEPCION COROZAL','1217',3,'.2.12.1217.121704.'),('121705','EL AMATE','1217',3,'.2.12.1217.121705.'),('121706','EL BRAZO','1217',3,'.2.12.1217.121706.'),('121707','EL DELIRIO','1217',3,'.2.12.1217.121707.'),('121708','EL DIVISADERO','1217',3,'.2.12.1217.121708.'),('121709','EL HAVILLAL','1217',3,'.2.12.1217.121709.'),('121710','EL JUTE','1217',3,'.2.12.1217.121710.'),('121711','EL PAPALON','1217',3,'.2.12.1217.121711.'),('121712','EL PROGRESO','1217',3,'.2.12.1217.121712.'),('121713','EL SITIO','1217',3,'.2.12.1217.121713.'),('121714','EL TECOMATAL','1217',3,'.2.12.1217.121714.'),('121715','EL VOLCAN','1217',3,'.2.12.1217.121715.'),('121716','EL ZAMORAN','1217',3,'.2.12.1217.121716.'),('121717','HATO NUEVO','1217',3,'.2.12.1217.121717.'),('121718','JALACATAL','1217',3,'.2.12.1217.121718.'),('121719','LA CANOA','1217',3,'.2.12.1217.121719.'),('121720','LA PUERTA','1217',3,'.2.12.1217.121720.'),('121721','LA TRINIDAD','1217',3,'.2.12.1217.121721.'),('121722','LAS DELICIAS','1217',3,'.2.12.1217.121722.'),('121723','LAS LOMITAS','1217',3,'.2.12.1217.121723.'),('121724','MIRAFLORES','1217',3,'.2.12.1217.121724.'),('121725','MONTE GRANDE','1217',3,'.2.12.1217.121725.'),('121726','SAN ANDRES','1217',3,'.2.12.1217.121726.'),('121727','SAN ANTONIO CHAVEZ','1217',3,'.2.12.1217.121727.'),('121728','SAN ANTONIO SILVA','1217',3,'.2.12.1217.121728.'),('121729','SAN CARLOS','1217',3,'.2.12.1217.121729.'),('121730','SAN JACINTO','1217',3,'.2.12.1217.121730.'),('121731','SANTA INES','1217',3,'.2.12.1217.121731.'),('121732','EL NIÑO','1217',3,'.2.12.1217.121732.'),('121733','AGUA ZARCA','1217',3,'.2.12.1217.121733.'),('1218','SAN RAFAEL ORIENTE','12',2,'.2.12.1218.'),('121801','LOS ZELAYA','1218',3,'.2.12.1218.121801.'),('121802','PIEDRA AZUL','1218',3,'.2.12.1218.121802.'),('121803','RODEO DE PEDRON','1218',3,'.2.12.1218.121803.'),('121804','SANTA CLARA','1218',3,'.2.12.1218.121804.'),('1219','SESORI','12',2,'.2.12.1219.'),('121901','CHARLACA','1219',3,'.2.12.1219.121901.'),('121902','EL ESPIRITU SANTO','1219',3,'.2.12.1219.121902.'),('121903','EL TABLON','1219',3,'.2.12.1219.121903.'),('121904','LAS MESAS','1219',3,'.2.12.1219.121904.'),('121905','MINITAS','1219',3,'.2.12.1219.121905.'),('121906','SAN JACINTO','1219',3,'.2.12.1219.121906.'),('121907','SAN SEBASTIAN','1219',3,'.2.12.1219.121907.'),('121908','SANTA ROSA','1219',3,'.2.12.1219.121908.'),('121909','MANAGUARA','1219',3,'.2.12.1219.121909.'),('121910','MAZATEPEQUE','1219',3,'.2.12.1219.121910.'),('1220','ULUAZAPA','12',2,'.2.12.1220.'),('122001','JUAN YANEZ','1220',3,'.2.12.1220.122001.'),('122002','LOS PILONES','1220',3,'.2.12.1220.122002.'),('122003','RIO DE VARGAS','1220',3,'.2.12.1220.122003.'),('122004','RIO VARGAS','1220',3,'.2.12.1220.122004.'),('13','MORAZAN','2',1,'.2.13.'),('1301','SAN FRANCISCO GOTERA','13',2,'.2.13.1301.'),('130101','EL CARRIZAL','1301',3,'.2.13.1301.130101.'),('130102','NAHUATERIQUE','1301',3,'.2.13.1301.130102.'),('130103','PUEBLO VIEJO','1301',3,'.2.13.1301.130103.'),('130104','TIERRA COLORADA','1301',3,'.2.13.1301.130104.'),('1302','ARAMBALA','13',2,'.2.13.1302.'),('130201','AGUA BLANCA','1302',3,'.2.13.1302.130201.'),('130202','CALAVERA','1302',3,'.2.13.1302.130202.'),('130203','JUNQUILLO','1302',3,'.2.13.1302.130203.'),('130204','OCOTILLO','1302',3,'.2.13.1302.130204.'),('130205','LA ESTANCIA','1302',3,'.2.13.1302.130205.'),('130206','SUNSULACA','1302',3,'.2.13.1302.130206.'),('130207','GUACHIPILIN','1302',3,'.2.13.1302.130207.'),('1303','CACAOPERA','13',2,'.2.13.1303.'),('130301','CORRALITO','1303',3,'.2.13.1303.130301.'),('130302','HONDABLE','1303',3,'.2.13.1303.130302.'),('130303','LAGUNA','1303',3,'.2.13.1303.130303.'),('130304','SAN FELIPE','1303',3,'.2.13.1303.130304.'),('130305','VARILLA NEGRA','1303',3,'.2.13.1303.130305.'),('1304','CORINTO','13',2,'.2.13.1304.'),('130401','JOYA DEL MATAZANO','1304',3,'.2.13.1304.130401.'),('130402','LAJITAS','1304',3,'.2.13.1304.130402.'),('130403','PIEDRA PARADA','1304',3,'.2.13.1304.130403.'),('130404','EL CHAPARRAL','1304',3,'.2.13.1304.130404.'),('130405','EL PEDERNAL','1304',3,'.2.13.1304.130405.'),('1305','CHILANGA','13',2,'.2.13.1305.'),('130501','EL VOLCAN','1305',3,'.2.13.1305.130501.'),('130502','LA CUCHILLA','1305',3,'.2.13.1305.130502.'),('1306','DELICIAS DE CONCEPCION','13',2,'.2.13.1306.'),('130601','LA CANADA','1306',3,'.2.13.1306.130601.'),('130602','LLANO DE SANTIAGO','1306',3,'.2.13.1306.130602.'),('130603','LOMA LARGA','1306',3,'.2.13.1306.130603.'),('130604','LOMA TENDIDA','1306',3,'.2.13.1306.130604.'),('130605','SAN PEDRO','1306',3,'.2.13.1306.130605.'),('130606','SANTA ANITA','1306',3,'.2.13.1306.130606.'),('130607','VILLA MODELO','1306',3,'.2.13.1306.130607.'),('130608','NOMBRE DE JESUS','1306',3,'.2.13.1306.130608.'),('1307','EL DIVISADERO','13',2,'.2.13.1307.'),('130701','LA LAGUNA','1307',3,'.2.13.1307.130701.'),('130702','OJOS DE AGUA','1307',3,'.2.13.1307.130702.'),('1308','EL ROSARIO','13',2,'.2.13.1308.'),('130801','LA JOYA','1308',3,'.2.13.1308.130801.'),('130802','SAN LUCAS','1308',3,'.2.13.1308.130802.'),('1309','GUALOCOCTI','13',2,'.2.13.1309.'),('130901','MAIGUERA','1309',3,'.2.13.1309.130901.'),('130902','PAJIGUA','1309',3,'.2.13.1309.130902.'),('130903','SAN BARTOLO','1309',3,'.2.13.1309.130903.'),('130904','EL VOLCAN','1309',3,'.2.13.1309.130904.'),('130905','ABELINES','1309',3,'.2.13.1309.130905.'),('130906','EL SIRIGUAL','1309',3,'.2.13.1309.130906.'),('1310','GUATAJIAGUA','13',2,'.2.13.1310.'),('131001','PATURLA','1310',3,'.2.13.1310.131001.'),('131002','VOLCANCILLO','1310',3,'.2.13.1310.131002.'),('131003','ZAPOTAL','1310',3,'.2.13.1310.131003.'),('1311','JOATECA','13',2,'.2.13.1311.'),('131101','EL RODEO','1311',3,'.2.13.1311.131101.'),('131102','EL VOLCANCILLO','1311',3,'.2.13.1311.131102.'),('1312','JOCOAITIQUE','13',2,'.2.13.1312.'),('131201','FLAMENCO','1312',3,'.2.13.1312.131201.'),('131202','GUACHIPILIN','1312',3,'.2.13.1312.131202.'),('131203','LAGUNETAS','1312',3,'.2.13.1312.131203.'),('131204','LAS MARIAS','1312',3,'.2.13.1312.131204.'),('131205','LAURELES','1312',3,'.2.13.1312.131205.'),('131206','SAN FELIPE','1312',3,'.2.13.1312.131206.'),('131207','SAN JOSE','1312',3,'.2.13.1312.131207.'),('131208','SAN JUAN','1312',3,'.2.13.1312.131208.'),('1313','JOCORO','13',2,'.2.13.1313.'),('131301','MANZANILLA','1313',3,'.2.13.1313.131301.'),('131302','GUALINDO ARRIBA','1313',3,'.2.13.1313.131302.'),('131303','GUALINDO CENTRO','1313',3,'.2.13.1313.131303.'),('131304','GUALINDO ABAJO','1313',3,'.2.13.1313.131304.'),('1314','LOLOTIQUILLO','13',2,'.2.13.1314.'),('131401','CERRO PANDO','1314',3,'.2.13.1314.131401.'),('131402','LA JOYA','1314',3,'.2.13.1314.131402.'),('131403','LA SOLEDAD','1314',3,'.2.13.1314.131403.'),('131404','LA GUACAMAYA','1314',3,'.2.13.1314.131404.'),('1315','MEANGUERA','13',2,'.2.13.1315.'),('131501','AGUA ZARCA','1315',3,'.2.13.1315.131501.'),('131502','HUILIHUISTE','1315',3,'.2.13.1315.131502.'),('131503','LA MONTAÑA','1315',3,'.2.13.1315.131503.'),('131504','CERRO COYOL','1315',3,'.2.13.1315.131504.'),('1316','OSICALA','13',2,'.2.13.1316.'),('131601','CASA BLANCA','1316',3,'.2.13.1316.131601.'),('131602','LAS TROJAS','1316',3,'.2.13.1316.131602.'),('131603','SABANETAS','1316',3,'.2.13.1316.131603.'),('1317','PERQUIN','13',2,'.2.13.1317.'),('131701','LA JAGUA','1317',3,'.2.13.1317.131701.'),('131702','SAN DIEGO','1317',3,'.2.13.1317.131702.'),('131703','SAN MARCOS','1317',3,'.2.13.1317.131703.'),('131704','VALLE NUEVO','1317',3,'.2.13.1317.131704.'),('1318','SAN CARLOS','13',2,'.2.13.1318.'),('131801','AZACUALPA','1318',3,'.2.13.1318.131801.'),('131802','CAÑAVERALES','1318',3,'.2.13.1318.131802.'),('1319','SAN FERNANDO','13',2,'.2.13.1319.'),('131901','SAN FRANCISQUITO','1319',3,'.2.13.1319.131901.'),('131902','SAN JOSE','1319',3,'.2.13.1319.131902.'),('131903','EL TRIUNFO','1319',3,'.2.13.1319.131903.'),('131904','CACAHUATALEJO','1319',3,'.2.13.1319.131904.'),('131905','EL ROSARIO','1319',3,'.2.13.1319.131905.'),('131906','EL NORTE','1319',3,'.2.13.1319.131906.'),('1320','SAN ISIDRO','13',2,'.2.13.1320.'),('132001','EL ROSARIO','1320',3,'.2.13.1320.132001.'),('132002','PIEDRA PARADA','1320',3,'.2.13.1320.132002.'),('1321','SAN SIMON','13',2,'.2.13.1321.'),('132101','EL CARRIZAL','1321',3,'.2.13.1321.132101.'),('132102','EL CERRO','1321',3,'.2.13.1321.132102.'),('132103','LAS QUEBRADAS','1321',3,'.2.13.1321.132103.'),('132104','POTRERO DE ADENTRO','1321',3,'.2.13.1321.132104.'),('132105','VALLE GRANDE','1321',3,'.2.13.1321.132105.'),('132106','SAN FRANCISCO','1321',3,'.2.13.1321.132106.'),('1322','SENSEMBRA','13',2,'.2.13.1322.'),('132201','EL LIMON','1322',3,'.2.13.1322.132201.'),('132202','EL RODEO','1322',3,'.2.13.1322.132202.'),('1323','SOCIEDAD','13',2,'.2.13.1323.'),('132301','ANIMAS','1323',3,'.2.13.1323.132301.'),('132302','CALPULES','1323',3,'.2.13.1323.132302.'),('132303','CANDELARIA','1323',3,'.2.13.1323.132303.'),('132304','EL TABLON','1323',3,'.2.13.1323.132304.'),('132305','LA JOYA','1323',3,'.2.13.1323.132305.'),('132306','EL BEJUCAL','1323',3,'.2.13.1323.132306.'),('132307','LA LABRANZA','1323',3,'.2.13.1323.132307.'),('132308','EL PEÑON','1323',3,'.2.13.1323.132308.'),('1324','TOROLA','13',2,'.2.13.1324.'),('132401','AGUA ZARCA','1324',3,'.2.13.1324.132401.'),('132402','CERRITOS','1324',3,'.2.13.1324.132402.'),('132403','TIJERETAS','1324',3,'.2.13.1324.132403.'),('132404','EL PROGRESO','1324',3,'.2.13.1324.132404.'),('1325','YAMABAL','13',2,'.2.13.1325.'),('132501','JOYA DEL MATAZANO','1325',3,'.2.13.1325.132501.'),('132502','SAN FRANCISQUITO','1325',3,'.2.13.1325.132502.'),('132503','SAN JUAN','1325',3,'.2.13.1325.132503.'),('132504','LOMA EL CHILE','1325',3,'.2.13.1325.132504.'),('1326','YOLOAIQUIN','13',2,'.2.13.1326.'),('132601','EL ACEITUNO','1326',3,'.2.13.1326.132601.'),('132602','EL VOLCAN','1326',3,'.2.13.1326.132602.'),('14','LA UNION','2',1,'.2.14.'),('1401','LA UNION','14',2,'.2.14.1401.'),('140101','AGUA BLANCA','1401',3,'.2.14.1401.140101.'),('140102','EL CARBONAL','1401',3,'.2.14.1401.140102.'),('140103','EL TIZATE','1401',3,'.2.14.1401.140103.'),('140104','TERRERITOS','1401',3,'.2.14.1401.140104.'),('140105','HUERTA VIEJA','1401',3,'.2.14.1401.140105.'),('140106','TULIMA','1401',3,'.2.14.1401.140106.'),('140107','EL CEDRO','1401',3,'.2.14.1401.140107.'),('140108','CORDONCILLO','1401',3,'.2.14.1401.140108.'),('1402','ANAMOROS','14',2,'.2.14.1402.'),('140201','ALBORNOZ','1402',3,'.2.14.1402.140201.'),('140202','EL TRANSITO','1402',3,'.2.14.1402.140202.'),('140203','GUADALUPE','1402',3,'.2.14.1402.140203.'),('140204','LA PAZ','1402',3,'.2.14.1402.140204.'),('140205','LA RINCONADA','1402',3,'.2.14.1402.140205.'),('140206','NUEVA GUADALUPE','1402',3,'.2.14.1402.140206.'),('140207','SANTA LUCIA','1402',3,'.2.14.1402.140207.'),('140208','CANDELARIA ALBORNOZ','1402',3,'.2.14.1402.140208.'),('140209','JOYAS LAS TUNAS','1402',3,'.2.14.1402.140209.'),('1403','BOLIVAR','14',2,'.2.14.1403.'),('140301','EL GUAYABO','1403',3,'.2.14.1403.140301.'),('140302','EL MOLINO','1403',3,'.2.14.1403.140302.'),('140303','EL ZAPOTE','1403',3,'.2.14.1403.140303.'),('140304','GUERIPE','1403',3,'.2.14.1403.140304.'),('1404','CONCEPCION DE ORIENTE','14',2,'.2.14.1404.'),('140401','CERRO EL JIOTE','1404',3,'.2.14.1404.140401.'),('140402','CONCHAGUITA','1404',3,'.2.14.1404.140402.'),('140403','EL CACAO','1404',3,'.2.14.1404.140403.'),('140404','EL CIPRES','1404',3,'.2.14.1404.140404.'),('140405','EL FARO','1404',3,'.2.14.1404.140405.'),('140406','EL PILON','1404',3,'.2.14.1404.140406.'),('140407','EL TAMARINDO','1404',3,'.2.14.1404.140407.'),('140408','HUISQUIL','1404',3,'.2.14.1404.140408.'),('140409','LOS ANGELES','1404',3,'.2.14.1404.140409.'),('140410','MAQUIGUE','1404',3,'.2.14.1404.140410.'),('140411','PLAYAS NEGRAS','1404',3,'.2.14.1404.140411.'),('140412','YOLOGUAL','1404',3,'.2.14.1404.140412.'),('140413','EL JAGUEY','1404',3,'.2.14.1404.140413.'),('140414','PIEDRAS BLANCAS','1404',3,'.2.14.1404.140414.'),('140415','PIEDRAS RAYADAS','1404',3,'.2.14.1404.140415.'),('140416','LLANO LOS PATOS','1404',3,'.2.14.1404.140416.'),('1405','CONCHAGUA','14',2,'.2.14.1405.'),('140501','ALTO EL ROBLE','1405',3,'.2.14.1405.140501.'),('140502','CAULOTILLO','1405',3,'.2.14.1405.140502.'),('140503','EL GAVILAN','1405',3,'.2.14.1405.140503.'),('140504','EL PICHE','1405',3,'.2.14.1405.140504.'),('140505','EL TEJAR','1405',3,'.2.14.1405.140505.'),('140506','EL ZAPOTAL','1405',3,'.2.14.1405.140506.'),('140507','LOS CONEJOS','1405',3,'.2.14.1405.140507.'),('140508','OLOMEGA','1405',3,'.2.14.1405.140508.'),('140509','LAS PITAS','1405',3,'.2.14.1405.140509.'),('140510','SALALAGUA','1405',3,'.2.14.1405.140510.'),('140511','LA CAÑADA','1405',3,'.2.14.1405.140511.'),('1406','EL CARMEN','14',2,'.2.14.1406.'),('140601','CANAIRE','1406',3,'.2.14.1406.140601.'),('140602','EL RINCON','1406',3,'.2.14.1406.140602.'),('140603','SANTA ROSITA','1406',3,'.2.14.1406.140603.'),('140604','TALPETATE','1406',3,'.2.14.1406.140604.'),('140605','SAN JUAN GUALARES','1406',3,'.2.14.1406.140605.'),('1407','EL SAUCE','14',2,'.2.14.1407.'),('140701','EL CARAO','1407',3,'.2.14.1407.140701.'),('140702','LA LEONA','1407',3,'.2.14.1407.140702.'),('1408','INTIPUCA','14',2,'.2.14.1408.'),('1409','LISLIQUE','14',2,'.2.14.1409.'),('140901','AGUA FRIA','1409',3,'.2.14.1409.140901.'),('140902','GUAJINIQUIL','1409',3,'.2.14.1409.140902.'),('140903','HIGUERAS','1409',3,'.2.14.1409.140903.'),('140904','EL DERRUMBADO','1409',3,'.2.14.1409.140904.'),('140905','EL GUAJINIQUIL','1409',3,'.2.14.1409.140905.'),('140906','EL TERRERO','1409',3,'.2.14.1409.140906.'),('140907','LAS PILAS','1409',3,'.2.14.1409.140907.'),('1410','MEANGUERA DEL GOLFO','14',2,'.2.14.1410.'),('141001','EL SALVADOR','1410',3,'.2.14.1410.141001.'),('141002','GUERRERO','1410',3,'.2.14.1410.141002.'),('141003','ISLA DE CONCHAGÜITA','1410',3,'.2.14.1410.141003.'),('1411','NUEVA ESPARTA','14',2,'.2.14.1411.'),('141101','EL PORTILLO','1411',3,'.2.14.1411.141101.'),('141102','HONDURITAS','1411',3,'.2.14.1411.141102.'),('141103','LAS MARIAS','1411',3,'.2.14.1411.141103.'),('141104','MONTECA','1411',3,'.2.14.1411.141104.'),('141105','TALPETATE','1411',3,'.2.14.1411.141105.'),('141106','OCOTILLO','1411',3,'.2.14.1411.141106.'),('1412','PASAQUINA','14',2,'.2.14.1412.'),('141201','CERRO PELON','1412',3,'.2.14.1412.141201.'),('141202','EL AMATILLO','1412',3,'.2.14.1412.141202.'),('141203','EL REBALSE','1412',3,'.2.14.1412.141203.'),('141204','EL TABLON','1412',3,'.2.14.1412.141204.'),('141205','HORCONES','1412',3,'.2.14.1412.141205.'),('141206','PIEDRAS BLANCAS','1412',3,'.2.14.1412.141206.'),('141207','SAN EDUARDO','1412',3,'.2.14.1412.141207.'),('141208','SAN FELIPE','1412',3,'.2.14.1412.141208.'),('141209','SANTA CLARA','1412',3,'.2.14.1412.141209.'),('141210','VALLE AFUERA','1412',3,'.2.14.1412.141210.'),('141211','LOS CAMOTES','1412',3,'.2.14.1412.141211.'),('141212','EL PICACHO','1412',3,'.2.14.1412.141212.'),('1413','POLOROS','14',2,'.2.14.1413.'),('141301','BOQUIN','1413',3,'.2.14.1413.141301.'),('141302','CARPINTERO','1413',3,'.2.14.1413.141302.'),('141303','LAJITAS','1413',3,'.2.14.1413.141303.'),('141304','EL OCOTE','1413',3,'.2.14.1413.141304.'),('141305','EL PUEBLO','1413',3,'.2.14.1413.141305.'),('141306','EL RODEO','1413',3,'.2.14.1413.141306.'),('141307','MALA LAJA','1413',3,'.2.14.1413.141307.'),('1414','SAN ALEJO','14',2,'.2.14.1414.'),('141401','AGUA FRIA','1414',3,'.2.14.1414.141401.'),('141402','BOBADILLA','1414',3,'.2.14.1414.141402.'),('141403','COPALIO','1414',3,'.2.14.1414.141403.'),('141404','EL TAMARINDO','1414',3,'.2.14.1414.141404.'),('141405','HATO NUEVO','1414',3,'.2.14.1414.141405.'),('141406','LAS QUESERAS','1414',3,'.2.14.1414.141406.'),('141407','LOS JIOTES','1414',3,'.2.14.1414.141407.'),('141408','MOGOTILLO','1414',3,'.2.14.1414.141408.'),('141409','SAN JERONIMO','1414',3,'.2.14.1414.141409.'),('141410','SAN JOSE','1414',3,'.2.14.1414.141410.'),('141411','SANTA CRUZ','1414',3,'.2.14.1414.141411.'),('141412','TERRERO BLANCO','1414',3,'.2.14.1414.141412.'),('141413','TRINCHERAS','1414',3,'.2.14.1414.141413.'),('141414','MONTE VERDE','1414',3,'.2.14.1414.141414.'),('141415','CEIBILLAS','1414',3,'.2.14.1414.141415.'),('141416','EL CARAON','1414',3,'.2.14.1414.141416.'),('141417','EL TEMPISQUE','1414',3,'.2.14.1414.141417.'),('141418','PAVANA','1414',3,'.2.14.1414.141418.'),('141419','EL TIZATIO','1414',3,'.2.14.1414.141419.'),('141420','CERCOS DE PIEDRA','1414',3,'.2.14.1414.141420.'),('1415','SAN JOSE','14',2,'.2.14.1415.'),('141501','EL SOMBRERITO','1415',3,'.2.14.1415.141501.'),('141502','EL ZAPOTE','1415',3,'.2.14.1415.141502.'),('141503','LA JOYA','1415',3,'.2.14.1415.141503.'),('141504','EL CHAGUITILLO','1415',3,'.2.14.1415.141504.'),('1416','SANTA ROSA DE LIMA','14',2,'.2.14.1416.');
/*!40000 ALTER TABLE `geografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicador`
--

DROP TABLE IF EXISTS `indicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicador` (
  `IdIndicador` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador del indicador o toma de signos en la enfermería ',
  `IdConsulta` int(11) NOT NULL COMMENT 'Es el identificador de la consulta ',
  `Peso` float NOT NULL COMMENT 'Indica el peso de la persona ',
  `UnidadPeso` int(11) NOT NULL COMMENT 'Indica la unidad de medida del peso ',
  `Altura` float NOT NULL COMMENT 'Indica la altura ',
  `UnidadAltura` int(11) NOT NULL COMMENT 'Indica la unidad de medida de la altura ',
  `Temperatura` float NOT NULL COMMENT 'Indica la temperatura de la persona ',
  `UnidadTemperatura` int(11) NOT NULL COMMENT 'Indica la unidade de medida de la temperatura ',
  `Pulso` varchar(11) NOT NULL COMMENT 'Indica el pulso de la persona ',
  `PresionMax` int(11) NOT NULL COMMENT 'Indica la presión maxima de la persona ',
  `PresionMin` int(11) NOT NULL COMMENT 'Indica la presión minima de la persona ',
  `Observaciones` longtext COMMENT 'Observaciones o notas adicionales ',
  `PeriodoMeunstral` varchar(10) DEFAULT NULL,
  `Glucotex` varchar(45) DEFAULT NULL,
  `PC` varchar(45) DEFAULT NULL,
  `PT` varchar(45) DEFAULT NULL,
  `PA` varchar(45) DEFAULT NULL,
  `FR` varchar(45) DEFAULT NULL,
  `PAP` varchar(10) DEFAULT NULL,
  `Motivo` longtext,
  PRIMARY KEY (`IdIndicador`),
  KEY `fk_tbl_indicador_tbl_consulta1_idx` (`IdConsulta`),
  CONSTRAINT `fk_tbl_indicador_tbl_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicador`
--

LOCK TABLES `indicador` WRITE;
/*!40000 ALTER TABLE `indicador` DISABLE KEYS */;
INSERT INTO `indicador` VALUES (1,1,16.8,1,1.36,1,35.3,1,'695',130,30,' Ninguna','','689','','','','45.3','','Ninguna '),(2,2,120,1,1.2,1,12,1,'120',120,12,' ','','120','120','120','120','120','','Dolor de Cabeza '),(3,3,999.9,1,9.99,1,99.9,1,'999',999,99,' ','2099/09/dd','999','','','','9999','2099/09/09','dolor de muela '),(4,4,222.2,1,2.22,1,22.2,1,'222',222,22,' ','','22','','','','222','',' Dolor de Pie'),(5,5,111.1,1,1.11,1,11.1,1,'111',111,11,' ','','111','','','','111','',' Revision por sutura'),(6,6,222.2,1,2.22,1,22.2,1,'222',222,22,' ','','2222','','','','2222','','UN DOLOR EN LA ESPALDA'),(7,7,122.2,1,1.22,1,12.2,1,'122',122,12,' ','','1212','','','','1222','',' DOLOR DE BRAZO'),(8,10,1.79999,1,1.11,1,35.3,1,'222',999,12,' NADA','2099/09/09','689','120','120','120','9999','2099/09/09','NADA '),(9,9,111111000000000,1,1111,1,111111000000,1,'1111111',11,11,' esta es la prueba del dia','','11111','','','','111','','esta es la prueba del dia '),(10,11,111.1,1,1.11,1,33.3,1,'333',333,33,'OBSERVACIONES ','2018/01/01','333','333','333','333','333','2018/01/01','MOTIVO DE VISITA '),(11,12,1.79999,1,40,1,78,1,'78',78,78,' llega por dolor en la espalda','','78','','','','78','','dolor en la espalda '),(12,13,1.79999,1,170,1,34,1,'333',333,33,' Esta es una prueba con el lenguaje ingles','','333','','','','333','','  Esta es una prueba otra con el lenguaje ingles');
/*!40000 ALTER TABLE `indicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratorio` (
  `IdLaboratorio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el indentificador del laboratorio',
  `NombreLaboratorio` varchar(50) DEFAULT NULL COMMENT 'Indica el nombre del labortorio',
  PRIMARY KEY (`IdLaboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,'GAMMA'),(2,'SUIZOS'),(3,'TERAMED');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listaexamen`
--

DROP TABLE IF EXISTS `listaexamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listaexamen` (
  `IdListaExamen` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) DEFAULT NULL,
  `IdConsulta` int(11) DEFAULT NULL,
  `IdPersona` int(11) DEFAULT NULL,
  `IdTipoExamen` int(11) DEFAULT NULL,
  `Activo` int(11) DEFAULT NULL,
  `FechaExamen` date DEFAULT NULL,
  `Indicacion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdListaExamen`),
  KEY `fk_listaexamen_persona1_idx` (`IdPersona`),
  KEY `fk_listaexamen_tipoexamen1_idx` (`IdTipoExamen`),
  KEY `fk_listaexamen_usuario1_idx` (`IdUsuario`),
  KEY `fk_listaexamen_consulta1_idx` (`IdConsulta`),
  CONSTRAINT `fk_listaexamen_consulta1` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_listaexamen_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_listaexamen_tipoexamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_listaexamen_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listaexamen`
--

LOCK TABLES `listaexamen` WRITE;
/*!40000 ALTER TABLE `listaexamen` DISABLE KEYS */;
INSERT INTO `listaexamen` VALUES (1,4,1,2,2,0,'2018-10-18','General de Heces'),(2,5,NULL,2,1,0,'2018-10-18','Examen General '),(3,5,NULL,2,1,0,'2018-10-18','examen'),(4,7,6,2,3,0,'2018-10-19','GENERAL DE ORINA'),(5,4,7,2,1,0,'2018-10-19','LEOCOGRAMA'),(15,4,9,2,3,0,'2019-01-10','Examen de orina esta es otra prueba'),(16,4,9,2,1,0,'2019-01-10','Examen Hemograma Prueba'),(17,4,9,2,4,0,'2019-01-10','Examen Quimico'),(18,4,9,2,5,0,'2019-01-10','Examen Varios'),(19,4,12,2,2,0,'2019-01-12','Examen de Heces'),(21,1,NULL,2,3,1,'2019-01-12','Este es una prueba de un examen de orina desde un paciente externo');
/*!40000 ALTER TABLE `listaexamen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logexamenes`
--

DROP TABLE IF EXISTS `logexamenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logexamenes` (
  `IdRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  `IdTipoExamen` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`IdRegistro`,`IdUsuario`,`IdPersona`,`IdTipoExamen`),
  KEY `fk_logExamenes_persona1_idx` (`IdPersona`),
  KEY `fk_logExamenes_usuario1_idx` (`IdUsuario`),
  KEY `fk_logExamenes_tipoExamen1_idx` (`IdTipoExamen`),
  CONSTRAINT `fk_logExamenes_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logExamenes_tipoExamen1` FOREIGN KEY (`IdTipoExamen`) REFERENCES `tipoexamen` (`IdTipoExamen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_logExamenes_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logexamenes`
--

LOCK TABLES `logexamenes` WRITE;
/*!40000 ALTER TABLE `logexamenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `logexamenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotes` (
  `IdLote` int(11) NOT NULL AUTO_INCREMENT,
  `IdMedicamento` int(11) NOT NULL,
  `CodigoLote` varchar(45) DEFAULT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `FechaExpedicion` date DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL,
  `Ubicacion` varchar(100) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdLote`,`IdMedicamento`),
  KEY `fk_lotes_medicamentos1_idx` (`IdMedicamento`),
  CONSTRAINT `fk_lotes_medicamentos1` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `IdMarca` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la marca ',
  `IdLaboratorio` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL COMMENT 'Indica el nombre de la marca ',
  PRIMARY KEY (`IdMarca`),
  KEY `fk_tbl_marca_Laboratorio1_idx` (`IdLaboratorio`),
  CONSTRAINT `fk_tbl_marca_Laboratorio1` FOREIGN KEY (`IdLaboratorio`) REFERENCES `laboratorio` (`IdLaboratorio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentolote`
--

DROP TABLE IF EXISTS `medicamentolote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentolote` (
  `IdMedicamento` int(11) NOT NULL,
  `CodigoLote` varchar(45) NOT NULL,
  `FechaEntrada` date NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `CostoUnitario` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `CostoTotal` decimal(10,2) NOT NULL,
  `FechaExpedicion` date NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `lote` varchar(45) NOT NULL,
  `Activo` int(11) NOT NULL,
  KEY `fk_medicamentos_medicamentolote1_idx` (`IdMedicamento`),
  KEY `fk_usuario_medicamentolote1_idx` (`IdUsuario`),
  CONSTRAINT `fk_medicamentos_medicamentolote1_idx` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentolote`
--

LOCK TABLES `medicamentolote` WRITE;
/*!40000 ALTER TABLE `medicamentolote` DISABLE KEYS */;
INSERT INTO `medicamentolote` VALUES (9,'acet123','2016-08-23','2017-09-09',2.00,500,1000.00,'2016-08-21',7,'',1),(12,'sine1','2016-08-26','2017-08-09',5.00,500,2500.00,'2016-08-25',7,'321',0),(11,'rivo1','2016-08-26','2016-09-09',5.00,500,2500.00,'2016-09-09',7,'321',0),(11,'rivo1','2016-08-26','2016-09-09',5.00,500,2500.00,'2016-09-09',7,'321',0),(11,'rivo1','2016-08-26','2016-09-09',5.00,500,2500.00,'2016-09-09',7,'321',0),(11,'rivo1','2016-08-26','2016-09-09',5.00,500,2500.00,'2016-09-09',7,'321',0),(11,'rivo1','2016-08-26','2016-09-09',5.00,500,2500.00,'2016-09-09',7,'321',0),(9,'ace','2016-08-26','2016-09-09',1.00,23,23.00,'2016-09-09',7,'2134',0),(11,'111111','2016-08-26','2016-08-09',2.00,333,666.00,'2016-09-08',7,'111',1);
/*!40000 ALTER TABLE `medicamentolote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamentos` (
  `IdMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMedicamento` varchar(100) NOT NULL,
  `NombreComercial` varchar(100) NOT NULL,
  `Codigo` varchar(45) NOT NULL,
  `Lote` varchar(45) NOT NULL,
  `IdPresentacion` int(11) NOT NULL,
  `IdLaboratorio` int(11) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  `Concentracion` varchar(45) NOT NULL,
  `IdUnidadMedida` int(11) NOT NULL,
  `Existencia` int(11) NOT NULL,
  `PrecioUnitario` double(10,2) NOT NULL,
  `PrecioLote` double(10,2) NOT NULL,
  `FechaIngreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FechaExpedicion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `FechaVencimiento` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`IdMedicamento`,`IdLaboratorio`,`IdCategoria`,`IdUnidadMedida`),
  KEY `fk_medicamentos_laboratorio1_idx` (`IdLaboratorio`),
  KEY `fk_medicamentos_categoria1_idx` (`IdCategoria`),
  KEY `fk_medicamentos_unidadmedida1_idx` (`IdUnidadMedida`),
  CONSTRAINT `fk_medicamentos_categoria1` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicamentos_laboratorio1` FOREIGN KEY (`IdLaboratorio`) REFERENCES `laboratorio` (`IdLaboratorio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicamentos_unidadmedida1` FOREIGN KEY (`IdUnidadMedida`) REFERENCES `unidadmedida` (`IdUnidadMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (9,'Acetaminofen','','','',1,1,1,'',1,20,40.00,0.00,'2016-09-10 15:23:42','0000-00-00 00:00:00','2016-10-31 07:00:00',1),(10,'Varteral','','','',1,1,1,'',1,100,40.00,0.00,'2016-09-06 06:04:06','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(11,'Rivotril','Rivotril Comercial','','',2,3,1,'1000',1,100,100.00,0.00,'2016-09-06 06:03:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(12,'Sinemet','Sinemet comercial','','',1,3,3,'200',2,-50,100.00,0.00,'2016-09-08 05:09:55','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(13,'prueba','pruebacomer','','',1,1,1,'2',1,100,1.00,0.00,'2016-09-06 06:03:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(14,'prueba sin existencia','test 2','','',2,2,4,'32',2,100,2.00,0.00,'2016-09-06 06:03:17','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(15,'orthodel','orthodelplus','ortho123','1234321',1,1,1,'50',1,100,1.00,500.00,'2016-09-06 06:03:17','2015-09-01 07:00:00','0000-00-00 00:00:00',1),(16,'orthodel2','orthodelplus2','ortho123','1234321',1,1,1,'50',1,100,1.00,500.00,'2016-09-06 06:03:17','2015-09-01 07:00:00','0000-00-00 00:00:00',1),(17,'cipro','ciprofroxacina','cip123','54321',2,3,1,'200',2,100,2.00,200.00,'2016-09-06 06:03:17','2015-09-30 07:00:00','2017-09-30 07:00:00',1),(18,'anaf','anaflat','anaf321','321',2,3,3,'2',2,90,2.00,200.00,'2016-09-10 15:32:16','2015-09-30 07:00:00','2017-09-30 07:00:00',1),(19,'diclofenac','orfenaflex','diclo123','tre234',1,3,1,'500',1,0,1.00,10.00,'2016-09-08 21:59:02','2015-09-01 07:00:00','2017-09-30 07:00:00',1),(20,'Diclofenac','volclofen','diclo123','diclo321',2,3,10,'75',1,389,2.00,1000.00,'2016-09-10 15:23:42','2015-10-01 06:00:00','2017-09-30 06:00:00',1),(21,'ranit','rsnitidina','ra123','lo123',2,3,1,'1000',1,200,1.00,200.00,'2016-09-10 00:28:23','2015-09-09 06:00:00','2016-12-31 06:00:00',1),(22,'valium','diazepam','diaze123','r1r2j3',2,1,8,'500',1,200,0.12,24.00,'2016-09-10 15:28:39','2015-09-09 06:00:00','2016-09-30 06:00:00',1);
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `IdMenu` int(11) NOT NULL AUTO_INCREMENT,
  `DescripcionMenu` varchar(60) NOT NULL,
  `DescripcionMenuIng` varchar(45) NOT NULL,
  `Icono` varchar(400) NOT NULL,
  `TipoMenu` varchar(45) NOT NULL,
  PRIMARY KEY (`IdMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'ADMIN USUARIOS','ADMIN USERS','fa fa-user-o','Menu'),(2,'ADMIN MEDICOS','ADMIN PHYSICIANS','fa fa-stethoscope','Menu'),(3,'SOCIOECONOMICO','SOCIOECONOMIC','fa fa-dollar','Menu'),(4,'MANTENIMIENTO','MAINTENANCE','fa fa-database','Menu'),(5,'RECEPCION','RECEPTION','fa fa-medkit','Menu'),(6,'ENFERMERIA','NURSING','fa fa-medkit','Menu'),(7,'CONSULTA MEDICA','MEDICAL EXAM','fa fa-medkit','Menu'),(8,'LABORATORIO','LABORATORY','fa fa-medkit','Menu');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menudetalle`
--

DROP TABLE IF EXISTS `menudetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menudetalle` (
  `IdMenuDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `IdMenu` int(11) NOT NULL,
  `DescripcionMenuDetalle` varchar(400) DEFAULT NULL,
  `Url` varchar(400) DEFAULT NULL,
  `Icono` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdMenuDetalle`),
  KEY `fk_menudetalle_menu_idx` (`IdMenu`),
  CONSTRAINT `fk_menudetalle_menu1` FOREIGN KEY (`IdMenu`) REFERENCES `menu` (`IdMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menudetalle`
--

LOCK TABLES `menudetalle` WRITE;
/*!40000 ALTER TABLE `menudetalle` DISABLE KEYS */;
INSERT INTO `menudetalle` VALUES (1,1,'USUARIOS','../usuario/index','fa fa-user-circle-o'),(2,1,'PUESTO','../puesto/index','fa fa-briefcase'),(3,2,'ENFERMED','../enfermedad/index','fa fa-archive'),(4,2,'MODULO','../modulo/index','fa fa-bookmark-o'),(5,2,'DIAGNOSTIC','../tipodiagnostico/index','fa fa-book'),(6,3,'PREGUNTAS','../pregunta/index','fa fa-arrows-h'),(7,3,'RESPUESTA','../respuesta/index','fa fa-arrows-v'),(8,3,'FACTOR','../factor/index','fa fa-asterisk'),(9,4,'GEOGRAFIA','../geografia/index','fa fa-arrows-alt'),(10,4,'PAIS','../pais/index','fa fa-arrows'),(11,4,'EST CIVIL','../estadocivil/index','fa fa-check-square-o'),(12,1,'MENU','../menu/index','fa fa-cog'),(13,1,'SUBMENU','../menudetalle/index','fa fa-cogs'),(14,1,'PERMISOS','../menuusuario/index','fa fa-crop'),(15,5,'PACIENTES','../persona/index','fa fa-users'),(16,5,'CONSULTA','../consultapaciente/index','fa fa-medkit'),(17,6,'CONSULTA','../enfermeriaconsulta/index','fa fa-medkit'),(18,6,'PROCEDIM','../enfermeriaprocedimiento/index','fa fa-heart'),(19,7,'CONSULTA','../consultamedico/index','fa fa-medkit'),(20,8,'EXAMENES','../laboratorioclinico/index','fa fa-medkit'),(21,8,'PACIENTES','../laboratoriopaciente/index','fa fa-medkit');
/*!40000 ALTER TABLE `menudetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuusuario`
--

DROP TABLE IF EXISTS `menuusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuusuario` (
  `IdMenuUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `IdMenuDetalle` int(11) NOT NULL,
  `MenuUsuarioActivo` varchar(1) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdMenu` int(11) DEFAULT NULL,
  `TipoPermiso` int(11) NOT NULL COMMENT 'Esto es lo que define si es un permiso para ingresar al menu o es permiso para ingresar a un crud 1 = menu 2 = crud',
  PRIMARY KEY (`IdMenuUsuario`),
  KEY `fk_menuusuario_usuario` (`IdUsuario`),
  KEY `fk_menuusuario_menudetalle_idx` (`IdMenuDetalle`),
  KEY `fk_menuusuario_menu_idx` (`IdMenu`),
  CONSTRAINT `fk_menuusuario_menu1` FOREIGN KEY (`IdMenu`) REFERENCES `menu` (`IdMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menuusuario_menudetalle1` FOREIGN KEY (`IdMenuDetalle`) REFERENCES `menudetalle` (`IdMenuDetalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menuusuario_usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuusuario`
--

LOCK TABLES `menuusuario` WRITE;
/*!40000 ALTER TABLE `menuusuario` DISABLE KEYS */;
INSERT INTO `menuusuario` VALUES (1,1,'1',1,1,1),(2,2,'1',1,1,1),(3,3,'1',1,2,1),(4,4,'1',1,2,1),(5,5,'1',1,2,1),(6,6,'1',1,3,1),(7,7,'1',1,3,1),(8,8,'1',1,3,1),(9,9,'1',1,4,1),(10,10,'1',1,4,1),(11,11,'1',1,4,1),(12,12,'1',1,1,1),(13,13,'1',1,1,1),(14,14,'1',1,1,1),(15,15,'1',1,5,1),(16,16,'1',1,5,1),(17,17,'1',1,6,1),(18,18,'1',1,6,1),(19,19,'1',1,7,1),(20,20,'1',1,8,1),(21,21,'1',1,8,1);
/*!40000 ALTER TABLE `menuusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `IdModulo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreModulo` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (3,'Pediatria','Pediatrics',''),(4,'Laboratorio','Laboratory',''),(5,'Enfermeria','Nursing',''),(6,'Medicina General','General Medicine',''),(7,'Ginecologia','Gynecology','');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivoprocedimiento`
--

DROP TABLE IF EXISTS `motivoprocedimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivoprocedimiento` (
  `IdMotivoProcedimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`IdMotivoProcedimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivoprocedimiento`
--

LOCK TABLES `motivoprocedimiento` WRITE;
/*!40000 ALTER TABLE `motivoprocedimiento` DISABLE KEYS */;
INSERT INTO `motivoprocedimiento` VALUES (1,'Curaciones'),(2,'Inyecciones'),(3,'Terapias Respiratorias'),(4,'Canalizacion de Vena'),(5,'Onicptomia'),(6,'Sutura'),(7,'Retiro de Puntos'),(8,'Colocacion de STU');
/*!40000 ALTER TABLE `motivoprocedimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `IdMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMovimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdMovimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,'Entrada'),(2,'Salida'),(3,'Baja por Vencimiento'),(4,'Baja por Deterioro'),(5,'Baja por Donacion');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `IdPais` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePais` varchar(100) NOT NULL,
  PRIMARY KEY (`IdPais`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (36,'Catar'),(37,'Chad'),(38,'Chile'),(39,'China'),(40,'Chipre'),(41,'Ciudad del Vaticano'),(42,'Colombia'),(43,'Comoras'),(44,'Corea del Norte'),(45,'Corea del Sur'),(46,'Costa de Marfil'),(47,'Costa Rica'),(48,'Croacia'),(49,'Cuba'),(50,'Dinamarca'),(51,'Dominica'),(52,'Ecuador'),(53,'Egipto'),(54,'El Salvador'),(55,'Emiratos arabes Unidos'),(56,'Eritrea'),(57,'Eslovaquia'),(58,'Eslovenia'),(59,'Espana'),(60,'Estados Unidos'),(61,'Estonia'),(62,'Etiopia'),(63,'Filipinas'),(64,'Finlandia'),(65,'Fiyi'),(66,'Francia'),(67,'Gabon'),(68,'Gambia'),(69,'Georgia'),(70,'Ghana'),(71,'Granada'),(72,'Grecia'),(73,'Guatemala'),(74,'Guyana'),(75,'Guinea'),(76,'Guinea ecuatorial'),(77,'Guinea-Bisau'),(78,'Haiti'),(79,'Honduras'),(80,'Hungria'),(81,'India'),(82,'Indonesia'),(83,'Irak'),(84,'Iran'),(85,'Irlanda'),(86,'Islandia'),(87,'Islas Marshall'),(88,'Islas Salomon'),(89,'Israel'),(90,'Italia'),(91,'Jamaica'),(92,'Japon'),(93,'Jordania'),(94,'Kazajistan'),(95,'Kenia'),(96,'Kirguistan'),(97,'Kiribati'),(98,'Kuwait'),(99,'Laos'),(100,'Lesoto'),(101,'Letonia'),(102,'Libano'),(103,'Liberia'),(104,'Libia'),(105,'Liechtenstein'),(106,'Lituania'),(107,'Luxemburgo'),(108,'Madagascar'),(109,'Malasia'),(110,'Malaui'),(111,'Maldivas'),(112,'Mali'),(113,'Malta'),(114,'Marruecos'),(115,'Mauricio'),(116,'Mauritania'),(117,'Mexico'),(118,'Micronesia'),(119,'Moldavia'),(120,'Monaco'),(121,'Mongolia'),(122,'Montenegro'),(123,'Mozambique'),(124,'Namibia'),(125,'Nauru'),(126,'Nepal'),(127,'Nicaragua'),(128,'Niger'),(129,'Nigeria'),(130,'Noruega'),(131,'Nueva Zelanda'),(132,'Oman'),(133,'Paises Bajos'),(134,'Pakistan'),(135,'Palaos'),(136,'Panama'),(137,'Papua Nueva Guinea'),(138,'Paraguay'),(139,'Peru'),(140,'Polonia'),(141,'Portugal'),(142,'Reino Unido'),(143,'Republica Centroafricana'),(144,'Republica Checa'),(145,'Republica de Macedonia'),(146,'Republica del Congo'),(147,'Republica Democratica del Congo'),(148,'Republica Dominicana'),(149,'Republica Sudafricana'),(150,'Ruanda'),(151,'Rumania'),(152,'Rusia'),(153,'Samoa'),(154,'San Cristobal y Nieves'),(35,'Canada'),(34,'Camerun'),(33,'Camboya'),(32,'Cabo Verde'),(31,'Butan'),(30,'Burundi'),(29,'Burkina Faso'),(28,'Bulgaria'),(27,'Brunei'),(26,'Brasil'),(25,'Botsuana'),(24,'Bosnia y Herzegovina'),(23,'Bolivia'),(22,'Birmania'),(21,'Bielorrusia'),(20,'Benin'),(19,'Belice'),(18,'Belgica'),(17,'Barein'),(16,'Barbados'),(15,'Banglades'),(14,'Bahamas'),(13,'Azerbaiyan'),(12,'Austria'),(11,'Australia'),(10,'Armenia'),(9,'Argentina'),(8,'Argelia'),(7,'Arabia Saudita'),(6,'Antigua y Barbuda'),(5,'Angola'),(4,'Andorra'),(3,'Alemania'),(2,'Albania'),(1,'Afganistan'),(155,'San Marino'),(156,'San Vicente y las Granadinas'),(157,'Santa Lucia'),(158,'Santo Tome y Principe'),(159,'Senegal'),(160,'Serbia'),(161,'Seychelles'),(162,'Sierra Leona'),(163,'Singapur'),(164,'Siria'),(165,'Somalia'),(166,'Sri Lanka'),(167,'Suazilandia'),(168,'Sudan'),(169,'Sudan del Sur'),(170,'Suecia'),(171,'Suiza'),(172,'Surinam'),(173,'Tailandia'),(174,'Tanzania'),(175,'Tayikistan'),(176,'Timor Oriental'),(177,'Togo'),(178,'Tonga'),(179,'Trinidad y Tobago'),(180,'Tunez'),(181,'Turkmenistan'),(182,'Turquia'),(183,'Tuvalu'),(184,'Ucrania'),(185,'Uganda'),(186,'Uruguay'),(187,'Uzbekistan'),(188,'Vanuatu'),(189,'Venezuela'),(190,'Vietnam'),(191,'Yemen'),(192,'Yibuti'),(193,'Zambia'),(194,'Zimbabue');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `IdPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'ADMIN'),(2,'MEDICO');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la persona (paciente)',
  `Nombres` varchar(100) NOT NULL COMMENT 'Indica los nombres de la persona ',
  `Apellidos` varchar(100) NOT NULL COMMENT 'Indica los apellidos de la persona ',
  `FechaNacimiento` date DEFAULT NULL COMMENT 'Indica la fecha de nacimiento de la persona ',
  `Direccion` varchar(500) DEFAULT NULL COMMENT 'Indica la direcciÃ³n del domicilio de la persona ',
  `Correo` varchar(100) DEFAULT NULL COMMENT 'Indica el correo electrÃ³nico de la persona ',
  `IdGeografia` varchar(20) DEFAULT NULL COMMENT 'Es el identificador de la zona geogrÃ¡fica ',
  `Genero` char(9) DEFAULT NULL COMMENT 'Indica el genero de la persona ',
  `IdEstadoCivil` int(11) DEFAULT NULL COMMENT 'Es el identificador del estado civil de la persona ',
  `IdParentesco` varchar(100) DEFAULT NULL COMMENT 'Es el identificador del parentesco ',
  `Telefono` varchar(15) DEFAULT NULL,
  `Celular` varchar(15) DEFAULT NULL,
  `Alergias` varchar(800) DEFAULT NULL,
  `Medicamentos` varchar(800) DEFAULT NULL,
  `Enfermedad` varchar(800) DEFAULT NULL,
  `Dui` varchar(15) DEFAULT NULL,
  `TelefonoResponsable` varchar(15) DEFAULT NULL,
  `IdEstado` int(2) NOT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `NombresResponsable` varchar(100) DEFAULT NULL COMMENT 'Es el identificador del responsable (en caso de que sea menor de edad)',
  `ApellidosResponsable` varchar(100) DEFAULT NULL,
  `Parentesco` varchar(45) DEFAULT NULL,
  `DuiResponsable` varchar(45) DEFAULT NULL,
  `IdPais` int(11) DEFAULT '54',
  PRIMARY KEY (`IdPersona`),
  KEY `fk_tbl_persona_tbl_geografia1_idx` (`IdGeografia`),
  KEY `fk_tbl_persona_tbl_estado_civil1_idx` (`IdEstadoCivil`),
  KEY `fk_tbl_persona_tbl_estado1_idx` (`IdEstado`),
  CONSTRAINT `fk_tbl_persona_tbl_estado1` FOREIGN KEY (`IdEstado`) REFERENCES `estado` (`IdEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_persona_tbl_estadocivil1` FOREIGN KEY (`IdEstadoCivil`) REFERENCES `estadocivil` (`IdEstadoCivil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_persona_tbl_geografia1` FOREIGN KEY (`IdGeografia`) REFERENCES `geografia` (`IdGeografia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (2,'NESTOR','ULLOA','1985-07-22','RTP LOS HEROES','ulloa.nestor22@gmail.com','0101','Masculino',1,'1','2272-5122','7873-9382','Una alergia','Un Medicamento','Una Enfermedad','99999999-9','',6,'A','Katt','Ulloa','ESPOSA','03132484-3',54),(3,'Katia','Ulloa','1986-10-10','Calle Al Bambu Pasaje La Prima, 6','katty@gmail.com','0610','Femenino',2,NULL,'6666-6666','3333-3333','NINGUNA ALERGIA','NINGUN MEDICAMENTO','NINGUNA ENFERMEDAD','66666666-6','4444-4444',1,'A','Nestor','Ulloa','ESPOSO','66666666-6',54);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `IdPregunta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la pregunta ',
  `IdFactor` int(11) NOT NULL COMMENT 'Es el identificador del factor con la ponderación ',
  `Nombre` varchar(100) DEFAULT NULL COMMENT 'Indica el nombre de la pregunta ',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción de la pregunta ',
  `Ponderacion` float DEFAULT NULL COMMENT 'Indica la ponderación de la pregunta ',
  `Activo` varchar(1) DEFAULT NULL COMMENT 'Indica el estado (activo o inactivo)',
  PRIMARY KEY (`IdPregunta`),
  KEY `fk_tbl_pregunta_tbl_factor1_idx` (`IdFactor`),
  CONSTRAINT `fk_tbl_pregunta_tbl_factor1` FOREIGN KEY (`IdFactor`) REFERENCES `factor` (`IdFactor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,1,'Profesional','Profesional',0,'1'),(2,1,'Posee trabajo','Posee trabajo',0,'1'),(3,1,'Su cónyuge es profesional','Su cónyuge es profesional',0,'1'),(4,1,'Cúantos hijos tiene','Cúantos hijos tiene',0,'1'),(5,1,'Tiene familiares viviendo en el extranjero, le envían ayuda','Tiene familiares viviendo en el extranjero, le envían ayuda',0,'1'),(6,1,'Su familia posee vehículo o moto','Su familia posee vehículo o moto',0,'1'),(7,1,'Tipo de vivienda','Tipo de vivienda',0,'1'),(8,1,'Número de personas que vivien en la vivienda','Número de personas que vivien en la vivienda',0,'1'),(9,1,'Poseen televisor','Poseen televisor',0,'1'),(10,1,'Poseen refrigeradora','Poseen refrigeradora',0,'1'),(11,1,'Su vivienda tiene agua potable','Su vivienda tiene agua potable',0,'1'),(12,1,'Su vivienda tiene energía eléctrica','Su vivienda tiene energía eléctrica',0,'1'),(13,1,'Alquilan o son dueños de su vivienda','Alquilan o son dueños de su vivienda',0,'1'),(14,2,'Alergias a Medicamentos','Allergies to medications',1,'1'),(15,2,'Alergias a Medicamentos u otros elementos','Allergies to other elements',1,'1'),(16,2,'Medicamentos que esta tomando actualmente','Taking medications currently?',1,'1'),(17,2,'Por favor indique si padece alguna de estas enfermedades ahorita en el pasado','Please indicate if you have any of these illnesses currently or in the past',2,'1'),(18,2,'Ha recibido alguna cirugia?','Have you undergone surgery at anytime?',1,'1'),(19,2,'El paciente toma alcohol','Do you consume alcohol?',0,'1'),(20,2,'El paciente fuma?','Do you smoke?',0,'1'),(21,2,'Si el paciente fumo en el pasado. Cuando dejo de fumar?','If you smoked in the past, when did you stop?',1,'1'),(22,2,'Nivel de Ejercicio','Level of activity/exercise',0,'1'),(23,2,'Historial de Abuela Maternal','Maternal grandmother\'s health history',2,'1'),(24,2,'Historial de Abuelo Maternal','Maternal grandfather\'s health history',2,'1'),(25,2,'Historial de Abuela Paternal','Paternal grandmother\'s history',2,'1'),(26,2,'Historial de Abuelo Paternal','Paternal grandfather\'s health history',2,'1'),(27,2,'Historial de Padre','Father\'s health history',2,'1'),(28,2,'Historial de Madre','Mother\'s health history',2,'1'),(29,2,'Siente depresion y falta de interes en la vida?','Do you feel depressed or lack interest in life?',0,'1'),(30,2,'En alguna vez ha pensado en quitarse la vida (Suicidarse)?','At any time have you thought of suicide?',0,'1'),(31,3,'Esquema de Vacunación','Vaccination record',2,'1');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentacion` (
  `IdPresentacion` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePresentacion` varchar(100) NOT NULL,
  PRIMARY KEY (`IdPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'Pastillas de 500'),(2,'Pastillas de 1000');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `IdProveedor` int(11) NOT NULL COMMENT 'Es el identificador del proveedor ',
  `Nombre` varchar(50) DEFAULT NULL COMMENT 'Indica el nombre del proveedor ',
  `NombreJuridico` varchar(150) DEFAULT NULL COMMENT 'Indica el nombre jurídico del proveedor ',
  `Descripcion` varchar(500) DEFAULT NULL COMMENT 'Descripción del proveedor ',
  `RegistroIva` varchar(10) DEFAULT NULL COMMENT 'Indica el numero del registro de IVA ',
  `Nit` varchar(14) DEFAULT NULL COMMENT 'Indica el numero de NIT ',
  `Representante` varchar(50) DEFAULT NULL COMMENT 'Indica el representante legal de la proveedora ',
  `Direccion` varchar(50) DEFAULT NULL COMMENT 'Indica la dirección del proveedor ',
  `Correo` varchar(50) DEFAULT NULL COMMENT 'Indica el correo electrónico del proveedor ',
  PRIMARY KEY (`IdProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `idPuesto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idPuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'Administrador'),(2,'Medico'),(3,'Laboratorio'),(4,'Farmacia'),(5,'Enfermera'),(6,'Recepcionista'),(9,'Odontologias'),(10,'Pediatria');
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta` (
  `IdReceta` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  `IdConsulta` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IdReceta`),
  KEY `fk_receta_usuario1_idx` (`IdUsuario`),
  KEY `fk_receta_persona1_idx` (`IdPersona`),
  KEY `fk_receta_consulta1_idx` (`IdConsulta`),
  CONSTRAINT `fk_receta_consulta1_idx` FOREIGN KEY (`IdConsulta`) REFERENCES `consulta` (`IdConsulta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_persona1_idx` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_usuario1_idx` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,7,2,4,'2018-10-18','');
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_medicamentos`
--

DROP TABLE IF EXISTS `receta_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta_medicamentos` (
  `IdReceta` int(11) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT '0',
  `Horas` int(11) DEFAULT '0',
  `Dias` int(11) DEFAULT '0',
  `Total` int(11) DEFAULT NULL,
  `Indicacion` varchar(1000) DEFAULT NULL,
  KEY `fk_receta_medicamentos_receta1_idx` (`IdReceta`),
  KEY `fk_receta_medicamentos_medicamento1_idx` (`IdMedicamento`),
  CONSTRAINT `fk_receta_medicamentos_medicamentos1` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_medicamentos_receta1` FOREIGN KEY (`IdReceta`) REFERENCES `receta` (`IdReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_medicamentos`
--

LOCK TABLES `receta_medicamentos` WRITE;
/*!40000 ALTER TABLE `receta_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `IdRespuesta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la respuesta ',
  `IdPregunta` int(11) DEFAULT NULL COMMENT 'Es el identificador de la pregunta ',
  `Nombre` varchar(45) DEFAULT NULL COMMENT 'Indica el nombre de la respuesta ',
  `Descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripción de la respuesta ',
  `Ponderacion` float DEFAULT NULL COMMENT 'Indica la ponderación de la respuesta ',
  `Activo` varchar(1) DEFAULT NULL COMMENT 'Indica el estado (activo o inactivo)',
  PRIMARY KEY (`IdRespuesta`),
  KEY `fk_tbl_respuesta_tbl_pregunta1_idx` (`IdPregunta`),
  CONSTRAINT `fk_tbl_respuesta_tbl_pregunta1` FOREIGN KEY (`IdPregunta`) REFERENCES `pregunta` (`IdPregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES (1,1,'SI','SI',0,'1'),(2,1,'NO','NO',0,'1'),(3,2,'SI','SI',0,'1'),(4,2,'NO','NO',0,'1'),(5,3,'SI','SI',0,'1'),(6,3,'NO','NO',0,'1'),(7,3,'NO APLICA','NO APLICA',0,'1'),(8,4,'NO TIENE','NO TIENE',0,'1'),(9,4,'1','1',0,'1'),(10,4,'2','2',0,'1'),(11,4,'3','3',0,'1'),(12,4,'4','4',0,'1'),(13,4,'5','5',0,'1'),(14,4,'6','6',0,'1'),(15,4,'7','7',0,'1'),(16,4,'8','8',0,'1'),(17,4,'9','9',0,'1'),(18,4,'10','10',0,'1'),(19,4,'MAS DE 10','MAS DE 10',0,'1'),(20,5,'SI','SI',0,'1'),(21,5,'NO','NO',0,'1'),(22,6,'SI','SI',0,'1'),(23,6,'NO','NO',0,'1'),(24,7,'LAMINA','LAMINA',0,'1'),(25,7,'BAHAREQUE','BAHREQUE',0,'1'),(26,7,'BLOQUE MIXTO','BLOQUE MIXTO',0,'1'),(27,7,'OTRO','OTRO',0,'1'),(28,8,'1','1',0,'1'),(29,8,'2','2',0,'1'),(30,8,'3','3',0,'1'),(31,8,'4','4',0,'1'),(32,8,'5','5',0,'1'),(33,8,'6','6',0,'1'),(34,8,'7','7',0,'1'),(35,8,'8','8',0,'1'),(36,8,'9','9',0,'1'),(37,8,'10','10',0,'1'),(38,8,'MAS DE 10','MAS DE 10',0,'1'),(39,9,'SI','SI',0,'1'),(40,9,'NO','NO',0,'1'),(41,10,'SI','SI',0,'1'),(42,10,'NO','NO',0,'1'),(43,11,'SI','SI',0,'1'),(44,11,'NO','NO',0,'1'),(45,12,'SI','SI',0,'1'),(46,12,'NO','NO',0,'1'),(47,13,'ALQUILO','ALQUILO',0,'1'),(48,13,'PROPIO','PROPIO',0,'1'),(49,13,'OTRO','OTRO',0,'1'),(50,17,'Artritis','Artritis',0,'1'),(51,17,'Asma','Asma',0,'1'),(52,17,'Cancer','Cancer',0,'1'),(53,17,'Gota','Gota',0,'1'),(54,17,'Diabetes','Diabetes',0,'1'),(55,17,'Falla  Renal','Falla Renal',0,'1'),(56,17,'Hipertension','Hipertension',0,'1'),(57,17,'Problemas de Tiroides','Problemas de Tiroides',0,'1'),(58,17,'Calculo de Riñon','',0,'1'),(59,17,'Calculo de vesicula',NULL,0,'1'),(60,17,'Enfermedad Hepatica',NULL,0,'1'),(61,17,'Osteoporosis',NULL,0,'1'),(62,17,'Infarto',NULL,0,'1'),(63,17,'Hernia',NULL,0,'1'),(64,17,'Sida VIH',NULL,0,'1'),(65,17,'Colesterol Alto',NULL,0,'1'),(66,17,'Reflujo gastrico',NULL,0,'1'),(67,17,'Neumonia',NULL,0,'1'),(68,17,'Diverticulosis',NULL,0,'1'),(69,17,'Soplo en el corazon',NULL,0,'1'),(70,17,'Posee marcapaso',NULL,0,'1'),(71,17,'Derrame cerebral','',0,'1'),(72,17,'Tuberculosis',NULL,0,'1'),(73,17,'Ulcera gastrica',NULL,0,'1'),(74,17,'Hepatitis',NULL,0,'1'),(75,19,'No',NULL,0,'1'),(76,19,'Ocacionalmente',NULL,0,'1'),(77,19,'Menos de 3 veces por semana',NULL,0,'1'),(78,19,'Mas de 3 veces por semana',NULL,0,'1'),(79,20,'No',NULL,0,'1'),(80,20,'Si',NULL,0,'1'),(81,22,'Nada',NULL,0,'1'),(82,22,'Ocacionalmente',NULL,0,'1'),(83,22,'1 a 2 veces por semana',NULL,0,'1'),(84,22,'Mas de 3 veces por semana',NULL,0,'1'),(85,23,'Cancer',NULL,0,'1'),(86,23,'Diabetes',NULL,0,'1'),(87,23,'Enfermedad Cardiaca',NULL,0,'1'),(88,23,'Hipertension',NULL,0,'1'),(89,23,'Osteoporosis',NULL,0,'1'),(90,23,'Derrame Cerebral',NULL,0,'1'),(91,24,'Cancer',NULL,0,'1'),(92,24,'Diabetes',NULL,0,'1'),(93,24,'Enfermedad Cardiaca',NULL,0,'1'),(94,24,'Hipertension',NULL,0,'1'),(95,24,'Osteoporosis',NULL,0,'1'),(96,25,'Derrame Cerebral',NULL,0,'1'),(97,25,'Cancer',NULL,0,'1'),(98,25,'Diabetes',NULL,0,'1'),(99,25,'Enfermedad Cardiaca',NULL,0,'1'),(100,25,'Hipertension',NULL,0,'1'),(101,25,'Osteoporosis',NULL,0,'1'),(102,25,'Derrame Cerebral',NULL,0,'1'),(103,26,'Cancer',NULL,0,'1'),(104,26,'Diabetes',NULL,0,'1'),(105,26,'Enfermedad Cardiaca',NULL,0,'1'),(106,26,'Hipertension',NULL,0,'1'),(107,26,'Osteoporosis',NULL,0,'1'),(108,26,'Derrame Cerebral',NULL,0,'1'),(109,27,'Cancer',NULL,0,'1'),(110,27,'Diabetes',NULL,0,'1'),(111,27,'Enfermedad Cardiaca',NULL,0,'1'),(112,27,'Hipertension',NULL,0,'1'),(113,27,'Osteoporosis',NULL,0,'1'),(114,27,'Derrame Cerebral',NULL,0,'1'),(115,28,'Cancer',NULL,0,'1'),(116,28,'Diabetes',NULL,0,'1'),(117,28,'Enfermedad Cardiaca',NULL,0,'1'),(118,28,'Hipertension',NULL,0,'1'),(119,28,'Osteoporosis',NULL,0,'1'),(120,28,'Derrame Cerebral',NULL,0,'1'),(121,29,'Si',NULL,0,'1'),(122,29,'No',NULL,0,'1'),(123,30,'Si',NULL,0,'1'),(124,30,'No',NULL,0,'1'),(125,31,'BCG',NULL,0,'1'),(126,31,'Hepatitis B',NULL,0,'1'),(127,31,'Pentavalente',NULL,0,'1'),(128,31,'Poliomielitis','',0,'1'),(129,31,'Rotavirus',NULL,0,'1'),(130,31,'Neumococo conjugado 13v',NULL,0,'1'),(131,31,'Triple viral tipo SPR',NULL,0,'1'),(132,31,'Neumococo conjugado 13  1er refuerzo',NULL,0,'1'),(133,31,'Pentavalente 1er refuerzo',NULL,0,'1'),(134,31,'Polio oral 1er refuerzo',NULL,0,'1'),(135,31,'DPT 2o refuerzo',NULL,0,'1'),(136,31,'Polio oral 2o refuerzo',NULL,0,'1'),(137,31,'Triple viral SPR',NULL,0,'1'),(138,31,'Tétano y difteria ',NULL,0,'1'),(139,31,'Numococo ',NULL,0,'1'),(140,31,'TDPA',NULL,0,'1'),(141,31,'Influenza',NULL,0,'1'),(142,17,'Ninguno',NULL,0,'1'),(143,23,'Ninguno',NULL,0,'1'),(144,24,'Ninguno',NULL,0,'1'),(145,25,'Ninguno',NULL,0,'1'),(146,26,'Ninguno',NULL,0,'1'),(147,27,'Ninguno',NULL,0,'1'),(148,28,'Ninguno',NULL,0,'1'),(149,31,'Ninguno',NULL,0,'1');
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidas` (
  `IdReceta` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `IdMovimiento` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  KEY `fk_salidas_receta1_idx` (`IdReceta`),
  KEY `fk_salidas_usuario1_idx` (`IdUsuario`),
  KEY `fk_salidas_medicamento1_idx` (`IdMedicamento`),
  KEY `fk_salidas_movimiento1_idx` (`IdMovimiento`),
  CONSTRAINT `fk_salidas_medicamento1_idx` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salidas_movimiento1_idx` FOREIGN KEY (`IdMovimiento`) REFERENCES `movimientos` (`IdMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salidas_receta1_idx` FOREIGN KEY (`IdReceta`) REFERENCES `receta` (`IdReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salidas_usuario1_idx` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `IdTest` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador del test de estudio socioeconomico ',
  `IdPersona` int(11) NOT NULL COMMENT 'Es el identificador de la persona (paciente) ',
  `IdClase` int(11) NOT NULL COMMENT 'Es el identificador de la clase del estudio socioeconomico ',
  `Fecha` date DEFAULT NULL COMMENT 'Indica la fecha del test ',
  `Hora` time DEFAULT NULL COMMENT 'Indica la hora del test ',
  PRIMARY KEY (`IdTest`),
  KEY `fk_tbl_test_tbl_clase1_idx` (`IdClase`),
  KEY `fk_tbl_test_tbl_persona1_idx` (`IdPersona`),
  CONSTRAINT `fk_tbl_test_tbl_persona1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,2,1,'2018-10-16','20:56:46'),(2,3,1,'2018-12-20','11:42:45');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdetalle`
--

DROP TABLE IF EXISTS `testdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdetalle` (
  `IdTestDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `IdTest` int(11) NOT NULL COMMENT 'Es el identificador del test socioeconomico ',
  `IdFactor` int(11) NOT NULL COMMENT 'Es el identificador del factor socioeconomico',
  `IdPregunta` int(11) NOT NULL COMMENT 'Es el identificador de la pregunta ',
  `IdRespuesta` int(11) DEFAULT NULL COMMENT 'Es el identificador de la respuesta ',
  `Detalle` varchar(5000) DEFAULT NULL COMMENT 'Campo para las respuestas abiertas.',
  PRIMARY KEY (`IdTestDetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdetalle`
--

LOCK TABLES `testdetalle` WRITE;
/*!40000 ALTER TABLE `testdetalle` DISABLE KEYS */;
INSERT INTO `testdetalle` VALUES (245,18,1,1,1,NULL),(246,18,1,2,3,NULL),(247,18,1,3,5,NULL),(248,18,1,4,8,NULL),(249,18,1,5,20,NULL),(250,18,1,6,22,NULL),(251,18,1,7,24,NULL),(252,18,1,8,28,NULL),(253,18,1,9,39,NULL),(254,18,1,10,41,NULL),(255,18,1,11,43,NULL),(256,18,1,12,45,NULL),(257,18,1,13,47,NULL),(269,19,1,1,1,NULL),(270,19,1,2,3,NULL),(271,19,1,3,5,NULL),(272,19,1,4,8,NULL),(273,19,1,5,20,NULL),(274,19,1,6,22,NULL),(275,19,1,7,24,NULL),(276,19,1,8,28,NULL),(277,19,1,9,39,NULL),(278,19,1,10,41,NULL),(279,19,1,11,43,NULL),(280,19,1,12,45,NULL),(281,19,1,13,47,NULL),(303,20,1,1,1,NULL),(304,20,1,2,3,NULL),(305,20,1,3,5,NULL),(306,20,1,4,8,NULL),(307,20,1,5,20,NULL),(308,20,1,6,22,NULL),(309,20,1,7,24,NULL),(310,20,1,8,28,NULL),(311,20,1,9,39,NULL),(312,20,1,10,41,NULL),(313,20,1,11,43,NULL),(314,20,1,12,45,NULL),(315,20,1,13,47,NULL),(337,21,1,1,1,NULL),(338,21,1,2,3,NULL),(339,21,1,3,5,NULL),(340,21,1,4,8,NULL),(341,21,1,5,20,NULL),(342,21,1,6,22,NULL),(343,21,1,7,24,NULL),(344,21,1,8,28,NULL),(345,21,1,9,39,NULL),(346,21,1,10,41,NULL),(347,21,1,11,43,NULL),(348,21,1,12,45,NULL),(349,21,1,13,47,NULL),(350,21,2,14,NULL,' Maní, huevos, sardinas'),(351,21,2,15,NULL,'Complejo B '),(352,21,2,16,NULL,'Enalapril '),(353,21,2,17,56,NULL),(354,21,2,18,NULL,'ninguna '),(355,21,2,19,76,NULL),(356,21,2,20,79,NULL),(357,21,2,21,NULL,'No aplica '),(358,21,2,22,82,NULL),(359,21,2,23,85,NULL),(360,21,2,23,88,NULL),(361,21,2,24,91,NULL),(362,21,2,25,100,NULL),(363,21,2,26,103,NULL),(364,21,2,26,106,NULL),(365,21,2,27,112,NULL),(366,21,2,28,118,NULL),(367,21,2,29,122,NULL),(368,21,2,30,124,NULL),(369,22,1,1,1,NULL),(370,22,1,2,4,NULL),(371,22,1,3,6,NULL),(372,22,1,4,8,NULL),(373,22,1,5,20,NULL),(374,22,1,6,22,NULL),(375,22,1,7,24,NULL),(376,22,1,8,28,NULL),(377,22,1,9,39,NULL),(378,22,1,10,41,NULL),(379,22,1,11,43,NULL),(380,22,1,12,45,NULL),(381,22,1,13,47,NULL),(382,22,2,14,NULL,'Mani'),(383,22,2,15,NULL,'Ninguna '),(384,22,2,16,NULL,'Ninguna '),(385,22,2,17,50,NULL),(386,22,2,17,53,NULL),(387,22,2,18,NULL,' No'),(388,22,2,19,76,NULL),(389,22,2,20,79,NULL),(390,22,2,21,NULL,' Nunca'),(391,22,2,22,81,NULL),(392,22,2,23,86,NULL),(393,22,2,24,93,NULL),(394,22,2,24,94,NULL),(395,22,2,25,96,NULL),(396,22,2,26,103,NULL),(397,22,2,27,112,NULL),(398,22,2,28,117,NULL),(399,22,2,29,122,NULL),(400,22,2,30,124,NULL),(401,23,1,1,1,NULL),(402,23,1,2,3,NULL),(403,23,1,3,5,NULL),(404,23,1,4,8,NULL),(405,23,1,5,20,NULL),(406,23,1,6,22,NULL),(407,23,1,7,24,NULL),(408,23,1,8,28,NULL),(409,23,1,9,39,NULL),(410,23,1,10,41,NULL),(411,23,1,11,44,NULL),(412,23,1,12,45,NULL),(413,23,1,13,47,NULL),(414,23,2,14,NULL,' nada'),(415,23,2,15,NULL,'nada '),(416,23,2,16,NULL,'nada '),(417,23,2,17,50,NULL),(418,23,2,18,NULL,'no '),(419,23,2,19,75,NULL),(420,23,2,20,79,NULL),(421,23,2,21,NULL,'no '),(422,23,2,22,81,NULL),(423,23,2,23,87,NULL),(424,23,2,24,93,NULL),(425,23,2,25,100,NULL),(426,23,2,26,104,NULL),(427,23,2,27,110,NULL),(428,23,2,28,118,NULL),(429,23,2,29,122,NULL),(430,23,2,30,124,NULL),(431,23,3,31,126,NULL),(432,23,3,31,127,NULL),(433,23,3,31,129,NULL),(434,23,3,31,138,NULL),(435,1,1,1,1,NULL),(436,1,1,2,4,NULL),(437,1,1,3,5,NULL),(438,1,1,4,10,NULL),(439,1,1,5,20,NULL),(440,1,1,6,22,NULL),(441,1,1,7,24,NULL),(442,1,1,8,28,NULL),(443,1,1,9,39,NULL),(444,1,1,10,41,NULL),(445,1,1,11,43,NULL),(446,1,1,12,45,NULL),(447,1,1,13,47,NULL),(448,1,2,14,NULL,'NO'),(449,1,2,15,NULL,'NO 	'),(450,1,2,16,NULL,'NO 	'),(451,1,2,17,52,NULL),(452,1,2,18,NULL,' NO'),(453,1,2,19,75,NULL),(454,1,2,20,79,NULL),(455,1,2,21,NULL,'NO 	'),(456,1,2,22,81,NULL),(457,1,2,23,85,NULL),(458,1,2,24,91,NULL),(459,1,2,25,99,NULL),(460,1,2,26,104,NULL),(461,1,2,27,109,NULL),(462,1,2,28,115,NULL),(463,1,2,29,122,NULL),(464,1,2,30,124,NULL),(465,1,3,31,125,NULL),(466,2,1,1,1,NULL),(467,2,1,2,3,NULL),(468,2,1,3,5,NULL),(469,2,1,4,8,NULL),(470,2,1,5,20,NULL),(471,2,1,6,22,NULL),(472,2,1,7,24,NULL),(473,2,1,8,38,NULL),(474,2,1,9,39,NULL),(475,2,1,10,41,NULL),(476,2,1,11,43,NULL),(477,2,1,12,45,NULL),(478,2,1,13,47,NULL),(479,2,2,14,NULL,'NO'),(480,2,2,15,NULL,'NO 	'),(481,2,2,16,NULL,'NO 	'),(482,2,2,17,142,NULL),(483,2,2,18,NULL,'NO 	'),(484,2,2,19,75,NULL),(485,2,2,20,79,NULL),(486,2,2,21,NULL,'NO 	'),(487,2,2,22,81,NULL),(488,2,2,23,143,NULL),(489,2,2,24,144,NULL),(490,2,2,25,145,NULL),(491,2,2,26,146,NULL),(492,2,2,27,147,NULL),(493,2,2,28,148,NULL),(494,2,2,29,122,NULL),(495,2,2,30,124,NULL),(496,2,3,31,149,NULL);
/*!40000 ALTER TABLE `testdetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodiagnostico`
--

DROP TABLE IF EXISTS `tipodiagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodiagnostico` (
  `IdTipoDiagnostico` int(11) NOT NULL AUTO_INCREMENT,
  `NombreDiagnostico` varchar(45) NOT NULL,
  PRIMARY KEY (`IdTipoDiagnostico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodiagnostico`
--

LOCK TABLES `tipodiagnostico` WRITE;
/*!40000 ALTER TABLE `tipodiagnostico` DISABLE KEYS */;
INSERT INTO `tipodiagnostico` VALUES (1,'Diagnostico Generales'),(2,'Diagnosticos del Ministerio de Salud');
/*!40000 ALTER TABLE `tipodiagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoexamen`
--

DROP TABLE IF EXISTS `tipoexamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoexamen` (
  `IdTipoExamen` int(11) NOT NULL AUTO_INCREMENT,
  `NombreExamen` varchar(100) NOT NULL,
  PRIMARY KEY (`IdTipoExamen`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoexamen`
--

LOCK TABLES `tipoexamen` WRITE;
/*!40000 ALTER TABLE `tipoexamen` DISABLE KEYS */;
INSERT INTO `tipoexamen` VALUES (1,'Examen Hemograma'),(2,'Examen Heces'),(3,'Examen Orina'),(4,'Examen Quimica'),(5,'Examen Varios');
/*!40000 ALTER TABLE `tipoexamen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `IdTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `FechaTransaccion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IdUsuario` int(11) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `IdMovimiento` int(11) NOT NULL,
  `CodigoLote` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Existencia` int(11) DEFAULT NULL,
  `Costo` decimal(10,2) NOT NULL,
  `Venta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdTransaccion`),
  KEY `fk_transaccion_usuario_idx` (`IdUsuario`),
  KEY `fk_transaccion_medicamento_idx` (`IdMedicamento`),
  KEY `fk_transaccion_movimientos_idx_idx` (`IdMovimiento`),
  CONSTRAINT `fk_transaccion_medicamentos_idx` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaccion_movimientos_idx` FOREIGN KEY (`IdMovimiento`) REFERENCES `movimientos` (`IdMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaccion_usuario_idx` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadmedida`
--

DROP TABLE IF EXISTS `unidadmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidadmedida` (
  `IdUnidadMedida` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es el identificador de la unidad de medida ',
  `NombreUnidadMedida` varchar(50) NOT NULL COMMENT 'Indica el nombre de la unidad de medida ',
  PRIMARY KEY (`IdUnidadMedida`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadmedida`
--

LOCK TABLES `unidadmedida` WRITE;
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
INSERT INTO `unidadmedida` VALUES (1,'MG'),(2,'ML');
/*!40000 ALTER TABLE `unidadmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `rol_id` smallint(6) NOT NULL DEFAULT '1',
  `estado_id` smallint(6) NOT NULL DEFAULT '1',
  `tipo_usuario_id` smallint(6) DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `InicioSesion` varchar(50) DEFAULT NULL,
  `Nombres` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Clave` varchar(100) DEFAULT NULL,
  `Activo` int(11) DEFAULT NULL,
  `IdPuesto` int(11) DEFAULT NULL,
  `FechaIngreso` date DEFAULT NULL,
  `AmilatAdmin` varchar(1) DEFAULT NULL,
  `ImagenUsuario` varchar(500) DEFAULT NULL,
  `Idioma` int(1) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `fk_usuario_puesto1_idx` (`IdPuesto`),
  CONSTRAINT `fk_usuario_puesto1` FOREIGN KEY (`IdPuesto`) REFERENCES `puesto` (`idPuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','Nestor ','Ulloa','correo@corre.com','827ccb0eea8a706c4c34a16891f84e7b',1,1,'2016-08-01','1','uploads/usuarios/admin.jpg',2),(2,'Recepcion','Nestor','Ulloa','nestor.ulloa@gentenoble.org','827ccb0eea8a706c4c34a16891f84e7b',1,6,'2018-10-10',NULL,NULL,2),(3,'Enfermeria','Miranda','Ulloa','miranda.ulloa@mail.com','827ccb0eea8a706c4c34a16891f84e7b',1,5,'2018-10-16',NULL,NULL,1),(4,'Medico','David','Marroquin','david.marroquin@mail.com','827ccb0eea8a706c4c34a16891f84e7b',1,2,'2018-10-16',NULL,NULL,1),(5,'laboratorio','Josue','Marroquin','josue.marroquin@mail.com','827ccb0eea8a706c4c34a16891f84e7b',1,3,'2018-10-18',NULL,NULL,NULL),(6,'Medico2','Katya ','Quinteros','katya.quinteros@mail.com','827ccb0eea8a706c4c34a16891f84e7b',1,2,'2018-10-18',NULL,NULL,NULL),(7,'medico3','William','Castro','william.castro@mail.com','827ccb0eea8a706c4c34a16891f84e7b',1,2,'2018-10-18',NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioperfil`
--

DROP TABLE IF EXISTS `usuarioperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarioperfil` (
  `IdUsuario` int(11) NOT NULL,
  `IdPerfil` int(11) NOT NULL,
  `Activo` bit(1) NOT NULL,
  KEY `fk_UsuarioPerfil_Perfil1_idx` (`IdPerfil`),
  KEY `fk_UsuarioPerfil_Usuario1_idx` (`IdUsuario`),
  CONSTRAINT `fk_UsuarioPerfil_Perfil1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfil` (`IdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioPerfil_Usuario1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioperfil`
--

LOCK TABLES `usuarioperfil` WRITE;
/*!40000 ALTER TABLE `usuarioperfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarioperfil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-17 17:12:43

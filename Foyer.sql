-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 18 mai 2020 à 19:30
-- Version du serveur :  10.1.35-MariaDB
-- Version de PHP :  7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `babel`
--
CREATE DATABASE IF NOT EXISTS `babel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `babel`;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_groupe` int(50) NOT NULL,
  `nom_groupe` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id_groupe`, `nom_groupe`) VALUES
(1, 'G1'),
(2, 'G2'),
(3, 'G3');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_user` int(50) NOT NULL,
  `nom_user` varchar(50) NOT NULL,
  `prenom_user` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `date_anniv` date NOT NULL,
  `id_groupe` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `nom_user`, `prenom_user`, `mail`, `date_anniv`, `id_groupe`) VALUES
(1, 'galamo', 'laetitia', 'galamol@3il.fr', '2000-02-24', 1),
(2, 'chiappi', 'sandra', 'sandrac@3il.fr', '2001-02-19', 1),
(3, 'rocher', 'fernand', 'rocherf@yahoo.fr', '1990-01-14', 3),
(4, 'renaud', 'philip', 'philipr@gmail.com', '1997-04-12', 2),
(5, 'leroi', 'corine', 'corinel@gmail.com', '2000-11-04', 3),
(6, 'poupy', 'rose', 'rosep@gmail.com', '2000-02-10', 1),
(7, 'MBELLA', 'MARCO', 'bobsky256@gmail.com', '1999-06-16', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_groupe` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_user` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Base de données :  `base_de_donnees`
--
CREATE DATABASE IF NOT EXISTS `base_de_donnees` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `base_de_donnees`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom_categorie` varchar(50) DEFAULT NULL,
  `image_categorie` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom_categorie`, `image_categorie`) VALUES
(1, 'Sandwich', NULL),
(2, 'Pizza', NULL),
(3, 'Kebab', NULL),
(4, 'Tacos', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `prenom_client` varchar(50) NOT NULL,
  `id_type_client` int(11) DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom_client`, `prenom_client`, `id_type_client`, `idUser`) VALUES
(11, 'ndadem', 'arold', 1, 7),
(12, 'lekedji', 'brucy', 1, 16),
(13, 'nenwa', 'vanel', 1, 15),
(14, 'grasset', 'm', 2, 8),
(15, 'mm', 'marie', 1, 19),
(16, 'pepin', 'peps', 2, 13),
(18, 'djide', 'fabiola', 1, 17),
(19, 'tchoungo', 'brice', 1, 10),
(20, 'geumtcheng', 'jorel', 1, 11),
(21, 'dramane', 'dra', 2, 18),
(22, 'franck', '', 1, 12),
(23, 'peps', '', 1, 13),
(24, 'Dora', '', 1, 14);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `statut` varchar(30) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date_commande`, `statut`, `id_client`) VALUES
(1, '2020-01-15 11:11:28', 'En preparation', 11),
(2, '2020-01-15 11:11:25', 'Commande passee', 12),
(3, '2020-01-15 11:11:25', 'En  preparation', 13),
(4, '2020-01-15 11:11:26', 'commande passee', 14),
(5, '2020-01-15 11:11:28', 'En preparation', 15),
(6, '2020-01-15 11:11:25', 'Commande passee', 16),
(7, '2020-01-15 11:11:29', 'En  preparation', 18),
(8, '2020-01-15 11:11:30', 'commande passee', 19),
(9, '2020-01-15 11:11:28', 'En preparation', 21),
(10, '2020-01-15 11:11:25', 'Commande passee', 22),
(11, '2020-01-15 11:11:29', 'En  preparation', 23),
(12, '2020-01-15 11:11:30', 'commande passee', 24);

-- --------------------------------------------------------

--
-- Structure de la table `composer_formule`
--

CREATE TABLE `composer_formule` (
  `id` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `quantité` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composer_formule`
--

INSERT INTO `composer_formule` (`id`, `id_categorie`, `quantité`) VALUES
(1, 1, 2),
(2, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `constituant`
--

CREATE TABLE `constituant` (
  `id` int(11) NOT NULL,
  `nom_constituant` varchar(100) NOT NULL,
  `description_constituant` varchar(500) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `constituant`
--

INSERT INTO `constituant` (`id`, `nom_constituant`, `description_constituant`, `id_categorie`) VALUES
(1, 'viande de boeuf', 'emincé de viande de boeuf', 4),
(2, 'jambon', 'salade,tomate,oignon, jambon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `formule`
--

CREATE TABLE `formule` (
  `id` int(11) NOT NULL,
  `nom_formule` varchar(150) NOT NULL,
  `prix` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `formule`
--

INSERT INTO `formule` (`id`, `nom_formule`, `prix`) VALUES
(1, 'Etudiant', '3.30'),
(2, 'Double Sandwich', '5.00'),
(3, 'MAxi', '9.00');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_formule` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id`, `id_commande`, `id_formule`, `quantite`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 3),
(3, 3, 1, 4),
(4, 4, 1, 8),
(5, 5, 3, 2),
(6, 6, 2, 2),
(7, 7, 1, 2),
(8, 8, 1, 2),
(9, 9, 1, 2),
(10, 10, 3, 3),
(11, 11, 1, 3),
(12, 12, 1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande_constituant`
--

CREATE TABLE `ligne_commande_constituant` (
  `id` int(11) NOT NULL,
  `id_ligne_commande` int(11) DEFAULT NULL,
  `id_constituant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande_constituant`
--

INSERT INTO `ligne_commande_constituant` (`id`, `id_ligne_commande`, `id_constituant`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1),
(9, 9, 2),
(10, 10, 2),
(11, 11, 1),
(12, 12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `msgTicket` varchar(500) DEFAULT NULL,
  `etatTicket` varchar(100) DEFAULT NULL,
  `repTicket` varchar(200) DEFAULT NULL,
  `dateOuverture` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateConsultation` datetime DEFAULT NULL,
  `dateFermeture` datetime DEFAULT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `msgTicket`, `etatTicket`, `repTicket`, `dateOuverture`, `dateConsultation`, `dateFermeture`, `idClient`) VALUES
(1, '                              dsqdqdqd\r\n                    ', 'fermé', 'boui', '2020-02-13 10:01:05', '2020-02-13 10:36:12', '2020-02-13 10:36:17', 19),
(2, '                              fgfgfgfg\r\n                    ', 'fermé', 'c\'est moi', '2020-02-13 10:01:48', '2020-02-13 10:41:43', '2020-02-13 10:41:49', 19),
(3, '  le pain chocolat\r\n              ', 'En cours de traitement', NULL, '2020-02-13 10:47:40', '2020-02-13 10:59:13', NULL, 19),
(4, '   soutenance', 'ouvert', NULL, '2020-02-13 10:58:13', NULL, NULL, 19);

-- --------------------------------------------------------

--
-- Structure de la table `type_client`
--

CREATE TABLE `type_client` (
  `id` int(11) NOT NULL,
  `nom_type_client` varchar(50) NOT NULL,
  `comm_type_client` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_client`
--

INSERT INTO `type_client` (`id`, `nom_type_client`, `comm_type_client`) VALUES
(1, 'Etudiant', NULL),
(2, 'Professeur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `droits` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `pass`, `droits`) VALUES
(5, 'marco@gmail.com', '3829486b93ec44395f0b980424bae9b6fb07b7bc', 'administrateur'),
(6, 'brenda@gmail.com', 'e156bbc5ceceeb6fda9be0b72d4a265ea1b40f79', 'administrateur'),
(7, 'arold@gmail.com', '0273f7cf78cd4a42920786b4e80ca8ae3467c478', 'administrateur'),
(8, 'm.Grasset@gmail.com', '723156650c5778d0e4df4b2fbfeefa65359302e5', 'administrateur'),
(9, 'bde@gmail.com', '2850c642427bff2171188520f6f3d1c88a2773c8', 'administrateur'),
(10, 'brice@gmail.com', 'a6504fc3011a6983be6bf4d915860368a7353a38', 'client'),
(11, 'jorel@gmail.com', '491f97273ec5b9c68040ebe04a57142e6a25d684', 'client'),
(12, 'franck@gmail.com', '6a5810b27035f980ef8adc0e8007b098fdd1d9d8', 'client'),
(13, 'peps@gmail.com', 'f4e56375b53a2b2dd0ebaddf7c80a7f3da89a73f', 'client'),
(14, 'dora@gmail.com', '7ec4fa89d0c005d7b155848254f5e7ef0897d95b', 'client'),
(15, 'vanel@gmail.com', '2647c2e050e2677239450456c64c8f474d5b9d2a', 'client'),
(16, 'brucy@gmail.com', 'bb93602ecb4d5003a53edd91e292899d2c4bdd54', 'client'),
(17, 'fabiola@gmail.com', '438d0fbcb8ceedffac573dc1eb974dd5870cd52c', 'client'),
(18, 'dramane@gmail.com', '104091fdca6f6fcbe5484b41057eeda348c37d6e', 'client'),
(19, 'marie@gmail.com', 'f0fd596f396d8fc32d5e4fe4c73c61fa2ac55c70', 'client'),
(20, 'Marco', '3829486b93ec44395f0b980424bae9b6fb07b7bc', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_client` (`id_type_client`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `composer_formule`
--
ALTER TABLE `composer_formule`
  ADD PRIMARY KEY (`id`,`id_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `constituant`
--
ALTER TABLE `constituant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `formule`
--
ALTER TABLE `formule`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_formule` (`id_formule`);

--
-- Index pour la table `ligne_commande_constituant`
--
ALTER TABLE `ligne_commande_constituant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ligne_commande` (`id_ligne_commande`),
  ADD KEY `id_constituant` (`id_constituant`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClient` (`idClient`);

--
-- Index pour la table `type_client`
--
ALTER TABLE `type_client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `constituant`
--
ALTER TABLE `constituant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `formule`
--
ALTER TABLE `formule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `ligne_commande_constituant`
--
ALTER TABLE `ligne_commande_constituant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type_client`
--
ALTER TABLE `type_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_cli_util` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_type_client`) REFERENCES `type_client` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_Cmd_Client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `composer_formule`
--
ALTER TABLE `composer_formule`
  ADD CONSTRAINT `composer_formule_ibfk_1` FOREIGN KEY (`id`) REFERENCES `formule` (`id`),
  ADD CONSTRAINT `composer_formule_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `constituant`
--
ALTER TABLE `constituant`
  ADD CONSTRAINT `FK_cons_cat` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `constituant_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `FK_lign_cmd` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_lign_form` FOREIGN KEY (`id_formule`) REFERENCES `formule` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`id_formule`) REFERENCES `formule` (`id`);

--
-- Contraintes pour la table `ligne_commande_constituant`
--
ALTER TABLE `ligne_commande_constituant`
  ADD CONSTRAINT `FK_lignCmd_cons` FOREIGN KEY (`id_constituant`) REFERENCES `constituant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_lignCmdcons_ligneCmd` FOREIGN KEY (`id_ligne_commande`) REFERENCES `ligne_commande` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_commande_constituant_ibfk_1` FOREIGN KEY (`id_ligne_commande`) REFERENCES `ligne_commande` (`id`),
  ADD CONSTRAINT `ligne_commande_constituant_ibfk_2` FOREIGN KEY (`id_constituant`) REFERENCES `constituant` (`id`);

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `FK_cli_ticket` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`);
--
-- Base de données :  `base_foyer`
--
CREATE DATABASE IF NOT EXISTS `base_foyer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `base_foyer`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) DEFAULT NULL,
  `image_categorie` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`, `image_categorie`) VALUES
(1, 'Sandwich', NULL),
(2, 'Pizza', NULL),
(3, 'Kebab', NULL),
(4, 'Tacos', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `prenom_client` varchar(50) NOT NULL,
  `id_type_client` int(11) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `prenom_client`, `id_type_client`, `login`) VALUES
(1, 'Bobo', 'Bobson', 1, 'bib@gmail.com'),
(2, 'Bibi', 'Bibson', 1, 'mrsbru@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `statut` varchar(30) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_commande`, `statut`, `id_client`) VALUES
(1, '2020-01-15 11:11:28', 'En train d\'être préparée', 1),
(2, '2020-01-15 11:29:36', 'Commande passée', 2);

-- --------------------------------------------------------

--
-- Structure de la table `composer_formule`
--

CREATE TABLE `composer_formule` (
  `id_formule` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `quantité` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `composer_formule`
--

INSERT INTO `composer_formule` (`id_formule`, `id_categorie`, `quantité`) VALUES
(1, 1, 2),
(2, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `constituant`
--

CREATE TABLE `constituant` (
  `id_constituant` int(11) NOT NULL,
  `nom_constituant` varchar(100) NOT NULL,
  `description_constituant` varchar(500) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `constituant`
--

INSERT INTO `constituant` (`id_constituant`, `nom_constituant`, `description_constituant`, `id_categorie`) VALUES
(1, 'viande de boeuf', 'emincé de viande de boeuf', 4),
(2, 'jambon', 'salade,tomate,oignon, jambon', 1);

-- --------------------------------------------------------

--
-- Structure de la table `formule`
--

CREATE TABLE `formule` (
  `id_formule` int(11) NOT NULL,
  `nom_formule` varchar(150) NOT NULL,
  `prix` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `formule`
--

INSERT INTO `formule` (`id_formule`, `nom_formule`, `prix`) VALUES
(1, 'Etudiant', '3.30'),
(2, 'Double Sandwich', '5.00'),
(3, 'MAxi', '9.00');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id_ligne_commande` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_formule` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`id_ligne_commande`, `id_commande`, `id_formule`, `quantite`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande_constituant`
--

CREATE TABLE `ligne_commande_constituant` (
  `id_ligne_commande_constituant` int(11) NOT NULL,
  `id_ligne_commande` int(11) DEFAULT NULL,
  `id_constituant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligne_commande_constituant`
--

INSERT INTO `ligne_commande_constituant` (`id_ligne_commande_constituant`, `id_ligne_commande`, `id_constituant`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `idTicket` int(11) NOT NULL,
  `msgTicket` varchar(500) DEFAULT NULL,
  `etatTicket` varchar(100) DEFAULT NULL,
  `repTicket` varchar(200) DEFAULT NULL,
  `dateOuverture` datetime NOT NULL,
  `dateFermeture` datetime NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_client`
--

CREATE TABLE `type_client` (
  `id_type_client` int(11) NOT NULL,
  `nom_type_client` varchar(50) NOT NULL,
  `comm_type_client` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_client`
--

INSERT INTO `type_client` (`id_type_client`, `nom_type_client`, `comm_type_client`) VALUES
(1, 'Etudiant', NULL),
(2, 'Professeur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `email` varchar(30) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `droits` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`email`, `pass`, `droits`) VALUES
('bib@gmail.com', 'bib', 'client'),
('mrsb@gmail.com', 'bro', 'administrateur'),
('mrsbru@gmail.com', 'bobo', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `login` (`login`),
  ADD KEY `id_type_client` (`id_type_client`),
  ADD KEY `login_2` (`login`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `composer_formule`
--
ALTER TABLE `composer_formule`
  ADD PRIMARY KEY (`id_formule`,`id_categorie`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `constituant`
--
ALTER TABLE `constituant`
  ADD PRIMARY KEY (`id_constituant`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `formule`
--
ALTER TABLE `formule`
  ADD PRIMARY KEY (`id_formule`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id_ligne_commande`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_formule` (`id_formule`);

--
-- Index pour la table `ligne_commande_constituant`
--
ALTER TABLE `ligne_commande_constituant`
  ADD PRIMARY KEY (`id_ligne_commande_constituant`),
  ADD KEY `id_ligne_commande` (`id_ligne_commande`),
  ADD KEY `id_constituant` (`id_constituant`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `idClient` (`idClient`);

--
-- Index pour la table `type_client`
--
ALTER TABLE `type_client`
  ADD PRIMARY KEY (`id_type_client`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `constituant`
--
ALTER TABLE `constituant`
  MODIFY `id_constituant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `formule`
--
ALTER TABLE `formule`
  MODIFY `id_formule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id_ligne_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_client`
--
ALTER TABLE `type_client`
  MODIFY `id_type_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`login`) REFERENCES `utilisateur` (`email`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_type_client`) REFERENCES `type_client` (`id_type_client`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `composer_formule`
--
ALTER TABLE `composer_formule`
  ADD CONSTRAINT `composer_formule_ibfk_1` FOREIGN KEY (`id_formule`) REFERENCES `formule` (`id_formule`),
  ADD CONSTRAINT `composer_formule_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `constituant`
--
ALTER TABLE `constituant`
  ADD CONSTRAINT `constituant_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`id_formule`) REFERENCES `formule` (`id_formule`);

--
-- Contraintes pour la table `ligne_commande_constituant`
--
ALTER TABLE `ligne_commande_constituant`
  ADD CONSTRAINT `ligne_commande_constituant_ibfk_1` FOREIGN KEY (`id_ligne_commande`) REFERENCES `ligne_commande` (`id_ligne_commande`),
  ADD CONSTRAINT `ligne_commande_constituant_ibfk_2` FOREIGN KEY (`id_constituant`) REFERENCES `constituant` (`id_constituant`);

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id_client`);
--
-- Base de données :  `csstreamerbd`
--
CREATE DATABASE IF NOT EXISTS `csstreamerbd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `csstreamerbd`;
--
-- Base de données :  `dolph3`
--
CREATE DATABASE IF NOT EXISTS `dolph3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dolph3`;

-- --------------------------------------------------------

--
-- Structure de la table `profils`
--

CREATE TABLE `profils` (
  `idp` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `mdp` varchar(20) NOT NULL,
  `session` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `profils`
--

INSERT INTO `profils` (`idp`, `nom`, `mdp`, `session`) VALUES
(1, 'Amine', 'isj', 'projet1'),
(2, 'Vanel', 'isj', 'projet1'),
(3, 'Marco', 'isj', 'projet1');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `idpj` int(11) NOT NULL,
  `createur` varchar(30) NOT NULL,
  `session` varchar(20) NOT NULL,
  `mdp` varchar(30) NOT NULL DEFAULT 'isj'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `projets`
--

INSERT INTO `projets` (`idpj`, `createur`, `session`, `mdp`) VALUES
(1, 'Amine', 'projet1', 'isj'),
(2, 'Marco', 'projet1', 'isj');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `ids` int(11) NOT NULL,
  `codeur` varchar(20) NOT NULL,
  `code` text NOT NULL,
  `session` varchar(20) NOT NULL,
  `fichier` varchar(30) NOT NULL,
  `createur` varchar(20) NOT NULL,
  `restriction` int(1) NOT NULL,
  `ext` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`ids`, `codeur`, `code`, `session`, `fichier`, `createur`, `restriction`, `ext`) VALUES
(1, 'Amine', 'echo \"okÃ©\";', 'projet1', 'main_projet1', 'Amine', 1, 'php'),
(2, 'Amine', '<br><br><br><center><div id=olp class=modd placeholder=ecrire>Amine</div>\n', 'projet1', 'fichier1', 'Amine', 1, 'html'),
(3, 'Vanel', '', 'projet1', 'fichier2', 'Vanel', 0, 'html'),
(4, 'Amine', '', 'projet1', 'feuille', 'Amine', 1, 'css'),
(5, 'Amine', '', 'projet1', 'javascript', 'Amine', 1, 'js'),
(6, 'Amine', '<input>gtg', 'projet1', 'texte', 'Amine', 1, 'txt'),
(7, 'Marco', '', 'projet1', 'javascript', 'Marco', 1, 'js');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `profils`
--
ALTER TABLE `profils`
  ADD PRIMARY KEY (`idp`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`idpj`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`ids`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `profils`
--
ALTER TABLE `profils`
  MODIFY `idp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `idpj` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ids` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Base de données :  `essaie`
--
CREATE DATABASE IF NOT EXISTS `essaie` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `essaie`;

-- --------------------------------------------------------

--
-- Structure de la table `devices`
--

CREATE TABLE `devices` (
  `Id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `SerialNumber` varchar(100) NOT NULL,
  `BuyDate` date DEFAULT NULL,
  `ProductionDate` date DEFAULT NULL,
  `Timezone` varchar(100) NOT NULL,
  `Comment` varchar(200) NOT NULL,
  `Connectable` int(11) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `playerpk`
--

CREATE TABLE `playerpk` (
  `Id` int(11) NOT NULL,
  `IdPlayer` int(11) NOT NULL,
  `IdDevice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE `players` (
  `Id` int(11) NOT NULL,
  `BroadcastIp` varchar(100) NOT NULL,
  `BroadcastPort` varchar(100) NOT NULL,
  `ProductionDate` varchar(100) NOT NULL,
  `BroadcastUsername` varchar(100) NOT NULL,
  `BroadcastPassword` varchar(200) NOT NULL,
  `BroadcastMountPoint` int(11) NOT NULL,
  `playerOutputModule` int(11) NOT NULL,
  `playerModuleDevice` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `SerialNumber` (`SerialNumber`);

--
-- Index pour la table `playerpk`
--
ALTER TABLE `playerpk`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_PlayerPk` (`IdPlayer`),
  ADD KEY `FK_Device` (`IdDevice`);

--
-- Index pour la table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`Id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `playerpk`
--
ALTER TABLE `playerpk`
  ADD CONSTRAINT `FK_Device` FOREIGN KEY (`IdDevice`) REFERENCES `devices` (`Id`),
  ADD CONSTRAINT `FK_PlayerPk` FOREIGN KEY (`IdPlayer`) REFERENCES `players` (`Id`) ON DELETE CASCADE;
--
-- Base de données :  `facture`
--
CREATE DATABASE IF NOT EXISTS `facture` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `facture`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `intitule`) VALUES
(2, 'Chaussure');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `montant` int(35) NOT NULL,
  `remise` varchar(50) NOT NULL DEFAULT '0',
  `echeance` date NOT NULL,
  `envoye` int(11) NOT NULL DEFAULT '0' COMMENT '1: oui, 0:non',
  `paye` int(11) NOT NULL DEFAULT '0' COMMENT '1: oui, 0:non',
  `code` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `nom`, `email`, `date`, `montant`, `remise`, `echeance`, `envoye`, `paye`, `code`) VALUES
(1, 'lk', 'ciel@email.com', '2019-10-30', 174000, '', '2019-10-25', 0, 0, '20191029-193949-775029');

-- --------------------------------------------------------

--
-- Structure de la table `factureobjet`
--

CREATE TABLE `factureobjet` (
  `id` int(11) NOT NULL,
  `idfacture` int(11) NOT NULL,
  `idproduit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `factureobjet`
--

INSERT INTO `factureobjet` (`id`, `idfacture`, `idproduit`, `quantite`, `total`) VALUES
(2, 1, 4, 9, 126000),
(3, 1, 2, 4, 48000);

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `menu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privilege`
--

INSERT INTO `privilege` (`id`, `nom`, `intitule`, `menu`) VALUES
(1, 'add_categorie', 'Ajouter Categorie', 'Categorie'),
(2, 'edit_categorie', 'Modifier Categorie', 'Categorie'),
(3, 'delete_categorie', 'Supprimer Categorie', 'Categorie'),
(4, 'voir_categorie', 'Voir Categorie', 'Categorie'),
(5, 'voir_parametre', 'Voir Paramètres', 'Parametre');

-- --------------------------------------------------------

--
-- Structure de la table `privilege_role`
--

CREATE TABLE `privilege_role` (
  `id` int(11) NOT NULL,
  `idprivilege` int(11) NOT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privilege_role`
--

INSERT INTO `privilege_role` (`id`, `idprivilege`, `idrole`) VALUES
(6, 2, 1),
(7, 3, 1),
(13, 5, 1),
(14, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` int(11) NOT NULL,
  `idcategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `prix`, `idcategorie`) VALUES
(2, 'Mocassin', 12000, 2),
(3, 'Sebago', 15000, 2),
(4, 'All Star', 14000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `intitule`) VALUES
(1, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `pseudo`, `nom`, `password`, `idrole`) VALUES
(1, 'admin', 'Admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_role`
--

CREATE TABLE `utilisateur_role` (
  `id` int(11) NOT NULL,
  `idutilisateur` int(11) NOT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur_role`
--

INSERT INTO `utilisateur_role` (`id`, `idutilisateur`, `idrole`) VALUES
(1, 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `factureobjet`
--
ALTER TABLE `factureobjet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproduit` (`idproduit`);

--
-- Index pour la table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `privilege_role`
--
ALTER TABLE `privilege_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idprivilege` (`idprivilege`),
  ADD KEY `idrole` (`idrole`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcategorie` (`idcategorie`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD KEY `idrole` (`idrole`);

--
-- Index pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idrole` (`idrole`),
  ADD KEY `idutilisateur` (`idutilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `factureobjet`
--
ALTER TABLE `factureobjet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `privilege_role`
--
ALTER TABLE `privilege_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `factureobjet`
--
ALTER TABLE `factureobjet`
  ADD CONSTRAINT `factureobjet_ibfk_1` FOREIGN KEY (`idproduit`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `privilege_role`
--
ALTER TABLE `privilege_role`
  ADD CONSTRAINT `privilege_role_ibfk_1` FOREIGN KEY (`idprivilege`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `privilege_role_ibfk_2` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  ADD CONSTRAINT `utilisateur_role_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateur_role_ibfk_2` FOREIGN KEY (`idutilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données :  `foyer`
--
CREATE DATABASE IF NOT EXISTS `foyer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `foyer`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `prenom_client` varchar(50) NOT NULL,
  `id_type_client` int(11) DEFAULT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom_client`, `prenom_client`, `id_type_client`, `idUser`) VALUES
(1, 'Bobo', 'Bobson', 1, 1),
(2, 'Bibi', 'Bibson', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `date_commande` datetime NOT NULL,
  `statut` varchar(30) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date_commande`, `statut`, `id_client`) VALUES
(1, '2020-01-15 11:11:28', 'En train d\'être préparée', 1),
(2, '2020-01-15 11:29:36', 'Commande passée', 2);

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `msgTicket` varchar(500) DEFAULT NULL,
  `etatTicket` varchar(100) DEFAULT NULL,
  `repTicket` varchar(200) DEFAULT NULL,
  `dateOuverture` datetime NOT NULL,
  `dateFermeture` datetime NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_client`
--

CREATE TABLE `type_client` (
  `id` int(11) NOT NULL,
  `nom_type_client` varchar(50) NOT NULL,
  `comm_type_client` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_client`
--

INSERT INTO `type_client` (`id`, `nom_type_client`, `comm_type_client`) VALUES
(1, 'Etudiant', NULL),
(2, 'Professeur', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(150) NOT NULL,
  `droits` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `pass`, `droits`) VALUES
(1, 'bib@gmail.com', 'bib', 'client'),
(2, 'mrsb@gmail.com', 'bro', 'administrateur'),
(3, 'mrsbru@gmail.com', 'bobo', 'client'),
(4, 'peps@gmail.com', 'pep', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_client` (`id_type_client`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClient` (`idClient`);

--
-- Index pour la table `type_client`
--
ALTER TABLE `type_client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_client`
--
ALTER TABLE `type_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_type_client`) REFERENCES `type_client` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`);
--
-- Base de données :  `gestion_incident`
--
CREATE DATABASE IF NOT EXISTS `gestion_incident` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestion_incident`;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_Admin` int(11) NOT NULL COMMENT 'identifiant admin',
  `nom` varchar(500) NOT NULL,
  `prenom` varchar(500) NOT NULL,
  `login` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_Client` int(11) NOT NULL COMMENT 'identifiant client',
  `nom` varchar(500) NOT NULL,
  `prenom` varchar(500) NOT NULL,
  `login` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id_Ticket` int(11) NOT NULL COMMENT 'numéro ticket',
  `etat` varchar(250) NOT NULL COMMENT 'ouvert/en traitement/fermé',
  `plainte` varchar(10000) NOT NULL COMMENT 'incident en question',
  `id_Client` int(11) NOT NULL,
  `id_Admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `login` varchar(250) NOT NULL COMMENT 'identifiant utilisateur',
  `pass` varchar(250) NOT NULL COMMENT 'mot de passe',
  `droits` varchar(50) NOT NULL COMMENT 'user/admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_Admin`),
  ADD KEY `login` (`login`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_Client`),
  ADD KEY `login` (`login`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_Ticket`),
  ADD KEY `id_Client` (`id_Client`),
  ADD KEY `id_Admin` (`id_Admin`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_Admin` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identifiant admin';

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_Client` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identifiant client';

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_Ticket` int(11) NOT NULL AUTO_INCREMENT COMMENT 'numéro ticket';

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`login`) REFERENCES `utilisateur` (`login`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`login`) REFERENCES `utilisateur` (`login`);

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_Client`) REFERENCES `client` (`id_Client`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_Admin`) REFERENCES `admin` (`id_Admin`);
--
-- Base de données :  `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Déchargement des données de la table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Déchargement des données de la table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'CSStreamerDB', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"babel\",\"base_de_donnees\",\"base_foyer\",\"csstreamerbd\",\"dolph3\",\"essaie\",\"facture\",\"foyer\",\"gestion_incident\",\"phpmyadmin\",\"test\",\"ticket\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure de la table @TABLE@\",\"latex_structure_continued_caption\":\"Structure de la table @TABLE@ (suite)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenu de la table @TABLE@\",\"latex_data_continued_caption\":\"Contenu de la table @TABLE@ (suite)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Déchargement des données de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"base_de_donnees\",\"table\":\"utilisateur\"},{\"db\":\"essaie\",\"table\":\"players\"},{\"db\":\"essaie\",\"table\":\"devices\"},{\"db\":\"babel\",\"table\":\"utilisateur\"},{\"db\":\"base_de_donnees\",\"table\":\"tickets\"},{\"db\":\"base_de_donnees\",\"table\":\"client\"},{\"db\":\"base_de_donnees\",\"table\":\"constituant\"},{\"db\":\"base_de_donnees\",\"table\":\"ligne_commande_constituant\"},{\"db\":\"base_de_donnees\",\"table\":\"ligne_commande\"},{\"db\":\"base_de_donnees\",\"table\":\"commande\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Déchargement des données de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2020-02-03 20:35:54', '{\"lang\":\"fr\"}'),
('root', '2020-05-18 17:29:48', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":245}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de données :  `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de données :  `ticket`
--
CREATE DATABASE IF NOT EXISTS `ticket` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ticket`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `intitule`) VALUES
(2, 'Chaussure');

-- --------------------------------------------------------

--
-- Structure de la table `privilege`
--

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `menu` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privilege`
--

INSERT INTO `privilege` (`id`, `nom`, `intitule`, `menu`) VALUES
(1, 'add_categorie', 'Ajouter Categorie', 'Categorie'),
(2, 'edit_categorie', 'Modifier Categorie', 'Categorie'),
(3, 'delete_categorie', 'Supprimer Categorie', 'Categorie'),
(4, 'voir_categorie', 'Voir Categorie', 'Categorie'),
(5, 'voir_parametre', 'Voir Paramètres', 'Parametre');

-- --------------------------------------------------------

--
-- Structure de la table `privilege_role`
--

CREATE TABLE `privilege_role` (
  `id` int(11) NOT NULL,
  `idprivilege` int(11) NOT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `privilege_role`
--

INSERT INTO `privilege_role` (`id`, `idprivilege`, `idrole`) VALUES
(6, 2, 1),
(7, 3, 1),
(13, 5, 1),
(14, 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` int(11) NOT NULL,
  `idcategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `prix`, `idcategorie`) VALUES
(2, 'Mocassin', 12000, 2),
(3, 'Sebago', 15000, 2),
(4, 'All Star', 14000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `intitule` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `intitule`) VALUES
(1, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `montant` int(35) NOT NULL,
  `remise` varchar(50) NOT NULL DEFAULT '0',
  `echeance` date NOT NULL,
  `envoye` int(11) NOT NULL DEFAULT '0' COMMENT '1: oui, 0:non',
  `paye` int(11) NOT NULL DEFAULT '0' COMMENT '1: oui, 0:non',
  `code` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id`, `nom`, `email`, `date`, `montant`, `remise`, `echeance`, `envoye`, `paye`, `code`) VALUES
(1, 'lk', 'ciel@email.com', '2019-10-30', 174000, '', '2019-10-25', 0, 0, '20191029-193949-775029');

-- --------------------------------------------------------

--
-- Structure de la table `ticketobjet`
--

CREATE TABLE `ticketobjet` (
  `id` int(11) NOT NULL,
  `idticket` int(11) NOT NULL,
  `idproduit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ticketobjet`
--

INSERT INTO `ticketobjet` (`id`, `idticket`, `idproduit`, `quantite`, `total`) VALUES
(2, 1, 4, 9, 126000),
(3, 1, 2, 4, 48000);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `pseudo`, `nom`, `password`, `idrole`) VALUES
(1, 'admin', 'Admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_role`
--

CREATE TABLE `utilisateur_role` (
  `id` int(11) NOT NULL,
  `idutilisateur` int(11) NOT NULL,
  `idrole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur_role`
--

INSERT INTO `utilisateur_role` (`id`, `idutilisateur`, `idrole`) VALUES
(1, 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `privilege_role`
--
ALTER TABLE `privilege_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idprivilege` (`idprivilege`),
  ADD KEY `idrole` (`idrole`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcategorie` (`idcategorie`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ticketobjet`
--
ALTER TABLE `ticketobjet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproduit` (`idproduit`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD KEY `idrole` (`idrole`);

--
-- Index pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idrole` (`idrole`),
  ADD KEY `idutilisateur` (`idutilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `privilege`
--
ALTER TABLE `privilege`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `privilege_role`
--
ALTER TABLE `privilege_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ticketobjet`
--
ALTER TABLE `ticketobjet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `privilege_role`
--
ALTER TABLE `privilege_role`
  ADD CONSTRAINT `privilege_role_ibfk_1` FOREIGN KEY (`idprivilege`) REFERENCES `privilege` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `privilege_role_ibfk_2` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ticketobjet`
--
ALTER TABLE `ticketobjet`
  ADD CONSTRAINT `ticketobjet_ibfk_1` FOREIGN KEY (`idproduit`) REFERENCES `produit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `utilisateur_role`
--
ALTER TABLE `utilisateur_role`
  ADD CONSTRAINT `utilisateur_role_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `utilisateur_role_ibfk_2` FOREIGN KEY (`idutilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 12 déc. 2024 à 10:30
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--

--
-- Déchargement des données de la table `achete`
--

INSERT IGNORE INTO `achete` (`id_client`, `id_menu`, `jour`) VALUES
(1, 1, '2024-12-11'),
(2, 2, '2024-12-12'),
(3, 3, '2024-12-13');

--
-- Déchargement des données de la table `boisson`
--

INSERT IGNORE INTO `boisson` (`id_boisson`, `nom_boisson`, `id_marque`, `prix_unite`) VALUES
(1, 'Coca-cola zéro', 1, 1.5),
(2, 'Coca-cola original', 1, 1.5),
(3, 'Fanta citron', 1, 1.5),
(4, 'Fanta orange', 1, 1.5),
(5, 'Capri-sun', 1, 1.5),
(6, 'Pepsi', 4, 1.5),
(7, 'Pepsi Max Zéro', 4, 1.5),
(8, 'Lipton zéro citron', 4, 1.5),
(9, 'Lipton Peach', 4, 1.5),
(10, 'Monster energy ultra gold', 3, 1.5),
(11, 'Monster energy ultra blue', 3, 1.5),
(12, 'Eau de source', 2, 1.5);

--
-- Déchargement des données de la table `client`
--

INSERT IGNORE INTO `client` (`id_client`, `nom_client`, `age`, `cp_client`) VALUES
(1, 'Jean Dupont', 25, 75001),
(2, 'Marie Curie', 30, 75002),
(3, 'Albert Einstein', 40, 75003);

--
-- Déchargement des données de la table `compose`
--

INSERT IGNORE INTO `compose` (`id_focaccia`, `id_ingredient`) VALUES
(1, 1),
(1, 5),
(1, 9),
(2, 9),
(2, 11),
(2, 18),
(3, 1),
(3, 5),
(3, 9),
(3, 23),
(4, 5),
(4, 9),
(4, 10),
(5, 1),
(5, 5),
(5, 9),
(5, 24),
(6, 2),
(6, 4),
(6, 5),
(6, 24),
(7, 4),
(7, 9),
(7, 21),
(7, 24),
(8, 7),
(8, 18),
(8, 21);

--
-- Déchargement des données de la table `focaccia`
--

INSERT IGNORE INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `id_composition`, `taille`, `prix_focaccia`) VALUES
(1, 'Mozaccia', 1, 'standard', 9.8),
(2, 'Gorgonzolaccia', 2, 'standard', 10.8),
(3, 'Enfant Mozaccia Mini', 3, 'enfant', 6),
(4, 'Emmentalaccia', 4, 'standard', 9.8),
(5, 'Tradizione', 5, 'standard', 8.9),
(6, 'Hawaienne', 6, 'standard', 11.2),
(7, 'Américaine', 7, 'standard', 10.8),
(8, 'Paysanne', 8, 'standard', 12.8);

--
-- Déchargement des données de la table `ingredient`
--

INSERT IGNORE INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise');

--
-- Déchargement des données de la table `marque`
--

INSERT IGNORE INTO `marque` (`id_marque`, `nom_marque`) VALUES
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

--
-- Déchargement des données de la table `menu`
--

INSERT IGNORE INTO `menu` (`id_menu`, `type_menu`, `id_focaccia`, `id_boisson`, `prix_menu`) VALUES
(1, 'simple', 1, 1, 12.5),
(2, 'gourmet', 2, 1, 15),
(3, 'enfant', 3, 2, 10);

--
-- Déchargement des données de la table `paye`
--

INSERT IGNORE INTO `paye` (`id_client`, `jour`) VALUES
(1, '2024-12-11'),
(2, '2024-12-12'),
(3, '2024-12-13');

-- --------------------------------------------------------

--
-- Structure de la vue `menu_gourmet`
--
DROP TABLE IF EXISTS `menu_gourmet`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu_gourmet`  AS SELECT `f`.`nom_focaccia` AS `nom_focaccia`, count(`c`.`id_ingredient`) AS `nombre_ingredients`, 15 AS `prix_menu` FROM (`focaccia` `f` join `compose` `c` on(`f`.`id_focaccia` = `c`.`id_focaccia`)) WHERE `f`.`taille` <> 'enfant' GROUP BY `f`.`id_focaccia` HAVING `nombre_ingredients` > 3 ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

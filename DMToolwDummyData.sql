-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Gegenereerd op: 01 jun 2025 om 20:33
-- Serverversie: 8.0.35
-- PHP-versie: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DMTool`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Attack`
--

CREATE TABLE `Attack` (
  `attack_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `damage` int DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Attack`
--

INSERT INTO `Attack` (`attack_id`, `name`, `damage`, `type`) VALUES
('uuid-attack-1', 'Slash', 15, 'Melee'),
('uuid-attack-2', 'Fire Arrow', 25, 'Ranged');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Character`
--

CREATE TABLE `Character` (
  `character_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `hp` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Character`
--

INSERT INTO `Character` (`character_id`, `name`, `type`, `level`, `hp`) VALUES
('uuid-char-1', 'Aragorn', 'Warrior', 10, 100),
('uuid-char-2', 'Legolas', 'Archer', 8, 80);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `CharacterAttack`
--

CREATE TABLE `CharacterAttack` (
  `character_attack_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `character_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attack_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `CharacterAttack`
--

INSERT INTO `CharacterAttack` (`character_attack_id`, `character_id`, `attack_id`) VALUES
('uuid-ca-1', 'uuid-char-1', 'uuid-attack-1'),
('uuid-ca-2', 'uuid-char-2', 'uuid-attack-2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `CharacterEquipment`
--

CREATE TABLE `CharacterEquipment` (
  `character_equipment_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `character_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `CharacterEquipment`
--

INSERT INTO `CharacterEquipment` (`character_equipment_id`, `character_id`, `equipment_id`) VALUES
('uuid-ce-1', 'uuid-char-1', 'uuid-equip-1'),
('uuid-ce-2', 'uuid-char-2', 'uuid-equip-2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `CharacterSkill`
--

CREATE TABLE `CharacterSkill` (
  `character_skill_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `character_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `skill_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `CharacterSkill`
--

INSERT INTO `CharacterSkill` (`character_skill_id`, `character_id`, `skill_id`) VALUES
('uuid-cs-1', 'uuid-char-1', 'uuid-skill-1'),
('uuid-cs-2', 'uuid-char-2', 'uuid-skill-2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Combat`
--

CREATE TABLE `Combat` (
  `combat_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `round` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Combat`
--

INSERT INTO `Combat` (`combat_id`, `name`, `round`) VALUES
('uuid-combat-1', 'Battle of Helm\'s Deep', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `CombatCharacter`
--

CREATE TABLE `CombatCharacter` (
  `combat_character_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `combat_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `character_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `CombatCharacter`
--

INSERT INTO `CombatCharacter` (`combat_character_id`, `combat_id`, `character_id`) VALUES
('uuid-cc-1', 'uuid-combat-1', 'uuid-char-1'),
('uuid-cc-2', 'uuid-combat-1', 'uuid-char-2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Equipment`
--

CREATE TABLE `Equipment` (
  `equipment_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rarity` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Equipment`
--

INSERT INTO `Equipment` (`equipment_id`, `name`, `type`, `rarity`) VALUES
('uuid-equip-1', 'Steel Sword', 'Weapon', 'Rare'),
('uuid-equip-2', 'Elven Cloak', 'Armor', 'Epic');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Item`
--

CREATE TABLE `Item` (
  `item_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rarity` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Item`
--

INSERT INTO `Item` (`item_id`, `name`, `type`, `rarity`) VALUES
('uuid-item-1', 'Health Potion', 'Consumable', 'Common'),
('uuid-item-2', 'Magic Dust', 'Material', 'Rare');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ItemEquipment`
--

CREATE TABLE `ItemEquipment` (
  `item_equipment_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `equipment_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_id` char(36) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ItemEquipment`
--

INSERT INTO `ItemEquipment` (`item_equipment_id`, `equipment_id`, `item_id`) VALUES
('uuid-ie-1', 'uuid-equip-1', 'uuid-item-1'),
('uuid-ie-2', 'uuid-equip-2', 'uuid-item-2');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Skill`
--

CREATE TABLE `Skill` (
  `skill_id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `Skill`
--

INSERT INTO `Skill` (`skill_id`, `name`, `description`) VALUES
('uuid-skill-1', 'Fireball', 'Cast a blazing fireball'),
('uuid-skill-2', 'Stealth', 'Become invisible for a short time');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `Attack`
--
ALTER TABLE `Attack`
  ADD PRIMARY KEY (`attack_id`);

--
-- Indexen voor tabel `Character`
--
ALTER TABLE `Character`
  ADD PRIMARY KEY (`character_id`);

--
-- Indexen voor tabel `CharacterAttack`
--
ALTER TABLE `CharacterAttack`
  ADD PRIMARY KEY (`character_attack_id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `attack_id` (`attack_id`);

--
-- Indexen voor tabel `CharacterEquipment`
--
ALTER TABLE `CharacterEquipment`
  ADD PRIMARY KEY (`character_equipment_id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Indexen voor tabel `CharacterSkill`
--
ALTER TABLE `CharacterSkill`
  ADD PRIMARY KEY (`character_skill_id`),
  ADD KEY `character_id` (`character_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexen voor tabel `Combat`
--
ALTER TABLE `Combat`
  ADD PRIMARY KEY (`combat_id`);

--
-- Indexen voor tabel `CombatCharacter`
--
ALTER TABLE `CombatCharacter`
  ADD PRIMARY KEY (`combat_character_id`),
  ADD KEY `combat_id` (`combat_id`),
  ADD KEY `character_id` (`character_id`);

--
-- Indexen voor tabel `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexen voor tabel `Item`
--
ALTER TABLE `Item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexen voor tabel `ItemEquipment`
--
ALTER TABLE `ItemEquipment`
  ADD PRIMARY KEY (`item_equipment_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexen voor tabel `Skill`
--
ALTER TABLE `Skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `CharacterAttack`
--
ALTER TABLE `CharacterAttack`
  ADD CONSTRAINT `characterattack_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `Character` (`character_id`),
  ADD CONSTRAINT `characterattack_ibfk_2` FOREIGN KEY (`attack_id`) REFERENCES `Attack` (`attack_id`);

--
-- Beperkingen voor tabel `CharacterEquipment`
--
ALTER TABLE `CharacterEquipment`
  ADD CONSTRAINT `characterequipment_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `Character` (`character_id`),
  ADD CONSTRAINT `characterequipment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `Equipment` (`equipment_id`);

--
-- Beperkingen voor tabel `CharacterSkill`
--
ALTER TABLE `CharacterSkill`
  ADD CONSTRAINT `characterskill_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `Character` (`character_id`),
  ADD CONSTRAINT `characterskill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `Skill` (`skill_id`);

--
-- Beperkingen voor tabel `CombatCharacter`
--
ALTER TABLE `CombatCharacter`
  ADD CONSTRAINT `combatcharacter_ibfk_1` FOREIGN KEY (`combat_id`) REFERENCES `Combat` (`combat_id`),
  ADD CONSTRAINT `combatcharacter_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `Character` (`character_id`);

--
-- Beperkingen voor tabel `ItemEquipment`
--
ALTER TABLE `ItemEquipment`
  ADD CONSTRAINT `itemequipment_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `Equipment` (`equipment_id`),
  ADD CONSTRAINT `itemequipment_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `Item` (`item_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

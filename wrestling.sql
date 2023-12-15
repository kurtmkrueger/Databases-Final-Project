-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wrestling
-- -----------------------------------------------------
-- This is a database to track independent pro wrestling matches throughout the midwest.
DROP SCHEMA IF EXISTS `wrestling` ;

-- -----------------------------------------------------
-- Schema wrestling
--
-- This is a database to track independent pro wrestling matches throughout the midwest.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wrestling` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `wrestling` ;

-- -----------------------------------------------------
-- Table `person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `person` ;

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NULL,
  `home_town` VARCHAR(20) NULL,
  `home_state` CHAR(2) NULL,
  `home_zip` INT NULL,
  `home_country` VARCHAR(20) NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `promotion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `promotion` ;

CREATE TABLE IF NOT EXISTS `promotion` (
  `promotion_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `promotion_initials` VARCHAR(10) NOT NULL,
  `promotion_name` VARCHAR(45) NOT NULL,
  `promoter` INT UNSIGNED NULL,
  PRIMARY KEY (`promotion_id`),
  UNIQUE INDEX `promotion_id_UNIQUE` (`promotion_id` ASC) VISIBLE,
  INDEX `fk_promotion_person1_idx` (`promoter` ASC) VISIBLE,
  CONSTRAINT `fk_promotion_person1`
    FOREIGN KEY (`promoter`)
    REFERENCES `person` (`person_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `venue` ;

CREATE TABLE IF NOT EXISTS `venue` (
  `venue_id` INT NOT NULL AUTO_INCREMENT,
  `venue_name` VARCHAR(45) NULL,
  `venue_address` VARCHAR(45) NULL,
  `venue_town` VARCHAR(20) NULL,
  `venue_state` CHAR(2) NULL,
  `venue_zip` INT NULL,
  PRIMARY KEY (`venue_id`),
  UNIQUE INDEX `venue_id_UNIQUE` (`venue_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `show` ;

CREATE TABLE IF NOT EXISTS `show` (
  `promotion_id` INT UNSIGNED NOT NULL,
  `show_date` DATE NOT NULL,
  `venue_id` INT NULL,
  PRIMARY KEY (`promotion_id`, `show_date`),
  INDEX `fk_show_venue1_idx` (`venue_id` ASC) VISIBLE,
  CONSTRAINT `fk_show_promotion`
    FOREIGN KEY (`promotion_id`)
    REFERENCES `promotion` (`promotion_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_show_venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `venue` (`venue_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `match` ;

CREATE TABLE IF NOT EXISTS `match` (
  `match_num` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `promotion_id` INT UNSIGNED NOT NULL,
  `show_date` DATE NOT NULL,
  PRIMARY KEY (`match_num`, `promotion_id`, `show_date`),
  INDEX `fk_match_show1_idx` (`promotion_id` ASC, `show_date` ASC) VISIBLE,
  CONSTRAINT `fk_match_show1`
    FOREIGN KEY (`promotion_id` , `show_date`)
    REFERENCES `show` (`promotion_id` , `show_date`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_description` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_id_UNIQUE` (`role_id` ASC) VISIBLE,
  UNIQUE INDEX `role_description_UNIQUE` (`role_description` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `person_has_match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `person_has_match` ;

CREATE TABLE IF NOT EXISTS `person_has_match` (
  `person_id` INT UNSIGNED NOT NULL,
  `match_num` INT UNSIGNED NOT NULL,
  `promotion_id` INT UNSIGNED NOT NULL,
  `show_date` DATE NOT NULL,
  `winner` BLOB NULL,
  `role_id` INT UNSIGNED NULL,
  PRIMARY KEY (`person_id`, `match_num`, `promotion_id`, `show_date`),
  INDEX `fk_person_has_match_match1_idx` (`match_num` ASC, `promotion_id` ASC, `show_date` ASC) VISIBLE,
  INDEX `fk_person_has_match_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_person_has_match_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_person_has_match_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_person_has_match_match1`
    FOREIGN KEY (`match_num` , `promotion_id` , `show_date`)
    REFERENCES `match` (`match_num` , `promotion_id` , `show_date`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_person_has_match_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`role_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '				';


-- -----------------------------------------------------
-- Table `person_is_staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `person_is_staff` ;

CREATE TABLE IF NOT EXISTS `person_is_staff` (
  `promotion_id` INT UNSIGNED NOT NULL,
  `show_date` DATE NOT NULL,
  `person_id` INT UNSIGNED NOT NULL,
  `role_id` INT UNSIGNED NULL,
  PRIMARY KEY (`promotion_id`, `show_date`, `person_id`),
  INDEX `fk_show_has_person_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_show_has_person_show1_idx` (`promotion_id` ASC, `show_date` ASC) VISIBLE,
  INDEX `fk_staff_role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_show_has_person_show1`
    FOREIGN KEY (`promotion_id` , `show_date`)
    REFERENCES `show` (`promotion_id` , `show_date`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_show_has_person_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`role_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

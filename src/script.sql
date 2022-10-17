## Create DB 
CREATE SCHEMA IF NOT EXISTS `destino_cordoba` DEFAULT CHARACTER SET utf8 ;

## USE DB
USE `destino_cordoba` ;

## Create table USER
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`USER` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `PASSWORD` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC) VISIBLE,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

## Create table PAY
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`PAY` (
  `ID` INT NOT NULL,
  `METHOD` VARCHAR(45) NOT NULL,
  `TOTAL` DOUBLE NOT NULL,
  `TIMESTAMP` DATE NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  UNIQUE INDEX `METHOD_UNIQUE` (`METHOD` ASC) VISIBLE)
ENGINE = InnoDB;


## Create table ORDEN_PAQUETE
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`ORDEN_PAQUETE` (
  `ID` INT NOT NULL,
  `USER_ID` INT NOT NULL,
  `PAY_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `USER_ID`, `PAY_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_ORDEN_PAQUETE_USER1_idx` (`USER_ID` ASC) VISIBLE,
  INDEX `fk_ORDEN_PAQUETE_PAY1_idx` (`PAY_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ORDEN_PAQUETE_USER1`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `destino_cordoba`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDEN_PAQUETE_PAY1`
    FOREIGN KEY (`PAY_ID`)
    REFERENCES `destino_cordoba`.`PAY` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


## Create table ROLE
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`ROLE` (
  `ID` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `USER_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `USER_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_ROLE_USER_idx` (`USER_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ROLE_USER`
    FOREIGN KEY (`USER_ID`)
    REFERENCES `destino_cordoba`.`USER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

## Create table EXPERIENCIA
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`EXPERIENCIA` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `PRICE` DOUBLE NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  UNIQUE INDEX `NAME_UNIQUE` (`NAME` ASC) VISIBLE)
ENGINE = InnoDB;

## Create sub-table EXPERIENCIA_has_ORDER_PAQUETE
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`EXPERIENCIA_has_ORDEN_PAQUETE` (
  `EXPERIENCIA_ID` INT NOT NULL,
  `ORDEN_PAQUETE_ID` INT NOT NULL,
  PRIMARY KEY (`EXPERIENCIA_ID`, `ORDEN_PAQUETE_ID`),
  INDEX `fk_EXPERIENCIA_has_ORDEN_PAQUETE_ORDEN_PAQUETE1_idx` (`ORDEN_PAQUETE_ID` ASC) VISIBLE,
  INDEX `fk_EXPERIENCIA_has_ORDEN_PAQUETE_EXPERIENCIA1_idx` (`EXPERIENCIA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_EXPERIENCIA_has_ORDEN_PAQUETE_EXPERIENCIA1`
    FOREIGN KEY (`EXPERIENCIA_ID`)
    REFERENCES `destino_cordoba`.`EXPERIENCIA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EXPERIENCIA_has_ORDEN_PAQUETE_ORDEN_PAQUETE1`
    FOREIGN KEY (`ORDEN_PAQUETE_ID`)
    REFERENCES `destino_cordoba`.`ORDEN_PAQUETE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

## Create table DESTINO
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`DESTINO` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `DESCRIPTION` VARCHAR(45) NOT NULL,
  `INFORMATION` VARCHAR(45) NOT NULL,
  `LOCATION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;

## Create sub-table DESTINO_has_EXPERIENCIA
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`DESTINO_has_EXPERIENCIA` (
  `DESTINO_ID` INT NOT NULL,
  `EXPERIENCIA_ID` INT NOT NULL,
  PRIMARY KEY (`DESTINO_ID`, `EXPERIENCIA_ID`),
  INDEX `fk_DESTINO_has_EXPERIENCIA_EXPERIENCIA1_idx` (`EXPERIENCIA_ID` ASC) VISIBLE,
  INDEX `fk_DESTINO_has_EXPERIENCIA_DESTINO1_idx` (`DESTINO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_DESTINO_has_EXPERIENCIA_DESTINO1`
    FOREIGN KEY (`DESTINO_ID`)
    REFERENCES `destino_cordoba`.`DESTINO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DESTINO_has_EXPERIENCIA_EXPERIENCIA1`
    FOREIGN KEY (`EXPERIENCIA_ID`)
    REFERENCES `destino_cordoba`.`EXPERIENCIA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

## Create table IMAGE
CREATE TABLE IF NOT EXISTS `destino_cordoba`.`IMAGE` (
  `ID` INT NOT NULL,
  `PATH` VARCHAR(45) NOT NULL,
  `DESTINO_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `DESTINO_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_IMAGE_DESTINO1_idx` (`DESTINO_ID` ASC) VISIBLE,
  CONSTRAINT `fk_IMAGE_DESTINO1`
    FOREIGN KEY (`DESTINO_ID`)
    REFERENCES `destino_cordoba`.`DESTINO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

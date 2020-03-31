-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Library
-- -----------------------------------------------------
-- Consists of details of :-
-- 
-- Book
-- Patron
-- Librarian
-- Transactions
DROP SCHEMA IF EXISTS `Library` ;

-- -----------------------------------------------------
-- Schema Library
--
-- Consists of details of :-
-- 
-- Book
-- Patron
-- Librarian
-- Transactions
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Library` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Library` ;

-- -----------------------------------------------------
-- Table `Library`.`Librarian`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Librarian` ;

CREATE TABLE IF NOT EXISTS `Library`.`Librarian` (
  `id` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(32) NOT NULL,
  `priv` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`Patron`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Patron` ;

CREATE TABLE IF NOT EXISTS `Library`.`Patron` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phno` VARCHAR(10) NOT NULL,
  `due_amount` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Book` ;

CREATE TABLE IF NOT EXISTS `Library`.`Book` (
  `id` VARCHAR(5) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `author` VARCHAR(45) NOT NULL,
  `description` TEXT(200) NOT NULL,
  `copies_available` INT NOT NULL,
  `added` TIMESTAMP NOT NULL,
  `photo_loc` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`TransactionType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`TransactionType` ;

CREATE TABLE IF NOT EXISTS `Library`.`TransactionType` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Transaction` ;

CREATE TABLE IF NOT EXISTS `Library`.`Transaction` (
  `book_id` VARCHAR(30) NOT NULL,
  `type_id` INT NOT NULL,
  `patron_id` VARCHAR(10) NOT NULL,
  `time` TIMESTAMP NULL,
  INDEX `BK_FK_idx` (`book_id` ASC) VISIBLE,
  INDEX `TXN_FK_idx` (`type_id` ASC) VISIBLE,
  INDEX `P_FK_idx` (`patron_id` ASC) VISIBLE,
  CONSTRAINT `TXN_BK_FK`
    FOREIGN KEY (`book_id`)
    REFERENCES `Library`.`Book` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `TXN_TXN_FK`
    FOREIGN KEY (`type_id`)
    REFERENCES `Library`.`TransactionType` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `TXN_P_FK`
    FOREIGN KEY (`patron_id`)
    REFERENCES `Library`.`Patron` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`BookTags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`BookTags` ;

CREATE TABLE IF NOT EXISTS `Library`.`BookTags` (
  `Book_id` VARCHAR(30) NOT NULL,
  `Tag_name` VARCHAR(15) NOT NULL,
  CONSTRAINT `BT_BK_FK`
    FOREIGN KEY (`Book_id`)
    REFERENCES `Library`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`BookLocation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`BookLocation` ;

CREATE TABLE IF NOT EXISTS `Library`.`BookLocation` (
  `Book_id` VARCHAR(30) NOT NULL,
  `section` VARCHAR(45) NOT NULL,
  `shelf` INT NOT NULL,
  PRIMARY KEY (`Book_id`),
  CONSTRAINT `BL_BK_FK`
    FOREIGN KEY (`Book_id`)
    REFERENCES `Library`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Library`.`Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`Log` ;

CREATE TABLE IF NOT EXISTS `Library`.`Log` (
  `book_id` VARCHAR(5) NOT NULL,
  `t_id` INT NOT NULL,
  `patron_id` VARCHAR(10) NOT NULL,
  `time` TIMESTAMP NULL,
  INDEX `LOG_BK_FK_idx` (`book_id` ASC) VISIBLE,
  INDEX `LOG_TXN_FK_idx` (`t_id` ASC) VISIBLE,
  INDEX `LOG_P_FK_idx` (`patron_id` ASC) VISIBLE,
  CONSTRAINT `LOG_BK_FK`
    FOREIGN KEY (`book_id`)
    REFERENCES `Library`.`Book` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `LOG_TXN_FK`
    FOREIGN KEY (`t_id`)
    REFERENCES `Library`.`TransactionType` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `LOG_P_FK`
    FOREIGN KEY (`patron_id`)
    REFERENCES `Library`.`Patron` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `Library` ;

-- -----------------------------------------------------
-- Placeholder table for view `Library`.`BooksDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`BooksDetails` (`ID` INT, `Title` INT, `Author` INT, `Description` INT, `Available` INT, `Added On` INT, `Photo Location` INT, `Section` INT, `Shelf` INT, `Tags` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Library`.`PatronsDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`PatronsDetails` (`ID` INT, `Name` INT, `E-mail` INT, `Phone Number` INT, `Amount Due` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Library`.`PatronTransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`PatronTransactions` (`Patron_ID` INT, `Patron_Name` INT, `Transaction_Type` INT, `Book_Name` INT, `Time` INT);

-- -----------------------------------------------------
-- Placeholder table for view `Library`.`ActiveTransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Library`.`ActiveTransactions` (`Book_Name` INT, `Transaction_Type` INT, `Patron_Name` INT, `Time` INT);

-- -----------------------------------------------------
-- procedure Search
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`Search`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `Search` (
	search_string varchar(100)
)
BEGIN
	select 
		*
	from 
		`BooksDetails`
	where
		(`Title` like concat('%', concat(search_string, '%')) or `Title` like search_string)
        or
        (`Author` like concat('%', concat(search_string, '%')) or `Author` like search_string)
        or
        (`Tags` like concat('%', concat(search_string, '%')) or `Tags` like search_string)
        or
        (`Description` like concat('%', concat(search_string, '%')) or `Description` like search_string)
	;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddBook
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`AddBook`;

DELIMITER $$
USE `Library`$$
create procedure `AddBook`
    (
		in name varchar(100),
        in author varchar(50),
        in description text(200),
        in available int,
        in photo_location varchar(50),
        
        in section varchar(30),
        in shelf integer,
        
        in tags varchar(200)
    )   
    
    begin
    
		declare book_id varchar(5) default left(uuid(), 5);
        
        set @tag_list_query = concat(
									"insert into `BookTags` values('", 
									concat(
											concat(book_id, "','"),
											concat( 
													replace(
															tags,
															",", 
															concat(
																	"'),('", 
																	concat(book_id, "','")
																)
															),
													"')"
												)
											)
									);
        
        insert into `Book`(`id`, `title`, `author`, `description`, `added`, `copies_available`, `photo_loc`)
        values (book_id, name, author, description, now(), available, photo_location);
        
        insert into `BookLocation`(`book_id`, `section`, `shelf`)
        values (book_id, section, shelf);
        
		prepare insert_tags from @tag_list_query;
        execute insert_tags;
    end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ModifyBook
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`ModifyBook`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `ModifyBook` (

  in book_id varchar(5),
  in new_title varchar(45),
  in new_author varchar(45),
  in new_description text(200),
  in new_copies_available int,
  in new_photo_loc varchar(100),

  in new_section varchar(45),
  in new_shelf int,

  in new_tags varchar(200)
)
BEGIN
  
  -- Changes to Book Table
  update `Book`
  set 
      `Title` = new_title,
      `Author` = new_author,
      `Description` = new_description,
      `copies_available` = new_copies_available,
      `photo_loc` = new_photo_loc
  where
      `Book`.id = book_id;

  -- Changes to BookLocation Table
  update `BookLocation`
  set 
      `Section` = new_section,
      `Shelf` = new_shelf
  where
      `BookLocation`.book_id = book_id;

  -- Removing all the Tags of Current Book ID and Adding the New Tags
  delete from `BookTags` where `BookTags`.`Book_ID` = book_id;
   set @tag_list_query = concat(
									"insert into `BookTags` values('", 
									concat(
											concat(book_id, "','"),
											concat( 
													replace(
															new_tags,
															",", 
															concat(
																	"'),('", 
																	concat(book_id, "','")
																)
															),
													"')"
												)
											)
									);
                  
    prepare insert_tags from @tag_list_query;
    execute insert_tags;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeleteBook
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`DeleteBook`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `DeleteBook` (
  in d_book_id varchar(5)
)
BEGIN

  -- Delete from BookLocation
  delete from `BookLocation` where `Book_ID` = d_book_id;

  -- Delete from BookTags
  delete from `BookTags` where `Book_ID` = d_book_id;

  -- Delete from Book
  delete from `Book` where `ID` = d_book_id;
  
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddPatron
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`AddPatron`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `AddPatron` (
  in id varchar(10),
  in name varchar(45),
  in email varchar(45),
  in phno varchar(10)
)
BEGIN
  insert into `Patron` values(id, name, email, phno, 0);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ModifyPatron
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`ModifyPatron`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `ModifyPatron` (
  in patron_id varchar(10),
  in new_name varchar(45),
  in new_email varchar(45),
  in new_phno varchar(45),
  in new_due_amount int
)
BEGIN
  update `Patron`
  set
    `Name` = new_name,
    `Email` = new_email,
    `phno` = new_phno,
    `due_amount` = new_due_amount
  where
    `ID` = patron_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure DeletePatron
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`DeletePatron`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `DeletePatron` (
  in d_patron_id varchar(10)
)
BEGIN
  delete from `Patron` where `ID` = d_patron_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetBook
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`GetBook`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `GetBook` (
  in book_id varchar(5)
)
BEGIN
  select * from `BooksDetails` where `ID` = book_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetPatron
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`GetPatron`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `GetPatron` (
  in patron_id varchar(10)
)
BEGIN
  select * from `PatronsDetails` where `ID` = patron_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Issue
-- -----------------------------------------------------

USE `Library`;
DROP function IF EXISTS `Library`.`Issue`;

DELIMITER $$
USE `Library`$$
CREATE FUNCTION `Issue` (
  b_id varchar(5),
  p_id varchar(10)
)
returns
  int
deterministic
BEGIN

  -- Maximum Transaction
  set @max_transactions = 3;

  -- Check for existing transactions
  set @no_of_transactions = 0;
  select 
    count(*) into @no_of_transactions 
  from
    `Transaction`
  where
    `Patron_ID` = p_id;

  if @no_of_transactions >= @max_transactions then
    return (1);

  else
    
    -- Check if copies of book available

    set @avail = 0;
    select 
      `Copies_Available` into @avail 
    from 
      `Book`
    where
      `ID` = b_id;

    if @avail = 0 then
      return (2);

    else

      -- Check if the book is already issued
      set @issued = 0;
      
      select 
        count(*) into @issued
      from 
        `Transaction`
      where 
        `Book_ID` = b_id
        and
        `Patron_ID` = p_id;

      if @issued != 0 then
        return (3);

      else

        -- Issue the Book
        insert into `Transaction` 
        values(b_id, 1, p_id, now());

        -- Decrement the Book Count in `Book` Table
        update `Book`
        set `Copies_Available` = `Copies_Available` - 1
        where `ID` = b_id;

      end if;        

    end if;

  end if;

  return (0);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Return
-- -----------------------------------------------------

USE `Library`;
DROP function IF EXISTS `Library`.`Return`;

DELIMITER $$
USE `Library`$$
CREATE FUNCTION `Return` (
  b_id varchar(5),
  p_id varchar(10)
)
returns
  int
deterministic
BEGIN

  -- Maximum Days without Penalty
  set @max_days = 10;

  -- Penalty Per Day
  set @penalty = 2;

  -- Check if the book is in active transaction
  set @active = 0;
  select 
    count(*) into @active
  from 
    `Transaction`
  where
    `Book_ID` = b_id
    and 
    `Patron_ID` = p_id;

  if @active = 0 then
    return 1;

  else
  
    -- Update Due Amount for the Patron
    set @last_date = now();
    set @penalty_amount = 0;
    
    select `Time` into @last_date from `Transaction` where `Book_ID` = b_id and `Patron_ID` = p_id;
    select datediff(now(), @last_date) * @penalty into @penalty_amount;

    if @penalty_amount > 0 then
      update `Patron` set `Due_Amount` = `Due_Amount` + @penalty_amount where `ID` = p_id;
    end if;

    -- Remove from Transaction
    delete from `Transaction` where `Book_ID` = b_id and `Patron_ID` = p_id;

    -- Increment Availability Count in Book Table
    update `Book` set `Copies_Available` = `Copies_Available` + 1 where `ID` = b_id;

  end if;
	return 0;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Renew
-- -----------------------------------------------------

USE `Library`;
DROP function IF EXISTS `Library`.`Renew`;

DELIMITER $$
USE `Library`$$
CREATE FUNCTION `Renew` (
  b_id varchar(5),
  p_id varchar(10)
)
returns
  int
deterministic
BEGIN

  -- Check if the Book Exists in Active Transactions
  set @exists = 0;
  select 
    count(*) into @exists 
  from
    `Transaction`
  where
    `Book_ID` = b_id
    and
    `Patron_ID` = p_id;

  if @exists = 0 then
    return 1;

  else
    
    -- Update the time in Active Transactions
    update `Transaction` set `Time` = now() where `Book_ID` = b_id and `Patron_ID` = p_id;
    
  end if;
  return 0;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure ChangeLibrarian
-- -----------------------------------------------------

USE `Library`;
DROP procedure IF EXISTS `Library`.`ChangeLibrarian`;

DELIMITER $$
USE `Library`$$
CREATE PROCEDURE `ChangeLibrarian` (
	in new_id varchar(20),
    in new_name varchar(45),
    in new_pass varchar(45)
)
BEGIN
	update `Librarian`
    set
		`ID` = new_id,
        `Name` = new_name,
        `Pass` = md5(new_pass)
	where
		`Priv` = 2
    ;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function Login
-- -----------------------------------------------------

USE `Library`;
DROP function IF EXISTS `Library`.`Login`;

DELIMITER $$
USE `Library`$$
create function `Login`
(
	lib_id varchar(20),
    lib_pass varchar(40)
)
returns
	boolean
deterministic
begin
	return exists (select * from `Librarian` where `ID` = lib_id and `Pass` = md5(lib_pass));
end;$$

DELIMITER ;

-- -----------------------------------------------------
-- View `Library`.`BooksDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`BooksDetails`;
DROP VIEW IF EXISTS `Library`.`BooksDetails` ;
USE `Library`;
CREATE  OR REPLACE VIEW `BooksDetails` AS
  select 
    
    id                  as `ID`,
    title               as `Title`,
    author              as `Author`,
    description         as `Description`,
    copies_available    as `Available`,
    added               as `Added On`,
    photo_loc           as `Photo Location`,

    section             as `Section`,
    shelf               as `Shelf`,

    (select group_concat(`Tag_name`) from `BookTags` where `BookTags`.book_id = b.id) as `Tags`

  from 
    `Book` b,
    `BookLocation` bl

  where 
    b.`ID` = bl.`Book_ID`;

-- -----------------------------------------------------
-- View `Library`.`PatronsDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`PatronsDetails`;
DROP VIEW IF EXISTS `Library`.`PatronsDetails` ;
USE `Library`;
CREATE  OR REPLACE VIEW `PatronsDetails` AS
  select 
    id              as `ID`,
    name            as `Name`,
    email           as `E-mail`,
    phno            as `Phone Number`,
    due_amount      as `Amount Due`

  from 
    `Patron`;

-- -----------------------------------------------------
-- View `Library`.`PatronTransactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`PatronTransactions`;
DROP VIEW IF EXISTS `Library`.`PatronTransactions` ;
USE `Library`;
CREATE  OR REPLACE VIEW `PatronTransactions` AS
  select 
    `Patron_ID`,
    (select `Name` from `Patron` where `Patron`.`ID` = `Log`.`Patron_ID`) as `Patron_Name`,
    (select `Name` from `TransactionType` where `TransactionType`.`ID` = `Log`.`T_ID`) as `Transaction_Type`,
    (select `Title` from `Book` where `Book`.`ID` = `Log`.`Book_ID`) as `Book_Name`,
    `Time`
  from
    `Log`
  order by 
    `Time` desc,
    `T_id` desc
  ;

-- -----------------------------------------------------
-- View `Library`.`ActiveTransactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Library`.`ActiveTransactions`;
DROP VIEW IF EXISTS `Library`.`ActiveTransactions` ;
USE `Library`;
CREATE  OR REPLACE VIEW `ActiveTransactions` AS
	select 
    (select `Title` from `Book` where `Book`.`ID` = `Transaction`.`Book_ID`) as `Book_Name`,
    (select `Name` from `TransactionType` where `TransactionType`.`ID` = `Transaction`.`Type_ID`) as `Transaction_Type`,
    (select `Name` from `Patron` where `Patron`.`ID` = `Transaction`.`Patron_ID`) as `Patron_Name`,
    `Time`
  from
    `Transaction`

  group by
	`Book_Name`, `Patron_Name`
  order by 
    `Time` desc,
    `Type_id` desc
  ;
USE `Library`;

DELIMITER $$

USE `Library`$$
DROP TRIGGER IF EXISTS `Library`.`Log Issue` $$
USE `Library`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Library`.`Log Issue` AFTER INSERT ON `Transaction` FOR EACH ROW
BEGIN
	insert into `Log` 
	values(NEW.`Book_ID`, 1, NEW.`Patron_ID`, NEW.`Time`);
END$$


USE `Library`$$
DROP TRIGGER IF EXISTS `Library`.`Log Renew` $$
USE `Library`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Library`.`Log Renew` AFTER UPDATE ON `Transaction` FOR EACH ROW
BEGIN
	insert into `Log` 
	values(NEW.`Book_ID`, 2, NEW.`Patron_ID`, NEW.`Time`);
END$$


USE `Library`$$
DROP TRIGGER IF EXISTS `Library`.`Log Return` $$
USE `Library`$$
CREATE DEFINER = CURRENT_USER TRIGGER `Library`.`Log Return` BEFORE DELETE ON `Transaction` FOR EACH ROW
BEGIN
	insert into `Log`
    values(OLD.`Book_ID`, 3, OLD.`Patron_ID`, OLD.`Time`);
END$$


DELIMITER ;
SET SQL_MODE = '';
DROP USER IF EXISTS lib;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'lib' IDENTIFIED BY '23571113171923';

GRANT ALL ON `Library`.* TO 'lib';
GRANT SELECT ON TABLE `Library`.* TO 'lib';
GRANT SELECT, INSERT, TRIGGER ON TABLE `Library`.* TO 'lib';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `Library`.* TO 'lib';
SET SQL_MODE = '';
DROP USER IF EXISTS pat;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'pat';

GRANT SELECT ON TABLE `Library`.* TO 'pat';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Library`.`TransactionType`
-- -----------------------------------------------------
START TRANSACTION;
USE `Library`;
INSERT INTO `Library`.`TransactionType` (`id`, `name`) VALUES (1, 'Issue');
INSERT INTO `Library`.`TransactionType` (`id`, `name`) VALUES (2, 'Renew');
INSERT INTO `Library`.`TransactionType` (`id`, `name`) VALUES (3, 'Return');

COMMIT;


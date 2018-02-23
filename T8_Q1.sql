DROP PROCEDURE IF EXISTS `PRO_CLEAR_PROCEDURE_COUNTER`;

DELIMITER //

CREATE PROCEDURE `PRO_CLEAR_PROCEDURE_COUNTER` (
  in_procedure_name VARCHAR(20)
)
  BEGIN
    UPDATE `test_procedure`
    SET `count` = 0
    WHERE `name` = in_procedure_name;
  END;
//

DELIMITER ;

DROP PROCEDURE IF EXISTS `PRO_ADD_NEW_PROCEDURE`;

DELIMITER //

CREATE PROCEDURE `PRO_ADD_NEW_PROCEDURE` (
  in_procedure_name VARCHAR(20)
)
  BEGIN
    INSERT INTO `test_procedure`(`name`, `count`)
    VALUES (in_procedure_name, 0);
  END;
//

DELIMITER ;

DROP EVENT IF EXISTS `ev_rise_counter`;

DELIMITER //

CREATE EVENT `ev_rise_counter`
  ON SCHEDULE EVERY 1 SECOND
  STARTS NOW()
  ENDS NOW() + INTERVAL 1 MINUTE
DO
  BEGIN
    UPDATE `test_procedure`
    SET `count` = `count` + 1
    WHERE `name` != NULL;
  END;
//
DELIMITER ;

DROP EVENT IF EXISTS `ev_rise_counter`;

DELIMITER //

CREATE EVENT `ev_rise_counter`
  ON SCHEDULE EVERY 1 SECOND
  STARTS NOW()
  ENDS NOW() + INTERVAL 1 MINUTE
DO
  BEGIN
    UPDATE `test_procedure`
    SET `count` = `count` + 1
    WHERE `name` NOT LIKE "";
  END;
//
DELIMITER ;

CALL PRO_ADD_NEW_PROCEDURE("test");
CALL PRO_ADD_NEW_PROCEDURE("test2");
CALL PRO_CLEAR_PROCEDURE_COUNTER("test");




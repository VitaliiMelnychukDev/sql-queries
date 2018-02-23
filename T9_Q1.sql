DROP PROCEDURE IF EXISTS `PRO_ADD_TEN_TO_PROCEDURE`;

DELIMITER //

CREATE PROCEDURE `PRO_ADD_TEN_TO_PROCEDURE`(
  in_procedure_name VARCHAR(20)
)
  BEGIN
    UPDATE `test_procedure`
    SET `count` = `count` + 10
    WHERE `name` = in_procedure_name;
  END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS `PRO_ADD_TEN_TO_ALL_PROCEDURE`;
DELIMITER //

CREATE PROCEDURE `PRO_ADD_TEN_TO_ALL_PROCEDURE`()
  BEGIN
    DECLARE no_more_rows BOOLEAN;
    DECLARE procedure_name VARCHAR(50) DEFAULT '';

    DECLARE cursor_procedures CURSOR FOR
      SELECT `test_procedure`.`name` AS name
      FROM `test_procedure`;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET no_more_rows = TRUE;

    OPEN cursor_procedures;

    loop_procedures: LOOP

      FETCH cursor_procedures INTO procedure_name;

      IF no_more_rows THEN
        LEAVE loop_procedures;
      END IF;

      CALL PRO_ADD_TEN_TO_PROCEDURE(procedure_name);

    END LOOP loop_procedures;

    CLOSE cursor_procedures;
  END;
//
DELIMITER ;

CALL PRO_ADD_TEN_TO_ALL_PROCEDURE();

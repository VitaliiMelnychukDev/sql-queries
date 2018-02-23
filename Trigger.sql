DROP TRIGGER IF EXISTS `tg_set_count_to_ten`;

DELIMITER //

CREATE TRIGGER `tg_set_count_to_ten` AFTER INSERT ON `test_procedure`
  FOR EACH ROW BEGIN
  UPDATE `test_procedure`
  SET `count` = 10
  WHERE `name` = NEW.`name`;
END;
//
DELIMITER ;
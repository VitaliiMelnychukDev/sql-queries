CREATE OR REPLACE VIEW `v_user_login` AS
  SELECT
    `user_login`.`id` AS `user_login_id`,
    `user_login`.`user_id`,
    `user`.`name` AS `user_name`,
    `user_login`.`ip_address` AS `ip_address_integer`,
    INET_NTOA(`user_login`.`ip_address`) AS `ip_address`,
    `user_login`.`login_dt`
  FROM `user_login`
    LEFT JOIN `user` ON ( `user_login`.`user_id` = `user`.`id` )
  WHERE `user_login`.`deleted_flag` = 0

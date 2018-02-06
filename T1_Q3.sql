INSERT INTO bi_data.valid_offers (
  `offer_id`,
  `hotel_id`,
  `price_usd`,
  `original_price`,
  `original_currency_code`,
  `checkin_date`,
  `checkout_date`,
  `breakfast_included_flag`,
  `valid_from_date`,
  `valid_to_date`
)
SELECT
  `offer_cleanse_date_fix`.`id`,
  `offer_cleanse_date_fix`.`hotel_id`,
  `offer_cleanse_date_fix`.`sellings_price` as `price_usd`,
  `offer_cleanse_date_fix`.`sellings_price` as `original_price`,
  lc.code AS `original_currency_code`,
  `offer_cleanse_date_fix`.`checkin_date`,
  `offer_cleanse_date_fix`.`checkout_date`,
  `offer_cleanse_date_fix`.`breakfast_included_flag`,
  `offer_cleanse_date_fix`.`offer_valid_from`,
  `offer_cleanse_date_fix`.`offer_valid_to`
FROM  `enterprise_data`.`offer_cleanse_date_fix`

LEFT JOIN `primary_data`.`lst_currency` ON `lst_currency`.`offer_cleanse_date_fix_id` = `offer_cleanse_date_fix`.`id`

WHERE `offer_cleanse_date_fix`.`currency_id`=1
  AND `lst_currency`.`id`=1;
SET @start_date = '2000-01-01';
SET @finish_date = '2002-08-01';

SET @company_average_salary = (
  SELECT ROUND(AVG(`salary`.`salary_amount`),2)
  FROM `salary`
  WHERE @start_date BETWEEN `salary`.`from_date` AND
  IFNULL(`salary`.`to_date`, @finish_date)
);

SELECT
  `department_id`,
  `department_name`,
  `department_average_salary`,
  @company_average_salary AS company_average_salary,
  CASE
  WHEN `department_average_salary` > @company_average_salary THEN "higher"
  WHEN `department_average_salary` < @company_average_salary THEN "lower"
  ELSE "same"
  END AS department_vs_company
FROM (
       SELECT
         `department`.`id` AS department_id,
         `department`.`name` AS department_name,
         ROUND(AVG(`salary`.`salary_amount`), 2) AS department_average_salary
       FROM `salary`
         LEFT JOIN `department_employee_rel` ON `department_employee_rel`.`employee_id` = `salary`.`employee_id`
                                                AND @start_date BETWEEN `salary`.`from_date` AND
                                                IFNULL(`salary`.`to_date`, @finish_date)
         LEFT JOIN `department` ON `department_employee_rel`.`department_id` = `department`.`id`
       WHERE @start_date BETWEEN `salary`.`from_date` AND
       IFNULL(`salary`.`to_date`, @finish_date)
       GROUP BY
         `department`.`id`

     ) depertment_avg_salary;

SELECT @company_average_salary;
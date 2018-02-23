DROP FUNCTION IF EXISTS `FC_GET_TRIANGLE_AREA`;

DELIMITER //
CREATE FUNCTION `FC_GET_TRIANGLE_AREA` (
  side1 FLOAT,
  side2 FLOAT,
  side3 FLOAT
) RETURNS FLOAT
  BEGIN
    DECLARE half_perimiter FLOAT;
    DECLARE area FLOAT;
    SET half_perimiter = (side1 * side2 * side3) / 2;
    SET area = SQRT( half_perimiter * (half_perimiter - side1) * (half_perimiter - side2) * (half_perimiter - side3));
    RETURN area;
  END;
//
DELIMITER ;

SELECT FC_GET_TRIANGLE_AREA(23.93, 34.23, 43.34) AS triangle_area;
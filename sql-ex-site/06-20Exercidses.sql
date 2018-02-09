/*  Exercise6 */

SELECT
  Product.maker,
  Laptop.speed
FROM Laptop
  LEFT JOIN Product ON (Laptop.model = Product.model)
WHERE Product.type = 'Laptop'
      AND Laptop.hd >= 10;

/* Not Finished */
/****************-----------------------------****************/

/*  Exercise7 */

SELECT
  Printer.model,
  Printer.price
FROM Printer
  LEFT JOIN Product ON Product.model = Printer.model
WHERE Product.maker = 'B'

UNION
SELECT
  PC.model,
  PC.price
FROM PC
  LEFT JOIN Product ON Product.model = PC.model
WHERE Product.maker = 'B'

UNION
SELECT
  Laptop.model,
  Laptop.price
FROM Laptop
  LEFT JOIN Product ON Product.model = Laptop.model
WHERE Product.maker = 'B';


/* Finished */

/****************-----------------------------****************/


/*  Exercise8 */

SELECT DISTINCT Product.maker
FROM Product
WHERE Product.type = 'PC'
      AND Product.maker NOT IN (
  SELECT Product.maker
  FROM Product
  WHERE Product.type = 'Laptop'
);

/* Finished */
/****************-----------------------------****************/


/*  Exercise9 */

SELECT DISTINCT Product.maker
FROM Product
  LEFT JOIN PC ON PC.model = Product.model AND Product.type = 'PC'
WHERE PC.speed >= 450;

/* Finished */
/****************-----------------------------****************/

/*  Exercise10 */

SELECT
  model,
  price
FROM Printer
WHERE price = (
  SELECT MAX(price)
  FROM Printer
);

/* Finished */
/****************-----------------------------****************/


/*  Exercise11 */

SELECT AVG(speed)
FROM PC;

/* Finished */
/****************-----------------------------****************/


/*  Exercise12 */

SELECT AVG(speed)
FROM Laptop
WHERE Laptop.price > 1000;


/* Finished */
/****************-----------------------------****************/


/*  Exercise13 */

SELECT AVG(PC.speed)
FROM PC
  LEFT JOIN Product ON Product.model = PC.model
WHERE Product.maker = 'A';

/* Finished */
/****************-----------------------------****************/


/*  Exercise14 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise15 */

SELECT hd
FROM PC
GROUP BY hd
HAVING count(hd) > 1;

/* Not Finished */
/****************-----------------------------****************/


/*  Exercise16 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise17*/

SELECT
  DISTINCT
  Product.type,
  Laptop.model,
  Laptop.speed
FROM Laptop
  LEFT JOIN Product ON Product.model = Laptop.model
WHERE Laptop.speed < ALL (
  SELECT speed
  FROM PC
);


/* Finished */
/****************-----------------------------****************/


/*  Exercise18*/

SELECT
  Product.maker,
  Printer.price
FROM Printer
  LEFT JOIN Product ON Product.model = Printer.model
WHERE Printer.color = 'y'
      AND Printer.price = (
  SELECT MIN(price)
  FROM Printer
  WHERE color = 'y'
)



/* Not Finished */
/****************-----------------------------****************/

/*  Exercise19*/

SELECT
  Product.maker,
  AVG(screen)
FROM Laptop
  LEFT JOIN Product ON Product.model = Laptop.model
GROUP BY Product.maker;

/* Finished */
/****************-----------------------------****************/

/*  Exercise20*/

SELECT
  maker,
  count(model) AS model_count
FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING count(model) > 2;

/* Finished */
/****************-----------------------------****************/

/*  Exercise21*/

SELECT
  Product.maker,
  MAX(PC.price)
FROM PC
  LEFT JOIN Product ON Product.model = PC.model
GROUP BY Product.maker;

/* Finished */
/****************-----------------------------****************/

/*  Exercise22*/

SELECT
  speed,
  AVG(price)
FROM PC
WHERE speed > 600
GROUP BY speed;


/* Finished */
/****************-----------------------------****************/

/*  Exercise23*/

SELECT Product.maker
FROM PC
  LEFT JOIN Product ON PC.model = Product.model
WHERE PC.speed >= 750
INTERSECT
SELECT Product.maker
FROM Laptop
  LEFT JOIN Product ON Laptop.model = Product.model
WHERE Laptop.speed >= 750;


/* Finished */
/****************-----------------------------****************/

/*  Exercise24*/

WITH All_Products AS (
  SELECT
    model,
    price
  FROM PC
  UNION
  SELECT
    model,
    price
  FROM Laptop
  UNION
  SELECT
    model,
    price
  FROM Printer
)
SELECT
  model
FROM All_Products
WHERE price = (
  SELECT MAX(price)
  FROM All_Products
)


/* Finished */
/****************-----------------------------****************/

/*  Exercise25*/

WITH pc_products AS (
  SELECT model, speed
  FROM PC
  WHERE ram = (
    SELECT MIN(ram)
    FROM PC
  )
)

SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'
  AND maker IN (
  SELECT Product.maker
  FROM PC
    LEFT JOIN Product ON Product.model = PC.model
  WHERE Product.model IN(
    SELECT model
    FROM (
       SELECT model
       FROM pc_products
       WHERE speed = (
         SELECT MAX(speed)
         FROM pc_products
       )
    ) AS pc_max_speed
  )
)




/* Finished */
/****************-----------------------------****************/

/*  Exercise26*/


/* Not Finished */
/****************-----------------------------****************/

/*  Exercise27*/


/* Finished */
/****************-----------------------------****************/
/*  Exercise28*/


/* Not Finished */
/****************-----------------------------****************/

/*  Exercise29*/


/* Not Finished */
/****************-----------------------------****************/

/*  Exercise30*/


/* Not Finished */
/****************-----------------------------****************/

/*  Exercise31*/


/* Not Finished */
/****************-----------------------------****************/

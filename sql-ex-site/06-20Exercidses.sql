
/*  Exercise6 */

SELECT Product.maker, Laptop.speed
FROM Laptop
  LEFT JOIN Product ON (Laptop.model = Product.model)
WHERE Product.type = 'Laptop'
      AND Laptop.hd >= 10;

/* Not Finished */
/****************-----------------------------****************/

/*  Exercise7 */

SELECT Printer.model, Printer.price
FROM Printer
  LEFT JOIN Product ON Product.model = Printer.model
WHERE Product.maker = 'B'

UNION
SELECT PC.model, PC.price
FROM PC
  LEFT JOIN Product  ON Product.model = PC.model
WHERE Product.maker = 'B'

UNION
SELECT Laptop.model, Laptop.price
FROM Laptop
  LEFT JOIN Product  ON Product.model = Laptop.model
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
  LEFT JOIN PC ON PC.model = Product.model and Product.type = 'PC'
WHERE PC.speed >= 450;

/* Finished */
/****************-----------------------------****************/

/*  Exercise10 */

SELECT model, price
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


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise18*/


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise19*/


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise20*/


/* Not Finished */
/****************-----------------------------****************/


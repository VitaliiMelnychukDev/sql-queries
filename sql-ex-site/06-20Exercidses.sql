
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


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


/*  Exercise6 */


/* Not Finished */
/****************-----------------------------****************/


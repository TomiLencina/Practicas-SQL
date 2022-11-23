CREATE DATABASE tienda ;
USE tienda;

CREATE TABLE fabricante (
	codigo INT unsigned auto_increment primary key,
    nombre varchar(100) not null
    );
    
CREATE TABLE producto (
	codigo INT unsigned auto_increment primary key,
    nombre VARCHAR(100) not null,
    precio DOUBLE NOT NULL,
    codigo_fabricante INT unsigned not null,
    foreign key (codigo_fabricante) references fabricante(codigo)
    );
    
INSERT INTO fabricante VALUES(1,'Asus');
INSERT INTO fabricante VALUES(2,'Lenovo');
INSERT INTO fabricante VALUES(3,'Hewlett-Packard');
INSERT INTO fabricante VALUES(4,'Samsung');
INSERT INTO fabricante VALUES(5,'Seagrate');
INSERT INTO fabricante VALUES(6,'Crucial');
INSERT INTO fabricante VALUES(7,'Gigabyte');
INSERT INTO fabricante VALUES(8,'Huawei');
INSERT INTO fabricante VALUES(9,'Xiaomi');

INSERT INTO producto VALUES(1,'Disco duro SATA3 1tb', 86.99,5);
INSERT INTO producto VALUES(2,'Memoria RAM DDR4 8gb', 120,6);
INSERT INTO producto VALUES(3,'Disco SSD 1 tb', 150.99,4);
INSERT INTO producto VALUES(4,'GeForce GTX 1050ti', 185,4);
INSERT INTO producto VALUES(5,'GeForce GTX 1080 XTREME', 755,6);
INSERT INTO producto VALUES(6,'Monitor 24 LED Full HD', 202,1);
INSERT INTO producto VALUES(7,'Monitor 27 LED Full HD ', 245.99,1);
INSERT INTO producto VALUES(8,'Portatil Yoga 520', 559,2);
INSERT INTO producto VALUES(9,'Portatil Ideadpd 320', 444,2);
INSERT INTO producto VALUES(10,'Impresora HP  Deskjet 3720', 59.99,3);
INSERT INTO producto VALUES(11,'Impresora HP Laserjet Pro M26NW', 180,3);

-- LISTA EL NOMBRE Y EL PRECIO DE TODOS LOS PRODUCTOS
select nombre, precio FROM producto;

-- Lista todas las columnas de la tabla producto
SHOW COLUMNS from producto;

-- Lista el precio de los productos en euros y en dolares
select nombre, TRUNCATE(precio*260,0) AS dolares, TRUNCATE(precio*300,0) AS euros
from producto

-- Actualizar los nombre de productos a mayusculas y mostrarlos junto a los precios 
UPDATE tienda.producto SET nombre = (UPPER(nombre))
Select nombre, precio from producto

-- Actualizar los nombre de productos a miniscula y mostrarlos junto a los precios 
UPDATE tienda.producto SET nombre = (lower(nombre))
Select nombre, precio from producto

-- Listar el nombre y el precio de la tabla producto, redondeando el precio
SELECT nombre, ROUND(precio,0) from producto

-- Listar el nombre de los fabricantes y en la otra columna mostras en mayuscula los dos primeros letras de este
SELECT nombre, (substring(nombre,1,2)) AS iniciales_fabricantes FROM fabricante

-- Listar los nombres y los precios de todos los productos de producto TRUNCANDO EL valor del precio para mostrarlo ssin ningun decimal
SELECT nombre, TRUNCATE(precio, 0) AS precio_sin_decimales FROM producto

-- Listar el codigo de los fabricantes que tienen productos en la tabla producto y eliminar los repetidos
SELECT DISTINCT codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NOT null ORDER BY codigo_fabricante

-- Listar nombre de fabricantes en orden alfabatico
SELECT nombre FROM fabricante ORDER BY nombre

-- Listar nombre de fabricantes en orden alfabatico desc
SELECT nombre FROM fabricante ORDER BY nombre desc

-- Listar nombre de forma asc y segundo listar los nombres por el precio de forma desc
SELECT nombre FROM producto ORDER BY nombre
SELECT nombre, precio FROM producto ORDER BY precio desc

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante
SELECT nombre, codigo FROM fabricante LIMIT 5

-- Devuelve una lista con 2 filas apartir del cuarto regiatro de nombre de fabricantes
SELECT nombre, codigo FROM fabricante LIMIT 3,3

-- Lista el nombre y el precio del producto mas barato utilizando ORDER BY y LIMIT
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1

-- Lista el nombre y el precio del producto mas caro...
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1

-- Lista el nombre de todos los productos del fabricante con codigo 2
SELECT nombre FROM producto WHERE codigo_fabricante = 2

-- Lista el nombre de todos los productos cuyo precio es menor o igual a 150
SELECT nombre,precio FROM producto WHERE (precio <= 150)

-- Lista el nombre de todos los productos cuyo precio es mayor o igual a 150
SELECT nombre,precio FROM producto WHERE (precio >= 150)

-- Lista el nombre de todos los productos que tengan un precio entre 150 y 300 sin usa BETWEEN
SELECT nombre, precio FROM producto WHERE (precio >= 150) AND (precio <= 300)

-- Lista el nombre de todos los productos que tengan un precio entre 200 y 400 usando between
SELECT nombre, precio FROM producto WHERE precio BETWEEN 200 and 400

-- Lista todos los produc con precio mayor a 200 con el cod del fabricante 6
SELECT nombre, precio FROM producto WHERE (precio>=200) AND (codigo_fabricante = 6)

-- Lista todos los productos donde el codigo sea 1,2,5 SIN UTILIZAR EL OPERADOR IN
SELECT nombre,codigo_fabricante FROM producto WHERE (codigo_fabricante = 1) OR (codigo_fabricante = 2) OR (codigo_fabricante = 5) 

-- Lista todos los productos donde el codigo sea 1,2,5 utilizando EL OPERADOR IN
SELECT nombre,codigo_fabricante FROM producto WHERE codigo_fabricante in (1,2,5)

-- Lista nombre y el precio de los productos en centimos
SELECT nombre, (precio * 100) AS centimos FROM PRODUCTO

-- Lista el nombre de los fabricantes cuyo nombre empice con S
 SELECT nombre FROM fabricante WHERE nombre LIKE 'S%'
 
-- Lista el nombre de los fabricantes cuyo nombre termine con E
SELECT nombre FROM fabricante WHERE nombre LIKE '%e'
 
-- Lista el nombre de los fabricantes cuyo nombre sea de 4 caracteres
 SELECT nombre FROM fabricante WHERE nombre like '____'
 
-- Lista el nombre de los fabricantes cuyo nombre tenga la w
SELECT nombre FROM fabricante WHERE nombre like '%W%'
   
-- Devuelve una lista de todos los product que contengan "PORTATIL" en el nombre
SELECT nombre FROM producto WHERE nombre LIKE '%portatil%'


 
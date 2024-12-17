/*
Proyecto integrador Avance 3

Alejandro Tonatiu Gallardo Lozano

*/

/*1 Total de ventas globales

Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global? */

---520 de ventas totales

SELECT SUM(TotalCompra) AS totalventas
FROM Ordenes;

/*
2 Promedio de precios de productos por categoría

Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?
*/

SELECT CategoriaID, AVG(Precio) AS precio_promedio
FROM Productos
GROUP BY CategoriaID
ORDER BY precio_promedio;

/*
3 Orden mínima y máxima por sucursal

Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
*/

SELECT SucursalID, MIN(TotalCompra) AS Minima , MAX(TotalCompra) AS Maxima
FROM Ordenes
GROUP BY SucursalID;

/*
4 Mayor número de kilómetros recorridos para entrega

Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
*/

--1250 es el mayor numeros de kilometros recorridos

SELECT MAX(KilometrosRecorrer) AS mayor_kilometros
FROM Ordenes;

/*
5 Promedio de cantidad de productos por orden

Pregunta: ¿Cuál es la cantidad promedio de productos por orden?
*/

--3 productos en promedio

SELECT OrdenID, AVG(Cantidad) AS promedio_productos
FROM DetalleOrdenes
GROUP BY OrdenID;

/*
6 Total de ventas por tipo de pago

Pregunta: ¿Cuál es el total de ventas por cada tipo de pago?
*/

SELECT TipoPagoID, SUM(TotalCompra) AS total_ventas
FROM Ordenes
GROUP BY TipoPagoID;

/*
7 Sucursal con la venta promedio más alta

Pregunta: ¿Cuál sucursal tiene la venta promedio más alta?
*/

--La sucursal 9 

SELECT TOP (1) SucursalID, AVG(TotalCompra) AS venta_promedio
FROM Ordenes
GROUP BY SucursalID
ORDER BY venta_promedio DESC
;

/*
8 Sucursal con la mayor cantidad de ventas por encima de un umbral

Pregunta: ¿Cuáles son las sucursales que han generado ventas por orden por encima de $100, 
y cómo se comparan en términos del total de ventas?
*/

--Ninguna sucursal 

SELECT SucursalID, SUM(TotalCompra) AS ventas
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 100
;


/*
9 Comparación de ventas promedio antes y después de una fecha específica

Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
*/
SELECT
(SELECT AVG(TotalCompra) FROM Ordenes WHERE FechaOrdenTomada < '2023-07-01 00:00:01.000') AS fechaantes, 
(SELECT AVG(TotalCompra) FROM Ordenes WHERE FechaOrdenTomada >= '2023-07-01 00:00:01.000') AS fechadespues;


/*
10 Análisis de actividad de ventas por horario

Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor 
cantidad de ventas, cuál es el valor promedio de estas ventas, y cuál ha sido la venta máxima alcanzada?
*/
--de noche es el horario de mas ventas 

SELECT HorarioVenta, MAX(TotalCompra) AS mayorventa, AVG(TotalCompra) AS promedioventas
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY mayorventa DESC;



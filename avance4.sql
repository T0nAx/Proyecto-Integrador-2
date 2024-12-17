/*
Proyecto Integrador Avance 4

Alejandro Tonatiu Gallardo Lozano
*/

/*
1 Listar todos los productos y sus categorías

Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?

*/

SELECT p.Nombre AS producto, c.Nombre AS categoria
FROM Productos p INNER JOIN Categorias c
ON p.ProductoID = c.CategoriaID;

/*

2 Obtener empleados y su sucursal asignada

Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?

*/

SELECT e.Nombre AS empleado, s.Nombre AS sucursal
FROM Empleados e INNER JOIN Sucursales s
ON EmpleadoID = s.SucursalID;


/*
3  Identificar productos sin categoría asignada

Pregunta: ¿Existen productos que no tienen una categoría asignada?

*/

--No existen valores nulos compartido entre las tablas Productos y Categorias

SELECT *, c.Nombre AS categoria
FROM Productos p LEFT JOIN Categorias c
ON p.ProductoID = c.CategoriaID;

/*
4 Detalle completo de órdenes

Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo cliente, empleado que tomó la orden, y el mensajero que la entregó?

*/

SELECT Nombre AS empleado, s.Nombre 
FROM Ordenes INNER JOIN Sucursales s
ON OrdenID = s.SucursalID;


/*
5 Productos vendidos por sucursal

Pregunta: ¿Cuántos productos de cada tipo se han vendido en cada sucursal?

*/
SELECT 5.Nombre , 3.Nombre ,
       SUM(Cantidad) AS cantidad
FROM DetalleOrdenes AS 1
INNER JOIN Ordenes AS 2
ON 1.OrdenID = 2.OrdenID
INNER JOIN Productos AS 3
ON 1.Productos AS 3.ProductoID
INNER JOIN Sucursales AS 5
ON 2.SucursalID = 5.SucursalID
GROUP BY 3.Nombre, 5.Nombre;

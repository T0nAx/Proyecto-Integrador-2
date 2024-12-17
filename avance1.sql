/*Propyecto integrador Avance 1

Alejandro Tonatiu Gallardo Lozano*/



CREATE DATABASE PI_FastFood;
--Se ha creado la base de datos FastFood del Proyecto integrador

USE PI_FastFood;

--la tabla creada Origenes Orden con su propia clave privada y mas categorias propias

CREATE TABLE OrigenesOrden(
OrigenID INT IDENTITY(1,1) PRIMARY KEY,
Descripcion VARCHAR(255) NOT NULL
);

--la tabla creada Clientes con su propia clave privada y mas categorias propias

CREATE TABLE Clientes(
ClienteID INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(255)NOT NULL,
Direccion VARCHAR(255) NULL
);

--la tabla creada Tipos Pago con su propia clave privada y mas categorias propias

CREATE TABLE TiposPago(
TipoPagoID INT IDENTITY PRIMARY KEY,
Descripcion VARCHAR(255) NOT NULL
);

--la tabla creada Mensajeros con su propia clave privada y mas categorias propias

CREATE TABLE Mensajeros(
MensajeroID INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(255)NOT NULL, 
EsExterno BIT NOT NULL
);

--la tabla creada Sucursales con su propia clave privada y mas categorias propias

CREATE TABLE Sucursales(
SucursalID INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(255)NULL,
Direccion VARCHAR(255)NULL
);

--la tabla creada Categorias con su propia clave privada y mas categorias propias

CREATE TABLE Categorias(
CategoriaID INT IDENTITY PRIMARY KEY NOT NULL,
Nombre VARCHAR(255)NOT NULL
);

--la tabla creada Empleados con su propia clave privada y mas categorias propias Con la clave foranea de SucursalID

CREATE TABLE Empleados(
EmpleadoID INT IDENTITY PRIMARY KEY,
Nombre VARCHAR(255)NOT NULL,
Posicion VARCHAR(255) NULL,
Departamento VARCHAR(255) NULL,
SucursalID INT,
--SucursalID INT NOT NULL FOREIGN KEY REFERENCES Sucursales(SucursalID),
Rol VARCHAR(255) NULL);

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Categorias
FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID);

--la tabla creada´Prodcutos con su propia clave privada y mas categorias propias Con la clave foranea de CategoriaID

CREATE TABLE Productos(
ProductoID INT IDENTITY PRIMARY KEY,
Nombre NVARCHAR(255) NOT NULL,
CategoriaID INT,
--CategoriaID INT NOT NULL FOREIGN KEY REFERENCES categorias(CategoriaID),
Precio DECIMAL(10,2) NOT NULL
);

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias
FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID);


/*la tabla creada Ordenes con su propia clave privada y mas categorias propias Con la claves foraneas de ClienteID, 
EmpleadoID, SucursalID, MensajeroID, TipoPafoID y OrigenID */

CREATE TABLE Ordenes(
OrdenID INT IDENTITY PRIMARY KEY,
ClienteID INT, 
--ClienteID INT NOT NULL FOREIGN KEY REFERENCES Clientes(ClienteID),
EmpleadoID  INT,
--EmpleadoID  INT NOT NULL FOREIGN KEY REFERENCES Empleado(EmpleadoID),
SucursalID INT,
--SucursalID INT NOT NULL FOREIGN KEY REFERENCES Sucursales(SucursalID),
MensajeroID INT,
--MensajeroID INT NOT NULL FOREIGN KEY REFERENCES Mensajeros(MensajeroID),
TipoPagoID INT,
--TiposPagoID INT NOT NULL FOREIGN KEY REFERENCES TiposPago(TiposPagoID),
OrigenID INT ,
--OrigenID INT NOT NULL FOREIGN KEY REFERENCES OrigenesOrden(OrigenID),
HorarioVenta VARCHAR(50) NULL,
TotalCompra DECIMAL(10,2) NULL,
KilometrosRecorrer DECIMAL(10,2) NULL,
FechaDespacho DATETIME NULL,
FechaEntrega DATETIME NULL,
FechaOrdenTomada DATETIME NULL,
FechaOrdenLista DATETIME NULL
);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Clientes
FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Empleados
FOREIGN KEY(EmpleadoID) REFERENCES Empleados(EmpleadoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Sucursales
FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajeros
FOREIGN KEY(MensajeroID) REFERENCES Mensajeros(MensajeroID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK__Ordenes_TiposPago
FOREIGN KEY(TipoPagoID) REFERENCES TiposPago(TipoPagoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Origenes
FOREIGN KEY(OrigenID) REFERENCES OrigenesOrden(OrigenID);

--la tabla creada DetallesOrdenes con su propia clave privada y mas categorias propias Con la clave foranea 

CREATE TABLE DetalleOrdenes(
OrdenID INT,
ProductoID INT,
Cantidad INT NULL,
Precio DECIMAL(10,2) NULL,
PRIMARY KEY(OrdenID, ProductoID)
--OrdenID INT NOT NULL FOREIGN KEY REFERENCES Ordenes(OrdenID),
--ProductoID INT NOT NULL FOREIGN KEY REFERENCES Productos(ProductoID),
);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_Producto_DetalleOrden
FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_Orden_DetalleOrden
FOREIGN KEY(OrdenID) REFERENCES Ordenes(OrdenID);

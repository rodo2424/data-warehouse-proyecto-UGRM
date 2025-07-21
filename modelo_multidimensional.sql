-- USO DE BASE DE DATOS
USE DataWarehouse;
GO

-- CREACIÓN DE TABLAS DE DIMENSIÓN
CREATE TABLE dim_tiempo (
    id_tiempo INT PRIMARY KEY,
    fecha DATE NOT NULL,
    mes TINYINT CHECK (mes BETWEEN 1 AND 12),
    trimestre TINYINT CHECK (trimestre BETWEEN 1 AND 4),
    año SMALLINT CHECK (año >= 2000)
);

CREATE TABLE dim_cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    segmento VARCHAR(50)
);

CREATE TABLE dim_producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    marca VARCHAR(50)
);

CREATE TABLE dim_sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50),
    region VARCHAR(50)
);

-- CREACIÓN DE TABLA DE HECHOS
CREATE TABLE hechos_ventas (
    id_venta INT PRIMARY KEY,
    id_tiempo INT NOT NULL,
    id_producto INT NOT NULL,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    cantidad INT CHECK (cantidad >= 0),
    total_venta DECIMAL(12, 2) CHECK (total_venta >= 0),
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),
    FOREIGN KEY (id_producto) REFERENCES dim_producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id_cliente),
    FOREIGN KEY (id_sucursal) REFERENCES dim_sucursal(id_sucursal)
);

-- INSERCIÓN DE DATOS EN DIMENSIONES
INSERT INTO dim_tiempo (id_tiempo, fecha, mes, trimestre, año)
VALUES (1, '2025-07-20', 7, 3, 2025);

INSERT INTO dim_cliente (id_cliente, nombre, ciudad, segmento)
VALUES (1, 'Ana López', 'La Paz', 'Premium');

INSERT INTO dim_producto (id_producto, nombre, categoria, marca)
VALUES (1, 'Laptop HP', 'Tecnología', 'HP');

INSERT INTO dim_sucursal (id_sucursal, nombre, ciudad, region)
VALUES (1, 'Sucursal Central', 'La Paz', 'Occidente');

-- INSERCIÓN DE DATOS EN HECHOS
INSERT INTO hechos_ventas (id_venta, id_tiempo, id_producto, id_cliente, id_sucursal, cantidad, total_venta)
VALUES (1, 1, 1, 1, 1, 3, 3000.00);

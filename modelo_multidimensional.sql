-- USO DE BASE DE DATOS
USE DataWarehouse;
GO

-- TABLAS DE DIMENSIÓN
CREATE TABLE dim_tiempo (
    id_tiempo INT PRIMARY KEY,
    fecha DATE,
    mes INT,
    trimestre INT,
    año INT
);

CREATE TABLE dim_cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    segmento VARCHAR(50)
);

CREATE TABLE dim_producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    marca VARCHAR(50)
);

CREATE TABLE dim_sucursal (
    id_sucursal INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    region VARCHAR(50)
);

-- TABLA DE HECHOS
CREATE TABLE hechos_ventas (
    id_venta INT PRIMARY KEY,
    id_tiempo INT,
    id_producto INT,
    id_cliente INT,
    id_sucursal INT,
    cantidad INT,
    total_venta DECIMAL(10,2),
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),
    FOREIGN KEY (id_producto) REFERENCES dim_producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id_cliente),
    FOREIGN KEY (id_sucursal) REFERENCES dim_sucursal(id_sucursal)
);

-- INSERCIONES DE DATOS
INSERT INTO dim_tiempo VALUES (1, '2025-07-20', 7, 3, 2025);
INSERT INTO dim_cliente VALUES (1, 'Ana López', 'La Paz', 'Premium');
INSERT INTO dim_producto VALUES (1, 'Laptop HP', 'Tecnología', 'HP');
INSERT INTO dim_sucursal VALUES (1, 'Sucursal Central', 'La Paz', 'Occidente');
INSERT INTO hechos_ventas VALUES (1, 1, 1, 1, 1, 3, 3000.00);

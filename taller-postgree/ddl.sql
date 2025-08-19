-- Active: 1755090651571@@127.0.0.1@5433@miscompras@public
-- se crea la base de datos                                 -- recordar conectarse a la base de datos creada, ya que por defecto se conecta a la de campus
CREATE DATABASE miscompras;

-- clientes
CREATE TABLE clientes (
    id VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    celular VARCHAR(15),
    direccion VARCHAR(80),
    correo_electronico VARCHAR(70)
);

-- categorias
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    descripcion VARCHAR(45) NOT NULL,
    estado SMALLINT NOT NULL
);

-- productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    id_categoria INT NOT NULL,
    codigo_barras VARCHAR(150) UNIQUE,
    precio_venta DECIMAL(16,2) NOT NULL,
    cantidad_stock INT NOT NULL,
    estado SMALLINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- compras
CREATE TABLE compras (
    id_compra SERIAL PRIMARY KEY,
    id_cliente VARCHAR(20) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    medio_pago CHAR(1) NOT NULL,
    comentario VARCHAR(300),
    estado CHAR(1) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- compras_productos
CREATE TABLE compras_productos (
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(16,2) NOT NULL,
    estado SMALLINT NOT NULL,
    PRIMARY KEY (id_compra, id_producto),
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

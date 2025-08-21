INSERT INTO clientes (id, nombre, apellidos, celular, direccion, correo_electronico)
VALUES ('C001', 'Juan', 'Pérez Gómez', '3001234567', 'Calle 10 #12-34', 'juan.perez@email.com'),
('C002', 'María', 'Rodríguez López', '3119876543', 'Carrera 45 #67-89', 'maria.rodriguez@email.com');

INSERT INTO categorias (descripcion, estado)
VALUES ('Bebidas', 1),
('Snacks', 1),
('Lácteos', 1);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Coca-Cola 1.5L', 1, '7702001023456', 5500.00, 100, 1),
('Papas Margarita 50g', 2, '7702501001234', 2000.00, 200, 1),
('Leche Alpina 1L', 3, '7703001004567', 4500.00, 150, 1);

INSERT INTO compras (id_cliente, fecha, medio_pago, comentario, estado)
VALUES ('C001', '2025-08-18 10:30:00', 'E', 'Compra en efectivo', 'A'),
('C002', '2025-08-18 11:00:00', 'T', 'Pago con tarjeta', 'A');

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado)
VALUES (1, 1, 2, 11000.00, 1),
(1, 2, 1, 2000.00, 1),
(2, 3, 3, 13500.00, 1); 

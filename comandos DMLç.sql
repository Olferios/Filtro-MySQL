insert into productos (id,nombre,precio,descripcion) values
(1,'iphone 13',799.99,'apple iphone 13 con pantalla dde 6.1 pulgadas y camara dual'),
(2,'samsung galaxy s21',699.99,'samsung galaxy s21 con pantalla...'),
(3,'sony wh-1000xm4',349.99,'auriculares inalambricos sony con cancelacion ruidos'),
(4,'macbook pro',1299.99,'appele macbook pro con pantalla retina 1e pulgadas'),
(5,'dell xps 13',999.99,'portatil dell xp5 12 con pantalla de 13.3 pulgadas...'),
(6,'gopro hero9',399.99,'camara de accion gopro hero9 con resolucion 5 k'),
(7,'amazon echo dot',49.99,'altavoz inteligente amazon echo dot con alexA'),
(8,'kindle paperwhite',129.99,'amazon kindle paperwhite con pantall de ....'),
(9,'apple watch series 7',399.99,'apple watch series 7 con gps y pantalla...'),
(10,'bose quietcomfort 35 II',299.99,'auriculares inalambricos bose con ...'),
(11,'nintendo switch',299.99,'consola video juegos nitendo switvch...'),
(12,'fitbit charge 5',179.95,',onitoer actividad fissica fitbit charge 5....');

insert into usuarios (id, nombre, correoElectronico,fechaRegistro) values
(1,'juan perez','juan.perez@example.com','2024-01-01'),
(2,'Maria Lopez','maria.lopez@example.com','2024-01-05'),
(3,'Carlos Mendoza','carlos.mendonza@example.com','2024-02-10'),
(4,'Ana Gonzales','ana.gonzales@example.com','2024-02-20'),
(5,'Luis Torres','luis.torres@example.com','2024-03-05'),
(6,'Laura Rivera','laura.rivera@example.com','2024-03-15');

insert into pedidos (id, fkUsuario,fecha,total) values
(1,1,'2024-02-25',1049.98),
(2,2,'2024-03-10',1349.98),
(3,3,'2024-03-20',1249.99),
(4,4,'2024-03-25',449.98),
(5,5,'2024-04-05',699.99),
(6,6,'2024-04-10',399.99);
insert into detallePedido(fkPedido,fkProducto,cantidad,precioUnitario) values
(1,1,1,799.99),
(1,7,5,49.99),
(2,4,1,1299.99),
(2,8,1,129.99),
(3,2,1,699.99),
(3,9,1,399.99),
(4,5,1,999.99),
(4,10,1,299.99),
(5,11,1,299.99),
(5,3,1,349.99),
(6,6,1,399.99);
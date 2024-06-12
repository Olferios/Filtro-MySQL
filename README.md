# Filtro-MySQL por: Olfer Olaya
##CONSULTAS
### 1. Obtener la lista de todos los productos con sus precio
```
select nombre, precio from productos;
```
### 2. Encontrar todos los pedidos realizados por un usuario específico, por ejemplo, Juan Perez
```
select fkUsuario, fecha,total from pedidos
where fkUsuario =1;
```
### 3. Listar los detalles de todos los pedidos, incluyendo el nombre del producto, cantidad y precio unitario
```
select dp.fkPedido as pedidoId,p.nombre as Producto,dp.cantidad as cantidad,dp.precioUnitario as precioUnitario from detallePedido dp
join productos p on p.id=dp.fkProducto;
```
### 4. Calcular el total gastado por cada usuario en todos sus pedidos
```
select u.nombre, sum(p.total) as totalGastado from pedidos p
join usuarios u on u.id=p.fkusuario
group by u.nombre;
```
### 5. Encontrar los productos más caros (precio mayor a $500)
```
select nombre,precio from productos
where precio>500;
```
### 6. Listar los pedidos realizados en una fecha específica, por ejemplo, 2024-03-10
```
select id,fkUsuario,fecha,total from pedidos
where fecha='2024-03-10';
```
### 7. Obtener el número total de pedidos realizados por cada usuario
```
select u.nombre as nombre,count(p.id) from pedidos p
join usuarios u on u.id=p.fkUsuario
group by u.nombre;
```
### 8. Encontrar el nombre del producto más vendido (mayor cantidad total vendida)
```
select p.nombre as producto, d.cantidad as cantidadTotal from detallePedido d
join productos p on p.id=d.fkProducto
order by cantidadTotal desc
limit 1;
```
###  9. Listar todos los usuarios que han realizado al menos un pedido
```
select u.nombre as nombre, p.id from pedidos p
left join usuarios u on u.id=p.fkUsuario;
```
### 10. Obtener los detalles de un pedido específico, incluyendo los productos y cantidades, porejemplo, pedido con id 1
```
select pe.id as pedidoId,u.nombre as usuario,pr.nombre as producto,d.cantidad as cantidad,d.precioUnitario as precioUnitario from detallePedido d 
join productos pr on pr.id=d.fkProducto
join pedidos pe on pe.id=d.fkPedido
join usuarios u on u.id=pe.fkUsuario
where  pe.id=1;

```

## SUBCONSULTAS
### 1. Encontrar el nombre del usuario que ha gastado más en total
    select u.nombre from usuarios u
    where(select sum(p.total) from pedidos p
	  where u.id=p.fkUsuario)

    order by u.nombre desc
    limit 1;

### 2. Listar los productos que han sido pedidos al menos una vez
```
select p.nombre from productos p
where (select count(fkPedido) from detallePedido d
	where d.fkProducto=p.id and fkPedido>=1)
;
```
### 3. Obtener los detalles del pedido con el total más alto
```
select id,fkUsuario, fecha,total from pedidos
order by total desc
limit 1;
```
### 4. Listar los usuarios que han realizado más de un pedido
```
select nombre from usuarios 
where id in (select fkUsuario from pedidos
	group by fkUsuario
    having count(id) >1);
```
### 5. Encontrar el producto más caro que ha sido pedido al menos una vez
```
select id, nombre,precio from productos
where id in(select fkProducto from detallePedido)
order by precio desc
limit 1;
```
## Procedimientos
### 1. Crear un procedimiento almacenado para agregar un nuevo producto

####Procedimiento 
```
DELIMITER $$
DROP PROCEDURE IF EXISTS agregarProducto $$
CREATE PROCEDURE agregarProducto(
    in Inombre varchar(100),
    in IPrecio decimal,
    in idescripcion text)
BEGIN
    INSERT INTO productos(nombre,precio,descripcion) values
(Inombre,IPrecio,idescripcion);
END $$
DELIMITER ;
```

#### CALL 
```
call agregarProducto('mousepad',10.99,'mousepad magico');
```
### 2. Crear un procedimiento almacenado para obtener los detalles de un pedido
####Procedimiento 
```
DELIMITER $$
DROP PROCEDURE IF EXISTS obtenerDetallesPedido $$
CREATE procedure obtenerDetallesPedido(
in inputIdPedido int)
BEGIN
	select p.nombre,d.cantidad,d.precioUnitario from detallePedido d
    join productos p on p.id=d.fkProducto
    where inputIdPedido=fkPedido;
END $$
DELIMITER ;
```
#### CALL 
```
call obtenerDetallesPedido(1);
```
### 3. Crear un procedimiento almacenado para actualizar el precio de un producto
####Procedimiento 
```
DROP PROCEDURE IF EXISTS ActualizarPrecioProducto $$

CREATE PROCEDURE ActualizarPrecioProducto(
	in InIdProducto int,
    in nuevoPrecio decimal(10,2))
BEGIN
	update productos
    set precio=nuevoPrecio
    where id=InIdProducto;
END $$
DELIMITER ;
```
#### CALL 
```
call ActualizarPrecioProducto (1,2000);
```
### 4. Crear un procedimiento almacenado para eliminar un producto
####Procedimiento 
```
DELIMITER $$
DROP PROCEDURE IF EXISTS EliminarProducto $$
CREATE procedure EliminarProducto(
	in idProducto int)
BEGIN 
	delete from detallePedido
    where idProducto=fkProducto;
	delete from productos 
    where idProducto=id;
END $$
DELIMITER ;
```
#### CALL 
```
call EliminarProducto(1);
```
### 5. Crear un procedimiento almacenado para obtener el total gastado por un usuario
####Procedimiento 
```
delimiter $$
drop procedure if EXISTS TotalGastadoPorUsuario $$
CREATE PROCEDURE TotalGastadoPorUsuario(
	in idUsuario int)
BEGIN
	select u.nombre,sum(p.total) from usuarios u
    join pedidos p on p.fkUsuario=u.id
    where u.id=idUsuario
    group by u.nombre;
end $$
delimiter ;
```
#### CALL 
```
call TotalGastadoPorUsuario(1);
```

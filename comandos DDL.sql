create database techHavenOlfer;
use techHavenOlfer;
create table usuarios(
	id int not null auto_increment,
    nombre varchar(100),
    correoElectronico varchar(100),
    fechaRegistro date,
    constraint pk_id primary key(id)
);
create table productos(
	id int not null auto_increment,
    nombre varchar(100),
    precio decimal(10,2),
    descripcion text,
    constraint pk_id_productos primary key(id)
);

create table pedidos(
	id int not null auto_increment,
    fkUsuario int,
    fecha date,
    total decimal(10,2),
    constraint pk_Id_pedidos primary key(id),
    constraint fk_usuarios_pedido foreign key(fkUsuario) references usuarios(id)
);
create table detallePedido(
	fkPedido int,
    fkProducto int,
    cantidad int,
    precioUnitario decimal(10,2),
    constraint pk_detalePedido primary key(fkPedido,fkProducto),
    constraint fk_pedido_detalePedido foreign key(fkPedido) references pedidos(id),
    constraint fk_producto_detalePedido foreign key(fkProducto) references productos(id)    
);

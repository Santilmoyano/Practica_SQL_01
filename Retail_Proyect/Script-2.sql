
-- creacion de mis tablas

create table clientes (
cliente_id serial primary key,
email varchar (100) unique not null
);

create table productos (
producto_id serial primary key,
precio decimal (5,2) check (precio >0),
stock int check (stock > 0)
);

create table ventas (
venta_id serial primary key,
fecha date not null,
cliente_id int not null,
producto_id int not null,

foreign key (cliente_id) references clientes,
foreign key (producto_id) references productos
);

-- agrego columnas a mis tablas

alter table clientes 
add column edad int not null;

alter table productos 
add column nombre varchar (50) not null;

-- agrego una restriccion 

alter table clientes 
add constraint chk_edad
check (edad > 18);

-- cargo los datos
-- no cargo nada en la columna PK porque es de tipo serial
begin;

insert into clientes (email,edad) values 
('Pablo@hotmail.com',31),
('MartinPerez@arnet.com',20),
('Martati@gmail.com',25),
('JuanGomez@hotmail.com',19),
('MirtaGonzales@gmail.com',54);

--prueba

select * from clientes;

insert into productos (precio,stock,nombre) values 
(200.5,10,'Gatorade 500ml'),
(250,50,'Marlboro comun'),
(100,25,'Chicle de menta'),
(100.10,24,'CocaCola 250ml'),
(850,18,'Cerveza Norte');

insert into ventas (fecha,cliente_id,producto_id) values 
('2026-09-15',2,3),
('2025-05-16',5,1),
('2026-01-11',1,2),
('2026-04-08',3,4),
('2025-06-14',4,3);

commit;

-- aumento el precio del Gatorade

update productos set precio = precio*1.10 where nombre = 'Gatorade 500ml';

select * from productos where nombre = 'Gatorade 500ml';

--elimino una venta

delete from ventas where venta_id = 2;

select * from ventas;

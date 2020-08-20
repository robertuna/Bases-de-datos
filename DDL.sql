CREATE DATABASE Practica1_pelicula
ON
( NAME = Practica1_pelicula,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practica1_pelicula.mdf',
SIZE=22MB,
FILEGROWTH=16MB)
LOG ON
( NAME = Practica1_pelicula_log,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practica1_pelicula.ldf',
SIZE=22MB,
FILEGROWTH=16MB)
go

create schema practica
go

create table practica.Actor(
		identificador int primary key identity(1,1),
		nombre varchar(50),
		descripcion varchar(200)
	)
	go
create table practica.Rol(
		identificador int primary key identity(1,1),
		
		titulo varchar(50),
		estado varchar(50),
		id_actor int,
		constraint FK_Actor_actor_id foreign key (id_actor) references practica.Actor(identificador),
		id_pelicula int,
		constraint FK_Pelicula_pelicula_id foreign key (id_pelicula) references practica.Pelicula(identificador)
	)
	go
create table practica.Pelicula(
		identificador int primary key identity(1,1),
		nombre varchar(50),
		genero varchar(50),
		anio date
	)
	go

	create table practica.GeneroPelicula(
		identificador int primary key identity(1,1),
		idPersona int,
		genero varchar(50),
		id_productra int,
		constraint FK_Productora_productora_id foreign key (id_productra) references practica.Productora(identificador)
	
		
	)
	go
	create table practica.Productora(
		identificador int primary key identity(1,1),
		nombre varchar(50)
	)


	go


	create table practica.Logs(
		id int primary key identity(1,1),
		fecha date,
		usaurio varchar(50),
		texto varchar(300)
	)


	go

	--vistas
	
	create view practica.idActores as 
	select identificador from practica.Actor
	go

	create view practica.nombrePeliculas as 
	select nombre from practica.Pelicula
	go

--procedimientos almacenados.
	create procedure practica.AgregarActor (@nombre varchar(50), @descripcion varchar(200)) as
	begin

		insert into practica.Actor(nombre, descripcion)
		values(@nombre, @descripcion)

	end
go

	create procedure practica.AgregarProductora (@nombre varchar(50)) as
	begin

		insert into practica.Productora(nombre)
		values(@nombre)

	end
go

create procedure practica.AgregarRol (@titulo varchar(50), @estado varchar(50)) as
	begin

		insert into practica.Rol(titulo,estado)
		values(@titulo,@estado)

	end
go

create procedure practica.EliminarRol ( @estado varchar(50)) as
	begin

		Delete From practica.Rol
		where estado = @estado

	end
go
-- disparador.



 --Despues de una insercion va ir a registrar la actividad en la tabla logs 
 create trigger practica.tbLogs_insert on practica.Logs
after insert
as
begin
insert into [practica].[Logs]
values (GETDATE(),'inserto',1)
end
 go

insert into [practica].[Actor]([nombre],[descripcion])
values ('Carlos','Gran actor')

go

insert into [practica].[Productora]([nombre])
values ('Casca Production')

go

insert into [practica].[Pelicula]([nombre],[genero],[anio])
values ('cocos tour','comedia',GETDATE())

go

insert into [practica].[Rol]([titulo],[estado],[id_actor],[id_pelicula])
values ('nada','activo',1,1)

go

insert into [practica].[Logs]([fecha],[usaurio],[texto])
values (getdate(),'1','Esto es un texto')

go
Use Farmacia_Marien
Go

select * from Proveedores

Create procedure insertar_proveedor
	@nombre nvarchar(50),
	@nombreContacto nvarchar(50),
	@ruc nvarchar(10),
	@telefono char(8),
	@ciudad varchar(50),
	@municipio varchar(50),
	@direccion varchar(100),
	@correo nvarchar(20),
	@activo int

AS
	set @activo = 1
	insert into Proveedores values(@nombre,@nombreContacto,@ruc,@telefono,@ciudad,@municipio,@direccion,@correo,@activo)
Go

Create procedure modificar_proveedor
	@id int,
	@nombre nvarchar(50),
	@nombreContacto nvarchar(50),
	@ruc nvarchar(50),
	@telefono char(8),
	@ciudad varchar(50),
	@municipio varchar(50),
	@direccion varchar(100),
	@correo nvarchar(20),
	@activo int

AS
	Update Proveedores
	set 
		nombre = @nombre,
		nombreContacto = @nombreContacto,
		ruc = @ruc,
		telefono = @telefono,
		ciudad = @ciudad,
		municipio = @municipio,
		direccion = @direccion,
		correoElectronico = @correo
	where idProveedor = @id
Go

Create procedure eliminar_proveedor
	@id int

AS
	Update Proveedores
	set 
		activo = 0
	where id = @id and activo = 1
GO
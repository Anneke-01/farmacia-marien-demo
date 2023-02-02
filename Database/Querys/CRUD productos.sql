Use Farmacia_Marien
Go


Create procedure insertar_producto
	@idMarca int,
	@idCategoria nvarchar(5),
	@idTipo int,
	@nombre nvarchar(50),
	@fechaExpedicion date,
	@fechaVencimiento date,
	@precio float,
	@cantidad int,
	@url nvarchar(max)

AS
	BEGIN TRY
		IF EXISTS 
			(SELECT * 
				FROM Productos 
			WHERE 
				idMarca = @idMarca and
				idCategoria = @idCategoria and
				idTipoProducto = @idTipo and
				nombreProducto = @nombre and
				fechaExpedicion = @fechaExpedicion and
				fechaVencimiento = @fechaVencimiento and
				precio = @precio and
				cantidad = @cantidad and
				urlImg = @url)

			RAISERROR ('Duplicidad en los datos. El producto podria existir.', -- Message text.
					   12, -- Severity.
					   1 -- State.
					   );

		ELSE
			declare @activo int
			set @activo = 1
			insert into Productos values(@idMarca,@idCategoria,@idTipo,@nombre,@fechaExpedicion,@fechaVencimiento,@precio,@cantidad,@url,@activo)
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );
	END CATCH
Go

Create procedure modificar_producto
	@id int,
	@idMarca int,
	@idCategoria nvarchar(5),
	@idTipo int,
	@nombre nvarchar(50),
	@fechaExpedicion date,
	@fechaVencimiento date,
	@precio float,
	@cantidad int,
	@url nvarchar(max)

AS
	BEGIN TRY
		Update Productos
		set 
			idMarca = @idMarca,
			idCategoria = @idCategoria,
			idTipoProducto = @idTipo,
			nombreProducto = @nombre,
			fechaExpedicion = @fechaExpedicion,
			fechaVencimiento = @fechaVencimiento,
			precio = @precio,
			cantidad = @cantidad,
			urlImg = @url
		where idProducto = @id
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   );
	END CATCH
Go

Create procedure eliminar_producto
	@id int

AS
	IF EXISTS (Select COUNT(*) from Productos where idProducto = @id and activo = 1)
		Update Productos
		set 
			activo = 0
		where idProducto = @id

	ELSE
		Select ('El producto con id = '+ cast(@id as varchar)+' no existe.') as mensaje


	
GO

Create procedure mostrar_producto
	@id int

AS
	IF EXISTS (Select COUNT(*) from Productos where idProducto = @id)
		Select * from Proveedores where idProveedor = @id

	ELSE
		Select ('El producto con id = '+ cast(@id as varchar)+' no existe.') as mensaje		
	
GO

Create procedure restaurar_producto
	@id int

AS
	IF EXISTS (Select COUNT(*) from Productos where idProducto = @id and activo = 0)
		Update Productos
		set 
			activo = 1
		where idProducto = @id

	ELSE
		Select ('El producto con id = '+ cast(@id as varchar)+' no existe.') as mensaje


	
GO

Create procedure mostrar_registros_producto
AS
	select * from Productos
GO


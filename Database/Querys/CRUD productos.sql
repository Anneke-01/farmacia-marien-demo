Use farmaciamariendb
GO


ALTER procedure insertar_producto
	@idMarca int,
	@idTipoProducto int,
	@nombreProducto nvarchar(50),
	@fechaExpedicion date,
	@fechaVencimiento date,
	@prescripcion nvarchar(200),
	@descripcion nvarchar(max),
	@precio float,
	@cantidad int,
	@url nvarchar(max)

AS
	BEGIN TRY
		IF EXISTS (SELECT * FROM Productos 
			WHERE 
				idMarca = @idMarca and
				idTipoProducto = @idTipoProducto and
				nombreProducto = @nombreProducto and
				fechaExpedicion = @fechaExpedicion and
				fechaVencimiento = @fechaVencimiento and
				prescripcion = @prescripcion and
				descripcion = @descripcion and
				precio = @precio and
				cantidad = @cantidad and
				urlImg = @url)

				BEGIN
					RAISERROR ('Duplicidad en los datos. El producto ya podria existir.', -- Message text.
							12, -- Severity.
							1 -- State.
							)
				END

		ELSE
			BEGIN
				insert into Productos values(@idMarca,@idTipoProducto,@nombreProducto,@fechaExpedicion,@fechaVencimiento,@prescripcion,@descripcion,@precio,@cantidad,@url)
			END
	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE()

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   )
	END CATCH
Go

ALTER procedure modificar_producto
	@id int,
	@idMarca int,
	@idTipoProducto int,
	@nombreProducto nvarchar(50),
	@fechaExpedicion date,
	@fechaVencimiento date,
	@prescripcion nvarchar(200),
	@descripcion nvarchar(max),
	@precio float,
	@cantidad int,
	@url nvarchar(max)

AS
	BEGIN TRY
		IF EXISTS (SELECT * FROM Productos WHERE 
			idMarca = @idMarca and
			idTipoProducto = @idTipoProducto and
			nombreProducto = @nombreProducto and
			fechaExpedicion = @fechaExpedicion and
			fechaVencimiento = @fechaVencimiento and
			prescripcion = @prescripcion and
			descripcion = @descripcion and
			precio = @precio and
			cantidad = @cantidad and
			urlImg = @url)

			BEGIN
				RAISERROR ('Duplicidad en los datos. El producto ya podria existir.', -- Message text.
						12, -- Severity.
						1 -- State.
						)
			END

		ELSE
			BEGIN
				Update Productos set 
					idMarca = @idMarca,
					idTipoProducto = @idTipoProducto,
					nombreProducto = @nombreProducto,
					fechaExpedicion = @fechaExpedicion,
					fechaVencimiento = @fechaVencimiento,
					prescripcion = @prescripcion,
					descripcion = @descripcion,
					precio = @precio,
					cantidad = @cantidad,
					urlImg = @url
				where idProducto = @id			
			END

	END TRY

	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000)
		DECLARE @ErrorSeverity INT
		DECLARE @ErrorState INT

		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE()

		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
				   @ErrorSeverity, -- Severity.
				   @ErrorState -- State.
				   )
	END CATCH
Go

ALTER procedure eliminar_producto
	@id int

AS
	IF EXISTS (Select COUNT(*) from Productos where idProducto = @id)
		BEGIN
			DELETE FROM Productos WHERE idProducto = @id
		END
	ELSE
		BEGIN
			Select ('El producto con id = '+ cast(@id as varchar)+' no existe.') as mensaje
		END
GO

ALTER procedure mostrar_producto
	@id int

AS
	IF EXISTS (Select COUNT(*) from Productos where idProducto = @id)
		BEGIN
			Select * from Proveedores where idProveedor = @id
		END
	ELSE
		BEGIN
			Select ('El producto con id = '+ cast(@id as varchar)+' no existe.') as mensaje		
		END
GO



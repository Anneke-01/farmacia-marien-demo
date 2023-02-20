Use farmaciamariendb
GO

CREATE procedure insertar_proveedor
	@nombre nvarchar(150),
	@nombreContacto nvarchar(150),
	@ruc nvarchar(10),
	@telefono char(8),
	@ciudad varchar(50),
	@municipio varchar(50),
	@direccion varchar(100),
	@correo nvarchar(20)

AS
	BEGIN TRY
		IF EXISTS (SELECT * FROM Proveedores 
			WHERE 
				nombre = @nombre and
				nombreContacto = @nombreContacto and
				ruc = @ruc and
				telefono = @telefono and
				ciudad = @ciudad and
				municipio = @municipio and 
				direccion = @direccion and
				correoElectronico = @correo)

			BEGIN
				RAISERROR ('Duplicidad en los datos. El proveedor ya podria existir.', -- Message text.
						   12, -- Severity.
						   1 -- State.
						   )
			END
		ELSE
			BEGIN
				insert into Proveedores values(@nombre,@nombreContacto,@ruc,@telefono,@ciudad,@municipio,@direccion,@correo)
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

CREATE procedure modificar_proveedor
	@id int,
	@nombre nvarchar(150),
	@nombreContacto nvarchar(150),
	@ruc nvarchar(10),
	@telefono char(8),
	@ciudad varchar(50),
	@municipio varchar(50),
	@direccion varchar(100),
	@correo nvarchar(20)

AS
	BEGIN TRY
		IF EXISTS (SELECT * FROM Proveedores WHERE 
			nombre = @nombre and
			nombreContacto = @nombreContacto and
			ruc = @ruc and
			telefono = @telefono and
			ciudad = @ciudad and
			municipio = @municipio and 
			direccion = @direccion and
			correoElectronico = @correo)

			BEGIN
				RAISERROR ('Duplicidad en los datos. El proveedor ya podria existir.', -- Message text.
						   12, -- Severity.
						   1 -- State.
						   )
			END
		ELSE
			BEGIN
				Update Proveedores set 
					nombre = @nombre,
					nombreContacto = @nombreContacto,
					ruc = @ruc,
					telefono = @telefono,
					ciudad = @ciudad,
					municipio = @municipio,
					direccion = @direccion,
					correoElectronico = @correo
				where idProveedor = @id			
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

CREATE procedure eliminar_proveedor
	@id int

AS
	IF EXISTS (Select COUNT(*) from Proveedores where idProveedor = @id)
		BEGIN
			DELETE FROM Proveedores WHERE idProveedor = @id
		END
	ELSE
		BEGIN
			Select ('El proveedor con id = '+ cast(@id as varchar)+' no existe.') as mensaje
		END
GO

CREATE procedure mostrar_proveedor
	@id int

AS
	IF EXISTS (Select COUNT(*) from Proveedores where idProveedor = @id)
		BEGIN
			Select * from Proveedores where idProveedor = @id
		END
	ELSE
		BEGIN
			Select ('El proveedor con id = '+ cast(@id as varchar)+' no existe.') as mensaje		
		END
GO



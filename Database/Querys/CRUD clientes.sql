USE [farmaciamariendb]
GO

/****** Object:  StoredProcedure [dbo].[Insertar_clientes]    Script Date: 7/2/2023 09:46:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[insertar_cliente]
	@primerNombre nvarchar(150),
	@segundoNombre nvarchar(150),
	@primerApellido nvarchar(150),
	@segundoApellido nvarchar(150),
	@telefono char(8),
	@correoElectronico nvarchar(120),
	@nombreUsuario nvarchar(30),
	@contraseña nvarchar(32)

AS
	BEGIN TRY

		IF EXISTS (SELECT * FROM Clientes WHERE nombreUsuario = @nombreUsuario)			
			BEGIN
				RAISERROR ('Duplicidad en los datos. El usuario ya podria existir.', -- Message text.
							12, -- Severity.
							1 -- State.
							)
			END
		ELSE
			BEGIN
				INSERT INTO Clientes VALUES(@primerNombre,@segundoNombre, @primerApellido, @segundoApellido,@telefono, @correoElectronico,@nombreUsuario,ENCRYPTBYPASSPHRASE(@contraseña, @contraseña))
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
GO

Alter procedure [dbo].[modificar_cliente]
	@id int,
	@primerNombre nvarchar(150),
	@segundoNombre nvarchar(150),
	@primerApellido nvarchar(150),
	@segundoApellido nvarchar(150),
	@telefono char(8),
	@correoElectronico nvarchar(120),
	@nombreUsuario nvarchar(30),
	@contraseña nvarchar(32)

AS
	BEGIN TRY

		IF EXISTS (SELECT * FROM Clientes WHERE nombreUsuario = @nombreUsuario)			
			BEGIN
				RAISERROR ('Duplicidad en los datos. El usuario ya podria existir.', -- Message text.
							12, -- Severity.
							1 -- State.
							)
			END
		ELSE
			BEGIN
				Update Clientes set 
					primerNombre = @primerNombre,
					segundoNombre = @segundoNombre,
					primerApellido = @primerApellido,
					segundoApellido = @segundoApellido,
					telefono = @telefono,
					correoElectronico = @correoElectronico,
					nombreUsuario = @nombreUsuario,
					contraseña = ENCRYPTBYPASSPHRASE(@contraseña, @contraseña)
				where idCliente = @id
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
GO

ALTER procedure [dbo].[mostrar_cliente]
	@id int

AS
	IF EXISTS (Select COUNT(*) from Clientes where idCliente = @id)
		BEGIN
			Select * from Clientes where idCliente = @id
		END
	ELSE
		BEGIN
			Select ('El cliente con id = '+ cast(@id as varchar)+' no existe.') as mensaje		
		END
Go

ALTER procedure [dbo].[eliminar_cliente]
	@id int

AS
	IF EXISTS (Select COUNT(*) from Clientes where idCliente = @id)
		BEGIN
			DELETE FROM Clientes WHERE idCliente = @id
		END
	ELSE
		BEGIN
			Select ('El cliente con id = '+ cast(@id as varchar)+' no existe.') as mensaje
		END
GO

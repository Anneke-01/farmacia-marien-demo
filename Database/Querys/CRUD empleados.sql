USE [farmaciamariendb]
GO

/****** Object:  StoredProcedure [dbo].[Insertar_empleado]    Script Date: 7/2/2023 09:11:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Alter procedure [dbo].[insertar_empleado]
	@primerNombre nvarchar(150),
	@segundoNombre nvarchar(150),
	@primerApellido nvarchar(150),
	@segundoApellido nvarchar(150),
	@telefono char(8),
	@dni char(14),
	@correoElectronico nvarchar(120),
	@nombreUsuario nvarchar(30),
	@contraseña nvarchar(32),
	@idRol int

AS
	BEGIN TRY
		IF EXISTS (SELECT * FROM Empleados WHERE 
			primerNombre = @primerNombre and
			segundoNombre = @segundoNombre and
			primerApellido = @primerApellido and
			segundoApellido = @segundoApellido and
			telefono = @telefono and
			dni = @dni and
			correoElectronico = @correoElectronico)

			BEGIN
				RAISERROR ('Duplicidad en los datos. El empleado ya podria existir.', -- Message text.
						   12, -- Severity.
						   1 -- State.
						   )
			END
		ELSE
			BEGIN
				IF EXISTS (SELECT * FROM Empleados WHERE nombreUsuario = @nombreUsuario)			
					BEGIN
						RAISERROR ('Duplicidad en los datos. El usuario ya podria existir.', -- Message text.
									12, -- Severity.
									1 -- State.
									)
					END
				ELSE
					BEGIN
						INSERT INTO Empleados VALUES(@primerNombre,@segundoNombre, @primerApellido, @segundoApellido,@telefono,@dni,@correoElectronico,@nombreUsuario,ENCRYPTBYPASSPHRASE(@contraseña, @contraseña),@idRol)
					END
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

Create procedure [dbo].[modificar_empleado]
	@id int,
	@primerNombre nvarchar(150),
	@segundoNombre nvarchar(150),
	@primerApellido nvarchar(150),
	@segundoApellido nvarchar(150),
	@telefono char(8),
	@dni char(14),
	@correoElectronico nvarchar(120),
	@nombreUsuario nvarchar(30),
	@contraseña nvarchar(32),
	@idRol int

AS
	BEGIN TRY
			IF EXISTS (SELECT * FROM Empleados WHERE 
			primerNombre = @primerNombre and
			segundoNombre = @segundoNombre and
			primerApellido = @primerApellido and
			segundoApellido = @segundoApellido and
			telefono = @telefono and
			dni = @dni and
			correoElectronico = @correoElectronico)

			BEGIN
				RAISERROR ('Duplicidad en los datos. El empleado ya podria existir.', -- Message text.
						   12, -- Severity.
						   1 -- State.
						   )
			END

			ELSE
				BEGIN
					IF EXISTS (SELECT * FROM Empleados WHERE nombreUsuario = @nombreUsuario)			
						BEGIN
							RAISERROR ('Duplicidad en los datos. El usuario ya podria existir.', -- Message text.
										12, -- Severity.
										1 -- State.
										)
						END
					ELSE
						BEGIN
							Update Empleados set 
								primerNombre = @primerNombre,
								segundoNombre = @segundoNombre,
								primerApellido = @primerApellido,
								segundoApellido = @segundoApellido,
								telefono = @telefono,
								dni = @dni,
								correoElectronico = @correoElectronico,
								nombreUsuario = @nombreUsuario,
								contraseña = @contraseña,
								idRol = @idRol
							where idEmpleado = @id
						END
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

Create procedure [dbo].[mostrar_empleado]
	@id int

AS
	IF EXISTS (Select COUNT(*) from Empleados where idEmpleado = @id)
		BEGIN
			Select * from Empleados where idEmpleado = @id
		END
	ELSE
		BEGIN
			Select ('El empleado con id = '+ cast(@id as varchar)+' no existe.') as mensaje		
		END
Go

Create procedure [dbo].[eliminar_empleado]
	@id int

AS
	IF EXISTS (Select COUNT(*) from Empleados where idEmpleado = @id)
		BEGIN
			DELETE FROM Empleados WHERE idEmpleado = @id
		END
	ELSE
		BEGIN
			Select ('El empleado con id = '+ cast(@id as varchar)+' no existe.') as mensaje
		END
GO
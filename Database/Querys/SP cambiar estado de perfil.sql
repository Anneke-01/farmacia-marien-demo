CREATE procedure [dbo].[cambiar_estado_perfil]
@idEstado int, @idPersona int
As
	IF EXISTS(Select * from Clientes WHERE idCliente = @idPersona)
		BEGIN
			UPDATE Clientes SET 
				idEstado = @idEstado
			WHERE idCliente = @idPersona
		END
	ELSE
		BEGIN
			IF EXISTS(Select * from Empleados WHERE idEmpleado = @idPersona)
				BEGIN
					UPDATE Empleados SET 
						idEstado = @idEstado
					WHERE idEmpleado = @idPersona
				END
		ELSE
				BEGIN
					Select 'No existe ese registro' as mensaje
				END
		END
		
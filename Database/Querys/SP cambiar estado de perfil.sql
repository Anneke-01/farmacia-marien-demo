CREATE procedure [dbo].[cambiar_estado_perfil_cliente]
@idEstado int, @idCliente int
As
	IF EXISTS(Select * from Clientes WHERE idCliente = @idCliente)
		BEGIN
			UPDATE Clientes SET 
				idEstado = @idEstado
			WHERE idCliente = @idCliente
		END
	ELSE
		BEGIN
			Select 'No existe ese registro' as mensaje
		END
		
GO

CREATE procedure [dbo].[cambiar_estado_perfil_empleado]
@idEstado int, @idEmpleado int
As
	IF EXISTS(Select * from Empleados WHERE idEmpleado = @idEmpleado)
			BEGIN
				UPDATE Empleados SET 
					idEstado = @idEstado
				WHERE idEmpleado = @idEmpleado
			END
	ELSE
			BEGIN
				Select 'No existe ese registro' as mensaje
			END
GO
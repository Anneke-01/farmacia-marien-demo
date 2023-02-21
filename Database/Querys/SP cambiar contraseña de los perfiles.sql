CREATE procedure [dbo].[cambiar_contrase�a_perfil_empleado]
@contrase�a nvarchar(32), @idEmpleado int
As
	IF EXISTS(Select * from Empleados WHERE idEmpleado = @idEmpleado)
		BEGIN
			UPDATE Empleados SET 
				contrase�a = ENCRYPTBYPASSPHRASE(@contrase�a, @contrase�a)
			WHERE idEmpleado = @idEmpleado
		END
	ELSE
			BEGIN
				Select 'No existe ese registro' as mensaje
			END

GO

CREATE procedure [dbo].[cambiar_contrase�a_perfil_cliente]
@contrase�a nvarchar(32), @idCliente int
As
	IF EXISTS(Select * from Clientes WHERE idCliente = @idCliente)
		BEGIN
			UPDATE Clientes SET 
				contrase�a = ENCRYPTBYPASSPHRASE(@contrase�a, @contrase�a)
			WHERE idCliente = @idCliente
		END
	ELSE
		BEGIN
			Select 'No existe ese registro' as mensaje
		END
		

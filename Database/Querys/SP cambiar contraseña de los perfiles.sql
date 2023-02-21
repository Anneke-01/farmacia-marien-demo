CREATE procedure [dbo].[cambiar_contraseña_perfil_empleado]
@contraseña nvarchar(32), @idEmpleado int
As
	IF EXISTS(Select * from Empleados WHERE idEmpleado = @idEmpleado)
		BEGIN
			UPDATE Empleados SET 
				contraseña = ENCRYPTBYPASSPHRASE(@contraseña, @contraseña)
			WHERE idEmpleado = @idEmpleado
		END
	ELSE
			BEGIN
				Select 'No existe ese registro' as mensaje
			END

GO

CREATE procedure [dbo].[cambiar_contraseña_perfil_cliente]
@contraseña nvarchar(32), @idCliente int
As
	IF EXISTS(Select * from Clientes WHERE idCliente = @idCliente)
		BEGIN
			UPDATE Clientes SET 
				contraseña = ENCRYPTBYPASSPHRASE(@contraseña, @contraseña)
			WHERE idCliente = @idCliente
		END
	ELSE
		BEGIN
			Select 'No existe ese registro' as mensaje
		END
		

CREATE procedure [dbo].[cambiar_contraseņa_perfil_empleado]
@contraseņa nvarchar(32), @idEmpleado int
As
	IF EXISTS(Select * from Empleados WHERE idEmpleado = @idEmpleado)
		BEGIN
			UPDATE Empleados SET 
				contraseņa = ENCRYPTBYPASSPHRASE(@contraseņa, @contraseņa)
			WHERE idEmpleado = @idEmpleado
		END
	ELSE
			BEGIN
				Select 'No existe ese registro' as mensaje
			END

GO

CREATE procedure [dbo].[cambiar_contraseņa_perfil_cliente]
@contraseņa nvarchar(32), @idCliente int
As
	IF EXISTS(Select * from Clientes WHERE idCliente = @idCliente)
		BEGIN
			UPDATE Clientes SET 
				contraseņa = ENCRYPTBYPASSPHRASE(@contraseņa, @contraseņa)
			WHERE idCliente = @idCliente
		END
	ELSE
		BEGIN
			Select 'No existe ese registro' as mensaje
		END
		

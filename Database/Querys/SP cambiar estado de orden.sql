
CREATE procedure cambiar_estado_orden
@idEstado int, @idOrden int
As
	IF EXISTS(Select * from Ordenes Where idOrden = @idOrden)
		BEGIN
			UPDATE Ordenes SET 
				idEstado = @idEstado
			WHERE idOrden = @idOrden
		END
	ELSE
		BEGIN
			Select 'NULL' as mensaje
		END



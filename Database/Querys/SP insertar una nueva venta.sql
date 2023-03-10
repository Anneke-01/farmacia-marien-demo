CREATE PROCEDURE insertar_orden
@idCliente int,@idEstado int,@idTipoDeEntrega int,@idTipoDePago int,@idOperador int,@idRepartidor int,
@fechaPedido date,@fechaEnvio date,@fechaEntrega date,@idMunicipio int,@direccion nvarchar(max),@vivienda nvarchar(max),
@codigoPostal nvarchar(20),@numeroTarjeta nvarchar(16)

AS 
	BEGIN
		INSERT INTO Ordenes VALUES(@idCliente,@idEstado,@idTipoDeEntrega,@idTipoDePago,@idOperador,@idRepartidor,@fechaPedido,
									@fechaEnvio,@fechaEntrega,@idMunicipio,@direccion,@vivienda,@codigoPostal,@numeroTarjeta)
		
		DECLARE @idOrden int
		SELECT @idOrden = dbo.obtener_id_ultimo_registro('Ordenes')
		RETURN @idOrden
	END
GO


select * from ordenes
Select * from detOrdenes


CREATE PROCEDURE insertar_venta
@idCliente int,@idEstado int,@idTipoDeEntrega int,@idTipoDePago int,@idOperador int,@idRepartidor int,
@fechaPedido date,@fechaEnvio date,@fechaEntrega date,@idMunicipio int,@direccion nvarchar(max),@vivienda nvarchar(max),
@codigoPostal nvarchar(20),@numeroTarjeta nvarchar(16),@idProducto int,@precio float,@cantidad int,
@descuento float,@iva float,@subtotal float,@total float

AS 
	BEGIN
		INSERT INTO Ordenes VALUES(@idCliente,@idEstado,@idTipoDeEntrega,@idTipoDePago,@idOperador,@idRepartidor,@fechaPedido,
									@fechaEnvio,@fechaEntrega,@idMunicipio,@direccion,@vivienda,@codigoPostal,@numeroTarjeta)
		
		DECLARE @idOrden int
		Select @idOrden = dbo.obtener_id_ultimo_registro('Ordenes')

		INSERT INTO detOrdenes VALUES(@idOrden,@idProducto,@precio,@cantidad,@descuento,@iva,@subtotal,@total)
	END

GO

select * from ordenes
Select * from detOrdenes

DROP PROCEDURE insertar_venta

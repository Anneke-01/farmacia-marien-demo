CREATE PROCEDURE insertar_detalles_orden
@idOrden int,@idProducto int,@precio float,@cantidad int,
@descuento float,@iva float,@subtotal float,@total float

AS

	BEGIN 
		INSERT INTO detOrdenes VALUES(@idOrden,@idProducto,@precio,@cantidad,@descuento,@iva,@subtotal,@total)
	END
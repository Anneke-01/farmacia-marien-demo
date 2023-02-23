ALTER PROCEDURE [dbo].[totales_carrito_cliente]
@idCliente int

AS
	BEGIN
		select * from carrito where idCliente = @idCliente
			BEGIN
				SELECT
					sum(c.subtotal) as subtotal,
					sum(c.descuento) as descuento,
					sum(c.iva) as iva,
					sum(c.total) as iva
				FROM carrito c
				INNER JOIN Productos p
				on p.idProducto = c.idProducto
				INNER JOIN Marcas m
				on m.idMarca = p.idMarca
				INNER JOIN TiposProducto tp
				ON tp.idTipoProducto = p.idTipoProducto
				INNER JOIN Categorias cat
				ON tp.idCategoria = cat.idCategoria
				INNER JOIN EstadosFactura ef
				ON ef.idEstadoFactura = c.idEstado
				WHERE idCliente = @idCliente
				group by c.idCliente
			END
		
	END


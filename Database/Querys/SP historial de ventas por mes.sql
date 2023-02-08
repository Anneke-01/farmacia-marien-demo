CREATE procedure mostrar_historial_venta_diarias_empleado
@año int
AS
	SELECT 
		COUNT(p.idProducto) [Cantidad de ventas por mes],
		MONTH(o.fechaPedido) Mes
	
	FROM Ordenes o
		inner join detOrdenes do
		ON do.idOrden = o.idOrden
		inner join Productos p
		on p.idProducto = do.idProducto
	WHERE YEAR(o.fechaPedido) = @año
	GROUP BY MONTH(o.fechaPedido)
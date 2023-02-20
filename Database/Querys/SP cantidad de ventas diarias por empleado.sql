CREATE procedure cantidad_venta_diarias_empleado
@año int, @mes int
AS
	SELECT 
		o.idOperador as Empleado,
		COUNT(p.idProducto) [Cantidad de ventas por mes],
		DAY(o.fechaPedido) Dia
	
	FROM Ordenes o
		inner join detOrdenes do
		ON do.idOrden = o.idOrden
		inner join Productos p
		on p.idProducto = do.idProducto
	WHERE YEAR(o.fechaPedido) = @año and MONTH(o.fechaPedido) = @mes
	GROUP BY DAY(o.fechaPedido), o.idOperador

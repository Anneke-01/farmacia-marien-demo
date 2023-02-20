CREATE procedure reporte_historial_venta_diarias_empleado
@año int, @idEmpleado int, @mes int

AS

	SELECT 
		p.nombreProducto + ma.marca + p.descripcion as Producto,
		c.ciudad + m.municipio + o.direccion + o.vivienda + o.codigoPostal as [Direccion de entrega],
		te.tipoEntrega as [Tipo de entrega],
		tp.tipoPago as [Tipo de pago],
		o.numeroTarjeta as [Numero de tarjeta de pago],
		fechaPedido as [Fecha de pedido],
		fechaEnvio as [Fecha de envio],
		fechaEntrega as [Fecha de entrega],
		ef.Estado [Estado de la compra],
		do.precio as Precio,
		do.cantidad as Cantidad,
		do.descuento as Descuento,
		do.subtotal as Subtotal,
		do.total as [Total Compra]

	FROM Ordenes o
		inner join detOrdenes do
		ON do.idOrden = o.idOrden
		Inner join Municipios m
		on m.idMunicipio = o.idMunicipio
		inner join Ciudades c
		on c.idCiudad = m.idCiudad
		inner join Productos p
		on p.idProducto = do.idProducto
		inner join Marcas ma
		on ma.idMarca = p.idMarca
		inner join TipoDeEntrega te
		on te.idTipoDeEntrega = o.idTipoDeEntrega
		inner join TipoDePago tp
		on tp.idTipoDePago = o.idTipoDePago
		inner join EstadosFactura ef
		on ef.idEstadoFactura = o.idEstado
		inner join Empleados em
		on em.idEmpleado = idRepartidor
		inner join Empleados emp
		on emp.idEmpleado = idOperador
	WHERE YEAR(o.fechaPedido) = @año and MONTH(o.fechaPedido) = @mes and emp.idEmpleado = @idEmpleado

GO
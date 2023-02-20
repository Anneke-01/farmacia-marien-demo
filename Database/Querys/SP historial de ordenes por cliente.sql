
CREATE procedure reporte_historial_compra_cliente
	@idCliente int
AS	
	If exists(Select * from Ordenes where idCliente = @idCliente)
		BEGIN
			SELECT 
				p.nombreProducto + ma.marca + p.descripcion as Producto,
				c.ciudad + m.municipio + o.direccion + o.vivienda + o.codigoPostal as [Direccion de entrega],
				te.tipoEntrega as [Tipo de entrega],
				tp.tipoPago as [Tipo de pago],
				fechaPedido as [Fecha de pedido],
				ef.Estado [Estado de la compra],
				do.precio as Precio,
				do.cantidad as Cantidad,
				do.total as [Total Compra],
				em.primerNombre + ' ' + em.primerApellido as Repartidor,
				emp.primerNombre + ' ' + emp.primerApellido as Operador

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
				
			WHERE o.idCliente = @idCliente
		END
	ELSE
		BEGIN
			Select 'NULL' as Mensaje
		END
	
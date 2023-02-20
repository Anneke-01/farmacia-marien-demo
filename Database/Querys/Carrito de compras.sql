Use farmaciamariendb
Go

CREATE TABLE carrito(
idPedido int identity(1,1) primary key not null,
idCliente int  foreign key references Clientes(idCliente) not null,
idProducto int foreign key references Productos(idProducto) not null,
idEstado int foreign key references EstadosFactura(idEstadoFactura) not null,
fechaPedido date,
cantidad int,
descuento float not null,
subtotal float not null,
iva float not null,
total float not null
)

GO 

CREATE PROCEDURE carrito_de_compra_por_cliente
@idCliente int

AS

	SELECT
		c.idProducto [ID del producto],
		p.nombreProducto as Producto,
		'Marca: ' + m.marca + ' Tipo de producto: ' +  tp.tipoProducto + ' Categoria del producto: ' + cat.categoria  as [Detalle del producto],
		'Fecha de expedicion: '+ CONVERT(nvarchar(max),p.fechaExpedicion) + ' Fecha de Vencimiento: ' + CONVERT(nvarchar(max),p.fechaVencimiento) as [Fecha de consumo], 
		p.descripcion as [Descripcion del Producto],
		c.fechaPedido as [Fecha de pedido],
		p.precio Precio,
		c.cantidad Cantidad,
		c.descuento Descuento,
		c.subtotal Subtotal,
		c.iva as IVA,
		c.total Total,
		p.urlImg as [Imagen del producto],
		ef.estado [Estado de la compra]
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

GO

select * from carrito
execute carrito_de_compra_por_cliente 1
drop procedure carrito_de_compra_por_cliente
drop table carrito
--PROCEDIMIENTOS ALMACENADOS PARA LAS BUSQUEDAS

CREATE PROCEDURE buscar_producto_por_nombre
	@nombreProducto as nvarchar(100)

AS
	IF EXISTS(SELECT * FROM Productos WHERE nombreProducto = @nombreProducto)
		Select
			idProducto,
			Marca,
			categoria,
			tipoProducto,
			nombreProducto,
			fechaExpedicion,
			fechaVencimiento,
			prescripcion,
			descripcion,
			precio,
			cantidad,
			urlImg
		FROM Productos p
			inner join Marcas m
			ON p.idMarca = m.idMarca
			inner join TiposProducto tp
			ON tp.idTipoProducto = p.idTipoProducto
			inner join Categorias c
			ON c.idCategoria = tp.idCategoria
		WHERE nombreProducto like @nombreProducto+'%'
	ELSE
		SELECT 'EL producto ' + @nombreProducto + ' no existe' as mensaje

GO

CREATE PROCEDURE buscar_producto_por_marca
	@marca as nvarchar(100)

AS
	IF EXISTS(SELECT * FROM Productos p inner join Marcas m on m.idMarca = p.idMarca WHERE m.marca = @marca)
		SELECT

			idProducto,
			Marca,
			categoria,
			tipoProducto,
			nombreProducto,
			fechaExpedicion,
			fechaVencimiento,
			prescripcion,
			descripcion,
			precio,
			cantidad,
			urlImg
		FROM Productos p
			inner join Marcas m
			ON p.idMarca = m.idMarca
			inner join TiposProducto tp
			ON tp.idTipoProducto = p.idTipoProducto
			inner join Categorias c
			ON c.idCategoria = tp.idCategoria
		WHERE m.marca = @marca
	ELSE
		SELECT 'EL producto con marcas ' + @marca + ' no existe' as mensaje
GO

CREATE PROCEDURE buscar_producto_mas_barato
	@nombreProducto as nvarchar(100)

AS
	IF EXISTS(SELECT * FROM Productos WHERE nombreProducto = @nombreProducto)
		Select
			idProducto,
			Marca,
			categoria,
			tipoProducto,
			nombreProducto,
			fechaExpedicion,
			fechaVencimiento,
			prescripcion,
			descripcion,
			precio,
			cantidad,
			urlImg
		FROM Productos p
			inner join Marcas m
			ON p.idMarca = m.idMarca
			inner join TiposProducto tp
			ON tp.idTipoProducto = p.idTipoProducto
			inner join Categorias c
			ON c.idCategoria = tp.idCategoria
		WHERE nombreProducto like @nombreProducto+'%'
		Order by precio desc
	ELSE
		SELECT 'EL producto ' + @nombreProducto + ' no existe' as mensaje

GO

CREATE PROCEDURE buscar_producto_mas_caro
	@nombreProducto as nvarchar(100)

AS
	IF EXISTS(SELECT * FROM Productos WHERE nombreProducto = @nombreProducto)
		Select
			idProducto,
			Marca,
			categoria,
			tipoProducto,
			nombreProducto,
			fechaExpedicion,
			fechaVencimiento,
			prescripcion,
			descripcion,
			precio,
			cantidad,
			urlImg
		FROM Productos p
			inner join Marcas m
			ON p.idMarca = m.idMarca
			inner join TiposProducto tp
			ON tp.idTipoProducto = p.idTipoProducto
			inner join Categorias c
			ON c.idCategoria = tp.idCategoria
		WHERE nombreProducto like @nombreProducto+'%'
		Order by precio asc
	ELSE
		SELECT 'EL producto ' + @nombreProducto + ' no existe' as mensaje

GO

CREATE PROCEDURE buscar_producto_por_tipo_producto
	@tipoProducto as nvarchar(100)

AS
	IF EXISTS(SELECT * FROM Productos p inner join TiposProducto tp on tp.idTipoProducto = p.idTipoProducto WHERE tp.tipoProducto = @tipoProducto)
		Select
			idProducto,
			Marca,
			categoria,
			tipoProducto,
			nombreProducto,
			fechaExpedicion,
			fechaVencimiento,
			prescripcion,
			descripcion,
			precio,
			cantidad,
			urlImg
		FROM Productos p
			inner join Marcas m
			ON p.idMarca = m.idMarca
			inner join TiposProducto tp
			ON tp.idTipoProducto = p.idTipoProducto
			inner join Categorias c
			ON c.idCategoria = tp.idCategoria
		WHERE nombreProducto like @tipoProducto+'%'
	ELSE
		SELECT 'EL Tipo de producto ' + @tipoProducto + ' no existe' as mensaje

GO

CREATE PROCEDURE buscar_producto_por_palabra_clave
	@palabra as nvarchar(100)

AS
		SELECT
			idProducto,
			Marca,
			categoria,
			tipoProducto,
			nombreProducto,
			fechaExpedicion,
			fechaVencimiento,
			prescripcion,
			descripcion,
			precio,
			cantidad,
			urlImg
		FROM Productos p
			inner join Marcas m
			ON p.idMarca = m.idMarca
			inner join TiposProducto tp
			ON tp.idTipoProducto = p.idTipoProducto
			inner join Categorias c
			ON c.idCategoria = tp.idCategoria
		WHERE nombreProducto like @palabra +'%' or
			  marca like @palabra +'%' or 
			  tipoProducto like @palabra +'%' or
			  categoria like @palabra +'%' or
			  prescripcion like @palabra +'%' or
			  descripcion like @palabra +'%' 
GO

Create database Farmacia_Marien
Go
Use Farmacia_Marien
Go

Create table TipoDeEntrega(
idTipoDeEntrega int identity(1,1) primary key not null,
tipoEntrega nvarchar(50)
)

Create table TipoDePago(
idTipoDePago int identity(1,1) primary key not null,
tipoPago nvarchar(50)
)

create table Municipios(
idMunicipio int identity(1,1) primary key not null,
municipio nvarchar(50)
)

Create table Roles(
idRol int identity(1,1) primary key not null,
rol nvarchar(10) not null,
descripcion nvarchar(50)
)

Create table Marcas(
idMarca int identity(1,1) primary key not null,
marca nvarchar(10) not null
)

Create table Categorias(
idCategoria nvarchar(5) primary key not null,
categoria char(20) not null,
descripcion nvarchar(50)
)

Create table EstadosFactura(
idEstadoFactura int identity(1,1) primary key not null,
estado nvarchar(10) not null, --En espera, realizado, cancelado
descripcion nvarchar(50)
)

Create table TiposProducto(
idTipoProducto int identity(1,1) primary key not null,
tipo char(20) not null,
descripcion nvarchar(50)
)

Create table Clientes(
idCliente int identity(1,1) primary key not null,
primerNombre nvarchar(50) not null,
segundoNombre nvarchar(50) not null,
primerApellido nvarchar(50) not null,
segundoApellido nvarchar(50) not null,
telefono char(8) not null,
dni char(14) not null,
correoElectronico nvarchar(20) not null
)

Create table Empleados(
idEmpleado int identity(1,1) primary key not null,
primerNombre nvarchar(50) not null,
segundoNombre nvarchar(50) not null,
primerApellido nvarchar(50) not null,
segundoApellido nvarchar(50) not null,
telefono char(8) not null,
dni char(14) not null,
correoElectronico nvarchar(20) not null
)

Create table Proveedores(
idProveedor int identity(1,1) primary key not null,
nombre nvarchar(50) not null,
nombreContacto nvarchar(50) not null,
ruc char(10) not null,
telefono char(8) not null,
ciudad nvarchar(100) not null,
municipio nvarchar(100) not null,
direccion nvarchar(100) not null,
correoElectronico nvarchar(20) not null
)

Create table Productos(
idProducto int identity(1,1) primary key not null,
idMarca int foreign key references Marcas(idMarca) not null,
idCategoria nvarchar(5) foreign key references Categorias(idCategoria) not null,
idTipoProducto int foreign key references TiposProducto(idTipoProducto) not null,
nombreProducto nvarchar(50) not null,
fechaExpedicion date,
fechaVencimiento date,
precio float not null,
cantidad int not null,
urlImg image  not null
)

Create table UsuariosCliente(
idUsuarioCliente int identity(1,1) primary key not null,
idCliente int foreign key references Clientes(idCliente) not null,
nombreUsuario nvarchar(20) not null,
contraseña nvarchar(32) not null,
idRol int foreign key references Roles(idRol) not null
)

Create table UsuariosEmpleado(
idUsuarioEmpleado int foreign key references Empleados(idEmpleado) not null,
idJefe int foreign key references UsuariosEmpleado(idUsuarioEmpleado),
idRol int foreign key references Roles(idRol) not null,
nombreUsuario nvarchar(20) not null,
contraseña nvarchar(32) not null,
Primary key(idUsuarioEmpleado)
)

Create table Compras(
idCompra int identity(1,1) primary key not null,
idProveedor int foreign key references Proveedores(idProveedor) not null,
fechaEntrega date not null,
idEstado int foreign key references EstadosFactura(idEstadoFactura) not null
)

Create table detCompras(
idDetCompra int identity(1,1) primary key not null,
idCompra int foreign key references Compras(idCompra) not null,
idProducto int foreign key references Productos(idProducto) not null,
idRecibidor int foreign key references Empleados(idEmpleado) not null,
precio float not null,
cantidad int not null,
descuento float not null,
iva float not null,
subtotal float not null,
total float not null
)

Create table Ordenes(
idOrden int identity(1,1) primary key not null,
idUsuarioCliente int foreign key references UsuariosCliente(idUsuarioCliente) not null,
idEstado int foreign key references EstadosFactura(idEstadoFactura) not null,
idTipoDeEntrega int foreign key references TipoDeEntrega(idTipoDeEntrega) not null,
idTipoDePago int foreign key references TipoDePago(idTipoDePago) not null,
fechaPedido date,
fechaEnvio date,
fechaEntrega date,
idMunicipio int foreign key references Municipios(idMunicipio),
direccion nvarchar(50),
vivienda nvarchar(20),
codigoPostal nvarchar(10),
numeroTarjeta nvarchar(16)
)

Create table detOrdenes(
idDetOrden int identity(1,1) primary key not null,
idOrden int foreign key references Ordenes(idOrden) not null,
idProducto int foreign key references Productos(idProducto) not null,
precio float not null,
cantidad int not null,
descuento float not null,
iva float not null,
subtotal float not null,
total float not null
)

Create table TarjetasPago(
idTarjeta int identity(1,1) primary key not null,
idUsuarioCliente int foreign key references UsuariosCliente(idUsuarioCliente) not null,
numeroTarjeta nvarchar(16) not null,
titular nvarchar(20) not null,
fechaExpiracion date not null
)

Create table DireccionesCliente(
idDireccion int identity(1,1) primary key not null,
idUsuarioCliente int foreign key references UsuariosCliente(idUsuarioCliente) not null,
idMunicipio int foreign key references Municipios(idMunicipio) not null,
direccion nvarchar(50) not null,
vivienda nvarchar(20) not null,
codigoPostal nvarchar(10)
)

Create table DireccionesEmpleados(
idDireccionEmpleado int foreign key references Empleados(idEmpleado) not null,
idMunicipio int foreign key references Municipios(idMunicipio) not null,
direccion nvarchar(50) not null,
vivienda nvarchar(10) not null,
codigoPostal nvarchar(10)
Primary key(idDireccionEmpleado)
)

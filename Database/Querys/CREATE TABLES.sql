--Create database farmaciamariendb
--Go
Use farmaciamariendb
Go

Create table TipoDeEntrega(
idTipoDeEntrega int identity(1,1) primary key not null,
tipoEntrega nvarchar(150) not null,
descripcion nvarchar(250)
)

Create table TipoDePago(
idTipoDePago int identity(1,1) primary key not null,
tipoPago nvarchar(150) not null,
descripcion nvarchar(250)
)

create table Ciudades(
idCiudad int identity(1,1) primary key not null,
ciudad nvarchar(150)
)

create table Municipios(
idMunicipio int identity(1,1) primary key not null,
idCiudad int foreign key references Ciudades(idCiudad) not null,
municipio nvarchar(150)
)

Create table Roles(
idRol int identity(1,1) primary key not null,
rol nvarchar(150) not null,
descripcion nvarchar(300)
)

Create table Marcas(
idMarca int identity(1,1) primary key not null,
marca nvarchar(50) not null
)

Create table Categorias(
idCategoria nvarchar(5) primary key not null,
categoria nchar(50) not null
)

Create table EstadosFactura(
idEstadoFactura int identity(1,1) primary key not null,
estado nvarchar(150) not null, --En espera, realizado, cancelado
descripcion nvarchar(150)
)

Create table TiposProducto(
idTipoProducto int identity(1,1) primary key not null,
idCategoria nvarchar(5) foreign key references Categorias(idCategoria) not null,
tipoProducto nvarchar(150) not null
)

/*CREATE TABLE CargosOrganigrama(
idCargo int identity(1,1) primary key not null,
cargo nvarchar(100) not null
)*/

Create table Clientes(
idCliente int identity(1,1) primary key not null,
primerNombre nvarchar(150) not null,
segundoNombre nvarchar(150) not null,
primerApellido nvarchar(150) not null,
segundoApellido nvarchar(150) not null,
telefono char(8) not null,
--dni char(14) not null,
correoElectronico nvarchar(120) not null,
nombreUsuario nvarchar(30) not null,
contraseña nvarchar(32) not null,
)

Create table Empleados(
idEmpleado int identity(1,1) primary key not null,
--idJefe int foreign key references Empleados(idEmpleado),
--idCargo int foreign key references CargosOrganigrama(idCargo),
primerNombre nvarchar(150) not null,
segundoNombre nvarchar(150) not null,
primerApellido nvarchar(150) not null,
segundoApellido nvarchar(150) not null,
telefono char(8) not null,
dni char(14) not null,
correoElectronico nvarchar(120) not null,
nombreUsuario nvarchar(30) not null,
contraseña nvarchar(32) not null,
idRol int foreign key references Roles(idRol) not null,
)

Create table Proveedores(
idProveedor int identity(1,1) primary key not null,
nombre nvarchar(150) not null,
nombreContacto nvarchar(150) not null,
ruc char(30) not null,
telefono char(8) not null,
ciudad nvarchar(150) not null,
municipio nvarchar(150) not null,
direccion nvarchar(150) not null,
correoElectronico nvarchar(120) not null
)

Create table Productos(
idProducto int identity(1,1) primary key not null,
idMarca int foreign key references Marcas(idMarca) not null,
--idCategoria nvarchar(5) foreign key references Categorias(idCategoria) not null,
idTipoProducto int foreign key references TiposProducto(idTipoProducto) not null,
nombreProducto nvarchar(200) not null,
fechaExpedicion date,
fechaVencimiento date,
prescripcion nvarchar(200),
descripcion nvarchar(max),
precio float not null,
cantidad int not null,
urlImg nvarchar(max)  not null
)

--Create table UsuariosCliente(
--idUsuarioCliente int identity(1,1) primary key not null,
--idCliente int foreign key references Clientes(idCliente) not null,
--nombreUsuario nvarchar(30) not null,
--contraseña nvarchar(32) not null,
--idRol int foreign key references Roles(idRol) not null
--)

--Create table UsuariosEmpleado(
--idUsuarioEmpleado int foreign key references Empleados(idEmpleado) not null,
--idRol int foreign key references Roles(idRol) not null,
--nombreUsuario nvarchar(30) not null,
--contraseña nvarchar(32) not null,
--Primary key(idUsuarioEmpleado)
--)

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
idCliente int foreign key references Clientes(idCliente) not null,
idEstado int foreign key references EstadosFactura(idEstadoFactura) not null,
idTipoDeEntrega int foreign key references TipoDeEntrega(idTipoDeEntrega) not null,
idTipoDePago int foreign key references TipoDePago(idTipoDePago) not null,
idOperador int foreign key references Empleados(idEmpleado),
idRepartidor int foreign key references Empleados(idEmpleado),
fechaPedido date,
fechaEnvio date,
fechaEntrega date,
idMunicipio int foreign key references Municipios(idMunicipio),
direccion nvarchar(150),
vivienda nvarchar(30),
codigoPostal nvarchar(15),
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
idCliente int foreign key references Clientes(idCliente) not null,
numeroTarjeta nvarchar(16) not null,
titular nvarchar(150) not null,
fechaExpiracion date not null
)

Create table DireccionesCliente(
idDireccion int identity(1,1) primary key not null,
idCliente int foreign key references Clientes(idCliente) not null,
idMunicipio int foreign key references Municipios(idMunicipio) not null,
direccion nvarchar(150) not null,
vivienda nvarchar(150) not null,
codigoPostal nvarchar(10)
)

--Create table DireccionesEmpleados(
--idDireccionEmpleado int foreign key references Empleados(idEmpleado) not null,
--idMunicipio int foreign key references Municipios(idMunicipio) not null,
--direccion nvarchar(150) not null,
--vivienda nvarchar(150) not null,
--codigoPostal nvarchar(10)
--Primary key(idDireccionEmpleado)
--)

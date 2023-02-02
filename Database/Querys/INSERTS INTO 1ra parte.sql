Use Farmacia_Marien
Go
--ROLES---------------------------------
Insert into Roles values('super_user', 'Administrador del sistema. Los usuarios con este rol tienen todos los privilegios para todas las herramientas, y para todas las calificaciones y revisiones. Tambien puede crear sitios')
Insert into Roles values('stock_manager', 'Los usurios con este rol pueden crear nuevos productos , rellenar el inventario , dar de baja a productos crear páginas, fragmentos y plantillas, cargar y administrar activos, y enriquecer productos y categorías.')
Insert into Roles values('supervisor', 'Solo lectura. Los usuarios que tengan este rol pueden ver páginas, plantillas, activos, fragmentos, diseños y valores, pero no pueden realizar cambios.')
Insert into Roles values('atmrol', 'Puede ver los productos, cantidades, vender  inventario, etc.')
Insert into Roles values('delivery_manager', 'Ver orden disponible de entrega , cambiar estado de sin entregar a entregado.')


--TIPOS DE ENTREGAS-----------------------
Insert into TipoDeEntrega values('Delivery','Motomami')
Insert into TipoDeEntrega values('Pick Up','Solo llegas a retirar con tu factura a la farmacia')
Insert into TipoDeEntrega values('Entrega normal','Haces todo el proceso de compra en la farmacia')

--TIPOS DE PAGOS---------------------------
Insert into TipoDePago values('Efectivo','Pago en efectivo')
Insert into TipoDePago values('Tarjeta','Pago con tarjeta de credito o debito')
Insert into TipoDePago values('Transferencia','Pago con tranferencia bancaria')

--ESTADOS DE LA FACTURA-------------------
Insert into EstadosFactura values('Cancelado','Cancelacion de la compra/venta, es decir, no se hizo.')
Insert into EstadosFactura values('En proceso','La compra/venta esta en proceso de realizarce')
Insert into EstadosFactura values('Hecho','La compra/venta se realizo')

--TIPOS DE PRODUCTOS----------------------------
Insert into TiposProducto values('Cuidados 3ra edad','')
Insert into TiposProducto values('Infantil','')
Insert into TiposProducto values('Higiene corporal y capilar','')
Insert into TiposProducto values('Dietética y nutrición','')
Insert into TiposProducto values('Natural','')
Insert into TiposProducto values('Fitoterapia','')
Insert into TiposProducto values('Herboristeria','')
Insert into TiposProducto values('Homeopatia','')
Insert into TiposProducto values('Ortopedio','')
Insert into TiposProducto values('EFP','')
Insert into TiposProducto values('Vitaminas','')
Insert into TiposProducto values('Dermocosmética','')
Insert into TiposProducto values('Cuidado bucal','')
Insert into TiposProducto values('Hombres y preservativos','')


--CATEGORIAS-----------------------------------
Insert into Categorias values('A','Marca líder del segmento medico.')
Insert into Categorias values('B','Marca líder en el segmento natural, exclusividad y gran apoyo.')
Insert into Categorias values('C','Marca de altagama, con exclusividad y sin competencia.')
Insert into Categorias values('D','Complemento ideal y marca en expación.')
Insert into Categorias values('E','Marca nacional y que no puede faltar')

--CIUDADES----------------------------------------------------
Insert into ciudades values('Managua')
Insert into ciudades values('Masaya')
Insert into ciudades values('Granada')

--MUNICIPIOS-------------------------------------------------
Insert into municipios(municipio,idCiudad) values('San Francisco Libre',1)
Insert into municipios(municipio,idCiudad) values('Tipitapa',1)
Insert into municipios(municipio,idCiudad) values('Mateare',1)
Insert into municipios(municipio,idCiudad) values('Villa Carlos',1)
Insert into municipios(municipio,idCiudad) values('Ciudad Sandino',1)
Insert into municipios(municipio,idCiudad) values('Managua',1)
Insert into municipios(municipio,idCiudad) values('Ticuantepe',1)
Insert into municipios(municipio,idCiudad) values('El Crucero',1)
Insert into municipios(municipio,idCiudad) values('San Rafael del Sur',1)
Insert into municipios(municipio,idCiudad) values('Tisma',2)
Insert into municipios(municipio,idCiudad) values('Nindiri',2)
Insert into municipios(municipio,idCiudad) values('Masaya',2)
Insert into municipios(municipio,idCiudad) values('Catarina',2)
Insert into municipios(municipio,idCiudad) values('San Juan de Oriente',2)
Insert into municipios(municipio,idCiudad) values('Niquinohomo',2)
Insert into municipios(municipio,idCiudad) values('Nandasmo',2)
Insert into municipios(municipio,idCiudad) values('Masatepe',2)
Insert into municipios(municipio,idCiudad) values('La Concepción',2)
Insert into municipios(municipio,idCiudad) values('Granada',3)
Insert into municipios(municipio,idCiudad) values('Nanadaime',3)
Insert into municipios(municipio,idCiudad) values('Diria',3)
Insert into municipios(municipio,idCiudad) values('Diriomo',3)

--MARCAS----------------------------------------
Insert into Marcas values('MK (Mackenso)')
Insert into Marcas values('Bayer')
Insert into Marcas values('RAMOS')
Insert into Marcas values('3M MEXICO')
Insert into Marcas values('ANTRA')
Insert into Marcas values('AVENTIS')
Insert into Marcas values('Umbrella')
Insert into Marcas values('BLOSSOM PHARMACEUTICALS')
Insert into Marcas values('CEGUEL')
Insert into Marcas values('PFIZER')
Insert into Marcas values('PHARMAX')
Insert into Marcas values('PRINSTON')
Insert into Marcas values('INMUNEX')
Insert into Marcas values('IMTIX')
Insert into Marcas values('INFAI')
Insert into Marcas values('INGENUS PAHRMACEUTICALS')
Insert into Marcas values('PACIFIC PHARMA')
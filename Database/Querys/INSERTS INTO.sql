Use farmaciamariendb
GO

--ROLES---------------------------------
Insert into Roles values('admin', 'Administrador del sistema. Los usuarios con este rol tienen todos los privilegios para todas las herramientas, y para todas las calificaciones y revisiones. Tambien puede crear sitios')
Insert into Roles values('employee', 'Puede ver los productos, cantidades, vender  inventario, etc.')
Insert into Roles values('delivery', 'Es un empleado repartido de los productos')

--TIPOS DE ENTREGAS-----------------------
Insert into TipoDeEntrega values('Delivery','Entrega a domicilio o en una ubicacion en especifica')
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

--ESTADOS DE LOS PERFILES-------------------------
Insert into EstadosPerfil values('online','Es un perfil activo en la pagina')
Insert into EstadosPerfil values('offline','Es un perfil inactivo en la pagina o en espera de ser removido')
Insert into EstadosPerfil values('removed','Es un oerfil eliminado de la pagina')

--CATEGORIAS-----------------------------------
Insert into Categorias values('PF','Productos farmaceuticos')
Insert into Categorias values('DM','Dispositivos m�dicos')
Insert into Categorias values('PS','Productos sanitarios')

--TIPOS DE PRODUCTOS----------------------------
/*--cat_por_edad
Insert into TiposProducto values('Ni�os','')
Insert into TiposProducto values('Adolecentes','')
Insert into TiposProducto values('Adultos','')
Insert into TiposProducto values('Personas de la 3ra edad','')

--cat_tipoCliente
Insert into TiposProducto values('Hombres','')
Insert into TiposProducto values('Mujeres','')
Insert into TiposProducto values('Infantil','')
Insert into TiposProducto values('Embarazadas','')
Insert into TiposProducto values('General','')

--cat_beneficio
Insert into TiposProducto values('Diet�tica y nutrici�n','')
Insert into TiposProducto values('Dermocosm�tica','')
Insert into TiposProducto values('Higiene corporal','')
Insert into TiposProducto values('Higiene capilar','')
Insert into TiposProducto values('Cuidado bucal','')
Insert into TiposProducto values('Preservativos','')*/

--tipoProducto
Insert into TiposProducto values('PF','Medicamentos')
Insert into TiposProducto values('PF','Medicamentos herbarios')
Insert into TiposProducto values('PF','Productos dieteticos y nutricion')
Insert into TiposProducto values('PF','Productos biol�gicos')
Insert into TiposProducto values('PF','Productos gal�nicos')

Insert into TiposProducto values('DM','De bajo riesgo')
Insert into TiposProducto values('DM','De riesgo moderado')
Insert into TiposProducto values('DM','De alto riesgo')
Insert into TiposProducto values('DM','Cr�ticos en materia de riesgo')

Insert into TiposProducto values('PF','Higiene')
Insert into TiposProducto values('PS','Productos cosm�ticos')
Insert into TiposProducto values('PS','Art�culos sanitarios')
Insert into TiposProducto values('PS','Art�culos de limpieza dom�stica')

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
Insert into municipios(municipio,idCiudad) values('La Concepci�n',2)
Insert into municipios(municipio,idCiudad) values('Granada',3)
Insert into municipios(municipio,idCiudad) values('Nanadaime',3)
Insert into municipios(municipio,idCiudad) values('Diria',3)
Insert into municipios(municipio,idCiudad) values('Diriomo',3)

--MARCAS----------------------------------------
Insert into Marcas values('Cinfa')
Insert into Marcas values('Cristal-Mina')
Insert into Marcas values('Almiral')
Insert into Marcas values('Foret')
Insert into Marcas values('Meda')
Insert into Marcas values('Gsk')
Insert into Marcas values('Inovance')
Insert into Marcas values('Marti Derm')
Insert into Marcas values('Skin Ceuticals')
Insert into Marcas values('Avene')
Insert into Marcas values('Gema Herrerias')
Insert into Marcas values('Phyto')
Insert into Marcas values('Ducray')
Insert into Marcas values('Klorane')
Insert into Marcas values('Fluocaril')
Insert into Marcas values('Vichy')
Insert into Marcas values('Minerva Research Labs')
Insert into Marcas values('Fertybiotic')
Insert into Marcas values('Blemil')
Insert into Marcas values('Nestle')
Insert into Marcas values('Gestagyn')
Insert into Marcas values('Clear Blue')
Insert into Marcas values('Ovusitol')
Insert into Marcas values('Hyabak')
Insert into Marcas values('Colnatur')
Insert into Marcas values('Lactoflora')
Insert into Marcas values('Systane')

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

--PRODUCTOS--------------------------------------
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(1,1,'Respibien Nebulizador 15ml','12/04/2020','12/04/2025',216,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675391162/Screenshot_2023-02-02_202532_ctq0br.png','Indicado para la congestion Nasal.','Respibien 0,5 mg/ml Nebulizador Nasal�es un�medicamento que alivia la congesti�n nasal temporal y local. Est� indicado especialmente�para adultos, adolescentes y ni�os a partir de 6 a�os.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(2,1,'Cristalmina 10mg','06/11/2018','06/11/2023',180,41,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675391709/2_achoz1.png','Indicado para desinfectar y reparar la superficie de la piel.','Cristalmina 10 mg/ml Soluci�n T�pica Pulverizado es un�medicamento de acci�n reparadora que desinfecta la superficie de la piel, dej�ndola limpia e higienizada. Est� formulado especialmente en casos de quemaduras leves, peque�as heridas superficiales y rozaduras.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(3,1,'Blastoestimulina pomada 30g','06/08/2023','06/08/2028',333,14,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675391916/3_xyjkug.png','Indicado para cicatrizar.','Blastoestimulina Pomada�es una�pomada con acci�n cicatrizante. Es un medicamento indicado en el tratamiento de�quemaduras, heridas y escaras, llagas y rozaduras�que favorece la cicatrizaci�n y promueve su curaci�n.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(4,1,'Agua Oxigenada 30mg/m','04/04/2019','04/04/2024',76,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675392024/4_cazdko.png','Indicado para desinfectar.','El agua oxigenada, un producto qu�mico con apariencia de l�quido incoloro,�se utiliza en una amplia gama de productos de limpieza y de cuidado personal, como colorantes y blanqueadores, cremas dentales y enjuagues bucales, limpiadores de ba�o y quitamanchas.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(5,1,'Betadine 100 Mg solucion topica','07/05/2021','07/05/2026',255,12,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675392196/5_ucuktp.png','Antiseptico de uso general.','Betadine 100 mg/ml soluci�n cut�nea est� indicado como�antis�ptico de la piel de uso general, en peque�as heridas y cortes superficiales, quemaduras leves o rozaduras.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(6,3,'Alli 60 mg 120 capsulas','08/06/2020','08/06/2025',2664,10,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675392460/6_wtbgxj.png','Indicado para bajar de peso.','Alli es una versi�n de venta libre de 60 miligramos de orlistat (Xenical), un medicamento recetado de 120 miligramos. Tanto Alli como Xenical�est�n destinados a ser utilizados como parte de un plan para bajar de peso que incluye una dieta baja en calor�as y grasas, y actividad f�sica regular.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(7,11,'Inovance Acnavance piel grasa 60 caps','01/28/2020','01/28/2025',504,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675392719/7_rutqws.png','Suplemento nutricional para musculos , cartilagos y huesos.','Inovance Hyalurovance�es un�suplemento nutricional�especialmente dise�ado para mantener en�buen estado de los m�sculos, cart�lagos y huesos.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(8,11,'Black diamond skin 30 ampollas','02/14/2019','02/14/2024',1584,13,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675392920/8_br3toh.png','Indicado para combatir el cronoenvejecimiento.','MartiDerm Black Diamond Skin Complex�est�n formuladas espec�ficamente para�combatir el cronoenvejecimiento y la piel apagada.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(9,11,'Skinceuticals ferulic 30  ml','04/14/2020','04/14/2025',3600,7,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675393028/9_v7zo8n.png','Indicado para pieles secas , repara el rostro.','El s�rum CE Ferulic de Skinceuticals�previene y repara los efectos nocivos�derivados del estr�s oxidativo y los radicales libres en el rostro. Est� indicado especialmente�para pieles normales y secas.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(10,11,'AVENE CLEANANCE COMEDOMED CONCENTRADO ANTI IMPERFECCIONES','05/21/2021','05/21/2026',421,36,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675393113/10_gt67li.png','Indicado para limpiar las pieles sensibles.','Limpiador facial en gel espec�fico para la limpieza de la pieles sensibles y grasas o con tendencia acneica.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(11,11,'INOVANCE DRENOVANCE FRASCO DE 300 ML','12/31/2021','12/31/2026',530,45,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675393281/11_a2f0qv.png','Indicado contra la celulitis.','Inovance Drenovance 300 ml�se trata de un�complemento alimenticio�que�favorece la eliminaci�n de l�quidos�y ayuda al�tratamiento contra la celulitis. Gracias a su complejo vegetal a base de 10 plantas contribuye a�facilitar la expulsi�n de las toxinas.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(12,11,'GH FUNCION GLOBAL CONTORNO OJOS Y LABIOS 15 ML','02/02/2021','02/02/2026',965,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675396589/12_tcxdbl.png','Indicado para mejorar el contorno de ojos.','Gh Funci�n Global Contorno Ojos y Labios�es una�crema antiedad�que�combate las bolsas, ojeras, arrugas y l�neas de expresi�n�del contorno�de ojos y labios.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(13,10,'PHYTO RE30 TRATAMIENTO ANTICANAS PACK 2+1','01/31/2019','01/31/2024',2448,14,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675396762/13_pzmpxz.png','Tratamiento para canas.','Phyto RE30 S�rum Tratamiento Anticanas Pack 2 + 1�es un�tratamiento que�regimentar las canas desde la ra�z sin pigmentos colorantes.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(14,10,'DUCRAY EQUILIBRANTE CHAMPU DUPLO 2 X 400 ML','08/21/2021','08/21/2026',504,66,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675396869/14_rj1sgj.png','Dedicado para eliminar la suciedad del cabello.','Este champ� equilibrante de Ducray es un tratamiento limpiador que�elimina la suciedad y las impurezas del cuero cabelludo�sin da�arlo.�Recupera la luminosidad y vigorosidad del pelo. Est� formulado�para todo tipo de cabellos.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(15,10,'KLORANE CHAMPU QUININA 400 ML','09/17/2022','09/17/2027',435,18,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675396955/15_zwax9r.png','Tratamiento para el pelo , fortalece y repara.','Klorane Quinina es un champ� antica�da que�fortalece la fibra capilar�y estimula su crecimiento. Adem�s, se puede�usar como complemento de los tratamientos antica�da. Est� formulado�para cabellos d�biles y quebradizos.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(16,10,'FLUOCARIL BI-FLUORE 250 DUPLO','04/18/2018','04/18/2023',365,34,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675397042/16_qiwhz9.png','Pasta dental.','Fluocaril Bi-Fluor� 250 es una pasta dental�indicada especialmente para mantener una�adecuada higiene y salud bucodental.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(17,11,'VICHY DESODORANTE TRATAMIENTO ANTI-TRANSPIRANTE 48H TRANSPIRACION INTENSA','05/15/2019','05/15/2024',500,36,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675397759/17_hnqili.png','Deshodorante para evitar malos olores.','Este desodorante antitranspirante de Vichy contribuye a�prevenir y eliminar los malos olores�debido a la sudoraci�n intensa. Ofrece un�efecto duradero de hasta 48 horas�consecutivas. Est� formulado�para todo tipo de pieles.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(18,11,'GOLD COLLAGEN HAIRLIFT 10 FRASCOS 50 ML','07/12/2021','07/12/2026',1000,28,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675397860/18_u3rhp6.png','Suplemento bebible para mejorar la salud capilar.','Gold Collagen Hairlift�se trata de un�suplemento�bebible�dise�ado especialmente�para�mejorar la salud capilar.�Estimula�el crecimiento del cabello�y favorece�la s�ntesis de col�geno. Adem�s,�nutre en profundidad la fibra capilar�debido�a los amino�cidos de queratina.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(19,1,'FERTYBIOTIC EMBARAZO 30 CAPSULAS','08/04/2021','08/04/2026',598,17,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675397956/19_uuvsak.png','Suplementos para la etapa de embarazo.','Primer complemento que proporciona los requerimientos adicionales de nutrientes, junto a un selecci�n de probi�ticos durante la preconcepci�n, el embarazo y la lactancia.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(20,3,'BLEMIL PLUS 1 FORTE 1200G','06/06/2021','06/06/2026',1254,7,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398028/20_qvv4rw.png','Leche en polvo para lactantes.','Blemil Plus 1 Forte es una leche en polvo para lactantes de entre 0 y 6 meses, apta para su consumo desde el primer d�a de vida del beb�. Enrriquece el desarrollo cerebral y beneficia los procesos de aprendizaje y memoria, as� como el crecimiento.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(21,3,'NESTL� NAN 3 DUPLO 2 X 800 G','07/07/2022','07/07/2027',3654,10,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398098/21_jnjt3z.png','Leche en polvo para lactantes.','Esta leche Nan Optipro de Nestl� es un preparado l�cteo que ayuda a�satisfacer las necesidades alimenticias del beb�gracias a su aporte de vitaminas y minerales. Est� indicada�para ni�os a partir de 1 a�o.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(22,3,'GESTAGYN EMBARAZO 30 CAPSULAS','03/12/2019','03/12/2024',2000,34,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398165/22_dmy5hr.png','Complemento alimenticio para embarazadas.','Complemento alimenticio con DHA de microalgas, �cido f�lico, yodo, hierro, vitamina D y otras vitaminas y minerales. Juntamente con la dieta,�ayuda a conseguir un buen estado nutricional en la mujer, esencial para el correcto desarrollo del feto.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(23,6,'CLEARBLUE DIGITAL TEST EMBARAZO 1 UDS.','04/23/2020','04/23/2025',1639,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398245/23_xqvrr9.png','Test de embarazo.','Este test digital de embarazo de Clearblue permite�determinar si la mujer est� o no embarazada y de cu�ntas semanas. Est� formulado�para�mujeres que quieren�confirmar o desmentir un embarazo.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(24,3,'OVUSITOL D 14 SOBRES','12/31/2019','12/31/2024',648,12,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398323/24_gtuu3w.png','Indicado para mejorar la fertilidad femenina.','OVUSITOL D 14 SOBRES�es un complemento alimenticio indicado para mejorar la�fertilidad femenina y mejorar los s�ntomas del s�ndrome ovario poliqu�stico.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(25,4,'FERTYBIOTIC MUJER PLUS 15 STICKS','12/04/2021','12/04/2026',864,35,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398520/25_ncr38e.png','Indicado para mejorar la fertilidad femenina.','Los sticks Mujer Plus de Fertybiotic son un�complemento alimenticio que contribuye a mejorar la fertilidad de la mujer con S�ndrome de Ovario Poliqu�stico (SOP).')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(26,4,'HYABAK SOLUCION 10 MLHYABAK SOLUCION HIDRATANTE','11/25/2021','11/25/2026',365,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398595/26_jmlhrr.png','Indicado para lubricar el ojo.','La soluci�n hidratante ocular Hyabak contribuye a�lubricar el ojo en profundidad y alivia las sensaciones de picor y rozadura. Est� indicado especialmente�para personas con el s�ndrome del ojo seco o despu�s de intervenciones quir�rgicas.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(27,1,'COLNATUR COMPLEX NEUTRO 330 G','12/24/2023','12/24/2028',698,12,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398676/27_pdmtbd.png','Complemento alimenticio.','Colnatur Complex Neutro�es un�complemento�alimenticio�a base de�col�geno, vitamina C, magnesio y �cido Hialur�nico�dise�ado para el�cuidado de articulaciones, huesos y m�sculos. Ideal�para personas con molestias articulares, que practican deporte con frecuencia o que quieren cuidar su bienestar �seo.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(28,1,'LACTOFLORA PROTECTOR INTESTINAL ADULTOS 10 VIALES','12/12/2020','12/12/2025',347,25,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398757/28_zajhm9.png','Complemento alimenticio.','Lactoflora Protector Intestinal Adultos�es un�complemento alimenticio�a base de�probi�ticos, prebi�ticos, Vitaminas del grupo B y Aloe Vera�indicado especialmente para�mejorar la salud gastrointestinal y el sistema inmunitario.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(29,1,'INOVANCE LIPIVANCE 60 COMP','08/19/2021','08/19/2026',758,95,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398840/29_kkarup.png','Complemento alimenticio.','Lipivance�es un complemento alimenticio indicado en la�hipercolesterolemia (colesterol alto)�ligera a moderada,�intolerancia a las estatinas, prevenci�n cardiovascular, diabetes y/o s�ndrome metab�lico.')
Insert into Productos(idMarca,idTipoProducto,nombreProducto,fechaExpedicion,fechaVencimiento,precio,cantidad,urlImg,prescripcion,descripcion) values(30,13,'SYSTANE HIDRATACION GOTAS OFTALMICAS 10 ML','12/04/2020','12/04/2025',965,9,'https://res.cloudinary.com/dvpkpbpap/image/upload/v1675398926/30_j8tutl.png','Indicado para lubricar el ojo.','Systane Hidrataci�n Gotas Oft�lmicas 10 ml�contribuyen a�limpiar y lubricar la superficie ocular. Ayudan a�estabilizar la capa de la pel�cula lagrimal.')

----CARGOS ORGANIGRAMA---------------------------------------
/*Insert into CargosOrganigrama values('Gerente General')
Insert into CargosOrganigrama values('Contador')
Insert into CargosOrganigrama values('Gerente de RRHH')
Insert into CargosOrganigrama values('Gerente administrativo')
Insert into CargosOrganigrama values('Gerente de ventas')
Insert into CargosOrganigrama values('Gerente farmaceutico')
Insert into CargosOrganigrama values('Jefe de limpieza')
Insert into CargosOrganigrama values('Logistica y distribucion')
Insert into CargosOrganigrama values('Ejecutivo de ventas')
Insert into CargosOrganigrama values('Doctor')
Insert into CargosOrganigrama values('Cajero')
Insert into CargosOrganigrama values('Asistente de Servicio')
Insert into CargosOrganigrama values('Asistente de Laboratorio')*/

----EMPLEADOS-----------------------------------------
Insert into Empleados values('Elon','Reeve','Musk','Smith','54333302','0010604857005H','elonMuskGOD@gmail.com','farmaciamarienadmin','farmaciamarien2023',1,1)
/*Insert into Empleados values(1,'Ray','Kaden','Gallant','Lopez','91473204','2021704847010T','raygallant@gmail.com',2)
Insert into Empleados values(1,'Jan','Tony','Siegel','Hester','27900259','202210396','jansiegel@gmail.com',2)
Insert into Empleados values(1,'Alexander','Marquez','Irvine','Doyle','58995084','2031501997015M','alexmarquezIrvine@gmail.com',4)
Insert into Empleados values(1,'Maxwell','Bridger','Milton','Walter','67069373','2042102937020T','maxbridmilton@gmail.com',5)
Insert into Empleados values(1,'Jocelynn','Bernadette','Horn','Stephens','49627417','0012704965505E','bernadettehorn@gmail.com',6)
Insert into Empleados values(3,'Isabel','Ivana','Selby','Kramer','45270398','001804055510C','isabelselbykramer@gmail.com',7)
Insert into Empleados values(4,'Kaelyn','Kerri','Fish','Morse','54036362','0010401935515F','kaelynfish@gamil.com',8)
Insert into Empleados values(5,'Kyra','Eryn','Costello','Simpson','86162335','0011411905520R','kyracostello@gmail.com',9)
Insert into Empleados values(6,'Savanah','Jillian','Cardona','Chase','98754212','0011805985522R','savanahCardona@gmail.com',10)
Insert into Empleados values(9,'Elsie','Carina','William','Cardenas','26569863','0011007055525T','elsiewilliam@gmail.com',11)
Insert into Empleados values(9,'Massiel','Ileana','Ramirez','Gutierrez','95687458','001202815530T','massielramirez@gmail.com',11)
Insert into Empleados values(9,'Jose','Manuel','Hernandez','Guerrero','85963656','0013005805530T','joseguerrero@gmail.com',11)
Insert into Empleados values(10,'Carlos','Eduardo','De Castro','Lopez','51254898','0011011835532T','eduardolopez@gmail.com',12)
Insert into Empleados values(10,'Orianna','Alejandra','Manama','Caracas','78858856','001120595532V','eduardolopez@gmail.com',12)
Insert into Empleados values(10,'Kory','Luc','Milligan','Garner','85632587','0012805031001H','lucmilligan@gmail.com',13)*/

----PROVEEDORES-----------------------------------------
Insert into Proveedores values('Ferson S.A','Luis Perez Hernandez','00-0002535','22359864','Managua','Managua','De la parroquia, 3 1/2 cuadras al sur', 'FersonNicaragua@Gmail.com')
Insert into Proveedores values('Generic Pharma S.A','Fabian Picado Rodriguez' ,'12-0002458','22248569','Managua','San Francisco Libre','De donde fue lacmiel 2 cuadras arriba 1 al sur' ,'GenericNicaragua@Gmail.com')
Insert into Proveedores values('Farmacia Familiar','Pablo Gutierrez Almendarez','23-0002569','22365478','Managua','Tipitapa','Del banco lafise 3 cuadras al sur' ,'FarmaciaNicaragua@Gmail.com')
Insert into Proveedores values('Casa Teran' ,'Jose Lopez Medina' ,'21-0002549','22547156','Masaya','Masatepe','De la principal, 3 cuadras al este, 1 al sur','CasaNicaragua@Gmail.com')
Insert into Proveedores values('Clinica Nidome','Jairo de Jesus Rodriguez','00-0001236','23256987','Masaya','Masatepe','Del mercado de artesanias, 4c al sur, 2 al este, 1 al oeste, frente a la ferreteria Hermanos Lozano' ,'ClinicaNicaragua@Gmail.com')
Insert into Proveedores values('Solka S.A','Tatiana Mercedes Aguilar' ,'05-0008976','24896578','Masaya','Nindiri','Del monumento, 6 cuadras al oeste','SolkaNicaragua@Gmail.com')
Insert into Proveedores values('ProQuinfa SA','Sara Baltodano Lopez','04-2563645','22657495','Masaya','Masaya','De la iglesia de masaya, 4 cuadras al sur','ProQuinfaNicaragua@Gmail.com')
Insert into Proveedores values('Drogueria Rocha' ,'Pedro Arauz Palacios' ,'00-0014566','22368547','Granada','Granada','De la iglesia de granada, 5 cuadras al norte, 1 al sur','DrogueriaNicaragua@Gmail.com')
Insert into Proveedores values('BAYERN' ,'Julieta Ponce Leon' ,'00-5698745','21369578','Granada','Diria' ,'del almacen los 3 hermanos, 2 cuadras al este, a  mano derecha' ,'BAYERNNicaragua@Gmail.com')
Insert into Proveedores values('RAMOS' ,'Ana Maria Pe�a','00-1454636','24526314','Granada','Nandaime' ,'Del mercado de nandaime, 5 cuadras al sur, esquinero','RAMOSNicaragua@Gmail.com')
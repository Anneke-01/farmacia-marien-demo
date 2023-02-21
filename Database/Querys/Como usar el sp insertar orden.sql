--El sp de insertar orden te devulve el id de la orden que acabas de isnertar ademas de hacer la respectiva insercion
--Acontinuacion se muestra como obtener el valor que devuelve el sp
Declare @idOrden int
Execute @idOrden = dbo.insertar_orden 1,1,1,1,1,1,'1/1/2023','1/1/2023','1/1/2023',1,1,1,1,1
Select @idOrden
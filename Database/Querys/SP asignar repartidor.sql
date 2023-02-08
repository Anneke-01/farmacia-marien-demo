Create procedure registros_repartidores

AS
	SELECT nombreUsuario FROM Empleados e inner join Roles r ON r.idRol = e.idRol WHERE rol = 'delivery'
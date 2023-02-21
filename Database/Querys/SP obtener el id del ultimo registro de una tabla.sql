CREATE FUNCTION obtener_id_ultimo_registro
(@tabla nvarchar(50))
RETURNS INT

	BEGIN
		Declare @idOrden int OUTPUT
		set @idOrden = 0
		set @idOrden = IDENT_CURRENT(@tabla)
		RETURN @idOrden
	END
GO

--CREATE PROCEDURE obtener_cantidad_registros_tabla
--@tabla NVARCHAR(128)
--AS
--	BEGIN 
--	  SET NOCOUNT ON;
--	  DECLARE @Sql NVARCHAR(MAX);
--	  SET @Sql = 'SELECT COUNT(*) FROM ' + QUOTENAME(@tabla)     
--	  EXEC sp_executesql @Sql
--	  RETURN
--	END
--GO

--EXECUTE obtener_cantidad_registros_tabla 'ordenes'

--FUNCTION obtener el id del ultimo registro 
DROP FUNCTION dbo.obtener_id_ultimo_registro

--FUNCTION cantidad de registros de una tabla
--DROP PROCEDURE obtener_cantidad_registros_tabla
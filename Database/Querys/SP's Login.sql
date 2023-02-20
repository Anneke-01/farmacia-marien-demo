USE [farmaciamariendb]
GO

/****** Object:  StoredProcedure [dbo].[Validar_acceso]    Script Date: 05/02/2023 17:57:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[validar_acceso]
	@nombreUsuario nvarchar(30), @contrase�a nvarchar(32)
AS

	IF EXISTS (SELECT nombreUsuario FROM Clientes WHERE nombreUsuario = @nombreUsuario AND 
				CAST(DECRYPTBYPASSPHRASE(@contrase�a, contrase�a) as nvarchar(32)) = @contrase�a)
		BEGIN
			DECLARE @IDUsuarioCliente INT,
			@Resultado nvarchar(30)
			SET @IDUsuarioCliente = (SELECT TOP 1 idCliente FROM Clientes WHERE nombreUsuario = @nombreUsuario)
			SET @Resultado = 'Acceso exitoso'
			SELECT @Resultado
		END
	ELSE 
	BEGIN
		IF EXISTS (SELECT nombreUsuario FROM Empleados WHERE nombreUsuario = @nombreUsuario AND
					CAST(DECRYPTBYPASSPHRASE(@contrase�a, contrase�a) as nvarchar(32)) = @contrase�a)
			BEGIN
				DECLARE @IDUsuarioEmpleado INT
				SET @IDUsuarioEmpleado = (
				SELECT TOP 1 idEmpleado FROM Empleados WHERE nombreUsuario = @nombreUsuario)
				SELECT 'Acceso exitoso' AS Resultado,
				(SELECT TOP 1 r.rol FROM Empleados e
				INNER JOIN Roles r on r.idRol = e.idRol WHERE e.nombreUsuario = @nombreUsuario) AS ROL
			END
		ELSE
			BEGIN
				SELECT 'Acceso denegado' AS Resultado
			END
	END
GO



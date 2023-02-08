--DROP PROCEDIMIENTOS ALMACENADOS

--CRUD proveedores
DROP PROCEDURE dbo.eliminar_proveedor	
DROP PROCEDURE dbo.insertar_proveedor 
DROP PROCEDURE dbo.modificar_proveedor
DROP PROCEDURE dbo.mostrar_proveedor

--CRUD productos
DROP PROCEDURE dbo.eliminar_producto 
DROP PROCEDURE dbo.insertar_producto 
DROP PROCEDURE dbo.modificar_producto
DROP PROCEDURE dbo.mostrar_producto
--drop procedure dbo.mostrar_registros_producto
--drop procedure dbo.restaurar_producto


--CRUD empleados
DROP PROCEDURE dbo.insertar_empleado	

--CRUD clientes
DROP PROCEDURE dbo.insertar_clientes	

--SP LOGIN
DROP PROCEDURE dbo.validar_acceso

--BUSQUEDAS
DROP PROCEDURE buscar_producto_por_nombre
DROP PROCEDURE buscar_producto_por_marca
DROP PROCEDURE buscar_producto_mas_barato
DROP PROCEDURE buscar_producto_mas_caro
DROP PROCEDURE buscar_producto_por_tipo_producto
DROP PROCEDURE buscar_producto_por_palabra_clave

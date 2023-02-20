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
DROP PROCEDURE dbo.modificar_empleado	
DROP PROCEDURE dbo.eliminar_empleado	
DROP PROCEDURE dbo.mostrar_empleado

--CRUD clientes
DROP PROCEDURE dbo.insertar_cliente	
DROP PROCEDURE dbo.modificar_cliente	
DROP PROCEDURE dbo.eliminar_cliente	
DROP PROCEDURE dbo.mostrar_cliente	

--SP LOGIN
DROP PROCEDURE dbo.validar_acceso

--BUSQUEDAS
DROP PROCEDURE buscar_producto_por_nombre
DROP PROCEDURE buscar_producto_por_marca
DROP PROCEDURE buscar_producto_mas_barato
DROP PROCEDURE buscar_producto_mas_caro
DROP PROCEDURE buscar_producto_por_tipo_producto
DROP PROCEDURE buscar_producto_por_palabra_clave

--SP historial de ventas por mes
DROP PROCEDURE dbo.reporte_historial_ventas_mes

--SP historial de compras por cliente
DROP PROCEDURE dbo.reporte_historial_compra_cliente

--SP historial de ventas diarias por empleado
DROP PROCEDURE dbo.reporte_historial_venta_diarias_empleado

--SP mostrar registro de repartidores
DROP PROCEDURE dbo.registros_repartidores

--SP cambiar estado de orden
DROP PROCEDURE dbo.cambiar_estado_orden

--SP cantidad de ventas diarias por empleado
DROP PROCEDURE dbo.cantidad_ventas_por_mes
--SP cantidad de ventas por mes
DROP PROCEDURE dbo.cantidad_venta_diarias_empleado



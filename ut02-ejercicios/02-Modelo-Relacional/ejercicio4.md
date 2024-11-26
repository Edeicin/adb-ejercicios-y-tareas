Ejercicio 4 - Modelo Relacional

Clientes:
CodigoCliente (PK)
Nombre
Apellidos
Dirección
Telefono

Productos:
CodigoProducto (PK)
Descripción
Precio
Existencias

Proveedores:
CodigoProveedor (PK)
Nombre
Apellidos
Dirección
Provincia
Telefono

Compras:
IDCompra (PK)
CodigoCliente (FK)
CodigoProducto (FK)
Fecha
Cantidad

Suministros:
CodigoProveedor (PK, FK)
CodigoProducto (PK, FK)
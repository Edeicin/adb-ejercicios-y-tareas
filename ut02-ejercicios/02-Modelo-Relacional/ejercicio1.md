Ejercicio 1 - Modelo Relacional

Clientes:
DNI (PK)
Nombre
Apellidos
FechaNacimiento
TipoVia
NombreVia
Numero
CodigoPostal

Productos:
CodigoProducto (PK)
Nombre
PrecioUnitario

Proveedores:
NIF (PK)
Nombre
Dirección

Compras:
IDCompra (PK)
DNICliente (FK)
CodigoProducto (FK)
Cantidad

Suministros:
CodigoProducto (PK, FK)
NIFProveedor (PK, FK)
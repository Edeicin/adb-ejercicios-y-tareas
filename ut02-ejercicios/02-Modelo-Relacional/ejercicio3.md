Ejercicio 3 - Modelo Relacional

Clientes:
DNICliente (PK)
Nombre
Dirección

Cuentas:
NumeroCuenta (PK)
Saldo

ClientesCuentas:
DNICliente (PK, FK)
NumeroCuenta (PK, FK)

Sucursales:
CodigoSucursal (PK)
Dirección

CuentasSucursales:
NumeroCuenta (PK, FK)
CodigoSucursal (FK)

Transacciones:
NumeroTransaccion (PK)
NumeroCuenta (FK)
Fecha
Cantidad
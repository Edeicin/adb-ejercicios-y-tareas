Ejercicio 2 - Modelo Relacional

Profesores:
DNI (PK)
Nombre
Dirección
Teléfono

Módulos:
CodigoModulo (PK)
NombreModulo
DNIProfesor (FK)

Alumnos:
NumeroExpediente (PK)
Nombre
Apellidos
FechaNacimiento
CodigoGrupo (FK)

Grupos:
CodigoGrupo (PK)
Delegado (FK, NumeroExpediente)

Matriculas:
NumeroExpediente (PK, FK)
CodigoModulo (PK, FK)
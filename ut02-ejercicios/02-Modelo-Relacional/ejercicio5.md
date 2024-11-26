Ejercicio 5 - Modelo Relacional

Pacientes:
CodigoPaciente (PK)
Nombre
Apellidos
Dirección
Población
Provincia
CodigoPostal
Telefono
FechaNacimiento

Medicos:
CodigoMedico (PK)
Nombre
Apellidos
Telefono
Especialidad

Ingresos:
CodigoIngreso (PK)
CodigoPaciente (FK)
CodigoMedico (FK)
NumeroHabitación
NumeroCama
FechaIngreso
1. Filtrar las collations del conjunto utf8mb4 que sean sensibles a acentos (as):
SHOW COLLATION WHERE Charset = 'utf8mb4' AND Collation LIKE '%_as_%';

2. Filtrar las collations del conjunto utf8mb4 que sean sensibles a mayúsculas (cs):
SHOW COLLATION WHERE Charset = 'utf8mb4' AND Collation LIKE '%_cs_%';
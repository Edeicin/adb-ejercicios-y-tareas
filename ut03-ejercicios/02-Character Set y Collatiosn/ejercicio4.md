1. Comprobar si ó es igual a o utilizando el collation utf8mb4_0900_ai_ci:
SELECT 'ó' = 'o' COLLATE utf8mb4_0900_ai_ci;

2. Comprobar si ó es diferente de o utilizando el collation utf8mb4_0900_as_ci:
SELECT 'ó' <> 'o' COLLATE utf8mb4_0900_as_ci;
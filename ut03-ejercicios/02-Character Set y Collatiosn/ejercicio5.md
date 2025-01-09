Comparar si la ñ es igual a n utilizando los collations utf8mb4_spanish_ci y utf8mb4_spanish2_ci:
-- Comparación con utf8mb4_spanish_ci
SELECT 'ñ' = 'n' COLLATE utf8mb4_spanish_ci;

-- Comparación con utf8mb4_spanish2_ci
SELECT 'ñ' = 'n' COLLATE utf8mb4_spanish2_ci;
-- Лабораторная работа № 1
-- Проверка результатов ELT в Lakehouse
-- Каталог: lakekeeper

-- 1. Проверка созданных схем
SHOW SCHEMAS IN lakekeeper;

-- 2. Проверка таблиц слоя Bronze
SHOW TABLES FROM lakekeeper.bronze;

-- 3. Проверка таблиц слоя Silver
SHOW TABLES FROM lakekeeper.silver;

-- 4. Проверка таблиц слоя Gold
SHOW TABLES FROM lakekeeper.gold;

-- 5. Количество строк после преобразования в Silver
SELECT COUNT(*) AS silver_row_count
FROM lakekeeper.silver.returned_items;

-- 6. Количество строк в итоговой таблице Gold
SELECT COUNT(*) AS gold_row_count
FROM lakekeeper.gold.q10_top20;

-- 7. Пять клиентов с наибольшей выручкой
SELECT
    custkey,
    name,
    revenue,
    nation
FROM lakekeeper.gold.q10_top20
ORDER BY revenue DESC
LIMIT 5;

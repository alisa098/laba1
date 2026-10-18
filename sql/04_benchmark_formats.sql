-- Лабораторная работа № 1
-- Проверка таблиц для бенчмарка GZIP и ZSTD
--
-- ВАЖНО:
-- Файл содержит проверочные запросы, а не исходный
-- код измерения времени записи.
-- Значения времени и размера приведены в отчёте.

-- 1. Проверка наличия таблиц
SHOW TABLES FROM lakekeeper.bronze;

-- 2. Количество строк в таблице GZIP
SELECT COUNT(*) AS gzip_row_count
FROM lakekeeper.bronze.lineitem_gzip;

-- 3. Количество строк в таблице ZSTD
SELECT COUNT(*) AS zstd_row_count
FROM lakekeeper.bronze.lineitem_zstd;

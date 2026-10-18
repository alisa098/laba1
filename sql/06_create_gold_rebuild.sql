-- Лабораторная работа № 1
-- Воспроизводимая агрегация Silver -> Gold
--
-- Создаёт отдельную тестовую таблицу q10_top20_rebuild.
-- Исходная таблица gold.q10_top20 не изменяется.
--
-- Перед повторным запуском проверь, существует ли
-- таблица q10_top20_rebuild.

CREATE TABLE lakekeeper.gold.q10_top20_rebuild AS
SELECT
    custkey,
    customer_name AS name,
    SUM(extendedprice * (1 - discount)) AS revenue
FROM lakekeeper.silver.returned_items_rebuild
GROUP BY custkey, customer_name
ORDER BY revenue DESC
LIMIT 20;

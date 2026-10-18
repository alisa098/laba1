-- Лабораторная работа № 1
-- Восстановленный запрос агрегации: Silver -> Gold
--
-- Назначение:
-- Рассчитать выручку клиентов по возвращённым позициям
-- и получить топ-20 клиентов.
--
-- ВАЖНО:
-- Это SELECT для воспроизведения логики агрегации.
-- Он не создаёт и не изменяет таблицу gold.q10_top20.
-- Исходный SQL лабораторной не сохранился; запрос
-- реконструирован по отчёту и проверен на существующих данных.

SELECT
    custkey,
    customer_name AS name,
    SUM(extendedprice * (1 - discount)) AS revenue
FROM lakekeeper.silver.returned_items
GROUP BY custkey, customer_name
ORDER BY revenue DESC
LIMIT 20;

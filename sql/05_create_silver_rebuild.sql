-- Лабораторная работа № 1
-- Воспроизводимое преобразование Bronze -> Silver
--
-- Создаёт отдельную тестовую таблицу returned_items_rebuild.
-- Исходная таблица silver.returned_items не изменяется.
--
-- Перед повторным запуском проверь, существует ли
-- таблица returned_items_rebuild.

CREATE TABLE lakekeeper.silver.returned_items_rebuild AS
SELECT
    c.custkey,
    c.name AS customer_name,
    c.acctbal,
    c.address,
    c.phone,
    c.comment AS customer_comment,
    n.name AS nation,
    o.orderkey,
    o.orderdate,
    l.extendedprice,
    l.discount,
    l.returnflag,
    o.orderpriority AS order_priority
FROM lakekeeper.bronze.lineitem l
JOIN lakekeeper.bronze.orders o
    ON l.orderkey = o.orderkey
JOIN lakekeeper.bronze.customer c
    ON o.custkey = c.custkey
JOIN lakekeeper.bronze.nation n
    ON c.nationkey = n.nationkey
WHERE l.returnflag = 'R'
  AND o.orderdate >= DATE '1993-10-01'
  AND o.orderdate < DATE '1994-01-01';

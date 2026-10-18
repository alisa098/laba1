-- Лабораторная работа № 1
-- Восстановленный запрос для ELT: Bronze -> Silver
--
-- Назначение:
-- Получить данные о возвращённых позициях заказов
-- за четвёртый квартал 1993 года.
--
-- ВАЖНО:
-- Это SELECT для воспроизведения логики преобразования.
-- Он не создаёт и не изменяет таблицу silver.returned_items.
-- Исходный SQL лабораторной не сохранился; запрос
-- реконструирован по структуре таблиц и отчёту.

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

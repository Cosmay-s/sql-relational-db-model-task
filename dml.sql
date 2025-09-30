-- 2.1. Получение информации о сумме товаров заказанных под каждого клиента
-- (Наименование клиента, сумма)

SELECT 
    c.name AS client_name,
    COALESCE(SUM(oi.quantity * p.price), 0) AS total_amount
FROM clients c
LEFT JOIN orders o ON c.id = o.client_id
LEFT JOIN order_items oi ON o.id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.id
GROUP BY c.id, c.name
ORDER BY total_amount DESC;

-- 2.2. Найти количество дочерних элементов первого уровня вложенности для категорий номенклатуры.

SELECT 
    parent.name AS category_name,
    COUNT(child.id) AS children_count
FROM categories parent
LEFT JOIN categories child ON parent.id = child.parent_id;

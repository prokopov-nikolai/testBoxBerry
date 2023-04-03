С точки зрения производительность самым эффективным будет выполнение следующего sql-запроса

<code>
UPDATE products
SET `price` =
CASE
WHEN color = "red" THEN price*0.95
WHEN color = "green" THEN price*1.10
END
WHERE color IN ("red", "green");
</code>
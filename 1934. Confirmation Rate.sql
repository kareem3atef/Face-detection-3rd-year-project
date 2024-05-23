WITH cte AS(
SELECT
    s.user_id,
    c.time_stamp,
    c.action,
    CASE
        WHEN c.action = 'confirmed' THEN 1
        ELSE 0
    END AS confirminary
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
)

SELECT
    user_id,
    ROUND(SUM(confirminary) / COUNT(user_id), 2) AS confirmation_rate
FROM cte
GROUP BY user_id;

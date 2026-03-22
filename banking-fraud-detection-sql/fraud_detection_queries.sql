-- Detect rapid transaction reversal within 24 hours

SELECT 
    t1.account_id,
    t1.transaction_id,
    t1.amount,
    t1.transaction_date,
    t2.transaction_id AS reversal_transaction
FROM transactions t1
JOIN transactions t2
ON t1.account_id = t2.account_id
AND t1.amount = t2.amount
AND t2.transaction_date > t1.transaction_date
AND t2.transaction_date <= t1.transaction_date + INTERVAL 1 DAY;



-- Detect dormant accounts becoming active

SELECT 
    account_id,
    MAX(transaction_date) AS last_txn,
    DATEDIFF(CURRENT_DATE, MAX(transaction_date)) AS days_inactive
FROM transactions
GROUP BY account_id
HAVING days_inactive > 180;



-- Detect structuring deposits

SELECT 
    account_id,
    COUNT(*) AS deposit_count,
    SUM(amount) AS total_deposit
FROM transactions
WHERE amount BETWEEN 45000 AND 49999
GROUP BY account_id
HAVING deposit_count >= 3;



-- Detect circular money movement

WITH RECURSIVE

txn_mapped AS (
    SELECT 
        CONCAT(d.account_id, '_', d.account_id_ifsc) AS sender,
        CONCAT(c.account_id, '_', c.account_id_ifsc) AS receiver,
        d.amount,
        d.transaction_date
    FROM transactions d
    JOIN transactions c
        ON d.transaction_id = c.transaction_id 
    WHERE d.type = 'DEBIT'
      AND c.type = 'CREDIT'
),

potential_returns AS (
    SELECT 
        t1.sender AS start_account_id,
        t1.receiver AS first_hop,
        t2.sender AS last_hop,
        t2.receiver AS end_account_id,
        t1.amount,
        t1.transaction_date AS start_date,
        t2.transaction_date AS end_date
    FROM txn_mapped t1
    JOIN txn_mapped t2
        ON t1.sender = t2.receiver
    WHERE t2.transaction_date >= t1.transaction_date
      AND DATEDIFF(t2.transaction_date, t1.transaction_date) <= 7
      AND t2.amount >= t1.amount * 0.9
),

path_check AS (

    -- Base step
    SELECT 
        pr.start_account_id,
        pr.first_hop AS current_account_id,
        pr.last_hop,
        pr.start_date,
        pr.end_date,
        pr.amount,
        1 AS depth,
        CAST(CONCAT('->', pr.first_hop, '->') AS CHAR(500)) AS path
    FROM potential_returns pr

    UNION ALL

    -- Recursive step
    SELECT 
        pc.start_account_id,
        t.receiver,
        pc.last_hop,
        pc.start_date,
        pc.end_date,
        pc.amount,
        pc.depth + 1,
        CONCAT(pc.path, t.receiver, '->')
    FROM path_check pc
    JOIN txn_mapped t
        ON pc.current_account_id = t.sender
    WHERE pc.depth < 5
      AND t.transaction_date BETWEEN pc.start_date AND pc.end_date
      AND pc.path NOT LIKE CONCAT('%->', t.receiver, '->%')
      AND ABS(t.amount - pc.amount) <= pc.amount * 0.1
)

SELECT *
FROM path_check
WHERE current_account_id = last_hop;

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
        CONCAT(d.acct, '_', d.acct_ifsc) AS sender,
        CONCAT(c.acct, '_', c.acct_ifsc) AS receiver,
        d.tran_amount,
        d.tran_date
    FROM transactions d
    JOIN transactions c
        ON d.txn_id = c.txn_id 
    WHERE d.type = 'DEBIT'
      AND c.type = 'CREDIT'
),

potential_returns AS (
    SELECT 
        t1.sender AS start_acct,
        t1.receiver AS first_hop,
        t2.sender AS last_hop,
        t2.receiver AS end_acct,
        t1.tran_amount,
        t1.tran_date AS start_date,
        t2.tran_date AS end_date
    FROM txn_mapped t1
    JOIN txn_mapped t2
        ON t1.sender = t2.receiver
    WHERE t2.tran_date >= t1.tran_date
      AND DATEDIFF(t2.tran_date, t1.tran_date) <= 7
      AND t2.tran_amount >= t1.tran_amount * 0.9
),

path_check AS (

    -- Base step
    SELECT 
        pr.start_acct,
        pr.first_hop AS current_acct,
        pr.last_hop,
        pr.start_date,
        pr.end_date,
        pr.tran_amount,
        1 AS depth,
        CAST(CONCAT('->', pr.first_hop, '->') AS CHAR(500)) AS path
    FROM potential_returns pr

    UNION ALL

    -- Recursive step
    SELECT 
        pc.start_acct,
        t.receiver,
        pc.last_hop,
        pc.start_date,
        pc.end_date,
        pc.tran_amount,
        pc.depth + 1,
        CONCAT(pc.path, t.receiver, '->')
    FROM path_check pc
    JOIN txn_mapped t
        ON pc.current_acct = t.sender
    WHERE pc.depth < 5
      AND t.tran_date BETWEEN pc.start_date AND pc.end_date
      AND pc.path NOT LIKE CONCAT('%->', t.receiver, '->%')
      AND ABS(t.tran_amount - pc.tran_amount) <= pc.tran_amount * 0.1
)

SELECT *
FROM path_check
WHERE current_acct = last_hop;

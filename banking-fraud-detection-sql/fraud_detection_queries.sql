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

SELECT 
    t1.sender,
    t1.receiver,
    t2.receiver AS final_receiver
FROM transactions t1
JOIN transactions t2
ON t1.receiver = t2.sender
WHERE t1.sender = t2.receiver;

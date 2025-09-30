CREATE OR ALTER PROCEDURE BalancePerCustomer
    @name VARCHAR(100)
AS
BEGIN
    SELECT 
        c.CustomerName,
        a.AccountType,
        a.Balance,
        a.Balance 
            + SUM(
                CASE 
                    WHEN f.TransactionType = 'Deposit' THEN f.Amount
                    ELSE -f.Amount
                END
              ) AS CurrentBalance
    FROM DimCustomer c
    JOIN DimAccount a ON c.CustomerID = a.AccountID
    JOIN FactTransaction f ON a.AccountID = f.AccountID
    WHERE c.CustomerName = @name
      AND a.Status = 'active'
    GROUP BY c.CustomerName, a.AccountType, a.Balance;
END;

-- Contoh penggunaannya
EXEC BalancePerCustomer 'Shelly';
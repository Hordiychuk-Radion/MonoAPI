SELECT TOP (1000) [action_date]
      ,[description]
      ,[amount]
      ,[operationAmount]
      ,[currencyCode]
      ,[commissionRate]
      ,[cashbackAmount]
      ,[balance]
      ,[tr_owner]
      ,[mcc]
  FROM [APIMO].[dbo].[monoapi]


UPDATE monoapi
SET amount = amount / 100
WHERE operationAmount = -12786.00;

UPDATE monoapi
SET operationAmount = operationAmount / 100
WHERE amount = -127.86;


UPDATE monoapi
SET balance = balance / 100
WHERE amount = -127.86;

select * from monoapi
Order by action_date DESC;

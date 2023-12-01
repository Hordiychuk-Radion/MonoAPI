use APIMO

CREATE TABLE monoapi (
    action_date DATETIME,
    description NVARCHAR(MAX),
    amount DECIMAL(18, 2),
    operationAmount DECIMAL(18, 2),
    currencyCode NVARCHAR(10),
    commissionRate DECIMAL(18, 2),
    cashbackAmount DECIMAL(18, 2),
    balance DECIMAL(18, 2),
    tr_owner NVARCHAR(100),
    mcc NVARCHAR(10)  
);

select * from monoapi

UPDATE monoapi
SET amount = amount / 100;

UPDATE monoapi
SET operationAmount = operationAmount / 100,
    commissionRate = commissionRate / 100,
    cashbackAmount = cashbackAmount / 100,
    balance = balance / 100,
    tr_owner = tr_owner / 100;




SELECT m.*, j.shortDescription AS spend_type
FROM monoapi m
LEFT JOIN APIJSON j ON m.mcc = j.mcc;

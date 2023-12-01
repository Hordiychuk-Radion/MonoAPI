USE APIMO
CREATE TABLE APIJSON (
    mcc VARCHAR(10),
    [type] VARCHAR(50),
    description VARCHAR(100),
    shortDescription VARCHAR(100),
    fullDescription VARCHAR(100)
);


DECLARE @json NVARCHAR(MAX);
SELECT @json = BulkColumn
FROM OPENROWSET(BULK 'C:\Users\Clevo\Desktop\json\mcc-en.json', SINGLE_CLOB) as j;

INSERT INTO APIJSON (mcc, [type], description, shortDescription, fullDescription)
SELECT mcc,
       [type],
       [group.description] as description,
       shortDescription,
       fullDescription
FROM OPENJSON(@json)
WITH (
    mcc VARCHAR(10) '$.mcc',
    [type] VARCHAR(50) '$.group.type',
    [group.description] VARCHAR(100) '$.group.description',
    shortDescription VARCHAR(100) '$.shortDescription',
    fullDescription VARCHAR(100) '$.fullDescription'
);


select * from APIJSON




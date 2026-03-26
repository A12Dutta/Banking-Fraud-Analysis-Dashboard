CREATE DATABASE BankingAnalysis;
#DROP TABLE IF EXISTS Transactions;
USE BankingAnalysis;
CREATE TABLE Transactions (
    Transaction_ID VARCHAR(255),
    Sender_Account_ID VARCHAR(255),
    Receiver_Account_ID VARCHAR(255),
    Transaction_Amount VARCHAR(255),
    Transaction_Type VARCHAR(255),
    Timestamp VARCHAR(255),
    Transaction_Status VARCHAR(255),
    Fraud_Flag VARCHAR(255),
    Geolocation VARCHAR(255),
    Device_Used VARCHAR(255),
    Network_Slice_ID VARCHAR(255),
    Latency_ms VARCHAR(255),
    Slice_Bandwidth_Mbps VARCHAR(255),
    PIN_Code VARCHAR(255)
);
SELECT count(*) FROM Transactions;
SET SQL_SAFE_UPDATES = 0;
UPDATE Transactions 
SET Fraud_Flag = CASE 
    WHEN Fraud_Flag = 'TRUE' THEN '1' 
    WHEN Fraud_Flag = 'FALSE' THEN '0' 
    ELSE Fraud_Flag 
END;
SET SQL_SAFE_UPDATES = 1;
DESCRIBE Transactions;
ALTER TABLE Transactions
MODIFY COLUMN Transaction_Amount DECIMAL(15,2);
ALTER TABLE Transactions 
MODIFY COLUMN Timestamp DATETIME;
ALTER TABLE Transactions 
MODIFY COLUMN Latency_ms INT,
MODIFY COLUMN Slice_Bandwidth_Mbps INT,
MODIFY COLUMN PIN_Code INT;
ALTER TABLE Transactions 
MODIFY COLUMN Fraud_Flag TINYINT(1);
DESCRIBE Transactions;
SELECT 
    COUNT(Transaction_ID) AS Total_Transactions,
    SUM(Transaction_Amount) AS Total_Volume,
    AVG(Transaction_Amount) AS Avg_Transaction_Value,
    SUM(CASE WHEN Fraud_Flag = 1 THEN 1 ELSE 0 END) AS Total_Fraud_Cases
FROM Transactions;
SELECT 
    Transaction_Type, 
    COUNT(*) AS Total_Count,
    SUM(CASE WHEN Transaction_Status = 'Success' THEN 1 ELSE 0 END) AS Success_Count,
    SUM(CASE WHEN Transaction_Status = 'Failed' THEN 1 ELSE 0 END) AS Failure_Count,
    ROUND((SUM(CASE WHEN Transaction_Status = 'Success' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Success_Rate_Percentage
FROM Transactions
GROUP BY Transaction_Type;
SELECT 
    Transaction_Status,
    AVG(Latency_ms) AS Avg_Latency,
    AVG(Slice_Bandwidth_Mbps) AS Avg_Bandwidth
FROM Transactions
GROUP BY Transaction_Status;
SELECT 
    Device_Used, 
    COUNT(*) AS Total_Transactions,
    SUM(Fraud_Flag) AS Total_Fraud_Cases,
    ROUND((SUM(Fraud_Flag) / COUNT(*)) * 100, 2) AS Fraud_Rate_Percentage
FROM Transactions
GROUP BY Device_Used
ORDER BY Fraud_Rate_Percentage DESC;
SELECT 
    Geolocation, 
    COUNT(*) AS Total_Transactions,
    SUM(Fraud_Flag) AS Fraud_Count
FROM Transactions
WHERE Fraud_Flag = 1
GROUP BY Geolocation
ORDER BY Fraud_Count DESC
LIMIT 5;
SELECT 
    Sender_Account_ID, 
    COUNT(*) AS Failed_Attempts
FROM Transactions
WHERE Transaction_Status = 'Failed'
GROUP BY Sender_Account_ID
HAVING Failed_Attempts > 3
ORDER BY Failed_Attempts DESC;
SELECT 
    HOUR(Timestamp) AS Hour_of_Day, 
    COUNT(*) AS Total_Transactions,
    SUM(Fraud_Flag) AS Fraud_Cases,
    ROUND((SUM(Fraud_Flag) / COUNT(*)) * 100, 2) AS Fraud_Rate
FROM Transactions
GROUP BY Hour_of_Day
ORDER BY Hour_of_Day;

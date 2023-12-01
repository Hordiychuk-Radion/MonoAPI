import requests
import pyodbc
from datetime import datetime, timedelta

token = "RADION"
headers = {'X-Token': token}
BASE_URL = 'https://api.monobank.ua'
account = 0  

to_timestamp = int(datetime.now().timestamp())
from_timestamp = int(to_timestamp - 3 * 7 * 24 * 60 * 60)

url = f"{BASE_URL}/personal/statement/{account}/{from_timestamp}/{to_timestamp}"

try:
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()

        connection = pyodbc.connect('DRIVER={SQL Server};SERVER=DESKTOP-////;DATABASE=////;Trusted_Connection=yes')
        cursor = connection.cursor()

        for transaction in data:
            action_date = datetime.fromtimestamp(transaction['time'])
            
            cursor.execute("""
                INSERT INTO monoapi (action_date, description, amount, operationAmount, currencyCode, commissionRate, cashbackAmount, balance, mcc)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
            """, (
                action_date,
                transaction['description'], transaction['amount'], transaction['operationAmount'],
                transaction['currencyCode'], transaction['commissionRate'], transaction['cashbackAmount'],
                transaction['balance'], transaction.get('mcc', None)  
            ))

        connection.commit()
        connection.close()
    else:
        print(f'Помилка доступу до Monobank API: {response.status_code}')
        print(response.text)  

except requests.RequestException as e:
    print(f'Помилка запиту до Monobank API: {e}')

except pyodbc.Error as ex:
    print(f'Помилка бази даних: {ex}')
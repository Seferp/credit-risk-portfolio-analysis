import sqlite3
import pandas as pd
from pathlib import Path

#path to main catalog of project
BASE_DIR = Path(__file__).resolve().parent.parent

#path to excel file
file_path = BASE_DIR / "data" / "default of credit card clients.xls"

#path to database
database_path = BASE_DIR / "database" / "credit_risk.db"

# 1 Data load
df = pd.read_excel(file_path, header=1)

# 2 Connection with database
with sqlite3.connect(database_path) as conn:

    # 3 Save data to table
    df.to_sql(
        name='credit_clients_raw',
        con=conn,
        index=False,
        if_exists='replace'
    )
# 4 Check number of records
result = conn.execute(
    "SELECT COUNT(*) FROM credit_clients_raw"
).fetchone()[0]


print(f'Records in excel: {len(df)}')
print(f'Records in SQLite: {result}')
print(f'Database created: {database_path}')
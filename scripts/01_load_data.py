import pandas as pd
from pathlib import Path

#path to main catalog of project
BASE_DIR = Path(__file__).resolve().parent.parent

#path to excel file
file_path = BASE_DIR / "data" / "default of credit card clients.xls"

#data load
df = pd.read_excel(file_path, header=1)

#Basic information
print(f'Number of columns and rows: {df.shape}')

print(f'\nColumns name:\n{df.columns.tolist()}')
print(f'\nFirst five rows:\n{df.head()}')

print('-' * 60)

#Missing values
print(f'\nMissing values:\n{df.isnull().sum()}')

#Duplicate rows
print(f'\nDuplicate rows:\n{df.duplicated().sum()}')

#Duplicates customer ID's
print(f'\nDuplicate IDs:\n{df["ID"].duplicated().sum()}')

#Data types
print(f'\nData types:\n{df.dtypes}')




categorical_columns = [
    'SEX',
    'EDUCATION',
    'MARRIAGE',
    'PAY_0'
]

for column in categorical_columns:
    print(f'\nColumn:\n{df[column].value_counts().sort_index()}')
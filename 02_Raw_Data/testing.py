import csv
from pathlib import Path

import pandas as pd

# Project paths
PROJECT_ROOT = Path(__file__).resolve().parent.parent
csv_path = PROJECT_ROOT / "02_Raw_Data" / "Car_Sales.csv"

# Load dataset
df = pd.read_csv(csv_path, encoding="latin1")

print("--- DATASET INFO ---")
df.info()

print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

print("\n--- SUMMARY STATISTICS ---")
print(df[['Price ($)', 'Annual Income']].describe())

print("\n--- DUPLICATE CAR IDs ---")
print(df['Car_id'].duplicated().sum())

print("\n--- CHECK FOR ENCODING ARTIFACTS ---")

string_cols = df.select_dtypes(include=['object']).columns

for col in string_cols:
    artifact_count = (
        df[col]
        .astype(str)
        .str.contains("Â", na=False)
        .sum()
    )

    if artifact_count > 0:
        print(
            f"Column '{col}' contains {artifact_count} rows with encoding artifact 'Â'"
        )
import pandas as pd

# Load raw dataset
df = pd.read_csv("Car_Sales.csv")

print("--- DATASET INFO ---")
df.info()

print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

print("\n--- SUMMARY STATISTICS ---")
print(df[['Price ($)', 'Annual Income']].describe())

print("\n--- CHECK FOR ENCODING ARTIFACTS ---")

# Check for stray 'Â' characters
string_cols = df.select_dtypes(include=['object']).columns

for col in string_cols:
    artifact_count = df[df[col].astype(str).str.contains("Â", na=False)].shape[0]

    if artifact_count > 0:
        print(
            f"Column '{col}' contains {artifact_count} rows with encoding artifact 'Â'"
        )
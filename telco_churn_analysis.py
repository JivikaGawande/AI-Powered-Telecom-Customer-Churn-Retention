import pandas as pd

df = pd.read_csv("telco_churn_cleaned.csv")

print("Dataset Shape:", df.shape)

print("\n--- Column Names ---")
print(df.columns.tolist())

print("\n--- Missing Values ---")
print(df.isnull().sum())

print("\n--- Churn Distribution ---")
print(df["Churn"].value_counts())

# Remove columns that should not be used as ML features
X = df.drop(columns=[
    "customerID",
    "Churn",
    "Churn_Flag"
])

# Target
y = df["Churn"].map({"No": 0, "Yes": 1})

# Convert categorical columns into numbers
X = pd.get_dummies(X, drop_first=True)

print("\nML Dataset Shape:", X.shape)
print("Target Distribution:")
print(y.value_counts())

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

# 80% training, 20% testing
X_train, X_test, y_train, y_test = train_test_split(
    X, y,
    test_size=0.20,
    random_state=42,
    stratify=y
)

print("\nTraining Data:", X_train.shape)
print("Testing Data:", X_test.shape)

# Scale data
scaler = StandardScaler()

X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Train model
model = LogisticRegression(max_iter=2000)
model.fit(X_train_scaled, y_train)

# Prediction
y_pred = model.predict(X_test_scaled)

# Evaluation
print("\nModel Accuracy:", round(accuracy_score(y_test, y_pred) * 100, 2), "%")

print("\nConfusion Matrix:")
print(confusion_matrix(y_test, y_pred))

print("\nClassification Report:")
print(classification_report(y_test, y_pred))

print(classification_report(y_test, y_pred))
# Predict churn probability for all customers
X_scaled = scaler.transform(X)

churn_probability = model.predict_proba(X_scaled)[:, 1]

df["Churn_Probability"] = churn_probability

# Create ML-based Risk Level
df["ML_Risk_Level"] = pd.cut(
    df["Churn_Probability"],
    bins=[0, 0.30, 0.60, 1.0],
    labels=["Low Risk", "Medium Risk", "High Risk"],
    include_lowest=True
)

print("\n--- ML Risk Level Distribution ---")
print(df["ML_Risk_Level"].value_counts())

print("\n--- Sample Customer Predictions ---")
print(
    df[
        ["customerID", "Churn", "Churn_Probability", "ML_Risk_Level"]
    ].head(10)
)
# Save final ML prediction dataset
df.to_csv("telco_churn_ml_predictions.csv", index=False)

print("\nFinal ML prediction file saved successfully!")
print("Final dataset shape:", df.shape)
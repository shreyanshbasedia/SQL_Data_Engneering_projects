import pandas as pd
import matplotlib.pyplot as plt

# Example dataset (replace with your actual query results)
data = {
    "skills": ["rust","terraform","golang","spring","neo4j","gdpr","zoom","graphql","mongo","fastapi",
               "bitbucket","django","crystal","c","atlassian","typescript","kubernetes","node","ruby",
               "css","airflow","redis","vmware","ansible","jupyter"],
    "Salary_median": [210000,184000,184000,175500,170000,169616,168438,167500,162250,157500,
                      155000,155000,154224,151500,151500,151000,150500,150000,150000,150000,
                      149000,148798,148798,147500],
    "actual_demand": [23,193,39,33,11,22,12,28,14,3,
                      9,5,3,23,9,39,147,22,48,13,
                      386,17,2,14,15]
}

df = pd.DataFrame(data)

# Normalize salary and demand
df["norm_salary"] = (df["Salary_median"] - df["Salary_median"].min()) / (df["Salary_median"].max() - df["Salary_median"].min())
df["norm_demand"] = (df["actual_demand"] - df["actual_demand"].min()) / (df["actual_demand"].max() - df["actual_demand"].min())

# Compute optimal score (equal weight)
df["optimal_score"] = (df["norm_salary"] + df["norm_demand"]) / 2

# Sort by score
df_sorted = df.sort_values("optimal_score", ascending=False).head(10)

# Plot
plt.figure(figsize=(10,6))
plt.barh(df_sorted["skills"], df_sorted["optimal_score"], color="skyblue")
plt.xlabel("Optimal Score (0–1)")
plt.title("Top 10 Skills by Salary & Demand Balance")
plt.gca().invert_yaxis()  # highest score at top
plt.show()

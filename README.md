# 🧑‍💼 HR Data Analysis Project (2000–2020)

![image](https://github.com/user-attachments/assets/4785d5b9-3135-463c-82aa-31a591c31265)


This project involves cleaning, analyzing, and visualizing HR data using **MySQL Workbench** and **Power BI** to uncover insights about employee demographics, tenure, turnover, and departmental distribution.

---

## 📊 Dataset Overview

- **Source**: HR dataset with **22,000+ employee records**
- **Time Period**: Year 2000 to 2020
- **Tools Used**:
  - 🛠️ **MySQL Workbench** – for data cleaning and analysis
  - 📊 **Power BI** – for interactive data visualization

---

## 🔍 Key Business Questions Answered

1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees?
3. What is the age distribution of employees?
4. How many employees work at headquarters vs. remote locations?
5. What is the average length of employment for terminated employees?
6. How does gender distribution vary across departments and job titles?
7. What is the distribution of job titles company-wide?
8. Which department has the highest turnover rate?
9. What is the geographic distribution of employees across U.S. states?
10. How has employee count changed over time based on hire and term dates?
11. What is the tenure distribution across departments?

---

## 📈 Summary of Findings

- **Gender**: More male employees than female overall; distribution is relatively balanced across departments.
- **Ethnicity**: Predominantly White employees; Native Hawaiian and American Indian are least represented.
- **Age**: Youngest employee is 20; oldest is 57.
  - Age groups: 
    - 18–24 (excluded due to data issues)
    - 25–34 – highest number
    - 35–44 – second highest
    - 45–54
    - 55–64 – smallest group
- **Location**: Majority work at headquarters; fewer remote employees.
- **Tenure**: 
  - Average tenure for terminated employees is ~7 years.
  - Average tenure per department is ~8 years.
  - Legal and Auditing have the longest tenure; Sales, Services, and Marketing the shortest.
- **Turnover**: 
  - Highest in **Marketing**, followed by **Training**.
  - Lowest in **R&D**, **Support**, and **Legal**.
- **Geography**: Most employees are from **Ohio**.
- **Trend**: Net employee count has steadily increased over the years.

---

## ⚠️ Limitations

- **Invalid Ages**: 967 records with negative ages were excluded. Only ages ≥ 18 were used.
- **Term Dates**: 1,599 records with future termination dates were excluded. Only term dates ≤ current date were analyzed.

---

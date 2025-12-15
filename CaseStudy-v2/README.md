# 🏦 Bank Customer Churn Analysis



Author: Shota Terajima

Date: December 15th, 2025





### **Introduction**





Customer retention has become one of the most critical challenges in the banking industry. As competition intensifies and customers have more choices than ever, banks

must understand why customers decide to leave.

Therefore, identifying the key factors that contribute to customer churn is essential for designing effective retention strategies.



In this project, I analyze an open-source banking churn dataset licensed under Apache License 2.0, which contains customer demographic information, financial details, account behaviors, and churn indicators. Using the Google Data Analytics framework (Ask, Prepare, Process, Analyze, Share, Act), I explore patterns across age groups, balances, tenure, transaction activity, and cash flow to identify customer segments most at risk of churn.



This case study aims to provide clear, data-driven insights that banks can use to improve customer engagement, strengthen loyalty strategies, and ultimately reduce churn.



### 

### **Ask (Business Task)**





**Goal:** Identify which customer factors and segments are most strongly associated with churn in a retail banking context.



**Key stakeholders:**



* Bank management
* Customer retention and marketing teams
* Product and strategy teams





### **Prepare (Data Understanding)**

### 

**Dataset:** Bank Customer Churn Data (raw data)



**License:** Apache License 2.0



**Source:** Open-source dataset for educational purposes



**ROCCC Assessment:**



Reliable: Low (no verification from first-party financial institutions)

Original: Low (third-party dataset)

Comprehensive: Medium (approximately 20,000 records with multiple customer attributes)

Current: Low (data collected approximately 6 years ago)

Cited: Low (limited metadata and documentation)



**The dataset has limitations:**



* Significant missing gender information among elderly customers, particularly those aged 90.
* Inconsistent and unrealistic values in the occupation field (e.g., very young customers labeled as students).
* Overrepresentation of self-employed customers, which may not reflect a typical banking population.
* Lack of contextual information for geographic variables, such as city and branch code.
* Customer activity is available only for the most recent two months, limiting long-term behavioral analysis.





### **Process (Data Cleaning \& Transformation)**





The dataset required extensive preprocessing before analysis.

Data cleaning and transformation were primarily conducted using Google Sheets and R.



**Key steps included:**



Removing duplicate records



**Handling missing values:**



* Dropped rows when missing values were random and minimal
* Created an "Unknown" category for missing categorical variables



**Correcting invalid or illogical values:**



* Replaced numeric anomalies with median values
* Assigned "Unknown" for ambiguous categorical entries



**Feature engineering:**



* Created new variables such as net monthly cash flow
* Generated categorical buckets (e.g., balance, tenure, cash flow) to support segmentation analysis





### **Analyze**



**Gender:**



Male customers are the most common, followed by female customers



Consistent with global financial inclusion trends, male customers are the largest group in our dataset, followed by female customers. Worldwide, data indicate that a higher percentage of men have bank accounts compared with women, reflecting a common pattern in banking participation. World Bank



**Vintage(Customer tenure):**



Nearly all customers (99%) have been with the bank for more than three years, indicating a highly tenured customer base





“A large portion of customers in our dataset have been with the bank for more than three years, indicating strong customer retention. Longer customer tenure in banking is often associated with higher loyalty and stable engagement, a trend supported in industry analyses of consumer financial behavior. 

arXiv

”



🔎 3. “Self-employed is the most common occupation”



Reality:

Industry surveys show that self-employment is a significant component of the modern workforce — for example in the U.S., self-employed individuals make up about 10% of the workforce, and many banks offer products tailored to this group due to their unique income verification and financial needs. 

Bankrate



✔ This means seeing a high share of self-employed customers in a dataset can be realistic, especially depending on the dataset’s source and sample.



Sentence for README:



“In our customer dataset, self-employed individuals are the most common occupational category. This aligns with broader workforce data showing that self-employment constitutes a notable share of the labor market — for instance, approximately 10% of U.S. workers are self-employed, making this segment important for banking product design and customer segmentation. 

Bankrate

”



### **Share (Insights)**





**Tableau dashboard:**



**Presentation slide:**

### 

### **License**



This project uses data licensed under the **Apache License 2.0**.





### **Use of AI**



Some code structure, visualization ideas, and phrasing suggestions were assisted by AI tools (ChatGPT).

All data cleaning decisions, analysis logic, interpretations, and final conclusions were reviewed and produced by the author.


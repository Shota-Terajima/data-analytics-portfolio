library(tidyverse)
library(scales)

bank <- read_csv("Casestudy2_cleaned.csv")

bank <- bank %>% 
  mutate(vintage_bucket = case_when(
    vintage <= 180  ~ "0–6 months",
    vintage <= 365  ~ "6–12 months",
    vintage <= 1095 ~ "1–3 years",
    vintage <= 1825 ~ "3–5 years",
    TRUE            ~ "5+ years"
  )) %>%
  mutate(age_bucket = case_when(
    age <= 17 ~ "1–17",
    age <= 29 ~ "18–29",
    age <= 44 ~ "30–44",
    age <= 64 ~ "45–64",
    TRUE      ~ "65–90"
  )) %>%
  mutate(dependents_bucket = case_when(
    dependents == 0 ~ "0",
    dependents == 1 ~ "1",
    dependents <= 3 ~ "2–3",
    TRUE      ~ "4+"
  )) %>% 
  mutate(current_balance_bucket = case_when(
    current_balance < 0        ~ "Negative",
    current_balance < 1000     ~ "0-1k",
    current_balance < 5000     ~ "1k-5k",
    current_balance < 20000    ~ "5k-20k",
    current_balance < 50000    ~ "20k-50k",
    current_balance >= 50000   ~ "50k+",
    TRUE                      ~ NA_character_
  )) %>%
  mutate(previous_month_end_balance_bucket = case_when(
    previous_month_end_balance < 0 ~ "Negative",
    previous_month_end_balance <= 1000 ~ "0–1k",
    previous_month_end_balance <= 5000 ~ "1k–5k",
    previous_month_end_balance <= 20000 ~ "5k–20k",
    previous_month_end_balance <= 50000 ~ "20k–50k",
    TRUE ~ "50k+"
  )) %>%  
  mutate(average_monthly_balance_prevQ_bucket = case_when(
    average_monthly_balance_prevQ < 0 ~ "Negative",
    average_monthly_balance_prevQ <= 1000 ~ "0–1k",
    average_monthly_balance_prevQ <= 5000 ~ "1k–5k",
    average_monthly_balance_prevQ <= 20000 ~ "5k–20k",
    average_monthly_balance_prevQ <= 50000 ~ "20k–50k",
    TRUE ~ "50k+"
  )) %>% 
  mutate(average_monthly_balance_prevQ2_bucket = case_when(
    average_monthly_balance_prevQ2 < 0 ~ "Negative",
    average_monthly_balance_prevQ2 <= 1000 ~ "0–1k",
    average_monthly_balance_prevQ2 <= 5000 ~ "1k–5k",
    average_monthly_balance_prevQ2 <= 20000 ~ "5k–20k",
    average_monthly_balance_prevQ2 <= 50000 ~ "20k–50k",
    TRUE ~ "50k+"
  )) %>% 
  mutate(current_month_credit_bucket = case_when(
    current_month_credit < 0 ~ "Negative",
    current_month_credit == 0 ~ "No activity",
    current_month_credit <= 1000 ~ "Low",
    current_month_credit <= 5000 ~ "Medium",
    current_month_credit <= 20000 ~ "High",
    TRUE ~ "Very High"
  )) %>% 
  mutate(previous_month_credit_bucket = case_when(
    previous_month_credit < 0 ~ "Negative",
    previous_month_credit == 0 ~ "No activity",
    previous_month_credit <= 1000 ~ "Low",
    previous_month_credit <= 5000 ~ "Medium",
    previous_month_credit <= 20000 ~ "High",
    TRUE ~ "Very High"
  )) %>% 
  mutate(current_month_debit_bucket = case_when(
    current_month_debit < 0 ~ "Negative",
    current_month_debit == 0 ~ "No activity",
    current_month_debit <= 1000 ~ "Low",
    current_month_debit <= 5000 ~ "Medium",
    current_month_debit <= 20000 ~ "High",
    TRUE ~ "Very High"
  )) %>% 
  mutate(previous_month_debit_bucket = case_when(
    previous_month_debit < 0 ~ "Negative",
    previous_month_debit == 0 ~ "No activity",
    previous_month_debit <= 1000 ~ "Low",
    previous_month_debit <= 5000 ~ "Medium",
    previous_month_debit <= 20000 ~ "High",
    TRUE ~ "Very High"
  )) %>% 
  mutate(current_month_balance_bucket = case_when(
    current_month_balance < 0 ~ "Negative",
    current_month_balance <= 1000 ~ "0–1k",
    current_month_balance <= 5000 ~ "1k–5k",
    current_month_balance <= 20000 ~ "5k–20k",
    current_month_balance <= 50000 ~ "20k–50k",
    TRUE ~ "50k+"
  )) %>% 
  mutate(previous_month_balance_bucket = case_when(
    previous_month_balance < 0 ~ "Negative",
    previous_month_balance <= 1000 ~ "0–1k",
    previous_month_balance <= 5000 ~ "1k–5k",
    previous_month_balance <= 20000 ~ "5k–20k",
    previous_month_balance <= 50000 ~ "20k–50k",
    TRUE ~ "50k+"
  )) %>% 
  mutate(last_transaction_bucket = case_when(
    last_transaction == 0 ~ "Unknown",
    last_transaction <= 20190331 ~ "Old",
    last_transaction <= 20190631 ~ "Mid Old",
    last_transaction <= 20190931 ~ "Mid Recent",
    TRUE ~ "Recent"
  )) %>% 
  mutate(current_net_month_cashflow_bucket = case_when(
    current_net_month_cashflow <= -1000 ~ "Large Decrease",
    current_net_month_cashflow < 0 ~ "Moderate Decrease",
    current_net_month_cashflow == 0 ~ "No Change",
    current_net_month_cashflow <= 1000 ~ "Moderate Increase",
    TRUE ~ "Large Increase"
  )) %>% 
  mutate(previous_net_month_cashflow_bucket = case_when(
    previous_net_month_cashflow <= -1000 ~ "Large Decrease",
    previous_net_month_cashflow < 0 ~ "Moderate Decrease",
    previous_net_month_cashflow == 0 ~ "No Change",
    previous_net_month_cashflow <= 1000 ~ "Moderate Increase",
    TRUE ~ "Large Increase"
  )) %>% 
  mutate(monthly_credit_change_bucket = case_when(
    monthly_credit_change <= -1000 ~ "Large Decrease",
    monthly_credit_change < 0 ~ "Moderate Decrease",
    monthly_credit_change == 0 ~ "No Change",
    monthly_credit_change <= 1000 ~ "Moderate Increase",
    TRUE ~ "Large Increase"
  )) %>% 
  mutate(monthly_debit_change_bucket = case_when(
    monthly_debit_change <= -1000 ~ "Large Decrease",
    monthly_debit_change < 0 ~ "Moderate Decrease",
    monthly_debit_change == 0 ~ "No Change",
    monthly_debit_change <= 1000 ~ "Moderate Increase",
    TRUE ~ "Large Increase"
  )) %>% 
  mutate(monthly_balance_change_bucket = case_when(
    monthly_balance_change <= -1000 ~ "Large Decrease",
    monthly_balance_change < 0 ~ "Moderate Decrease",
    monthly_balance_change == 0 ~ "No Change",
    monthly_balance_change <= 1000 ~ "Moderate Increase",
    TRUE ~ "Large Increase"
  ))

					
bank <- bank %>% 
  select(-age, -vintage, -dependents, -current_balance,-previous_month_end_balance,
                        -average_monthly_balance_prevQ, -average_monthly_balance_prevQ2,
                        -current_month_credit,-previous_month_credit, -current_month_debit,
                        -previous_month_debit, -current_month_balance,-previous_month_balance,
                        -last_transaction_date, -last_transaction, -current_net_month_cashflow,
                        -previous_net_month_cashflow,-monthly_credit_change,-monthly_debit_change,
                        -monthly_balance_change)

bank <- bank %>% 
  mutate(occupation = ifelse(occupation %in% c("None", "company"),
                             "Unknown",
                             occupation))

bank <- bank %>%
  mutate(
    current_balance_bucket = case_when(
      current_balance < 0        ~ "Negative",
      current_balance < 1000     ~ "0-1k",
      current_balance < 5000     ~ "1k-5k",
      current_balance < 20000    ~ "5k-20k",
      current_balance < 50000    ~ "20k-50k",
      current_balance >= 50000   ~ "50k+",
      TRUE                       ~ NA_character_
    ),
    current_balance_bucket = factor(
      current_balance_bucket,
      levels = c("Negative",
                 "0-1k",
                 "1k-5k",
                 "5k-20k",
                 "20k-50k",
                 "50k+")
    )
  )

write.csv(bank, "CaseStudy2_BANK_cleaned_all.csv", row.names = FALSE)

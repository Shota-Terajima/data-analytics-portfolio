#GRAPH

# Gender Distribution (Pie)

bank_gender <- bank %>% 
  group_by(gender) %>%
  summarise(count = n()) %>% 
  mutate(perc_gender =count/sum(count))

Gender_pie =  ggplot(bank_gender,
                      aes(x = "", y = count, fill = gender_bucket))+
  
  geom_col() +
  coord_polar("y")+
  
  geom_text(aes(label = percent(perc_vintage, accracy = 1)),
            position = position_stack(vjust = 0.5),
            size = 5) +
  
  scale_fill_manual(values = c(
    "Male" = "#3399FF", 
    "Female"   = "#FF6FB5",   
    "Unknown" = "#BDBDBD")) + 
  
  theme_void() +
  
  labs(title = "Gender Distribution",
       fill = "Gender tenure")+
  
  theme(plot.background = element_rect(fill = "white", color = NA),
        plot.title = element_text(color = "black", size = 15 , face = "bold"),
        legend.title = element_text(color = "black", face = "bold"),
        legend.text  = element_text(color = "black"))

# Vintage Distribution(Pie) 

bank_vintage <- bank %>%
  group_by(vintage_bucket) %>%
  summarise(count = n()) %>%
  mutate(perc_vintage =count/sum(count))

Vintage_pie =  ggplot(bank_vintage,
                      aes(x = "", y = count, fill = vintage_bucket))+
  
  geom_col() +
  coord_polar("y")+
  
  geom_text(aes(label = ifelse(perc_vintage >0.05,
                               percent(perc_vintage,accracy = 1), "")),
            position = position_stack(vjust = 0.5),
            size = 5) +
  
  scale_fill_manual(values = c(
    "0-6 months" = "#FB9A99", 
    "6-12 months"   = "#B2DF8A",   
    "1-3 years" = "#CCCCCC",
    "3-5 years" = "#A6CEE3",
    "5+ years" = "#1F78B4"
  )) + 
  
  theme_void() +
  
  labs(title = "Customer tenure Distribution",
       fill = "Customer tenure")+
  
  theme(plot.background = element_rect(fill = "white", color = NA),
        plot.title = element_text(color = "black", size = 15 , face = "bold"),
        legend.title = element_text(color = "black", face = "bold"),
        legend.text  = element_text(color = "black"))

# Occupation Distribution (Pie)

bank_occupation <- bank %>% 
  group_by(occupation) %>%
  summarise(count = n()) %>% 
  mutate(perc_occupation =count/sum(count))

Occupation_pie =  ggplot(bank_occupation,
         aes(x = 2 , y = count, fill = occupation))+
    
    geom_col() +
    coord_polar("y")+
    xlim(1, 2.5)+
  
    
    
    scale_fill_manual(values = c(
      "retired"      = "#A6CEE3",
      "salaried"     = "#1F78B4",
      "self_employed"= "#B2DF8A",
      "student"      = "#FB9A99",
      "Unknown"      = "#CCCCCC"
    )) +
    
    geom_text(
      aes(label = ifelse(perc_occupation > 0.05,
                         percent(perc_occupation, accuracy = 1), "")),
      position = position_stack(vjust = 0.5),
      size = 5
    ) +
    
    theme_void()+
    
    labs(title = "Occupation Distribution",
         fill = "Occupation")+
    
    theme(plot.background = element_rect(fill = "white", color = NA), 
          plot.title = element_text(color = "black", size = 15 , face = "bold"),
          legend.title = element_text(color = "black", face = "bold"),
          legend.text  = element_text(color = "black"))

  
# Cash flow(Bar)


bank_current_cashflow <- bank %>%
  group_by(current_net_month_cashflow_bucket) %>%  
  summarise(
    churn_rate = mean(churn, na.rm = TRUE))

bank_current_cashflow$current_net_month_cashflow_bucket <- factor(
  bank_current_cashflow$current_net_month_cashflow_bucket,
  levels = c("Large Decrease",
             "Moderate Decrease",
             "No Change",
             "Moderate Increase",
             "Large Increase"))


Cashflow_bar =  ggplot(bank_current_cashflow, aes(x = current_net_month_cashflow_bucket)) +
    geom_col(aes(y = churn_rate), fill = "#8B2500") +
    geom_line(aes(y = churn_rate, group = 1), color = "red", size = 1.5) +
    geom_point(aes(y = churn_rate), color = "red", size = 2.0) +
    labs(
      title = "Churn Rate(Ave) and Cash flow",
      x = "Cash flow",
      y = "Churn Rate"
    ) +
  
    theme_minimal()+
  
  theme(
    plot.title   = element_text(size = 15, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text.x  = element_text(angle = 45, hjust = 1)
  )


# Balance and Vintage(Heat_map)

heatmap_data <- bank %>%
  group_by(current_balance_bucket, vintage_bucket) %>%
  summarise(
    churn_rate     = mean(churn, na.rm = TRUE)
  )

churn_heatmap =  ggplot(heatmap_data,
         aes(x = vintage_bucket,
             y = current_balance_bucket,
             fill = churn_rate)) +
    geom_tile(color = "black") +
    
    scale_fill_gradient(
      low  = "white",
      high = "red",
      name = "Churn Rate",
      labels = percent_format(accuracy = 1)
    ) +
    
    labs(
      title = "Churn Rate by Balance and Customer tenure",
      x = "Customer tenure",
      y = "Current Balance"
    ) +
    theme_minimal() +
    theme(
      plot.title   = element_text(size = 15, face = "bold", hjust = 0.5),
      axis.title.x = element_text(size = 14),
      axis.title.y = element_text(size = 14),
      axis.text.x  = element_text(angle = 45, hjust = 1)
    )



#Credit and Cash flow (Scatter plot)

credit_cashflow_scatter <- ggplot(
  bank,
  aes(
    x = current_month_credit,
    y = current_net_month_cashflow
  )
) +
  geom_point(
    color = "#4E79A7",
    size = 1.3
  ) +
  scale_x_log10(labels = scales::comma) +
  scale_y_log10(labels = scales::comma) +
  labs(
    title = "Relationship Between Incoming transactions and Cash flow",
    x = "Monthly Cash flow",
    y = "Monthly Incoming transactions"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 15, face = "bold"),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )



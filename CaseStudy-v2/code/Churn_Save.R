ggsave(
  filename = "Gender_Pie.png",
  plot = gender_pie,
  width = 4, 
  height = 4,
  dpi = 300
)

ggsave(
  filename = "Occupation_Pie.png",
  plot = Occupation_pie,
  width = 4, 
  height = 4,
  dpi = 300
)

ggsave(
  filename = "Vintage_DonutPie.png",
  plot = Vintage_pie,
  width = 4, 
  height = 4,
  dpi = 300
)

ggsave(
  filename = "Cashflow_Bar.png",
  plot = Cashflow_bar,
  width = 8, 
  height = 6,
  dpi = 300
)

ggsave(
  filename = "Churn_Heatmap.png",
  plot = churn_heatmap,
  width = 9, 
  height = 6,
  dpi = 300
)

ggsave(
  filename = "Credit_Cashflow_Scatterplot.png",
  plot = credit_cashflow_scatter,
  width = 9, 
  height = 6,
  dpi = 300
)
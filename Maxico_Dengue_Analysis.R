library(readr)
library(ggplot2)


setwd("C:/Users/hp/Dropbox/dengue_seasonality")
dengue <- read_csv("dengue cases data/Dengue MX.csv")


dengue$date <- as.Date(dengue$date, format="%d-%m-%Y")

ggplot(dengue, aes(x=date, y = cases)) +
  geom_line(color = "green") +
  geom_point(size = 1.5) +
  labs(
    title = "Weekly Dengue Cases in Maxico (2018-2023)",
    x = "Date",
    y = "Number of Cases"
  ) +
  theme_minimal()

ggsave("Maxico_Dengue_cases.pdf",height = 4,width = 10)

library(readr)
library(ggplot2)
library(dplyr)


setwd("C:/Users/hp/Dropbox/dengue_seasonality")
dengue <- read_csv("dengue cases data/Dengue PE.csv")

 
dengue$Date <- as.Date(
  paste(dengue$year, dengue$epiweek, 1),
  format = "%Y %U %u"
)


dengue <- dengue %>% arrange(Date)


ggplot(dengue, aes(x = Date, y = cases)) +
  geom_line(color = "darkred", linewidth = 0.8) +
  labs(
    title = "Weekly Dengue Cases in Peru (2014–2023)",
    x = "Date",
    y = "Number of Cases"
  ) +
  theme_minimal()

ggsave("Peru_Dengue_cases.pdf",height = 4,width = 10)

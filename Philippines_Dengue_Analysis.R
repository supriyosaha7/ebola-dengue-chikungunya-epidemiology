library(readr)
library(ggplot2)
library(dplyr)

setwd("C:/Users/hp/Dropbox/dengue_seasonality")
dengue <- read_csv("dengue cases data/Dengue PH.csv")


dengue$week <- as.numeric(gsub("MW", "", dengue$week))

dengue$Date <- as.Date(
  paste(dengue$year, dengue$week, 1),
  format = "%Y %U %u"
)


dengue <- dengue %>% arrange(Date)

ggplot(dengue, aes(x = Date, y = cases)) +
  geom_line(color = "blue", linewidth = 0.8) +
  geom_point(size = 1) +
  labs(
    title = "Weekly Dengue Cases in Philippines (2018–2022)",
    x = "Date",
    y = "Number of Cases"
  ) +
  theme_minimal()
ggsave("Philippines_Dengue_cases.pdf",height = 4,width = 10)

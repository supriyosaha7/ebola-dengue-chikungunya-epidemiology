library(readr)
library(dplyr)
library(ggplot2)

# ---- Setup ----
setwd("C:/Users/hp/Dropbox/dengue_seasonality")
dengue <- read_csv("dengue cases data/Dengue BD.csv")

# ---- Build a proper Date column (year + month name -> first of month) ----
dengue$months <- factor(
  dengue$months,
  levels = c("Jan","Feb","Mar","Apr","May","Jun",
             "Jul","Aug","Sep","Oct","Nov","Dec")
)

dengue$Date <- as.Date(
  paste(dengue$year, dengue$months, "01"),
  format = "%Y %b %d"
)

# ---- Sort chronologically ----
dengue <- dengue %>% arrange(Date)

# ---- Plot: x = date, y = number of cases ----
ggplot(dengue, aes(x = Date, y = cases)) +
  geom_line(color = "firebrick", linewidth = 0.8) +
  geom_point(size = 1) +
  labs(
    title = "Monthly Dengue Cases in Bangladesh (2000–2023)",
    x = "Date",
    y = "Number of Cases"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

ggsave("Bangladesh_Dengue_cases.pdf", height = 4, width = 10)

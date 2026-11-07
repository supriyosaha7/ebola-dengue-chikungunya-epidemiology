library(readr)
library(ggplot2)
library(dplyr)


setwd("C:/Users/hp/Dropbox/dengue_seasonality")
dengue <- read_csv("dengue cases data/Dengue TH.csv")


dengue$Date <- as.Date(
  paste(dengue$year,
        match(dengue$months,
              c("Jan","Feb","Mar","Apr","May","Jun",
                "Jul","Aug","Sep","Oct","Nov","Dec")),
        "01",
        sep = "-"
  )
)


dengue <- dengue %>% arrange(Date)

ggplot(dengue, aes(x = Date, y = cases)) +
  geom_line(color = "darkorange", linewidth = 1) +
  labs(
    title = "Monthly Dengue Cases in Thailand (2010–2023)",
    x = "Date",
    y = "Number of Cases"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

ggsave("Thailand_Dengue_cases.pdf",height = 4,width = 10)
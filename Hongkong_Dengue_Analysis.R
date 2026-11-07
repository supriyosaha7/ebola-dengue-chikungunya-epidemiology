library(tidyr)
library(ggplot2)
library(readr)

setwd("C:/Users/hp/Dropbox/dengue_seasonality")
dengue <- read_csv("dengue cases data/Dengue HK.csv")

dengue$Date <- as.Date(
  paste(dengue$year, dengue$Month, "01"),
  format = "%Y %b %d"
)

dengue_long <- pivot_longer(
  dengue,
  cols = c(Imported.Cases, Local.Cases),
  names_to = "Type",
  values_to = "Cases"
)

ggplot(dengue_long,
       aes(x = Date, y = Cases,
           color = Type,
           group = Type)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Imported vs Local Dengue Cases in Hong Kong",
    x = "Date",
    y = "Number of Cases"
  ) +
  theme_minimal()

ggsave("Hongkong_Dengue_cases.pdf",height = 4,width = 10)

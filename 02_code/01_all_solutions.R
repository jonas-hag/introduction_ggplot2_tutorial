# Step 1 - read in the data
cytokine_data <- read.table(
  file = "03_data/example_cytokines.csv",
  header = TRUE,
  sep = ";"
)

# look at the data
str(cytokine_data)
View(cytokine_data)

# Step 2 - basic box plot
library(magrittr)
library(ggplot2)

cytokine_data %>% 
  ggplot() +
  aes(y = TNF_alpha) +
  geom_boxplot()

# Step 3 - make the plot prettier
cytokine_data %>% 
  ggplot() +
  aes(y = TNF_alpha) +
  geom_boxplot() +
  theme(
    axis.ticks.x = element_blank(),
    axis.text.x = element_blank()
  ) +
  labs(
    x = "TNF-alpha",
    y = "concentration in pg/ml"
  )

# Step 4 - bring the data into the long format
library(tidyr)
cytokine_data_long <- cytokine_data %>% 
  pivot_longer(
    cols = TNF_alpha:IL_17A,
    names_to = "assay",
    values_to = "concentration"
  )

# Step 5 - plot several boxplots
cytokine_data_long %>% 
  ggplot() +
  aes(
    x = assay,
    y = concentration
  ) +
  geom_boxplot()

# Step 6 - make the plot prettier
cytokine_data_long %>% 
  ggplot() +
  aes(
    x = assay,
    y = concentration,
    fill = assay
  ) +
  geom_boxplot() +
  ylab("concentration in pg/ml")

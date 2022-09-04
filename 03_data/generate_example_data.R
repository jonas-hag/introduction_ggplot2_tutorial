# simulate some cytokine data
set.seed(832)

dataset <- data.frame(
  ID = 1:50,
  TNF_alpha = abs(rnorm(50, mean = 15, sd = 2)),
  IL_8 = abs(rnorm(50, mean = 24, sd = 3)),
  IL_1b = abs(rnorm(50, mean = 2, sd = 1)),
  IL_17A = abs(rnorm(50, mean = 20, sd = 1.5))
)

dataset[c(2, 40, 29), "IL_17A"] <- c(9.3, 30, 32)
dataset[c(33), "IL_1b"] <- c(12.4)
dataset[c(3, 39, 29, 11), "TNF_alpha"] <- c(2.3, 7, 28.4, 30)

write.table(dataset, file = "03_data/example_cytokines.csv", sep = ";",
            row.names = FALSE)

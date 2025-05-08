# Load necessary libraries
install.packages(c("DMwR", "ggplot2", "dplyr", "MASS", "testthat"))
library(DMwR)
library(ggplot2)
library(dplyr)
library(MASS)
library(testthat)

# Q1 - Simulating Random Data, Visualization, and Hypothesis Testing
## a) Simulate a sample of 100 random data points from a normal distribution
set.seed(123)  # For reproducibility
sample_data <- rnorm(100, mean = 100, sd = 5)

## b) Visualize the vector created using different plots
# Histogram
hist(sample_data, main = "Histogram of Simulated Data", xlab = "Values", col = "lightblue")
# Boxplot
boxplot(sample_data, main = "Boxplot of Simulated Data", col = "lightgreen")

## c) Test the hypothesis that the mean equals 100
t_test_result <- t.test(sample_data, mu = 100)
print(t_test_result)

## d) Use Wilcoxon test to test the hypothesis that mean equals 90
wilcox_test_result <- wilcox.test(sample_data, mu = 90)
print(wilcox_test_result)

# Q2 - Algae Dataset from DMwR
## Load the algae dataset
data("Algae", package = "DMwR")

## a) Create a graph to show the distribution of algae a6
ggplot(Algae, aes(x = a6)) +
  geom_histogram(binwidth = 0.1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Algae a6", x = "Algae a6", y = "Frequency")

## b) Show the distribution of the values of size 3
ggplot(Algae, aes(x = size3)) +
  geom_histogram(binwidth = 0.1, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of Size 3", x = "Size 3", y = "Frequency")

## c) Check visually if oPO4 follows a normal distribution
ggplot(Algae, aes(x = oPO4)) +
  geom_histogram(binwidth = 0.1, fill = "lightcoral", color = "black") +
  labs(title = "Distribution of oPO4", x = "oPO4", y = "Frequency")

## d) Produce a graph to understand how NO3 is distributed across river sizes
ggplot(Algae, aes(x = factor(size), y = NO3)) +
  geom_boxplot(fill = "gold", color = "black") +
  labs(title = "Distribution of NO3 Across River Sizes", x = "River Size", y = "NO3")

## e) Visualize how algae a1 varies with the speed of the river
ggplot(Algae, aes(x = speed, y = a1)) +
  geom_point(color = "purple") +
  labs(title = "Algae a1 vs River Speed", x = "Speed of River", y = "Algae a1")

## f) Visualize the relationship between the frequencies of algae a1 and a6
ggplot(Algae, aes(x = a1, y = a6)) +
  geom_point(color = "blue") +
  labs(title = "Relationship Between Algae a1 and Algae a6", x = "Algae a1", y = "Algae a6")

# Q3 - Read Coweeta.CSV File and Perform Tasks
## Load data
coweeta_data <- read.csv("Coweeta.CSV")  # Replace with actual file path

## a) Count the number of observations per species
species_count <- table(coweeta_data$species)
print(species_count)

## b) Subset data to include only species with at least 10 observations
species_filter <- species_count[species_count >= 10]
subset_data <- subset(coweeta_data, species %in% names(species_filter))
print(subset_data)

## c) Scatter plot of biomass versus height with colour by species
ggplot(subset_data, aes(x = height, y = biomass, color = species)) +
  geom_point(shape = 15, size = 3) +
  labs(title = "Biomass vs Height by Species", x = "Height", y = "Biomass")

## d) Log-transform biomass and redraw the plot
subset_data$log_biomass <- log(subset_data$biomass)
ggplot(subset_data, aes(x = height, y = log_biomass, color = species)) +
  geom_point(shape = 15, size = 3) +
  labs(title = "Log-transformed Biomass vs Height by Species", x = "Height", y = "Log(Biomass)")

# Q4 - Pearson and Spearman Correlation for Mammals Dataset
data("mammals", package = "MASS")

## a) Find Pearson and Spearman correlation coefficients
pearson_corr <- cor(mammals$body, mammals$brain, method = "pearson")
spearman_corr <- cor(mammals$body, mammals$brain, method = "spearman")
print(paste("Pearson Correlation: ", pearson_corr))
print(paste("Spearman Correlation: ", spearman_corr))

## b) Plot the data using the plot command
plot(mammals$body, mammals$brain, main = "Body Weight vs Brain Weight", xlab = "Body Weight", ylab = "Brain Weight")

## c) Plot the logarithm (log) of each variable
plot(log(mammals$body), log(mammals$brain), main = "Log(Body Weight) vs Log(Brain Weight)", xlab = "Log(Body Weight)", ylab = "Log(Brain Weight)")

# Q5 - US Cereal Data from MASS Library
data("UScereal", package = "MASS")
attach(UScereal)

## a) Relationship between manufacturer and shelf
ggplot(UScereal, aes(x = manufacturer, fill = shelf)) +
  geom_bar(position = "fill") +
  labs(title = "Manufacturer and Shelf Relationship", x = "Manufacturer", y = "Proportion of Cereals on Shelf")

## b) Relationship between fat and vitamins
ggplot(UScereal, aes(x = fat, y = vitamins)) +
  geom_point() +
  labs(title = "Fat vs Vitamins", x = "Fat", y = "Vitamins")

## c) Relationship between fat and shelf
ggplot(UScereal, aes(x = fat, y = shelf)) +
  geom_point() +
  labs(title = "Fat vs Shelf", x = "Fat", y = "Shelf")

## d) Relationship between carbohydrates and sugars
ggplot(UScereal, aes(x = carbohydrates, y = sugars)) +
  geom_point() +
  labs(title = "Carbohydrates vs Sugars", x = "Carbohydrates", y = "Sugars")

## e) Relationship between fibre and manufacturer
ggplot(UScereal, aes(x = manufacturer, y = fibre)) +
  geom_boxplot() +
  labs(title = "Fibre vs Manufacturer", x = "Manufacturer", y = "Fibre")

## f) Relationship between sodium and sugars
ggplot(UScereal, aes(x = sodium, y = sugars)) +
  geom_point() +
  labs(title = "Sodium vs Sugars", x = "Sodium", y = "Sugars")

# Q6 - Simulations
## a) Simulate binomial data twice
binom_sim_1 <- rbinom(100, size = 100, prob = 0.5)
binom_sim_2 <- rbinom(100, size = 100, prob = 0.5)

## b) Simulate normal data twice
norm_sim_1 <- rnorm(10, mean = 10, sd = 10)
norm_sim_2 <- rnorm(10, mean = 100, sd = 100)

## Comparison of binomial simulations
print("Binomial Simulation 1:")
print(binom_sim_1)
print("Binomial Simulation 2:")
print(binom_sim_2)

## Comparison of normal simulations
print("Normal Simulation 1:")
print(norm_sim_1)
print("Normal Simulation 2:")
print(norm_sim_2)

# Q7 - Create Medicines Database and Interactive App (Shiny)
library(shiny)

# Sample database (replace with actual data)
medicines <- data.frame(
  name = c("MedicineA", "MedicineB", "MedicineC"),
  composition = c("Composition1", "Composition2", "Composition1"),
  price = c(10, 20, 15)
)

ui <- fluidPage(
  textInput("medicine", "Enter Medicine Name", ""),
  actionButton("find", "Find Alternative"),
  tableOutput("result")
)

server <- function(input, output) {
  output$result <- renderTable({
    req(input$find)
    alternative <- subset(medicines, composition == input$medicine)
    return(alternative)
  })
}

shinyApp(ui = ui, server = server)

# Q8 - Create Songs Database and Interactive App (Shiny)
songs <- data.frame(
  song_name = c("Song1", "Song2", "Song3"),
  mood = c("Happy", "Sad", "Happy"),
  online_link_play_song = c("link1", "link2", "link3")
)

ui2 <- fluidPage(
  textInput("mood_input", "Enter Mood", ""),
  actionButton("search", "Find Songs"),
  tableOutput("song_result")
)

server2 <- function(input, output) {
  output$song_result <- renderTable({
    req(input$search)
    filtered_songs <- subset(songs, mood == input$mood_input)
    return(filtered_songs)
  })
}

shinyApp(ui = ui2, server = server2)

# Q9 - Create Basic Statistics Package (Function Example)
basic_stats <- function(x) {
  mean_value <- mean(x)
  sd_value <- sd(x)
  return(list(mean = mean_value, sd = sd_value))
}

# Use the function
data_vector <- rnorm(100, mean = 50, sd = 10)
result_stats <- basic_stats(data_vector)
print(result_stats)


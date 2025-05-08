# Installing, loading and using packages: Read/write data from/in files, extracting data from
# web-sites, Clean data, Transform data by sorting, adding/removing new/existing columns,
# centring, scaling and normalizing the data values, converting types of values, using string in-built
# functions, Statistical analysis of data for summarizing and understanding data, Visualizing data
# using scatter plot, line plot, bar chart, histogram and box plot

# Installing and Loading Required Packages
install.packages(c("dplyr", "ggplot2", "readr", "httr", "tidyr"))
library(dplyr)
library(ggplot2)
library(readr)
library(httr)
library(tidyr)

# 1. Read and Write Data from/into Files

# Read data from a CSV file (example)
# Note: Replace "your_data.csv" with an actual file path if testing on your local machine
data <- read_csv("your_data.csv")
print("Data from CSV:")
print(head(data))

# Write data to a CSV file
write_csv(data, "output_data.csv")

# 2. Extract Data from Websites (Web Scraping)

# Example: Extract HTML content from a URL
url <- "https://example.com"
web_data <- GET(url)
print("Web Data from URL:")
print(content(web_data, "text"))

# 3. Clean Data (Handle Missing Values, Remove Duplicates)

# Example: Remove rows with missing values
cleaned_data <- data %>%
  filter(!is.na(column_name))  # Replace 'column_name' with your actual column name

# Remove duplicate rows
cleaned_data <- distinct(cleaned_data)

# 4. Transform Data (Sorting, Adding/Removing Columns, Centering, Scaling, Normalizing)

# Sorting Data by a Column (ascending)
sorted_data <- cleaned_data %>%
  arrange(column_name)  # Replace 'column_name' with the actual column name

# Adding a new column
sorted_data <- sorted_data %>%
  mutate(new_column = column_name * 2)  # Example: Creating a new column based on existing ones

# Removing a column
sorted_data <- sorted_data %>%
  select(-column_to_remove)  # Replace 'column_to_remove' with the actual column name to remove

# Centering data (subtract mean from each value)
centered_data <- scale(sorted_data$column_name, center = TRUE, scale = FALSE)

# Scaling data (divide by standard deviation)
scaled_data <- scale(sorted_data$column_name, center = FALSE, scale = TRUE)

# Normalizing data (min-max normalization)
normalized_data <- (sorted_data$column_name - min(sorted_data$column_name)) / 
  (max(sorted_data$column_name) - min(sorted_data$column_name))

# 5. Convert Types of Values

# Convert a column to numeric
sorted_data$column_name <- as.numeric(sorted_data$column_name)

# Convert a column to factor (categorical)
sorted_data$factor_column <- as.factor(sorted_data$factor_column)

# 6. String Functions

# Convert to lowercase
sorted_data$string_column <- tolower(sorted_data$string_column)

# Extract substring (e.g., first 5 characters)
sorted_data$substring_column <- substr(sorted_data$string_column, 1, 5)

# 7. Statistical Analysis of Data

# Basic Summary Statistics
summary_stats <- summary(sorted_data$column_name)
print("Summary Statistics:")
print(summary_stats)

# Mean, Median, and Standard Deviation
mean_value <- mean(sorted_data$column_name, na.rm = TRUE)
median_value <- median(sorted_data$column_name, na.rm = TRUE)
sd_value <- sd(sorted_data$column_name, na.rm = TRUE)

print(paste("Mean:", mean_value))
print(paste("Median:", median_value))
print(paste("Standard Deviation:", sd_value))

# 8. Data Visualization

# Scatter Plot (X vs Y)
ggplot(sorted_data, aes(x = column_x, y = column_y)) +
  geom_point() +
  ggtitle("Scatter Plot")

# Line Plot
ggplot(sorted_data, aes(x = column_x, y = column_y)) +
  geom_line() +
  ggtitle("Line Plot")

# Bar Chart (for categorical data)
ggplot(sorted_data, aes(x = factor_column)) +
  geom_bar() +
  ggtitle("Bar Chart")

# Histogram (for numerical data)
ggplot(sorted_data, aes(x = column_name)) +
  geom_histogram(bins = 30) +
  ggtitle("Histogram")

# Box Plot (for numerical data)
ggplot(sorted_data, aes(y = column_name)) +
  geom_boxplot() +
  ggtitle("Box Plot")

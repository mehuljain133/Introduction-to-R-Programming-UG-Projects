# Introduction: R interpreter, Introduction to major R data structures like vectors, matrices, arrays, list and data frames, Control Structures, vectorized if and multiple selection, functions.

# Introduction to R Programming

# 1. R Interpreter
# The R interpreter can be used directly in the console or through an IDE like RStudio.
# Example of running a simple operation:
print("Hello, R Programming!")

# 2. Major Data Structures

# Vectors: A vector is a basic data structure in R, which can hold elements of the same type.
vector_example <- c(1, 2, 3, 4, 5)
print("Vector Example:")
print(vector_example)

# Matrices: A matrix is a two-dimensional data structure with rows and columns.
matrix_example <- matrix(1:9, nrow = 3, ncol = 3)
print("Matrix Example:")
print(matrix_example)

# Arrays: An array is an n-dimensional generalization of matrices.
array_example <- array(1:12, dim = c(2, 3, 2))
print("Array Example:")
print(array_example)

# Lists: A list can hold elements of different types and structures.
list_example <- list(name = "John", age = 25, scores = c(90, 85, 88))
print("List Example:")
print(list_example)

# Data Frames: A data frame is like a table or a spreadsheet and is used for storing data frames.
data_frame_example <- data.frame(Name = c("Alice", "Bob", "Charlie"), Age = c(25, 30, 35))
print("Data Frame Example:")
print(data_frame_example)

# 3. Control Structures

# If-Else statement
x <- 10
if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is less than or equal to 5")
}

# For Loop
for (i in 1:5) {
  print(paste("Iteration:", i))
}

# While Loop
y <- 1
while (y <= 3) {
  print(paste("While loop iteration:", y))
  y <- y + 1
}

# 4. Vectorized if Statement
# R allows vectorized operations, meaning we can perform operations on entire vectors.
x_vector <- c(10, 20, 30, 40)
y_vector <- ifelse(x_vector > 20, "Greater than 20", "Less than or equal to 20")
print("Vectorized if Example:")
print(y_vector)

# 5. Functions

# Define a simple function
add_numbers <- function(a, b) {
  result <- a + b
  return(result)
}

# Call the function
sum_result <- add_numbers(5, 7)
print(paste("Sum of 5 and 7 is:", sum_result))

# Another function with default parameters
multiply_numbers <- function(a, b = 2) {
  result <- a * b
  return(result)
}

# Call the function with one argument (b will default to 2)
multiplication_result <- multiply_numbers(5)
print(paste("5 multiplied by default value 2 is:", multiplication_result))

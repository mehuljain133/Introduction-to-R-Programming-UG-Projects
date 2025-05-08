# Building Packages

# Load necessary packages
install.packages(c("devtools", "roxygen2", "testthat"))
library(devtools)
library(roxygen2)
library(testthat)

# 1. Create Package Directory
create("myPackage")  # Replace "myPackage" with your package name

# 2. Write Functions in R/ Directory
# Open R/myfunctions.R and write your functions
writeLines('
# Function to square a number
square_number <- function(x) {
  return(x^2)
}

# Function to add two numbers
add_numbers <- function(a, b) {
  return(a + b)
}
', "myPackage/R/myfunctions.R")

# 3. Document Functions Using Roxygen2
# Add Roxygen2 comments to your functions in R/myfunctions.R
writeLines('
#\' Square a Number
#\'
#\' This function returns the square of a given number.
#\' @param x A numeric value.
#\' @return A numeric value, the square of the input.
#\' @export
square_number <- function(x) {
  return(x^2)
}

#\' Add Two Numbers
#\'
#\' This function returns the sum of two numbers.
#\' @param a A numeric value.
#\' @param b A numeric value.
#\' @return A numeric value, the sum of a and b.
#\' @export
add_numbers <- function(a, b) {
  return(a + b)
}
', "myPackage/R/myfunctions.R")

# 4. Create DESCRIPTION File
writeLines('
Package: myPackage
Type: Package
Title: Simple Functions
Version: 0.1.0
Author: Your Name
Maintainer: your_email@example.com
Description: This package provides basic functions for arithmetic operations.
License: MIT + file LICENSE
Depends: R (>= 3.5.0)
', "myPackage/DESCRIPTION")

# 5. Create NAMESPACE File
writeLines('
export(square_number)
export(add_numbers)
', "myPackage/NAMESPACE")

# 6. Generate Documentation with roxygen2
# Run roxygen2 to generate the documentation files in the "man" directory
roxygen2::roxygenise("myPackage")

# 7. Create a test file in the tests/testthat directory
dir.create("myPackage/tests/testthat", recursive = TRUE)
writeLines('
test_that("square_number works", {
  expect_equal(square_number(4), 16)
  expect_equal(square_number(0), 0)
})

test_that("add_numbers works", {
  expect_equal(add_numbers(2, 3), 5)
  expect_equal(add_numbers(-1, 1), 0)
})
', "myPackage/tests/testthat/test-myfunctions.R")

# 8. Build and Install the Package Locally
install("myPackage")

# 9. Run Tests
test_dir("myPackage/tests/testthat/")

# 10. Example of Using the Package
library(myPackage)

# Testing the functions
print(square_number(5))  # Should return 25
print(add_numbers(3, 4))  # Should return 7

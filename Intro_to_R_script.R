# Intro to R Lesson
# Oct 13rd, 2022

#### Part 1.1 Introduction to R and RStudio ####

# Interacting with R

## I am adding 3 and 5. R is fun!
3+5

# Assignment operator
x <- 3

# Variables
y <- 5
# Print the value of this variable
y

x + y

# Assign the result to another variable called "number"
number <- x + y

# Change the value of x to 5 and check "number"
x <- 5
number <-  x + y

# Change the value of y to 10 and check "number"
y <- 10
number <- x + y

#### Part 1.2 R Syntax and Data Structure ####

# Vectors -  a collection of values (need to be same data type)

# Create a numeric vector and store the vector as a variable called "glengths"
glengths <- c(4.6, 3000, 50000)
glengths

# Create a character vector and store the vector as a variable called "species"
species <- c("ecoli", "human", "corn")
species

# Create a vector of numeric and character values by using two vectors above, call this vector "combined"
combined <- c(glengths, species)
# All elements in this vector are turned into character

# Factors - used to store categorical data; factors are built on top of integer vectors

# Create a character vector and store the vector as a variable called 'expression'
expression <- c("low", "high", "medium", "high", "low", "medium", "high")

# Turn 'expression' vector into a factor
expression <- factor(expression)

# Create a character vector and store the vector as a variable called "samplegroup"
samplegroup <- c('CTL', 'CTL', 'CTL', 'KO', 'KO', 'KO', 'OE', 'OE', 'OE')

# Turn 'samplegroup' vector into a factor
samplegroup <- factor(samplegroup)

# Data Frame - a collection of vectors of the same length and each vector represents a column; each vector can be of a different data type

# Create a data frame and store it as a variable called 'df'
df <- data.frame(species, glengths)
# 3 obs means 3 rows; 2 variables means 2 columns
df

# Create a data frame called favorite_books with the following vectors as columns:
titles <- c("Catch-22", "Pride and Prejudice", "Nineteen Eighty Four")
pages <- c(453, 432, 328)
df_new <- data.frame(titles, pages)
df_new

# Lists - a data structure that can hold any number of any types of other data structures
list1 <- list(species, df, number)
list1

# Create a list called list2 containing species, glengths, and number
list2 <- list(species, glengths, number)
list2

#### Part 1.3 Functions and Arguments ####

# function format - function_name(input)

# use the function to add elements to an existing vector
glengths <- c(glengths, 90) # adding at the end	
glengths <- c(30, glengths) # adding at the beginning
glengths

# try finding the square root of 81
sqrt(81)
sqrt(glengths)

# try "round" function
round(3.14159)

# Seeking help on arguments for functions
?round
args(round)
example("round")

round(3.14159, digits=2)

# try "mean" function
?mean
# calculate the mean value of glengths
mean(glengths)

# Create a new vector called "test"
test <- c(1, NA, 2, 3, NA, 4)
# calculate the mean value of test
mean(test, na.rm = TRUE)
# sort glengths in descending order
?sort
sort(glengths, decreasing = TRUE)

# User-defined functions
# The structure of a function is given below:
# name_of_function <- function(argument1, argument2) {
# statements or code that does something
# return(something)
# }

# Create a function called "square_it
square_it <- function(x) {
  square <- x * x
  return(square)
}

# Apply the created function above
square_it(5)

# Create a function called "multiply_it
multiply_it <- function(x, y) {
  multiply <- x * y
  return(multiply)
}
multiply_it(x=4, y=6)

#### Part 1.4 Reading in and inspecting data ####

# check read.csv function
?read.csv

# Create a data frame by reading in the file
metadata <- read.csv(file="data/mouse_exp_design.txt")

# Create a data frame by reading in the file - exercise
proj_summary <- read.table(file='data/project-summary.txt', header= TRUE, row.names = NULL)

# Inspecting data structures
metadata
head(metadata)

class(glengths)
# [1] "numeric"
class(metadata)
# [1] "data.frame"

summary(proj_summary)
# rRNA_rate Median :0.005345

length(samplegroup)
# length is 9 

dim(proj_summary)
# dimensions are 9, 9

rownames(metadata)
# output is sample1 to sample12

colnames(proj_summary)
?colnames
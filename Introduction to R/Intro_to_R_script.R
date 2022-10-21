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

#### Part 2.1 Data wrangling: subsetting vectors and factors ####
# create a vector called age
age <- c(15, 22, 45, 52, 73, 81)

# select the 5th value of this vector (note: index starting at 1)
age[5]

# select values except for the 5th
age[-5]

# select more than one element
age[c(3,5,6)]

# OR create a vector first then select
idx <- c(3,5,6)
age[idx]

# elect a sequence of continuous values from a vector
age[1:4]


# Create a vector called alphabets with the following letters, C, D, X, L, F
alphabest <- c('C', 'D', 'X', 'L', 'F')

# only display C, D and F
alphabest[c(1, 2, 5)]

# display all except X
alphabest[-3]

# display the letters in the opposite order (F, L, X, D, C)
rev(alphabest)

# use age vector
age

# know if each element in our age vector is greater than 50
age > 50

# Select all values in the age vector over 50 or age less than 18
age > 50 | age < 18
age[age > 50 | age < 18]

# OR create a vector first then select
idx <- age > 50 | age < 18
age[idx]

# use the which() function to output the indices where the values are TRUE
which(age > 50 | age < 18)
age[which(age > 50 | age < 18)]

# OR create a vector first then select
idx_num <- which(age > 50 | age < 18)
age[idx_num]

# extract the values of the factor with high expression
expression[expression == "high"]

# Extract only those elements in samplegroup that are not KO 
samplegroup
samplegroup[samplegroup != 'KO']

# To view the integer assignments under the hood you can use str()
expression
str(expression)

# relevel the categories
expression <- factor(expression, levels=c("low", "medium", "high"))
expression
str(expression)

# relevel samplegroup vector, relevel it such that KO is the first level followed by CTL and OE
samplegroup
samplegroup <- factor(samplegroup, levels=c('KO', 'CTL', 'OE'))
str(samplegroup)

#### Part 2.2 Packages and libraries ####
# can check what libraries are loaded in your current R session
sessionInfo()

# OR use
search()

# install ggplot package from CRAN
install.packages('ggplot2')

# install BiocManager from Bioconductor
# install.packages("BiocManager")
# have the code to install ggplot2, through Bioconductor
# BiocManager::install("ggplot2")
# install packages from source
# install.packages("~/Downloads/ggplot2_1.0.1.tar.gz", type="source", repos=NULL)

#  load the library into your R session for use
library(ggplot2)
# check where the package is loaded
sessionInfo()
search()

# install tidyverse package through CRAN
install.packages('tidyverse')
search()
sessionInfo()

#### Part 2.3 Data wrangling: data frames, matrices and lists ####
# Extract value 'Wt' from metadata
metadata
metadata[1, 1]

# extract the value 1 from the first row and third column
metadata[1, 3]

# select based on rows - provide the index for the rows and leave the columns index blank
# Extract third row
metadata[3, ]

# selecting specific columns from the data frame - the rows are left blank
# Extract third column
metadata[ , 3]

# keep our single column as a data frame
# Extract third column as a data frame
metadata[ , 3, drop = FALSE]

# Dataframe containing first two columns
metadata[ , 1:2]

# Data frame containing first, third and sixth rows
metadata[c(1,3,6), ]

# Extract the celltype column for the first three samples
metadata[c("sample1", "sample2", "sample3") , "celltype"]

# Check column names of metadata data frame
colnames(metadata)

# Check row names of metadata data frame
rownames(metadata)

# Extract a single column
# Extract the genotype column
metadata$genotype

# Extract the first five values/elements of the genotype column
metadata$genotype[1:5]

# Return a data frame with only the genotype and replicate column values for sample2 and sample8
metadata[c('sample2', 'sample8'), 'replicate']

# Return the fourth and ninth values of the replicate column
metadata$replicate[c(4,9)]

# Extract the replicate column as a data frame
metadata[ , 3, drop = FALSE]

# return only those rows of the data frame with the celltype column having a value of typeA
metadata$celltype == "typeA"
# save these values to a variable
logical_idx <- metadata$celltype == "typeA"
logical_idx

# extract the rows that correspond to the TRUE values from the metadata data frame
metadata[logical_idx, ]

#  find the indices where the celltype is typeA within the metadata dataframe
which(metadata$celltype == "typeA")
# save our indices for which rows the logical expression is true to a variable we’ll call idx
idx <- which(metadata$celltype == "typeA")
idx
# use these indices to indicate the rows that we would like to return by extracting that data as we have previously
metadata[idx, ]

# Extract the rows of the metadata data frame for only the replicates 2 and 3
which(metadata$replicate > 1)
# save those indices to a variable and use that variable to extract those corresponding rows from the metadata table
idx <- which(metadata$replicate > 1)
metadata[idx, ]
# OR use nesting directly
metadata[which(metadata$replicate > 1), ]

# save this output to a variable called sub_meta
sub_meta <- metadata[which(metadata$replicate > 1), ]
sub_meta

# ubset the metadata dataframe to return only the rows of data with a genotype of KO
sub_meta_geno <- metadata[metadata$genotype == 'KO', ]
sub_meta_geno

# use List1 to select a specific component of a list
list1
list1[[2]]

# With the class function we can check if that is what we retrieve
comp2 <- list1[[2]]
class(comp2)
# class shown as data frame

# reference what is inside the component by adding an additional bracket
list1[[1]]
list1[[1]][1]

# Create a list named random with the following components: metadata, age, list1, samplegroup, and number
random <- list(metadata, age, list1, samplegroup, number)
# Extract the samplegroup component
random[[4]]
samplegroup

# Adding names to components of a list
names(list1) 

# Name components of the list
list1
names(list1) <- c("species", "df", "number")
names(list1)

# # Extract 'df' component
list1$df

# Set names for the random list you created in the last exercise
names(random) <- c('metadata', 'age', 'list1', 'samplegroup', 'number')
# Extract the age component using the $ notation
random$age

#Project - Creating An Efficient Data Analysis Workflow

library(tidyverse)
library(readr)
library(dplyr)
books <- read_csv(file = "~/desktop/book_reviews.csv")

#dim
dim(books)

#find columns 
colnames(books)

# type of data
typeof(books) 

# What are the column types?
for (col in colnames(books)) {
  typeof(books[[col]])
}

#what are the unique values in the column 
for (col in colnames(books)) {
  print("Unique values in the column:")
  print(col)
}

#remove null reviews
book_reviewss <- books %>%
  filter(!(is.na(books)))

dim(book_reviewss)

#changing labels

book_reviewss <- book_reviewss %>%
  mutate(
    state = case_when(
      state == "California" ~ "CA",
      state == "Texas" ~ "TX",
      state == "Florida" ~ "FL",
      state == "New York" ~ "NY",
      TRUE ~ state
    )

  )

# Transforming the Review Data  
book_reviewss <- book_reviewss %>%
  mutate(
    review_num = case_when(
      review == "Poor"~ 1,
      review == "Fair"~ 2,
      review == "Good"~ 3,
      review == "Great"~ 4,
      review == "Excellent" ~ 5
    ),
is_high_review <- if_else(review_num >= 4, TRUE, FALSE)
  )

# Analyzing The Data
  book_reviewss %>%
  group_by(book) %>%
  summarize(
    purchased = n()
  ) %>% 
  arrange(-purchased)
 










  





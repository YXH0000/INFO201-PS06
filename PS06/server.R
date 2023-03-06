library(shiny)
library(dplyr)
library(reader)
library(ggplot2)

setwd("C:/Users/think/Documents/Academics/INFO201/INFO201-PS06/PS06")
getwd()

uah <- read.delim("UAH-lower-troposphere-long.csv.bz2")
head(uah)

server <- function(input, output) {
  # Return the number of rows in the UAH data
  output$num_rows <- renderText({
    nrow(uah)
  })
  
  # Return the first 10 rows of the UAH data
  output$sample_data <- renderTable({
    uah[sample(nrow(uah), 10), ]
  })
  
}

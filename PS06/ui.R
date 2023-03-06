library(shiny)
library(dplyr)
library(reader)
library(ggplot2)

setwd("C:/Users/think/Documents/Academics/INFO201/INFO201-PS06/PS06")
getwd()

ui <- fluidPage(
  # Add a tabset panel
  tabsetPanel(
    tabPanel("About",
             titlePanel("INFO201-PS06"),
             p("This application makes use of ",
               strong("UAH"),
               " satellite temperature data."),
             p(em("temp"),
               ": temperature deviation (deg C) from 1991-2020 average."),
             a("You can download the data from UAH lower troposphere", href='https://www.nsstc.uah.edu/data/msu/v6.0/tlt/uahncdc_lt_6.0.txt'),
             p("The data set contains", textOutput("num_rows"), " observations."),
             p("Some sample data displayed in the following table:"),
             tableOutput("sample_data")
    ),
    tabPanel("Plot",
             titlePanel("Plot of temperature in different region"),
             sidebarLayout(
               sidebarPanel(
                 # Add input controls for the plot here
               ),
               mainPanel(
                 # Add the plot output here
               )
             )
    ),
    
    # Add a tab panel titled "Table"
    tabPanel("Table",
             titlePanel("Table of temperature data"),
             dataTableOutput("table_data")
    )
  )
)

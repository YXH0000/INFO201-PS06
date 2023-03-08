library(shiny)
library(dplyr)
library(reader)
library(ggplot2)



uah <- read.delim("UAH-lower-troposphere-long.csv.bz2")

ui <- fluidPage(
  
  # Create a tabset panel
  tabsetPanel(
    
    # Add a tab panel titled "About"
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
    
    # Add a tab panel titled "Plot"
    tabPanel("Plot",
             titlePanel("Plot of temperature in different region"),
             sidebarLayout(
               sidebarPanel(
                 p("You can select the global temperature by select the different regions
                   You see a monthly scatterplot."),
                 
                 radioButtons("color_palette", "Select a palette:",
                              c("Palette 1", "Palette 2"), 
                              selected = "Palette 1"),
                 checkboxGroupInput("select_region", "select region(s) to display",
                                    choices = unique(uah$region), 
                                    selected = "globe")
               ),
               mainPanel(
                 plotOutput(outputId = "scatterplot",width = "100%")
               )
             )
    ),
    
    # Add a tab panel titled "Table"
    tabPanel("Table",
             titlePanel("Table of temperature data"),
             sidebarLayout(
               sidebarPanel(
                 p("This panel displays average temperature over different time periods:"),
                 radioButtons("choosetime", "strong(Average Over):",
                              c("month","year","decade"),
                              selected = "month"),
               )
             ),
             mainPanel(
               dataTableOutput(outputId = "data_table")
             )
             
    )
  )
)
shinyUI(ui)
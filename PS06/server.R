library(shiny)
library(dplyr)
library(reader)
library(ggplot2)



uah <- read.delim("UAH-lower-troposphere-long.csv.bz2")
head(uah)

server <- function(input, output) {
  # Return the number of rows in the UAH data
  output$num_rows <- renderText({
    nrow(uah)
  })
  
  # Return the random 10 rows of the UAH data
  output$sample_data <- renderTable({
    uah[sample(nrow(uah), 10), ]
  })
  
  # Scatter plot of temperature in different region
  output$scatterplot <- renderPlot({
    uah_plot <- uah %>%
      filter(region %in% input$select_region) %>%
      mutate(time = year + month/100 * (100/12))
    ggplot(uah_plot, aes(time, temp, col = region)) +
      geom_point(size = 0.8) +
      labs(x = "Year", y = "Temperature", col = "Region") +
      scale_color_discrete(name = "Region") +
      if (input$color_palette == "Palette 2"){
        scale_color_brewer(palette = "Dark2")
      }
  })
  
  # Table of average temperature over different time periods
  output$data_table <- renderDataTable({
    uah_table <- uah %>% 
      region
  })
    
}



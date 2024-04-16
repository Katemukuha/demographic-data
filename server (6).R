# Load libraries
library(shiny)
library(tidyverse)

# Read in data
adult <- read_csv("adult.csv")
# Convert column names to lowercase for convenience 
names(adult) <- tolower(names(adult))

# Define server logic
shinyServer(function(input, output) { df_country <- reactive({ adult %>% filter(native_country == input$country)})
  # TASK 5: Create logic to plot histogram or boxplot
plotOutput$p1 <- renderPlot({if(input$graph_type == "histogram") {ggplot(df_country(), aes_string(x = input$continuous_variable)) +
geom_histogram(bins = 30) + labs(y = "Number of people", title = paste("Trends in ", input$Continuous)) + facet_wrap(~prediction)
}
  else {ggplot(df_country(), aes_string(y = input$continuous_variable)) + geom_boxplot() + coord_flip() + labs(y = "Number of people", title = paste("Trends in ", input$Continuous)) + facet_wrap(~prediction) 
  }})

})
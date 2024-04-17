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
output$p1 <- renderPlot({if(input$graph_type == "histogram") {ggplot(df_country(), aes_string(x = input$continuous_variable)) +
geom_histogram(bins = 30) + labs(y = "Number of people", title = paste("Trends in ", input$continuous_variable)) + facet_wrap(~prediction)
}
  else {ggplot(df_country(), aes_string(y = input$continuous_variable)) + geom_boxplot() + coord_flip() + labs(y = "Number of people", title = paste("Trends in ", input$continuous_variable)) + facet_wrap(~prediction) 
  }})

# TASK 6: Create logic to plot faceted bar chart or stacked bar chart
output$p2 <- renderPlot({
  
  p <- ggplot(df_country(), aes_string(x = input$categorical_variable)) +
    labs(y = "Number of people", title = paste("Trends in ", categorical_variable)) + 
    theme(axis.text.x = element_text(angle = 45), legend.position = "bottom")
  if(input$is_stacked) {
    p + geom_bar(aes(fill = prediction), position = "stack") 
  }
  else{
    p + 
      geom_bar(aes(fill = !!input$categorical_variable), position = "dodge") +  
      facet_wrap(~prediction)   
  }  
})

})


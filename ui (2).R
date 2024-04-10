library(shiny)
library(tidyverse)
library(leaflet)

# Application Layout
shinyUI(
  fluidPage(
    br(),
    # TASK 1: Application title
    titlePanel("Trends in Demographics and Income"),
    p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demogrphic information."),
    # TASK 2: Add first fluidRow to select input for country
    fluidRow(
      column(12, 
             wellPanel(inputId = "country", label = "Country", choices = c("United-States", "Canada", "Mexico", "Germany", "Philippines"), selected = "United-states")  # add select input 
      )
    )))
    
   
   
   
  
  
  
  
    
    
  
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

library(tidyverse)

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
             wellPanel(selectInput(inputId = "country", choices = "United-States", "Canada", "Mexico", "Germany", "Philippines", selected = "United-states"))  # add select input
      )
    ),

    # TASK 3: Add second fluidRow to control how to plot the continuous variables
    fluidRow(
      column(3,
             wellPanel(
               p("Select a continuous variable and graph type (histogram or boxplot) to view on the right."),
               radioButtons(inputId = "continuous variable", choices = 'age', 'hours-per-week'),   # add radio buttons for continuous variables
               radioButtons(inputId = 'graph_type', choices = "histogram", "boxplot"  # add radio buttons for chart type
               )
             ),
             column(9, plotOutput("p1"))  # add plot output
      )),

      # TASK 4: Add third fluidRow to control how to plot the categorical variables
      fluidRow(
        column(3,
               wellPanel(
                 p("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph."),
                 radioButtons(selectInput(inputId = 'categorical variables', choices = "education", "workclass", "sex"),    # add radio buttons for categorical variables
                              checkboxInput(inputId = 'is stacked', value = FALSE)     # add check box input for stacked bar chart option
                 )
               ),
               column(9, plotOutput("p2"))  # add plot output
        )
      )
    ))

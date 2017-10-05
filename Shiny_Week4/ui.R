#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# options(shiny.sanitize.errors = FALSE)

# Define UI for application that predicts and draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Prediction of Height based on Span writing hand & Histogram Span writing hand"),
  
  # Sidebar with a slider and checkbox input 
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderHand", "1) The plot with the predicted height of a person is based on
                  the span of the writing hand in cm (tip thumb to tip little finger). What is the span of the writing hand?:", 
                  10, 23, value = 18),
      radioButtons("Sex", "2) Histogram span writing hand: for female or male? (Histogram is shown below the plot)",
                   c("Female" = "Female", "Male" = "Male")),
      tags$b("3) What must be shown?"),
      checkboxInput("showModel", "1) Show/Hide model-line in the plot", value = TRUE),
      checkboxInput("showHistogram", "2) Show/Hide histogram span writing hand", value = TRUE),
      submitButton(text = "Submit")
    ),
    
    # Show model-line and/or histogram
    mainPanel(
      plotOutput("plotPred"),
      h4("Predicted height:",textOutput("pred")),
      plotOutput("histPlot")
    )
    )
  ))

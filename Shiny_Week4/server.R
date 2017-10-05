#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(MASS)
data("survey")
data_survey <- na.omit(survey)

# Define server required to draw a plot for the prediction and/or a histogram
shinyServer(function(input, output) {
  # Make prediction for height based on the input span writing hand:   
  model <- lm(Height ~ Wr.Hnd, data = data_survey)
  model_pred <- reactive({
    handInput <- input$sliderHand
    predict(model, newdata = data.frame(Wr.Hnd = handInput))
  })
  # Plot the model with the prediction
  output$plotPred <- renderPlot({
    handInput <- input$sliderHand
    plot(data_survey$Wr.Hnd, data_survey$Height, xlab ="Span writing hand (cm)",
         ylab = "Height (cm)", bty = "n", pch = 15)
    if(input$showModel) {abline(model, col = "blue", lwd = 2)}
    legend(25, 250,"Prediction of the height", pch = 16, col = "blue", bty = "n", cex = 1.2)
    points(handInput, model_pred(), pch = 16, col = "red", cex = 2)
  })
  
  output$pred <- renderText({
    model_pred()})
  
  # Plot histogram for male of female: 
  output$histPlot <- renderPlot({
    survey_Sex <- subset(data_survey, Sex == input$Sex, select=c(Sex, Wr.Hnd, Height))
    if(input$showHistogram) {
      hist(survey_Sex$Wr.Hnd, breaks = 10, 
           main = paste("Histogram of span writing hand for ",input$Sex,"s", sep=""),
           xlab = "span writing hand", col = 'darkgray', border = 'white')
    }
    
  })
  
})

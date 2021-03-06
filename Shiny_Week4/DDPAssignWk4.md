DDP Shiny-Assignment Week 4
========================================================
author: 
date: 5th October 2017
autosize: true

Overview
========================================================

At the University of Adelaide a survey was held in which 237 Statistics students responded to a number of questions. In the Shiny application the responses to sex, height of person and span of writing hand, are used in order to:

- make a plot in which the height of a person is predicted, given the span of the writing hand by the user
- make a histogram for the span of the writing hand, given the sex by the user

For the Shiny application please visit:
<https://cvdrl-2017-9.shinyapps.io/DDPAssignWk4/>

For the source code in github (ui.R & server.R files) please visit: <https://github.com/Cindy1207/Data_Products/tree/master/Shiny_Week4>


Widgets used in the Shiny application
========================================================

The application includes the following 4 widgets:

- sliderInput: a slider bar to choose the span of the writing hand in cm.The range is from 10 to 23. Based on the chosen span, the height of the person will be predicted.
- radioButtons: two buttons to choose from, "Female" and "Male". The app will show a histogram for the span of the writing hand for the chosen sex.
- checkboxInput: with the first checkbox you can choose whether or not you like to see the linear model "height ~ span writing hand". With the second checkbox you can choose whether or not you like to see the histogram, in case you are only interested in the prediction.
- submitButton: a submit button to start the calculation.


Sample R Code for Histogram (Female)
========================================================
<small style="font-size:.4em">

```r
library(MASS)
data("survey")
data_survey <- na.omit(survey)
survey_Sex <- subset(data_survey, Sex == "Female", select=c(Sex, Wr.Hnd, Height))
histPlot <- hist(survey_Sex$Wr.Hnd, breaks = 10, main = "Histogram of span writing hand for Females",xlab = "span writing hand", col = 'darkgray', border = 'white')
```

![plot of chunk histogram for Female](DDPAssignWk4-figure/histogram for Female-1.png)

```r
plot(histPlot)
```

![plot of chunk histogram for Female](DDPAssignWk4-figure/histogram for Female-2.png)
</small>

User Interface 
========================================================

![alt test] (Shiny_prediction.PNG)


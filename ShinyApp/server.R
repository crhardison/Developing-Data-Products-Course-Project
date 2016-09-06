#
# Developing Data Products - Course Project
# Christopher Hardison
# September 5, 2016
#

library(shiny)

data("mtcars")

#Server logic
shinyServer(
  
  function(input, output) {
    #set rownames as an actual column
    mtcars$Cars <- rownames(mtcars)
    
    #sort the data table by the mpg values
    mtcars <- mtcars[with(mtcars, order(mpg)), ]
    
    #create a reactive variable to limit the data set to only those that have MPG values 
    #between the selected input values
    selectedData <- reactive({
      mtcars[mtcars$mpg > input$minMPG & mtcars$mpg < input$maxMPG,c("Cars", "mpg")]
    })
    
    #Display the selected min value 
    output$text1  <- renderText({
      paste("Selected Minimum MPG: ", input$minMPG)
    })
    
    #Display the selected max value 
    output$text2  <- renderText({
      paste("Selected Maximum MPG: ", input$maxMPG)
    })
    
    #Display the total number of cars that fall within the values 
    output$text3  <- renderText({
      paste("Number of Cars: ", nrow(selectedData()))
    })
      
    #Display the car names and mpg values in a table   
    output$carList <- renderTable({
      selectedData()
    
    },
    
    #hide rownames
    include.rownames=FALSE)
})

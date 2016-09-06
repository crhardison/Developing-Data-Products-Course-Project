#
# Developing Data Products - Course Project
# Christopher Hardison
# September 5, 2016
#

library(shiny)

shinyUI(fluidPage(
  
  #Title
  titlePanel("Motor Trend Car Data by MPG"),
  
  #Documentation of applications functioning
  fluidRow(
    column(width = 12,
      "This application displays cars that have a mile per gallon (mpg) rating within the selected range. The data source for this application is the mtcars dataset within the R datasets package."
    )),
  
  #space
  tags$br(),
  
  #Sidebar with slider inputs for MPG
  sidebarLayout(
    sidebarPanel(
    
      #Further documentation/descriptive text
      helpText("Us the sliders below to select the MPG range."),
      
      #Min mpg slider    
      sliderInput("minMPG",
                 "Minumum MPG:",
                 min = 10,
                 max = 35,
                 value = 20),
      
      #Max mpg slider 
      sliderInput("maxMPG",
                 "Maximum MPG:",
                 min = 10,
                 max = 35,
                 value = 30)
    ),
    
    #main panel for output
    mainPanel(
      splitLayout( 
        cellWidths = 250,
        
        #table of cars
        tableOutput("carList"),
        
        #further information on selections
        wellPanel(
          p(textOutput("text1")),
          p(textOutput("text2")),
          p(textOutput("text3"))
        ))
    )
  )
))

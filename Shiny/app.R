library(shiny)
library(ggplot2)
library(googleVis)
library(rpart.plot)
dataset <- read.csv("../data/cleaned/herculano-houtzel-all.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("dataset",
                     choices = dataset$Brain_area)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot1")
      )
   )
)



# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$plot1 <- reactivePlot(function() {
    
      data1 <- data.frame(dataset = dataset$Brain_area, var = factor(dataset[[input$variable]]))
      
      

   })


# Run the application 
shinyApp(ui = ui, server = server)


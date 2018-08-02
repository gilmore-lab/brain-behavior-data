library(shiny)
library(ggplot2)

cyl<- read.csv("../data/cleaned/cyl_task.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("MacLean Data"),
   
   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
         selectInput(inputID = 'Species', label = "Species",
                     choices = cyl$Species, selected = 'Aye Aye')
         # selectInput(inputId, label, choices, selected = NULL, multiple = FALSE,
         #             selectize = TRUE, width = NULL, size = NULL)
         
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
    
      # data1 <- data.frame(dataset = , var = factor(dataset[[input$variable]]))
      
      
  this_Species <- input$Species
    
  thisdata <- cyl %>% filter(Species == this_Species)
    
  plot1 <-  ggplot(data= thisdata) +
        aes(x = Trial_type, y = N_trials, color = Name) +
        geom_point() +
        geom_line(aes(group = Name)) +
        facet_grid(cols = vars(Sex))
      
   })}


# Run the application 
shinyApp(ui = ui, server = server)


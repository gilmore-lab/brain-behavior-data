library(shiny)
library(ggplot2)
library(forcats)

cyl<- read.csv("../data/cleaned/cyl_task.csv")

# Define UI for application that draws a histogram

ui <- fluidPage(
   
   # Application title
   titlePanel("MacLean Data"),
   
   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
         selectInput("Species", "Species: ",
                     choices = cyl$Species, selected = 'Aye Aye')
         
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot1")
      )
))

# Define server logic required to draw a histogram
server <- function(input, output) {
  # this_Species <- input$Species
  
  output$plot1 <- reactivePlot({
    

# thisdata <- cyl %>% filter(Species == this_Species)
    ggplot(data= cyl) +
        aes(x = Trial_type, y = N_trials, color = Name) +
        geom_point() +
        geom_line(aes(group = Name)) +
        facet_grid(cols = vars(Sex)) +
        aes(x= fct_inorder(Trial_type))
      
   })}


# Run the application 
shinyApp(ui = ui, server = server)









# shinyApp(
#   ui = fluidPage(
#     selectInput("variable", "Variable:",
#                 c("Cylinders" = "cyl",
#                   "Transmission" = "am",
#                   "Gears" = "gear")),
#     tableOutput("data")
#   ),
#   server = function(input, output) {
#     output$data <- renderTable({
#       mtcars[, c("mpg", input$variable), drop = FALSE]
#     }, rownames = TRUE)
#   }
# )

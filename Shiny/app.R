library(shiny)
library(ggplot2)
library(forcats)
library(dplyr)

# Import data
cyl<- read.csv("../data/cleaned/cyl_indv.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("MacLean et al. 2014 Data"),
   
   # Sidebar with a drop-down menu input for species
   sidebarLayout(
      sidebarPanel(
         selectInput("species", "Species: ",
                     choices = cyl$Species, selected = 1),
         selectInput("sex", "Sex: ",
                     choices = c("M", 'F', "U", "All"), selected = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot1")
      )
))

# Define server logic required to draw a histogram
server <- function(input, output) {
    
  output$plot1 <- renderPlot({
    # abc <- cyl %>% filter(Species == input$species)
    # def <- cyl %>% filter(Species == input$species, Sex == input$sex)
   this_data <- ifelse(input$Sex == "All", cyl %>% filter(Species == input$species), cyl %>% filter(Species == input$species, Sex == input$sex))
      this_data %>%
        ggplot(.) +
        aes(x = fct_inorder(Trial_type), y = N_trials, color = Name) +
        geom_point() +
        geom_line(aes(group = Name)) +
        facet_grid(cols = vars(Sex)) +
        theme(axis.text.x = element_text(size = 12),
              axis.text.y = element_text(size = 12),
              axis.title.x = element_text(size = 14)) +
        xlab("Experiment Phase") +
        ylab("N trials")})}

# Run the application 
shinyApp(ui = ui, server = server)


# cyl %>% filter(Species == dataInput) %>% ggplot() +
#   aes(x = Trial_type, y = N_trials, color = Name) +
#   geom_point() +
#   geom_line(aes(group = Name)) +
#   facet_grid(cols = vars(Sex)) +
#   aes(x= fct_inorder(Trial_type))

# this_data <- cyl[ cyl$Species == dataInput , ]
# this_data <- filter(cyl, cyl$Species == dataInput)
# this_data <- cyl %>% filter(Species == dataInput)





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

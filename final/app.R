library(shiny)
source("analysis.R")
source("text.R")

my_ui <- navbarPage(
  title = "Tobacco Project",
  tabPanel("Introduction"
           
           ),
  tabPanel("David's Part"
          
           ),
  tabPanel("Yvan's Part"
           
           ),
  tabPanel("Jerimiyah's Part"
          
           ),
  tabPanel("Shilpa's Part"
           
           ),
  fluid = TRUE
)

my_server <- function(input, output) {
 
}

shinyApp(ui = my_ui, server = my_server)
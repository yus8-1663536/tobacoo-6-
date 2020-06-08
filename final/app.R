library(shiny)
source("analysis.R")
source("text.R")

my_ui <- navbarPage(
  title = strong("Tobacco Project"),
  tabPanel(em("Introduction"),
           h2("Introduction"),
           p(introduction_1),
           p(introduction_2),
           p(introduction_3)
           ),
  tabPanel(em("State Comparison"),
            sidebarLayout(
              sidebarPanel(
                selectInput("state_1", "State #1:", choices = dstates, selected = "Alabama"),
                hr(),
                selectInput("state_2", "State #2", choices = dstates, selected = "Alaska"),
                hr(),
                helpText("Choose two states to compare cancer rates")
              ),
              mainPanel(
                plotOutput("states_cancer")
              ),
            ),
           br(),
           plotOutput("topStates")
           ),
  tabPanel(em("Cancer Type Comparison"), 
           sidebarLayout(
             sidebarPanel(
               selectInput("cancer_1", "First Cancer:", choices = canctype, selected = "Cervix"),
               hr(),
               selectInput("cancer_2", "Second Cancer:", choices = canctype, selected = "Stomach"),
               hr(), 
               helpText("Choose two cancers to compare prevalence")
             ),
             mainPanel(
               plotOutput("types_cancer")
             ),
           ),
           br(),
           tableOutput("topCancers")
           
           ),
  tabPanel(em("Jerimiyah's Part")
          
           ),
  tabPanel(em("Nationwide by Year Comparison"),
           sidebarLayout(
             sidebarPanel(
               selectInput("year_1", "Year Option 1:", choices = years_listed, selected = "1995"),
               hr(),
               selectInput("year_2", "Year Option 2:", choices = years_listed, selected = "2010"),
               hr(), 
               helpText("Choose two years to compare nationwide prevalence of daily smokers")
             ),
             mainPanel(
               plotOutput("smokers_america")
             ),
           ),
           br(),
           tableOutput("smokers_america_table")
           
           ),
  tabPanel(em("Conclusion"),
           h2("Conclusion"),
           p(conclusion_1),
           p(conclusion_2),
           p(conclusion_4)
           ),
  fluid = TRUE
)

my_server <- function(input, output) {
 output$states_cancer <- renderPlot({
   cancerByState(input$state_1, input$state_2)
 })
 output$topStates <- renderPlot({
   topStates
 })
 
 output$types_cancer <- renderPlot({
   cancerByType(input$cancer_1,input$cancer_2)
 })
 
 output$topCancers <- renderTable({
   topCancers
 })
 
 output$smokers_america <- renderPlot({
   nation_by_year(input$year_1, input$year_2)
 })
 
 output$smokers_america_table <- renderTable({
   nationwide_behavior
 })
}

shinyApp(ui = my_ui, server = my_server)
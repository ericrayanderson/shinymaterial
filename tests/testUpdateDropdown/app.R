library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "Basic Page",
  tags$h1("Page Content"),
  material_button(input_id = "go", label = "GO"),
  material_dropdown(input_id = "test", label = "test",
                    choices = c("Choice 1" = "choice_1",
                                "Choice 2" = "choice_2")),
  plotOutput("myPlot")
)

server <- function(input, output, session) {
  
  output$myPlot <- renderPlot({
    plot(1:10, main = input$test)
  })
  
  observeEvent(input$go, {
    if(input$go == 0){
      return(NULL)
    }
    update_material_dropdown(session,
                             "test",
                             value = "choice 3",
                             choices = c("Choice 3" = "choice 3",
                                         "Choice 4" = "choice 4"))
  })
  
  
}
shinyApp(ui = ui, server = server)
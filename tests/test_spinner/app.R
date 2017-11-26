if(interactive()){
  library(shiny)
  library(shinymaterial)
  
  ui <- material_page(
    title = "Basic Page",
    numericInput(inputId = "n", label = "", value = 10),
    plotOutput("n_plot")
  )
  
  server <- function(input, output, session) {
    
    output$n_plot <- renderPlot({
      material_spinner_show(session, "n_plot")
      Sys.sleep(time = 3)
      plot(1:input$n)
      material_spinner_hide(session, "n_plot")
    })
    
  }
  shinyApp(ui = ui, server = server)
}
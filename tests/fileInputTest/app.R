if(interactive()){
  library(shiny)
  library(shinymaterial)
  
  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page", 
    primary_theme_color = "blue", 
    secondary_theme_color = "green",
    tags$h1("Page Content"),
    material_file_input(input_id = "example_file_input", label = "ok")
  )
  
  server <- function(input, output, session) {
    
    observeEvent(input$example_file_input, {
      inFile <- input$example_file_input
      if (is.null(inFile)) {
        return(NULL)
      }
      x <- read.csv(inFile$datapath)
      message(head(x))
    })
    
    
  }
  shinyApp(ui = ui, server = server)
}
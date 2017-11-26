if(interactive()){
  library(shiny)
  library(shinymaterial)
  
  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    include_fonts = TRUE,
    title = "Basic Page",
    tags$h1("Page Content")
  )
  
  server <- function(input, output) {
    
  }
  shinyApp(ui = ui, server = server)
}
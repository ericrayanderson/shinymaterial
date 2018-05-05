library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "Basic Page", 
  include_nav_bar = FALSE,
  tags$div("Page Content")
)

server <- function(input, output) {
  
}
shinyApp(ui = ui, server = server)
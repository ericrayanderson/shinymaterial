library(shiny)
library(shinymaterial)

ui <- material_page(
  title = "Basic Page + Side-Nav with Tabs",
  nav_bar_fixed = TRUE,
  
  material_side_nav(
    fixed = TRUE,
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
        "Example Side-Nav Tab 2" = "example_side_nav_tab_2"
      ),
      icons = c("cast", "insert_chart")
    )
  ),
  
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_1",
    tags$h1("First Side-Nav Tab Content")
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_2",
    tags$h1("Second Side-Nav Tab Content"),
    
    material_number_box(input_id = "ddd", label = "number box", min_value = 5, max_value = 15,initial_value = 10, color = "#ef5350"),
    textOutput("min_max")
    
  )
)

server <- function(input, output) {
  output$min_max <- renderText({
    paste("You have chosen the number", input$ddd)
  })
}
shinyApp(ui = ui, server = server)
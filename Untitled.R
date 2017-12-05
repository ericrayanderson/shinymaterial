library(shiny)
library(shinymaterial)

ui <- material_page(
  title = "Title",
  material_side_nav(
    fixed = TRUE,
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Good" = "tab_good",
        "Bad" = "tab_bad"
      )
    )
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "tab_good",
    tableOutput("good_table")
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "tab_bad",
    tableOutput("bad_table")
  )
)

server <- function(input, output, session){
  output$good_table <- renderTable({
    mtcars
  })
  
  output$bad_table <- renderTable({
    mtcars
  })
}

shinyApp(ui, server)
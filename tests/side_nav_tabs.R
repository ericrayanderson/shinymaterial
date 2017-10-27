library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "Basic Page + Side-Nav with Tabs",
  # Place side-nav in the beginning of the UI
  material_side_nav(
    fixed = TRUE,
    # Place side-nav tabs within side-nav
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
        "Example Side-Nav Tab 2" = "example_side_nav_tab_2"
      ),
      icons = c("cast", "insert_chart")
    )
  ),
  # Define side-nav tab content
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_1",
    tags$h1("First Side-Nav Tab Content")
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_2",
    tags$h1("Second Side-Nav Tab Content")
  )
)


server <- function(input, output) {
  
}
# shinyApp(ui = ui, server = server)
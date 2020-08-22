library(shiny)
library(shinymaterial)
library(dplyr)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "Basic Page + Side-Nav with Tabs",
  nav_bar_fixed = TRUE,
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
    material_ui_output("ddA")
    
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_2",
    material_ui_output("ddB")
  )
)

server <- function(input, output) {
  
  output$ddA<-render_material_ui({
    material_dropdown(input_id = "pageA", label = "First selection",
                      choices = c("A","B"))
  })
  
  output$ddB <- render_material_ui({
    material_dropdown(input_id = "pageB", label = "Second selection",
                      choices = c(1,2))
  })
}
shinyApp(ui = ui, server = server)
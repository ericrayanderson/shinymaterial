if(interactive()){
  library(shiny)
  library(shinymaterial)
  library(ggplot2)
  
  ui <- material_page(
    title = "Basic Page", 
    primary_theme_color = "blue", 
    secondary_theme_color = "red",
    material_row(
      material_column(
        width = 12,
        material_tabs(
          tabs = c(
            "Example Tab 1" = "example_tab_1",
            "Example Tab 2" = "example_tab_2"
          )
        ),
        material_tab_content(
          tab_id = "example_tab_1",
          material_button("button", "Button"),
          material_switch("switch", off_label = "Off", on_label = "On", initial_value = TRUE),
          material_radio_button("radio", "Radio", choices = c("a", "b"))
        ),
      )
    )
  )
  
  server <- function(input, output, session) {
    
  }
  shinyApp(ui = ui, server = server)
  
  
}
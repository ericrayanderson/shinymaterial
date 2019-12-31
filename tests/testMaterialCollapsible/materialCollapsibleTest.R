if(interactive()){
  rm(list = ls())
  library(shiny)
  library(shinymaterial)
  
  # Load functions if not compile with news functions - Uncomment if needed
  # source("./R/shiny-material-collapsible.R")
  # source("./R/shiny-material-collapsible-item.R")
  
  # shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page",
    
    tags$h4("Accordion"),
    material_collapsible(
      depth = 4, color = "blue",
      material_collapsible_item(
        label = "First", icon = "filter_drama",
        material_button("test", label = "test")
      ),
      material_collapsible_item(label = "Second", icon = "place", active = TRUE),
      material_collapsible_item(label = "Third", icon = "whatshot")
    ),
    
    tags$h4("Expandable"),
    tags$h5("Only work with Materialize 1.0.0 - But we will change one day ;-)"),
    material_collapsible(
      type = "expandable",
      material_collapsible_item(label = "First", icon = "filter_drama",
                                material_button("test2", label = "test")),
      material_collapsible_item(label = "Second", icon = "place"),
      material_collapsible_item(label = "Third", icon = "whatshot")
    ),
    
    tags$h4("Popout"),
    material_collapsible(
      type = "popout",
      material_collapsible_item(label = "First", icon = "filter_drama",
                                material_button("test", label = "test")),
      material_collapsible_item(label = "Second", icon = "place"),
      material_collapsible_item(label = "Third", icon = "whatshot")
    ),
    material_button("test3", label = "test")
  )
  
  server <- function(input, output) {
    observeEvent(input$test2,{
      message("ok")
    })
    observeEvent(input$test3,{
      message("ok2")
    })
  }
  
  shinyApp(ui = ui, server = server)
  
}

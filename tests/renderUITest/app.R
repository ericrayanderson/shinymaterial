if(interactive()){
  library(shiny)
  library(shinymaterial)
  
  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page",
    include_fonts = TRUE,
    tags$h1("Page Content"),
    material_slider(
      input_id = "s2",
      label = "S2",
      min_value = 1,
      max_value = 5,
      initial_value = 3
    ),
    uiOutput('ui_test')
  )
  
  server <- function(input, output) {
    rV <- reactiveValues()
    
    output$ui_test <- renderUI({
      material_row(
        material_column(
          width = 2,
          material_slider(
            input_id = "s1",
            label = "S1",
            min_value = 1,
            max_value = 5,
            initial_value = 2
          )
        )
      )
      
    })
    
    observe({
      message(input$s1)
      message(input$s2)
    })
    
  }
  shinyApp(ui = ui, server = server)
}
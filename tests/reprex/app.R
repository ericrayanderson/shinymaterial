if(interactive()){
  library(shinymaterial)
  library(shinyjs)
  
  
  ui <- material_page(
    useShinyjs(),
    material_dropdown("dropdown1",
                      label = "dropdown1", 
                      choices = c("a","b","c","d"),
                      multiple = TRUE),
    material_dropdown("dropdown2", 
                      label = "dropdown2",
                      choices = c("a","b","c","d"), 
                      multiple =TRUE)
  )
  
  server <- function(input, output, session){
    
    
    reactives <- reactiveValues( 
      val = list()
    )
    
    observe({
      reactives$val$choices <- input$dropdown1
      reactives$val$values <- input$dropdown2
    }, priority = 1)
    
    observe({
      message("this")
      
      
      
      
      update_material_dropdown(session, 
                               input_id = "dropdown2", 
                               choices = reactives$val$choices, 
                               value = reactives$val$values, 
                               multiple = TRUE)
    })
  }
  
  shinyApp(ui, server)
}
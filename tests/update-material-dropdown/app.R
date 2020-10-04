if(interactive()){
  library(shinymaterial)
  
  
  
  ui <- material_page(
    material_text_box(input_id = "dropdown1Text", label = "dropdown1Text", value = "a"),
    material_dropdown("dropdown1", 
                      label = "dropdown1", 
                      choices = c("a","b","c","d"),
                      multiple = FALSE),
    material_text_box(input_id = "dropdown2Text", label = "dropdown1Text", value = "e,f,g,h"),
    material_dropdown("dropdown2",
                      label = "dropdown2",
                      choices = c("e","f","g","h"),
                      selected =c("e","f","g","h"), 
                      multiple = TRUE)
  )
  
  server <- function(input, output, session){
    
    
    
    observe({
      update_material_dropdown(session,
                               input_id = "dropdown1",
                               choices = unlist(strsplit(input$dropdown1Text, ",", fixed = TRUE)),
                               value = unlist(strsplit(input$dropdown1Text, ",", fixed = TRUE)),
                               multiple = FALSE)
    })
    
    observe({
      update_material_dropdown(session,
                               input_id = "dropdown2",
                               choices = unlist(strsplit(input$dropdown2Text, ",", fixed = TRUE)),
                               value = unlist(strsplit(input$dropdown2Text, ",", fixed = TRUE)),
                               multiple = TRUE)
    })
  }
  
  shinyApp(ui, server)
}
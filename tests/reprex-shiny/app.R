if(interactive()){
  library(shiny)
  library(shinyjs)
  
  
  ui <- fluidPage(
    useShinyjs(),
    selectInput("dropdown1",
                label = "dropdown1", 
                choices = c("a","b","c","d"),
                multiple = TRUE),
    selectInput("dropdown2", 
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
      
      updateSelectInput(session, 
                        inputId = "dropdown2", 
                        choices = reactives$val$choices, 
                        selected = reactives$val$values)
    })
  }
  
  shinyApp(ui, server)
}
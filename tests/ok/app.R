library(shiny)
library(shinymaterial)

ui <- material_page(
  title = "Basic Page",
  uiOutput("AT"),
  uiOutput("AT2"),
  
  br(),
  br(),
  actionButton("btn", label='click')
)

server <- function(input, output) {  
  output$AT<-renderUI({
    material_dropdown(input_id="id", label="ID-1",
                      choices = list("1" = "One", "2" = "Two"),multiple=F)
  })
  output$AT2<-renderUI({  
    
    if(input$btn > 2 & input$btn < 5){
      render_material_from_server(
        material_dropdown(input_id="id2", label="ID-2",
                          choices = list("A" = "A", "B" = "B"),multiple=F)
      )
      # selectizeInput(inputId="id2", label="ID-2",
      #                   choices = list("A" = "A", "B" = "B"),multiple=F).  # select/izeInput will work
    }
  })
  observe({
    print(input$btn)
  })
}
shinyApp(ui = ui, server = server)
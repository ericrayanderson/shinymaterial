library(shiny)
library(shinymaterial)

# Define UI for application that draws a histogram
ui <- material_page(
  title = "Modal Test App",
  
  # regular table
  tableOutput("table"),
  
  h5(" 1. click this button first "),
  # modal start button
  material_button(input_id = "open_modal", label = "Open Modal Dialog"),
  
  
  h5(" 2. now click native modal button"),
  # modal window
  material_modal(
    modal_id = "example_modal",
    button_text = "Modal Native Button",
    display_button = T,
    title = "Example Modal Title",
    button_color = "red",
    shiny::tags$p(
      
      h5("table below"),
      tableOutput('table_modal')
      
    )
  ),
  h5("3. now click first button again")
  
  
)

# Define server logic required to draw a histogram
server <- function(session, input, output) {
  
  # render table to main page
  output$table<-renderTable(iris[1:5,])
  
  observeEvent(input$open_modal, ignoreInit = TRUE, {
    open_material_modal(session, "example_modal")
    
    # Extra line of code here:
    #shiny::showNotification('test')
    
    
    # render table to modal dialog
    output$table_modal<-renderTable({iris[1:5,]})
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
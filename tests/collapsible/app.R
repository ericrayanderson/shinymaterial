
if(interactive()){
  library(shiny)
  library(shinymaterial)
  library(ggplot2)
  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page", 
    primary_theme_color = "blue", 
    secondary_theme_color = "green",
    # plotOutput("plot55"),
    material_collapsible(
      type = "popout",
      material_collapsible_item(
        heading = "Plot",
        icon = "place",
        material_button("button", "BUTTON"),
        plotOutput("plot3")
      ),
      material_collapsible_item(
        heading = "Table",
        icon = "place",
        tableOutput("table3")
      )
    ),
    shiny::tags$br()# ,
    # material_plot_carousel(c("plot2", "plot3", "plot4"))
    
  )
  
  server <- function(input, output, session) {
    
    output$plot55 <- renderPlot({
      plot(5:55)
    })
    
    rV <- reactiveValues()
    observeEvent(input$button, {
      
      rV$plot <- plot(1:10)
    })
    
    output$plot <- renderPlot({
      req(rV$plot)
      rV$plot
    })

    output$table3 <- renderTable({
      mtcars
    })
    
    output$table4 <- renderTable({
      mtcars
    })
    
  }
  shinyApp(ui = ui, server = server)
}

# 
# ## app.R ##
# library(shiny)
# library(shinydashboard)
# 
# ui <- dashboardPage(
#   dashboardHeader(),
#   dashboardSidebar(),
#   dashboardBody(
#     box(title = "x", 
#         collapsed = TRUE,
#         collapsible = TRUE,
#         plotOutput("plot45"))
#   )
# )
# 
# server <- function(input, output) {
#   output$plot45 <- renderPlot({
#     plot(3:30)
#   })
#   
# }
# 
# shinyApp(ui, server)

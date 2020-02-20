material_collapsible <- function(...){
  shiny::tags$ul(
    class = "collapsible",
    ...
  )
}

material_collapsible_item <- function(heading, ..., icon = NULL){
  if(!is.null(icon)){
    icon_tag <-
      shiny::HTML(
        paste0(
          '<i class="material-icons">',
          icon,
          '</i>')
      )
  } else {
    icon_tag <- NULL
  }
  
  shiny::tags$li(
    shiny::tags$div(
      class = "collapsible-header",
      icon_tag,
      heading
    ),
    shiny::tags$div(
      class = "collapsible-body",
      ...
    )
  )
  
}

material_plot_carousel <- function(plot_ids, .width = 500){
  
  plots_tag <- tagList()
  
  for(plot.i in plot_ids){
    
    plots_tag <- 
      tagAppendChild(
        plots_tag,
        shiny::tags$a(
          class = "carousel-item",
          href = paste0("#", plot.i),
          shiny::plotOutput(plot.i, height = "150%", width = 400)
        )
      )
  }
  
  shiny::tags$div(
    class = "carousel",
    plots_tag
  )
}

if(interactive()){
  library(shiny)
  library(shinymaterial)
  library(ggplot2)
  # Wrap shinymaterial apps in material_page
  ui <- material_page(
    title = "Basic Page", 
    primary_theme_color = "blue", 
    secondary_theme_color = "green",
    material_collapsible(
      material_collapsible_item(
        heading = "TITLE",
        icon = "place",
        plotOutput("plot")
      )
    ),
    shiny::tags$br(),
    material_plot_carousel(c("plot2", "plot3", "plot4"))
    
  )
  
  server <- function(input, output, session) {
    
    output$plot <- renderPlot({
      plot(1:10)
    })
    
    output$plot2 <- renderPlot({
      plot(2:20)
    })
    
    output$plot3 <- renderPlot({
      plot(3:30)
    })
    
    output$plot4 <- renderPlot({
      ggplot(mtcars, aes(x=cyl,y=mpg)) + geom_point()
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

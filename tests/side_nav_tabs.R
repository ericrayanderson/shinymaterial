library(shiny)
library(shinymaterial)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "Basic Page + Side-Nav Tabs",
  # Place side-nav in the beginning of the UI
  material_side_nav(
    fixed = TRUE,
    material_side_nav_tabs(
      side_nav_tabs = c(
        "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
        "Example Side-Nav Tab 2" = "example_side_nav_tab_2",
        "Example Side-Nav Tab 3" = "example_side_nav_tab_3"
      )
    )
  ),
  # Define tab content
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_1",
    tags$h1("First Tab Content"),
    material_slider("sliderVal", label = 'slider', min_value = 1, max_value = 10, initial_value = 5)
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_3",
    tags$h1("Third Tab Content")
  ),
  material_side_nav_tab_content(
    side_nav_tab_id = "example_side_nav_tab_2",
    tags$h1("Second Tab Content"),
    plotOutput('testplot')
  )
)


server <- function(input, output) {
  output$testplot <- renderPlot({
    plot(1:input$sliderVal)
  })
  
}
shinyApp(ui = ui, server = server)
library(shinymaterial)

ui <- material_page(
  material_tabs(
    tabs = c(
      "tab" = "first_tab",
      "tab" = "second_tab"
    )
  )
)
server <- function(input, output) {}
shinyApp(ui = ui, server = server)
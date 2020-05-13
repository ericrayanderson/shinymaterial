if(interactive()){
library(shiny)
library(shinymaterial)
library(ggplot2)

ui <- material_page(
  title = "Basic Page", 
  primary_theme_color = "blue", 
  secondary_theme_color = "red",
  material_row(
    material_column(
      width = 12,
      material_button("button", "Button",color = "blue"),
      material_switch("switch", label = "Switch"),
      material_slider("slider", "Slider", min_value = 0, max_value = 2, initial_value = 1),
      material_checkbox(input_id = "checkbox", label = "Checkbox", initial_value = TRUE),
      material_radio_button("radio", "Radio", choices = c("a", "b")),
      material_dropdown("dropdown", "Dropdown", choices = c("a", "b"), color = "blue"),
      material_date_picker("date", "Date"),
      material_file_input("file", "File"),
      material_floating_button("floating", color = "blue"),
      material_text_box("text", "Text"),
      material_password_box("password", label = "Password"),
      material_modal(modal_id = "modal", button_text = "Modal",
                     title = "")
    )
  )
)

server <- function(input, output, session) {
  
}
shinyApp(ui = ui, server = server)


}
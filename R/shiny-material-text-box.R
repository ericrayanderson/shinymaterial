material_text_box <- function(input_id, label){
  create_material_object(
    js_file =
      "shiny-material-text-box.js",
    material_tag_list =
      shiny::tags$div(
        class = "input-field",
        shiny::tags$input(
          id = input_id,
          type = "text",
          class = "validate"
        ),
        shiny::tags$label(
          `for` = input_id,
          label
        )
      )
  )
}

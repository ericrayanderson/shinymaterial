material_checkbox <- function(input_id, label) {
  create_material_object(
    js_file =
      "shiny-material-checkbox.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          class = "shiny-material-checkbox",
          shiny::tags$p(
            shiny::tags$input(
              type = "checkbox",
              id = input_id
            ),
            shiny::tags$label(
              `for` = input_id,
              label
            )
          )
        )
      )
  )
}

material_checkbox <- function(input_id, label, initial_value = NULL) {
  
  required_arguments <- c("initial_value")
  
  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "checkbox",
          additional_text =
            paste0(
              '\ninitial_value is a boolean (TRUE or FALSE)'
            )
        )
      )
    }
  }
  
  create_material_object(
    js_file =
      "shiny-material-checkbox.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          class = "shiny-material-checkbox",
          shiny::tags$p(
            shiny::HTML(
              paste0(
                '<input type="checkbox" id="',
                input_id,
                ifelse(
                  initial_value,
                  '"checked/>',
                  '"/>'
                )
              )
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

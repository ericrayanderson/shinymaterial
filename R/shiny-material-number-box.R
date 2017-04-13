material_number_box <- function(input_id, label, min_value = NULL, max_value = NULL, initial_value = NULL){

  required_arguments <- c("min_value",
                          "max_value",
                          "initial_value")

  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "number-box"
        )
      )
    }
  }
  create_material_object(
    js_file =
      "shiny-material-number-box.js",
    material_tag_list =
      shiny::tags$div(
        class = "input-field",
        shiny::tags$input(
          id = input_id,
          type = "number",
          value = initial_value,
          min = min_value,
          max = max_value
        ),
        shiny::tags$label(
          `for` = input_id,
          label
        )
      )
  )
}

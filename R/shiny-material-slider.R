material_slider <- function(input_id, label, min_value = NULL, max_value = NULL, initial_value = NULL){

  required_arguments <- c("min_value",
                          "max_value",
                          "initial_value")

  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "slider"
        )
      )
    }
  }

  create_material_object(
    js_file =
      "shiny-material-slider.js",
    material_tag_list =
      shiny::tagList(
          shiny::tags$form(
            action = "#",
            shiny::tags$p(
              class = "range-field shiny-material-slider",
              id = input_id,
              shiny::tags$label(
                `for` = input_id,
                label
              ),
              shiny::tags$input(
                type = "range",
                min = min_value,
                max = max_value,
                value = initial_value
              )
            )
          )
      )
  )
}

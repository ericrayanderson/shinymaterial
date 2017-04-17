material_switch <- function(input_id, label, off_label = NULL, on_label = NULL, initial_value = NULL){
  
  required_arguments <- c("off_label",
                          "on_label",
                          "initial_value")
  
  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "switch",
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
      "shiny-material-switch.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$label(
          `for` = input_id,
          label
        ),
        shiny::tags$div(
          class = "switch shiny-material-switch",
          shiny::tags$label(
            off_label,
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
            shiny::tags$span(
              class = "lever"
            ),
            on_label
          )
        )
      )
  )
}

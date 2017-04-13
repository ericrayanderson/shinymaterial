material_radio_button <- function(input_id, label, choices = NULL) {

  required_arguments <- c("choices")

  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "radio-button"
        )
      )
    }
  }

  material_radio_choices <- shiny::tagList()

  has_names <- !is.null(names(choices))

  for(i in 1:length(choices)){
    material_radio_choices[[i]] <-
      shiny::tags$p(
        shiny::tags$input(
          type = "radio",
          name = input_id,
          id = choices[i]
        ),
        shiny::tags$label(
          `for` = choices[i],
          ifelse(
            has_names,
            names(choices[i]),
            choices[i]
          )
        )
      )
  }

  create_material_object(
    js_file =
      "shiny-material-radio-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$form(
          action = "#",
          id = input_id,
          shiny::tags$label(
            `for` = input_id,
            label
          ),
          material_radio_choices,
          class = "shiny-material-radio-button"
        )
      )
  )
}

material_floating_button <- function(input_id, label, icon = NULL) {

  required_arguments <- c("icon")

  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "floating-button",
          additional_text =
            paste0(
              "\nPlease goto http://materializecss.com/icons.html for available icons",
              '\ne.g. icon = "search"'
            )
        )
      )
    }
  }

  create_material_object(
    js_file =
      "shiny-material-floating-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class="fixed-action-btn",
          shiny::tags$button(
            class =
              "btn-floating btn-large waves-effect waves-light shiny-material-floating-button z-depth-3",
            style =
              "background-color:#F06C71",
            id = input_id,
            value = 0,
            shiny::tags$i(
              class = "material-icons",
              icon
            )
          )
        )
      )
  )
}

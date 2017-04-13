material_button <- function(input_id, label, icon = NULL) {

  required_arguments <- c("icon")

  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "button",
          additional_text =
            paste0(
              '\nSet icon = "no_icon" to not include an icon',
              "\nPlease goto http://materializecss.com/icons.html for available icons",
              '\ne.g. icon = "search"'
            )
        )
      )
    }
  }

  if(icon != "no_icon"){
    icon_tag <-
      shiny::HTML(
        paste0(
          '<i class="material-icons left">',
          icon,
          '</i>')
      )
  } else {
    icon_tag <- NULL
  }

  create_material_object(
    js_file =
      "shiny-material-button.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$button(
          class = "waves-effect waves-light btn shiny-material-button",
          id = input_id,
          value = 0,
          icon_tag,
          label
        )
      )
  )
}

material_dropdown <- function(input_id, label, choices = NULL, selected = NULL, multiple = NULL) {

  required_arguments <- c("choices",
                          "selected",
                          "multiple")

  for(required_argument.i in required_arguments){
    if(is.null(get(required_argument.i))){
      stop(
        material_missing_argument_error_message(
          argument = required_argument.i,
          input_id = input_id,
          type = "dropdown",
          additional_text =
            paste0(
              '\nSet selected = "no_selection" to select the first item in the list',
              '\nSet multiple = TRUE for a multi-select'
            )
        )
      )
    }
  }

  has_names <- !is.null(names(choices))

  if(length(selected) > 1 & !multiple){
    stop(
      paste0(
        "Argument 'selected' must be of length 1 when argument 'mutliple' = FALSE ",
        "\ninput_id: ", input_id,
        "\ntype: ", "dropdown"
      )
    )
  }

  if(length(selected) == 1){
    if(selected == "no_selection"){
      selected_index <- 1
    } else {
      selected_index <- which(choices == selected)
    }
  } else {
    selected_index <- which(choices %in% selected)
  }

  material_option_tag_list <- shiny::tagList()
  #comment
  for(i in 1:length(choices)){
    material_option_tag_list[[i]] <-
      shiny::HTML(
        paste0(
          "<option",
          " value=", choices[i],
          ifelse(
            i %in% selected_index,
            " selected",
            ""
          ),
          ">",
          ifelse(
            has_names,
            paste0("&nbsp;", names(choices[i])),
            paste0("&nbsp;", choices[i])
          ),
          "</option>"
        )
      )
  }

  create_material_object(
    js_file = "shiny-material-dropdown.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "input-field",
          shiny::HTML(
            paste0(
              "<select", ifelse(multiple == TRUE, " multiple", ""),
              " id=", input_id,
              " class='shiny-material-dropdown'",
              ">"
            )
          ),
          material_option_tag_list,
          shiny::HTML("</select>"),
          shiny::tags$label(
            label
          )
        )
      )
  )
}

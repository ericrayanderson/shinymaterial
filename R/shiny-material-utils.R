create_material_object <- function(js_file, material_tag_list){
  shiny::tagList(
    shiny::singleton(
      # shiny::tags$head(
      shiny::includeScript(
        system.file(
          file.path("js", js_file),
          package = "shinymaterial"
        )
      )
      # )
    ),
    material_tag_list
  )
}

check_material_function_name <- function(type, function_type){
  
  function_name <-
    paste0(
      "material_",
      gsub(
        pattern = "-",
        replacement = "_",
        x = type,
        fixed = TRUE
      )
    )
  
  if(exists(function_name)){
    return(function_name)
  } else {
    stop(
      call. = FALSE,
      paste0(
        "Invalid argument\n'",
        type,
        "' is not a valid material_",
        function_type,
        " 'type'",
        "\nSee ?material_",
        function_type,
        " for valid ",
        function_type,
        " types"
      )
    )
  }
}

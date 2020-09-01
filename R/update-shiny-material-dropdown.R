#' Change the value of a material_dropdown on the client
#'
#' Change the value of a material_dropdown on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_dropdown.
#' @param value The value to set for the material_dropdown.
#' @param choices The choices to set for the material_dropdown.
#' @seealso \code{\link{material_dropdown}}
#' @examples
#' \dontrun{
#' update_material_dropdown(
#'   session,
#'   input_id = "example_dropdown",
#'   value = "New Text"
#' )
#' }
update_material_dropdown <- function(session, input_id, value = NULL, choices = NULL){
  if(is.null(value)) {
    message("ERROR: Must include 'value' with update_material_dropdown")
    return(NULL)
  }
  
  if(!is.null(choices)){
    
    if(is.null(names(choices)))
      names(choices) <- choices
    
    if(!all(value %in% choices)) {
      for(ele in value[!value %in% choices])
        message("ERROR: value '", ele, "' not found in choices")
      return(NULL)
    }
    
    choices <- gsub(pattern = " ", replacement = "_shinymaterialdropdownspace_", x = choices, fixed = TRUE)
    
    choices_value_js_code <- paste0(
      paste0("$('#", input_id, "').empty(); $('#", input_id, "')"),
      paste0('.append(\'<option value="', choices, '">&nbsp;', names(choices), "</option>')", collapse = "")
    )
    
    session$sendCustomMessage(type = "shinymaterialJS", choices_value_js_code)
    
    choices_label_js_code <- paste0(
      "$('#shiny-material-dropdown-", input_id, "').find('ul').empty();",
      "$('#shiny-material-dropdown-", input_id, "').find('ul')",
      paste0(".append('<li><span>&nbsp;", names(choices), "</span></li>')", collapse = "")
    )
    
    session$sendCustomMessage(type = "shinymaterialJS", choices_label_js_code)
    
  }
  
  valueShow <- gsub(pattern = " ", replacement = "_shinymaterialdropdownspace_", x = value, fixed = TRUE)
  
  value_js_code <- paste0(
    paste0("$('#", input_id, "').find('option[value=\"", valueShow, "\"]').prop('selected', true);", collapse = ""), 
    "$('#", input_id, "').formSelect();",
    "Shiny.onInputChange('", input_id, "', ['", paste0(value, collapse = "','"), "']);"
  )
  
  session$sendCustomMessage(type = "shinymaterialJS", value_js_code)
}

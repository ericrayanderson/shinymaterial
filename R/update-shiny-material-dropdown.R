#' Change the value of a material_dropdown on the client
#'
#' Change the value of a material_dropdown on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_dropdown.
#' @param value The value to set for the material_dropdown.
#' @examples
#' update_material_dropdown(
#'   session,
#'   input_id = "example_dropdown",
#'   value = "New Text"
#' )
update_material_dropdown <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  
  valueShow <- gsub(pattern = " ", replacement = "_shinymaterialdropdownspace_", x = value, fixed = TRUE)
  
  js_code <- paste0(
    "$(", paste0("'#", input_id, "'"), ").find('option[value=", paste0("DOUBLEQUOTE", valueShow, "DOUBLEQUOTE"), "]').prop('selected', true);$(", paste0("'#", input_id, "'"), ").material_select();Shiny.onInputChange('", input_id, "', '", value, "');"
  )
  
  js_code <- gsub(pattern = "DOUBLEQUOTE", replacement = '"', x = js_code)
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
}

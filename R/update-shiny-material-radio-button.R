#' Change the value of a material_radio_button on the client
#'
#' Change the value of a material_radio_button on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_radio_button.
#' @param value The value to set for the material_radio_button.
#' @examples
#' \dontrun{
#' update_material_radio_button(
#'   session,
#'   input_id = "example_radio_button",
#'   value = "new_value"
#' )
#' }
update_material_radio_button <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  
  js_code <- paste0(
    "$(", paste0("'#", input_id, "'"), ").find( DOUBLEQUOTEinput[id='", value, "']:radioDOUBLEQUOTE ).prop('checked', true); Shiny.onInputChange('", input_id, "', '", value, "');"
  )
  
  js_code <- gsub(pattern = "DOUBLEQUOTE", replacement = '"', x = js_code)
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
}

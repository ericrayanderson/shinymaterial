#' Change the value of a material_checkbox on the client
#'
#' Change the value of a material_checkbox on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_checkbox.
#' @param value Boolean. The value to set for the material_checkbox.
#' @seealso \code{\link{material_checkbox}}
#' @examples
#' \dontrun{
#' update_material_checkbox(
#'   session,
#'   input_id = "example_checkbox",
#'   value = TRUE
#' )
#' }
update_material_checkbox <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  
  js_code <- paste0(
    "$('.shiny-material-checkbox').find( DOUBLEQUOTEinput[id='", input_id, "']:checkboxDOUBLEQUOTE ).prop('checked', ", tolower(value), "); Shiny.onInputChange('", input_id, "', $('.shiny-material-checkbox').find( DOUBLEQUOTEinput[id='", input_id, "']:checkboxDOUBLEQUOTE ).prop('checked'));"
  )
  
  js_code <- gsub(pattern = "DOUBLEQUOTE", replacement = '"', x = js_code)
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
}

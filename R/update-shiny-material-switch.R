#' Change the value of a material_switch on the client
#'
#' Change the value of a material_switch on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_switch.
#' @param value Boolean. The value to set for the material_switch.
#' @examples
#' update_material_switch(
#'   session,
#'   input_id = "example_switch",
#'   value = TRUE
#' )
update_material_switch <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  
  checked_code <- paste0(".prop( 'checked', ", tolower(value), " )")
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    paste0(
        "$('#", input_id, "')", checked_code, ";Shiny.onInputChange('", input_id, "', '", value, "');"
    )
  )
}

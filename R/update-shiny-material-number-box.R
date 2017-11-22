#' Change the value of a material_number_box on the client
#'
#' Change the value of a material_number_box on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_number_box.
#' @param value The value to set for the material_number_box.
#' @examples
#' update_material_number_box(
#'   session,
#'   input_id = "example_number_box",
#'   value = 3
#' )
update_material_number_box <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  session$sendCustomMessage(
    type = "shinymaterialJS",
    paste0(
        "$('#", input_id, "').val('", value, "');Shiny.onInputChange('", input_id, "', '", value, "');"
    )
  )
}

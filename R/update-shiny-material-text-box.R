#' Change the value of a material_text_box input on the client
#'
#' Change the value of a material_text_box input on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_text_box.
#' @param value The value to set for the material_text_box.
#' @examples
#' update_material_text_box(
#'   session,
#'   input_id = "example_text_box",
#'   value = "New Text"
#' )
update_material_text_box <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  session$sendCustomMessage(
    type = "shinymaterialJS",
    paste0(
        "$('#", input_id, "').val('", value, "');Shiny.onInputChange('", input_id, "', '", value, "');Materialize.updateTextFields()"
    )
  )
}

#' Change the value of a material_password_box on the client
#'
#' Change the value of a material_password_box on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_password_box.
#' @param value The value to set for the material_password_box.
#' @examples
#' \dontrun{
#' update_material_password_box(
#'   session,
#'   input_id = "example_password_box",
#'   value = "New Password"
#' )
#' }
update_material_password_box <- function(session, input_id, value = NULL){
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

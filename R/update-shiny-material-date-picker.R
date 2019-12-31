#' Change the value of a material_date_picker on the client
#'
#' Change the value of a material_date_picker on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_date_picker.
#' @param value The value to set for the material_date_picker.
#' @seealso \code{\link{material_date_picker}}
#' @examples
#' \dontrun{
#' update_material_date_picker(
#'   session,
#'   input_id = "example_date_picker",
#'   value = "10 April, 2012"
#' )
#' }
update_material_date_picker <- function(session, input_id, value = NULL){
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

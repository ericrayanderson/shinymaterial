#' Change the text, icon of a material_button on the client. Allow to disable.
#'
#' Change the value text, icon of a material_button on the client. 
#' Allow to disable the button and then enable.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_button.
#' @param label The new label of the material_button.
#' @param icon The new icon of the material_button. If not set, icon disappear.
#' @param enable TRUE if the button is enable, FALSE if disable.  
#' @seealso \code{\link{material_button}}
#' @examples
#' \dontrun{
#' update_material_button(
#'   session,
#'   input_id = "example_button",
#'   value = "New Text",
#'   icon = "stop",
#'   enable = FALSE
#' )
#' }
update_material_button <- function (session, input_id, label = NULL, icon = NULL, enable = TRUE) {
  
  js_code <- paste0("$('#", input_id, "').prop( 'disabled', ", tolower(enable), " )")
  session$sendCustomMessage(type = "shinymaterialJS", js_code)
  
  if (!is.null(label)){
    if (!is.null(icon))
      icon <- paste0('<i class="material-icons left">', icon, '</i>')
    js_code <- paste0("$('#", input_id, "').prop( 'innerHTML', '", icon, label, "')")
    session$sendCustomMessage(type = "shinymaterialJS", js_code)
  }
  
}
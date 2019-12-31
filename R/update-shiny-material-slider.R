#' Change the value of a material_slider on the client
#'
#' Change the value of a material_slider on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_slider.
#' @param value The value to set for the material_slider.
#' @seealso \code{\link{material_slider}}
#' @examples
#' \dontrun{
#' update_material_slider(
#'   session,
#'   input_id = "example_slider",
#'   value = "new_value"
#' )
#' }
update_material_slider <- function(session, input_id, value = NULL){
  if(is.null(value)) {
    return(NULL)
  }
  
  js_code <- paste0(
    "$(", paste0("'#", input_id, "'"), ").find('input').val(", value, "); Shiny.onInputChange('", input_id, "', ", value, ");"
  )
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
}

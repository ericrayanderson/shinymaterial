#' Change the value of a material_text_box on the client
#'
#' Change the value of a material_text_box on the client.
#' @param session The session object passed to function given to shinyServer.
#' @param input_id The input_id of the material_text_box.
#' @param value The value to set for the material_text_box.
#' @param disabled NULL by default (do nothing), if TRUE the text box is disable and if FALSE, enable.
#' @seealso \code{\link{material_text_box}}
#' @examples
#' \dontrun{
#' update_material_text_box(
#'   session,
#'   input_id = "example_text_box",
#'   value = "New Text",
#'   disabled = FALSE
#' )
#' }
update_material_text_box <- function(session, input_id, value = NULL, disabled = NULL){
  
  if(!is.null(disabled)){
    js_code <- paste0("$('#", input_id, "').prop( 'disabled', ", tolower(disabled), " )")
    session$sendCustomMessage(type = "shinymaterialJS", js_code)
  }
  
  if(!is.null(value)){
    js_code <- paste0(
      "$('#", input_id, "').val('", value, "');Shiny.onInputChange('", input_id, "', '", value, "');M.updateTextFields()"
    )
    session$sendCustomMessage(type = "shinymaterialJS", js_code)
  } 
  
}

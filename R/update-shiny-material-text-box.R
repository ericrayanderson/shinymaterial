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

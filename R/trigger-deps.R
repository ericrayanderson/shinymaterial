trigger_deps <- function(session){
  
  .id <- create_id()
  
  shiny::showNotification(id = .id,
                          ui = '', 
                          duration = NULL,
                          closeButton = FALSE)
  
  js_code <- paste0(
    "$('#shiny-notification-", .id, "').hide();"
  )
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
  
  shiny::removeNotification(id = .id)
}

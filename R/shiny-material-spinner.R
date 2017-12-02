#' Create a material preloader (spinner)
#'
#' Display a preloader (spinner) while server is busy.
#' @param session The session object passed to function given to shinyServer.
#' @param output_id The output id for which the spinner will be a placeholder for.
#' @aliases material_spinner_show material_spinner_hide
#' @examples
#' if(interactive()){
#'   library(shiny)
#'   library(shinymaterial)
#'   
#'   ui <- material_page(
#'     title = "Spinner Example",
#'     numericInput(inputId = "n", label = "", value = 10),
#'     plotOutput("n_plot")
#'  )
#'   
#'   server <- function(input, output, session) {
#'     
#'     output$n_plot <- renderPlot({
#'     
#'       #--- Show the spinner ---#
#'       material_spinner_show(session, "n_plot")
#'       
#'       #--- Simulate calculation step ---#
#'       Sys.sleep(time = 5)
#'       
#'       #--- Hide the spinner ---#
#'       material_spinner_hide(session, "n_plot")
#'       
#'       plot(1:input$n)
#'     })
#'     
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
material_spinner_show <- function(session, output_id){
  
  js_code <- 
    paste0(
      "$('#", output_id, "').fadeTo(0, 0, function(){ var $thisPlot = $('#", output_id, "'); var plotOffset = $thisPlot.offset(); var width = $thisPlot.width(); var height = $thisPlot.height(); $('<div id = DOUBLEQUOTE", paste0(output_id, '-shiny-material-spinnerDOUBLEQUOTE'), " class=DOUBLEQUOTEpreloader-wrapper big activeDOUBLEQUOTE><div class=DOUBLEQUOTEspinner-layer spinner-blueDOUBLEQUOTE><div class=DOUBLEQUOTEcircle-clipper leftDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEgap-patchDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEcircle-clipper rightDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div></div><div class=DOUBLEQUOTEspinner-layer spinner-redDOUBLEQUOTE><div class=DOUBLEQUOTEcircle-clipper leftDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEgap-patchDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEcircle-clipper rightDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div></div><div class=DOUBLEQUOTEspinner-layer spinner-yellowDOUBLEQUOTE><div class=DOUBLEQUOTEcircle-clipper leftDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEgap-patchDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEcircle-clipper rightDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div></div><div class=DOUBLEQUOTEspinner-layer spinner-greenDOUBLEQUOTE><div class=DOUBLEQUOTEcircle-clipper leftDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEgap-patchDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div><div class=DOUBLEQUOTEcircle-clipper rightDOUBLEQUOTE><div class=DOUBLEQUOTEcircleDOUBLEQUOTE></div></div></div></div>').offset({top: (plotOffset.top + height / 2) - 50, left: (plotOffset.left + width / 2) - 20}).css('position', 'absolute').appendTo('body')})"
    )
  js_code <- gsub(pattern = "DOUBLEQUOTE", replacement = '"', x = js_code)
  
  
  # session$sendCustomMessage(
  #   type = "shinymaterialJS",
  #   paste0("console.log(", js_code, ")")
  # )
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    js_code
  )
  
}

material_spinner_hide <- function(session, output_id){
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    paste0(
      "$('#", paste0(output_id, '-shiny-material-spinner'), "').remove();"
    )
  )
  
  session$sendCustomMessage(
    type = "shinymaterialJS",
    paste0(
      "$('#", output_id, "').fadeTo(0, 1)"
    )
  )
}
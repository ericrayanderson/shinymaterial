#' Place UI content in a modal
#'
#' Put any UI object inside of a modal. The modal will open when the button is pressed.
#' @param modal_id String. The ID for the modal. Must be unique per app
#' @param button_text String. The text displayed on the modal trigger button
#' @param button_icon String. The name of the icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param floating_button Boolean. Should the modal trigger button be a floating button?
#' @param title String. The title of the modal window
#' @param ... The UI elements to place in the modal
#' @examples
#' material_modal(
#'   modal_id = "example_modal",
#'   button_text = "Modal",
#'   title = "Example Modal Title",
#'   shiny::tags$p("Modal Content")
#' )
material_modal <- function(modal_id, button_text, button_icon = "no_icon", floating_button = FALSE, title, ...){
  
  if(button_icon != "no_icon"){
    icon_tag <-
      shiny::HTML(
        paste0(
          '<i class="material-icons left">',
          button_icon,
          '</i>')
      )
  } else {
    icon_tag <- NULL
  }
  
  button_class <- "waves-effect waves-light shiny-material-modal-trigger"
  
  if(!floating_button){
    button_class <- 
      paste0(
        button_class,
        " btn"
      )
  } else {
    button_class <- 
      paste0(
        button_class,
        " btn-floating btn-large waves-effect waves-light z-depth-3"
      )
  }
  
  create_material_object(
    js_file =
      "shiny-material-modal.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = 
            ifelse(
              floating_button,
              "fixed-action-btn",
              ""
            ),
          shiny::tags$button(
            `data-target` = modal_id,
            class = button_class,
            style = 
              ifelse(
                floating_button,
                "background-color:#F06C71",
                ""
              ),
            icon_tag,
            ifelse(
              floating_button,
              "",
              button_text
            )
          )
        ),
        shiny::tags$div(
          id = modal_id,
          class = "modal",
          shiny::tags$div(
            class = "modal-content",
            shiny::tags$h4(title),
            ...
          ),
          shiny::tags$div(
            class = "modal-footer",
            shiny::tags$a(
              href = "javascript:void(0)",
              class = "modal-action modal-close waves-effect waves-green btn-flat",
              "Close"
            )
          )
        )
      )
  )
}
#' Place UI content in a modal
#'
#' Put any UI object inside of a modal. The modal will open when the button is pressed.
#' @param modal_id String. The ID for the modal. Must be unique per application.
#' @param button_text String. The text displayed on the modal trigger button.
#' @param title String. The title of the modal window.
#' @param ... The UI elements to place in the modal
#' @param button_icon String. The name of the icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param floating_button Boolean. Should the modal trigger button be a floating button?
#' @param button_depth Integer. The amount of depth of the button. The value should be between 0 and 5. Leave empty for the default depth.
#' @param button_color String. The color of the button. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param close_button_label String. The label of the modal close button.
#' @param display_button Boolean. Should the button be displayed in the app? (If FALSE, open_material_modal() may be used to open the modal).
#' @examples
#' material_modal(
#'   modal_id = "example_modal",
#'   button_text = "Modal",
#'   title = "Example Modal Title",
#'   button_color = "red lighten-3",
#'   shiny::tags$p("Modal Content")
#' )
material_modal <- function(modal_id, button_text, title, ..., button_icon = NULL, floating_button = FALSE, button_depth = NULL, button_color = NULL, close_button_label = "Close", display_button = TRUE){
  
  if(!is.null(button_icon)){
    empty_button_text <- button_text == "" || is.null(button_text)
    icon_tag <-
      shiny::HTML(
        paste0(
          '<i class="material-icons ', if (!empty_button_text) "left", '">',
          button_icon,
          '</i>')
      )
  } else {
    icon_tag <- NULL
  }
  
  button_class <- paste(
    "waves-effect waves-light shiny-material-modal-trigger modal-trigger",
    if (!is.null(button_color)) button_color,
    if (!is.null(button_depth)) paste0("z-depth-", button_depth),
    if (floating_button) "btn-floating btn-large waves-effect waves-light z-depth-3"
    else "btn shiny-material-button"
  )
  
  create_material_object(
    js_file =
      "shiny-material-modal.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = 
            if(floating_button) "fixed-action-btn",
          shiny::tags$button(
            `data-target` = modal_id,
            display = ifelse(display_button, "inline-block", "none"),
            class = button_class,
            style = 
              paste(
                if(floating_button) "background-color:#F06C71;",
                if(!display_button) "display:none;"
              ),
            icon_tag,
            if(!floating_button) button_text
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
              close_button_label
            )
          )
        )
      )
  )
}
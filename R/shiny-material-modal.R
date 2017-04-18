#' Place UI content in a modal
#'
#' Put any UI object inside of a modal. The modal will open when the button is pressed.
#' @param modal_id String. The ID for the modal. Must be unique per app
#' @param modal_button_text String. The text displayed on the modal trigger button
#' @param modal_title String. The title of the modal window
#' @param ... The UI elements to place in the modal
#' @examples
#' material_modal(
#'   modal_id = "example_modal",
#'   modal_button_text = "Modal",
#'   modal_title = "Example Modal Title",
#'   shiny::tags$p("Modal Content")
#' )
material_modal <- function(modal_id, modal_button_text, modal_title, ...){
  create_material_object(
    js_file =
      "shiny-material-modal.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$button(
          `data-target` = modal_id,
          class = "waves-effect waves-light btn",
          modal_button_text
        ),
        shiny::tags$div(
          id = modal_id,
          class = "modal",
          shiny::tags$div(
            class = "modal-content",
            shiny::tags$h4(modal_title),
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
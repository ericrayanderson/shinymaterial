#' Create a shinymaterial dropdown
#'
#' Build a shinymaterial dropdown.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. The dropdown label.
#' @param choices Named vector. The option names and underyling values.
#' @param selected String. The initially selected underyling value.
#' @param multiple Boolean. Can multiple items be selected?
#' @param color String. The color of the dropdown choices. Leave empty for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{This input requires using color hex codes, rather than the word form. E.g., '#ef5350', rather than 'red lighten-1'.}
#' @examples
#' material_dropdown(
#'   input_id = "example_dropdown",
#'   label = "Drop down",
#'   choices = c(
#'     "Chicken" = "c",
#'     "Steak" = "s",
#'     "Fish" = "f"
#'   ),
#'   selected = c("c"),
#'   multiple = FALSE,
#'   color = "#ef5350"
#' )
material_dropdown <- function(input_id, label, choices = NULL, selected = NULL, multiple = NULL, color = NULL){
  
  if(!is.null(color)){
    
    dropdown_style <-
      shiny::tagList(
        shiny::tags$head(
          shiny::tags$style(
            paste0(
              '
              #shiny-material-dropdown-', input_id, ' ul.dropdown-content.select-dropdown li span {
              color: ', color, ';
               }
              '
            )
          )
        )
      )
    
  } else {
    dropdown_style <- shiny::tags$div()
  }
  
  has_names <- !is.null(names(choices))
  
  if(length(selected) == 1){
    if(is.null(selected)){
      selected_index <- 1
    } else {
      selected_index <- which(choices == selected)
    }
  } else {
    selected_index <- which(choices %in% selected)
  }
  
  material_option_tag_list <- shiny::tagList()
  #comment
  for(i in 1:length(choices)){
    material_option_tag_list[[i]] <-
      shiny::HTML(
        paste0(
          "<option",
          " value=", choices[i],
          ifelse(
            i %in% selected_index,
            " selected",
            ""
          ),
          ">",
          ifelse(
            has_names,
            paste0("&nbsp;", names(choices[i])),
            paste0("&nbsp;", choices[i])
          ),
          "</option>"
        )
      )
  }
  
  create_material_object(
    js_file = "shiny-material-dropdown.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class = "input-field",
          id = paste0('shiny-material-dropdown-', input_id),
          shiny::HTML(
            paste0(
              "<select", ifelse(multiple == TRUE, " multiple", ""),
              " id=", input_id,
              " class='shiny-material-dropdown'",
              ">"
            )
          ),
          material_option_tag_list,
          shiny::HTML("</select>"),
          shiny::tags$label(
            label
          )
        ),
        dropdown_style
      )
  )
}

#' Create a parallax image
#'
#' Use this function to create a parallax effect in your application.
#' @param image_source String. The image file name. Place the image in a folder labeled 'www' at the same level as the application (server.R & ui.R)
#' @examples
#' material_parallax(
#'   image_source = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Freudenberg_sg_Switzerland.jpg/1920px-Freudenberg_sg_Switzerland.jpg"
#' )
material_parallax <- function(image_source){
  create_material_object(
    js_file =
      "shiny-material-parallax.js",
    material_tag_list =
      shiny::tagList(
        shiny::tags$div(
          class="parallax-container",
          shiny::tags$div(
            class = "parallax",
            shiny::tags$img(
              src = image_source
            )
          )
        )
      )
  )
}

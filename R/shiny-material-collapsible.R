#' Create a collapsible that will contain collapsible items
#'
#' Collapsible items must be placed in collapsible.
#' @param ... The collapsible item elements
#' @param depth Integer. The amount of depth of the card. The value should be between 0 and 5. Leave empty for the default depth.
#' @param type String. By Default : "accordion". Can also use c("expandable", "popout").
#' @examples
#' material_collapsible(
#'   type = "popout",
#'   material_collapsible_item(label = "First", icon = "filter_drama"),
#'   material_collapsible_item(label = "Second", icon = "place"),
#'   material_collapsible_item(label = "Third", icon = "whatshot")
#' )
#' @seealso \code{\link{material_collapsible_item}}
material_collapsible <- function(..., depth = NULL, type = NULL){
  tags$ul(
    class = paste(
      "collapsible", 
      if (!is.null(type)) type,
      if (!is.null(depth)) paste0("z-depth-", depth)
    ),
    ...
  )
} 

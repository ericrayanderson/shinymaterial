#' Update the active side nav tab from the code.
#'
#' Update the active side nav tab from the code.
#' @param side_nav_tab_id The side_nav_tab_id of the material_side_nav_tab_content to be shown.
#' @importFrom shinyjs runjs
#' @seealso \code{\link{material_side_nav_tab_content}}
#' @examples
#' \dontrun{
#' activate_material_side_nav_tab(
#'   input_id = "example_material_side_nav_tab_content",
#' )
#' }
activate_material_side_nav_tab <- function(side_nav_tab_id) {
  
  js_code <- paste0(
    "$('.shiny-material-side-nav-tab-content').hide();",
    "$('.shiny-material-side-nav-tab-content').trigger('hide');",
    "$('.shiny-material-side-nav-tab-content').trigger('hidden');",
    "$('.shiny-material-side-nav-tab').removeClass('active');",
    "$('#", side_nav_tab_id, "').show();",
    "$('#", side_nav_tab_id, "').trigger('show');",
    "$('#", side_nav_tab_id, "').trigger('shown');",
    "$('#", side_nav_tab_id, "_tab_id').addClass('active');",
    "$('#side_nav_tabs_click_info').trigger('click');"
  )
  
  shinyjs::runjs(js_code)
}

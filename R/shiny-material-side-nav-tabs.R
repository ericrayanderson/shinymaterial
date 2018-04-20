#' Place UI content within a side-nav tab
#'
#' Use this function to create side-nav tabs in your application.
#' @param side_nav_tabs Named vector. The side-nav tab display names and corresponding side-nav tab ids.
#' @param icons String vector. The names of the icons. Leave blank for no icons, or use "none". The length of the vector must match the length of side_nav_tabs. Visit \url{http://materializecss.com/icons.html} for a list of available icons.
#' @param color String. The accent color of the side-nav tab wave animation. Leave blank for the default color. Visit \url{http://materializecss.com/waves.html} for a list of available colors. \emph{Side-nav tab color requires using word forms of colors (e.g. "purple").}
#' @param font_color String. The side-nav tabs font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Side-nav tab color requires using word forms of colors (e.g. "deep-purple"). Also, lighten or darken effects do not work on side-nav tab colors.}
#' @examples
#' material_side_nav_tabs(
#'   side_nav_tabs = c(
#'     "Example Side-Nav Tab 1" = "example_side_nav_tab_1",
#'     "Example Side-Nav Tab 2" = "example_side_nav_tab_2"
#'   ),
#'   icons = c("cloud", "none"),
#'   color = "teal"
#' )
material_side_nav_tabs <- function(side_nav_tabs, icons = NULL, color = NULL, font_color = NULL){
  
  if(!is.null(icons)){
    
    side_nav_tabs_length <- length(side_nav_tabs)
    icons_length <- length(icons)
    
    if(side_nav_tabs_length != icons_length){
      stop(paste0("Length side_nav_tabs (",
                  side_nav_tabs_length,
                  ") not equal to length icons (", icons_length, ")."))
    }
  }
  
  material_side_nav_tabs <- shiny::tagList()
  
  for(i in 1:length(side_nav_tabs)){
    
    icon_tag.i <- NULL
    
    if(!is.null(icons)){
      if(icons[[i]] != ""){
        icon_tag.i <-
          shiny::HTML(
            paste0(
              '<i class="material-icons">',
              icons[[i]],
              '</i>')
          )
      }
    }
    
    material_side_nav_tabs[[i]] <-
      shiny::tags$li(
        class = "shiny-material-side-nav-tab",
        id = paste0(side_nav_tabs[[i]], "_tab_id"),
        shiny::tags$a(
          class = 
            paste0(
              "waves-effect ",
              ifelse(
                is.null(color),
                "",
                paste0("waves-", color)
              ),
              ifelse(
                is.null(font_color),
                "",
                paste0(" ", font_color, "-text")
              )
            ),
          href = "javascript:void(0)",
          onclick = paste0(
            "$('.shiny-material-side-nav-tab-content').hide();",
            "$('.shiny-material-side-nav-tab-content').trigger('hide');",
            "$('.shiny-material-side-nav-tab-content').trigger('hidden');",
            "$('.shiny-material-side-nav-tab').removeClass('active');",
            "$('#", side_nav_tabs[[i]], "').show();",
            "$('#", side_nav_tabs[[i]], "').trigger('show');",
            "$('#", side_nav_tabs[[i]], "').trigger('shown');",
            "$('#", paste0(side_nav_tabs[[i]], "_tab_id"), "').addClass('active');",
            "$('#side_nav_tabs_click_info').trigger('click');"
          ),
          icon_tag.i, names(side_nav_tabs)[[i]]
        )
      )
  }
  
  shiny::tagList(
    shiny::tags$div(id = "side_nav_tabs_click_info"),
    material_side_nav_tabs
  )
}

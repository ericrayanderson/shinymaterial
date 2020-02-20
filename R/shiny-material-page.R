#' Create a shinymaterial page
#'
#' Build a shinymaterial page.
#' @param ... The UI elements to place in the page.
#' @param title String. The title of the page.
#' @param nav_bar_fixed Boolean. Should the nav bar remain fixed on the screen?
#' @param nav_bar_color Color of the nav bar. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param background_color Page background color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors.
#' @param font_color String. The title font color. Leave blank for the default color. Visit \url{http://materializecss.com/color.html} for a list of available colors. \emph{Title color requires using word forms of colors (e.g. "deep-purple"). Also, lighten or darken effects do not work on title colors.}
#' @param include_fonts Boolean. Should the material font files be included? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @param include_nav_bar Boolean. Should the material nav bar be included?
#' @param include_icons Boolean. Should the material icon files be included? (This will place the font sources in a directory 'www', at the same location as the app code.)
#' @param materialize_in_www Boolean. Should the app look for the materialize library in the 'www' folder? E.g. www/css/materialize.min.css & www/js/materialize.min.js (Default to FALSE - which will look in the package library folder)
#' @param primary_theme_color Primary theme color (use hex code, e.g. '#e57373'). Visit \url{http://materializecss.com/color.html} for a list of material hex codes.
#' @param secondary_theme_color Secondary theme color (use hex code, e.g. '#26a69a'). Visit \url{http://materializecss.com/color.html} for a list of material hex codes.
#' @examples
#' material_page(
#'   title = "Example Title",
#'   nav_bar_fixed = TRUE,
#'   nav_bar_color = "red lighten-2",
#'   background_color = "blue lighten-4",
#'   shiny::tags$h1("Page Content")
#' )
material_page <- function(..., title = "", nav_bar_fixed = FALSE, nav_bar_color = NULL, background_color = "grey lighten-4", font_color = NULL, include_fonts = FALSE, include_nav_bar = TRUE, include_icons = FALSE, materialize_in_www = FALSE, primary_theme_color = NULL, secondary_theme_color = NULL){
  
  materialize_version <- "1.0.0"
  materialicons_version <- "v42"
  
  css_location <- 
    system.file(
      paste0("materialize/", materialize_version, "/css/materialize.min.css"),
      package = "shinymaterial"
    )
  
  js_location <- 
    system.file(
      paste0("materialize/", materialize_version, "/js/materialize.min.js"),
      package = "shinymaterial"
    )
  
  if(!is.null(primary_theme_color) | !is.null(secondary_theme_color)){
    
    if(materialize_in_www){
      stop("The option 'materialize_in_www' cannot be used when setting a 'primary_theme_color' or 'secondary_theme_color'")
    }
    
    .temp_build_dir <- fs::path_temp()
    
    fs::dir_copy(
      system.file(
        paste0("materialize/", materialize_version, "/src/sass"),
        package = "shinymaterial"
      ),
      .temp_build_dir, 
      overwrite = TRUE
    )
    
    scss_content <- readLines(file.path(.temp_build_dir, "components/_variables.scss"))
    
    if(!is.null(primary_theme_color)){
      scss_content[37] <- gsub(
        'color("materialize-red", "lighten-2")',
        primary_theme_color,
        scss_content[37],
        fixed = TRUE
      )
    }
    
    if(!is.null(secondary_theme_color)){
      scss_content[41] <- gsub(
        'color("teal", "lighten-1")',
        secondary_theme_color,
        scss_content[41],
        fixed = TRUE
      )
    }
    
    
    writeLines(scss_content,
               file.path(.temp_build_dir, "components/_variables.scss"))
    
    
    sass::sass(
      input = sass::sass_file(file.path(.temp_build_dir,"materialize.scss")),
      output = file.path(.temp_build_dir, "materialize.min.css")
    )
    
    css_location <- file.path(.temp_build_dir, "materialize.min.css")
  }
  
  if(materialize_in_www){
    css_location <- "www/css/materialize.min.css"
    js_location <- "www/js/materialize.min.js"
  }
  
  if(include_fonts){
    
    dir_recursion("www/fonts/roboto")
    
    font_files <- list.files(
      system.file(paste0("materialize/", materialize_version, "/fonts/roboto"),
                  package = "shinymaterial")
    )
    
    for(font_file.i in font_files){
      file.copy(
        from = system.file(paste0("materialize/", materialize_version, "/fonts/roboto/", font_file.i),
                           package = "shinymaterial"),
        to = paste0("www/fonts/roboto/", font_file.i),
        overwrite = TRUE
      )
    }
  }
  
  
  if(include_icons){
    icons_files <- list.files(
      system.file(file.path("icons", "materialicons", materialicons_version),
                  package = "shinymaterial"),
      full.names = TRUE
    )
    
    
    if (!dir.exists("www/icons/materialicons/")) {
      message("[shinymaterial] Creating directory: www/icons/materialicons/")
      dir.create("www/icons/materialicons/", recursive = TRUE)
    }
    
    for (icon_file.i in icons_files) {
      file.copy(
        from = icon_file.i,
        to = "www/icons/materialicons/",
        overwrite = TRUE, recursive = TRUE
      )
    }
    
    icon_css <- system.file("css/shiny-material-icons.css", package = "shinymaterial")
    
  } else {
    
    icon_css <- "https://fonts.googleapis.com/icon?family=Material+Icons"
    
  }
  
  material_nav_bar <- shiny::tags$nav(
    class = 
      ifelse(
        is.null(nav_bar_color),
        "",
        nav_bar_color
      ),
    shiny::tags$div(
      class = "nav-wrapper",
      shiny::tags$div(
        href = "javascript:void(0)",
        class = paste0(
          "brand-logo ",
          ifelse(
            is.null(font_color),
            "",
            paste0(" ", font_color, "-text")
          )
        ),
        shiny::HTML(paste0("&nbsp;", title))
      )
    )
  )
  
  if(nav_bar_fixed){
    material_nav_bar <- shiny::tags$div(
      class = "navbar-fixed",
      material_nav_bar
    )
  }
  
  if(!include_nav_bar){
    material_nav_bar <- shiny::tags$div()
  }
  
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      # Fonts
      shiny::includeCSS(
        icon_css
      ),
      # Source Materialize CSS
      shiny::includeCSS(
        css_location,
        media = "screen,projection"
      ),
      shiny::includeCSS(
        system.file("css/shiny-material-page.css",
                    package = "shinymaterial")
      ),
      shiny::tags$meta(
        name="viewport",
        content="width=device-width, initial-scale=1.0"
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      class = background_color,
      material_nav_bar,
      ...
    ),
    # Source Materialize Javascript
    shiny::includeScript(
      js_location
    ),
    shiny::includeScript(
      system.file("js/shiny-material-page.js",
                  package = "shinymaterial")
    ),
    shiny::tags$script("
                       Shiny.addCustomMessageHandler('shinymaterialJS',
                       function(code) {
                       //console.log(code.split('\\\\').join('').trim());
                       eval(code.split('\\\\').join('').trim());
                       });
                       ")
  )
}

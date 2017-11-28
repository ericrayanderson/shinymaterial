material_color_class <- function(hex, base, modifier, amt, classes) {
    x <- c(hex=hex, base=base, modifier=modifier, amt=amt, classes=classes)
    class(x) <- c("material_color", "character")
    x
}

`$.material_color` <- function(x, i) {
  x[i]
}

#' Available material colors
#'
#' \code{material_color} - A data frame of colors from the material pallete.
#'
#' @seealso \url{http://materializecss.com/color.html}
#'
#' @examples
#' material_checkbox(
#'   input_id = "example_checkbox",
#'   label = "Checkbox",
#'   initial_value = TRUE,
#'   color = material_color$red_accent_1$classes
#' )


material_color <- structure( list(
	red_lighten5=material_color_class("#ffebee","red","lighten", "5", "red lighten-5"),
	red_lighten4=material_color_class("#ffcdd2","red","lighten", "4", "red lighten-4"),
	red_lighten3=material_color_class("#ef9a9a","red","lighten", "3", "red lighten-3"),
	red_lighten2=material_color_class("#e57373","red","lighten", "2", "red lighten-2"),
	red_lighten1=material_color_class("#ef5350","red","lighten", "1", "red lighten-1"),
	red=material_color_class("#f44336","red","", "", "red"),
	red_darken1=material_color_class("#e53935","red","darken", "1", "red darken-1"),
	red_darken2=material_color_class("#d32f2f","red","darken", "2", "red darken-2"),
	red_darken3=material_color_class("#c62828","red","darken", "3", "red darken-3"),
	red_darken4=material_color_class("#b71c1c","red","darken", "4", "red darken-4"),
	red_accent1=material_color_class("#ff8a80","red","accent", "1", "red accent-1"),
	red_accent2=material_color_class("#ff5252","red","accent", "2", "red accent-2"),
	red_accent3=material_color_class("#ff1744","red","accent", "3", "red accent-3"),
	red_accent4=material_color_class("#d50000","red","accent", "4", "red accent-4"),
	pink_lighten5=material_color_class("#fce4ec","pink","lighten", "5", "pink lighten-5"),
	pink_lighten4=material_color_class("#f8bbd0","pink","lighten", "4", "pink lighten-4"),
	pink_lighten3=material_color_class("#f48fb1","pink","lighten", "3", "pink lighten-3"),
	pink_lighten2=material_color_class("#f06292","pink","lighten", "2", "pink lighten-2"),
	pink_lighten1=material_color_class("#ec407a","pink","lighten", "1", "pink lighten-1"),
	pink=material_color_class("#e91e63","pink","", "", "pink"),
	pink_darken1=material_color_class("#d81b60","pink","darken", "1", "pink darken-1"),
	pink_darken2=material_color_class("#c2185b","pink","darken", "2", "pink darken-2"),
	pink_darken3=material_color_class("#ad1457","pink","darken", "3", "pink darken-3"),
	pink_darken4=material_color_class("#880e4f","pink","darken", "4", "pink darken-4"),
	pink_accent1=material_color_class("#ff80ab","pink","accent", "1", "pink accent-1"),
	pink_accent2=material_color_class("#ff4081","pink","accent", "2", "pink accent-2"),
	pink_accent3=material_color_class("#f50057","pink","accent", "3", "pink accent-3"),
	pink_accent4=material_color_class("#c51162","pink","accent", "4", "pink accent-4"),
	purple_lighten5=material_color_class("#f3e5f5","purple","lighten", "5", "purple lighten-5"),
	purple_lighten4=material_color_class("#e1bee7","purple","lighten", "4", "purple lighten-4"),
	purple_lighten3=material_color_class("#ce93d8","purple","lighten", "3", "purple lighten-3"),
	purple_lighten2=material_color_class("#ba68c8","purple","lighten", "2", "purple lighten-2"),
	purple_lighten1=material_color_class("#ab47bc","purple","lighten", "1", "purple lighten-1"),
	purple=material_color_class("#9c27b0","purple","", "", "purple"),
	purple_darken1=material_color_class("#8e24aa","purple","darken", "1", "purple darken-1"),
	purple_darken2=material_color_class("#7b1fa2","purple","darken", "2", "purple darken-2"),
	purple_darken3=material_color_class("#6a1b9a","purple","darken", "3", "purple darken-3"),
	purple_darken4=material_color_class("#4a148c","purple","darken", "4", "purple darken-4"),
	purple_accent1=material_color_class("#ea80fc","purple","accent", "1", "purple accent-1"),
	purple_accent2=material_color_class("#e040fb","purple","accent", "2", "purple accent-2"),
	purple_accent3=material_color_class("#d500f9","purple","accent", "3", "purple accent-3"),
	purple_accent4=material_color_class("#aa00ff","purple","accent", "4", "purple accent-4"),
	deep_purple_lighten5=material_color_class("#ede7f6","deep-purple","lighten", "5", "deep-purple lighten-5"),
	deep_purple_lighten4=material_color_class("#d1c4e9","deep-purple","lighten", "4", "deep-purple lighten-4"),
	deep_purple_lighten3=material_color_class("#b39ddb","deep-purple","lighten", "3", "deep-purple lighten-3"),
	deep_purple_lighten2=material_color_class("#9575cd","deep-purple","lighten", "2", "deep-purple lighten-2"),
	deep_purple_lighten1=material_color_class("#7e57c2","deep-purple","lighten", "1", "deep-purple lighten-1"),
	deep_purple=material_color_class("#673ab7","deep-purple","", "", "deep-purple"),
	deep_purple_darken1=material_color_class("#5e35b1","deep-purple","darken", "1", "deep-purple darken-1"),
	deep_purple_darken2=material_color_class("#512da8","deep-purple","darken", "2", "deep-purple darken-2"),
	deep_purple_darken3=material_color_class("#4527a0","deep-purple","darken", "3", "deep-purple darken-3"),
	deep_purple_darken4=material_color_class("#311b92","deep-purple","darken", "4", "deep-purple darken-4"),
	deep_purple_accent1=material_color_class("#b388ff","deep-purple","accent", "1", "deep-purple accent-1"),
	deep_purple_accent2=material_color_class("#7c4dff","deep-purple","accent", "2", "deep-purple accent-2"),
	deep_purple_accent3=material_color_class("#651fff","deep-purple","accent", "3", "deep-purple accent-3"),
	deep_purple_accent4=material_color_class("#6200ea","deep-purple","accent", "4", "deep-purple accent-4"),
	indigo_lighten5=material_color_class("#e8eaf6","indigo","lighten", "5", "indigo lighten-5"),
	indigo_lighten4=material_color_class("#c5cae9","indigo","lighten", "4", "indigo lighten-4"),
	indigo_lighten3=material_color_class("#9fa8da","indigo","lighten", "3", "indigo lighten-3"),
	indigo_lighten2=material_color_class("#7986cb","indigo","lighten", "2", "indigo lighten-2"),
	indigo_lighten1=material_color_class("#5c6bc0","indigo","lighten", "1", "indigo lighten-1"),
	indigo=material_color_class("#3f51b5","indigo","", "", "indigo"),
	indigo_darken1=material_color_class("#3949ab","indigo","darken", "1", "indigo darken-1"),
	indigo_darken2=material_color_class("#303f9f","indigo","darken", "2", "indigo darken-2"),
	indigo_darken3=material_color_class("#283593","indigo","darken", "3", "indigo darken-3"),
	indigo_darken4=material_color_class("#1a237e","indigo","darken", "4", "indigo darken-4"),
	indigo_accent1=material_color_class("#8c9eff","indigo","accent", "1", "indigo accent-1"),
	indigo_accent2=material_color_class("#536dfe","indigo","accent", "2", "indigo accent-2"),
	indigo_accent3=material_color_class("#3d5afe","indigo","accent", "3", "indigo accent-3"),
	indigo_accent4=material_color_class("#304ffe","indigo","accent", "4", "indigo accent-4"),
	blue_lighten5=material_color_class("#e3f2fd","blue","lighten", "5", "blue lighten-5"),
	blue_lighten4=material_color_class("#bbdefb","blue","lighten", "4", "blue lighten-4"),
	blue_lighten3=material_color_class("#90caf9","blue","lighten", "3", "blue lighten-3"),
	blue_lighten2=material_color_class("#64b5f6","blue","lighten", "2", "blue lighten-2"),
	blue_lighten1=material_color_class("#42a5f5","blue","lighten", "1", "blue lighten-1"),
	blue=material_color_class("#2196f3","blue","", "", "blue"),
	blue_darken1=material_color_class("#1e88e5","blue","darken", "1", "blue darken-1"),
	blue_darken2=material_color_class("#1976d2","blue","darken", "2", "blue darken-2"),
	blue_darken3=material_color_class("#1565c0","blue","darken", "3", "blue darken-3"),
	blue_darken4=material_color_class("#0d47a1","blue","darken", "4", "blue darken-4"),
	blue_accent1=material_color_class("#82b1ff","blue","accent", "1", "blue accent-1"),
	blue_accent2=material_color_class("#448aff","blue","accent", "2", "blue accent-2"),
	blue_accent3=material_color_class("#2979ff","blue","accent", "3", "blue accent-3"),
	blue_accent4=material_color_class("#2962ff","blue","accent", "4", "blue accent-4"),
	light_blue_lighten5=material_color_class("#e1f5fe","light-blue","lighten", "5", "light-blue lighten-5"),
	light_blue_lighten4=material_color_class("#b3e5fc","light-blue","lighten", "4", "light-blue lighten-4"),
	light_blue_lighten3=material_color_class("#81d4fa","light-blue","lighten", "3", "light-blue lighten-3"),
	light_blue_lighten2=material_color_class("#4fc3f7","light-blue","lighten", "2", "light-blue lighten-2"),
	light_blue_lighten1=material_color_class("#29b6f6","light-blue","lighten", "1", "light-blue lighten-1"),
	light_blue=material_color_class("#03a9f4","light-blue","", "", "light-blue"),
	light_blue_darken1=material_color_class("#039be5","light-blue","darken", "1", "light-blue darken-1"),
	light_blue_darken2=material_color_class("#0288d1","light-blue","darken", "2", "light-blue darken-2"),
	light_blue_darken3=material_color_class("#0277bd","light-blue","darken", "3", "light-blue darken-3"),
	light_blue_darken4=material_color_class("#01579b","light-blue","darken", "4", "light-blue darken-4"),
	light_blue_accent1=material_color_class("#80d8ff","light-blue","accent", "1", "light-blue accent-1"),
	light_blue_accent2=material_color_class("#40c4ff","light-blue","accent", "2", "light-blue accent-2"),
	light_blue_accent3=material_color_class("#00b0ff","light-blue","accent", "3", "light-blue accent-3"),
	light_blue_accent4=material_color_class("#0091ea","light-blue","accent", "4", "light-blue accent-4"),
	cyan_lighten5=material_color_class("#e0f7fa","cyan","lighten", "5", "cyan lighten-5"),
	cyan_lighten4=material_color_class("#b2ebf2","cyan","lighten", "4", "cyan lighten-4"),
	cyan_lighten3=material_color_class("#80deea","cyan","lighten", "3", "cyan lighten-3"),
	cyan_lighten2=material_color_class("#4dd0e1","cyan","lighten", "2", "cyan lighten-2"),
	cyan_lighten1=material_color_class("#26c6da","cyan","lighten", "1", "cyan lighten-1"),
	cyan=material_color_class("#00bcd4","cyan","", "", "cyan"),
	cyan_darken1=material_color_class("#00acc1","cyan","darken", "1", "cyan darken-1"),
	cyan_darken2=material_color_class("#0097a7","cyan","darken", "2", "cyan darken-2"),
	cyan_darken3=material_color_class("#00838f","cyan","darken", "3", "cyan darken-3"),
	cyan_darken4=material_color_class("#006064","cyan","darken", "4", "cyan darken-4"),
	cyan_accent1=material_color_class("#84ffff","cyan","accent", "1", "cyan accent-1"),
	cyan_accent2=material_color_class("#18ffff","cyan","accent", "2", "cyan accent-2"),
	cyan_accent3=material_color_class("#00e5ff","cyan","accent", "3", "cyan accent-3"),
	cyan_accent4=material_color_class("#00b8d4","cyan","accent", "4", "cyan accent-4"),
	teal_lighten5=material_color_class("#e0f2f1","teal","lighten", "5", "teal lighten-5"),
	teal_lighten4=material_color_class("#b2dfdb","teal","lighten", "4", "teal lighten-4"),
	teal_lighten3=material_color_class("#80cbc4","teal","lighten", "3", "teal lighten-3"),
	teal_lighten2=material_color_class("#4db6ac","teal","lighten", "2", "teal lighten-2"),
	teal_lighten1=material_color_class("#26a69a","teal","lighten", "1", "teal lighten-1"),
	teal=material_color_class("#009688","teal","", "", "teal"),
	teal_darken1=material_color_class("#00897b","teal","darken", "1", "teal darken-1"),
	teal_darken2=material_color_class("#00796b","teal","darken", "2", "teal darken-2"),
	teal_darken3=material_color_class("#00695c","teal","darken", "3", "teal darken-3"),
	teal_darken4=material_color_class("#004d40","teal","darken", "4", "teal darken-4"),
	teal_accent1=material_color_class("#a7ffeb","teal","accent", "1", "teal accent-1"),
	teal_accent2=material_color_class("#64ffda","teal","accent", "2", "teal accent-2"),
	teal_accent3=material_color_class("#1de9b6","teal","accent", "3", "teal accent-3"),
	teal_accent4=material_color_class("#00bfa5","teal","accent", "4", "teal accent-4"),
	green_lighten5=material_color_class("#e8f5e9","green","lighten", "5", "green lighten-5"),
	green_lighten4=material_color_class("#c8e6c9","green","lighten", "4", "green lighten-4"),
	green_lighten3=material_color_class("#a5d6a7","green","lighten", "3", "green lighten-3"),
	green_lighten2=material_color_class("#81c784","green","lighten", "2", "green lighten-2"),
	green_lighten1=material_color_class("#66bb6a","green","lighten", "1", "green lighten-1"),
	green=material_color_class("#4caf50","green","", "", "green"),
	green_darken1=material_color_class("#43a047","green","darken", "1", "green darken-1"),
	green_darken2=material_color_class("#388e3c","green","darken", "2", "green darken-2"),
	green_darken3=material_color_class("#2e7d32","green","darken", "3", "green darken-3"),
	green_darken4=material_color_class("#1b5e20","green","darken", "4", "green darken-4"),
	green_accent1=material_color_class("#b9f6ca","green","accent", "1", "green accent-1"),
	green_accent2=material_color_class("#69f0ae","green","accent", "2", "green accent-2"),
	green_accent3=material_color_class("#00e676","green","accent", "3", "green accent-3"),
	green_accent4=material_color_class("#00c853","green","accent", "4", "green accent-4"),
	light_green_lighten5=material_color_class("#f1f8e9","light-green","lighten", "5", "light-green lighten-5"),
	light_green_lighten4=material_color_class("#dcedc8","light-green","lighten", "4", "light-green lighten-4"),
	light_green_lighten3=material_color_class("#c5e1a5","light-green","lighten", "3", "light-green lighten-3"),
	light_green_lighten2=material_color_class("#aed581","light-green","lighten", "2", "light-green lighten-2"),
	light_green_lighten1=material_color_class("#9ccc65","light-green","lighten", "1", "light-green lighten-1"),
	light_green=material_color_class("#8bc34a","light-green","", "", "light-green"),
	light_green_darken1=material_color_class("#7cb342","light-green","darken", "1", "light-green darken-1"),
	light_green_darken2=material_color_class("#689f38","light-green","darken", "2", "light-green darken-2"),
	light_green_darken3=material_color_class("#558b2f","light-green","darken", "3", "light-green darken-3"),
	light_green_darken4=material_color_class("#33691e","light-green","darken", "4", "light-green darken-4"),
	light_green_accent1=material_color_class("#ccff90","light-green","accent", "1", "light-green accent-1"),
	light_green_accent2=material_color_class("#b2ff59","light-green","accent", "2", "light-green accent-2"),
	light_green_accent3=material_color_class("#76ff03","light-green","accent", "3", "light-green accent-3"),
	light_green_accent4=material_color_class("#64dd17","light-green","accent", "4", "light-green accent-4"),
	lime_lighten5=material_color_class("#f9fbe7","lime","lighten", "5", "lime lighten-5"),
	lime_lighten4=material_color_class("#f0f4c3","lime","lighten", "4", "lime lighten-4"),
	lime_lighten3=material_color_class("#e6ee9c","lime","lighten", "3", "lime lighten-3"),
	lime_lighten2=material_color_class("#dce775","lime","lighten", "2", "lime lighten-2"),
	lime_lighten1=material_color_class("#d4e157","lime","lighten", "1", "lime lighten-1"),
	lime=material_color_class("#cddc39","lime","", "", "lime"),
	lime_darken1=material_color_class("#c0ca33","lime","darken", "1", "lime darken-1"),
	lime_darken2=material_color_class("#afb42b","lime","darken", "2", "lime darken-2"),
	lime_darken3=material_color_class("#9e9d24","lime","darken", "3", "lime darken-3"),
	lime_darken4=material_color_class("#827717","lime","darken", "4", "lime darken-4"),
	lime_accent1=material_color_class("#f4ff81","lime","accent", "1", "lime accent-1"),
	lime_accent2=material_color_class("#eeff41","lime","accent", "2", "lime accent-2"),
	lime_accent3=material_color_class("#c6ff00","lime","accent", "3", "lime accent-3"),
	lime_accent4=material_color_class("#aeea00","lime","accent", "4", "lime accent-4"),
	yellow_lighten5=material_color_class("#fffde7","yellow","lighten", "5", "yellow lighten-5"),
	yellow_lighten4=material_color_class("#fff9c4","yellow","lighten", "4", "yellow lighten-4"),
	yellow_lighten3=material_color_class("#fff59d","yellow","lighten", "3", "yellow lighten-3"),
	yellow_lighten2=material_color_class("#fff176","yellow","lighten", "2", "yellow lighten-2"),
	yellow_lighten1=material_color_class("#ffee58","yellow","lighten", "1", "yellow lighten-1"),
	yellow=material_color_class("#ffeb3b","yellow","", "", "yellow"),
	yellow_darken1=material_color_class("#fdd835","yellow","darken", "1", "yellow darken-1"),
	yellow_darken2=material_color_class("#fbc02d","yellow","darken", "2", "yellow darken-2"),
	yellow_darken3=material_color_class("#f9a825","yellow","darken", "3", "yellow darken-3"),
	yellow_darken4=material_color_class("#f57f17","yellow","darken", "4", "yellow darken-4"),
	yellow_accent1=material_color_class("#ffff8d","yellow","accent", "1", "yellow accent-1"),
	yellow_accent2=material_color_class("#ffff00","yellow","accent", "2", "yellow accent-2"),
	yellow_accent3=material_color_class("#ffea00","yellow","accent", "3", "yellow accent-3"),
	yellow_accent4=material_color_class("#ffd600","yellow","accent", "4", "yellow accent-4"),
	amber_lighten5=material_color_class("#fff8e1","amber","lighten", "5", "amber lighten-5"),
	amber_lighten4=material_color_class("#ffecb3","amber","lighten", "4", "amber lighten-4"),
	amber_lighten3=material_color_class("#ffe082","amber","lighten", "3", "amber lighten-3"),
	amber_lighten2=material_color_class("#ffd54f","amber","lighten", "2", "amber lighten-2"),
	amber_lighten1=material_color_class("#ffca28","amber","lighten", "1", "amber lighten-1"),
	amber=material_color_class("#ffc107","amber","", "", "amber"),
	amber_darken1=material_color_class("#ffb300","amber","darken", "1", "amber darken-1"),
	amber_darken2=material_color_class("#ffa000","amber","darken", "2", "amber darken-2"),
	amber_darken3=material_color_class("#ff8f00","amber","darken", "3", "amber darken-3"),
	amber_darken4=material_color_class("#ff6f00","amber","darken", "4", "amber darken-4"),
	amber_accent1=material_color_class("#ffe57f","amber","accent", "1", "amber accent-1"),
	amber_accent2=material_color_class("#ffd740","amber","accent", "2", "amber accent-2"),
	amber_accent3=material_color_class("#ffc400","amber","accent", "3", "amber accent-3"),
	amber_accent4=material_color_class("#ffab00","amber","accent", "4", "amber accent-4"),
	orange_lighten5=material_color_class("#fff3e0","orange","lighten", "5", "orange lighten-5"),
	orange_lighten4=material_color_class("#ffe0b2","orange","lighten", "4", "orange lighten-4"),
	orange_lighten3=material_color_class("#ffcc80","orange","lighten", "3", "orange lighten-3"),
	orange_lighten2=material_color_class("#ffb74d","orange","lighten", "2", "orange lighten-2"),
	orange_lighten1=material_color_class("#ffa726","orange","lighten", "1", "orange lighten-1"),
	orange=material_color_class("#ff9800","orange","", "", "orange"),
	orange_darken1=material_color_class("#fb8c00","orange","darken", "1", "orange darken-1"),
	orange_darken2=material_color_class("#f57c00","orange","darken", "2", "orange darken-2"),
	orange_darken3=material_color_class("#ef6c00","orange","darken", "3", "orange darken-3"),
	orange_darken4=material_color_class("#e65100","orange","darken", "4", "orange darken-4"),
	orange_accent1=material_color_class("#ffd180","orange","accent", "1", "orange accent-1"),
	orange_accent2=material_color_class("#ffab40","orange","accent", "2", "orange accent-2"),
	orange_accent3=material_color_class("#ff9100","orange","accent", "3", "orange accent-3"),
	orange_accent4=material_color_class("#ff6d00","orange","accent", "4", "orange accent-4"),
	deep_orange_lighten5=material_color_class("#fbe9e7","deep-orange","lighten", "5", "deep-orange lighten-5"),
	deep_orange_lighten4=material_color_class("#ffccbc","deep-orange","lighten", "4", "deep-orange lighten-4"),
	deep_orange_lighten3=material_color_class("#ffab91","deep-orange","lighten", "3", "deep-orange lighten-3"),
	deep_orange_lighten2=material_color_class("#ff8a65","deep-orange","lighten", "2", "deep-orange lighten-2"),
	deep_orange_lighten1=material_color_class("#ff7043","deep-orange","lighten", "1", "deep-orange lighten-1"),
	deep_orange=material_color_class("#ff5722","deep-orange","", "", "deep-orange"),
	deep_orange_darken1=material_color_class("#f4511e","deep-orange","darken", "1", "deep-orange darken-1"),
	deep_orange_darken2=material_color_class("#e64a19","deep-orange","darken", "2", "deep-orange darken-2"),
	deep_orange_darken3=material_color_class("#d84315","deep-orange","darken", "3", "deep-orange darken-3"),
	deep_orange_darken4=material_color_class("#bf360c","deep-orange","darken", "4", "deep-orange darken-4"),
	deep_orange_accent1=material_color_class("#ff9e80","deep-orange","accent", "1", "deep-orange accent-1"),
	deep_orange_accent2=material_color_class("#ff6e40","deep-orange","accent", "2", "deep-orange accent-2"),
	deep_orange_accent3=material_color_class("#ff3d00","deep-orange","accent", "3", "deep-orange accent-3"),
	deep_orange_accent4=material_color_class("#dd2c00","deep-orange","accent", "4", "deep-orange accent-4"),
	brown_lighten5=material_color_class("#efebe9","brown","lighten", "5", "brown lighten-5"),
	brown_lighten4=material_color_class("#d7ccc8","brown","lighten", "4", "brown lighten-4"),
	brown_lighten3=material_color_class("#bcaaa4","brown","lighten", "3", "brown lighten-3"),
	brown_lighten2=material_color_class("#a1887f","brown","lighten", "2", "brown lighten-2"),
	brown_lighten1=material_color_class("#8d6e63","brown","lighten", "1", "brown lighten-1"),
	brown=material_color_class("#795548","brown","", "", "brown"),
	brown_darken1=material_color_class("#6d4c41","brown","darken", "1", "brown darken-1"),
	brown_darken2=material_color_class("#5d4037","brown","darken", "2", "brown darken-2"),
	brown_darken3=material_color_class("#4e342e","brown","darken", "3", "brown darken-3"),
	brown_darken4=material_color_class("#3e2723","brown","darken", "4", "brown darken-4"),
	grey_lighten5=material_color_class("#fafafa","grey","lighten", "5", "grey lighten-5"),
	grey_lighten4=material_color_class("#f5f5f5","grey","lighten", "4", "grey lighten-4"),
	grey_lighten3=material_color_class("#eeeeee","grey","lighten", "3", "grey lighten-3"),
	grey_lighten2=material_color_class("#e0e0e0","grey","lighten", "2", "grey lighten-2"),
	grey_lighten1=material_color_class("#bdbdbd","grey","lighten", "1", "grey lighten-1"),
	grey=material_color_class("#9e9e9e","grey","", "", "grey"),
	grey_darken1=material_color_class("#757575","grey","darken", "1", "grey darken-1"),
	grey_darken2=material_color_class("#616161","grey","darken", "2", "grey darken-2"),
	grey_darken3=material_color_class("#424242","grey","darken", "3", "grey darken-3"),
	grey_darken4=material_color_class("#212121","grey","darken", "4", "grey darken-4"),
	blue_grey_lighten5=material_color_class("#eceff1","blue-grey","lighten", "5", "blue-grey lighten-5"),
	blue_grey_lighten4=material_color_class("#cfd8dc","blue-grey","lighten", "4", "blue-grey lighten-4"),
	blue_grey_lighten3=material_color_class("#b0bec5","blue-grey","lighten", "3", "blue-grey lighten-3"),
	blue_grey_lighten2=material_color_class("#90a4ae","blue-grey","lighten", "2", "blue-grey lighten-2"),
	blue_grey_lighten1=material_color_class("#78909c","blue-grey","lighten", "1", "blue-grey lighten-1"),
	blue_grey=material_color_class("#607d8b","blue-grey","", "", "blue-grey"),
	blue_grey_darken1=material_color_class("#546e7a","blue-grey","darken", "1", "blue-grey darken-1"),
	blue_grey_darken2=material_color_class("#455a64","blue-grey","darken", "2", "blue-grey darken-2"),
	blue_grey_darken3=material_color_class("#37474f","blue-grey","darken", "3", "blue-grey darken-3"),
	blue_grey_darken4=material_color_class("#263238","blue-grey","darken", "4", "blue-grey darken-4"),
	black=material_color_class("#000000","black","", "", "black"),
	white=material_color_class("#ffffff","white","", "", "white")
),
row.names=c("hex", "base", "modifier", "amt", "classes"),
class="data.frame"
)

#' \code{build_color} - look up a material color by base, modifier and amt
#' @param base base color
#' @param modifier color modifier
#' @param amt 1-5 as character if modifier is not ""
#' @rdname material_color
build_color <- local({
  
  f <- function(base, modifier, amt) {
    base <- match.arg(base)
    modifier <- match.arg(modifier)
    amt <- match.arg(amt)
    material_color[, 
                   material_color["base",,drop=TRUE] %in% base & 
                   material_color["modifier",,drop=TRUE] %in% modifier & 
                   material_color["amt",,drop=TRUE] %in% amt 
    ]
    
  }

  for(i in names(formals(f)))
    formals(f)[[i]] <- sort(unlist(unique(material_color[i,,drop=TRUE]), use.names = FALSE))
  
  f
})

modify_color <- function(up, down){
  force(up)
  force(down)
  function(color, amt) {
    if(amt > 1) color <- Recall(color, amt - 1)
    if(color$modifier == "") {
      build_color(color$base, up, "1")
    } else if (color$modifier == down && color$amt == "1") {
      build_color(color$base, "", "")
    } else if (color$modifier == down) {
      build_color(color$base, down, as.character(as.numeric(color$amt) - 1L))
    } else if (color$modifier == up) {
      build_color(color$base, up, as.character(pmin(5L, as.numeric(color$amt) + 1L)))
    } else{
      warning("should be impossible")
      color
    }
  }
}

#' \code{darken} and \code{lighten} - adjust colors dynamically
#' @rdname material_color
darken <- modify_color("darken", "lighten")

#' @rdname material_color
lighten <- modify_color("lighten", "darken")


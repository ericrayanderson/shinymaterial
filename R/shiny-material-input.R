#' Create a shinymaterial input
#'
#' Build a shinymaterial input.
#' @param type String. The type of input to be created.
#' @param ... Additional arguments for the input.
#' @examples
#' ##-- switch --##
#' material_input(
#'   type = "switch",
#'   input_id = "example_switch",
#'   label = "Switch",
#'   off_label = "Off",
#'   on_label = "On",
#'   initial_value = TRUE
#' )
material_input <- function(type, ...){
  
  function_name <-
    check_material_function_name(type = type,
                                 function_type = "input")

  do.call(
    what = function_name,
    args =
      list(
        ...
      )
  )
}

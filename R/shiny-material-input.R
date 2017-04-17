#' Create a shinymaterial input
#'
#' Build a shinymaterial input of any available type.
#' @param type String. The type of input to be created. See section "Input Types" for list of available types.
#' @param input_id String. The input identifier used to access the value.
#' @param label String. Display label for input.
#' @param ... Additional arguments for the input type.
#' @section Input Types:
#' \itemize{
#'   \item{
#'   \strong{button}
#'   \itemize{
#'   \item{\code{icon} \emph{(String. The name of the icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.)}}
#'   }
#'   }
#'   \item{
#'   \strong{checkbox}
#'   \itemize{
#'   \item{\code{initial_value} \emph{(Boolean. The initial value.)}}
#'   }
#'   }
#'   \item{
#'   \strong{dropdown}
#'   \itemize{
#'   \item{\code{choices} \emph{(Named vector. The list of option names and underyling values.)}}
#'   \item{\code{selected} \emph{(String. The initial selected underyling value.)}}
#'   \item{\code{multiple} \emph{(Boolean. Can multiple items be selected?)}}
#'   }
#'   }
#'   \item{
#'   \strong{floating-button}
#'   \itemize{
#'   \item{\code{icon} \emph{(String. The name of the icon. Visit \url{http://materializecss.com/icons.html} for a list of available icons.)}}
#'   }
#'   }
#'   \item{
#'   \strong{number-box}
#'   \itemize{
#'   \item{\code{min_value} \emph{(Number. The minimum allowable value.)}}
#'   \item{\code{max_value} \emph{(Number. The maximum allowable value.)}}
#'   \item{\code{initial_value} \emph{(Number. The initial value.)}}
#'   }
#'   }
#'   \item{
#'   \strong{password-box}
#'   }
#'   \item{
#'   \strong{radio-button}
#'   \itemize{
#'   \item{\code{choices} \emph{(Named vector. The list of option names and underyling values.)}}
#'   }
#'   }
#'   \item{
#'   \strong{slider}
#'   \itemize{
#'   \item{\code{min_value} \emph{(Number. The minimum allowable value.)}}
#'   \item{\code{max_value} \emph{(Number. The maximum allowable value.)}}
#'   \item{\code{initial_value} \emph{(Number. The initial value.)}}
#'   }
#'   }
#'   \item{
#'   \strong{switch}
#'   \itemize{
#'   \item{\code{off_label} \emph{(String. The label for the 'off' portion of the switch.)}}
#'   \item{\code{on_label} \emph{(String. The label for the 'on' portion of the switch.)}}
#'   \item{\code{initial_value} \emph{(Boolean. The initial value.)}}
#'   }
#'   }
#'   \item{
#'   \strong{text-box}
#'   }
#' }
#' @examples
#' ##-- button --##
#' material_input(
#'   type = "button",
#'   input_id = "example_button",
#'   label = "Button",
#'   icon = "done"
#' )
#'
#' ##-- checkbox --##
#' material_input(
#'   type = "checkbox",
#'   input_id = "example_checkbox",
#'   label = "Checkbox"
#' )
#'
#' ##-- dropdown --##
#' material_input(
#'   type = "dropdown",
#'   input_id = "example_dropdown",
#'   label = "Dropdown",
#'   choices = c(
#'     "Chicken" = "c",
#'     "Steak" = "s",
#'     "Fish" = "f"
#'   ),
#'   selected = c("c"),
#'   multiple = FALSE
#' )
#'
#' ##-- floating-button --##
#' material_input(
#'   type = "floating-button",
#'   input_id = "example_floating_button",
#'   label = "Floating Button",
#'   icon = "done"
#' )
#'
#' ##-- number-box --##
#' material_input(
#'   type = "number-box",
#'   input_id = "example_number_box",
#'   label = "Number Box",
#'   min_value = 1,
#'   max_value = 10,
#'   initial_value = 2
#' )
#'
#' ##-- password-box --##
#' material_input(
#'   type = "password-box",
#'   input_id = "example_password_box",
#'   label = "Password Box"
#' )
#'
#' ##-- radio-button --##
#' material_input(
#'   type = "radio-button",
#'   input_id = "example_radio_button",
#'   label = "Radio Button",
#'   choices = c(
#'     "Cake" = "c",
#'     "Pie" = "p",
#'     "Brownie" = "b"
#'   )
#' )
#'
#' ##-- slider --##
#' material_input(
#'   type = "slider",
#'   input_id = "example_slider",
#'   label = "Slider",
#'   min_value = 1,
#'   max_value = 10,
#'   initial_value = 2
#' )
#'
#' ##-- switch --##
#' material_input(
#'   type = "switch",
#'   input_id = "example_switch",
#'   label = "Switch",
#'   off_label = "Off",
#'   on_label = "On"
#' )
#'
#' ##-- text-box --##
#' material_input(
#'   type = "text-box",
#'   input_id = "example_text_box",
#'   label = "Text Box"
#' )
material_input <- function(type, input_id, label, ...){

  function_name <-
    check_material_function_name(type = type,
                                 function_type = "input")

  do.call(
    what = function_name,
    args =
      list(
        input_id = input_id,
        label = label,
        ...
      )
  )
}

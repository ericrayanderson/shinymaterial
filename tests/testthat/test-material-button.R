test_that("material_button creates valid shiny tag", {
  button <- material_button(
    input_id = "test_button",
    label = "Test Button"
  )

  expect_s3_class(button, "shiny.tag.list")
})

test_that("material_button includes icon when specified", {
  button <- material_button(
    input_id = "test_button",
    label = "Test Button",
    icon = "cloud"
  )

  expect_s3_class(button, "shiny.tag.list")
})

test_that("material_button includes depth class when specified", {
  button <- material_button(
    input_id = "test_button",
    label = "Test Button",
    depth = 3
  )

  expect_s3_class(button, "shiny.tag.list")
})

test_that("material_button includes color class when specified", {
  button <- material_button(
    input_id = "test_button",
    label = "Test Button",
    color = "blue lighten-2"
  )

  expect_s3_class(button, "shiny.tag.list")
})

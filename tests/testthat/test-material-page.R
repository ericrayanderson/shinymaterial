test_that("material_page creates valid HTML structure", {
  page <- material_page(
    title = "Test Page",
    shiny::tags$div("Content")
  )

  expect_s3_class(page, "shiny.tag")
  expect_equal(page$name, "html")
})

test_that("material_page respects nav_bar_fixed option", {
  page_fixed <- material_page(
    title = "Test",
    nav_bar_fixed = TRUE
  )

  page_normal <- material_page(
    title = "Test",
    nav_bar_fixed = FALSE
  )

  expect_s3_class(page_fixed, "shiny.tag")
  expect_s3_class(page_normal, "shiny.tag")
})

test_that("material_page throws error for invalid theme options", {
  expect_error(
    material_page(
      title = "Test",
      materialize_in_www = TRUE,
      primary_theme_color = "#ff0000"
    ),
    "cannot be used when setting"
  )
})

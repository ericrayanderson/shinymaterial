test_that("update_material_dropdown throws error for missing value", {
  # Create a mock session
  mock_session <- list(
    sendCustomMessage = function(type, message) {}
  )

  expect_error(
    update_material_dropdown(
      session = mock_session,
      input_id = "test_dropdown",
      value = NULL
    ),
    "Must include"
  )
})

test_that("update_material_dropdown throws error when value not in choices", {
  mock_session <- list(
    sendCustomMessage = function(type, message) {}
  )

  expect_error(
    update_material_dropdown(
      session = mock_session,
      input_id = "test_dropdown",
      value = "invalid",
      choices = c("a", "b", "c")
    ),
    "not found in choices|not in the provided choices"
  )
})

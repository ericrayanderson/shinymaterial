if(interactive()){
  library(shiny)
  library(shinymaterial)
  
  ui <-
    material_page(
      title = "Testing", nav_bar_fixed = TRUE,
      nav_bar_color = 'red lighten-3',
      background_color = "white",
      material_side_nav(
        tags$h4("stuff"),
        background_color = "blue lighten-4"
      ),
      tags$div(
        class = "container",
        
        material_modal(
          modal_id = "example_modal",
          button_text = "Modal",
          title = "Example Modal Title",
          button_color = "red lighten-4",
          button_depth = 5,
          shiny::tags$p("Modal Content"),
          close_button_label = "Close2"
        ),
        material_modal(
          modal_id = "example_modal2",
          button_text = "Modal2",
          title = "Example Modal Title",
          button_color = "red lighten-4",
          button_depth = 5,
          shiny::tags$p("Modal Content"),
          close_button_label = "Close2", display_button = FALSE
        ),
        material_button(input_id = "open_modal2", label = "testmodal"),
        material_tabs(
          tabs = c(
            "Example Tab 1" = "example_tab_1",
            "Example Tab 2" = "example_tab_2"
          ),
          color = "purple"
        ),
        material_tabs(
          tabs = c(
            "Example Tab 11" = "example_tab_11",
            "Example Tab 22" = "example_tab_22"
          ),
          color = "deep-purple"
        ),
        material_card(
          title = "Example Card",
          shiny::tags$h1("Card Content"),
          depth = 5
        ),
        # Button ------------------------------------------------------------------
        material_input(
          type = "button",
          input_id = "input_button1",
          label = "IButton"
        ),
        material_button(
          input_id = "button1",
          label = "Button"
        ),
        
        material_input(
          type = "button",
          input_id = "input_button2",
          label = "IButton",
          icon = "cloud",
          depth = 5,
          color = "blue"
        ),
        material_button(
          input_id = "button2",
          label = "Button",
          icon = "cloud",
          depth = 5,
          color = "blue lighten-4"
        ),
        # Checkbox ------------------------------------------------------------------
        material_input(
          type = "checkbox",
          input_id = "input_checkbox1",
          label = "Icheckbox"
        ),
        material_checkbox(
          input_id = "checkbox1",
          label = "checkbox"
        ),
        material_input(
          type = "checkbox",
          input_id = "input_checkbox2",
          label = "Icheckbox",
          initial_value = TRUE,
          color = "blue"
        ),
        material_checkbox(
          input_id = "checkbox2",
          label = "checkbox",
          initial_value = TRUE,
          color = "#ef5350"
        ),
        # Switch ------------------------------------------------------------------
        material_input(
          type = "switch",
          input_id = "input_switch1",
          label = "Iswitch",
          off_label = "Off",
          on_label = "On"
        ),
        material_switch(
          input_id = "switch1",
          label = "switch",
          off_label = "Off",
          on_label = "On"
        ),
        material_input(
          type = "switch",
          input_id = "input_switch2",
          label = "Iswitch",
          off_label = "Off",
          on_label = "On",
          initial_value = TRUE,
          color = "blue"
        ),
        material_switch(
          input_id = "switch2",
          label = "switch",
          off_label = "Off",
          on_label = "On",
          initial_value = TRUE,
          color = "#bbdefb"
        ),
        # Floating Button ------------------------------------------------------------------
        # material_input(
        #   type = "floating_button",
        #   input_id = "input_floating_button1"
        # )
        # material_floating_button(
        #   input_id = "floating_button1"
        # )
        # 
        # material_input(
        #   type = "floating_button",
        #   input_id = "input_floating_button2",
        #   icon = "cloud",
        #   depth = 5,
        #   color = "blue"
        # )
        # material_floating_button(
        #   input_id = "floating_button2",
        #   icon = "cloud",
        #   depth = 5,
        #   color = "blue"
        # ),
        # Number box ------------------------------------------------------------------
        material_input(
          type = "number_box",
          input_id = "input_number_box1",
          label = "input_number_box1",
          min_value = 5,
          max_value = 15,
          initial_value = 10
        ),
        material_number_box(
          input_id = "number_box1",
          label = "number_box1",
          min_value = 5,
          max_value = 15,
          initial_value = 10
        ),
        
        material_input(
          type = "number_box",
          input_id = "input_number_box2",
          label = "input_number_box2",
          min_value = 5,
          max_value = 15,
          initial_value = 10,
          color = "blue"
        ),
        material_number_box(
          input_id = "number_box2",
          label = "number_box2",
          min_value = 5,
          max_value = 15,
          initial_value = 10,
          color = "#bbdefb"
        ),
        
        # Text box ------------------------------------------------------------------
        material_input(
          type = "text_box",
          input_id = "input_text_box1",
          label = "input_text_box1"
        ),
        material_text_box(
          input_id = "text_box1",
          label = "text_box1"
        ),
        
        material_input(
          type = "text_box",
          input_id = "input_text_box2",
          label = "input_text_box2",
          color = "blue"
        ),
        material_text_box(
          input_id = "text_box2",
          label = "text_box2",
          color = "blue"
        ),
        # password box ------------------------------------------------------------------
        material_input(
          type = "password_box",
          input_id = "input_password_box1",
          label = "input_password_box1"
        ),
        material_password_box(
          input_id = "password_box1",
          label = "password_box1"
        ),
        
        material_input(
          type = "password_box",
          input_id = "input_password_box2",
          label = "input_password_box2",
          color = "red"
        ),
        material_password_box(
          input_id = "password_box",
          label = "password_box_red",
          color = "#ef5350"
        ),
        # material_floating_button(
        #   input_id = "example_floating_button",
        #   icon = "mode_edit",
        #   depth = 5,
        #   color = "red lighten-2"
        # ),
        # Radio buttons ------------------------------------------------------------------
        material_input(
          type = "radio-button",
          input_id = "input_example_radio_button1",
          label = "Radio Button",
          choices = c(
            "Cake" = "c",
            "Pie" = "p",
            "Brownie" = "b"
          )
        ),
        material_radio_button(
          input_id = "example_radio_button1",
          label = "Radio Button VALUE",
          choices = c(
            "Cake" = "c1",
            "Pie" = "p1",
            "Brownie" = "b1"
          )
        ),
        material_input(
          type = "radio-button",
          input_id = "input_example_radio_button2",
          label = "Radio Button",
          choices = c(
            "Cake" = "c2",
            "Pie" = "p2",
            "Brownie" = "b2"
          ),
          color = "blue"
        ),
        material_radio_button(
          input_id = "example_radio_button2",
          label = "Radio Button",
          choices = c(
            "Cake" = "c3",
            "Pie" = "p3",
            "Brownie" = "b3"
          ),
          color = "#bbdefb"
        ),
        # slider ------------------------------------------------------------------
        material_input(
          type = "slider",
          input_id = "input_example_slider1",
          label = "slider",
          min_value = 5,
          max_value = 15,
          initial_value = 10,
          color = "blue"
        ),
        material_slider(
          input_id = "example_slider1",
          label = "slider",
          min_value = 5,
          max_value = 15,
          initial_value = 10,
          color = "#bbdefb"
        ),
        # dropdown
        material_input(
          type = "dropdown",
          input_id = "input_example_dropdown1",
          label = "Drop down",
          choices = c(
            "Chicken" = "c1",
            "Steak" = "s1",
            "Fish" = "f1"
          ),
          selected = c("c"),
          multiple = FALSE
        ),
        
        material_dropdown(
          input_id = "example_dropdown1",
          label = "Drop down",
          choices = c(
            "Chicken" = "c2",
            "Ste ak" = "s 2",
            "Fish" = "f2"
          ),
          selected = c("c2"),
          multiple = FALSE,
          color = "#ef5350"
        ),
        material_dropdown(
          input_id = "input_example_dropdown_mult",
          label = "Drop down",
          choices = c(
            "Chick en" = "c 2",
            "Ste ak" = "s 2",
            "Fi sh" = "f 2"
          ),
          selected = c("c 2"),
          multiple = TRUE,
          color = "#ef5350"
        ),
        # date picker -------------------------------------------------------------
        material_date_picker(
          input_id = "example_date_picker",
          label = "Date picker",
          color = 'purple'
        ),
        # file input --------------------------------------------------------------
        material_file_input(
          input_id = "example_file_input",
          label = "File",
          color = "#2196f3"
        ),
        material_file_input(
          input_id = "example_file_input2",
          label = "File"
        ),
        material_button(input_id = "update_text_test_button",
                        label = "update text"),
        material_text_box(input_id = "update_text_test",
                          label = "text"),
        plotOutput('testPlot'),
        material_button(input_id = "update_dropdown_test_button",
                        label = "update dropdown"),
        material_dropdown(input_id = "update_dropdown_test",
                          label = "test",
                          choices = c(
                            "A 1" = "a", 
                            "B 1" = "o k")),
        plotOutput('testDropdownPlot'),
        
        material_button(input_id = "update_number_box_test_button",
                        label = "update number box"),
        material_number_box(input_id = "update_number_box_test",
                            label = "test",
                            min_value = 1,
                            max_value = 50,
                            initial_value = 2),
        plotOutput('testNumberboxPlot'),
        
        material_button(input_id = "update_password_test_button",
                        label = "update password"),
        material_password_box(input_id = "update_password_test",
                              label = "text"),
        plotOutput('testPasswordPlot'),
        
        
        material_button(input_id = "update_switch_test_button",
                        label = "update switch"),
        material_switch(input_id = "update_switch_test",
                        label = "text", initial_value = FALSE),
        plotOutput('testSwitchPlot'),
        
        material_button(input_id = "update_radio_button_test_button",
                        label = "update radio button"),
        material_radio_button(input_id = "update_radio_button_test",
                              label = "text",choices = c("Adf" =  "a_update", "Bdf" = "b_update")),
        plotOutput('testRadioButtonPlot'),
        
        material_button(input_id = "update_slider_test_button",
                        label = "update slider"),
        material_slider(input_id = "update_slider_test",
                              label = "slider",
                              min_value = 5,
                        max_value = 20,
                        initial_value = 8),
        plotOutput('testSliderPlot'),
        
        material_button(input_id = "update_checkbox_test_button",
                        label = "update checkbox"),
        material_checkbox(input_id = "update_checkbox_test",
                        label = "checkbox",
                        initial_value = FALSE),
        plotOutput('testCheckboxPlot'),
        
        material_button(input_id = "update_date_picker_test_button",
                        label = "update date_picker"),
        material_date_picker(input_id = "update_date_picker_test",
                          label = "date_picker"),
        plotOutput('testDatePickerPlot')
      )
    )
  
  
  
  
  
  server <- function(input, output, session) {
    observeEvent(input$open_modal2, {
      message('this happened')
      if(input$open_modal2 > 0){
      open_material_modal(session, "example_modal2")
      }
    })
    #button
    observeEvent(input$input_button1, {
      message(input$input_button1)
    })
    observeEvent(input$button1, {
      message(input$button1)
    })
    observeEvent(input$input_button2, {
      message(input$input_button2)
    })
    observeEvent(input$button2, {
      message(input$button2)
    })
    #checkbox
    observeEvent(input$input_checkbox1, {
      message(input$input_checkbox1)
    })
    observeEvent(input$checkbox1, {
      message(input$checkbox1)
    })
    observeEvent(input$input_checkbox2, {
      message(input$input_checkbox2)
    })
    observeEvent(input$checkbox2, {
      message(input$checkbox2)
    })
    #switch
    observeEvent(input$input_switch1, {
      message(input$input_switch1)
    })
    observeEvent(input$switch1, {
      message(input$switch1)
    })
    observeEvent(input$input_switch2, {
      message(input$input_switch2)
    })
    observeEvent(input$switch2, {
      message(input$switch2)
    })
    # floating button
    observeEvent(input$floating_button2, {
      message(input$floating_button2)
    })
    
    # Number box
    observeEvent(input$input_number_box1, {
      message(input$input_number_box1)
    })
    observeEvent(input$number_box1, {
      message(input$number_box1)
    })
    observeEvent(input$input_number_box2, {
      message(input$input_number_box2)
    })
    observeEvent(input$number_box2, {
      message(input$number_box2)
    })
    #text box
    observeEvent(input$input_text_box1, {
      message(input$input_text_box1)
    })
    observeEvent(input$text_box1, {
      message(input$text_box1)
    })
    observeEvent(input$input_text_box2, {
      message(input$input_text_box2)
    })
    observeEvent(input$text_box2, {
      message(input$text_box2)
    })
    # floating button
    observeEvent(input$example_floating_button, {
      message(input$example_floating_button)
    })
    #password box
    observeEvent(input$input_password_box1, {
      message(input$input_password_box1)
    })
    observeEvent(input$password_box1, {
      message(input$password_box1)
    })
    observeEvent(input$input_password_box2, {
      message(input$input_password_box2)
    })
    observeEvent(input$password_box2, {
      message(input$password_box2)
    })
    
    # slider
    observeEvent(input$input_example_slider1, {
      message(input$input_example_slider1)
    })
    observeEvent(input$example_slider1, {
      message(input$example_slider1)
    })
    
    #input_radio_button
    observeEvent(input$input_example_radio_button1, {
      message(input$input_example_radio_button1)
    })
    observeEvent(input$example_radio_button1, {
      message(input$example_radio_button1)
    })
    observeEvent(input$input_example_radio_button2, {
      message(input$input_example_radio_button2)
    })
    observeEvent(input$example_radio_button2, {
      message(input$example_radio_button2)
    })
    
    observeEvent(input$input_example_dropdown1, {
      message(input$input_example_dropdown1)
    })
    
    observeEvent(input$input_example_dropdown_mult, {
      message(input$input_example_dropdown_mult)
    })
    observeEvent(input$example_dropdown1, {
      message(input$example_dropdown1)
    })
    observeEvent(input$example_date_picker, {
      message(input$example_date_picker)
    })
    
    observeEvent(input$update_text_test_button, {
      
      update_material_text_box(session,
                               input_id = "update_text_test",
                               value = "ok")
      
    })
    
    output$testPlot <- renderPlot({
      plot(1:10, main = input$update_text_test)
    })
    
    observeEvent(input$update_dropdown_test_button, {
      update_material_dropdown(
        session,
        input_id = "update_dropdown_test",
        value = "o k"
      )
    })
    
    output$testDropdownPlot <- renderPlot({
      plot(1:10, main = input$update_dropdown_test)
    })
    
    
    
    # update number box -----------------------------------
    observeEvent(input$update_number_box_test_button, {
      update_material_number_box(
        session,
        input_id = "update_number_box_test",
        value = 10
      )
    })
    
    output$testNumberboxPlot <- renderPlot({
      plot(1:input$update_number_box_test)
    })
    
    
    # Update password box ---------------------------------
    observeEvent(input$update_password_test_button, {
      
      update_material_text_box(session,
                               input_id = "update_password_test",
                               value = "ok")
      
    })
    
    output$testPasswordPlot <- renderPlot({
      plot(1:10, main = input$update_password_test)
    })
    
    
    # Update switch ---------------------------------
    observeEvent(input$update_switch_test_button, {
      
      update_material_switch(session,
                             input_id = "update_switch_test",
                             value = TRUE)
      
    })
    
    output$testSwitchPlot <- renderPlot({
      message(typeof(input$update_switch_test))
      plot(1:10, main = ifelse(input$update_switch_test, "YES", "NO"))
    })
    
    # Update radiobutton ---------------------------------
    observeEvent(input$update_radio_button_test_button, {
      
      update_material_radio_button(session,
                                   input_id = "update_radio_button_test",
                                   value = "b_update")
      
    })
    
    output$testRadioButtonPlot <- renderPlot({
      plot(1:10, main = input$update_radio_button_test)
    })
    
    # Update slider ---------------------------------
    observeEvent(input$update_slider_test_button, {
      
      update_material_slider(session,
                                   input_id = "update_slider_test",
                                   value = 15)
      
    })
    
    output$testSliderPlot <- renderPlot({
      plot(1:input$update_slider_test)
    })
    
    # Update checkbox ---------------------------------
    observeEvent(input$update_checkbox_test_button, {
      
      update_material_checkbox(session,
                             input_id = "update_checkbox_test",
                             value = TRUE)
      
    })
    
    output$testCheckboxPlot <- renderPlot({
      # message(typeof(input$update_checkbox_test))
      plot(1:10, main = ifelse(input$update_checkbox_test, "True Value", "False Value"))
    })
    
    
    
    # Update date picker ---------------------------------
    observeEvent(input$update_date_picker_test_button, {

      update_material_date_picker(session,
                               input_id = "update_date_picker_test",
                               value = "10 April, 2012")

    })
    
    output$testDatePickerPlot <- renderPlot({
      message(input$update_date_picker_test)
      # message(typeof(input$update_checkbox_test))
      plot(1:10, main = input$update_date_picker_test)
    })
    
    
    observeEvent(input$example_file_input, {
      inFile <- input$example_file_input
      #  message(Sys.time())
      # message(paste(input$example_file_input, collapse = ' - '))
      if (is.null(inFile))
        return(NULL)
      #  req(input$example_file_input)
      #  x <- input$example_file_input
      # save(x, file = "infile.Rdata")
      message(paste0("length inFile ", length(inFile)))
      message(paste0("names inFile ", names(inFile)))
      #  message(input$example_file_input)
      x <- read.csv(inFile$datapath)
      message(head(x))
    })
  }
  
  # Run the application
  shinyApp(ui = ui, server = server)
}
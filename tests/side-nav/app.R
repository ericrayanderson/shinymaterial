library(dplyr)
library(lubridate)
library(ggvis)
library(jsonlite)
library(curl)
library(shiny)
library(shinymaterial)

my_col <- data_frame(
  "BTC" = "#2196f3",
  "BCH" = "#4caf50",
  "ETH" = "#9c27b0",
  "LTC" = "#ff9800"
)

ui <- material_page(
  title = "",
  nav_bar_fixed = TRUE,
  include_fonts = T,
  nav_bar_color = "teal lighten-1",
  material_side_nav(
    image_source = "side_nav.jpeg",
    material_row(
      material_column(
        width = 7,
        material_radio_button(
          "adjType",
          label = "",
          choices = c("Percent Change" = "close_p", "Price in $USD" = "close")
        )
      ),
      material_column(
        width = 5,
        material_radio_button(
          "day_back",
          label = "",
          choices = c("1 Week" = 7, "1 Month" = 30, "1 Year" = 365)
        )
      )
    ),
    tags$br(),
    material_row(
      material_column(
        offset = 1,
        width = 5,
        material_switch("BTC", 
                        label = "Bitcoin",
                        initial_value = TRUE,
                        color = my_col$BTC)
      ),
      material_column(
        width = 5,
        material_switch("BCH",
                        label = "Bitcoin Cash", 
                        initial_value = TRUE,
                        color = my_col$BCH)
      )
    ),
    material_row(
      material_column(
        offset = 1,
        width = 5,
        material_switch("ETH",
                        label = "Ethereum", 
                        initial_value = TRUE,
                        color = my_col$ETH)
      ),
      material_column(
        width = 5,
        material_switch("LTC", 
                        label = "Litecoin",
                        initial_value = TRUE,
                        color = my_col$LTC)
      )
    ),
    tags$br(),
    tags$br(),
    tags$br(),
    material_row(
      material_column(
        width = 10,
        offset = 1,
        HTML("<a href='https://github.com/ericrayanderson/shinymaterial_crypto/' target='_blank'> app code <i class='material-icons'>open_in_new</i></a>")
      )
    ),
    material_row(
      material_column(
        width = 10,
        offset = 1,
        HTML("<a href='https://ericrayanderson.github.io/shinymaterial/' target='_blank'> shinymaterial package <i class='material-icons'>open_in_new</i></a>")
      )
    )
  ),
  tags$br(),
  tags$div(id = 'wholeApp', style = "opacity:0",
           material_row(
             material_column(width=2),
             uiOutput("coinCards")
           ),
           material_row(
             material_column(
               width = 8,
               offset = 2,
               material_card(
                 depth = 3,
                 ggvisOutput("crypto"),
                 uiOutput('hide_gear')
               )
             )
           )
  )
)

pull_price <- function(ticker, days){
  fromJSON(
    paste0("https://min-api.cryptocompare.com/data/histoday?aggregate=1&e=CCCAGG&extraParams=CryptoCompare&fsym=", ticker, "&limit=", days, "&tryConversion=false&tsym=USD")
  )$Data
}

server <- function(input, output, session) {
  
  rV <- reactiveValues()
  observeEvent(input$day_back, priority = 1000, {
    
    if(input$day_back == "365"){
      update_material_switch(session, input_id = "BCH", value = FALSE)
    }
    
  })
  
  observe({
    
    if(!(input$BCH | input$BTC | input$ETH | input$LTC)) {
      rV$plot_data <- data_frame()
      return(NULL)
    }
    
    if(is.na(as.numeric(input$day_back))) {
      rV$plot_data <- data_frame()
      return(NULL)
    }
    
    if(input$day_back == 0) {
      rV$plot_data <- data_frame()
      return(NULL)
    }
    
    if(input$day_back == "365" & input$BCH) {
      rV$plot_data <- data_frame()
      return(NULL)
    }
    
    
    material_spinner_show(session, output_id = "wholeApp")
    ans <- data_frame()
    colors <- c()
    
    days_back <- as.numeric(input$day_back)
    
    if(input$BTC){
      ans <- bind_rows(
        ans,
        pull_price("BTC", days_back) %>%
          mutate(
            Ticker = "BTC",
            Coin = "Bitcoin"
          )
      )
      
      colors <- c(colors, my_col$BTC)
    }
    
    if(input$BCH){
      ans <- bind_rows(
        ans,
        pull_price("BCH", days_back) %>% 
          mutate(
            Ticker = "BCH",
            Coin = "Bitcoin Cash"
          )
      )
      
      colors <- c(colors, my_col$BCH)
    }
    
    if(input$ETH){
      ans <- bind_rows(
        ans,
        pull_price("ETH", days_back) %>%
          mutate(
            Ticker = "ETH",
            Coin = "Ethereum"
          )
      )
      
      colors <- c(colors, my_col$ETH)
    }
    
    if(input$LTC){
      ans <- bind_rows(
        ans,
        pull_price("LTC", days_back) %>%
          mutate(
            Ticker = "LTC",
            Coin = "Litecoin"
          )
      )
      
      colors <- c(colors, my_col$LTC)
    }
    
    if(nrow(ans) > 0){
      ans <- ans %>% mutate(date = as_datetime(time)) %>% 
        arrange(date) %>% 
        group_by(Coin) %>% 
        mutate(close_p = round(((close / close[1]) - 1) * 100, 0 ))
      
    }
    
    rV$plot_data <- ans
    rV$colors <- colors
  })
  
  output$coinCards <- renderUI({
    
    req(rV$plot_data)
    if(nrow(rV$plot_data) == 0){
      return(NULL)
    }
    
    cards <- tagList()
    
    tickers <- unique(rV$plot_data$Ticker)[order(unique(rV$plot_data$Coin))]
    
    for(i in 1:length(tickers)){
      
      this_data.i <-
        rV$plot_data[[input$adjType]][rV$plot_data$Ticker == tickers[i]]
      
      this_data.i <- this_data.i[length(this_data.i)]
      
      if(input$adjType != "close_p"){
        this_data.i <- prettyNum(this_data.i, big.mark = ",")
      }
      
      this_color.i <- ifelse(this_data.i < 0, "#212121", "#212121")
      
      this_sym.i <- ifelse(this_data.i < 0, "- ", "+ ")
      
      this_data.i <- ifelse(this_data.i < 0, gsub("-", "", this_data.i), this_data.i)
      
      this_card.i <- 
        material_column(
          width = 2,
          material_card(
            title = HTML(
              paste0(
                "<span style='font-weight:bold; color:", my_col[[tickers[i]]], "'>", tickers[i], "</span>&nbsp;&nbsp;",
                "<span style='font-size:14px'>", unique(rV$plot_data$Coin[rV$plot_data$Ticker == tickers[i]]), "</span>"
              )
            ),
            depth = 3,
            HTML(
              paste0(
                "<div class='text-right'><span style='font-size:28px'>",
                ifelse(input$adjType == "close_p", "", "$"),
                ifelse(input$adjType == "close_p", this_sym.i, ""),
                this_data.i,
                ifelse(input$adjType == "close_p", "%", "")),
              "</span></div>"
            )
          )
        )
      cards[[i]] <- this_card.i
    }
    
    
    cards
    
  })
  
  observe({
    req(rV$plot_data)
    
    if(nrow(rV$plot_data) == 0) {
      
      session$sendCustomMessage(
        type = "shinymaterialJS",
        paste0("$('#crypto').hide();")
      )
      return(NULL)
    } else {
      session$sendCustomMessage(
        type = "shinymaterialJS",
        paste0(
          "$('#crypto').show();"
        )
      )
    }
    
    rV$plot_data$toPlot <- rV$plot_data[[input$adjType]]
    
    rV$plot_data %>%
      ggvis(x = ~date, y = ~toPlot, stroke = ~Coin) %>%
      layer_lines(strokeWidth := 5, opacity := .7) %>%
      add_axis("x", title = "") %>% 
      add_axis("y", title = "") %>% 
      add_axis("x",
               orient = "top",
               ticks = 0,
               title = 
                 paste0(
                   ifelse(input$adjType == "close_p", " Change % ", "Price $ "),
                   paste(" (past ", as.numeric(input$day_back), " days)")
                 ),
               properties = axis_props(
                 axis = list(stroke = "white"),
                 labels = list(fontSize = 0),
                 title = list(fontSize = 16))) %>% 
      scale_nominal("stroke", range = c(rV$colors, "")) %>% 
      hide_legend('stroke') %>% 
      set_options(width = "100%", height = 350) %>% 
      bind_shiny("crypto")
    
    output$hide_gear <- renderUI({
      
      HTML('<script>$(".plot-gear-icon").css("display", "none");</script>')
      
    })
    
    material_spinner_hide(session, output_id = "wholeApp")
  })
  
  
}
shinyApp(ui = ui, server = server)
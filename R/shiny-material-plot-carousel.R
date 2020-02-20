material_plot_carousel <- function(plot_ids, .width = 400){
  
  plots_tag <- tagList()
  
  for(plot.i in plot_ids){
    
    plots_tag <- 
      tagAppendChild(
        plots_tag,
        shiny::tags$a(
          class = "carousel-item",
          href = paste0("#", plot.i),
          shiny::plotOutput(plot.i, height = "150%", width = .width)
        )
      )
  }
  
  shiny::tags$div(
    class = "carousel",
    plots_tag
  )
}
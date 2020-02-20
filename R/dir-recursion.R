dir_recursion <- function(.final_dir){
  
  .split_dir <- unlist(strsplit(.final_dir, "/"))
  
  .dirs <- c()
  for(i in 1:length(.split_dir)){
    .dirs <- c(.dirs, paste0(.split_dir[1:i], collapse = "/"))
  }
  
  for(dir.i in .dirs){
    if(!dir.exists(dir.i)){
      if(dir.i == .dirs[length(.dirs)]){
        message(
          paste0(
            "[shinymaterial] Creating directory: ",
            file.path(getwd(), dir.i)
          )
        )
      }
      dir.create(dir.i)
    }
  }
  
}



# Welcome module ----------------------------------------------------------


welcome_UI <- function(id) {
  ns <- NS(id)
  modalDialog(
    title = tags$h1(
      style = "text-align: center;",
      "Welcome to the ultimate Drosophilic memory game!!"
    ),
    tags$div(
      style = "text-align: center;",
      tags$p("Match the drosophila thing..to another drosophila thing!!🪰"),
      tags$p("Think that you have matched the wrong drosophila thing to a drosophila thing? Just click the drosophila thing again!"),
      tags$p("You can see only two drosophilia things at the same time, do not try and be clever"),
      tags$p("Are you ready to match all the drosophila?? Click play, if you dare!! (joke)")
    ), 
    footer = actionButton(
      inputId = ns("play"),
      label = "Play !",
      icon = icon("play"),
      style = "width: 100%"
    )
  )
}

welcome <- function(input, output, session) {
  
  id <- gsub("-$", "", session$ns(""))
  showModal(ui = welcome_UI(id))
  
  observeEvent(input$play, {
    removeModal()
  })
  
  return(reactive(input$play))
}


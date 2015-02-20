library(shiny) # Load shiny package
library(grid)
library(ggplot2)

universities <- read.csv("coursera-univ.csv") # Load the dataset
ratio <- read.csv("catByUniv.csv")

shinyServer(
  
  function(input, output){
    
    colm <- reactive({
      as.numeric(input$uni)+1
    })
         
    output$plot <- renderPlot({
      newdata <- data.frame(Name = ratio[,1], Uni = ratio[,colm()])

      p <- ggplot(newdata, aes(x = Name, y = Uni)) + xlab (" ") + ylab (" ") + labs (title = "Ratio of Courses Per Category among Universities on Coursera") + geom_bar (width = .75, stat = "identity", fill = "#418AC9")
      p <- p + theme(axis.text.y=element_text(hjust=0, angle=0, colour = "grey20"), axis.text.x = element_text(hjust=1, vjust=0, angle=90, size = 13, colour = "grey20"), title = element_text(colour="grey20", face="bold",vjust = 2, size = 20), axis.ticks.length = unit(.5, "cm"))
      print(p)
    })
    
    output$univLogo <- renderUI({
      im <- as.numeric(colm())- 1
      tags$img(src= universities[im,8])
      
    })
  }
)



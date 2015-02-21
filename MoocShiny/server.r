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
    
    output$year <- renderText({
      im <- as.numeric(colm())- 1
      paste("This university joined Coursera in", universities[im,9])
    })
    
    output$summary <- renderUI({
      withTags({
        div(class="header", checked=NA,
            h5("We are plotting the ratio of courses per category in order to see the relative representation of academic disciplines on Coursera."),
            h5("A course can belong to multiple categories, and in such cases a count is split equally across the included categories."),
            p("It looks like there was more STEM bias among the early adopters (universities with a lot of courses) but new entrants (universities with less courses) tend to have more non-STEM courses. Categories like Social Sciences, Humanities, Business and Management, Education, Teacher Professioal Development, Music, Film and Audio are on the rise."),
            p("STEM categories are:"),
            ul( li("Computer Science: Theory"),
                li("Economics & Finance"),
                li("Medicine"),
                li("Mathematics"),
                li("Physical & Earth Sciences"),
                li("Biology & Life Sciences"),
                li("Computer Science: Systems & Security"),
                li("Computer Science: Software Engineering"),
                li("Engineering"),
                li("Statistics and Data Analysis"),
                li("Computer Science: Artificial Intelligence"),
                li("Physics"),
                li("Chemistry"),
                li("Energy & Earth Sciences")
            ),
            p("Why do we see this non-STEM shift? There are a number of possible explanations:"),
            p("In the beginning, Coursera courses relied on autograders. They were well suited for quantitative STEM subjects, but not for non-STEM subjects. Later, Coursera introduced a crowd sourced essay grading system that can be used across multiple courses. This led to rapid expansion of course offerings and made non-STEM subjects viable. There are no strict prerequisites for Coursera courses, but the bar is still high for STEM courses. Therefore it is quite possible that the potential market size is larger for non-STEM subjects.")
        )
      })

    })
  }
)



library(shiny) # Load shiny package
data(iris) # Load the iris dataset


shinyServer(

	function(input, output){

		colm <- reactive({
  		as.numeric(input$var)
		})

		output$text1 <- renderText({
			# colm = as.numeric(input$var)
			paste("Data set variable/column name is", names(iris[colm()]))
		})

		output$text2 <- renderText({
			paste("Color of histogram is", input$color)
		})

		output$text3 <- renderText({
			paste("Number of histogram BINs is", input$bins)
		})

		output$myhist <- renderPlot({
			# colm = as.numeric(input$var)
			hist(iris[,colm()], col = input$color, xlim = c(0, max(iris[,colm()])), main = "Histogram of iris dataset", breaks = seq(0, max(iris[,colm()]),l = input$bins+1), xlab = names(iris[,colm()]))
		})
	}
)

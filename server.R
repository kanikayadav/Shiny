library(shiny)
library(cluster)
data(xclara)
df <- xclara
names(df) <- c("X","Y")
shinyServer(
	function(input, output, session) {
		clusters <- reactive({
			kmeans(df, input$clusters, iter.max=10)
		})
		
		output$plot1 <- renderPlot({
			palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
				  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
			par(mar = c(5.1, 4.1, 0, 1))
			plot(df, col = clusters()$cluster, pch = 1, cex = 1)
			points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
		})
		output$table1 <- renderTable({clusters()$centers})
	}
)
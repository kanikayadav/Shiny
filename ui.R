library(shiny)
library(cluster)
data(xclara)
df <- xclara
names(df) <- c("X","Y")
shinyUI(pageWithSidebar(
	headerPanel("k-means clustering on dataset xclara"),
	sidebarPanel(numericInput('clusters', 'Cluster count', 1,
				  min = 1, max = 9),
				  HTML("Please change the Cluster Count (range from 1 to 9)<br><br><br><br>"),
				  HTML("<B>Calculated K-Means Cluster Centroid Coordinates</B>"),
				  tableOutput("table1")
	),
	mainPanel(plotOutput('plot1'))
))
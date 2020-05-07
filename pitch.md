Developing-Data-Products-Course-Project-4
========================================================
author: Stanley KC Lam
date: 2018 Feb 20
autosize: true

Introduction
========================================================

- This is a very simple demonstration of k-Means clustering under Shiny
- Dataset is xclara from R package "cluster"
- It is an artificial data set
- Consisting of 3000 points (2 dimensions per points)
- In 3 well-separated clusters
- Size 1000 points per cluster
- https://www.rdocumentation.org/packages/cluster/versions/2.0.6/topics/xclara
- URL : https://github.com/StanleyKCLam/Developing-Data-Products-Course-Project-4/tree/master/Developing-Data-Products-Course-Project-4

Code ui.R
========================================================
- It has a headerPanel for the title
- It has a sidebarPanel with numericInput for the Cluster Count (range from 1 to 9)
- sidebarPanel outputs k-Means calculated centroids coordinates
- mainPanel plots all points with the centroids shown in real time right after the Cluster Count changes
- Code for getting the Cluster Count Input :


```r
numericInput('clusters', 'Cluster count', 1, min = 1, max = 9)
```

Code server.R
========================================================
- It loads the R package "cluster"
- Then import the dataset "xclara"
- It gets the ui.R Cluster Count input-"cluster"
- Then calculate the centroids coordinates using kmeans function
- Finally it render the plots as well as the centroid coordinates table for the ui.R to display
- Code for the kmeans evaluation


```r
clusters <- reactive({kmeans(df, input$clusters, iter.max=10)})
```

Published on Shiny
========================================================
![shinyoutput](shinyoutput.png)

- URL : https://stanleykclam.shinyapps.io/Developing_Data_Products_Course_Project_4/

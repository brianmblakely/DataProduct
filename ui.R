library(shiny)
library(gapminder)
library(dplyr)
library(plotly)
library(ggplot2)

ui <- fluidPage(
  titlePanel("GDP vs Life Expectancy by Country"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("GDP", "Filter Results - Min. GDP per Capita:",
                  min = 0, max = 20000, value = 0
      ),
      radioButtons("Continent",
                   label="Select Continent:",
                   choices=list("Africa","Asia","Americas","Europe","Oceania"),
                   selected="Africa")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Scatter Plot", plotOutput(outputId = "scatterPlot")),
        tabPanel("Time Series", plotOutput(outputId = "timePlot")),
        tabPanel("Box Plot", plotOutput(outputId = "boxPlot")),
        tabPanel("Data Table", tableOutput("table"))
      )
      
    )
  ))

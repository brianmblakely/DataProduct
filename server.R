library(shiny)
library(gapminder)
library(dplyr)
library(plotly)
library(ggplot2)
library()

server <- function(input, output){
  
  
  rGDP <- reactive({   input$GDP   })
  rContinent <- reactive({ input$Continent})

  
  output$scatterPlot <- renderPlot({
    
    ggplot(subset(gapminder, continent == rContinent() & gdpPercap >= rGDP()),
           aes(x = gdpPercap, y = lifeExp, z = pop)) + geom_point() + 
           geom_smooth(method=lm, color = "darkred") +
           labs(x = "GDP per Capita", y = "Life Expectancy")
    
  })
  output$timePlot <- renderPlot({
    dataT<- subset(gapminder,continent == rContinent() & gdpPercap >= rGDP())
    ggplot(dataT, aes(x = year, y = lifeExp, color = country)) +
    geom_line(lwd = 1, show.legend = TRUE) + facet_wrap(~ continent) +
    scale_color_manual(values = country_colors)
  })
  output$boxPlot <- renderPlot({
    ggplot(subset(gapminder, continent == rContinent() & gdpPercap >= rGDP()),
           aes(x = country, y = lifeExp)) + geom_boxplot() + coord_flip()

  })
  output$table <- renderTable({
    subset((gapminder), continent == rContinent() & gdpPercap >= rGDP())
  })
  
}



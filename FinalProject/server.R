#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(forecast)

shinyServer(function(input, output) {

    getData <- reactive({
        indice <- input$index
        numero <- input$sliderBins

        mod1 <- auto.arima(EuStockMarkets[,indice])
        forecast(mod1, h = numero)
    })

    output$plot1 <- renderPlot({
        autoplot(getData())
    })

    output$pred1 <- renderText({
        getData()$mean
    })
})


# shinyServer(function(input, output) {
#     
#     getData <- reactive({
#         indice <- input$index
#         EuStockMarkets[,indice]
#     })
#     
#     output$plot1 <- renderPlot({
#         fit <- auto.arima(getData())
#         plot(forecast(fit, h = input$sliderBins))
#     })
#     
#     output$pred1 <- renderText({
#         fit <- auto.arima(getData())
#         pred1 <- forecast(fit, h = input$sliderBins)
#         pred1$mean
#     })
# })
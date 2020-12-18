#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(forecast)

shinyUI(fluidPage(
    titlePanel("Predict Prices (DAX, SMI, CAC, FTSE)"),
    sidebarLayout(
        sidebarPanel(
            selectInput("index", "Index:", choices=colnames(EuStockMarkets)),
            sliderInput("sliderBins", "How many predictions do you want?", 5, 50, value = 20,step = 5),
            submitButton("Submit"),
            hr(),
            helpText("Data from EuStockMarkets dataset in R")
        ),
        mainPanel(
            h3("How to use this app..."),
            h5("In this app you will be able to predict the price of the index of your election."),
            h5("But, fisrt, what is an index? An index is an indicator or measure of something, and in finance, it typically refers to a statistical measure of change in a securities market. In the case of financial markets, stock, and bond market indices consist of a hypothetical portfolio of securities representing a particular market or a segment of it."),
            h5("In the bar Panel you can choose the Index, you can choose among German Stock Index (DAX), The Swiss Market Index (SMI), Cotation Assistée en Continu (CAC) or The Financial Times Stock Exchange 100 Index (FTSE). Likewise, you can choose the number of predictions you want. In the main panel. In the main panel you will see a Index's graph, the blue line are the predictions. You will also see the predictions belos the graph."),
            plotOutput("plot1"),
            h3("Predicted Prices:"),
            textOutput("pred1")
        )
    )
))
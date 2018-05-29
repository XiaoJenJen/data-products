#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Read Data
AllData<-mtcars

# Define server logic required to draw a plot
shinyServer(function(input, output) {


        myFinalData<-reactive({
                #get data for selected variables
                myData1<-subset(AllData, select = input$var)
                myData1$mpg<-AllData$mpg
                myData1
        })


        # Prepare Summary Tab
        rendersumry <- reactive({ summary(myFinalData())})

        output$sumry <- renderPrint({
                rendersumry()
        })
        # Prepare Structure Tab
        renderstr <- reactive({ str(myFinalData())})

        output$struct <- renderPrint({
                renderstr()
        })
        # Prepare "Data tab"
        output$displayData <- renderTable({
                myFinalData()
        })
        # Prepare Plot Tab
        output$mygraph <- renderPlot({

                formulaText <- reactive({
                        paste("mpg ~", input$var)
                })

                plotdata <- myFinalData()
                plot(as.formula(formulaText()),
                     data=plotdata)
        })

})


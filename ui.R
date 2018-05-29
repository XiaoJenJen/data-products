#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(

  # Application title
  titlePanel(title=h3("Motor Trend Car Analysis", align="center")),
  br(), br(),
  sidebarLayout(
    sidebarPanel(
            #--------------------------------------------------------------
            #Add variables selection options
            selectInput("var", "select variable from dataset",
                        choices = c("number of cylinders"="cyl",
                                    "displacement"="disp",
                                    "gross horsepower"="hp",
                                    "rear axle ratio"="drat")
                        ),
            br(), br(),
            #--------------------------------------------------------------
            #change background color for body
            tags$style("body{background-color:lightyellow;color:brown}")
    ),

    mainPanel(
            #--------------------------------------------------------------
            #create tab panes
            tabsetPanel(type="tab",
                        tabPanel("Summary",verbatimTextOutput("sumry")),
                        tabPanel("Structure", verbatimTextOutput("struct")),
                        tabPanel("Data", tableOutput("displayData")),
                        tabPanel("Plot", plotOutput("mygraph"))
            )
            #--------------------------------------------------------------
    )
  )
))


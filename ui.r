library(shiny)
library(ggplot2)

library(shinyWidgets)

shinyUI( fluidPage(
  
  setBackgroundImage(
    src = "https://ncaaorg.sidearmsports.com/images/2021/9/29/March_Madness.jpg"
  ),
  
  pageWithSidebar(
    
    titlePanel("Which College Basketball Metric Correlates the Most with Wins? (2015-2021)"),
    
    sidebarPanel(
      
      #Metric Input
      selectInput("metric", "Metric:",
                  c("--Select--" = "select",
                    "Adjusted Offensive Efficiency" = "ADJOE",
                    "Adjusted Defensive Efficiency" = "ADJDE",
                    "Effective Field Goal Percentage Shot" = "EFG_O",
                    "Effective Field Goal Percentage Allowed" = "EFG_D",
                    "Turnover Percentage Allowed" = "TOR",
                    "Turnover Percentage Committed" = "TORD",
                    "Offensive Rebound Rate" = "ORB",
                    "Offensive Rebound Rate Allowed" = "DRB",
                    "Free Throw Rate" = "FTR",
                    "Free Throw Rate Allowed" = "FTRD",
                    "Two-Point Shooting Percentage" = "TWOP_O",
                    "Two-Point Shooting Percentage Allowed" = "TWOP_D",
                    "Three-Point Shooting Percentage" = "THREEP_O",
                    "Three-Point Shooting Percentage Allowed" = "THREEP_D",
                    "Adjusted Tempo" = "ADJ_T"
                    
                  )),
      
      #inputs for variables to look at
      
      selectInput("year", "Sort by Year:",
                  c("--Select--" = "select",
                    "2015" = "2015",
                    "2016" = "2016",
                    "2017" = "2017",
                    "2018" = "2018",
                    "2019" = "2019",
                    "2020" = "2020",
                    "2021" = "2021"
                    
                  ))
      
      
      
    ),
    
    mainPanel(
      plotOutput("myPlot")
      )
    
  )
  
)
)


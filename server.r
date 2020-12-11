cbb15 <- read.csv("cbb15.csv")
cbb16 <- read.csv("cbb16.csv")
cbb17 <- read.csv("cbb17.csv")
cbb18 <- read.csv("cbb18.csv")
cbb19 <- read.csv("cbb19.csv")
cbb20 <- read.csv("cbb20.csv")

library(ggplot2)
library(datasets)

shinyServer(
  
  function(input, output){
    
    cbbdata <- reactive(
      {
        if(input$year=="2015"){
          return(cbb15)
        }
        
        else if(input$year=="2016")
        {
          return(cbb16)
        }
        else if(input$year=="2017")
        {
          return(cbb17)
        }
        else if(input$year=="2018")
        {
          return(cbb18)
        }
        else if(input$year=="2019")
        {
          return(cbb19)
        }
        else if(input$year=="2020")
        {
          return(cbb20)
        }
        
      }
    )

    
    xLabs <- reactive({
    if(input$metric == "ADJOE"){
        
      paste("Adjusted Offensive Efficiency")

    }
    
    else if(input$metric == "ADJDE"){
      paste("Adjusted Defensive Efficiency")
    }
    else if(input$metric == "EFG_O"){
      
      paste("Effective Field Goal Percentage Shot")
      
    }
    
    else if(input$metric == "EFG_D"){
      paste("Effective Field Goal Percentage Allowed")
    }
    
    else if(input$metric == "TOR"){
      paste("Turnover Rate")
      
    }
    
    else if(input$metric == "TORD"){
      paste("Turnover Percentage Committed (Steal Rate)")
    }
    
    else if(input$metric == "ORB"){
       
      paste("Offensive Rebound Rate")
          
    }
    
    else if(input$metric == "DRB"){
      
      paste("Offensive Rebound Rate Allowed")
      
    }
    
    else if(input$metric == "FTR"){
      paste("Free Throw Rate")
    }
    
    else if(input$metric == "FTRD"){
      paste("Free Throw Rate Allowed")
      
    }
    
    else if(input$metric == "TWOP_O"){
      paste("Two-Point Shooting Percentage")
      
    }
    
    else if(input$metric == "TWOP_D"){
      paste("Two-Point Shooting Percentage Allowed")
      
    }
    
    else if(input$metric == "THREEP_O"){
      paste("Three-Point Shooting Percentage")
      
    }
    
    else if(input$metric == "THREEP_D"){
      paste("Three-Point Shooting Percentage Allowed")
     
    }
    
    else if(input$metric == "ADJ_T"){
      
      paste("Adjusted Tempo")
          
       
    }
      
      
      
      
    })
    
    subtitleStr <- reactive({
      if(input$metric == "ADJOE"){
        
        paste("Correlation Coefficient: ",cor(cbbdata()$ADJOE,cbbdata()$W))
        
      }
      
      else if(input$metric == "ADJDE"){
        paste("Correlation Coefficient: ",cor(cbbdata()$ADJDE,cbbdata()$W))
      }
      else if(input$metric == "EFG_O"){
        
        paste("Correlation Coefficient: ",cor(cbbdata()$EFG_O,cbbdata()$W))
        
      }
      
      else if(input$metric == "EFG_D"){
        paste("Correlation Coefficient: ",cor(cbbdata()$EFG_D,cbbdata()$W))
      }
      
      else if(input$metric == "TOR"){
        paste("Correlation Coefficient: ",cor(cbbdata()$TOR,cbbdata()$W))
        
      }
      
      else if(input$metric == "TORD"){
        paste("Correlation Coefficient: ",cor(cbbdata()$TORD,cbbdata()$W))
      }
      
      else if(input$metric == "ORB"){
        
        paste("Correlation Coefficient: ",cor(cbbdata()$ORB,cbbdata()$W))
        
      }
      
      else if(input$metric == "DRB"){
        
        paste("Correlation Coefficient: ",cor(cbbdata()$DRB,cbbdata()$W))
        
      }
      
      else if(input$metric == "FTR"){
        paste("Correlation Coefficient: ",cor(cbbdata()$FTR,cbbdata()$W))
      }
      
      else if(input$metric == "FTRD"){
        paste("Correlation Coefficient: ",cor(cbbdata()$FTRD,cbbdata()$W))
        
      }
      
      else if(input$metric == "TWOP_O"){
        paste("Correlation Coefficient: ",cor(cbbdata()$TWOP_O,cbbdata()$W))
        
      }
      
      else if(input$metric == "TWOP_D"){
        paste("Correlation Coefficient: ",cor(cbbdata()$TWOP_D,cbbdata()$W))
        
      }
      
      else if(input$metric == "THREEP_O"){
        paste("Correlation Coefficient: ",cor(cbbdata()$THREEP_O,cbbdata()$W))
        
      }
      
      else if(input$metric == "THREEP_D"){
        paste("Correlation Coefficient: ",cor(cbbdata()$THREEP_D,cbbdata()$W))
        
      }
      
      else if(input$metric == "ADJ_T"){
        
        paste("Correlation Coefficient: ",cor(cbbdata()$ADJ_T,cbbdata()$W))
        
        
      }
    })
  
    
    output$myPlot = renderPlot({
      
      if(input$metric == "select"||input$year == "select"){
        par(mar = c(0,0,0,0), bg = "#00000000")
        plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
        text(x = .5, y = 1.0, paste("Please Select Both a Metric and a Year"), 
             cex = 1.6, col = "black")
      }
      else{
      ggplot(cbbdata(), aes_string(x=input$metric, y="W")) + 
        geom_point(aes(color=CONF)) + 
        geom_smooth(method = "lm", formula = y~x) + 
        labs(title=paste(input$metric," Correlation with Wins (",input$year,")"),subtitle = subtitleStr(), caption = "Data from Andrew Sundberg on Kaggle, and from http://barttorvik.com/trank.php#") + 
        labs(x = xLabs()) + 
        labs(y = "Wins") +
        theme(plot.background = element_rect(fill = "lightblue"))
        
      }
    })
    
}
  
  )
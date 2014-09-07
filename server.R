
library(shiny)

sizeRatio <- function(M2,M1) 10^(abs(M2-M1))
energyRatio <- function(M2,M1) 10^(abs(M2-M1)*1.5)


shinyServer(
  function(input, output) {
     
      output$summary <- renderText({
      
         paste0('Quake #1 Magnitude = ',input$M1,"\n",
                'Quake #2 Magnitude = ',input$M2)
                
         })
     
      
     
      output$sizes <- renderText({
                  
         if (input$M2 > input$M1) { paste0('Quake #2 is ',prettyNum(round(sizeRatio(input$M2,input$M1),1),big.mark=','),' times larger than Quake #1.\n In other words, when comparing the two earthquakes\non a Seismograph, the Amplitudes of the waves for Quake #2\nare ',prettyNum(round(sizeRatio(input$M2,input$M1),1),big.mark=','),' times larger than Quake #1.') } 
                        
         else if (input$M1 > input$M2) { paste0('Quake #1 is ',prettyNum(round(sizeRatio(input$M2,input$M1),1),big.mark=','),' times larger than Quake #2.\n In other words, when comparing the two earthquakes\non a Seismograph, the Amplitudes of the waves for Quake #1\nare ',prettyNum(round(sizeRatio(input$M2,input$M1),1),big.mark=','),' times larger than Quake #2.') }
         
         else { 'Quake #1 is the same size as Quake #2' 
         }
          
         })
         
      output$strengths <- renderText({
         
         if (input$M2 > input$M1) { paste0('Quake #2 is ',prettyNum(round(energyRatio(input$M2,input$M1),1),big.mark=','),' times stronger than Quake #1.\n In other words, Quake #2 has ',prettyNum(round(energyRatio(input$M2,input$M1),1),big.mark=','),' times more\nshaking energy than Quake #1.\n It would take ',prettyNum(round(energyRatio(input$M2,input$M1),1),big.mark=','),' earthquakes of Magnitude ',input$M1,'\nto equal the energy released from\none earthquake of Magnitude ',input$M2,'.') 
         } 
         
         else if (input$M1 > input$M2) { paste0('Quake #1 is ',prettyNum(round(energyRatio(input$M2,input$M1),1),big.mark=','),' times stronger than Quake #2.\n In other words, Quake #1 has ',prettyNum(round(energyRatio(input$M2,input$M1),1),big.mark=','),' times more\nshaking energy than Quake #2.\n It would take ',prettyNum(round(energyRatio(input$M2,input$M1),1),big.mark=','),' earthquakes of Magnitude ',input$M2,'\nto equal the energy released from\none earthquake of Magnitude ',input$M1,'.') 
         }  
        
         else {'Quake #1 has the same strength as Quake #2' 
         }
         
         })
         
     
  }
)
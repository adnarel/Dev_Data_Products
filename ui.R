library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Earthquake Calculator'),
  sidebarPanel(
    sliderInput('M1', 'Select Earthquake #1 Magnitude',value = 4.0, min = 0.1, max = 9.0, step = 0.1,),
    sliderInput('M2', 'Select Earthquake #2 Magnitude',value = 6.0, min = 0.1, max = 9.0, step = 0.1,),
    submitButton('Submit')
    
  ),
  mainPanel(
        h4('Earthquake Summary'),
        verbatimTextOutput('summary'),
        h5('Compare Sizes'),
        verbatimTextOutput('sizes'),
        h5('Compare Strengths'),
        verbatimTextOutput('strengths'), 
        p(em("Documentation:",a("Earthquake Comparison",href="index.html"))),
        br()
  )
))

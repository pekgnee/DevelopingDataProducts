library(shiny)
shinyUI(fluidPage(
    titlePanel("Student admissions at UC Berkeley"),
    
    sidebarLayout(        
        sidebarPanel(
            h3('Getting started'),
            helpText('This Shiny app displays statistics from the dataset UCBAdmissions, containing aggregate data on applicants to graduate school at Berkeley for the six largest departments in 1973 classified by admission and sex.'),
            helpText('To get started, select the desired department from the input select box below, and view the corresponding statistics in the panel on the right'),
            selectInput("dept", label = h3("Department"), 
                        c("A", "B", "C", "D", "E", "F"))
            ),
        mainPanel(
            h3(textOutput("dept")),
            plotOutput("applications"),
            plotOutput("gender")
            )
    )
))
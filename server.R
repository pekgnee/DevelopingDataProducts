library(shiny)
data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)

shinyServer(
    function(input, output) { 
        
        deptData <- reactive({
            subset(DF, Dept == input$dept)
        })
        
        output$dept <- renderText({ 
            paste("Admissions statistics of Department ", input$dept)
        })
        
        output$applications <- renderPlot({ 
            male <- sum(subset(deptData(), Gender == "Male", Freq))
            female <- sum(subset(deptData(), Gender == "Female", Freq))
            barplot(c(male, female), names.arg = c("Male", "Female"), main = "Number of applications received")
        })
        
        output$gender <- renderPlot({
            maleAdmit <- as.integer(subset(deptData(), Gender == "Male" & Admit == "Admitted" , Freq))
            maleReject <- as.integer(subset(deptData(), Gender == "Male" & Admit == "Rejected", Freq))
            femaleAdmit <- as.integer(subset(deptData(), Gender == "Female" & Admit == "Admitted" , Freq))
            femaleReject <- as.integer(subset(deptData(), Gender == "Female" & Admit == "Rejected", Freq))
            ylim <- c(0, max(subset(deptData(), select=Freq)))
                
            par(mfrow=c(1,2))
            barplot(c(maleAdmit, maleReject), names.arg = c("Admitted", "Rejected"), main = "Number of male applicants", ylim = ylim)
            barplot(c(femaleAdmit, femaleReject), names.arg = c("Admitted", "Rejected"), main = "Number of female applicants", ylim = ylim)
        })
    }
    )
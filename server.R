#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required 
shinyServer(function(input, output) {
    
    #Calculation code
    Age = 1:85
    ToBeRep.M = c(0.003,0.002,0.006,0.009,0.009,0.011,0.014,0.02,0.031,0.048,0.076,0.126,0.19,0.279,0.404,0.554)
    male = c(rep(0.005,4), rep(ToBeRep.M, each = 5), 1)
    Death_prob = cbind(age, male)
    ToBeRep.F = c(0.003,0.002,0.004,0.006,0.007,0.008,0.011,0.016,0.022,0.033,0.048,0.081,0.128,0.206,0.327,0.485)
    Female = c(rep(0.004,4), rep(ToBeRep.F, each = 5), 1)
    Death_prob = data.frame(cbind(Death_prob, female))
    
    #Function to calculate premium
    PremCalc = function(type, term, age, gender, Sum, smoke){
        if(gender == "Male"){
            ind = 2
        }else{
            ind = 3
        }
        
        if(smoke == "Smoker"){
            q.x = 1.3*Death_prob[,ind]
            q.x[85] = 1
        }else{
            q.x = Death_prob[,ind]
        }
        
        int = 0.04
        a.x = 1
        A.x = q.x[age]/1.04
        mult = 1
        if(type == "Whole-life"){
            N = 86 - age
        }else{
            N = term
        }
        
        if(type == "Endowment"){
            for (t in 1:N-1){
                a.x = a.x + ((1 - q.x[age+t-1])*mult)/((1+int)^t)
                mult = mult*(1-q.x[age+t-1])
                A.x = A.x + mult*(q.x[age+t])/((1+int)^(t+1))
            }
            A.x = A.x + mult*((1-q.x[age+N-1])/((1+int)^N))
        }else{
            for (t in 1:N-1){
                a.x = a.x + ((1 - q.x[age+t-1])*mult)/((1+int)^t)
                mult = mult*(1-q.x[age+t-1])
                A.x = A.x + mult*(q.x[age+t])/(1.04^(t+1))
            }
        }
        
        Prem = (Sum*A.x)/a.x
        Prem = format(round(Prem,2), nsmall =2)
        return(c(Prem, " million Indonesian Rupiah"))
    }
    
    PremCalculator = reactive({
        inputType = input$type
        inputTerm = input$term
        inputAge = input$age
        inputGender = input$gender
        inputSum = input$Sum
        inputSmoke = input$smoke
        PremCalc(inputType, inputTerm, inputAge, inputGender, inputSum, inputSmoke)
    })
    output$myoutput = renderText({
        PremCalculator()
    })
})









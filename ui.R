#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Life Insurance Net Premium Calculator"),

    # Sidebar for input
    sidebarLayout(
        sidebarPanel(
            selectInput("type", "Type of insurance: ",
                      c("Whole-life" = "Whole-life", "Term" = "Term", 
                        "Endowment" = "Endowment")),
            numericInput("term", "Term of protection (Ignore for whole-life): ", 
                         min = 5, max = 30, value = 10),
            sliderInput("age",
                        "Age: ",
                        min = 1,
                        max = 65,
                        value = 25),
            radioButtons("gender", "Gender: ",
                         c("Male" = "Male",
                           "Female" = "Female")),
            sliderInput("Sum",
                        "Sum assured (in millions of Indonesian Rupiah): ",
                        min = 300,
                        max =500,
                        value = 500),
            radioButtons("smoke", "Smoking status: ",
                         c("Smoker" = "Smoker",
                           "Non-smoker" = "Non-smoker")),
            submitButton("Calculate")
        ),


        # Show a plot of the generated distribution
        mainPanel(
            h3("Your annual premium would be approximately: "),
            h4(textOutput("myoutput"), style = "color:red"),
            h5("\n"),
            h5("Notes: "),
            h6("1. This is an example of a very simple insurance product which
               involves no unit-linked funds or customised payment frequency."),
            h6("2. This is based on the equivalence principle where the benefits paid
               is matched to the premiums required, solely dependent on the risk of death and
               an assumed risk-free rate of 4% per annum."),
            h6("3. This is a net premium calculator. Hence, it does not take into
               account the expenses of an insurance company: management fee, commission,
               transfer fee, etc."),
            h6("4. It is assumed that smoking increases mortality risk by 30%."),
            h6("5. The life table used is taken from the Global Health Observatory data
               repository. Link: https://apps.who.int/gho/data/view.main.60750?lang=en"),
            h6("6. The assumptions used will be different the those used in real life.
                Different companies will have different assumptions."),
            h6("7. In practice, there will likely be a more complex underwriting process
                before the premiums can be calculated.")
        )
    )
))

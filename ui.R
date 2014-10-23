#Code for Course Project ShinyApp
#Calculate the user's current BMI and provide suggested BMI and tips to get there

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Get Healthy for Adults"),
    #Create Panel for users to enter information
    sidebarPanel(
        helpText("Additional Information: This tool is only meant to be used for adults ages 20 and over. The results ",
                    "are for estimation purposes only. Please provide the requested information to see your results.",
                    "Weight should be in pounds, height should be broken into feet and inches, and waist",
                    " size should be in inches. The output will automatically update based on what you've ",
                    "entered and will notify you of any blanks. Please do not leave any blank fields."),
        numericInput("userWeight", label = h5("Please enter your current weight in pounds"),value=""),
        h5("Please enter your current height in a combination of feet and inches."),
        div(class="row-fluid",
            div(class="span1",numericInput("userHeightFeet", label = "feet", value="")),
            div(class="span1",numericInput("userHeightInches", label = "inches", value=""))),
        radioButtons("userSex",label = h5("Please select your sex"), choices = list("Female"=1,"Male"=2)),
        numericInput("userWaist", label = h5("Please enter your waist size in inches"), value="")
        ),
    #show results of calculations
    mainPanel(
        h3("Health Assessment"),
        h4("Your current BMI is"),
        verbatimTextOutput("outputBMI"),
        h4("This makes your weight status"),
        verbatimTextOutput("outputStatus"),
        h4("Your disease risk for type 2 diabetes, hypertension and CVD is"),
        verbatimTextOutput("outputRisk"))
    )
)
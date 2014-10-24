#http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html
library(shiny)

#Calculate BMI
calcBMI <- function(userWeight,userHeightFeet,userHeightInches) {
    if (is.na(userWeight)) {
        "No weight value."
    } else if (is.na(userHeightFeet)) {
        "No Height Value in Feet."
    } else if (is.na(userHeightInches)) {
        "No Height Value in Inches. Please use zero if appropriate."
    } else {
        (userWeight/((userHeightFeet*12)+userHeightInches)^2)*703
    }
}

#Determine Weight Status
statusBMI <- function(calcBMI) {
    if (class(calcBMI)!="numeric"){
        "Need to calculate BMI first"
    } else if (calcBMI < 18.5) {
        "Underweight"
    } else if (calcBMI < 25.0) {
        "Normal"
    } else if (calcBMI < 30.0) {
        "Overweight"
    } else if (calcBMI < 35.0) {
        "Obese I"
    } else if (calcBMI < 40.0) {
        "Obese II"
    } else if (calcBMI >= 40.0) {
        "Extremely Obese"
    }
}

#Determine Risk
statusDiseaseRisk <- function(statusBMI, userSex, userWaist) {
    if (statusBMI=="Need to calculate BMI first"){
        "Need to calculate BMI first"
    } else if (is.na(userWaist)) {
        "No waist size provided."
    } else if (statusBMI=="Underweight") {
        "none"
    } else if (statusBMI=="Normal") {
        "none"
    } else if (statusBMI == "Overweight") {
        if (userSex == 1) {
            if (userWaist <= 35) {
                "Increased"
            } else if (userWaist > 35) {
                "High"
            }
        } else if (userSex == 2) {
            if (userWaist <= 40) {
                "Increased"
            } else if (userWaist > 40) {
                "High"
            }
        }
    } else if (statusBMI == "Obese I") {
        if (userSex == 1) {
            if (userWaist <= 35) {
                "High"
            } else if (userWaist > 35) {
                "Very High"
            }
        } else if (userSex == 2) {
            if (userWaist <= 40) {
                "High"
            } else if (userWaist > 40) {
                "Very High"
            }
        }
    } else if (statusBMI == "Obese II") {
        if (userSex == 1) {
            if (userWaist <= 35) {
                "Very High"
            } else if (userWaist > 35) {
                "Very High"
            }
        } else if (userSex == 2) {
            if (userWaist <= 40) {
                "Very High"
            } else if (userWaist > 40) {
                "Very High"
            }
        }
    } else if (statusBMI == "Extremely Obese") {
        if (userSex == 1) {
            if (userWaist <= 35) {
                "Extremely High"
            } else if (userWaist > 35) {
                "Extremely High"
            }
        } else if (userSex == 2) {
            if (userWaist <= 40) {
                "Extremely High"
            } else if (userWaist > 40) {
                "Extremely High"
            }
        }
    }
}

#send outputs back to UI
shinyServer(
    function(input,output) {
        output$outputBMI <- renderPrint({calcBMI(input$userWeight,input$userHeightFeet,input$userHeightInches)})
        output$outputStatus <- renderPrint({statusBMI(calcBMI(input$userWeight,input$userHeightFeet,input$userHeightInches))})
        output$outputRisk <- renderPrint({statusDiseaseRisk(statusBMI(calcBMI(input$userWeight,input$userHeightFeet,input$userHeightInches)),input$userSex, input$userWaist)})
        })
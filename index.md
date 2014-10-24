---
title       : Get Healthy App
subtitle    : Understanding your current health state to improve it
author      : THemby
framework   : revealjs    
revealjs    : {transition: cube}
hitheme     : github
widgets     : [mathjax, quiz]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
--- 
## Get Healthy App 

<q>Understanding your current health state to improve it</q>

Author: THemby

Last Update: October 23, 2014

--- 
## Why do I need to know My BMI?

<p><font size="6">Body mass index (BMI) is a number calculated from your height and weight. Research has shown that correlates to body fat. By understanding your BMI it is possible to know if you are at risk for certain diseases. While this is not a diagnostic tool it can and should prompt changes in lifestyle or a discussion with a healthcare provider.</font></p>

<p><font size="6">While BMI is not always a perfect indicator of health status, i.e. women will tend to have higher body fat than men, it is a starting point.</font></p>

<font size="3">Citations:

Centers for Disease Control and Prevention (CDC) 
<p>http://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html</p>

National Institute for Health (NIH) 
<p>http://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmi_dis.htm</p>
 </font>


--- 
## How do I access and use the App?

To access the app go to: http://themby528.shinyapps.io/GetHealthy

.fragment The user will go to the website and provide their weight (in pounds), height (in feet and inches), sex, and wait size (selection dependent on sex). The app will then provide the user with their BMI, weight status,and disease risk. All  and tables have been pulled from the Centers for Disease Control and Prevention (CDC) and National institute for Health (NIH).

--- 
## How does the app work?

The app works by taking a users information and applying to the standard BMI calculation as see below:

$$
\begin{aligned}
BMI = \frac {weight (lb)}{(height (ft)*12 + height(in))^2} * 703
\end{aligned}
$$ 


.fragment The results is then compared to a table for classification of Overweight and obesity ![width](./assets/img/Capture.PNG)

---
## Can we do an example?

Consider a person with the following information

1. User weight in pounds - 175 lbs
2. User height (ft) - 5 feet
3. User height (in) - 5 inches
4. Sex - Female
5. Waist Circumference - 34 inches

Her results would be



> - BMI: 29.1183
> - Weight Status: Overweight
> - Disease Risk: Increased






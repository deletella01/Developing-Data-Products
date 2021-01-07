
library(shiny)
library(datasets)

shinyUI(
    fluidPage(
        titlePanel("An App that shows the relationship of Miles per Gallon to different Variables"),
            sidebarLayout(
                sidebarPanel(
                    selectInput("variable","Varables:",
                                c("Number of Cylinder"="cyl",
                                  "Displacement"="disp",
                                  "HorsePower"="hp",
                                  "Rear Axle Ratio"="drat",
                                  "Weight"="wt",
                                  "1/4 Mile Time"="qsec",
                                  "Engine"="vs",
                                  "Transmission"="am",
                                  "Number of Fward Gears"="gear",
                                  "Number of Carburetors"="carb"
                                  )
                                ),
                    checkboxInput("outliers", "Show Plot's Outliers", FALSE),
                    submitButton("Submit!")
                    
                    ),
                
                mainPanel(
                    h2(textOutput("caption")),
                    tabsetPanel(type = "tabs",
                                tabPanel("Overview",
                                         h3("This is a shiny application project for the Coursera's Developing Data Products."),
                                         hr(),
                                         h3("Here: Boxplot of Fitted Model, a line indicating the model on a plot of MPG vs an input Variable, it also shows the Summary of the Model"),
                                         h3("Description"),
                                         helpText("We make use of Motor Trend Data, a magazine containing Data about the automobile industry looking at a data set of a collection of cars, We are interested in exploring the relationship",
                                                  "between a set of variables and miles per gallon (MPG) (outcome).",
                                                  "Under this analysis, we can anwser the question: Is an automatic or manual transmission better for MPG,by quantify the MPG difference between automatic and manual transmissions, among other analysis that can be conducted."),
                                         h3("Important"),
                                         p("This is a data frame with 32 observations on 11 variables."),
                                         hr(),
                                         helpText("Every choice must be submitted for changes to be made, if changes are made without clicking the 'Submit!' button, the changes are not actualised.")
                                       ),
                                
                                tabPanel("Motor Car Data Used",
                                    h2("Motor Trend Car Road Tests"),
                                    hr(),
                                    h3("Description"),
                                    helpText("The data was extracted from the 1974 Motor Trend US magazine,",
                                                       " and comprises fuel consumption and 10 aspects of automobile design and performance",
                                                       " for 32 automobiles (1973–74 models)."),
                                    h3("Format"),
                                    p("A data frame with 32 observations on 11 variables."),
                                     
                                    p("  [, 1]   mpg         Miles/(US) gallon"),
                                    p("  [, 2]	 cyl	 Number of cylinders"),
                                    p("  [, 3]	 disp	 Displacement (cu.in.)"),
                                    p("  [, 4]	 hp	 Gross horsepower"),
                                    p("  [, 5]	 drat	 Rear axle ratio"),
                                    p("  [, 6]	 wt	 Weight (lb/1000)"),
                                    p("  [, 7]	 qsec	 1/4 mile time"),
                                    p("  [, 8]	 vs	 V/S"),
                                    p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                                    p("  [,10]	 gear	 Number of forward gears"),
                                    p("  [,11]	 carb	 Number of carburetors"),
                                     
                                    h3("Source"),
                                    
                                    p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391–411.") 
                                ),                  
                                         
                                        
                                tabPanel("BoxPlot", plotOutput("airbox")),
                                tabPanel("Regression Model", 
                                         plotOutput("airplot"),
                                         verbatimTextOutput("airfit")
                                         )
                                )
                    )
                )
        )
    )



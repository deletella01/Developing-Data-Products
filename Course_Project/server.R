
library(shiny)
library(datasets)

mpgData=mtcars
mpgData$am = factor(mpgData$am, labels = c("Automatic","Manual"))

shinyServer(function(input, output) {
   
     airformula = reactive({
        paste("mpg ~", input$variable)
    })
    
    airpoint = reactive({
        paste("mpg ~", "as.integer(",input$variable,")")
    })
    
    airfit = reactive({
        lm(as.formula(airpoint()),data = mpgData)
    })
    
    output$caption = renderText({
        airformula()
    })
    
    output$airbox = renderPlot({
        boxplot(as.formula(airformula()), data = mpgData, outline = input$outliers)
    })
    output$airfit = renderPrint({
        summary(airfit())
        })
    output$airplot = renderPlot({
        with(mpgData, {
            plot(as.formula(airpoint()))
            abline(airfit(),col="blue")
        })
    })
    
})

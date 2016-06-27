shinyServer(function(input, output, session) {
  library(rpart)
  library(rpart.plot)
  
  fit <- rpart(Species ~ Petal.Length+Petal.Width, data = iris)
  output$plot1<-renderPlot({rpart.plot(fit)})
  df<-reactive({
    # if (input$submit > 0) {
      data.frame(Petal.Length=input$petallength,Petal.Width=input$petalwidth)
    # }
  })
  output$input<-renderPrint(df())
  output$prediction<-renderPrint({predict(fit,df(),"class")})
  output$prediction2<-renderPrint({predict(fit,df())})
})
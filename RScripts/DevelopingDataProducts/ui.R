shinyUI(pageWithSidebar(
  headerPanel('Iris Species Prediction'),
  sidebarPanel(
    helpText("Select petal length and width and then press the predict button"),
    numericInput('petallength','Petal Length', 3.0, min= 1.0, max=7.0,step = 0.1),
    numericInput('petalwidth','Petal Width', 1.0 , min= 0.1, max=3.0,step = 0.1),
    submitButton("Predict!")
  ),
  mainPanel(
    h1("Some Documentation"),
    p("Welcome to my app. This simple app helps predict what kind of Iris you have based on just the ",
    em("Petal Length"),"and",em("Petal Width"),"."),
    p("Choose the Petal Length (from 1.0 to 7.0 cm) and Petal Width (0.1 to 3.0 cm) and press ",span("Predict!",style="color:blue"),"to get the prediction."),
    p("The app will show a graph of the splitting criteria, what it thinks which kind of iris you have and the probabilities. Simple and helpful right?"),
    plotOutput('plot1'),
    h2("You entered"),
    verbatimTextOutput('input'),
    h2("I guess it is"),
    verbatimTextOutput('prediction'),
    h2("The probabilities are"),
    verbatimTextOutput('prediction2')
  )
))
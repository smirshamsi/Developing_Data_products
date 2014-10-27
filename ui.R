library(shiny)
shinyUI(
        pageWithSidebar(
                headerPanel("Crimes' Statistics in Washington DC"),
                sidebarPanel(
                        h4("choose a type of offense"),
                        selectInput("select", label=h3("Select box"),
                                    choices=list("HOMICIDE", "SEX ABUSE", "BURGLARY", "ROBBERY", 
                                                 "THEFT F/AUTO", "ASSAULT W/DANGEROUS WEAPON", 
                                                 "MOTOR VEHICLE THEFT", "ARSON", "THEFT/OTHER")
                                    ,selected=1),
                        submitButton("Submit")
                        
                ),
                mainPanel(h3("Total number of occured incidents for each district is shown in graph!"),
                          plotOutput("ranPlot")
                )
        )
)
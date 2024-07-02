#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(ggplot2)
library(shiny)
library(DT)
library(ggrepel)
library(tidyr)
library(shinycssloaders)
library(shinythemes)
library(SwimmeR)

dataset_prueba <- read.csv("archivos_entrada/data_test.csv")
dataset_prueba_2 <- read.csv("archivos_entrada/data_test_2.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  navbarPage("ImpactoCUvalles", id = "main_navbar", theme = shinytheme("lumen"),
             
    tabPanel("Principal", fluid = TRUE, icon = icon("globe-americas"),
             fluidRow(
               column(6,
                      h4(p("School Types")),
                      h5(p("US News and World Report uses four categories of schools for their rankings system:"),
                         p("National universities are those that offer a “full range” of undergraduate majors, while also offering graduate programs, including at the doctoral level.  Intercollegiate sports, including swimming, are generally pursued by undergrads, or occasionally students in master’s degree programs, so a university having nor not having doctoral programs isn’t directly relevant.  That said, doctoral programs and faculty research go hand-in-hand, so faculty at national universities are nearly always active in research, in addition to their teaching duties.  National universities are usually, though not always, large.  Most state flagship universities would fall under this category."),
                         p("Regional universities are similar to national universities in that they have a wide range of undergrad programs, and some master’s programs as well.  They generally do not have large doctoral programs, and correspondingly less faculty research."),
                         p("National liberal arts colleges are undergraduate focused, with few graduate programs.  They award the majority of their degrees in arts and sciences, and may or may not have other undergraduate programs, like engineering or professional studies."),
                         p("Regional colleges are also undergraduate focused institutions, but do not award the majority of their degrees in arts and/or sciences.  These colleges may have a particular focus, like technology or agriculture, or they may be primarily two year institutions that also grant some four year degrees.")
                      )
               ),
               column(6,
                      h4(p("US News Rankings")),
                      h5(p("Every year the US News and World Report issues a set of rankings for US colleges and universities.  They are a used in this setting as a guideline, and a general comparative device, but can often be misinterpreted or overvalued.  The major component of a given school’s rankings are graduation and retention rates, academic reputation (basically name recognition), and faculty resources (class size, faculty salary etc.).  Each school is given a score, and then placed in order.  That said the scored differences between schools of different rank can be quite small, so take the rankings with a grain of salt.
                                    The full methodology for the US News and World report college rankings can be found ",
                           a("here.",
                             href = "https://www.usnews.com/education/best-colleges/articles/ranking-criteria-and-weights"))
                      )
               )),
             fluidRow(
               column(6,
                      #br(),
                      h4(p("About the Project")),
                      h5(p("This project is intended to facilitate useful comparisons between colleges in the NCAA, based on swimming performance, location, and academic information.  Here a prospective student-athlete, or anyone else with an interest can find schools fitting a particular set of criterion relevant to them, for example, schools close to home, with times in a particular range, and of a specified academic profile.")),
                      br(),
                      h5(p("The project began as an attempt to combine my interest in swimming with a need to practice R, a programming language used primarily for analyzing and reporting data.  It has two components.  The first is this app, which queries a dataset to return information in the form of plots, data tables etc.  The second is the dataset itself, which I assembled by tying together information from the sources below.")),
                      br(),
                      h5(p("I hope you find it interesting and/or useful.  Any comments or questions are welcome at gpilgrim2607@gmail.com"),
                         p("The source code for this Shiny app is available ", a("on github", href = "https://github.com/gpilgrim2670/SwimMap"), "."))
                      
                      #hr(),
                      
               ),column(6,
                       #br(),
                       #             HTML('<img src="GregPicCrop.png", height="110px"
                       # style="float:right"/>','<p style="color:black"></p>'),
                       h4(p("About the Author")),
                       h5(p("Greg is a former collegiate swimmer.  After completing his undergrad degree he joined USMS, earned a PhD in chemistry, and began officiating swimming at the high school level.  He now swims with his local USMS team and serves as an official in USA Swimming while also working as an engineer.  He is the author the", a("SwimmeR package", href = "https://github.com/gpilgrim2670/SwimmeR"), "for working with swimming results in the R environment."),
                          p("For more work with swimming and R see Greg's articles at ", a("Swimming + Data Science", href = 'https://pilgrim.netlify.app/'), "."),
                          
                       ),
                       HTML('<img src="GregPicCrop.png", height="200px"'),
                       br())
             
             )
             ),
    navbarMenu("Bases de datos", icon = icon("database"),
               tabPanel("BD 1", fluid = TRUE,
                        DT::dataTableOutput('prueba')),
               tabPanel("BD 2", fluid = TRUE,
                        DT::dataTableOutput('prueba2'))
               )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$prueba <- DT::renderDataTable(
    DT::datatable(dataset_prueba, options = list(pageLength = 25))
  )
  
  output$prueba2 <- DT::renderDataTable(
    DT::datatable(dataset_prueba_2, options = list(pageLength = 25))
  )
  
}

# Run the application 
shinyApp(ui = ui, server = server)

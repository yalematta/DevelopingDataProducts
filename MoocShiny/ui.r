library(shiny) 
univ <- c("Stanford University" = 1, "University of Michigan" = 2, "Princeton University" = 3, "University of Pennsylvania" = 4, "Duke University" = 5,
          "Johns Hopkins University" = 6, "Georgia Institute of Technology" = 7, "University of California, San Francisco" = 8, "University of Toronto" = 9, "California Institute of Technology" = 10,
          "Rice University" = 11, "University of Edinburgh" = 12, "University of Washington" = 13, "École Polytechnique Fédérale de Lausanne" = 14, "University of Illinois" = 15,
          "University of Virginia" = 16, "Berklee College of Music" = 17, "Brown University" = 18, "Emory University" = 19, "Hebrew University of Jerusalem" = 20,
          "Leiden University" = 21, "University of London" = 22, "Icahn School of Medicine" = 23, "Oregon State University" = 24, "University of British Columbia" = 25,
          "University of California, Irvine" = 26, "University of Florida" = 27, "University of Maryland" = 28, "University of Melbourne" = 29, "Wesleyan University" = 30,
          "Hong Kong University of Science and Technology" = 31, "University of Pittsburgh" = 32, "Vanderbilt University" = 33, "Columbia University" = 34, "The Chinese University of Hong Kong" = 35,
          "National University of Singapore" = 36, "University of Geneva" = 37, "University of Minnesota" = 38, "Pennsylvania State University" = 39, "University of California, San Diego" = 40,
          "Northwestern University" = 41, "University of California, Santa Cruz" = 42, "Technical University of Denmark" = 43, "National Autonomous University of Mexico" = 44, "California Institute of the Arts" = 45,
          "University of Rochester" = 46, "IE University" = 47, "Monterrey Institute of Technology" = 48, "University of Copenhagen" = 49, "Ludwig Maximilian University of Munich" = 50,
          "University of Wisconsin-Madison" = 51, "École Polytechnique" = 52, "Rutgers University" = 53, "Case Western Reserve University" = 54, "University of Colorado Boulder" = 55,
          "The World Bank" = 56, "Sapienza University of Rome" = 57, "National Taiwan University" = 58, "The University of Tokyo" = 59, "University of North Carolina at Chapel Hill" = 60,
          "Technische Universität München" = 61, "Curtis Institute of Music" = 62, "Universitat Autònoma de Barcelona" = 63, "University of Zurich" = 64, "American Museum of Natural History" = 65,
          "The University of Chicago" = 66, "New Teacher Center" = 67, "Relay Graduate School of Education" = 68, "Match Teacher Residency" = 69, "Commonwealth Education Trust" = 70,
          "The Museum of Modern Art" = 71, "Exploratorium" = 72, "Yale University" = 73, "Tel Aviv University" = 74, "West Virginia University" = 75,
          "The State University of New York" = 76, "University of Houston System" = 77, "University of New Mexico" = 78, "Nanyang Technological University, Singapore" = 79, "University System of Georgia" = 80,
          "University of Nebraska" = 81, "University of Colorado System" = 82, "University of Kentucky" = 83, "CentraleSupélec" = 84, "Israel Institute of Technology" = 85,
          "École normale supérieure" = 86, "University of Amsterdam" = 87, "University of Alberta" = 88, "University of Manchester" = 89, "McMaster University" = 90,
          "Shanghai Jiao Tong University" = 91, "National Geographic Society" = 92, "UNSW Australia" = 93, "University of Western Australia" = 94, "Università Bocconi" = 95,
          "University of Lausanne" = 96, "Higher School of Economics" = 97, "HEC Paris" = 98, "Peking University" = 99, "IESE Business School" = 100,
          "Copenhagen Business School" = 101, "Moscow Institute of Physics and Technology" = 102, "Eindhoven University of Technology" = 103, "Korea Advanced Institute of Science and Technology" = 104, "Saint Petersburg State University" = 105,
          "Koç University" = 106, "Fudan University" = 107, "Lund University" = 108, "Universidade Estadual de Campinas" = 109, "Universidade de São Paulo" = 110,
          "ESSEC Business School" = 111, "Fundação Lemann" = 112)

# Define UI for application
shinyUI(
  fluidPage( 
    
    # Header or Title Panel
    titlePanel(title = " "),#h4(, align = "left")),
    
    # Sidebar Panel
    sidebarLayout( position = "right",
      sidebarPanel(
        selectInput("uni", "Select a University", choices = univ, selected = 1),
        textOutput("year"),
        br(),
        htmlOutput("univLogo")
        
        ),
      
      # Main Panel
      mainPanel(
        tabsetPanel(
          tabPanel("Plot", plotOutput("plot")),
          tabPanel("Summary", textOutput("summary"))
        )
      )	
    )
  ))
# Designing GUI: Building interactive application and connecting it with database. 

install.packages(c("shiny", "DBI", "RMySQL"))

library(shiny)
library(DBI)
library(RMySQL)

# 1. Set up the Database Connection
# Example: Replace the parameters below with your own database connection info
db_host <- "localhost"
db_user <- "your_user"
db_password <- "your_password"
db_name <- "your_database"

# 2. Create a database connection function
connect_to_db <- function() {
  con <- dbConnect(MySQL(), 
                   host = db_host, 
                   user = db_user, 
                   password = db_password, 
                   dbname = db_name)
  return(con)
}

# 3. Define the UI (User Interface)
ui <- fluidPage(
  # Application title
  titlePanel("Shiny App with Database Connection"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    sidebarPanel(
      # A drop-down list to select the table
      selectInput("table_name", "Choose a table", choices = c("table1", "table2")),
      
      # Button to load data
      actionButton("load_data", "Load Data")
    ),
    
    mainPanel(
      # Output for displaying table data
      tableOutput("table_data")
    )
  )
)

# 4. Define the Server Logic
server <- function(input, output) {
  
  # Reactive value to store the loaded data
  data_reactive <- reactiveVal(NULL)
  
  # Observe the action button to load data
  observeEvent(input$load_data, {
    # Connect to the database
    con <- connect_to_db()
    
    # Query to fetch data from the selected table
    query <- paste("SELECT * FROM", input$table_name)
    fetched_data <- dbGetQuery(con, query)
    
    # Disconnect after query
    dbDisconnect(con)
    
    # Store the fetched data in the reactive value
    data_reactive(fetched_data)
  })
  
  # Render the table in the UI
  output$table_data <- renderTable({
    # Get the reactive data and display it
    data_reactive()
  })
}

# 5. Run the application
shinyApp(ui = ui, server = server)

#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shiny)
library(tidyverse)
library(readr)
spotifydata <- read_csv("songs_18yrs_spotify_data_v5.csv") %>% select(date, year, title, simple_title, 
                                      artist, main_artist, peak_pos, last_pos, weeks, rank, change, genre, broad_genre)


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Popularity of Rap Music Over Time"),
   
      
      # Show a plot of the generated distribution
      mainPanel(plotOutput("Plot")))

# Define server logic required to draw a histogram
server <- function(input, output) {output$Plot <- renderPlot({spotifydata %>% ggplot(aes(x = broad_genre, y = weeks)) + 
    geom_bar(stat = "identity") + ggtitle("Music Genres by Popularity on Spotify 2000-2017") + 
    xlab("Songs by Genre") + ylab("Cumulative Weeks in Spotify Top 100")})
}

# Run the application 
shinyApp(ui = ui, server = server)


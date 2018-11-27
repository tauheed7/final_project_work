library(readr)
library(tidyverse)

initaldata <- read_csv("songs_18yrs_spotify_data_v5.csv")

spotifydata <- read_csv("songs_18yrs_spotify_data_v5.csv") %>% 
  select(date, year, title, simple_title, artist, main_artist, peak_pos, last_pos, weeks, rank, change, genre, broad_genre)


spotifydata %>% ggplot(aes(x = broad_genre, y = weeks)) + geom_bar(stat = "identity") + 
  ggtitle("Music Genres by Popularity on Spotify 2000-2017") + xlab("Genre") + 
  ylab("Cumulative Weeks in Spotify Top 100")
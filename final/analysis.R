library(dplyr)
library(ggplot2)
library(tidyr)
library(reshape2)
library(scales)
library(stringr)

## Grabbing data
demo <- read.csv("data/demographic data.csv", stringsAsFactors = F)
tobacco <- read.csv("data/tobacco.csv", stringsAsFactors = F)

## Function to compare two states
cancerByState <- function(state_1, state_2) {
  state_data <- demo %>%
    mutate(Rate = str_remove_all(Rate, "'")) %>%
    mutate(Area = str_remove_all(Area, "'"))
  state_data <- state_data %>%
    filter(Area == state_1 | Area == state_2)
  state_data %>%
    ggplot(aes(x = Area, y = as.double(Rate), fill = Area)) +
    geom_col() +
    labs(x = "States", y = "Tobacco-Related Cancer Rate") 
    
}

## Graph that displays top 10 cancer rates
topStates <- demo %>%
  mutate(Rate = str_remove_all(Rate, "'")) %>%
  mutate(Area = str_remove_all(Area, "'")) %>%
  arrange(desc(Rate)) %>%
  head(10) %>% 
  ggplot(aes(x = reorder(Area, as.double(Rate)), y = as.double(Rate), fill = Area)) +
  labs(title = "Top 10 Tobacco-Related Cancer Rates in the United States", x = "State", y = "Rate") +
  geom_col() +
  coord_flip() +
  theme(legend.position = "none")
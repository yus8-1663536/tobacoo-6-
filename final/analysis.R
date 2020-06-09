library(dplyr)
library(ggplot2)
library(plotly)
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

## uploading data 
cancer_type <- read.csv("data/cancer_type.csv",stringsAsFactors = F)

## Function to compare cancer types
cancerByType<- function(cancer_1, cancer_2){
  type_data <- cancer_type %>%
    mutate(CancerType = str_remove_all(CancerType,"'"))%>%
    mutate(rate = str_remove_all(Rate, "'")) %>%
    filter(CancerType == cancer_1 | CancerType == cancer_2)
  
  ggplot(type_data,aes(x= CancerType, y = as.double(rate), fill = CancerType))+
    geom_col()+
    labs(x="Cancer Type", y = "Age Adjusted Rates", title = "Tobacco-associated Cancers, Male and Female, United States, 2012-2016
Rate per 100,000 people")
}
## display top 5 tobacco related cancer types
topCancers <- cancer_type %>%
  mutate(CancerType = str_remove_all(CancerType,"'"))%>%
  mutate(Rate = str_remove_all(Rate, "'"))%>%
  mutate(Count = str_remove_all(Count,"'"))%>%
  arrange(desc(Count))%>%
  head(13)

# Create a map that displays a particular smoking usage category across the
# entire US during a selected year

# Setup dataset before entering in
tb_data <- tobacco
tb_data$Smoke.everyday <- as.numeric(sub("%", "", tb_data$Smoke.everyday))
tb_data$Smoke.some.days <- as.numeric(sub("%", "", tb_data$Smoke.some.days))
tb_data$Former.smoker <- as.numeric(sub("%", "", tb_data$Former.smoker))
tb_data$Never.smoked <- as.numeric(sub("%", "", tb_data$Never.smoked))

colnames(tb_data)[3] <- "Smoke Everyday"
colnames(tb_data)[4] <- "Smoke Some Days"
colnames(tb_data)[5] <- "Former Smoker"
colnames(tb_data)[6] <- "Never Smoked"
colnames(tb_data)[7] <- "Location"

tb_data <- tb_data %>%
  gather(Category, Percentage, 3:6)
tb_data <- tb_data %>%
  filter(State != "District of Columbia" &
           State != "Guam" &
           State != "Nationwide (States and DC)" &
           State != "Nationwide (States, DC, and Territories)" &
           State != "Puerto Rico" &
           State != "Virgin Islands")
createMap <- function(smoking_category, year) {
  tb_data <- tb_data %>%
    filter(Category == smoking_category) %>%
    filter(Year == year) %>%
    select(State, Percentage)
  tb_data$State <- state.abb[match(tb_data$State, state.name)]
  
  # Specifying map projections & options
  g <- list(scope = 'usa', projection = list(type = 'albers usa'),
            showlakes = TRUE, lakecolor = toRGB('white'))
  l <- list(color = toRGB("white"), width = 2)
  
  # Construct a map of the US
  plot_geo(tb_data, locationmode = 'USA-states') %>%
    add_trace(z = ~Percentage, locations = ~State,
              color = ~Percentage, colors = 'Blues') %>%
    colorbar(title = "Percentage") %>%
    layout(title = paste(smoking_category, "Prevalance and Trends in", year),
           geo = g)
}

# Creates a States table that's in accordance to the selected
# Smoking behavior and year and ranked by its percentage
createTable <- function(smoking_category, year) {
  table_data <- tb_data %>%
    filter(Category == smoking_category) %>%
    filter(Year == year) %>%
    select(State, Percentage, Location) %>%
    arrange(desc(Percentage))
  table_data$Rank <- NA
  table_data$Rank[order(-table_data$Percentage)] <- 1:nrow(table_data)
  table_data <- table_data %>%
    select(Rank, State, Percentage, Location)
  
  plot_ly(type= "table",
          header = list(values = names(table_data),
                        line = list(color = 'darkslategray'),
                        fill = list(color = 'lightskyblue'),
                        align = 'left'), 
          cells = list(values = unname(table_data),
                       line = list(color = 'darkslategray'),
                       fill = list(color = 'lightcyan'),
                       align = 'left')) 
}

## Nationwide Data by Year

nationwide_data <- tobacco %>%
  filter(State == "Nationwide (States, DC, and Territories)") %>%
  select(Year, Smoke.everyday)

nationwide_data$Smoke.everyday<-as.numeric(substr(nationwide_data$Smoke.everyday,0,nchar(nationwide_data$Smoke.everyday)-1))
nationwide_data$Year <-as.factor(nationwide_data$Year)

## Function for Nationwide Data by Year
nation_by_year<- function(year_1, year_2){
  data_nationwide <- nationwide_data %>%
    filter(Year == year_1 | Year == year_2)
  
  ggplot(data_nationwide,aes(x = Year, y = Smoke.everyday, fill = Year))+
    geom_col()+
    labs(x="Year", y = "Percentage of Daily Smokers", title = "Comparison of U.S. Nationwide Percentage of Daily Smokers by Year")+
    theme(plot.title = element_text(hjust = 0.5))
  
}  

## Table for Nationwide Smoking in America
nationwide_behavior <- tobacco %>%
  filter(State == "Nationwide (States, DC, and Territories)") %>%
  select(Year, Smoke.everyday, Smoke.some.days, Former.smoker, Never.smoked) %>%
  arrange(Year)
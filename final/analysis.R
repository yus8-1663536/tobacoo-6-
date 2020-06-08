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

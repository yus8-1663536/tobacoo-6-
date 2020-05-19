library("dplyr")
library("ggplot2")
library("tidyr")
library(reshape2)
library(scales)

#demo <- read.csv("./demographic data.csv", stringsAsFactors = F)
#top_demo <- demo%>%
  #top_n(10,wt=Rate)%>%
  #arrange(Rate)

#ggplot(top_demo)+
  #geom_col(aes(x=Area, y= Rate))+coord_flip()
  
usage <- read.csv("./tobacco.csv",stringsAsFactors = F)
tobacco <- usage %>%
  group_by(State)%>%
  summarise(
    mean = mean(as.numeric(sub("%","", Smoke.everyday))),
    sd= sd(as.numeric(sub("%","",Smoke.everyday)))
  )%>%
  arrange(-mean)%>%
  top_n(5)
ggplot(tobacco)+
  geom_col(aes(x=State, y = mean))+
  labs(title = "Top 5 States of highest daily smoking percentage", x="State",y="Percent of smoking everyday")+
  coord_flip()

trend <- usage %>%
  group_by(State)%>%
  filter(State==c("Kentucky","Guam","West Virginia","Tennessee","Indiana","Missouri"))%>%
  select(c(Year,State,Smoke.everyday,Smoke.some.days))

ggplot(trend)+
  geom_point(aes(x=Year, y=Smoke.everyday,color=State))

wv<- usage%>%
  filter(State == "West Virginia")%>%
  summarise(
    mean=mean(as.numeric(sub("%","",Smoke.everyday))))

nation_ave <- usage %>% 
  filter(State == "Nationwide (States, DC, and Territories)") %>%
  select(Year, State, Smoke.everyday) %>%
  ggplot(aes(x = Year, y = Smoke.everyday, group = 1)) +
  labs(y = "Average % of People who Smoke Everyday", title = "Nationwide Averages of Everyday Smokers from 1995 to 2010") +
  geom_point() +
  geom_line()

nation_lineplot <- usage %>%
  filter(State == "Nationwide (States, DC, and Territories)") %>%
  select(Smoke.everyday, Smoke.some.days, Former.smoker, Never.smoked, Year) %>%
  gather(Category, Percentage, 1:4) %>%
  mutate(Percentage = as.numeric(sub("%", "", Percentage))) %>%
  ggplot(aes(x = Year, y = Percentage, group = Category, color = Category)) +
  labs(title = "Nationwide Averages Across All Smoking Categories from 1995 to 2010") +
  geom_line()

nation_years <- usage %>%
  filter(State == "Nationwide (States, DC, and Territories)") %>%
  select(Year, Smoke.everyday, Smoke.some.days, Former.smoker, Never.smoked) %>%
  arrange (-Year)

target <- c(1995, 2010)
melt_nation_years_2 <- melt(nation_years, id = "Year") %>%
  filter(Year %in% target)

melt_nation_years_2$value<-as.numeric(substr(melt_nation_years_2$value,0,nchar(melt_nation_years_2$value)-1))
melt_nation_years_2$Year <-as.factor(melt_nation_years_2$Year)

year_comparison_plot <- ggplot(melt_nation_years_2, aes(fill = Year, x = variable, y = value)) +
  geom_bar(position = "dodge", stat = "identity")+
  labs(
    title = "U.S. Nationwide Smoking Behavior in 1995 vs. 2010",
    x = "Smoking Behavior",
    y = "Percent of Nationwide Population"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) +
  coord_flip()



library("dplyr")
library("ggplot2")
library("tidyr")

demo <- read.csv("./demographic data.csv", stringsAsFactors = F)
top_demo <- demo%>%
  top_n(10,wt=Rate)%>%
  arrange(Rate)

ggplot(top_demo)+
  geom_col(aes(x=Area, y= Rate))+coord_flip()
  
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
  




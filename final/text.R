introduction_1 <- "When our group first convened, our initial goal was to find a topic that could reach a broad audience so that we could create
                  beneficial visualizations that could help people better understand the topic. We decided to research tobacco and its effects on health,
                  as we believed that nearly everyone in the United States knows a person who smokes or has smoked in the past. We decided on our target
                  audience to be the general public of the United States, and we tailored our visualizations to be simple and easy to work with so that those
                  who don't have much expertise in the coding or health fields could easily understand them."

introduction_2 <- "We located two datasets from the Centers for Disease Control and Prevention (CDC) database that we found to be sufficient for our goals
                  for the project. The first dataset tracks tobacco-related cancer rates in every state for 2019. This allowed us to create simple visualizations 
                  that showed how tobacco products could directly affect a person's health in the form of cancer. We wanted to investigate deeper into smoking
                  habits so we found the second dataset, which tracked smoking habits of Americans from 1995 to 2010. These two datasets allowed us to conduct
                  proper analysis on the effects of smoking on a person's health as well as the trends of smoking rates over a fifteen year period."

introduction_3 <- "Each tab in the panel above investigates a different aspect of these datasets, culminating in the discussion of results in final conclusion
                  tab."

dstates <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware",
             "District of Colombia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
             "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
             "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York",
             "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
             "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
             "West Virginia", "Wisconsin", "Wyoming")

conclusion_1 <- "The first tab, 'State Comparison', investigates the cancer rates between two states at a time, as well as displays the 10 states
                with the highest tobacco-related cancer rates. Looking at the graph with the top 10 states, one can see a trend where states located in the
                eastern part of the country tend to have higher cancer rates than states in the western part of the country. A closer inspection can also
                display that states in the southeastern part of the United States(Kentucky, Mississippi, West Virginia, Arkansas, Lousiana, and Tennessee)
                represent more than half of the top 10 states with the highest tobacco-related cancer rates. This could be due to these states having 
                more of an accepting culture towards smoking compared to other states in the western United States. By fiddling with the state comparison
                visualization, one can see that west coast states (California for example) have much lower cancer rates than most other states."

canctype<- c("Trachea,Lung and Bronchus", "Colon and Rectum", "Urinary Bladder", "Kidney and Renal Pelvis", "Pancreas", "Lip, Oral Cavity and Pharynx",
             "Cervix", "Liver", "Stomach", "Esophagus", "Acute Myeloid Leukemia", "Larynx")
conclusion_2 <- "The second tab, 'Cancer Type Comparison', looks into the all the tobacco-related cancers during the year of 2012-2016 and prompt users to
                choose from any two types of cancer each time to compare its age adjusted rates.The table below presents the statistic of prevalent cancers,
                with 'lci' presenting the 95% lower confident interval, 'uci' meaning the 95% upper confident interval, 'count' stadning 
                for the number of new cases and 'population' presenting the total population of the US.From the table, it it straightforward to see that 
                the most prevalent cancers is Trachea, Lung and Bronchus Cancer, which takes up 31.4% of all tabacco-associated
                cancers. The second most prevalent cancer associated with tobacco is Colon and Rectum cancers, which takes up 20.4% of total tobacco-associated 
                cancers. Beyond that, it is not surprising to see the Lip, Oral Cavity Cancers on the list. From there, it can be concluded that the probability of 
                getting certain tobacco-related cancers depends how frequent the hazardous substance like nicotine have contacts with different organs. With that 
                being said, the more frequent an organ get affected by hazardous substance from tobacco, the more likely that organ would be cancerized." 

smoke_categories <- c("Smoke Everyday", "Smoke Some Days", 
                      "Former Smoker", "Never Smoked")

timeline <- c(1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
              2006, 2007, 2008, 2009, 2010)

conclusion_3 <- "The third tab, 'Smoking Behavior', explores the prevalence of four different smoking usage categories in the US from 1995 to 2010. And allows
                users to select a particular smoking behavior and year they'd like to observe, then constructs a map of the United States that includes each
                states percentages (respective to the users choices). Also, a table is created below to illustrate the rank, state, percentage and precise location
                from which the data is collected. By closely examining each individual smoking behavior, one can be able to see significant trends with states
                and in some cases regions. For 'Smoke Everyday', Kentucky and its neighboring states consistently appear in the top 10 over the years. This can
                be seen in the region's acceptance towards tobacco and that it's apart of or nearby the `Virginia-Carolina Tobacco Belt'; an area that leads the
                country in tobacco production. While for 'Never Smoked', the state of Utah ranks first from 1997 to 2010, which acknowledges a contrast to the
                Midwest and Southeast of the US. The reasoning behind this is associated with the strict religious views agaisnt drugs and substances in Utah.
                The 'Smoke Some Days' group is typically central to the Southwestern part of the country, with repeated showings of New Mexico, Texas and Nevada
                in the top 10 percentages. And lastly for 'Former Smoker', high percentage leaders are found in the Northeastern states of the US and signifies a
                region in which anti-tobacco campaigns and movement is effective."

years_listed <- c("1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010")
conclusion_4 <- "The fourth tab, 'Nationwide by Year Comparison', has an interactive plot that portrays the U.S. nationwide (including the states, D.C., and U.S. territories) daily smoker percentage by year. In terms of data, 15 different years are accounted for (from 1995 to 2010). Also, this tab includes a table displaying data about U.S. nationwide smoking behavior percentages by year (from 1995 to 2010). The interactive plot demonstrates how as the years go by, the percentage of daily smokers nationwide decreases in tiny increments. This may be a result of increasesd research and awareness about the negative consequences of daily smoking, which could go hand-in-hand with people starting to change their habits of being a smoker. The only exception to this pattern was in 2002, where this was a slight increase in the percentage. However, when looking at the pattern overall, there is a general decrease in daily smokers in the nation. The change is much more evident in the daily smoker percentage compared to that of people who smoke some days and former smokers. This is depicted by the table of nationwide smoking behavior percentages. While there is an almost 8% percent decrease in daily smokers, the percentages for the other behaviors tend to jump around slightly over the years. However, the nationwide percentage for people who have never smoked has increased over the years, which can also potentially indicate that more people are paying attention to the consequences of smoking and are therefore avoiding it."
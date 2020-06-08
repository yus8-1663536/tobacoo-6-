introduction_1 <- "When our group first convened, our initial goal was to find a topic that could reach a broad audience so that we could create
                  beneficial visualizations that could help people better understand the topic. We decided to research tobacco and it's effects on health
                  as we believed that nearly everyone in the United States knows a person who smokes or has smoked in the past. we decided on our target
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






library(readr)
library(dplyr)
covid_df <-read_csv(file = "~/desktop/covid19.csv")
dim(covid_df)
vector_cols <- colnames(covid_df)
glimpse(covid_df)
covid_df_all_states = subset(covid_df=-c("Province_State"))
df=covid_df[,!names(covid_df)%in%c("Province_State")]
glimpse(covid_df_all_states)

covid_df_all_states_daily <- covid_df %>% select(Date, Country_Region, active, hospitalizedCurr,daily_tested, daily_positive)

tested <- covid_df_all_states_daily %>% group_by(Country_Region) %>% 
              summarise(daily_tested = sum(daily_tested))
positive <- covid_df_all_states_daily %>% group_by(Country_Region) %>% 
  summarise(daily_positive = sum(daily_positive))

active <- covid_df_all_states_daily %>% group_by(Country_Region) %>% 
  summarise(active = sum(active))

hospitalized <- covid_df_all_states_daily %>% group_by(Country_Region) %>%
  summarise(hospitalizedCurr = sum(hospitalizedCurr))


covid_df_all_states_daily_sum <- tested %>% arrange(desc(tested))

covid_top_10 <- head(covid_df_all_states_daily_sum, 10)

covid_top_10$Country_Region

countries <- c("Vietnam", "Venezuela", "Uruguay", "United States", "United Kingdom","United Arab Emirates",
               "Ukraine","Ukraine","Uganda", "Turkey",  "Tunisia")

tested_cases <-c("Country_Region","daily_tested")


positive_cases <- c("Country_Region","daily_positive")

active_cases <- c("Country_Region","active")

hospitalized_cases <- c("Country_Region","hospitalizedCurr")


names(countries) <- c("tested_cases", "positive_cases", "active_cases", "hospitalized_cases")

positive_tested_top_3 <- "tested_cases" / "tested_cases"

united_kingdom <- c(0.11, 1473672, 166909, 0, 0)

united_states <- c(0.10, 17282363, 1877179, 0, 0)

turkey <- c(0.08, 2031192, 163941, 2980960, 0)




           


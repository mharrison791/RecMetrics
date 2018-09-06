#To run this code you will need to have installed package "Lubridate"

#Add campaign week numbers 1 to however many rows you have!
library(lubridate)

#Creates a simple list of campaign week numbers 1 to 33 (Change the numbers to extend or reduce this number)
Date_Table$Campaign_week_number <- c(1:33)

#This line generates a list of every date from the two dates listed for sampling
all_dates_2017_18 <-seq(as.Date('2017-08-15'),as.Date('2018-03-31'),by = 1)

#Generates candidate IDs from 1 to 5000. 
Candidate_data_2017_18 <- data.frame(Candidate_ID=c(1:5000))
#randomly samples from the date list to give every ID a date that we'll use for submission date.
Candidate_data_2017_18$Submission_date <- sample(all_dates_2017_18,5000, replace = TRUE)

#Creates a value for the name of the Intake assuming multiple seasons data. Can be removed if only generating one data set
Candidate_data_2017_18$Intake <- c("2017/18")

#creates gender list and then randomly samples them to assign to each canadidate
genders <-c("male","female")
Candidate_data_2017_18$gender <- sample(genders,5000,replace = TRUE)

#Creates list of numbers 1 to 10 to randomly sample to give each candidate a number of days we'll use for review time
numbers <- c(1:10)
Candidate_data_2017_18$reviewNumber <- sample(numbers,5000, replace = TRUE)
write.csv(Candidate_data_2017_18, file = "candidatesubmissons_2018.csv", row.names = FALSE)

#Repeat for 2018/19 season
Date_Table$Campaign_week_number <- c(1:33)
all_dates_2018_19 <-seq(as.Date('2018-08-15'),as.Date('2018-12-31'),by = 1)
Candidate_data_2018_19 <- data.frame(Candidate_ID=c(1:2500))
Candidate_data_2018_19$Submission_date <- sample(all_dates_2018_19,2500, replace = TRUE)
Candidate_data_2018_19$Intake <- c("2018/19")
Candidate_data_2018_19$gender <- sample(genders,2500,replace = TRUE)
Candidate_data_2018_19$ReivewNumber <- sample(numbers,2500, replace = TRUE)
Candidate_data_2018_19$WeekNumber <- isoweek(Candidate_data_2018_19$Submission_date)
write.csv(Candidate_data_2018_19, file = "candidatesubmissions_2019.csv", row.names = FALSE)

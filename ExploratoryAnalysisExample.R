# You need to set the working directory to the same folder that the data is in
setwd("~/Involvement/BDAA/Spring 2016/AMEND Case Comp/Competition Analysis")

library(dplyr) # library for merging and reshaping data
library(stringr) # library for dealing with strings
library(lubridate) # library for dealing with dates

all_data <- read.csv('AMEND_DATA_CLEAN.csv')

# Check the data structure and variable types
str(all_data)

# Take a look
View(all_data) # or used head(all_data) to view first 6 rows

# Clean the shipping number field - should be a factor not an int
all_data$fshipno <- as.factor(all_data$fshipno)

# Clean the date field
all_data$fshipdate <- as.Date(as.character(all_data$fshipdate), format="%m/%d/%Y")
# Putting a new variable after the $ will create a new variable
all_data$Year <- year(all_data$fshipdate)
all_data$Month <- month(all_data$fshipdate)

# Plot revenue by year
revenue <- aggregate(fprice ~ Year, data = all_data, FUN = sum) # sum all revenue(fprice) for each year
revenue <- arrange(revenue, Year) # sort by year
barplot(revenue$fprice, names.arg = revenue$Year,
        xlab = "Year", ylab = "Revenue", main = "Revenue per Year")

# Plot profit by year
profit <- aggregate(cbind(fprice, faccumulat) ~ Year, data = all_data, FUN = sum)
profit <- arrange(profit, Year) # sort by Year
profit <- mutate(profit, Margin = (fprice - faccumulat) / fprice) # mutate is a function from the dplyr library
#Google "data wrangling cheat sheet" for great walkthrough of dplyr library

barplot(profit$Margin, names.arg = profit$Year,
        xlab = "Year", ylab = "Profit", main = "Profit Margin per Year")

# Looking at most profitable part numbers
# Using the dplyr commands instead of the 'aggregate' function
best_parts <- all_data %>% group_by(fpartno) %>% summarize(Revenue = sum(fprice),
                                              Cost = sum(faccumulat),
                                              Margin = (Revenue - Cost)/Revenue)
                                                          
best_parts <- arrange(best_parts, desc(Margin)) # Sort by Margin in descending order

  
#install. packages("ggplot2")
library(ggplot2)

#(a) The code to import excel data into R platform.

Test<-read.csv("hotel_bookings.csv", stringsAsFactors = FALSE)
View(Test)

#(b).the code to construct the scatter graph using 
#performance against age.


ggplot(Test, aes(x = age, y=performance)) + 
  theme_bw() +
  geom_point()+ 
  labs(y="performance", 
       x = "age",
       title = "Performance against age Distribution")


# b(i) a code to add the line of best fit onto the 
#scatter diagram above.

plot(Test$age, Test$performance, main = 'Regression for age on performance',
     xlab = 'age', ylab = 'performance')
abline(lm(performance ~age, data = Test) , col='green')


plot(performance~age, data = Test, xlab = 'age', ylab = 'performance',
     main = 'Enhanced scatter plot')

library(tidyverse)
model <- lm(performance ~ age + sickoff, data = Test)
summary(model)


model <- lm(performance ~ age + gender +citizen + sickoff, data = Test)
summary(model)

model <- lm(sales ~ age + sickoff + gender, data = Test)
summary(model)








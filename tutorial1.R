#install.packages("ggplot2")
library(ggplot2)

Titanic<-read.csv("train.csv", stringsAsFactors = FALSE)

##the code below shows my own manipulations based on DATA ANALYSIS
##FULL COURSE (10 HOURS)
##START

#FILTERING DATA##
View(Titanic)
tail(Titanic)
Male<-Titanic[Titanic$Sex== "male" & Titanic$Fare > 100,] 
demo3<-Titanic[Titanic$Survived =="1",]

demo<- Titanic[Titanic$Age >50,]
demo2<- Titanic[Titanic$Fare >100,]
demo3<-Titanic[Titanic$PassengerId > 550,]
demo2<-Titanic[Titanic$Fare> 100, c(2,4,5,6)]

demo2<-Titanic[Titanic$Fare> 100, -c(2:6)]


##SUBSETS##
demo3<- subset(Titanic, Age >50 & Embarked == "C" & Sex=="male")

##sorting data frames
demo3<-Titanic[order(Titanic$Age),]

##statistical analysis
max(Titanic$Fare)
min(Titanic$Fare)
range(Titanic$Fare)

mean(Titanic$Fare)
sd(Titanic$Fare)
var(Titanic$Fare)
mad(Titanic$Fare)
median(Titanic$Fare)

quantile(Titanic$Fare)
IQR(Titanic$Fare)
31-7.91
##visualisations
library(ggplot2)
ggplot()+ geom_histogram(data = Titanic, aes(x=Fare ,fill=Sex),color ="black" , bins =30,binwidth= 100)


library(Descr)

ggplot(Titanic, aes (x= Embarked, y = Fare, fill = Embarked)) + stat_summary(fun= mean, geom = "bar")




## DATA ANALYSIS FULL COURSE ENDS HERE


#set up factors.
Titanic$Pclass <- as.factor(Titanic$Pclass)
Titanic$Survived<-as.factor(Titanic$Survived)
Titanic$Sex<-as.factor(Titanic$Sex)
Titanic$Embarked<-as.factor(Titanic$Embarked)

#first question-what was the survival rate?
#as survived is a factor variable, a bar chart is a great visualisation to use.
#a bar graph.
ggplot(Titanic, aes(x=Survived)) + 
  geom_bar()
#
#we need 3 things here 1.data=titanic 2. the aesthetic ie map survived 
#in the x-axis of the plane. and 3.  layer. in this case the geom.
#the geom is used to define the visualisations we are going to use, in this case 
#

#if you really need percentages then:
prop.table(table(Titanic$Survived))

#Add some customization for labels and theme.
ggplot(Titanic, aes(x=Survived))+theme_bw() +geom_bar()+ 
  labs(y="passenger count", title = "Titanic survival rates")


 
#What was the survival rate by gender?
#we can use color to look at two aspects (ie.dimensions)
#of the data simultaneously.

ggplot(Titanic, aes(x=Sex, fill=Survived))+
  theme_bw() + 
  geom_bar()+ 
  labs(y="passenger count", title = "Titanic survival rates by Sex")
?aes
#
#tird question- what was the survival rate by class of ticket.
#

ggplot(Titanic, aes(x = Pclass, fill=Survived)) + 
  theme_bw() +
  geom_bar()+ 
  labs(y="passenger count", 
       title = "Titanic survival rates by Pclass")
?stderr


#fourth question-what was the survival rate 
#by the class of ticket and gender.
#we can leverage facets to further 
#segment the data and 
#enable "visual drill-down" into the data.
#
ggplot(Titanic, aes(x = Sex, fill=Survived)) + 
  theme_bw() +
  facet_wrap(~ Pclass)+
  geom_bar()+ 
  labs(y="passenger count", 
       title = "Titanic survival rates by Pclass and Sex")

#Next we'll move on to visualizing continous (i.e numeric)
#data using ggplot2 We'll explore visualisations of single
#numeric variables(i.e columns) and also illustrate how 
#ggplot2 enables visual drill-down on numeric data.
#




#
#Fifth question -what is the distribution of customer ages?
#The histogram is a staple of visualizing numeric data as it very
#powerfully communicates the distribution of a variable (i.e column).

ggplot(Titanic, aes(x = Age)) + 
  theme_bw() +
  geom_histogram(binwidth = 5)+ 
  labs(y="passenger count", 
       x = "Age (binwidth=5)",
       title = "Titanic Age Distribution")

#what are the survival rates by age?
#using box and whisker.

ggplot(Titanic, aes(y = Age,x= Survived)) + 
  theme_bw() +
  geom_boxplot()+ 
  labs(y="Age", 
       x = "Survived",
       title = "Titanic survival rates by Age")

#using a histogram.
ggplot(Titanic, aes(x = Age,fill= Survived)) + 
  theme_bw() +
  geom_histogram(binwidth = 5)+ 
  labs(y="passenger count", 
       x = "Age (binwidth=5)",
       title = "Titanic survival rates by Age")
#we can use facets to allow for visual drill-down via density 
#plots
ggplot(Titanic, aes(x = Age,fill= Survived)) + 
  theme_bw() +
  facet_wrap(Sex~ Pclass)+
  geom_density(alpha = 0.5)+ 
  labs(y="Age", 
       x = "Survived",
       title = "Titanic survival rates by Age, Pclass and Sex")

#if i preffer histograms!


ggplot(Titanic, aes(x = Age,fill= Survived)) + 
  theme_bw() +
  facet_wrap(Sex~ Pclass)+
  geom_histogram(binwidth = 5)+ 
  labs(y="Age", 
       x = "Survived",
       title = "Titanic survival rates by Age, Pclass and Sex")


?is.empty.model()


?ggplot

?Geometric


??is.
?cbind


















































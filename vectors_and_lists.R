library("palmerpenguins")
summary(penguins)
View(penguins)

ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color = species))

numeric_vector <- c(2,1,56,76,44,990,12,345,65,22)
typeof(numeric_vector)


length(numeric_vector)
is.atomic(numeric_vector)
is.list(numeric_vector)
is.character(numeric_vector)
is.double(numeric_vector)

# naming vectors

names(numeric_vector)<-c('a','b','c','d','e','f','g','h','j','k')
numeric_vector

#CReating lists
my_list <- list(2,'a',TRUE,1.56654)
str(my_list)

# naming lists
names(my_list)<-list(1,2,3,4)
my_list

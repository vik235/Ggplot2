#####################################################################################################
###' Plotting grouped , longitudinal data
###' Vivek Kumar Gupta
#####################################################################################################

library(nlme)
data(Oxboys)

head(Oxboys , 10) #Subjects are th eindividuals followed longitudially
str(Oxboys)
attach(Oxboys)

##some issues here with color choices. They seem to be different but so alike 
ggplot(Oxboys , aes(age , height , group = Subject )) +  #Subject defines various groups. 
  #If interactions use interaction(x,y)
  geom_point(aes(colour = Subject)) + 
  geom_line(aes(colour = Subject))


##Adding a smoother for each subject , boy

##Incorrect way of doing it. Adds a smoother fit for individual subjects which is irrelevant
ggplot(Oxboys , aes(age , height , group = Subject )) +  #Subject defines various groups. 
  #If interactions use interaction(x,y)
  #geom_point(aes(colour = Subject)) + 
  #geom_line(aes(colour = Subject)) + 
  geom_line()+
  geom_smooth(method = "lm" , se = FALSE)


##correct way of doing it. Note the setting the group variable to smoother only. I,e only one smooth line 
## Size controls the 
ggplot(Oxboys , aes(age , height )) +  #Subject defines various groups. 
  #If interactions use interaction(x,y)
    geom_line(aes(colour = Subject)) + 
  geom_smooth(method = "lm" , se = TRUE , size = 2)





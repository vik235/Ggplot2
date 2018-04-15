###
###'Scatters again . The grammar and the building blocks. Hold them tight to transfer between mind and paper. Layer by Layer
###'Defining individual layers and makign them separate. Differnent ways to specify aesthetics
###


library(ggplot2)
library(mgcv)
data(mpg)
attach(mpg)
str(mpg)

##These all are the same 
ggplot(mpg, aes(displ , hwy , color = class)) + 
  geom_point(size = 2)

ggplot(mpg, aes(hwy , color = class)) + 
  geom_point(data = mpg , size = 2 , aes(x = displ , y = hwy))


##But these linear models are modeeled differnetly on different data sets 

ggplot(mpg , aes(displ , hwy)) + 
  geom_point(size = 2 , data = mpg , aes(colour = class)) + 
  geom_smooth(method = "lm" , se = TRUE)


ggplot(mpg , aes(displ , hwy , color = class)) + 
  geom_point(size = 2 , data = mpg ) + 
  geom_smooth(method = "lm" , se = FALSE)

##Setting vs Mapping 

ggplot(mpg , aes(cty , hwy)) + 
  geom_point(colour = "dodgerblue")


ggplot(mpg , aes(cty , hwy)) + 
  geom_point(aes(colour = cut))


##Using "names" aka demo of using legends in ggplot2


ggplot(mpg , aes(displ , hwy)) + 
  geom_point(size = 2 , data = mpg ) + 
  geom_smooth(aes(color = "lm") , method = "lm" , se = FALSE ) +
  geom_smooth(aes(color = "loess") , method = "loess" , se = FALSE) + 
  labs(color = "Method")

##Adding summaries 

ggplot(mpg , aes(trans , hwy)) + 
  geom_point(size = 2 , data = mpg ) + 
  stat_summary(geom = "point" , fun.y = "mean" , color = "red" , size = 4)

ggplot(mpg , aes(trans , hwy)) + 
  geom_point(size = 2 , data = mpg ) + 
  geom_point(stat = "summary" , fun.y = "mean" , color = "red" , size = 4)

##Some more plotting on univariates 

ggplot(diamonds , aes(price , color = cut)) + 
  geom_density() 
  

##stacked bars 
attach(diamonds)
head(diamonds)

ggplot(diamonds , aes(color , fill = cut)) + 
 # geom_bar() + 
 # geom_bar(position = "fill")  
  geom_bar(position = "dodge")

ggplot(diamonds , aes(color , fill = cut)) + 
   geom_bar()


ggplot(diamonds , aes(color , fill = cut)) + 
  geom_bar(position = "fill")
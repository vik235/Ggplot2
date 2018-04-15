###
###Scatters again . The grammar and the building blocks. Hold them tight to transfer between mind and paper
###

library(ggplot2)
library(mgcv)
data(mpg)
attach(mpg)
str(mpg)

ggplot(mpg, aes(displ , hwy, colour = factor(cyl))) + 
  geom_point( size = 2) + # Each point has a size , shape and a colour
  ylab("Highway MPG") + 
  xlab("Dsiplacement") + 
  ggtitle("MPG Dataset")

ggplot(mpg, aes(displ , hwy, colour = factor(cyl))) + 
  geom_point( size = 2) + # Each point has a size , shape and a colour
  geom_smooth(method = "lm" , se = FALSE) +
  ylab("Highway MPG") + 
  xlab("Dsiplacement") + 
  ggtitle("MPG Dataset")

##Adding a GAM smoother between the groups. 
ggplot(mpg, aes(displ , hwy, colour = factor(cyl))) + 
  geom_point( size = 2) + # Each point has a size , shape and a colour
  geom_smooth(method = "gam" , formula = y ~ s(x, bs = "cr" , k = 4) , se = TRUE) +
  ylab("Highway MPG") + 
  xlab("Dsiplacement") + 
  ggtitle("MPG Dataset")


##Adding a GAM smoother between the groups. 
ggplot(mpg, aes(displ , hwy, colour = factor(cyl))) + 
  geom_point( size = 2) + # Each point has a size , shape and a colour
  geom_smooth(method = "gam" , formula = y ~ s(x, bs = "cr" , k = 4) , se = TRUE) +
  ylab("Highway MPG") + 
  xlab("Dsiplacement") + 
  ggtitle("MPG Dataset") + 
  facet_wrap(~ factor(cyl))






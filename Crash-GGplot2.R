#####################################################################################################
###' Crash in ggplot2 , so powerful and yet so under utilized 
###' Vivek Kumar Gupta
#####################################################################################################
library(ggplot2)
library(mgcv)
data(mpg)
attach(mpg)
head(mpg , 6)

setwd("c:/Users/vigupta/Documents")
##' Data 
##' Aesthetics : mapping between variables and the visual props
##' Geom : at least one layer on how to render each obs 
##' 
##' qplot() fast , quick way of plotting ggplot object. 
##' 


##Simple plot 

ggplot(mpg ,
       aes(x = displ , y = hwy))  + geom_point( show.legend = T)

ggplot(mpg ,
       aes(displ , hwy)) +
  geom_point()

ggplot(mpg ,
       aes(hwy)) +
  geom_histogram()

ggplot(mpg ,
       aes(cty)) +
  geom_histogram()



ggplot(mpg ,
       aes(x = displ , y = hwy , colour = class))  + 
  geom_point( show.legend = T)


ggplot(mpg ,
       aes(x = displ , y = hwy , colour = class , shape = drv ))  + 
  geom_point( show.legend = T)


ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point( aes(colour = class))


ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point( colour = "blue")


ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point( aes(colour = "blue"))

#facetting 

ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point(colour = "blue" ) + 
  facet_wrap(~class)


##Add non parametric smoothing
ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point(aes(colour = class) ) + 
  facet_wrap(~class) + 
  geom_smooth(aes(colour = class))


##Add non parametric smoothing
ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point(aes(colour = class) ) + 
  facet_wrap(~class) + 
  geom_smooth(span = .2 )


##Add non parametric smoothing
ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point(aes(colour = class) ) + 
    geom_smooth(span = .2)

##Using gam mgcv for smoothing 

##good olf mgcv and gam
library(mgcv)
ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point() + 
  geom_smooth(method = "gam" , formula = y ~ s(x))


##Using linear method for smoothing 

ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point() + 
  geom_smooth(method = "lm" )

##Using robust linear method for smoothing : take care of leverage , influential points.

library(MASS)
ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point() + 
  geom_smooth(method = "rlm" )


##geom_box plots : distr of the cont r.v w.r.t to classes all in one plot 

ggplot(mpg ,
       aes(x = drv , y = hwy  ))  +  # note treatments are used in z axis
  geom_boxplot(aes(color = drv))

## plotting continuous variables 

ggplot(mpg , aes(hwy)) + 
  geom_histogram()

ggplot(mpg , aes(hwy)) + 
  geom_freqpoly()

ggplot(mpg , aes(hwy)) + 
  geom_freqpoly(binwidth = 1) + 
  facet_wrap(~drv)

ggplot(mpg , aes(hwy , color = drv)) + 
  geom_freqpoly(binwidth = 1 , lwd = 1 , lty = 2)
  

ggplot(mpg , aes(hwy , colour = drv )) + 
  geom_freqpoly(binwidth = 1) + 
  facet_wrap(~drv , ncol = 1  ) + 
  ggtitle("Frequency plots, wrapped by drv and color coded")

ggplot(mpg , aes(hwy , colour = drv )) + 
  geom_density() + 
  facet_wrap(~drv , ncol = 1   ) + 
  ggtitle("Density plots, wrapped by drv and color coded")

## Time series plots 
data(economics)
attach(economics)
head(economics , 10)


ggplot(economics , aes(date , uempmed )) + 
  geom_line(color = "dodgerblue" , lwd = 1)

## Modifying the xlab and ylabs 

ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point(aes(colour = class) ) + 
  facet_wrap(~class) + 
  geom_smooth(method = "lm" ) + 
  xlab("Displacement") + 
  ylab("Highway Mileage")
 
## similarly xmim() and ylim() functions. 

##Save the objec
plotObj <- ggplot(mpg ,
       aes(x = displ , y = hwy  ))  + 
  geom_point(aes(colour = class) ) + 
  facet_wrap(~class) + 
  geom_smooth(method = "lm" ) + 
  xlab("Displacement") + 
  ylab("Highway Mileage")

print(plotObj)
summary(plotObj)

##save 
saveRDS(plotObj , "PlotObject.RDS")

qplot(displ , hwy , data = mpg , colour = class)


#####################################################################################################
###' Annotations using ggplot2
###' Vivek Kumar Gupta
#####################################################################################################
library(ggplot2)
library(mgcv)
data(mpg)
attach(mpg)
head(mpg , 6)

##' Data 
##' Aesthetics : mapping between variables and the visual props
##' Geom : at least one layer on how to render each obs 
##' 
##' qplot() fast , quick way of plotting ggplot object. 
##' 


##Simple plot types

p <- ggplot(mpg , aes(displ , hwy , colour = class)) + 
        geom_point() +
        ggtitle("Scatter plot")
print(p)

p <- p + 
  geom_area() + ggtitle("Area Plot")
print(p)

p <- p + geom_text()
print(p)  

##Begin annotations
data(presidential)
data(economics)

head(presidential , 10)
head(economics , 10)
attach(presidential)
attach(economics)

presidential = subset(presidential , presidential$start > economics$date[1])

ggplot(economics) + 
  geom_rect(
      aes(xmin = start , xmax = end , fill = party) , 
      ymin = -Inf , ymax = Inf , alpha = 0.2, 
      data = presidential
  ) + 
  geom_vline(
    aes(xintercept = as.numeric(start)) , 
    data = presidential, 
    colour = "grey" ,     alpha = 0.5   
 ) + 
  geom_text(
    aes(x = start , y = 2500 , label = name) , 
    data = presidential , 
    size = 3 , vjust = 0 , hjust = 0 , nudge_x = 50
  ) + 
  geom_line(aes(date , unemploy)) + 
  scale_fill_manual(values = c("blue" , "red"))
  
###diamond dataset , addign a comparison reference line

data(diamonds)
attach(diamonds)

ggplot(diamonds , aes(log10(carat) , log10(price))) + 
  geom_point() + 
  facet_wrap(~ cut, nrow = 1)

ggplot(diamonds , aes(log10(carat) , log10(price))) + 
  geom_bin2d() + 
  facet_wrap(~ cut, nrow = 1)

mod_coef = coef(lm(log10(price) ~ log10(carat) , data = diamonds))

ggplot(diamonds , aes(log10(carat) , log10(price))) + 
  geom_point() + 
  geom_abline(intercept = mod_coef[1] , slope = mod_coef[2] , 
              colour = "white" , size = 1) +
  facet_wrap(~ cut, nrow = 1)


###
###'Scatters again . The grammar and the building blocks. Hold them tight to transfer between mind and paper. Layer by Layer
###'Defining individual layers and makign them separate
###


library(ggplot2)
library(mgcv)
data(mpg)
attach(mpg)
str(mpg)

##Fit a GAM via mgcv 
gam.fit = gam(hwy ~ s(displ , bs = "cr" , k = 20) , data = mpg)
names(gam.fit)

newd = data.frame(displ = seq(min(displ) , max(displ) , length= 1000))
head(newd)
newd$hwy = predict(gam.fit , newdata = newd)

plot.gg = ggplot(mpg , aes(displ , hwy)) +
  geom_point() + 
  geom_line( data = newd , colour = 2 , size = 2) 
  

print(plot.gg)

## Fit a non paramteric loess 
loess.fit = loess(hwy ~ displ , data = mpg)

out = data.frame(displ = seq(min(displ) , max(displ) , length= 1000))

out$hwy = predict(loess.fit , newdata = out)

plot.gg = plot.gg + geom_line(data = out , color = 3 , size = 2)

print(plot.gg)



First <- rnorm(50)
Second <- First + rnorm(50, mean=0, sd=0.4)
data <- as.data.frame(cbind(First,Second)) # making a data frame by binding
# text results
summary(data)
library(ggplot2)
# visualization
ggplot( data, aes(x=First,y=Second)) + geom_point(size=2)

data("anscombe")
anscombe
# generate levels to indicate group number
levels <- gl(4, nrow(anscombe))
mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4),
                                   mygroup=levels))
mydata
theme_set(theme_bw())
ggplot(mydata, aes(x,y)) + geom_point(size=4) + geom_smooth(method="lm",
                                                            fill=NA, fullrange=TRUE) + facet_wrap(~mygroup)

x <- c( 1,2,3,NA,5)
x
is.na(x)
mean(x) # NA
mean(x, na.rm=TRUE) #2.75
DF <- data.frame( x= c(12,9,23), y=c(10,20,NA))
DF
DF1 <- na.exclude(DF)
DF1
max(DF) #NA
max(DF, na.rm=TRUE) #23
max(DF1) #20

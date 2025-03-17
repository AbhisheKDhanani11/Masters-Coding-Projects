library("rpart")
library("rpart.plot")


# Read the data
cars  <- read.csv("D:\\Masters\\Sem 2\\Big data\\codes\\Datasets\\car_data.csv") 
summary(cars)
print(table(cars$Purchased))
head(cars)

# checking for null values
print(sum(is.na(cars)))

print(colnames(cars))

# decision tree
fit <- rpart(Purchased ~ Gender + Age + AnnualSalary,
             method="class", 
             data=cars,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))


# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

summary(fit)

# testing the model with new data
newData <- data.frame(Gender="Male",
                      Age=30,
                      AnnualSalary=100000)

predict(fit,newdata=newData,type=c("class"))


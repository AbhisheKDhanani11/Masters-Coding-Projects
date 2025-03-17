#install.packages("rpart.plot") # install package rpart.plot

 
library("rpart")
library("rpart.plot")

# Read the data
banktrain  <- read.csv("D:\\Masters\\Sem 2\\Big data\\codes\\Datasets\\bank-data.csv") # "bank-sample.csv"
summary(banktrain)

print(colnames(banktrain))
 

# Make a  decision tree by only keeping the categorical variables
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1, cp=0.001),
             parms=list(split='information'))
 

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

#too detailed, let's simplify it by removing branches
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)
 

# include a numeric variable "duration" into the model
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + duration + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
summary(fit)

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

# Predict
newdata <- data.frame(job="retired", 
                      marital="married", 
                      education="secondary",
                      default="no",
                      housing="yes",
                      loan="no",
                      contact = "cellular",
                      duration = 598,
                      poutcome="unknown")
newdata
predict(fit,newdata=newdata,type=c("class"))


install.packages("lightgbm", repos = "https://cran.r-project.org") 
library(data.table)
library(lightgbm)

data(bank, package = "lightgbm")
str(bank)

bank_train <- bank[1L:4000L, ]
bank_test <- bank[4001L:4521L, ]

bank_rules <- lgb.convert_with_rules(data = bank_train)
bank_train <- bank_rules$data
bank_test <- lgb.convert_with_rules(data = bank_test, rules = bank_rules$rules)$data
str(bank_test)

bank_train$y <- bank_train$y - 1L
bank_test$y <- bank_test$y - 1L


my_data_train <- as.matrix(bank_train[, 1L:16L, with = FALSE])
my_data_test <- as.matrix(bank_test[, 1L:16L, with = FALSE])


dtrain <- lgb.Dataset(
  data = my_data_train
  , label = bank_train$y
  , categorical_feature = c(2L, 3L, 4L, 5L, 7L, 8L, 9L, 11L, 16L)
)
dtest <- lgb.Dataset.create.valid(
  dtrain
  , data = my_data_test
  , label = bank_test$y
)

# We can now train a model
params <- list(
  objective = "binary"
  , metric = "l2"
  , min_data = 1L
  , learning_rate = 0.1
  , min_hessian = 1.0
  , max_depth = 2L
)
model <- lgb.train(
  params = params
  , data = dtrain
  , nrounds = 100L
  , valids = list(train = dtrain, valid = dtest)
)

preds <- predict(model, my_data_test)
preds
results = ifelse(preds > .5, 1, 0)   
results

library(caret)
confusionMatrix(data=factor(results), reference = factor(bank_test$y))


df = read.csv('D://Masters//Sem 2//Big data//codes//bank-full.csv')

head(df)

# show column names
print(names(df))

# Extract and print data types of each column
data_types <- sapply(df, class)
print(data_types)

# Check for missing values using dplyr
library(dplyr)
missing_values <- df %>%
  summarise_all(~sum(is.na(.)))

# Print the summary with missing values count
print(missing_values)


library(caret)
dummy <- dummyVars(" ~ education + marital + contact", data=df)
print(dummy)
df2 = data.frame(predict(dummy, newdata=df))
head(df2)
df2 = cbind(df,df2)
head(df2)
print(names(df2))

df2['target'] = ifelse(df2$y == "yes", 1, 0)
df2['housing2'] = ifelse(df2$housing == "yes", 1, 0)
df2['loan2'] = ifelse(df2$loan == "yes", 1, 0)
library(caTools)
sample <- sample.split(df2$y, SplitRatio = 0.7)
train  <- subset(df2, sample == 1)
test   <- subset(df2, sample == 0)
print(names(train))

# Show value counts using count function
value_counts <- count(df2, target)
print(value_counts)

library(dplyr)
class_weights <- table(train$target)[1] / table(train$target)
print(class_weights)

print(names(df2))
model = glm(target~age+balance+educationprimary  
            + educationsecondary+ educationtertiary+ educationunknown  
            + maritaldivorced +  maritalmarried+ maritalsingle   
            + contactcellular+ contacttelephone+ contactunknown
            + housing2 + loan2, 
            data=train, 
            family=binomial, 
            weights = ifelse(train$target== 1, class_weights, 1))

nrow(train)
nrow(test)
summary(model)
summary(test)


fitted.results <- predict(model,newdata=test,type='response')
fitted.results <- ifelse(fitted.results > 0.95,1,0)

summary(fitted.results)
misClasificError <- mean(fitted.results != test$target)
print(misClasificError)
print(paste('Accuracy',1-misClasificError))

cm <- confusionMatrix(data=factor(fitted.results), reference = factor(test$target))
print(cm)
gc()

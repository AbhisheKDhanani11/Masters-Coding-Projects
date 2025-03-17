df = read.csv('D://Masters//Sem 2//Big data//codes//Datasets//nba2k20-full.csv')
print(head(df))

# column names
print(names(df))

print(df$rating)
print(colSums(is.na(df)))

avg_rating <- function(df1){
  avg = 0.0
  total = 0.0
  len = length(df1)
  for (i in df1){
    total = total + i
  }
  avg = total / len
  return(avg)
}

avg_rating(df$rating)

# removing undrafted players
print(table(df$draft_round))
df_new <- df[df$draft_round != "Undrafted",]
print(table(df_new$draft_round))

# converting salary column values to numbers
print(head(df_new$salary))
df_new$salary2 = as.double(substring(df_new$salary,first=2))
print(head(df_new$salary2))


# one hot encoding 
library(caret)
dummy <- dummyVars(" ~ position  + college", data=df_new)
df2 = data.frame(predict(dummy, newdata=df_new))
head(df2)
encodded = names(df2)
df_final = cbind(df_new,df2)

# converting draf round values from 1 and 2 to 0 and 1 for the logistic regression model
df_final$draft_round_binary <- ifelse(df_final$draft_round == 1, 0, 1)
print(table(df_final$draft_round_binary))


# removing the unnecessary features thet will not be used in model train, also removing position and collage because i already encoded them
df_final <- subset(df_final, select = -c(full_name, jersey, team, b_day, height, position, weight, salary, 
                                         country, draft_year, draft_round, draft_peak, college))
print(names(df_final))

# train test split
library(caTools)
set.seed(123) 
sample <- sample.split(df_final$draft_round_binary, SplitRatio = 0.8)
train  <- subset(df_final, sample == 1)
test   <- subset(df_final, sample == 0)

# logistic model 
model = glm(draft_round_binary~rating + salary2 + ., data = train, family = binomial)

# testing model using test data 
fitted.results <- predict(model,newdata=test,type='response')
fitted.results <- ifelse(fitted.results > 0.8,1,0)

# calculating the accuracy 
misClasificError <- mean(fitted.results != test$draft_round_binary)
print(misClasificError)
print(paste('Accuracy',1-misClasificError))


# the confusion matrix
cm <- confusionMatrix(data=factor(fitted.results), reference = factor(test$draft_round_binary))
print(cm)
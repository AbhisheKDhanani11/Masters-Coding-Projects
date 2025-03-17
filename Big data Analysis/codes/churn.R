df = read.csv("D://Masters//Sem 2//Big data//codes//churn.csv")
summary(df)
nrow(df)
library(caTools)
sample <- sample.split(df$Churned, SplitRatio = 0.7)
train  <- subset(df, sample == 1)
test   <- subset(df, sample == 0)

model = glm(Churned~Age+Married+Cust_years+Churned_contacts, data=train, 
            family=binomial(link="logit"))

nrow(train)
nrow(test)
summary(model)
summary(test)

fitted.results <- predict(model,newdata=test,type='response')
print(fitted.results)
fitted.results <- ifelse(fitted.results > 0.5,1,0)

summary(fitted.results)
misClasificError <- mean(fitted.results != test$Churned)
print(misClasificError)
print(paste('Accuracy',1-misClasificError))

confusionMatrix(data=factor(fitted.results), reference = factor(test$Churned))
gc()

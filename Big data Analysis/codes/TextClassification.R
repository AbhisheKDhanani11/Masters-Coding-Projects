library(tidytext)
#library(janeaustenr)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(tm)
data = read.csv("D:\\Masters\\Sem 2\\Big data\\Datasets\\Corona_NLP_train.csv", header = TRUE, sep = ",") 
library(dplyr)

colnames(data)

data(stop_words)
stop_words

tokens = unnest_tokens(data, word, OriginalTweet)
tokens

word_tokens = count(tokens, word, sort=TRUE)
nrow(word_tokens)
word_tokens

library(dplyr)
word_counts <- filter(word_tokens, n > 50)
nrow(word_counts)

tokens = filter(tokens, word %in% word_counts$word )
tokens

tokens = anti_join(tokens, stop_words)
nrow(tokens)

tokens = count(tokens, UserName, word)
tokens
colnames(tokens)

word_tokens = count(tokens, word, sort=TRUE)
nrow(word_tokens)

total_words <- tokens %>% 
  group_by(UserName) %>% 
  summarize(total = sum(n))

total_words

tweet_words <- left_join(tokens, total_words)
tweet_words


tweet_tf_idf <- tweet_words %>%
  bind_tf_idf(word, UserName, n)

tweet_tf_idf

tweet_df = tweet_tf_idf %>%
  cast_sparse(UserName, word, tf_idf)

tweet_df
nrow(tweet_df)
ncol(tweet_df)

df2 = cbind(tweet_df, data$Sentiment)


sentiments = c(df2[,ncol(df2)])
print(sentiments)
df2[, 0]

df2
 

sample <- sample(c(TRUE,FALSE), nrow(df2),  
                 replace=TRUE, prob=c(0.7,0.3))
# creating training dataset 
train_dataset  <- df2[sample, ] 
ncol(train_dataset)
# creating testing dataset 
test_dataset  <- df2[!sample, ]

library(glmnet)
library(lightgbm)
y = c(train_dataset[,ncol(train_dataset)])
y_test = c(test_dataset[,ncol(test_dataset)])
length(y)
nrow(train_dataset)


colnames1 = c(seq(1, ncol(train_dataset) - 1))
colnames1

dtrain <- lgb.Dataset(label = y, colnames=colnames1, data = train_dataset[, -c(ncol(train_dataset))])
dtrain$construct()

# We can now train a model
params <- list(
  objective = "binary"
  , metric = "accuarcy"
  , n_estimators = 500
  , num_leaves = 500
  , n_threads = 5
)

model <- lgb.train(
  params = params
  , data = dtrain
  
)

preds <- predict(model, test_dataset[, -c(ncol(test_dataset))])
preds
results = ifelse(preds > .5, 1, 0)   
results

library(caret)
cn = confusionMatrix(data=factor(results), reference = factor(c(test_dataset[,ncol(test_dataset)])))
cn

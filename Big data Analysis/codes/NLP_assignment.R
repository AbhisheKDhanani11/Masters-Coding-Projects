# Load required libraries
library(dplyr)
library(readr)
library(tidytext)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(tm)

# Set the root directory (adjust this path to where your dataset is stored)
root_dir <- "D:/Masters/Sem 2/Big data/Datasets/aclImdb_v1/aclImdb"  # e.g., "C:/Users/You/Downloads/aclImdb"

# used internet to build this function, basically data contains two folders one for training and one for testing.
# now each folder have two folders which contains text files for positive and negative reviews. data have total 50k reviews.
# which are divided into train (25k) and test(25K) which further divided into positive(12500) and negative(12500) 
# and each review is stored in a single file. and the file name is combination of ID and Rating 
# so if a file name is 200_8.txt then the review id is 200 and its rating is 8 and the sentiment is based on folder it was saved.
# so this function extract the file name into ID and rating and also get the review from the file and sentiment 
# and store them into a dataframe
# then i got the train and test DF and at last i combined them into a final DF.

# Function to read review files and extract data
read_reviews <- function(directory, sentiment) {
  # List all .txt files in the directory
  files <- list.files(directory, pattern = "*.txt", full.names = TRUE)
  
  # Extract ID, rating, and text from each file
  reviews <- lapply(files, function(file) {
    # Extract filename without path
    filename <- basename(file)
    # Split filename into ID and rating (e.g., "200_8.txt" -> "200" and "8")
    parts <- strsplit(gsub(".txt", "", filename), "_")[[1]]
    id <- parts[1]
    rating <- as.integer(parts[2])
    # Read the review text
    text <- read_file(file)  # from readr package
    
    # Return as a data frame row
    data.frame(
      id = id,
      rating = rating,
      sentiment = sentiment,
      text = text,
      stringsAsFactors = FALSE
    )
  })
  
  # Combine all reviews into a single data frame
  do.call(rbind, reviews)
}

# Define paths to the training and test directories
train_pos_dir <- file.path(root_dir, "train/pos")
train_neg_dir <- file.path(root_dir, "train/neg")
test_pos_dir <- file.path(root_dir, "test/pos")
test_neg_dir <- file.path(root_dir, "test/neg")

# Create training data frame
train_pos <- read_reviews(train_pos_dir, "positive")
train_neg <- read_reviews(train_neg_dir, "negative")
train_df <- bind_rows(train_pos, train_neg)

# Create test data frame
test_pos <- read_reviews(test_pos_dir, "positive")
test_neg <- read_reviews(test_neg_dir, "negative")
test_df <- bind_rows(test_pos, test_neg)

# Combine all reviews into one data frame
all_reviews <- bind_rows(
  train_pos,
  train_neg,
  test_pos,
  test_neg
)


# Check the structure of the data frames
str(all_reviews)

head(all_reviews)

colnames(all_reviews)

# stop words 
data(stop_words)
stop_words

# tokenization
tokens = unnest_tokens(all_reviews, word, text)
tokens
nrow(tokens)

word_tokens = count(tokens, word, sort=TRUE)
nrow(word_tokens)
word_tokens

word_counts <- filter(word_tokens, n > 50)
nrow(word_counts)

tokens = filter(tokens, word %in% word_counts$word )
tokens
nrow(tokens)

tokens = anti_join(tokens, stop_words)
nrow(tokens)
colnames(tokens)

tokens = count(tokens, id, word)
tokens
colnames(tokens)


word_tokens = count(tokens, word, sort=TRUE)
nrow(word_tokens)

total_words <- tokens %>% 
  group_by(id) %>% 
  summarize(total = sum(n))
head(total_words)
colnames(total_words)

review_words <- left_join(tokens, total_words)
review_words
colnames(review_words)


review_tf_idf <- review_words %>%
  bind_tf_idf(word, id, n)

review_tf_idf
colnames(review_tf_idf)


review_df = review_tf_idf %>%
  cast_sparse(id, word, tf_idf)

review_df
nrow(review_df)
ncol(review_df)

df2 = cbind(review_df, all_reviews$Sentiment)

sentiments = c(df2[,ncol(df2)])
print(sentiments)
df2[, 0]

df2

# train test split
sample <- sample(c(TRUE,FALSE), nrow(df2),  
                 replace=TRUE, prob=c(0.8,0.2))
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
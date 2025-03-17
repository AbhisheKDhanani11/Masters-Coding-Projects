if (!requireNamespace("topicmodels", quietly = TRUE)) install.packages("topicmodels")
if (!requireNamespace("tm", quietly = TRUE)) install.packages("tm")
if (!requireNamespace("LDAvis", quietly = TRUE)) install.packages("LDAvis")
if (!requireNamespace("tidytext", quietly = TRUE)) install.packages("tidytext")
library(topicmodels)
library(tm)
library(LDAvis)
library(tidytext)


# Create Document-Term Matrix
data("AssociatedPress")#DocumentTermMatrix(corpus)
# Set a seed for reproducibility
set.seed(123)

# Apply LDA
lda_model <- LDA(AssociatedPress, k = 6, control = list(seed = 123))

# View the top terms associated with each top
terms(lda_model, 50)



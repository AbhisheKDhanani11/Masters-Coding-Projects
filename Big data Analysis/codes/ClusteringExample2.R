# Load necessary libraries
library(cluster)
library(factoextra)

# Load the iris dataset
data("iris")

# Display the first few rows of the dataset
head(iris)

# Normalize the data
iris_normalized <- scale(iris[, 1:4]) # Scale only the numeric features

# Determine the optimal number of clusters using the elbow method
fviz_nbclust(iris_normalized, kmeans,
             method = "wss") +
  labs(subtitle = "Elbow method")

# Perform K-means clustering
set.seed(123) # for reproducibility
kmeans_result <- kmeans(iris_normalized, 
              centers = 3, nstart = 25)

# Visualize the clusters
fviz_cluster(kmeans_result, data = iris_normalized,
             palette = c("#2E9FDF", "#00AFBB", 
                  "#E7B800", 'green', 'yellow', 'black'), 
             geom = "point",
             ellipse.type = "convex", 
             ggtheme = theme_minimal())

# Add cluster assignments to the original data
iris$cluster <- as.factor(kmeans_result$cluster)

# Summary of clusters
summary(iris$cluster)

# Boxplot to visualize how clusters split the data across features
boxplot(Sepal.Length ~ cluster, data = iris, main = "Sepal.Length by Cluster")
boxplot(Sepal.Width ~ cluster, data = iris, main = "Sepal.Width by Cluster")
boxplot(Petal.Length ~ cluster, data = iris, main = "Petal.Length by Cluster")
boxplot(Petal.Width ~ cluster, data = iris, main = "Petal.Width by Cluster")

# Print the mean values of each feature for each cluster
aggregate(iris[, 1:4], by=list(cluster=iris$cluster), FUN=mean)

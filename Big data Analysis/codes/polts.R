library(ggplot2)
data <- data.frame(
  
  x = 1:10,
  
  y = rnorm(10),
  
  category = factor(rep(c("A", "B"), each = 5)),
  
  size = rnorm(10, mean = 5, sd = 2)
  
)
# scatter plot
plot(data$x,data$y, main="Scatter plot", xlab="X", ylab="y", pch=19)

# scatter plot with ggplot2
ggplot(data, aes(x=x, y=y, color= category)) + 
  geom_point() + 
  labs(title = "scatter plot with ggplot2", x="X", y = "Y")

# line plot
plot(data$x, data$y, type="l", main = "line plot", xlab="X", ylab="y")

# line plot with ggplot2
ggplot(data, aes(x=x, y=y, color= category)) + 
  geom_line() + 
  labs(title = "line plot with ggplot2", x="X", y = "Y")


# histogram 
hist(data$y, main="Histogram", xlab="y", ylab="Frequency")

# histogram with ggplot2
ggplot(data, aes(x=y)) + 
  geom_histogram(binwidth = 0.2, fill="skyblue", color="black")+
  labs(title = "histogram with ggplot2", x="X", y = "Y")

# box plot with ggplot
ggplot(data, aes(x=category, y=y)) + 
  geom_boxplot()+
  labs(title = "box with ggplot2", x="X", y = "Y")

# bar plot 
barplot(table(data$category), main= "Bar plot", xlab="X", ylab = "Y")

# bar plot with ggplot2
ggplot(data, aes(x=category)) + 
  geom_bar() +
  labs(title = "bar plot with ggplot2", x="X", y = "Y")

# pie chart 
pie(table(data$category), main="Pie chart")


# density plot with ggplot2
ggplot(data, aes(x=y, fill=category)) + 
  geom_density(alpha= 0.4) +
  labs(title = "pie chart with ggplot2", x="X", y = "Y")

# heatmap
cor_matrix <- cor(data[, c('x', 'y', 'size')])
heatmap(cor_matrix, main="Heat map")


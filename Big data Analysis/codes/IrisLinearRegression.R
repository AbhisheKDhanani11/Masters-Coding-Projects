# Load the iris dataset
data(iris)

# Explore the structure of the dataset
str(iris)

# Fit a linear regression model
model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)

# Display the summary of the linear regression model
summary(model)

# Make predictions on the dataset
predictions <- predict(model, newdata = iris)

# Visualize the results (scatterplot with regression line)
plot(iris$Sepal.Width, iris$Sepal.Length, main = "Linear Regression Example", xlab = "Sepal Width", ylab = "Sepal Length", pch = 16, col = "blue")
abline(model, col = "red")

# Evaluate the model (you might want to use other metrics based on your problem)
residuals <- residuals(model)
rmse <- sqrt(mean(residuals^2))
print(paste("Root Mean Squared Error (RMSE):", round(rmse, 3)))


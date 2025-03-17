library(mlbench)
library(arules)
data("Adult")


# View the first few rows of the dataset
head(Adult)
# Explore the structure of the dataset
str(mtcars)

# Fit a linear regression model
model <- lm(mpg ~ wt + hp, data = mtcars)

# Display the summary of the linear regression model
summary(model)

# Make predictions on the dataset
predictions <- predict(model, newdata = mtcars)

# Visualize the results (scatterplot with regression line)
plot(mtcars$wt, mtcars$mpg, main = "Linear Regression Example", xlab = "Weight", ylab = "MPG", pch = 16, col = "blue")
abline(model, col = "red")

# Evaluate the model (you might want to use other metrics based on your problem)
residuals <- residuals(model)
rmse <- sqrt(mean(residuals^2))
print(paste("Root Mean Squared Error (RMSE):", round(rmse, 3)))


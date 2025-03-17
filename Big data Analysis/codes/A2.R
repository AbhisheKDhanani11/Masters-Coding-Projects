data <- c(1, 2,2, 2, 2, 2, 4, 5, 1, 8, 9, 11, 14, 5, 1000, 10, 2, 2, 1, 1, 1, 888, 11)
print(summary(data))# gives all the stats
q1 <- quantile(data, 0.25)
q3 <- quantile(data, 0.75)
print(paste("First quantile is: ", q1))
print(paste("Third quantile is: ", q3))
iqr <- IQR(data)
print(paste("IQR is:", iqr))
L_bound <- q1 - 1.5 * iqr
u_bound <- q3 + 1.5 * iqr
outliers <- data[data<L_bound | data > u_bound]
print("The outliers are:")
print(outliers)
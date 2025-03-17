library(ggplot2)

df = read.csv('D://Masters//Sem 2//Big data//codes//Datasets//road_accident_dataset.csv')
print(head(df))

print("Shape of dataset: ")
print(dim(df))

print("Column names: ")
print(colnames(df))

print("Null values by columns: ")
print(colSums(is.na(df)))

print("Total null values: ")
print(sum(is.na(df)))

library(dplyr)
library(tidyr)

df_selected <- df %>%
  select(Country, starts_with("Emergency.Response.Time"))
df_long <- df_selected %>%
  pivot_longer(cols = starts_with("Emergency.Response.Time"), 
               values_to = "ResponseTime")
print(df_long)

avg_response <- df_long %>%
  group_by(Country) %>%
  summarize(AvgResponseTime = mean(ResponseTime, na.rm = TRUE))
print(avg_response)

cause <- data.frame(table(df$Accident.Cause))
cause_names <- names(table(df$Accident.Cause))
print(cause_names)
cause_values <- as.vector(table(df$Accident.Cause))
print(cause_values)
ggplot(cause, aes(x = cause_names, y = cause_values)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "bar plot with ggplot2", x="X", y = "Y")


df_sold <- df[df$Car.Sale.Status == "Sold", ]
print(df_sold)

#value_counts <- lapply(df, table)

# Print results

#for (col in names(value_counts)) {
#  print(paste("Value counts for column:", col))
#  print(value_counts[[col]])
#  cat("\n")  # Adds a new line for better readability
#}

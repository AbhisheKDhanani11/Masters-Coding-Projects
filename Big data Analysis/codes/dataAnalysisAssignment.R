library(ggplot2)
library(dplyr)

df = read.csv('D://Masters//Sem 2//Big data//codes//Datasets//used_car_sales.csv')
print(head(df))

print("Shape of dataset: ")
print(dim(df))

print("Column names: ")
print(colnames(df))

print("Null values by columns: ")
print(colSums(is.na(df)))

print("Total null values: ")
print(sum(is.na(df)))

df_sold <- df$Location[df$Car.Sale.Status == "Sold"]
print(df_sold)
print(table(df_sold))

# bar chart of cars that are sold
# getting frequency count and converting to data frame
total_sales <- data.frame(table(df_sold)) 
sold_names <- names(table(df_sold))
print(sold_names)
sold_vals <- as.vector(table(df_sold))
print(sold_vals)
ggplot(total_sales, aes(x = sold_names, y = sold_vals)) + 
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Car sales by states", x="States", y = "Number of car sold")

# bar chart of all cars on sale
df_on_sale <- df$Location[df$Car.Sale.Status == "Un Sold"]
print(df_on_sale)
total_on_sale <- data.frame(table(df_on_sale))
on_sale_name <- names(table(df_on_sale))
on_sale_vals <- as.vector((table(df_on_sale)))
ggplot(total_on_sale, aes(x = on_sale_name, y = on_sale_vals)) + 
  geom_bar(stat = "identity", fill = "darkblue") +
  labs(title = "Car sales by states", x="States", y = "Number of car sold")

# pie chart of car brands whose cars are on sale
df_brand <- data.frame(table(df$Manufacturer.Name))
brand_names <- names(table(df$Manufacturer.Name)) 
brand_freq <- as.vector(table(df$Manufacturer.Name))
# getting total percentage of cars are on sale for a car brand
freq_per <- round(brand_freq / sum(brand_freq) * 100, 1) 
print(table(df_brand))
ggplot(df_brand, aes(x = "", y = brand_freq, fill = brand_names)) +
  geom_bar(stat = "identity", width = 1) +  # Create a stacked bar chart
  coord_polar(theta = "y") +  # Convert to pie chart
  geom_text(aes(label = paste0(freq_per, "%")),  # Add percentage labels
            position = position_stack(vjust = 0.5), size = 4) +  
  labs(title = "Pie Chart of Car Brands with Percentages",
       fill = "Car Brand") +
  theme_void()  # Remove background and axes


# getting price of cars grouped by car types
car_sales <- df %>%
  group_by(Car.Type) %>%
  summarize(Price = Price)
print(car_sales)
# Creating the scatter plot with jitters
ggplot(car_sales, aes(x = car_sales$Car.Type, y = car_sales$Price)) +
  geom_jitter(width = 0.2, alpha = 0.5, color = "blue") +  
  labs(title = "Scatter Plot of Vehicle Type vs Price",
       x = "Vehicle Type", y = "Price") +
  theme_minimal()

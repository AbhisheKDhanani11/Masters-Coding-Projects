hello_world <- function() {
  print("hello world")
}

hello_world()

hello_world2 <- function(name) {
  print(paste('hello ', name))
}

hello_world2(name='paul')

v <- c(4, 8, 9, 20)
v[1]

for (value in v) {
  print(value)
}
print(length(v))
print(mean(v))
print(median(v))
print(min(v))
print(max(v))
sum(v)
prod(v)
v

sounds <- c(
  "cat"="meow",
  "dog"="woof",
  "horse"="neigh"
)

sounds['dog']
sounds['baby'] = 'cry'
sounds


grades <- c(66, 71,72, 73, 74, 88,88,88,88, 99, 100)
summary(grades)
sqrt(55)
IQR(grades)
mean(grades)
avg(grades)
sd(grades)
mode(grades)
IQR(grades)

quantiles <- quantile(grades, c(.25, .75, .95))
quantiles[1]
quantiles[2]
outlier = (IQR(grades) * 1.5) + quantiles[2]
outlier

library(moments)
skewness(grades)
hist(grades)
boxplot(grades)
library(RMySQL)
#// https://www.projectpro.io/recipes/connect-mysql-r
mysqlconnection = dbConnect(RMySQL::MySQL(),
                            dbname='world',
                            host='localhost',
                            port=3306,
                            user='root',
                            password='admin')

result = dbSendQuery(mysqlconnection, "select * from city limit 100") # write query to acces the records from a particular table.

df = fetch(result, n = 100)
print(summary(df))
dbDisconnect(mysqlconnection)

sum(df$Population)
typeof(df['Population'])
mean(df$Population)

     
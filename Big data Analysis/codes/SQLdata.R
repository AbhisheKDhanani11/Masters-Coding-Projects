library(RMySQL)
#// https://www.projectpro.io/recipes/connect-mysql-r
mysqlconnection = dbConnect(RMySQL::MySQL(),
                            dbname='world',
                            host='localhost',
                            port=3306,
                            user='root',
                            password='admin')

result = dbSendQuery(mysqlconnection, "select * from country ") # write query to access the records from a particular table.

df = fetch(result)
print(summary(df))
print(nrow(df))
print(ncol(df))
head(df)
tail(df)
head(df['Population'])
tail(df['Population'])

hist(df$Population)
df3 = df[df['Population'] > 100 & df['IndepYear'] > 1944, ]
print(df3)
colnames(df3)

df4 = df[is.na(df['LifeExpectancy']) == FALSE & df['LifeExpectancy'] <= 40,]
df4['Name']

df['NewFeature'] = df['Population'] * 10
df['GNPPerson'] = df['GNP']/df['Population']
sum(is.na(df['Population']))
summary(df['IndepYear'])


library(tidyverse)
dplyr::count(df, df['Continent'])

listMissingColumns <- colnames(df)[apply(df, 2, anyNA)]
is.na(df['LifeExpectancy'])
for (c in listMissingColumns){
  print(paste(c, as.character(sum(is.na(df[c]))), sep=':'))
}

dbDisconnect(mysqlconnection)

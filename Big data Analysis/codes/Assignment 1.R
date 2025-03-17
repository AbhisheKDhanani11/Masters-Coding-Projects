temp <- c(45,77,20,19,101,120,212) # F* temperatures 
cel <- c() # empty numeric list for C* temps
loop <- 1 # loop var
for (i in temp){
  cel[loop] <- (i - 32) * 5/9
  loop <- loop + 1
}
print(cel)
print(paste('Max temp is: ', max(temp)))
print(paste('Min temp is: ', min(temp)))
print(paste('Avg temp is: ', mean(temp)))

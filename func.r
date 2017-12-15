#install.packages('data.table')
library(parallel)
library(data.table)
stocks <-read.table('/home/epa/CA2/stocksNumeric.csv',header=T, sep=',')
res <-mean(stocks$gain)
print(res)
rows <- readline(prompt="Enter rows: ")
rows <- as.integer(rows)
dt <-data.table(stocks)

x=rows
findrow <-function(){
#pick n rows
avg<-dt[,head(.SD,x), by = "stockNum"]
#average of n rows by group
avgforG <-avg[,.(gain=mean(gain)), by =.(stockNum)]
#print(avg)
print(avgforG)
#print(mean(avgforG$gain))
#print(sum(avgforG$gain)/10
lst <-lapply(avgforG[,"gain"], list)
print(lst)
for(i in avgforG$gain){
if(i>res)
print(avgforG$stockNum,i)
}
avgforG[which(avgforG$gain>res), ]
}
print(findrow())


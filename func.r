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
avg<-dt[,head(.SD,x), by = "stockNum"]
avgforG <-avg[,.(gain=mean(gain)), by =.(stockNum)]
#print(avg)
#print(avgforG)
print(mean(avgforG$gain))
#print(sum(avgforG$gain)/10)
}
print(findrow())


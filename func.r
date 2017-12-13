library(data.table)
stocks <-read.table('/home/epa/CA2/stocksNumeric.csv',header=T, sep=',')
rows <- readline(prompt="Enter rows: ")
rows <- as.integer(rows)
dt <-data.table(stocks)

x=rows
findrow <-function(){
dt[,head(.SD,x), by = "stockNum"]
}
print(findrow())


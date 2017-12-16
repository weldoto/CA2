#        Please install package "data.table".
#install.packages('data.table')

library(data.table)

#        Read in stocksNumeric to stocks
stocks <-read.table('/home/epa/CA2/stocksNumeric.csv',header=T, sep=',')

#        Prompt to enter number of days for stock query
days <- readline(prompt="Enter number of days for stock query: ")

#        Assign number of entered days to"days" as an integer
 days <- as.integer(days)

#        Assign "stocks" to a data table named "dt"
 dt <-data.table(stocks)

#       Number of days assigned to "x"
 x=days

#       Function called findrow() which:
#       1. Passes in x days amount of stock information by group
#       2. Gets the average of gains  of all x days of stock  
#       3. Gets the average of gains of each stock by stockNum for x days.
#       4. Compares each stockNum gain to overall stock gain for x days
#       5. Prints information to console
#       6. Prints list of stocks and gains that are over the average stocj gains for x days.

 findrow <-function(){

 stockGP<-dt[,head(.SD,x), by = "stockNum"]

 avgforGP <-stockGP[,.(gain=mean(gain)), by =.(stockNum)]

 meanTotal <-mean(stockGP$gain)

 print(paste("The average stock gain for entire stock over ", x," days is: ", meanTotal, sep=" "))
 print(paste("The average stock gain for each stock grouped by stock number over ", x," days is",sep=" "))
 print(avgforGP)
 print(paste("The stock number and gains above the average total stock gains for " , x, " days is",sep=" "))

 avgforGP[which(avgforGP$gain>meanTotal), ]


 }
#        Print to console the results of function findrow()
 print(findrow())


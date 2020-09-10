pollutantmean <- function(directory, pollutant, id = 1:332){
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
   
      ## 'pollutant' is a character vector of length 1 indicating
      ## the name of  the pollutant for which we will calcultate the
      ## mean; either "sulfate" or "nitrate"
   
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
   
      ## Return the mean of the pollutant across all monitors list
      ## in the 'id' vector (ignoring NA values)
      ## NOTE: Do not round the result
      mylist <- list.files(path=directory, pattern=".csv")
      x <- numeric()
      for (i in id){
              mydata <- read.csv(mylist[i])
              x <- c(x, mydata[[pollutant]])
      }
      mean(x, na.rm=T)
}
source("pollutantmean.R")



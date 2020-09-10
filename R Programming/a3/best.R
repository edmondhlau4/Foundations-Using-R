best <- function(state,outcome){
  # Read data .csv file
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  # Get the unique set of States and sort it
  s <- sort(unique(data[,7]))
  
  # Check for validity of 'state' and 'outcome' input
  if (!(any(s == state))) stop("invalid state")
  if (!(any(outcome == c("heart attack","heart failure","pneumonia")))) stop("invalid outcome")
  
  # Subset outcome data into a new data frame
  if (outcome=="heart attack"){
    set1 <- data[,c(2,7,11)]
    
    # Convert 30-day mortality data in columns 3 to numeric
    suppressWarnings(set1[,3] <- as.numeric(set1[,3]))
    
    # Removing NAs
    set1 <- set1[complete.cases(set1[,3]),]  
  }
  
  else if (outcome=="heart failure"){
    set1 <- data[,c(2,7,17)]
    suppressWarnings(set1[,3] <- as.numeric(set1[,3]))
    set1 <- set1[complete.cases(set1[,3]),]
  }
  
  else {
    set1 <- data[,c(2,7,23)]
    suppressWarnings(set1[,3] <- as.numeric(set1[,3]))
    set1 <- set1[complete.cases(set1[,3]),]
  }
  
  # Create a subset of hospitals for the outcome
  temp <- subset(set1,State==state)
  
  # Sort based on 30-day mortality rate 
  output <- temp[order(temp[,3],temp[,1]), ]
  
  # Return hospital name 
  output[1,1]
}
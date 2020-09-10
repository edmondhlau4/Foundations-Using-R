####
# cachematrix.R
# Programming Assignment 2 - Lexical Scoping
####

####
# makeCacheMatrix: creates a special "matrix" object that can cache its inverse
# set : saves input value into parent environment and sets inverse to NULL.
#       Can recalculate the inverse when a new matrix is set
# get : returns the matrix
# set_Inverse: saves calculation in parent environment
# get_Inverse: returns inverse
####

makeCacheMatrix <- function(x = matrix()) {
        # Initializes cache 
        inv_matrix <- NULL
        
        # Sets value and stores matrix in working environment
        set <- function(y){
                  x<<-y
                  inv_matrix<<-NULL
        }
        
        # Gets value of the matrix
        get <- function() x
        
        # Computes and sets value of inverse matrix and stores in cache
        set_Inverse <- function(inverse) inv_matrix <<- inverse
        
        # Computes and gets value of inverse matrix from cache
        get_Inverse <- function() inv_matrix
        
        # Returns a list of methods to working environment
        list(set = set, get = get, 
             set_Inverse = set_Inverse, get_Inverse = get_Inverse)
}


####
# cacheSolve: checks if inverse can be found in cache.  If found, returns value
#             and message "getting cached data".
####

cacheSolve <- function(x, ...) {
        # Tries to retreive inverse of matrix if possible
        inv_matrix <- x$get_Inverse()
         
        # Returns inverse if calculated and matrix has no change from cache
        if (!is.null(inv_matrix)){
                # Gives message
                message("getting cached data")
          
                # Returns and prints message
                return (inv_matrix)
        }
        # If inv_matrix doesn't exist, calcualtes inverse of matrix
        # Creates and gets values of matrix
        data <- x$get()
        
        # Computes inverse and stores it to inv_matrix
        inv_matrix <- solve(data)
        
        # Sets inverse matrix in cache
        x$set_Inverse(inv_matrix)
        
        # Shows matrix in Console
        inv_matrix
}

## These functions calculate and store the inverse of a matrix.
## If the same matrix is used to calculate the inverse, the function will return
## the value from memory

## This function creates a matrix and caches its inverse

makeCacheMatrix <- function(x = matrix()) {
 	i <- NULL
	## Sets matrix 'x' from input argument
 	set <- function(y) {
    	x <<- y
    	i <<- NULL
  	}
  	## Returns matrix that was in input argument
  	get <- function() x
  	## Store the inverse from the cacheSolve function
  	setinverse <- function(inverse) i <<- inverse
  	## Gets the inverse stored
  	getinverse <- function() i
  	## Put functions into a list
  	list(set = set, get = get,
       		setinverse = setinverse,
       		getinverse = getinverse)
}

## This function solves inverse matrix or calls from cache if already available

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 	i <- x$getinverse()
 	## Return cached inverse if available
 	if(!is.null(i)) {
   	message("getting cached inverse")
    	return(i)
  	}
  	## Returnss matrix that was in input argument 'x' from makeCacheMatrix.R
  	data <- x$get()
  	## Solves inverse matrix if i is not available
  	i <- solve(data, ...)
  	## Stores new inverse matrix
 	x$setinverse(i)
 	i
}

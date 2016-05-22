#this function creates a matrix and caches its inverse
makeCacheMatrix <- function(x = matrix()) {
  #place holder for inverse matrix
  i <- NULL
  #sets matrix 'x' from input argument
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  #retrieves matrix that was in input argument
  get <- function() x
  #store the inverse from the cacheSolve function
  setinverse <- function(inverse) i <<- inverse
  #gets the inverse stored
  getinverse <- function() i
  #put functions into a list
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
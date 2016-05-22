#this function solves inverse matrix or calls from cache if already available
cacheSolve <- function(x, ...) {
  #get inverse of input matrix if available
  i <- x$getinverse()
  #retrieve cached inverse if available
  if(!is.null(i)) {
    message("getting cached inverse")
    return(i)
  }
  #retrieves matrix that was in input argument from makeCacheMatrix.R
  data <- x$get()
  #solves inverse matrix if i is not available
  i <- solve(data, ...)
  #stores new inverse matrix
  x$setinverse(i)
  i
}
## Programming Assignment 2: Lexical Scoping

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

## Hold the cached value or NULL if no cache
  Cache <- NULL
  setMatrix <- function(y) {
    x <<- y
    
    ## y is the new value assigned to the matrix
    Cache <<- NULL
  }
  ## returns the stored matrix
  getMatrix <- function() x
  setInverse <- function(inverse) inv <<- inverse
  
  ## obtains the cached value
  getInverse <- function() inv
  list(setMatrix = setMatrix, getMatrix = getMatrix,
       setInverse = setInverse, getInverse = getInverse)
}



## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getInverse()
        if (!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        #Else calculate the Inverse and store in the cache
        matrixdata <- x$getMatrix()
        inverse <- solve(matrixdata, ...)
        x$setInverse(inverse)
        
        ## returns the inverse
        inverse
}

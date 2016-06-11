## Put comments here that give an overall description of what your
## functions do:

# This funcion create a matrix (set) or get the matrix(get)
# get a inverse (getinv) or set inverse (setinv)
makeCacheMatrix <- function(x = matrix()) {
#       setting the inverse to NULL as a placeholder for a future value.
        inv <- NULL
#       set the value of the matrix
        set <- function(y) {
#               set the vector x to a new vector y.
                x <<- y
#               resets the inverse.
                inv <<- NULL
        }
#       get the matrix.
        get <- function() x
#       set the value of the inverse.
        setinv <- function(inverse) inv <<- inverse 
#       get the value of the inverse.
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


# Check the exist inv in cache if exist then print a message
# and the value, if not exist then calculate and print.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}

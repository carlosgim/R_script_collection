makeVector <- function(x = numeric()) {
#       setting the mean to NULL as a placeholder for a future value.
        m <- NULL
#       set the value of the vector.
        set <- function(y) {
#               set the vector x to a new vector y.
                x <<- y
#               resets the mean.
                m <<- NULL
        }
#       get the value of the vector.
        get <- function() x
#       set the value of the mean.
        setmean <- function(mean) m <<- mean
#       get the value of the mean.
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

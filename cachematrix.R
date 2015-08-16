## Author: Jackson Isaac

## The given matrix is always invertible.

## Steps to Test:
## 1. source('path/to/this/cachematrix.R').
## 2. Create a matrix.
## 3. Call makeCacheMatrix on the created matrix and store in a variable, say 'x'.
## 4. Call cacheSolve on the stored variable i.e., 'x'.

## 1. makeCacheMatrix is a procedure which will create an inverse matrix
## of the given input matrix and store in the cache.
## 2. cacheSolve is the procedure which will accept the user input matrix
## and return the inverse of it. It will first check if the inverse of the
## matrix exists or not and return the cached inverse matrix, if found.

## Create inverse matrix and cache the results
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(inp) {
        x <<- inp
        inv <<- NULL
    }
    get <- function() {
        x
    }
    setInvMatrix <- function(inverseMatrix) {
        inv <<- inverseMatrix
    }
    getInvMatrix <- function() {
        inv
    }
    list(set = set, get = get,
        setInvMatrix = setInvMatrix,
        getInvMatrix = getInvMatrix)
}


## Write a short comment describing this function

## Create inverse matrix of the given matrix. Return cached value, if found.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInvMatrix()

    ## Found cached value
    if(!is.null(inv)) {
        message("Cached inverse Matrix found!")
        return(inv)
    }
    ## No cached value found, create and cache the inverse matrix.
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInvMatrix(inv)
    inv
}

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#this function creates an "object" related to a matrix that allow us to manipulate its value and its inverse

makeCacheMatrix <-function(x = matrix()) {
  inv <-NULL
  set <-function(a) {
    x <<-a
    inv <<-NULL
  }
  get <-function(){x}
  setinverse <-function(inv){
    inv<<-inv
    }
  getinverse <-function(){inv}
  list(set = set, #define matrix
       get = get, #get the matrix
       setinverse = setinverse, #define its inverse
       getinverse = getinverse) #get its inverse
}


## Write a short comment describing this function

##This function returns a matrix that is the inverse of 'x'...

cacheSolve <-function(x, ...) {
  inv <-x$getinverse()
  if(!is.null(inv)) { #check if the inverse is stored in cache...
    message("Getting cached data")
    return(inv)
  }
  message("Cached data not found. Calculating inverse.") #if not found, the inverse is calculated
  matrix<-x$get()
  inv <-solve(matrix, ...)
  x$setinverse(inv)
  inv
}

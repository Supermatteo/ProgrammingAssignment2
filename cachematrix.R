## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x=matrix()) {      ## Create a function with name 
                                                ## makeCacheMatrix with a 
                                                ## numeric argument x in the 
                                                ## local environment
       
        m <- NULL                               ## Define variable m in the 
                                                ## makeCacheMatrix environment 
       
       set <- function(y) {                     ## Create a function "set" with 
                                                ## argument y
               
                x <<- y                         ## Assign the value y to variable 
                                                ## x (the input variable in the 
                                                ## makeCacheMatrix environment)
                
                m <<- NULL                      ## When set() is called, then a 
                                                ## new vector will be stored in 
                                                ## x. Therefore, the value of 
                                                ## m needs to be recalculated and 
                                                ## so, we reinitialized to NULL
       }
       
       get <- function() {                      ## Create a function "get" 
               
               x                                ## This is the value that is
                                                ## returned when the function 
                                                ## get is called (ex by 
                                                ## cacheSolve)
       }
       
       setinverse <- function(inverse) {        ## Create a function "setinverse" 
               
               m <<- inverse                    ## Assign value "inverse" to "m"
                                                ## in the parent environment
       }
       
       getinverse <- function () {              ## Create a function "getinverse" 
               m                                ## m is the value that is returned
                                                ## when the function is called but
                                                ## since it's not cotained in the 
                                                ## getinverse function, R looks 
                                                ## for it in the parent environment
       }
       
       list (set = set,                         ## creates a list that makes
             get = get,                         ## the functions available to be 
             setinverse = setinverse,           ## called ourtide of the 
             getinverse = getinverse)           ## environment
}

This function servers the purpose of creating a list of functions that is available outside makeCacheMatrix, 
and to store the functions m and x

cacheSolve <- function(x, ...) {        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getinverse()             ## assing the inverse value of x to the 
                                        ## variable m, whichever that might be

        if(!is.null(m)) {               ## in case the value of m is not zero
                                        ## ie. it has previously been calculated
                message("getting cached inverse") # type this
                return(m)               ## and return the value m 
        }

        data <- x$get()                 ## call function get in x which has no 
                                        ##  m value

        m <- solve(data, ...)           ## calculates inverse of x and assigns it
                                        # to m
        
        x$setinverse(m)                 ## assign value m just calculated to m 
                                        ## in the parent of setinverse (makeInverse) 
        
        m                               ## print value m
}

This function checks if the inverse of the matrix x has been already calculated and if not, it calculates it.
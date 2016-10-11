# Vectorize numbers
MyFirstVector <- c(3,45,56,732)
MyFirstVector
is.numeric(MyFirstVector) #True
is.integer(MyFirstVector) #Default is double
is.double(MyFirstVector) #TRUE

V2 <- c(3L, 12L, 234L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

v3 <- c("a","B","hello")
v3
is.numeric(v3)
is.character(v3)
# numbers and char in vector
v4 <- c("a", 8,9,10)
v4
is.character(v4)
is.numeric(v4)

seq() #sequnce - like':'
rep() #replicate
# seq() example
seq(1,15)
1:15
# seq(start,end,step)
z <- seq(1,15,3)
z

#rep() example
#this replicates 3 for 15 times
rep(3,15)

rep('a',5)

x <- c(80,20)
y <- rep(x,80)
y

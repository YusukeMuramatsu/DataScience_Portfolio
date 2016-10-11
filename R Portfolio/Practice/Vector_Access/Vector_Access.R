
# c() means combine
x <- c(1,2,3,4,5,6)  #combine
y <- seq(1,18,3)     #sequence
z <- rep('test',4)  #replicate

w <- c("a","b","c")
w

w[1]
w[2]
w[3]
w[-1] #Except 1
w[-2] 
w[-3]
w[1:3]
w[1:2]
w[c(1,2,5)]
w[c(-1,-2)] #"c"
w[-1:-2] #Error
w[1000] #NA
w[-2:1] #Error

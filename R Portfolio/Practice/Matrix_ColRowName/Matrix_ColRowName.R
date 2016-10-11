#Name Vectors
Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)

# Clear Names
names(Charlie) <- NULL
Charlie

#Naming Matrix Dimentions 1
temp.vec <- rep(c("a","B","zZ"),times = 3)
temp.vec
temp.vec2 <- rep(c("a","B","zZ"),each = 3)
temp.vec2

#Create Matrix
Bravo <- matrix(temp.vec,3,3)
Bravo

#Add row names to Matrix
rownames(Bravo) <- c("How", "are", "you")
Bravo

#Add col names to Matrix
colnames(Bravo) <- c("z","y","x")
Bravo

# Check row and col names
rownames(Bravo)
colnames(Bravo)

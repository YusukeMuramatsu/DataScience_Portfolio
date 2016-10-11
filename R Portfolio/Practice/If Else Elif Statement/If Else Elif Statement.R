
# ---- -2 ---- -1 ---- 0 ---- 1 ---- 2

# random number generator
# rnorm(n, mean=0, sd =1)
x <- rnorm(1)
 
#Version 1
# How to Remove value?
rm(answer) 

# if(LOGICAL){ACTION}
# Nested If
if(x > 1){
  answer <- "Greater than 1"
}else{
  
  if(x >= -1){
    answer <- "Between -1 and 1"
  }else{
    answer <- "Less than -1"
  }
}

# Version 2 with Else If(Chaining statement)
rm(answer)
x <- rnorm(1)
if(x > 1){
  answer <- "Greater than 1"
} else if(x >= -1){
  answer <- "Between -1 and 1"
} else{
  answer <- "Less than -1"
}


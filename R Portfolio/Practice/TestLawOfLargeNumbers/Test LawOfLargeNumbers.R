# Test the Law Of Large Number for n random normatlly distributed numbers with mean = 0, stdev = 1.
n <- 100000
counter <- 0
for(i in rnorm(n)){
  if(i >-1 & i < 1){   #Test stdv between -1 and 1
    counter <- counter + 1
  }
  
}
test <- counter/n
test  # Test returns around 0.682 as expected
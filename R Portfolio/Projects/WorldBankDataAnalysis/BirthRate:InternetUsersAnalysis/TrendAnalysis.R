?read.csv()

#Method 1. Select The File Manually
stats <- read.csv(file.choose())
stats

#Method 2. Set Working Directory and Read Data
getwd() 
setwd("/Users/yusukemuramatsu/Desktop/R Portfolio")  # This is how to set up working directly
rm(stats)
stats <- read.csv("DemographicData.csv") # I need to put data into this sytem
stats

#-------Exploring Data----
stats
# the number of rows
nrow(stats)
# the number of columns
ncol(stats)
# top 5 rows
head(stats)
head(stats,n=10)
# bottom 5 rows
tail(stats)
# Structure
str(stats) #str()-Structure runif()-rondom uniform distribution
# Summary
summary(stats)

#-------Exploring Data with $ sign----
stats
head(stats)
stats[3,3]  #Dataframe access
stats[3,'Birth.rate'] # Dataframe access

# $ allows us to access to datafram using COLUMN NAME
stats$Internet.users # this returns Internet.users as vector
stats$Internet.users[2]

# Check levels of variable
levels(stats)
levels(stats$Income.Group)

#-------------Basic Operation with a Data Frame
stats[1:10,]  #subsetting
stats[3:9,]
stats[c(4,100),]
#Remember how the [] works;
stats[1,] # access ROW
is.data.frame(stats[1,]) # In matrix, if we extract one row, it turns out to be vector.But it does not happen in dataframe
stats[,1] # access COLUMN
is.data.frame(stats[,1]) # Column access will make data to be vector unless spcify the drop = F
is.data.frame(stats[,1,drop=F])

#multiply columns(just data frame operation practice)
head(stats)
stats$Birth.rate * stats$Internet.users

#addColumn
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats

#remove a column
head(stats)
stats$MyCalc <- NULL

#-------------Filtering a Data Frame
head(stats)
filter <- stats$Internet.users < 2  #Create object which has a criteria
stats[filter,]   # parse the filter variable to [].

stats[stats$Birth.rate > 40,]  # Using logic into []
stats[stats$Birth.rate > 40 & stats$Internet.users <2,] # multiple condition
stats[stats$Income.Group == "High income",] # Access to the 

stats[stats$Country.Name == "Japan",]

# ------------Introduction to qplot() - Quick Plot
?qplot #Description
qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)
qplot(data=stats,x=Income.Group,y=Birth.rate, size=3)
qplot(data=stats,x=Income.Group,y=Birth.rate, size=I(3)) #without legend
qplot(data=stats,x=Income.Group,y=Birth.rate, size=I(3),
      color=I("blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate,
      color=I("blue"),geom='boxplot')

# ------------ Visualizing -- Scatter Plot
#Scatter Plot
qplot(data=stats,x=Internet.users, y=Birth.rate)
qplot(data=stats,x=Internet.users, y=Birth.rate, size=I(1))
qplot(data=stats,x=Internet.users, y=Birth.rate, size=I(1),color=I("red"))
qplot(data=stats,x=Internet.users, y=Birth.rate, size=I(1),colour=Income.Group)

#------------- Creating Data Frames
#data.fram().
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,
                   Regions_2012_Dataset)
mydf
#Change Name version 1
colnames(mydf) <- c("Country","Code","Region")
head(mydf)
#rm(mydf)

#Change Name version 2
mydf <- data.frame(Country = Countries_2012_Dataset,Code = Codes_2012_Dataset,
                   Region = Regions_2012_Dataset)
head(mydf)

summary(mydf)
summary(stats)

#---------Merging Data Frames
head(stats)
head(mydf)

?merge
# Merge function
merged <- merge(stats,mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
head(merged)

#--------- Visualizing with new split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color = Region)

#1. Shapes in Scatter Plot
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color = Region,shape=I(17)) # shape is shape of points in scatter plot

#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color = Region,shape=I(17),
      alpha=I(0.5)) # Alpha is transparency, ranging from 0-1.

#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      color = Region,shape=I(17),
      main = "Birth Rate vs Internet Users") # Title can be added by using main = .







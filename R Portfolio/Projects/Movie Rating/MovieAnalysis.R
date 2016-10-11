movies <- read.csv(file.choose())
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
str(movies)

#How to tranform data type - number to factor

factor(movies$Year) # transform number to factor
movies$Year <- factor(movies$Year) # I need to assign to variable
summary(movies)
str(movies)

#-----Aesthetics
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating))

#-----Geometry
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating)) + geom_point()

#-----Color
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, color = Genre)) + geom_point()

#-----size
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, color = Genre, size=Genre)) + geom_point()

#-----size
ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, color = Genre, size=BudgetMillions)) + geom_point()


#-------------- Plotting with layers

p <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating)) # this is the base

p + geom_point() # P is base for plot. + adds one layer on top of it.

p + geom_line() + geom_point() #two layers

#-------------- Plotting with layers

q <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating, color=Genre))

#Overwrite aec
# -----Aesthetics can be changed in geom too. this will overwrite aec in q.
q + geom_point(aes(size=CriticRating)) #Example 1
q + geom_point(aes(color=BudgetMillions)) #Example 2
q + geom_point(aes(x=BudgetMillions)) #Example 3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$") #Example4 Change x axis name
q + geom_line() + geom_point() #Example5
q + geom_line(size=1) + geom_point() #Example6 size changes thickness of line


#--------Mapping vs Setting
#Use of aes()
#Option 1 – you can use the aesthetic to reflect some properties of your data. 
#For example, clarity of the diamonds, like we did in the first example. 
#This is called MAPPING an aesthetic.
#Option 2 – you can choose a certain value for an aesthetic. 
#For example, make the colour blue for ALL points or make the shape a square 
#for ALL points. This is called SETTING an aesthetic and the keyword here is ALL.

#Example
r <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating))
r + geom_point()

#Add color
# No.1 Mapping (what I have done so far)
r + geom_point(aes(color = Genre)) #with aes() because Genre is nature of our data.
# No.2 Setting
r + geom_point(color="DarkGreen") #without aes() because DarkGreen is not nature of our data. I want to change colors for ALL values.
#ERROR:
r + geom_point(aes(color="DarkGreen")) #Error because DarkGreen is not nature of our data.

# Mapping practice 1
r + geom_point(aes(size=BudgetMillions))
# Setting practice 2
r + geom_point(size = 10)
# ERROR:
r + geom_point(aes(size=10))  # Because 10 is not nature of our data. this canges ALL variables

#-------------- Histogram and Density Chart

s <- ggplot(data=movies, aes(x=BudgetMillions)) # y is not needed, count axis is created automatically.
s + geom_histogram(binwidth = 10)

# Add color
s + geom_histogram(binwidth = 10, aes(fill=Genre))

# Add a border
s + geom_histogram(binwidth = 10, color="Black", aes(fill=Genre))

#Density Charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position="stack")

#-------------- Starting Layer Tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="White",
                   color="Blue")

#another way:
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="white",color="Blue")
#another way:

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="white",color="Blue")

#-------------- Statistical Transformatios

?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,color=Genre))

u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x = Genre, y=AudienceRating,
                             color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=0.5) + geom_point(size=0.5)
#Jitter
u + geom_boxplot(size=0.5) + geom_jitter(size=0.5)
u + geom_jitter() + geom_boxplot(size=0.5, alpha = 0.5)

#--------- Using Facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="Black")
#facets
v + geom_histogram(binwidth = 10,aes(fill=Genre),
                   color="Black") +
  facet_grid(Genre~., scales="free")

#scatterplots:
w <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                             color = Genre))
w + geom_point(size=3)

#facets 
w + geom_point(size=0.5) +
  facet_grid(Genre~.) #facet_grid(ROW ~ COL)

w + geom_point(size=0.5) +
  facet_grid(.~Year) #facet_grid(ROW ~ COL)

w + geom_point(size=0.5) +
  facet_grid(Genre~Year) #facet_grid(ROW ~ COL)

w + geom_point(size=0.5) +
  geom_smooth() +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth(size=0.5) +
  facet_grid(Genre~Year) # adding geom_smooth

#---------Coordinates
#Limit
#Zoom
m <- ggplot(data=movies, aes(x=CriticRating,y=AudienceRating,
                             size=BudgetMillions,
                             color=Genre))

m + geom_point()

m + geom_point() + xlim(50,100) + ylim(50,100)

#wont work well always
n <- ggplot(data=movies, aes(x = BudgetMillions))
n + geom_histogram(binwidth = 10,aes(fill=Genre), color="Black") +
  ylim(0,1000)
  
#ZoomIn Coord Cartesian Function
n + geom_histogram(binwidth = 10,aes(fill=Genre), color="Black") +
  coord_cartesian(ylim=c(0,50))

#Improve #1
w + geom_point(size=1) +
  geom_smooth(size=0.5) +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#--------- Theme

o <- ggplot(data = movies, aes(x = BudgetMillions))
h <- o + geom_histogram(binwidth = 10,aes(fill=Genre), colour="Black")

h

#axis labels
h + xlab("Money Axis") + 
  ylab("Number of Movies")

#label
h + xlab("Money Axis") + 
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen",size=20),
        axis.title.y = element_text(color="Red",size = 20),
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20))

#legend formatting
h + xlab("Money Axis") + 
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen",size=20),
        axis.title.y = element_text(color="Red",size = 20),
        axis.title.x = element_text(size=20),
        axis.title.y = element_text(size=20),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "Blue",
                                  size=20,
                                  family = "Courier"))


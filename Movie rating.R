

md <- read.csv(file.choose())

head(md)

colnames(md) <- c("Film", "Genre", "Critic_Ratings", "Audience_Ratings", "Budget_in_Millions", "Year")

str(md)

factor(md$Year)

md$Year <- factor(md$Year)

summary(md)

#--------------------ggplot

library(ggplot2)

p <- ggplot(data=md, aes(x=Critic_Ratings, y=Audience_Ratings, colour=Genre, size=Budget_in_Millions)) 

#point

p + geom_point()

#line

p + geom_line()

#multiple

p + geom_line() + geom_point()

p + geom_bar()

p + geom_boxplot()

p + geom_col()

#setting aes

p + geom_point(aes(colour=Critic_Ratings))

p + geom_point(aes(x=Budget_in_Millions))

p + geom_point(aes(x=Budget_in_Millions)) + xlab("Budget_in_Millions")

p + geom_point(aes(y=Genre, x=Budget_in_Millions)) + xlab("Budget_in_Millions") + ylab("Genre")

p + geom_line(aes(y=Genre, x=Budget_in_Millions)) + xlab("Budget_in_Millions") + ylab("Genre")


#setting 

p + geom_line(size=1)

#Add color
#1.Mapping

p + geom_point(aes(colour=Genre))

#2.Setting

p + geom_point(colour="Dark Red")

#------histogram and density chart

#1.histogram

q <- ggplot(data = md, aes(x=Budget_in_Millions))

q + geom_histogram(aes(fill=Genre),colour="White",binwidth=10)

q + geom_histogram(fill="Black")

#2. Density Chart

q + geom_density(aes(fill=Genre), position="stack")

r <- ggplot(data=md, aes(x=Audience_Ratings))

r + geom_histogram(fill="white", color="Black", binwidth=10)

#3. smooth

s <- ggplot(data=md, aes(x=Audience_Ratings, y=Critic_Ratings, colour=Genre))

s + geom_smooth() + geom_point()

#4. Boxplot

t <- ggplot(data=md, aes(x=Genre, y=Critic_Ratings))

t + geom_jitter() + geom_boxplot(size=1.2, aes(colour=Genre), alpha=0.5) 

#--------------- facets

u <- ggplot(data=md, aes(x=Audience_Ratings))

u + geom_histogram(aes(colour=Genre), binwidth=10) + facet_grid(Genre~.)

r <- ggplot(data=md, aes(x=Critic_Ratings, y=Audience_Ratings))

r + geom_point(aes(colour=Genre, size=Budget_in_Millions, alpha=0.5)) + facet_grid(Genre~Year) + geom_smooth()

#-------------- coordinates

s <- ggplot(data=md, aes(x=Audience_Ratings, y=Critic_Ratings, colour=Genre))

s +  geom_point() + xlim(50, 100)

#1. zoom

u <- ggplot(data=md, aes(x=Audience_Ratings))

u + geom_histogram(aes(colour=Genre), binwidth=10) + coord_cartesian(ylim=c(50, 100))

#2. improving axis

r <- ggplot(data=md, aes(x=Critic_Ratings, y=Audience_Ratings))

r + geom_point(aes(colour=Genre, size=Budget_in_Millions, alpha=0.5)) + facet_grid(Genre~Year) + geom_smooth() + coord_cartesian(ylim=c(0,100))


#-------------- theme


o <- ggplot(data=md, aes(x=Audience_Ratings))

w <- o + geom_histogram(aes(fill=Genre), colour="black")

w + ggtitle("Movie Rating by Audience") + xlab("Audience Ratings") + ylab("Number of movies") + theme(
  axis.title.x=element_text(colour="Dark Blue", size=30),
  axis.title.y=element_text(colour="Red", size=30),
  axis.text.x=element_text(colour="Black", size=20),
  axis.text.y=element_text(colour="Black", size=20),
  legend.title=element_text(colour="Red", size=10),
  legend.text=element_text(colour="Black", size=5),
  legend.position = c(1,1),
  legend.justification = c(1,1),
  plot.title=element_text(colour="Violet", size=40))





dataset_FacebookProject1 <- maml.mapInputPort(1)
str(dataset_FacebookProject1) #structure of the data
#transforming data
dataset_FacebookProject1$Category <- as.factor(dataset_FacebookProject1$Category)
dataset_FacebookProject1$Paid <- as.factor(dataset_FacebookProject1$Paid)
dataset_FacebookProject1$PostWeekday <- as.factor(dataset_FacebookProject1$PostWeekday)
dataset_FacebookProject1$PostMonth <- as.factor(dataset_FacebookProject1$PostMonth)

str(dataset_FacebookProject1) # Check the result
dataset_FacebookProject1 <- dataset_FacebookProject1[, c(-19)]

#First visualisation;Page total likes by weekeday
library("ggplot2")

ggplot(dataset_FacebookProject1, aes(x=PostWeekday, y=PageTotalLikes)) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 8, outlier.size = 3, lwd=0.8,
               fill="lightgrey") +
  labs(x="Post weekday", y="Page total number of likes")

#second visualisation: Amount of likes against type of posts

ggplot(dataset_FacebookProject1, aes(x=Type, y=PageTotalLikes)) +
  geom_boxplot(outlier.colour="red",outlier.shape=8,outlier.size=3,lwd=0.8,
               fill="lightgrey")+
  labs(x="Type of post", y="Page total number of likes")

type.dataset_FacebookProject1=aggregate(dataset_FacebookProject1$PageTotalLikes,list(dataset_FacebookProject1$Type),mean)
type.dataset_FacebookProject1

#third visualisation: Number of likes against paid post

ggplot(dataset_FacebookProject1, aes(x=Paid, y=PageTotalLikes)) +
  geom_boxplot(outlier.colour="red",outlier.shape=8,outlier.size=3,lwd=0.8,
               fill="lightgrey")+
  labs(x="Paid /non paid posts", y="Page total number of likes")+
  ggtitle("Paid post versus non-paid post")

#Fourth visualisation: visualisation of amount of likes by month

ggplot(dataset_FacebookProject1, aes(x=PostMonth,y=PageTotalLikes)) + 
  geom_boxplot(outlier.colour="red",outlier.shape=8,outlier.size=3,lwd=0.8,
               fill="lightgrey")+
  labs(y="Page total likes", x="Month")+
  ggtitle("Total amount of likes by month")
  
#visualisation of amount of likes by month - line graph
 
PostMonth.dataset_FacebookProject1<-aggregate(dataset_FacebookProject1$PageTotalLikes,list(dataset_FacebookProject1$PostMonth),mean)
ggplot(PostMonth.dataset_FacebookProject1,aes(x=c(seq(1,12)),y=x)) + 
  geom_line(color = "#00AFBB", size = 2)+
  labs(y="Mean Page total likes", x="Month")+
  scale_x_continuous(breaks=seq(1, 12, 1))+
  ggtitle("Total amount of likes by month")
# x refers to the aggregate value

#Bar grah - amount of likes by month
ggplot(PostMonth.dataset_FacebookProject1, aes(x=c(seq(1,12)),y=x)) + 
  geom_bar(stat="identity",fill="steelblue")+
  labs(y="Mean Page total likes", x="Month")


maml.mapOutputPort('dataset_FacebookProject1')
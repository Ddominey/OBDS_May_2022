#Morning Session

getwd()
setwd(dir = "/t1-data/project/obds/ddominey/projects/")

day2matrix <- readRDS(file = "/project/obds/shared/resources/2_r/my_day2matrix.rds")
rowsum <- rowSums(day2matrix)
rowmean <- rowMeans(day2matrix)
day2matrix <- cbind(day2matrix, rowsum = rowSums(day2matrix), rowmean = rowMeans(day2matrix))
day2matrix <- rbind(day2matrix, c(colSums(day2matrix)), c(colMeans(day2matrix)))
day2matrix[21:22,11:12] <- NA

#Exercise 2
data("ToothGrowth")
summary(ToothGrowth)
head(ToothGrowth)

mean(ToothGrowth$len)``
min(ToothGrowth$len)
max(ToothGrowth$len)
sum(ToothGrowth[,1]) #or sum(ToothGrowth$len)

#Exercise 3 Sorting
data("airquality") #load dataset
summary(airquality) #summary of dataset
colnames(airquality)
rownames(airquality)
airquality_sorted <- airquality[order(airquality$Ozone),] #comma is to select the column and row (column indicated in brackets, and no row indicated by ",")
airquality_sorted_2 <- airquality[order(airquality$Month), airquality$Temp, decreasing=TRUE,]
airquality_sorted_3 <- airquality[order(airquality$Month),]

write.table(airquality_sorted, file = "airquality_sorted2.txt", quote = FALSE, sep = "/t")

#Exercise 4 Merging
buildings <- data.frame(location=c(1,2,3), name=c("b1","b2","b3"))
data <- data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1), efficiency=c(51,64,70,71,80,58))
head(buildings)
head(data)
buildingStats <- merge(buildings, data, by="location") #merge data and buildings
head(buildingStats)

#Exercise 5 Aggregate
aggregate(airquality, by=list(airquality$Month), FUN=mean, na.rm=T)
solar.R_by_month <- aggregate(airquality$Solar.R, by=list(month = airquality$Month), FUN = mean, na.rm=T) #add the mean
solar.R_by_month <- aggregate(airquality$Solar.R, by=list(Month =airquality$Month), FUN = sd, na.rm=TRUE) #add standard deviation


data <-data.frame( name = c("Astrid", "Lea", "Sarina", "Remon", "Lea", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"), 
                   sex = c("female", "male", "male", "male", "female", "male", "female", "female", "male", "female"), 
                   age = c(30, 25, 25, 29, 31, 30, 33, 35, 25, 34), 
                   superhero = c("Batman", "Superman", "Batman", "Spiderman", "Batman", "Antman", "Batman", "Superman", "Maggott", "Superman" ), 
                   tattoos = c(11, 15, 12, 12, 17, 12, 9, 13, 9, 9))

head(data)
dim(data)
median(data$age)
mean(data$age[data$sex == "female"])
mean(data$age[data$sex == "male"])
max(data$tattoos[data$sex == "male"])

sum(data$age <32)
sum(data$sex == "female")

data$age <32 & data$sex == "female"
sum(data$age <32 & data$sex == "female")
nrow(data)

(sum(data$age <32 & data$sex == "female")) / sum(data$age<32)


#Exercise 6 Apply
num_vec <- c(1:10)
#create a custom function
square <- function(x){
  y=x^2
  return(y)
}
square(c(3,4))
lapply(num_vec, square)

sapply(num_vec, square)


my_list <- list(1:3, c(T, T, F), F, 5)
lapply(my_list, sum)
sapply(my_list, sum)

repeat_fun <- function(x){
  output <- c(x,x,x)
  return(output)
}

sapply(my_list, rep, each =3)


#Exercise 7 Loops
for(i in 1:7) {
  print(i^3)
}

head(iris)

for(i in colnames(iris)) {
  print(paste0(i, " (", nchar(i), ")"))
}

colour_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")
nchar("orange")

for (colour in colour_vector){
  if (nchar(colour) == 4){
    print(colour)
  }
}

#using ifelse
ifelse(nchar(colour_vector)==4, print(colour_vector), NA)

#Exercise 8 Functions - calculating the hypotenuse of a triangle
hypo_function <- function(x=1, y=1){
  sqrt((x^2)+ (y^2))
}

hypo_function(3,4) ; hypo_function(7,9)

hypo_function(x,y)



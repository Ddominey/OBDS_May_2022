#Morning Session - Question 2

a <- 10
b <- "happy"
c <- 1:15


save.image(file = "11_05_2022_Morning_example_2_image.RData")

saveRDS(object = a, file = "object_a.rds")

rm(a) ; ls()

rm(list = ls())
ls()

getwd()
setwd (dir = "/t1-data/project/obds/ddominey/projects/")

setwd (dir = "/t1-data/project/obds/ddominey/projects/11_05_2022_Morning")
getwd()

object_a <- readRDS("/t1-data/project/obds/ddominey/projects/11_05_2022_Morning/object_a.rds")
a <- readRDS("/t1-data/project/obds/ddominey/projects/11_05_2022_Morning/object_a.rds")
rm(object_a)

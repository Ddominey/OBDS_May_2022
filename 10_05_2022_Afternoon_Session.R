#Afternoon session / exercises.
data("iris") #load in the build in iris dataframe
summary(iris)
names(iris)

#Subset / index based on boolean (filter for rows that meet particular criteria):
#by boolean
iris[iris$Species == "setosa", ] #example to extract the rows that contain setosa

iris[iris$Sepal.Length > 5 ,]
or
iris[iris["Sepal.Length"] > 5 ,]

iris[iris$Sepal.Length >5 & iris$Petal.Length > 2, ]

#Exercise 4
coding_gene_region <- read.table(file = "/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed", header = FALSE, sep = "\t", stringsAsFactors = FALSE)
View(coding_gene_region)
dim(coding_gene_region)
class(coding_gene_region)
nrow(coding_gene_region)
ncol(coding_gene_region)
colnames(coding_gene_region) <- c("chr", "start", "stop", "name", "score", "strand"); View(coding_gene_region) 
#or could use: names(coding_gene_region) to find the row names.

coding_gene_region[30,3]

#Extract the second column by index:
coding_gene_region[,2]

#Extract the second colum by name:
names(coding_gene_region)
start <- coding_gene_region$start

coding_gene_region$int_length <- coding_gene_region$stop - coding_gene_region$start

colnames(coding_gene_region)

medium_size <- coding_gene_region[coding_gene_region$int_length >= 100001 & coding_gene_region$int_length <= 200000,]
medium_size_new <- subset(coding_gene_region, int_length >= 100001 & int_length<= 200000)
identical(medium_size, medium_size_new)

write.table(medium_size, file = "subset_coding_gene_region_base_R.txt", row.names = F, sep = "\t", quote = F)


rm(list=ls())
getwd()
setwd("~/GitHub/QB2021_Team3")

foodWebs <- read.table("135FoodWebs.txt", sep = "\t", header = TRUE, row.names = 1)

foodWebs.nums <- foodWebs[,c(6:10, 12:17, 20:22, 24:31, 33)]
pairs(foodWebs.nums)
boxplot(Log.Biomass.~Ecosystem.Type.ID, data = foodWebs,  xlab = "Ecosystem Type", ylab = "Log Biomass")

install.packages("corrplot", repos = "http://cran.rstudio.com/")
require("corrplot")

cor1 <- cor(foodWebs.nums)
corrplot(cor1, method = "ellipse")
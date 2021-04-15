rm(list=ls())
getwd()
setwd("~/GitHub/QB2021_Team3")
`135FoodWebs`$Taxon.ID = as.factor(`135FoodWebs`$Taxon.ID)
`135FoodWebs`$Ecosystem.Type.ID = as.factor(`135FoodWebs`$Ecosystem.Type.ID)
fitreg <- lm(Log.Abundance. ~ Taxon.ID, data = `135FoodWebs`)
summary(fitreg)
Abun <- `135FoodWebs`[,c(7,10)]
require(dplyr)
AbS <- `135FoodWebs` %>%
  group_by(Ecosystem.Type.ID) %>% 
  summarise(cor(Log.Abundance., Soil.pH))
AbC <- `135FoodWebs` %>%
  group_by(Taxon.ID) %>% 
  summarise(cor(Log.Abundance., C.tot))
AbT <- `135FoodWebs` %>%
  group_by(Taxon.ID) %>% 
  summarise(cor(Log.Abundance., Average.T))
install.packages("GGally")
require(GGally)
ggpairs(AbS)


#  This code will use RGL Library to produce interactive 3D Plot 
require(rgl,  lib.loc="C:/TFS/Rlib/") 
library("rgl")

# As KMeans ( is an unsupervised learning) doesn't need to know the species.So, newiris is a variable will have all the Iris Attributes from IRIS Table except the Species. 
iris
newiris <- iris
newiris$Species <- NULL
newiris

# Setting the seed before KMeans to reproduce the same cluster on every execution 
set.seed(123) 

# KMeans algorithm clustering into 3 groups
kc <- kmeans(newiris, 3)
kc

# Table to compare the Iris Species with the clustering result

table(iris$Species, kc$cluster)

##################
# With Rgl library, Plots the clusters using 'plot3d()' and its centroids using 'points3D()'
# @colors contains color to plot species in different colors
# @temp variable is used to combine the clustering result to newiris table to plot
# @legend3d() is used to draw legends of the cluster
colors = c("orange", "purple","steelblue")[as.numeric(kc$cluster)]
temp = cbind(newiris,cluster = kc$cluster)
with(temp,plot3d(newiris$Sepal.Length,newiris$Sepal.Width,newiris$Petal.Length, col=colors, pch = 16, size=1, type='s')) 
with(temp,pch3d(kc$centers[,c("Sepal.Length")],kc$centers[,c("Sepal.Width")],kc$centers[,c("Petal.Length")], pch =8 , col=rainbow(8),cex=4)) 
legend3d("right", legend = levels(iris$Species),   col =  c("orange", "purple","steelblue"), pch = 16) 
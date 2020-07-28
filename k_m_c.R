#K-Means Clustering

#Importing the mall dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]

#Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for(i in 1:10) wcss[i] <- sum(kmeans(X,i)$withinss)
plot(1:10,wcss,type = "b", main = paste('Clusters of clients'),xlab = "Number of clusters",ylab = "WCSS")

#Applying k-means to the mall dataset
set.seed(29)
kmeans <- kmeans(X,5,iter.max = 300,nstart = 10)

#Visualising the clusters
# install.packages('cluster')
library(cluster)
clusplot(X, 
         kmeans$cluster, 
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of clients'),
         xlab = "Annual Income",
         ylab = 'Spending Score')


#My revised code
#Clear the data of above code in global environment and try this


# K-Means Clustering



# Importing the dataset

dataset = read.csv('Mall_Customers.csv')

dataset = dataset[4:5]



# Install and Run Package "factoextra"

#install.packages("factoextra")

library(factoextra)



# Determine optimal number of clusters using Elbow method

set.seed=123

fviz_nbclust(dataset,kmeans,method="wss")+
  
  labs(title="Elbow Method")+
  
  xlab("Number of Clusters")+
  
  ylab("WCSS")

# Fitting K-Means to the dataset

set.seed(29)

k1 = kmeans(x = dataset, centers = 5,iter.max=300,nstart=25)



# Visualizing the clusters

#?fviz_cluster

fviz_cluster(k1,dataset)+ ggtitle("Clusters of Customers")+
  
  xlab("Annual Income")+
  
  ylab("Spending Score")
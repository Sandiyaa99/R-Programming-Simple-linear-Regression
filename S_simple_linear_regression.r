#simple linear regression
#install.packages('readr')
#importing the dataset

#method1
attach(Salary_Data)

#method2
dataset<-read.csv("F:/MLP_SPYDER/Salary_Data.csv")

#method3
read.csv()

#see your dataset whether attached or not
View(dataset)

#splitting the dataset into training and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(dataset$Salary,SplitRatio=0.70)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#fitting simple linear regression to training set
regressor=lm(formula=Salary~YearsExperience,
             data=training_set)
summary(regressor)
coef(regressor)

#predicting the test set results
y_pred=predict(regressor,newdata=test_set)

#visualising the training set results
library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary))


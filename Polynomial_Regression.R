# Using Polynomial Regression for Stock Analysis

library(caTools)
library(ggplot2)
#install.packages('Metrics')
library(Metrics)

#Import the data
dataset = read.csv("data.csv")

#Extract the column names
columns = colnames(dataset)

avg = 0 

#total number of columns in the dataset
col_len = ncol(dataset)

for(i in 2:10) # 2:col_len to traverse through all stocks
{
  #Extract required data subset
  req = dataset[,c(1,i)]
  
  #Extract the Output vector
  Y = dataset[,i]
  
  #Split the data
  set.seed(123)
  split = sample.split(Y, SplitRatio = 2/3)
  training_set = subset(req, split == TRUE)
  test_set = subset(req, split == FALSE)
  
  #Feature Scaling
  training_set = data.frame(scale(training_set))
  test_set = data.frame(scale(test_set))
  
  fRpart <- as.formula(paste(columns[i], columns[1], sep=" ~ "))
  
  # Fitting Simple Linear Regression to the Training set
  training_set$Level2 = training_set$DATE^5
  poly_regressor = lm(formula = fRpart,
                      data = training_set)
  
  test_set$Level2 = test_set$DATE^5
  poly_regressor = lm(formula = fRpart,
                      data = test_set)
  
  
  # Predicting the Test set results
  y_pred = predict(poly_regressor, newdata = test_set)
  
  # #Converting the predictions to dataframe
  # df = data.frame(y_pred)
  # 
  # #Differene between Actual and Predicted values
  # temp = abs(test_set[columns[i]]) - abs(df)
  # 
  # #Addition of the differences
  # total = sum(temp)
  # 
  #Standard Deviation
  error = mse(test_set[columns[i]],df)
  
  #Adding the errors to later find the average error
  avg = avg + error
  
  # # Visualising the Test set results
  # ggplot() +    
  #   geom_point(aes(x= training_set$DATE, y = training_set[columns[i]]), colour='red')+
  #   geom_line(aes(x= training_set$DATE, y=predict(poly_regressor, newdata = training_set)), colour='blue')+
  #   
  #   ggtitle('Stock- Polynomial Regressor')
  #   xlab('Date')
  #   ylab('SP500')
  # ggsave(myplot,filename=paste(columns[i],".png",sep=""))
  # 
  # 
  
}

#Average of all the errors
total_error = avg/i

print(paste0("Total Error : ",total_error))
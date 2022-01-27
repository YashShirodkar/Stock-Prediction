# Stock-Prediction
Using R language to predict stock of S&amp;P 500 companies.

Experiment and their results:
Polynomial Regression – (Flow of the program)
1.	Import the dataset.
2.	Split the dataset into training set and test set.
3.	Feature scale the elements within the columns.
4.	Create the polynomial regressor.
5.	Regressor studies the pattern within the elements for the training set.
6.	Values for the test set are predicted.
7.	Graphs are plotted for the respective companies.
8.	Error is calculated using Mean Square Error=
a. mse(test_set[columns[i]],df)
b. Find the average.
9.	Print the error.

For the actual data taken in the implemented program the error for polynomial regression is –
0.5537179

![SP500](https://user-images.githubusercontent.com/36268383/76798919-ec01e280-67a6-11ea-9594-3c4533f0a880.jpg)

Suppport Vector Regression – (Flow of the program)
10.	Import the dataset.
11.	Split the dataset into training set and test set.
12.	Feature scale the elements within the columns.
13.	Create the support vector regressor.
14.	Support vector regressor = 
      regressor = svm(formula = fRpart, data = training_set, type = 'eps-regression')

15.	Regressor studies the pattern within the elements for the training set.
16.	Values for the test set are predicted.
17.	Graphs are plotted for the respective companies.
18.	Error is calculated using Mean Square Error=
a. mse(test_set[columns[i]],df)
b. Find the average.
19.	Print the error.


Support Vector Regession gives a better result by reducing the error. However it is slower than Polynomial Regression.

For the actual data taken in the implemented program the error for support vector regression is –
0.1429184

![SP500](https://user-images.githubusercontent.com/36268383/76799148-65013a00-67a7-11ea-9a1c-d46046de8422.jpg)

This document is created by Yash Shirodkar. 
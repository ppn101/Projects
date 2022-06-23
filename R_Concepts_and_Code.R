#We can use hotkey combination (option and -) to input <- instead of typing <-

#Assign numbers 0 to 11 to U
U <- 0:11
Y <- 11:0 #This will create a descending order list

#To load built in datasets
library(datasets)

# to show first few lines of a dataset (iris here)
head(iris)

#summary starts for a dataset (iris here)
summary(iris)

#scatterplot matrix for the dataset (iris here)
plot(iris)

# To free up memory and clear the cache (for base)
detach('package:datasets', unload = TRUE)

#clear plots (only if there is a plot in the output)
dev.off()

#clear console - Click on edit and then click on clear
cat("\014")

#package for manipulating dataframes - dplyr
#package for cleaning information - tidyr
#package for working with string or text information - stringr
#package for manipulating date information - lubridate
#package for working with website data - httr
#package for interactive visualizations - ggvis
#package for creating visualizations - ggplot2
#package for creating interactive applications that can be installed on websites - shiny
#package for importing and exporting data - rio
#package for creating interactive notebooks or rich documents - rmarkdown
#for managing packages, install pacman
install.packages("pacman")

#To load a package  - By returing a confirmation message
require(pacman)
#To load a package  - No confirmation message
library(pacman)

#To clear specefic packages from memory (here - dplyr, tidyr, stringr)
p_unload(dplyr, tidyr, stringr)

#To clear all add on packages from memory
p_unload(all)

#Plot command is for basic (x,y) plotting. It adapts to data types and number of variables.

#To get help on any command (here plot)
?plot

#To plot categorical variables in the data
plot(iris$Species)

#To plot quantitative variable
plot(iris$Petal.Length)

#To plot categorical vs quantitative data
plot(iris$Species, iris$Petal.Length)

#To plot quantitative variables on both axis
plot(iris$Petal.Length, iris$Petal.Width)

#To plot entire dataframe
plot(iris)

#plot with options
plot(iris$Petal.Length, iris$Petal.Width,
     col = "#cc0000", #Hex code for red colour
     pch = 19, #So that the output will be solid red circles instead of hollow discs
     main = "Iris Dataset: Petal Length vs Petal Width", #To give a title to the plot
     xlab = "Petal Length", #To give a label name to the x axis of the plot
     ylab = "Petal Width" #To give a label name to the x axis of the plot
     )

#To plot formulas with plot()
plot(cos, 0, 2*pi)
plot(exp, 1, 5)
plot(dnorm, -3, +3)

#Formula plot with options
plot(dnorm, -3, +3,
     col = "#cc0000",
     lwd = 5,
     main = "Standard Normal Distribution",
     xlab = "Z-score",
     ylab = "Density")
     
head(mtcars)
?mtcars

# for making bar graphs we need to create seperate tables
#To create a table using specefic columns
cylinders <- table(mtcars$cyl)

#Plotting a bar chart
barplot(cylinders)

#plotting a default x-y hart
plot(cylinders)

#For data that is quantitative, scaled, measured, interval or ratio level - for these kind of data we plot an histogram.

#plotting an histogram for each of the iris columns
hist(iris$Sepal.Length) #For sepal_length
hist(iris$Sepal.Width) #For sepal_length
hist(iris$Petal.Length) #For sepal_length
hist(iris$Petal.Width) #For sepal_length

#Since there are multiple species for which graphs need to be plotted hence, i'll put the graphs into three rows and one column.
par(mfrow = c(3,1))

#Histogram for each species using options provided
hist(iris$Petal.Width [iris$Species =='setosa'],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal length for setosa",
     xlab = "",
     col = "red")
hist(iris$Petal.Width [iris$Species =='versicolor'],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal length for setosa",
     xlab = "",
     col = "purple")
hist(iris$Petal.Width [iris$Species =='virginica'],
     xlim = c(0,3),
     breaks = 9,
     main = "Petal length for setosa",
     xlab = "",
     col = "red")

#Changing back the par to bring it to original state
par(mfrow = c(1,1))

#We plot scatterplots when we need to visualize the association between two quantitative variables.

#Whenever we need to check for associations, it is always better to check univariate distributions first.
hist(mtcars$wt)
hist(mtcars$mpg)

#Now making a regular plot after analyzing the above data
plot(mtcars$wt, mtcars$mpg,
     main = "Correlation_plot",
     xlab = "car_weight",
     ylab = "gasoline_average",
     pch = 19, #converting the hollow discs into solid
     cex = 1.5, #making the circles 150% of its size
     col = "red"
     )

#In order to increase the information density we can overlay plots.

head(lynx)
hist(lynx)

#Adding a normal distribution
curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)),
      col = "red", #color of the curve
      lwd = 2, #line width of 2 pixels
      add = TRUE) #superimpose on previous graph

#Adding kernel density estimators to 
lines(density(lynx), col = "blue", lwd = 2)
lines(density(lynx, adjust = 3), col = "purple", lwd = 2)

#Adding a rug plot to the existing plot
rug(lynx, lwd = 2, col = "magenta")

#In order to get statitical outup we can also run summary functions
summary(iris$Species) #Categorical Variable
summary(iris$Sepal.Length) #Quantitative Variable
summary(iris) #Entire Dataset

#If we want to get more detail then the one that is offered from the summary function then, we can run the describe function on the dataset.
#The describe function is used for quantitative variables only and not for categorical data.

psych::describe(iris) #here i have written psych:: in order to specify the library from which this function needs to be picked up.
psych::describe(iris$Sepal.Length)

#If i want to plot a histogram by selecting a specefic category
hist(iris$Sepal.Length[iris$Species =="setosa"],
     main = "setota_histogram",
     xlab = "length")

#If i want to select by value (for example by petal length), then
hist(iris$Petal.Length[iris$Petal.Length < 3],
     main = "histogram",
     xlab = "petal length")

#If i want to set multiple variables, then
hist(iris$Petal.Length[iris$Petal.Length < 2 & iris$Species == "setosa"],
     main = "Histogram",
     xlab = "Petal Length (Setosa)")

#If i want to do same operation multiple times, then i can create a subset and call it each time.
i.setosa <- iris[iris$Species == "setosa",] #here i have not written anything after comma so that i select all data (since the formal is like data[rows, columns])

#Now if i want to visualize the subset then,
plot(i.setosa$Petal.Length)

#Types of data formats available in R are - Vectors, Data Frame, Matrix/array, List
#Vectors - 1 or more number on a 1 dimensional array, all data is of the same type (for example - all character or all integers), it can be said that a vector is a basic data object of r
#Matrix - It has rows and columns, it is two dimensional data, all the columns need to be of the same length, all the data needs to be of the same class, columns are not named and are referred by their index numbers.
#Array - It is identical to a matrix but is of 3 or more dimensions.
#Data frame - Can have vectors of multiple types, all needs to be of the same length, 
#list - Most flexible data format, ordered collection of elements, Any class- length - structure, it can include other lists as well.

#Coercion - changing a data object from one type to another.

#In order to check data type of a variable we can,
x <- 15
typeof(x)

#Vector - It is a one dimensional collection of objects.
v <- c(1,2,3,4,5) #c is written for concatenation here.

is.vector(v) # tells if the variable is of a certain type (vector here)

is.numeric(x) # tells if the variable is of a certain type (numeric here)

#Now we can create multidimensional vector - matrix
m <- matrix(c(T,T,T,F,F,T), nrow = 2)

#I can also self specify the order and elements in a row - 
m1 <- matrix (c("a", "b",
                "c", "d"),
              nrow = 2,
              byrow = T)

#Creating an array from the given data
a <- array(c(1:2), c(4,3,2)) #Here 1:24 signifies the random number for each cell should be between 1 & 24 (both inclusive) and 4,3, 2 signifies (number of rows - 4, number of columns - 3 and number of tables - 2)

#I can also combine vectors of the same length
num <- c(1,2,3)
char <- c("a", "b", "c")
logi <- c(T,F,F)

comb <- cbind(num, char, logi) #cbind combines the three vectors into 1 matrix. But it will keep all the elements of the matrix in the same datatype.

df <- as.data.frame(cbind(num, char, logi)) #Doing this eliminates the earlier problem and preserves the datatype.

list <- list(num, char, logi) #This will create a list using the above vectors.

#We can also nest lists inside one another, like -
list2 <- list(num, char, logi, list)

#Coercion - 

#In automatic coercion, the elements will go to the least restrictive data type.
coerc <- c(1, "a", TRUE)

#Coercing numeric to integer type
co <- as.integer(5) #We can interchange types using the as.<data type>() keyword
typeof(co) #This function is used to return the data type for a given variable.

#Coerce matrix to data frame
mat <- matrix(1:9,  nrow = 3) #Creates a matrix of 3*3 using random numbers between 1 to 9
data_frame <- as.data.frame(mat) #Coverts the matrix into a dataframe 
is.data.frame(data_frame) #Returns logical value of the variable.

(x <- 1:5) #If we put enclose the code line in (), then we don't need to call the variable again for output as it will automatically return the output. 
(y <- 1:20)
#We can also combine variables into one 
(m <- cbind.data.frame(x,y)) #this will create a data frame by combining the variables x & y

#Methods to add data in r - colon, seq, c(concatenate), scan and, rep.

#Seq - If we want to generate a series we can use 
(s <- seq(10, 4, by = -2))
 
#Scan - When we want to feed in live data we use this function (To exit loop, press enter/return twice)
(d <- scan())

#Rep - This is used to replicate/duplicate the data
(f <- rep("yoyo", 4))

(g <- rep(c("Honey", "Lemon"), 5)) #This will repeat each element one by one to the desired input value

(h <- rep(c("Honey", "Lemon"), each = 5)) #This will repeat each element but instead of doing one by one alternate, it will first repeat the first element the given number of times then proceed on repeating the next element.

#rio - It combines all of R's import functions into one simple utility.

rio_csv <- import("/Users/pranjal/Downloads/ImportingData_Datasets/mbb.csv") #The import function is used to import files into R for further processing.

head(rio_csv) #The head function returns the top 5 rows in the dataframe.

View(rio_csv) #This function is used to view the full file as a sortable excel file.

#Hierarichal Clustering
head(mtcars)

#Selecting a subset of the dataset.
cars <- mtcars[, c(1:4, 6:7, 9:11)] #space before comma inside [] tells r to select all rows, the selection after , is of the columns, here we are telling r to select 1st to 4th column(included), then skip 5th column and select 6th and 7th columns and so on.

#In order to create hierarichal clustering, we need to use pipes from dplyr.

hc <- cars %>% #This will get cars data.
      dist %>% #This will compute distance dissimilarity matrix.
      hclust   #This will compute the heirarichal clusters.

plot(hc)  #This will plot a dendogram

#In order to add boxes to the plots we can,
rect.hclust(hc, k = 2, border = "red")
rect.hclust(hc, k = 10, border = "magenta")

#Principal component Analysis - Also known as dimensionality reduction. -It is used to convert higher dimensional data into a lower dimensional data form. By doing PCA, for example we are able to convert 2D data into 1D data while retaining the most important information all while making the analysis and interpretation more reliable.
#Steps in PCA (2D to 1D conversion) - 
      #1. Take two variables.
      #2. Plot a regression line.
      #3. Draw perpendicular distance between each point and the line.
      #4. Collapse the points into the line itself.
      #5. Rotate as per requirement.

pc <- prcomp(cars,
             center = TRUE, #This will move the data so that the means of the other variables is zero.
             scale = TRUE #This compresses or expands the range of the data so that all of them are in the same scale, also this means that no data point is able to skew the entire analysis.
             )
summary(pc)
plot(pc)

#In order to see the cases load on the PC, we can-
predict(pc) %>% round(2)

biplot(pc) #This will create a biplot of the first two PCA components. 

#Regression - Use many variables to predict scores on 1 variable.

head(USJudgeRatings)
data <- USJudgeRatings
#Defining variable groups.

x <- as.matrix(data[-12]) #This will pick all data except from column 12.
y <- data[,12]

#Using variable groups to plot regression with simultaneous entry.
reg <- lm(y~x) #Here it conveys that all independent variables (contained in x) should be used to predict y (dependent variable). lm stands for linear model. Tilda (~) tells y is a function of x/ y is predicted by x. And, here x is all the varibles used as predictors.

plot(reg) #This will plot the y and x relation for each variable one by one.

#We can also specify variables individually
reg2 <- lm(RTEN ~ CONT + INTG + DMNR + DILG + CFMG + DECI + PREP + FAMI + ORAL + WRIT + PHYS,
           data = USJudgeRatings)

reg2 #This will return the coefficients only
summary(reg2) #This will return the inferential tests on each coefficients

anova(reg2) #This will return the analysis of variance of coefficients wrt inferential tests.
coef(reg2) #This will return the coefficients.
confint(reg2) #This will return the confidence interval for the coefficients.
resid(reg2) #This will return the residuals on a case by case basis.
hist(resid(reg2)) #This will create a histogram from the residuals.

#lars - least angle regression
#caret - classification and regression training

stepwise <- lars(x,y, type = "stepwise") #This will create conventional stepwise regression.
plot(stepwise)

stagewise <- lars(x,y, type = "forward.stagewise") #This will create stepwise regression but with better generalizability.
plot(stagewise)

lar <- lars(x,y, type = "lar") #Least angle regression
plot(lar)

lasso <- lars(x,y, type = "lasso") #Least absolute shrinkage and selection operator
plot(lasso)

#We can also compare the R-square values for the new models.
r2comp <- c(stepwise$R2[6], stagewise$R2[6], lar$R2[6], lasso$R2[6]) %>%
            round(2)
names(r2comp) <- c("stepwise", "stagewise", "lar", "lasso")
r2comp #This will return the individual values of rsquare


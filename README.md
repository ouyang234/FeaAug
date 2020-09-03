
<!-- README.md is generated from README.Rmd. Please edit that file -->
Feature Augmentation (FeaAug)
=============================

<!-- badges: start -->
<!-- badges: end -->
This package aims to improve the accuracy of classification models by transfroming the original features into new features that are of better quality.

In version 0.2.2, this can be accomplished by the function "LMDRT". The function "LMDRT" implements the logarithm marginal density ratios transformation to reach the goal, which greatly improves the detection capability of an SVM-based detection model in NSL-KDD dataset. Other classifiers can also be employed to replace SVM.

Installation
------------

You can download the package from Github and run the following:

``` r
#install.packages('path/LMDRTSVM_0.2.2.tar.gz', repos = NULL, type = 'source')
```

Example
-------

This is a basic example which shows you how to apply the function "LMDRT":

``` r
library(e1071)
library(parallel)
library(LMDRTSVM)
intest = subnum(rawdata, k = 10)[[1]]
test = rawdata[intest,]
training = rawdata[-intest,]
data = LMDRT(training, test, 'class', c('normal', 'attack'), T)
traindata = data$traindata
testdata = data$testdata
head(traindata)[,1:6]  # the first six rows and six columns of train dataset
#>            [,1]       [,2]      [,3]      [,4]      [,5]      [,6]
#> [1,] -0.8898281 -0.3597215 -1.163795 -1.964229 -11.03292 -8.736874
#> [2,] -0.8898281 -1.8098573  1.222764 -1.964229 -11.03293 -8.736874
#> [3,] -0.8898281 -0.3597215  2.759519  4.257537 -11.03293 -8.736874
#> [4,] -0.8898281 -0.3597215  1.222764  4.257537 -11.03293 -8.736874
#> [5,] -0.8898281 -0.3597215  2.759519  4.257537 -11.03293 -8.736874
#> [6,] -0.8898281 -0.3597215  2.759519  4.257537 -11.03293 -8.736874
head(testdata)[,1:6] # the first six rows and six columns of test dataset
#>            [,1]       [,2]      [,3]       [,4]      [,5]      [,6]
#> [1,] -0.8898281 -0.3597215  1.222764  0.8666517 -11.03293 -8.736874
#> [2,] -0.8898281 -0.3597215 -2.791891 -1.9642294 -11.03292 -8.736857
#> [3,] -0.8898281 -0.3597215  1.222764  4.2575369 -11.03293 -8.736874
#> [4,] -0.8898281  1.4733495  2.561050 -1.9642294 -11.03291 -8.736874
#> [5,] -0.8898281 -0.3597215 -2.791891 -1.9642294 -11.03292 -8.736785
#> [6,] -0.8898281 -1.8098573 -2.787545 -1.9642294 -11.03293 -8.736869
```

Main Reference
--------------

Wang H , Gu J , Wang S . An effective intrusion detection framework based on SVM with feature augmentation\[J\]. Knowledge-Based Systems, 2017, 136(Nov.15):130-139.

Authors list
------------

For this version of package (LMDRTSVM\_0.2.2), the authors are:

Jie Gu, Yue Zheng Ouyang, and Shan Lu (<shan.lu@cufe.edu.cn>).

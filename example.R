library(e1071)
library(parallel)
install.packages('LMDRTSVM_0.2.0.tar.gz',repos=NULL,type='source')
library(LMDRTSVM)

intest=subnum(rawdata,k=10)[[1]]
test=rawdata[intest,]
training=rawdata[-intest,]
groups=subgroup(training,'class',c('attack','normal'))
d0=groups[[1]]
d1=groups[[2]]
train=groups[[3]]
data=trans(train=train,test=test,d0,d1,yname='class',yflag=T)
traindata=data[[1]]
testdata=data[[2]]
svm0(yflag=T,train,test,'class')
svm0(yflag=F,train,test[,-40],'class')
svm1(yflag=T,traindata,testdata,ytrain=train[,40],ytest=test[,40])
svm1(yflag=F,traindata,testdata,ytrain=train[,40])
svm2(yflag=T,traindata,train,testdata,test,'class')
svm2(yflag=F,traindata,train,testdata,test[,-40],'class')
LMDRT(training,test,'class',c('normal','attack'),T)
classifier(training,test,'class',c('normal','attack'),T,c('scmf','svmt'))
crossValidation(rawdata,'class',c('attack','normal'),k=2)


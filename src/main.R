# setwd("~/Kaggle/JobSalaryPrediction")
# require("ProjectTemplate")
# create.project()

setwd("~/Kaggle/JobSalaryPrediction/Job Salary Prediction")
require("ProjectTemplate")

load.project()

# data used in the model

save( list = ls(pattern="DTB"), file=paste( getwd(),'/cache/DTB.RData',sep='') )
load(file=paste( getwd(),'/cache/DTB.RData',sep=''))

# corpus used in the model

save( list = ls(pattern="Corpora"), file=paste( getwd(),'/cache/Corpora.RData',sep='') )
load(file=paste( getwd(),'/cache/Corpora.RData',sep=''))

# small subset to get my procedure tested
set.seed(123234)
ind <- sample.int(n = dim(Train_DTB)[1], size = 1000, replace = FALSE)
Train_DTB_small <- Train_DTB[ind,]
DTB <- Train_DTB_small
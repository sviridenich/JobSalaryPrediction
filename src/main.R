# setwd("~/Kaggle/JobSalaryPrediction")
# require("ProjectTemplate")
# create.project()

setwd("~/Kaggle/JobSalaryPrediction/Job Salary Prediction")
require("ProjectTemplate")

load.project()

# data used in the model
save( list = ls(pattern="DTB"), file='~/cache/DTB.R' )
load(file='~/cache/DTB.R')


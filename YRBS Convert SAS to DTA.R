setwd("/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files")

library("sas7bdat")
data = read.sas7bdat("/Users/Kevin/Documents/SASUniversityEdition/myfolders/Individual State Raws/Texas 2017/txyrbs2017.sas7bdat")
library(foreign)
write.dta(data, "txyrbs2017.dta")

library("sas7bdat")
data = read.sas7bdat("/Users/Kevin/Documents/SASUniversityEdition/myfolders/Individual State Raws/Vermont 2017/vtyrbs2017.sas7bdat")
library(foreign)
write.dta(data, "vtyrbs2017.dta")

library("sas7bdat")
data = read.sas7bdat("/Users/Kevin/Documents/SASUniversityEdition/myfolders/Individual State Raws/New Mexico 2017/nmyrbs2017.sas7bdat")
library(foreign)
write.dta(data, "nmyrbs2017.dta")

library("sas7bdat")
data = read.sas7bdat("/Users/Kevin/Documents/SASUniversityEdition/myfolders/Individual State Raws/Massachusetts 2017/MAH_yrbs2017.sas7bdat")
library(foreign)
write.dta(data, "MAHyrbs2017.dta")

library("sas7bdat")
data = read.sas7bdat("/Users/Kevin/Documents/SASUniversityEdition/myfolders/Individual State Raws/Maryland 2017/mdyrbs2017.sas7bdat")
library(foreign)
write.dta(data, "mdyrbs2017.dta")


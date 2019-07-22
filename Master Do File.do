capture log close
set more 1 
clear all
****************************************************
*** MASTER YRBS DATASET CONTAINING VARIABLES FOR ***
*** MULTIPLE PROJECTS WITHIN CHEPS ORG           ***
****************************************************
program define setcd // // INSERT CAPTURE CONTROL DIRECTORY HERE TO MASTER DO YRBS FOLDER, REMEMBER TO GO INTO THOSE FILES AND SET CD PATHS AS NEEDED
capture cd "/Users/Kevin/Documents/YRBS-Master-Dataset" // KEVIN
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\YRBS-Master-Dataset\2017 Individual State Do" // CAL
capture cd "F:\YRBS\State" // ALICIA
// INSERT CD HERE
// INSERT CD HERE
end
********************************************************************
*** RUN INDIVIDUALLY GATHERED STATE YRBS CLEANING DO FILES       ***
********************************************************************
foreach state in Vermont Texas "New Mexico" Massachusetts Maryland {
capture cd "/Users/Kevin/Documents/YRBS-Master-Dataset/2017 Individual State Do"
do "`state' 2017.do"
}
********************************************************************
***               RUN NATIONAL YRBS DO FILE                      ***
********************************************************************
setcd
do "National YRBS.do"
********************************************************************
***                  GENERATE SEER WEIGHTS                       ***
********************************************************************
setcd
do "Seer_Weight.do"
********************************************************************
*** RUN STATE YRBS MASTER FILE (USING 2015 YRBS AND ADDING 2017) ***
***    THIS FILE ALSO COMBINES ALL ABOVE YRBS FILES TOGETHER     ***
********************************************************************
setcd
do "YRBS State 2017 Master File.do"

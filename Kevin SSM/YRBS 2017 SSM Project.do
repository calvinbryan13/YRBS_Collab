***********************************************
* FINALIZE THE DATASET FOR YRBS SSM PROJECT ***
***********************************************
use "Combined2017.dta", clear
drop if inrange(year, 1991, 1998)
drop if weight==.

replace national=0 if national!=1
*Time variable
qui gen time=1 if year==1999
qui replace time=3 if year==2001
qui replace time=5 if year==2003
qui replace time=7 if year==2005
qui replace time=9 if year==2007
qui replace time=11 if year==2009
qui replace time=13 if year==2011
qui replace time=15 if year==2013
qui replace time=17 if year==2015
qui replace time=19 if year==2017

tab antiyear
qui gen antienacted=0 if (year<antiyear | antiyear==0)
qui replace antienacted=1 if year>=antiyear & antiyear!=0
tab antienacted

replace grade = 0 if grade == .  // not used to be here
egen stategrade=group(fips grade)
* tab stategrade
* 198 clusters
*** Create new grade with no missing
qui gen grade_new = grade
qui replace grade_new=13 if grade==.
egen stategrade2=group(fips grade_new)
gen missing_grade = grade==.

*** STATE YRBS 
qui gen ssmlead2p_wave2015 = 0
qui replace ssmlead2p_wave2015 = 1 if year <= eyear-4 & eyear!=0 
qui gen ssmlead1_wave2015 = 0
qui replace ssmlead1_wave2015=1 if year==eyear-2 & eyear!=0 
qui gen ssm_lawwave2015 =0
qui replace ssm_lawwave2015=1 if year==eyear & eyear!=0 
qui gen ssmlag1p_wave2015 = 0 
qui replace ssmlag1p_wave2015 = 1 if year >= eyear+2 & eyear!=0 
capture gen dummy=0

*** STATE YRBS 2017
gen nostateeyear = eyear==0 
replace eyear=2017 if eyear==0 | eyear==.

qui gen ssmenacted_wave=0 if (eyear>year | eyear==0) 
qui replace ssmenacted_wave=1 if eyear<=year & eyear!=0 
qui gen ssmlead2p_wave = 0 
qui replace ssmlead2p_wave = 1 if year <= eyear-4 & eyear!=0
qui gen ssmlead1_wave = 0 
qui replace ssmlead1_wave=1 if year==eyear-2 & eyear!=0 
qui gen ssm_lawwave =0 
qui replace ssm_lawwave=1 if year==eyear & eyear!=0 
qui gen ssmlag1p_wave = 0
qui replace ssmlag1p_wave = 1 if year >= eyear+2 & eyear!=0 
gen seer_year = year

merge m:1 fips seer_year age_new race4 male female using "seer_weights.dta"
***UNMERGED_1 A RESULT OF MISSINGS IN age_new/race4/male(female)
***UNMERGED_2 A RESULT OF NON YRBS YEARS+MISSING State-Years

drop if _merge==2
drop _merge

	label variable ssmlead2p_wave "2+ Waves Prior"
	label variable dummy "1 Wave Prior"
	label variable ssmenacted_wave "SSM Enacted"
	label variable ssm_lawwave "Wave SSM Enacted"
	label variable ssmlag1p_wave "1+ Waves After"

save "YRBS_17_ALL.dta", replace


***********************************************
* FINALIZE THE DATASET FOR YRBS ABL PROJECT ***
***********************************************

* INSERT HERE RESTRICTIONS 



*************************************************
* FINALIZE THE DATASET FOR YRBS BULLY PROJECT ***
*************************************************

* INSERT HERE RESTRICTIONS


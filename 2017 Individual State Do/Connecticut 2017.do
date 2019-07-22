**********************************
*** CONNECTICUT  2017 YRBS *******
**********************************
capture cd "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files"
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State"
capture cd "F:\YRBS\State"
************************************************************************************************
clear
set more 1 
/*
* Convert CT and CT_QN to .dta format
import excel "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Individual State Raws/2017 CT YRBS/CTHq.xlsx", sheet("CTHq") firstrow clear
save "CTHq.dta", replace
import excel "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Individual State Raws/2017 CT YRBS/CTHqn.xlsx", sheet("CTHqn") firstrow clear
save "CTHqn.dta", replace

use "CTHq.dta", clear
merge 1:m record using "CTHqn.dta"
drop _merge
save "CTH_2017.dta", replace
*/
use "CTH_2017.dta", clear

drop if weight==.

*** AGE VARIABLES ***
rename q1 age
destring age, replace
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(age, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(age,1,3)
tab age14
***Age 15
qui gen age15 = 0 if inlist(age, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if age == 4
tab age15
***Age 16
qui gen age16 = 0 if inlist(age, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if age == 5
tab age16
***Age 17
qui gen age17 = 0 if inlist(age, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if age == 6
tab age17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(age, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if age == 7
tab age18
***Actual Age
qui gen age_new = age + 11
tab age_new

*** RACE VARIABLES ***
encode raceeth, gen(race) // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:
destring q4, replace
/* 
            |         59        2.43        2.43  Missing
          1 |         13        0.54        2.97  American Indian
          2 |        119        4.91        7.88  Asian
          3 |        242        9.98       17.86  Black
          4 |          7        0.29       18.14  Native Hawaiin/Pacific
          5 |      1,145       47.22       65.36  White
          6 |        213        8.78       74.14  Hispanic
          7 |        490       20.21       94.35  Hispanic Multiple
          8 |        137        5.65      100.00  Multiple Non Latino

*/

gen race4=.
replace race4=1 if inlist(race,5) & q4==2
replace race4=2 if inlist(race,3) & q4==2
replace race4=3 if inlist(race,6,7) & q4==1
replace race4=3 if race4==. & q4==1
replace race4=4 if inlist(race,1,2,4,8) & q4==2

*** White
gen white = 0 if inlist(race4,2,3,4)
replace white = 1 if race4==1
*** Black
gen black = 0 if inlist(race4,1,3,4)
replace black = 1 if race4==2

*** Hispanic
gen hispanic = 0 if inlist(race4,1,2,4)
replace hispanic = 1 if race4==3

*** Other Race
gen otherrace = 0 if inlist(race4,1,2,3) 
replace otherrace = 1 if race4==4


*** RACE VARIABLES 2(hispanic without mixed) *** 
*** White
gen race4_new=.
replace race4_new=1 if inlist(race,5) & q4==2
replace race4_new=2 if inlist(race,3) & q4==2
replace race4_new=3 if inlist(race,6) & q4==1
replace race4_new=3 if race4_new==. & q4==1
replace race4_new=4 if inlist(race,1,2,4,7,8) 

*** White
gen white2 = 0 if inlist(race4_new,2,3,4)
replace white2 = 1 if race4_new==1
*** Black
gen black2 = 0 if inlist(race4_new,1,3,4)
replace black2 = 1 if race4_new==2

*** Hispanic
gen hispanic2 = 0 if inlist(race4_new,1,2,4)
replace hispanic2 = 1 if race4_new==3

*** Other Race
gen otherrace2 = 0 if inlist(race4_new,1,2,3) 
replace otherrace2 = 1 if race4_new==4

*** SEX VARIABLES ***
rename q2 sex
destring sex, replace
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
tab male
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1
tab female


*** SUICIDE ATTEMPT VARIABLE ***
destring q28, replace
tab q28
qui gen suicideattempt = 0 if q28==1
qui replace suicideattempt = 1 if inrange(q28,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
destring q25, replace
tab q25
qui gen depression = 0 if q25==2
qui replace depression = 1 if q25==1
tab depression

*** SUICIDE IDEATION ***
destring q26, replace
tab q26
qui gen suicideideation = 0 if q26==2
qui replace suicideideation = 1 if q26==1
tab suicideideation

*** SUICIDE PLAN *** MISSING

*** SEX MINORITY VARIABLES ***
destring q67, gen(sexid)
tab sexid
qui gen sexminority=1 if inrange(sexid,2,4)
qui replace sexminority=0 if sexid==1
tab sexminority
qui gen heterosexual=1 if sexid==1
qui replace heterosexual=0 if inrange(sexid,2,4)
tab heterosexual

gen sexidentity = 1 if inrange(sexid,2,3)
replace sexidentity = 0 if sexid==1

** JUICE CONSUMPTION ***
tab q70
destring q70, replace
qui gen juiceconsump=1 if inrange(q70,2,7)
qui replace juiceconsump=0 if q70==1
tab juiceconsump

*** CARROT CONSUMPTION ***
tab q74
destring q74, replace
qui gen carrotconsump=1 if inrange(q74,2,7)
qui replace carrotconsump=0 if q74==1
tab carrotconsump

*** SEATBELT USE ***
tab q8
destring q8, replace
qui gen nrseatbelt=1 if inrange(q8,1,2)
qui replace nrseatbelt=0 if inrange(q8,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
destring q3, replace
rename q3 grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

*** SMOKER CONSUMPTION ***
sort q32
encode q32, gen(smk)
gen smoke = . 
replace smoke = 0 if smk==1
replace smoke = 1 if inrange(smk,2,7)

*** ALCOHOL CONSUMPTION ***
sort q42
encode q42, gen(alc)
gen alcohol = . 
replace alcohol = 0 if alc==1
replace alcohol = 1 if inrange(alc,2,7)

*** BINGE DRINKING ***
destring q44, replace
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*Marijuana Use in Past 30 Days
destring q48, replace
gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6) 
replace marijuana30=0 if q48==1 
sum marijuana30

*BULLY
destring q23, replace
gen bullied=.
replace bullied=0 if q23==1
replace bullied=1 if inrange(q23,2,7)

destring q24, replace
gen ebullied=.
replace ebullied=0 if q24==2
replace ebullied=1 if q24==1

gen year = 2017

drop if weight==.
gen fips = 9
gen state = "Connecticut" 

save "CT_labeled_2017.dta", replace

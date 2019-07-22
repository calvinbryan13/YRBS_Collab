capture log close
set more 1 
clear
****************************************************
*** MASTER YRBS DATASET CONTAINING VARIABLES FOR ***
*** MULTIPLE PROJECTS WITHIN CHEPS ORG           ***
****************************************************
capture cd "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files"
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data"
capture cd "F:\YRBS\State"
// INSERT CAPTURE CONTROL DIRECTORY HERE
*****************************************************
* Create Variables of Interest for the main dataset *
*****************************************************
use "State15.dta", clear
drop if weight==.

*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(age, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(age,1,3)
***Age 15
qui gen age15 = 0 if inlist(age, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if age == 4
***Age 16
qui gen age16 = 0 if inlist(age, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if age == 5
***Age 17
qui gen age17 = 0 if inlist(age, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if age == 6
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(age, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if age == 7
***Actual Age
qui gen age_new = age + 11

*** RACE VARIABLES ***
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1

*** SUICIDE IDEATION ***
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
tab suicideideation

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(sexid,2,4)
qui replace sexminority=0 if sexid==1
qui gen heterosexual=1 if sexid==1
qui replace heterosexual=0 if inrange(sexid,2,4)

gen sexidentity = 1 if inrange(sexid,2,3)
replace sexidentity = 0 if sexid==1
*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1

*** SEATBELT USE ***
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)

*** GRADE/CLASSROOM ***
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5

*** CIGARETTE USE *** (Q33 During the past 30 days, on how many days did you smoke cigarettes?)
gen smoke = .
replace smoke = 0 if q33==1
replace smoke = 1 if inrange(q33,2,7)

*** ALCOHOL USE *** (43 During the past 30 days, on how many days did you have at least one drink of alcohol?)
gen alcohol = .
replace alcohol = 0 if q43==1
replace alcohol = 1 if inrange(q43,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*** MARIJUANA USE ***
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 

*** BULLYING *** Q24. During the past 12 months, have you ever been bullied on school property?
gen bullied=.
replace bullied=0 if q24==2
replace bullied=1 if q24==1
 
*** E-BULLYING *** Q25. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
gen ebullied=.
replace ebullied=0 if q25==2
replace ebullied=1 if q25==1

*** 
save "State15_labeled.dta", replace
********************************************************************************
* Combine STATE A-Z (from https://www.cdc.gov/healthyyouth/data/yrbs/data.htm) *
********************************************************************************
/*
* Convert State A-M Q and QN to .dta format
import delimited "States_A_M_2017.csv", clear
save "States_A_M_2017.dta", replace

import delimited "StatesQN_A_M_2017.csv", clear
save "StatesQN_A_M_2017.dta", replace
* Combine State A-M Q and QN into State1.dta
use "States_A_M_2017.dta", clear
merge 1:m record using "StatesQN_A_M_2017.dta"
drop _merge
save "State1_2017.dta", replace

* Convert State N-Z Q and QN to .dta format
import delimited "States_N_Z_2017.csv", clear
save "States_N_Z_2017.dta", replace
import delimited "StatesQN_N_Z_2017.csv", clear
save "StatesQN_N_Z_2017.dta", replace
* Combine State N-Z Q and QN into State2.dta
use "States_N_Z_2017.dta", clear
merge 1:m record using "StatesQN_N_Z_2017.dta"
drop _merge
save "State2_2017.dta", replace

* Combine merged Q and QN for A-M and N-Z into State.dta
use "State1_2017.dta", clear
append using "State2_2017.dta"
save "State_2017.dta", replace

*****************************
* CREATE VARIABLES IN STATE *
*****************************
qui gen fips=.
qui replace fips=1 if sitecode=="AL"
qui replace fips=2 if sitecode=="AK"
qui replace fips=4 if sitecode=="AZB"
qui replace fips=5 if sitecode=="AR"
qui replace fips=6 if sitecode=="CA"
qui replace fips=8 if sitecode=="CO"
qui replace fips=9 if sitecode=="CT"
qui replace fips=10 if sitecode=="DE"
qui replace fips=11 if sitecode=="DC"
qui replace fips=12 if sitecode=="FL"
qui replace fips=13 if sitecode=="GA"
qui replace fips=15 if sitecode=="HI"
qui replace fips=16 if sitecode=="ID"
qui replace fips=17 if sitecode=="IL"
qui replace fips=18 if sitecode=="IN"
qui replace fips=19 if sitecode=="IA"
qui replace fips=20 if sitecode=="KS"
qui replace fips=21 if sitecode=="KY"
qui replace fips=22 if sitecode=="LA"
qui replace fips=23 if sitecode=="ME"
qui replace fips=24 if sitecode=="MD"
qui replace fips=25 if sitecode=="MA"
qui replace fips=26 if sitecode=="MI"
qui replace fips=27 if sitecode=="MN"
qui replace fips=28 if sitecode=="MS"
qui replace fips=29 if sitecode=="MO"
qui replace fips=30 if sitecode=="MT"
qui replace fips=31 if sitecode=="NE"
qui replace fips=32 if sitecode=="NV"
qui replace fips=33 if sitecode=="NH"
qui replace fips=34 if sitecode=="NJ"
qui replace fips=35 if sitecode=="NM"
qui replace fips=36 if sitecode=="NY"
qui replace fips=37 if sitecode=="NC"
qui replace fips=38 if sitecode=="ND"
qui replace fips=39 if sitecode=="OH"
qui replace fips=40 if sitecode=="OK"
qui replace fips=41 if sitecode=="OR"
qui replace fips=42 if sitecode=="PA"
qui replace fips=44 if sitecode=="RI"
qui replace fips=45 if sitecode=="SC"
qui replace fips=46 if sitecode=="SD"
qui replace fips=47 if sitecode=="TN"
qui replace fips=48 if sitecode=="TX"
qui replace fips=49 if sitecode=="UT"
qui replace fips=50 if sitecode=="VT"
qui replace fips=51 if sitecode=="VA"
qui replace fips=53 if sitecode=="WA"
qui replace fips=54 if sitecode=="WV"
qui replace fips=55 if sitecode=="WI"
qui replace fips=56 if sitecode=="WY"

label define state_names 1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas" 6 ///
"California" 8 "Colorado" 9 "Connecticut" 10 "Delaware" 11 "District of Columbia" ///
12 "Florida" 13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois" 18 "Indiana" ///
19 "Iowa" 20 "Kansas" 21 "Kentucky" 22 "Louisiana" 23 "Maine" 24 "Maryland" ///
25 "Massachusetts" 26 "Michigan" 27 "Minnesota" 28 "Mississippi" 29 ///
"Missouri" 30 "Montana" 31 "Nebraska" 32 "Nevada" 33 "New Hampshire" 34 ///
"New Jersey" 35 "New Mexico" 36 "New York" 37 "North Carolina" 38 ///
"North Dakota" 39 "Ohio" 40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania" 44 ///
"Rhode Island" 45 "South Carolina" 46 "South Dakota" 47 "Tennessee" 48 ///
"Texas" 49 "Utah" 50 "Vermont" 51 "Virginia" 53 "Washington" 54 "West Virginia" ///
55 "Wisconsin" 56 "Wyoming"
label values fips state_names

save "State17.dta", replace
tab year
*/
*/
*****************************************************
* Create Variables of Interest for the main dataset *
*****************************************************
use "State17.dta", clear
drop if weight==.

*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(age, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(age,1,3)
***Age 15
qui gen age15 = 0 if inlist(age, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if age == 4
***Age 16
qui gen age16 = 0 if inlist(age, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if age == 5
***Age 17
qui gen age17 = 0 if inlist(age, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if age == 6
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(age, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if age == 7
***Actual Age
qui gen age_new = age + 11
*** RACE VARIABLES ***
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if q28==1
qui replace suicideattempt = 1 if inrange(q28,2,5)

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if q25==2
qui replace depression = 1 if q25==1

*** SUICIDE IDEATION ***
qui gen suicideideation = 0 if q26==2
qui replace suicideideation = 1 if q26==1

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if q27 == 2
qui replace suicideplan = 1 if q27==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(sexid,2,4)
qui replace sexminority=0 if sexid==1
qui gen heterosexual=1 if sexid==1
qui replace heterosexual=0 if inrange(sexid,2,4)

gen sexidentity = 1 if inrange(sexid,2,3)
replace sexidentity = 0 if sexid==1

*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(q70,2,7)
qui replace juiceconsump=0 if q70==1

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(q74,2,7)
qui replace carrotconsump=0 if q74==1

*** SEATBELT USE ***
qui gen nrseatbelt=1 if inrange(q8,1,2)
qui replace nrseatbelt=0 if inrange(q8,3,5)

*** GRADE/CLASSROOM ***
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5

*** CIGARETTE USE *** (Q32.During the past 30 days, on how many days did you smoke cigarettes?)
gen smoke = . 
replace smoke = 0 if q32==1
replace smoke = 1 if inrange(q32,2,7)


*** ALCOHOL USE *** (Q42.During the past 30 days, on howmany days did you have at least one drink of alcohol?)
gen alcohol = . 
replace alcohol = 0 if q42==1
replace alcohol = 1 if inrange(q42,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*** MARIJUANA IN PAST 30 DAYS ***
gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6) 
replace marijuana30=0 if q48==1 

*** BULLYING *** Q23. During the past 12 months, have you ever been bullied on school property?
gen bullied=.
replace bullied=0 if q23==2
replace bullied=1 if q23==1

*** E-BULLYING *** Q24. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
gen ebullied=.
replace ebullied=0 if q24==2
replace ebullied=1 if q24==1

keep if inrange(year,1999,2017) & sitecode=="HI" | year==2017

save "State17_labeled.dta", replace
******************************************************
* Create Variables of Interest for the Tam's dataset *
******************************************************
*Tam's dataset had missing states up to 2013.
use "state_yrbs_tam.dta", clear
drop if weight==.
label define state_names 8 "Colorado" 13 "Georgia" 18 "Indiana" 22 "Louisiana" ///
25 "Massachusetts" 35 "New Mexico" 39 "Ohio" 48 "Texas" 50 "Vermont"
label values fips state_names
drop _merge hispanic

*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inrange(age,15,18)
qui replace age14 = 1 if inrange(age,12,14)
***Age 15
qui gen age15 = 0 if inlist(age,12,13,14,16,17,18)
qui replace age15 = 1 if age == 15
***Age 16
qui gen age16 = 0 if inlist(age,12,13,14,15,17,18)
qui replace age16 = 1 if age == 16
***Age 17
qui gen age17 = 0 if inlist(age,12,13,14,15,16,18)
qui replace age17 = 1 if age == 17
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(age,12,13,14,15,16,17)
qui replace age18 = 1 if age == 18
***Actual Age
qui gen age_new = age

*** RACE VARIABLES ***
**Tam's code suggestion:
*race
*white=6; black=3; hispanic=4,7; other=1,2,5,8
*race_new
*white=5; black=3; hispanic=6,7; other=1,2,4,8
qui gen race4 = 1 if (race==6 | race_new==5)
qui replace race4 = 2 if (race==3 | race_new==3)
qui replace race4 = 3 if (inlist(race,4,7) | inlist(race_new,6,7))
qui replace race4 = 4 if (inlist(race,1,2,5,8) | inlist(race_new,1,2,4,8))
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if sex == 1
qui replace male = 1 if sex == 2
*** Female
qui gen female = 0 if sex == 2
qui replace female = 1 if sex == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if suicide_attempt==1
qui replace suicideattempt = 1 if inrange(suicide_attempt,2,5)

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if depressed==2
qui replace depression = 1 if depressed==1

*** SUICIDE IDEATION ***
qui gen suicideideation = 0 if suicide_consider==2
qui replace suicideideation = 1 if suicide_consider==1

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if suicide_plan == 2
qui replace suicideplan = 1 if suicide_plan==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(sex_orient,2,4)
qui replace sexminority=0 if sex_orient==1
qui gen heterosexual=1 if sex_orient==1
qui replace heterosexual=0 if inrange(sex_orient,2,4)

gen sexidentity = 1 if inrange(sex_orient,2,3)
replace sexidentity = 0 if sex_orient==1

*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(juice_times,2,7)
qui replace juiceconsump=0 if juice_times==1

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(carrots_times,2,7)
qui replace carrotconsump=0 if carrots_times==1

*** SEATBELT USE ***
qui gen nrseatbelt=1 if inrange(seatbelt,1,2)
qui replace nrseatbelt=0 if inrange(seatbelt,3,5)

*** GRADE/CLASSROOM ***
qui replace grade = 9 if grade_new == 2
qui replace grade = 10 if grade_new == 3
qui replace grade = 11 if grade_new == 4
qui replace grade = 12 if grade_new == 5
qui replace grade = 0 if inlist(grade_new,1,6)

*** CIGARETTE USE ***
gen smoke = . 
replace smoke = 0 if cigs_days == 1
replace smoke = 1 if inrange(cigs_days,2,7)

*** ALCOHOL USE *** 
gen alcohol = . 
replace alcohol = 0 if alch_days == 1 
replace alcohol = 1 if inrange(alch_days,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if alch_binge==1 
replace binge=1 if inrange(alch_binge,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(alch_binge,1,3) 
replace freq_binge=1 if inrange(alch_binge,4,7) 

*Marijuana Use in the Past 30 Days
gen marijuana30=.
replace marijuana30=1 if inrange(mj_30day_times,2,6) 
replace marijuana30=0 if mj_30day_times==1 


*** BULLYING *** bullied. During the past 12 months, have you ever been bullied on school property?
replace bullied=0 if bullied==2
replace bullied=1 if bullied==1

*** E-BULLYING *** ebullied. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
replace ebullied=0 if ebullied==2
replace ebullied=1 if ebullied==1


save "state_yrbs_tam_labeled.dta", replace
************************************************
* Create Variables of Interest for 2015 States *
************************************************
*****************
* Massachusetts *
*****************
/*
import delimited "MAHq.csv", clear
rename ïsite sitecode
qui gen fips=.
qui replace fips=25 if sitecode=="MA"
label define state_names 25 "Massachusetts"  
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="MA"
save "MAHq.dta", replace
*/
use "MAHq.dta", clear
drop if weight==.
*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
***Actual Age
qui gen age_new = q1 + 11

*** RACE VARIABLES ***
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1

*** SUICIDE IDEATION ***
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)

gen sexidentity = 1 if inrange(q68,2,3)
replace sexidentity = 0 if q68==1

*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE ***
/* Not asked
tab seatbelt
*mdesc seatbelt
qui gen nrseatbelt=1 if inrange(seatbelt,1,2)
qui replace nrseatbelt=0 if inrange(seatbelt,3,5)
tab nrseatbelt
*/

*** GRADE/CLASSROOM ***
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5

*** ALCOHOL USE *** 
gen alcohol = . 
replace alcohol = 0 if q43==1
replace alcohol = 1 if inrange(q43,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*** CIGARETTE USE ***
gen smoke = . 
replace smoke = 0 if q32==1
replace smoke = 1 if inrange(q32,2,7)

*** Marijuana Use in the Past 30 Days ***
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 

*** BULLYING *** Q24. During the past 12 months, have you ever been bullied on school property?
gen bullied=.
replace bullied=0 if q24==2
replace bullied=1 if q24==1

*** E-BULLYING *** Q25. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
gen ebullied=.
replace ebullied=0 if q25==2
replace ebullied=1 if q25==1


save "MAHq_labeled.dta", replace
use "MAHq_labeled.dta", clear

***********
* Vermont *
***********
/*
import delimited "VTAHq.csv", clear
qui rename ïsite sitecode
qui gen fips=.
qui replace fips=50 if sitecode=="VTA"
label define state_names 50 "Vermont" 
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="VTA"
save "VTAHq.dta", replace
*/
use "VTAHq.dta", clear
drop if weight==.

*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
***Actual Age
qui gen age_new = q1 + 11

*** RACE VARIABLES ***
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1

*** SUICIDE IDEATION ***
/* Not asked
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1
*/

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)

gen sexidentity = 1 if inrange(q68,2,3)
replace sexidentity = 0 if q68==1

*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1

*** SEATBELT USE ***
/* Not asked
qui gen nrseatbelt=1 if inrange(seatbelt,1,2)
qui replace nrseatbelt=0 if inrange(seatbelt,3,5)
*/

*** GRADE/CLASSROOM ***
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5

*** CIGARETTE USE *** 
gen smoke = . 
replace smoke = 0 if q33==1
replace smoke = 1 if inrange(q33,2,7)

*** ALCOHOL USE ***
gen alcohol = . 
replace alcohol = 0 if q43==1
replace alcohol = 1 if inrange(q43,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*** MARIJUANA USE *** 
gen marijuana30=.
replace marijuana30=1 if inrange(q49,2,6) 
replace marijuana30=0 if q49==1 

*** BULLYING *** Q24. During the past 12 months, have you ever been bullied on school property?
gen bullied=.
replace bullied=0 if q24==2
replace bullied=1 if q24==1

*** E-BULLYING *** Q25. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
gen ebullied=.
replace ebullied=0 if q25==2
replace ebullied=1 if q25==1

save "VTAHq_labeled.dta", replace
use "VTAHq_labeled.dta", clear

***********
* Indiana *
***********
/*
import delimited "INHq.csv", clear
qui rename ïsite sitecode
qui gen fips=.
qui replace fips=18 if sitecode=="IN"
label define state_names 18 "Indiana" 
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="IN"
save "INHq.dta", replace
*/
use "INHq.dta", clear
drop if weight==.

*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
***Actual Age
qui gen age_new = q1 + 11

*** RACE VARIABLES ***
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1

*** SUICIDE IDEATION ***
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)

gen sexidentity = 1 if inrange(q68,2,3)
replace sexidentity = 0 if q68==1

*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1

*** SEATBELT USE ***
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)

*** GRADE/CLASSROOM ***
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5

*** ALCOHOL USE ***
gen alcohol = . 
replace alcohol = 0 if q43==1
replace alcohol = 1 if inrange(q43,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*** CIGARETTE USE ***
gen smoke = . 
replace smoke = 0 if q33 == 1 
replace smoke = 1 if inrange(q33,2,7)

*** MARIJUANA USE *** 
gen marijuana30=.
replace marijuana30=0 if q49==1 
replace marijuana30=1 if inrange(q49,2,6) 

*** BULLYING *** Q24. During the past 12 months, have you ever been bullied on school property?
gen bullied=.
replace bullied=0 if q24==2
replace bullied=1 if q24==1

*** E-BULLYING *** Q25. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
gen ebullied=.
replace ebullied=0 if q25==2
replace ebullied=1 if q25==1

save "INHq_labeled.dta", replace
use "INHq_labeled.dta", clear

**************
* New Mexico *
**************
/*
import delimited "NMHq.csv", clear
qui rename ïsite sitecode
qui gen fips=.
qui replace fips=35 if sitecode=="NM"
label define state_names 35 "New Mexico" 
label values fips state_names
qui gen year=.
qui replace year=2015 if sitecode=="NM"
save "NMHq.dta", replace
*/
use "NMHq.dta", clear
drop if weight==.

*** AGE VARIABLES ***
***Age 14
*Category is described as 14 years or younger
qui gen age14 = 0 if inlist(q1, 4, 5, 6, 7)
qui replace age14 = 1 if inrange(q1,1,3)
***Age 15
qui gen age15 = 0 if inlist(q1, 1, 2, 3, 5, 6, 7)
qui replace age15 = 1 if q1 == 4
***Age 16
qui gen age16 = 0 if inlist(q1, 1, 2, 3, 4, 6, 7)
qui replace age16 = 1 if q1 == 5
***Age 17
qui gen age17 = 0 if inlist(q1, 1, 2, 3, 4, 5, 7)
qui replace age17 = 1 if q1 == 6
**Age 18
*Category is described as 18 years or older
qui gen age18 = 0 if inlist(q1, 1, 2, 3, 4, 5, 6)
qui replace age18 = 1 if q1 == 7
***Actual Age
qui gen age_new = q1 + 11

*** RACE VARIABLES ***
qui gen race4 = 1 if raceeth==5
qui replace race4 = 2 if raceeth==3
qui replace race4 = 3 if inlist(raceeth,6,7)
qui replace race4 = 4 if inlist(raceeth,1,2,4,8)
label define race_names 1 "White" 2 "Black" 3 "Hispanic" 4 "Other"
label values race4 race_names
*** White
qui gen white = 0 if inrange(race4, 2, 4)
qui replace white = 1 if race4 == 1
*** Black
qui gen black = 0 if inlist(race4, 1, 3, 4)
qui replace black = 1 if race4 == 2
*** Hispanic
qui gen hispanic = 0 if inlist(race4, 1, 2, 4)
qui replace hispanic = 1 if race4 == 3
*** Other Race
qui gen otherrace = 0 if inrange(race4, 1,3)
qui replace otherrace = 1 if race4 == 4

*** SEX VARIABLES ***
*** Male
qui gen male = 0 if q2 == 1
qui replace male = 1 if q2 == 2
*** Female
qui gen female = 0 if q2 == 2
qui replace female = 1 if q2 == 1

*** SUICIDE ATTEMPT VARIABLE ***
qui gen suicideattempt = 0 if q29==1
qui replace suicideattempt = 1 if inrange(q29,2,5)

*** DEPRESSION VARIABLE *** 
qui gen depression = 0 if q26==2
qui replace depression = 1 if q26==1

*** SUICIDE IDEATION ***
qui gen suicideideation = 0 if q27==2
qui replace suicideideation = 1 if q27==1

*** SUICIDE PLAN ***
qui gen suicideplan = 0 if q28 == 2
qui replace suicideplan = 1 if q28==1

*** SEX MINORITY VARIABLES ***
qui gen sexminority=1 if inrange(q68,2,4)
qui replace sexminority=0 if q68==1
qui gen heterosexual=1 if q68==1
qui replace heterosexual=0 if inrange(q68,2,4)

gen sexidentity = 1 if inrange(q68,2,3)
replace sexidentity = 0 if q68==1
*** JUICE CONSUMPTION ***
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1

*** CARROT CONSUMPTION ***
qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1

*** SEATBELT USE ***
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)

*** GRADE/CLASSROOM ***
qui gen grade = 9 if q3 == 1
qui replace grade = 10 if q3 == 2
qui replace grade = 11 if q3 == 3
qui replace grade = 12 if q3 == 4
qui replace grade = 0 if q3 == 5

*** CIGARETTE USE *** 
gen smoke = . 
replace smoke = 0 if q33 == 1 
replace smoke = 1 if inrange(q33,2,7)

*** ALCOHOL USE *** 
gen alcohol = . 
replace alcohol = 0 if q43==1
replace alcohol = 1 if inrange(q43,2,7)

*** BINGE DRINKING ***
gen binge=.
replace binge=0 if q44==1 
replace binge=1 if inrange(q44,2,7) 

*** FREQUENT BINGE DRINKING *** 3 or more times
gen freq_binge=.
replace freq_binge=0 if inrange(q44,1,3) 
replace freq_binge=1 if inrange(q44,4,7) 

*** MARIJUANA USE *** 
gen marijuana30=.
replace marijuana30=0 if q49==1 
replace marijuana30=1 if inrange(q49,2,6) 

*** BULLYING *** Q24. During the past 12 months, have you ever been bullied on school property?
gen bullied=.
replace bullied=0 if q24==2
replace bullied=1 if q24==1

*** E-BULLYING *** Q25. During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chatrooms, instant messaging, websites, or texting.)
gen ebullied=.
replace ebullied=0 if q25==2
replace ebullied=1 if q25==1


save "NMHq_labeled.dta", replace
tab fips
use "NMHq_labeled.dta", clear

**************************
* Combining the datasets *
**************************
**************************
* Combining the datasets *
**************************
*STATE YRBS THROUGH 2017
use "State15_labeled.dta", clear
append using "state_yrbs_tam_labeled.dta", force
append using "MAHq_labeled.dta", force
append using "NMHq_labeled.dta", force
append using "VTAHq_labeled.dta", force
append using "INHq_labeled.dta", force
append using "TX_labeled_2017.dta", force
append using "VT_labeled_2017.dta", force
append using "NM_labeled_2017.dta", force
append using "MD_labeled_2017.dta", force
append using "CT_labeled_2017.dta", force
append using "MA_labeled_2017.dta", force
append using "State17_labeled.dta", force 
*NATIONAL YRBS 
capture append using "/Users/Kevin/Documents/National YRBS /Data Files(SSM)/National_YRBS.dta", force
capture append using "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\National_YRBS.dta", force
capture append using "F:\YRBS\National"


keep fips year weight age14 age15 age16 age17 age18 age_new race4 white black ///
hispanic otherrace race4_new male female ///
suicideattempt depression suicideideation suicideplan sexminority heterosexual ///
juiceconsump carrotconsump nrseatbelt grade national bullied ebullied alcohol binge freq_binge marijuana30 smoke national sexidentity
save "Combined17_slim.dta", replace


***************************************
* Create SSM Policy Variables Dataset *
***************************************
* SSM_policy year.csv" was compiled based on the "Anti-discrimination laws source"
* Compiled by Pam and created to match the original paper using supplement eTables 1 and 2
import delimited "SSM_policy year.csv", clear
save "SSM_policy year.dta", replace
use "SSM_policy year.dta", clear
qui gen fips =.
qui replace fips=1 if state=="Alabama"
qui replace fips=2 if state=="Alaska"
qui replace fips=4 if state=="Arizona"
qui replace fips=5 if state=="Arkansas"
qui replace fips=6 if state=="California"
qui replace fips=8 if state=="Colorado"
qui replace fips=9 if state=="Connecticut"
qui replace fips=10 if state=="Delaware"
qui replace fips=11 if state=="District of Columbia"
qui replace fips=12 if state=="Florida"
qui replace fips=13 if state=="Georgia"
qui replace fips=15 if state=="Hawaii"
qui replace fips=16 if state=="Idaho"
qui replace fips=17 if state=="Illinois"
qui replace fips=18 if state=="Indiana"
qui replace fips=19 if state=="Iowa"
qui replace fips=20 if state=="Kansas"
qui replace fips=21 if state=="Kentucky"
qui replace fips=22 if state=="Louisiana"
qui replace fips=23 if state=="Maine"
qui replace fips=24 if state=="Maryland"
qui replace fips=25 if state=="Massachusetts"
qui replace fips=26 if state=="Michigan"
qui replace fips=27 if state=="Minnesota"
qui replace fips=28 if state=="Mississippi"
qui replace fips=29 if state=="Missouri"
qui replace fips=30 if state=="Montana"
qui replace fips=31 if state=="Nebraska"
qui replace fips=32 if state=="Nevada"
qui replace fips=33 if state=="New Hampshire"
qui replace fips=34 if state=="New Jersey"
qui replace fips=35 if state=="New Mexico"
qui replace fips=36 if state=="New York"
qui replace fips=37 if state=="North Carolina"
qui replace fips=38 if state=="North Dakota"
qui replace fips=39 if state=="Ohio"
qui replace fips=40 if state=="Oklahoma"
qui replace fips=41 if state=="Oregon"
qui replace fips=42 if state=="Pennsylvania"
qui replace fips=44 if state=="Rhode Island"
qui replace fips=45 if state=="South Carolina"
qui replace fips=46 if state=="South Dakota"
qui replace fips=47 if state=="Tennessee"
qui replace fips=48 if state=="Texas"
qui replace fips=49 if state=="Utah"
qui replace fips=50 if state=="Vermont"
qui replace fips=51 if state=="Virginia"
qui replace fips=53 if state=="Washington"
qui replace fips=54 if state=="West Virginia"
qui replace fips=55 if state=="Wisconsin"
qui replace fips=56 if state=="Wyoming"
save "SSM_policy_fips.dta", replace

************************
* Add controls dataset *
************************
use "Combined17_slim.dta", clear
merge m:1 fips year using "controls_unempl_2017.dta"
keep if _merge==3
drop _merge

****************************
* Add SSM Policy Variables *
****************************
merge m:1 fips using "SSM_policy_fips.dta"
drop _merge
save "Combined2017.dta", replace

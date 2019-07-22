**************************************************
***     MEDICAL MARIJUANA REPLICATION      *******   // AND LITERALLY ANYTHING ELSE
**************************************************
***    Done by Kevin Hsu and Alicia Marquez    ***
***    under the supervision of Joseph Sabia   ***
*** within CHEPS at San Diego State University ***
**************************************************
clear
capture log close 

capture cd "/Users/Kevin/Documents/National YRBS /Data Files(SSM)"
capture cd "F:\YRBS\National" 
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\National"
set more 1
*******************
***NATIONAL YRBS***
*******************
**********
***1993***
**********
capture use "NYRBS_1993.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_1993.dta", clear

capture rename stfips fips

*MML
gen marijuana30=.
replace marijuana30=1 if inlist(q45,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q45=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q45,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q45,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q46,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q46=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q54=="Yes"
*1
replace drugschool=0 if q54=="no"
*2

*RACE
rename q4 race

gen white=.
replace white=1 if race=="White - not Hispanic"
*1
replace white=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*2,3,4,5,6

gen black=.
replace black=1 if race=="Black - not Hispanic"
*2
replace black=0 if inlist(race,"Asian or Pacific Islander", "White - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*1,3,4,5,6

gen hispanic=.
replace hispanic=1 if race=="Hispanic"
*3
replace hispanic=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "White - not Hispanic", "Native American or Alaskan", "Other")
*1,2,4,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Asian or Pacific Islander", "Native American or Alaskan", "Other")
*4,5,6
replace otherrace=0 if inlist(race,"White - not Hispanic", "Black - not Hispanic", "Hispanic")
*1,2,3

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"

gen alcohol=.
replace alcohol=0 if q40=="0 days"
replace alcohol=1 if inlist(q40, "1 or 2 days", "10 to 19 days", "20 to 29 days", "3 to 5 days", "6 to 9 days", "All 30 days")

gen binge=.
replace binge=0 if q41=="0 days"
replace binge=1 if inlist(q41, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

gen freq_binge=.
replace freq_binge=0 if inlist(q41, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q41, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

gen year=1993

save "National_93.dta", replace
tab fips

**********
***1995***
**********
capture use "NYRBS_1995.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_1995.dta", clear

capture rename stfips fips


*MML
gen marijuana30=.
replace marijuana30=1 if inlist(q43,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q43=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q43,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q43,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q44,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q44=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q53=="Yes"
*1
replace drugschool=0 if q53=="no"
*2

*RACE
rename q4 race

gen white=.
replace white=1 if race=="White - not Hispanic"
*1
replace white=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*2,3,4,5,6

gen black=.
replace black=1 if race=="Black - not Hispanic"
*2
replace black=0 if inlist(race,"Asian or Pacific Islander", "White - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*1,3,4,5,6

gen hispanic=.
replace hispanic=1 if race=="Hispanic"
*3
replace hispanic=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "White - not Hispanic", "Native American or Alaskan", "Other")
*1,2,4,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Asian or Pacific Islander", "Native American or Alaskan", "Other")
*4,5,6
replace otherrace=0 if inlist(race,"White - not Hispanic", "Black - not Hispanic", "Hispanic")
*1,2,3

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"
gen year=1995

gen alcohol=.
replace alcohol=0 if q38=="0 days"
replace alcohol=1 if inlist(q38, "1 or 2 days", "10 to 19 days", "20 to 29 days", "3 to 5 days", "6 to 9 days", "All 30 days")

gen binge=.
replace binge=0 if q39=="0 days"
replace binge=1 if inlist(q39, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

gen freq_binge=.
replace freq_binge=0 if inlist(q39, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q39, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

save "National_95.dta", replace
tab fips


**********
***1997***
**********
capture use "NYRBS_1997.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_1997.dta", clear

capture rename stfips fips


*MML, 43, 43, 44, 53

*MML
gen marijuana30=.
replace marijuana30=1 if inlist(q43,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q43=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q43,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q43,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q44,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q44=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q53=="Yes"
*1
replace drugschool=0 if q53=="No"
*2

*RACE
rename q4 race

gen white=.
replace white=1 if race=="White - not Hispanic"
*1
replace white=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*2,3,4,5,6

gen black=.
replace black=1 if race=="Black - not Hispanic"
*2
replace black=0 if inlist(race,"Asian or Pacific Islander", "White - not Hispanic", "Hispanic", "Native American or Alaskan", "Other")
*1,3,4,5,6

gen hispanic=.
replace hispanic=1 if race=="Hispanic"
*3
replace hispanic=0 if inlist(race,"Asian or Pacific Islander", "Black - not Hispanic", "White - not Hispanic", "Native American or Alaskan", "Other")
*1,2,4,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Asian or Pacific Islander", "Native American or Alaskan", "Other")
*4,5,6
replace otherrace=0 if inlist(race,"White - not Hispanic", "Black - not Hispanic", "Hispanic")
*1,2,3

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")

*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"

gen alcohol=.
replace alcohol=0 if q38=="0 days"
replace alcohol=1 if inlist(q38, "1 or 2 days", "10 to 19 days", "20 to 29 days", "3 to 5 days", "6 to 9 days", "All 30 days")

gen binge=.
replace binge=0 if q39=="0 days"
replace binge=1 if inlist(q39, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

gen freq_binge=.
replace freq_binge=0 if inlist(q39, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q39, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

save "National_97.dta", replace
tab fips


**********
***1999***  ***NOT STRING***
**********
capture use "NYRBS_1999.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_1999.dta", clear

capture rename stfips fips


*MML, 46, 46, 47, 56
gen marijuana30=.
replace marijuana30=1 if inrange(q46,2,6)
replace marijuana30=0 if q46==1

gen mfreq=.
replace mfreq=1 if inrange(q46,4,6)
replace mfreq=0 if inrange(q46,1,3)

gen mschool=.
replace mschool=1 if inrange(q47,2,6)
replace mschool=0 if q47==1

gen drugschool=.
replace drugschool=1 if q56==1
replace drugschool=0 if q56==2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race==6
replace white=0 if inlist(race,1,2,3,4,5,7,8)

gen black=.
replace black=1 if race==3
replace black=0 if inlist(race,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(race,4,7)
replace hispanic=0 if inlist(race,1,2,3,5,6)

gen otherrace=.
replace otherrace=1 if inlist(race,1,2,5,8)
replace otherrace=0 if inlist(race,3,4,6,7)


*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*** SSM(VARIABLES)
*RACE(SSM)
generate race4 = 1 if race==6
replace race4 = 2 if race==3
replace race4 = 3 if inlist(race,4,7)
replace race4 = 4 if inlist(race,1,2,5,8)
*** AGE VARIABLES ***
rename q1 age
tab age

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
gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q25
qui gen suicideattempt = 0 if q25==1
qui replace suicideattempt = 1 if inrange(q25,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q22
qui gen depression = 0 if q22==2
qui replace depression = 1 if q22==1
tab depression

*** SUICIDE IDEATION *** Q23
qui gen suicideideation = 0 if q23==2
qui replace suicideideation = 1 if q23==1
tab suicideideation

*** SUICIDE PLAN *** Q24
qui gen suicideplan = 0 if q24 == 2
qui replace suicideplan = 1 if q24==1
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION *** Q76

qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE *** Q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
gen year=1999

*** SMOKING
gen smoke = . 
replace smoke = 0 if q29==1
replace smoke = 1 if inrange(q29,2,7)

*** ALCOHOL 
gen alcohol = . 
replace alcohol = 0 if q41==1
replace alcohol = 1 if inrange(q41,2,7)

*** BINGE 
gen binge = . 
replace binge = 0 if q42==1
replace binge = 1 if inrange(q42,2,7)

*** FREQ BINGE 
gen freq_binge = . 
replace freq_binge = 0 if q42==1
replace freq_binge = 1 if inrange(q42,2,7)

*** BULLYING 
*DON'T THINK IT'S THERE


save "National_99.dta", replace
tab fips


**********
***2001***
**********
capture use "NYRBS_2001.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2001.dta", clear


capture rename stfips fips

*MML, 47, 47, 48, 57
gen marijuana30=.
replace marijuana30=1 if inlist(q47,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q47=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q47,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q47,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q48,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q48=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q57=="Yes"
*1
replace drugschool=0 if q57=="no"
*2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race=="White"
*6
replace white=0 if inlist(race,"Am Indian / Alaska Native", "Asian", "Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,4,5,7,8

gen black=.
replace black=1 if race=="Black or African American"
*3
replace black=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(race,"Hispanic or Latino", "Multiple - Hispanic")
*4,7
replace hispanic=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Am Indian / Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,5,8
replace otherrace=0 if inlist(race,"Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "White")
*3,4,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")


*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"

*** SSM(VARIABLES)
*RACE(SSM)
sort race
encode race, gen(raceeth)
generate race4 = 1 if raceeth==9
replace race4 = 2 if raceeth==3
replace race4 = 3 if inlist(raceeth,4,6)
replace race4 = 4 if inlist(raceeth,1,2,7,8)

/*
Am Indian / Alaska Native |        211        1.55        1.55
                    Asian |        409        3.01        4.56
Black or African American |      2,614       19.22       23.78
       Hispanic or Latino |      2,974       21.87       45.64
                  Missing |        200        1.47       47.11
      Multiple - Hispanic |        352        2.59       49.70
  Multiple - Non-hispanic |        378        2.78       52.48
 Native Hawaiian/other PI |        127        0.93       53.42
                    White |      6,336       46.58      100.00

*/
*** AGE VARIABLES ***
sort q1
encode q1, gen(age)
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
gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q26
sort q26
encode q26, gen(suicide)
qui gen suicideattempt = 0 if suicide==1
qui replace suicideattempt = 1 if inrange(suicide,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q23
qui gen depression = 0 if q23=="No"
qui replace depression = 1 if q23=="Yes"
tab depression

*** SUICIDE IDEATION *** Q24
qui gen suicideideation = 0 if q24=="No"
qui replace suicideideation = 1 if q24=="Yes"
tab suicideideation

*** SUICIDE PLAN *** Q25
qui gen suicideplan = 0 if q25 == "No"
qui replace suicideplan = 1 if q25== "Yes"
tab suicideplan

*** SEX MINoRITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q73
sort q73
encode q73, gen(juice)
qui gen juiceconsump=1 if inrange(juice,1,6)
qui replace juiceconsump=0 if juice==7
tab juiceconsump

*** CARROT CONSUMPTION *** Q77
sort q77
encode q77, gen(carrot)
qui gen carrotconsump=1 if inrange(carrot,1,6)
qui replace carrotconsump=0 if carrot==7
tab carrotconsump

*** SEATBELT USE *** Q9
sort q10
encode q10, gen(seatbelt)
qui gen nrseatbelt=1 if inlist(seatbelt,4,5)
qui replace nrseatbelt=0 if inlist(seatbelt,1,3,6)
tab nrseatbelt

*** GRADE/CLASSROOM ***
sort grade
encode grade, gen(grade_)
rename grade q3
qui gen grade = 9 if grade_ == 4
qui replace grade = 10 if grade_ == 1
qui replace grade = 11 if grade_ == 2
qui replace grade = 12 if grade_ == 3
qui replace grade = 0 if grade_ == 6
tab grade

*** SMOKING 
sort q30
encode q30, gen(smoke_)
gen smoke = . 
replace smoke = 0 if smoke_==1
replace smoke = 1 if inrange(smoke_,2,7)

*** ALCOHOL
sort q42
encode q42, gen(alcohol_)
gen alcohol = . 
replace alcohol = 0 if alcohol_==1
replace alcohol = 1 if inrange(alcohol_,2,7)

*** BINGE
gen binge=.
replace binge=0 if q43=="0 days"
replace binge=1 if inlist(q43, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

*** FREQ BINGE
gen freq_binge=.
replace freq_binge=0 if inlist(q43, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q43, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

gen year=2001

save "National_01.dta", replace
tab fips


**********
***2003***
**********
capture use "NYRBS_2003.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2003.dta", clear



capture rename stfips fips

*MML, 46, 46, 47, 57
gen marijuana30=.
replace marijuana30=1 if inlist(q46,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q46=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q46,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q46,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

gen mschool=.
replace mschool=1 if inlist(q47,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace mschool=0 if q47=="0 times"
*1

gen drugschool=.
replace drugschool=1 if q57=="Yes"
*1
replace drugschool=0 if q57=="No"
*2

*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race=="White"
*6
replace white=0 if inlist(race,"Am Indian / Alaska Native", "Asian", "Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,4,5,7,8

gen black=.
replace black=1 if race=="Black or African American"
*3
replace black=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Hispanic or Latino", "Multiple - Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(race,"Hispanic or Latino", "Multiple - Hispanic")
*4,7
replace hispanic=0 if inlist(race,"White", "Am Indian / Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,3,5,6

gen otherrace=.
replace otherrace=1 if inlist(race,"Am Indian / Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/other PI")
*1,2,5,8
replace otherrace=0 if inlist(race,"Black or African American", "Hispanic or Latino", "Multiple - Hispanic", "White")
*3,4,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")


*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"


*** SSM(VARIABLES)
*RACE(SSM)
sort race
encode race, gen(raceeth)
generate race4 = 1 if raceeth==9
replace race4 = 2 if raceeth==3
replace race4 = 3 if inlist(raceeth,4,6)
replace race4 = 4 if inlist(raceeth,1,2,7,8)

/*
Am Indian / Alaska Native |        211        1.55        1.55
                    Asian |        409        3.01        4.56
Black or African American |      2,614       19.22       23.78
       Hispanic or Latino |      2,974       21.87       45.64
                  Missing |        200        1.47       47.11
      Multiple - Hispanic |        352        2.59       49.70
  Multiple - Non-hispanic |        378        2.78       52.48
 Native Hawaiian/other PI |        127        0.93       53.42
                    White |      6,336       46.58      100.00

*/
*** AGE VARIABLES ***
sort q1
encode q1, gen(age)
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

gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q26
sort q26
encode q26, gen(suicide)
qui gen suicideattempt = 0 if suicide==1
qui replace suicideattempt = 1 if inrange(suicide,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q23
qui gen depression = 0 if q23=="No"
qui replace depression = 1 if q23=="Yes"
tab depression

*** SUICIDE IDEATION *** Q24
qui gen suicideideation = 0 if q24=="No"
qui replace suicideideation = 1 if q24=="Yes"
tab suicideideation

*** SUICIDE PLAN *** Q25
qui gen suicideplan = 0 if q25 == "No"
qui replace suicideplan = 1 if q25== "Yes"
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q73
sort q73
encode q73, gen(juice)
qui gen juiceconsump=1 if inrange(juice,1,6)
qui replace juiceconsump=0 if juice==7
tab juiceconsump

*** CARROT CONSUMPTION *** Q77
sort q77
encode q77, gen(carrot)
qui gen carrotconsump=1 if inrange(carrot,1,6)
qui replace carrotconsump=0 if carrot==7
tab carrotconsump

*** SEATBELT USE *** Q9
sort q9
encode q9, gen(seatbelt)
qui gen nrseatbelt=1 if inlist(seatbelt,4,5)
qui replace nrseatbelt=0 if inlist(seatbelt,1,3,6)
tab nrseatbelt

*** GRADE/CLASSROOM ***
sort grade
encode grade, gen(grade_)
rename grade q3
qui gen grade = 9 if grade_ == 4
qui replace grade = 10 if grade_ == 1
qui replace grade = 11 if grade_ == 2
qui replace grade = 12 if grade_ == 3
qui replace grade = 0 if grade_ == 6
tab grade
gen year=2003

*** SMOKING Q30
sort q30
encode q30, gen(smoke_)
gen smoke = . 
replace smoke = 0 if smoke_==1
replace smoke = 1 if inrange(smoke_,2,7)

*** ALCOHOL Q41
sort q41
encode q41, gen(alcohol_)
gen alcohol = . 
replace alcohol = 0 if alcohol_==1
replace alcohol = 1 if inrange(alcohol_,2,7)

*** BINGE
gen binge=.
replace binge=0 if q42=="0 days"
replace binge=1 if inlist(q42, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

*** FREQ BINGE
gen freq_binge=.
replace freq_binge=0 if inlist(q43, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q43, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

save "National_03.dta", replace
tab fips


**********
***2005*** ***NOT STRING
**********
capture use "NYRBS_2005.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2005.dta", clear



capture rename stfips fips

*MML, 46, 46, 47, 56
gen marijuana30=.
replace marijuana30=1 if inrange(q46,2,6)
replace marijuana30=0 if q46==1

gen mfreq=.
replace mfreq=1 if inrange(q46,4,6)
replace mfreq=0 if inrange(q46,1,3)

gen mschool=.
replace mschool=1 if inrange(q47,2,6)
replace mschool=0 if q47==1

gen drugschool=.
replace drugschool=1 if q56==1
replace drugschool=0 if q56==2


*RACE
**hispanic = hispanic/latino (4) + multiple-hispanic (7)
rename q4 race

gen white=.
replace white=1 if race==6
replace white=0 if inlist(race,1,2,3,4,5,7,8)

gen black=.
replace black=1 if race==3
replace black=0 if inlist(race,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(race,4,7)
replace hispanic=0 if inlist(race,1,2,3,5,6)

gen otherrace=.
replace otherrace=1 if inlist(race,1,2,5,8)
replace otherrace=0 if inlist(race,3,4,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*** SSM(VARIABLES)
*RACE(SSM)
generate race4 = 1 if race==6
replace race4 = 2 if race==3
replace race4 = 3 if inlist(race,4,7)
replace race4 = 4 if inlist(race,1,2,5,8)
*** AGE VARIABLES ***
rename q1 age
tab age

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

gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q26
qui gen suicideattempt = 0 if q26==1
qui replace suicideattempt = 1 if inrange(q26,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q23
qui gen depression = 0 if q23==2
qui replace depression = 1 if q23==1
tab depression

*** SUICIDE IDEATION *** Q24
qui gen suicideideation = 0 if q24==2
qui replace suicideideation = 1 if q24==1
tab suicideideation

*** SUICIDE PLAN *** Q25
qui gen suicideplan = 0 if q25 == 2
qui replace suicideplan = 1 if q25==1
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q71
qui gen juiceconsump=1 if inrange(q71,2,7)
qui replace juiceconsump=0 if q71==1
tab juiceconsump

*** CARROT CONSUMPTION *** Q75

qui gen carrotconsump=1 if inrange(q75,2,7)
qui replace carrotconsump=0 if q75==1
tab carrotconsump

*** SEATBELT USE *** Q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab grade
* grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

*** SMOKING Q30
sort q30
gen smoke = . 
replace smoke = 0 if q30==1
replace smoke = 1 if inrange(q30,2,7)

*** ALCOHOL Q41
sort q41
gen alcohol = . 
replace alcohol = 0 if q41==1
replace alcohol = 1 if inrange(q41,2,7)
gen year=2005

*** BINGE 
gen binge = . 
replace binge = 0 if q42==1
replace binge = 1 if inrange(q42,2,7)

*** FREQ BINGE 
gen freq_binge = . 
replace freq_binge = 0 if q42==1
replace freq_binge = 1 if inrange(q42,2,7)

save "National_05.dta", replace
**tab fips
**

**********
***2007*** ***NOT STRING
**********
capture use "NYRBS_2007.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2007.dta", clear


capture rename stfips fips

*MML, 47, 47, 48, 57
gen marijuana30=.
replace marijuana30=1 if inrange(q47,2,6)
replace marijuana30=0 if q47==1

gen mfreq=.
replace mfreq=1 if inrange(q47,4,6)
replace mfreq=0 if inrange(q47,1,3)

gen mschool=.
replace mschool=1 if inrange(q48,2,6)
replace mschool=0 if q48==1

gen drugschool=.
replace drugschool=1 if q57==1
replace drugschool=0 if q57==2



*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth==5
replace white=0 if inlist(raceeth,1,2,3,4,6,7,8)

gen black=.
replace black=1 if raceeth==3
replace black=0 if inlist(raceeth,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(raceeth,6,7)
replace hispanic=0 if inlist(raceeth,1,2,3,4,5,8)

gen otherrace=.
replace otherrace=1 if inlist(raceeth,1,2,4,8)
replace otherrace=0 if inlist(raceeth,3,5,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*** SSM(VARIABLES)
*RACE(SSM)
generate race4 = 1 if raceeth==5
replace race4 = 2 if raceeth==3
replace race4 = 3 if inlist(raceeth,6,7)
replace race4 = 4 if inlist(raceeth,1,2,4,8)
*** AGE VARIABLES ***
rename q1 age
tab age

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

gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q26
qui gen suicideattempt = 0 if q26==1
qui replace suicideattempt = 1 if inrange(q26,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q23
qui gen depression = 0 if q23==2
qui replace depression = 1 if q23==1
tab depression

*** SUICIDE IDEATION *** Q24
qui gen suicideideation = 0 if q24==2
qui replace suicideideation = 1 if q24==1
tab suicideideation

*** SUICIDE PLAN *** Q25
qui gen suicideplan = 0 if q25 == 2
qui replace suicideplan = 1 if q25==1
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION *** Q76

qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE *** Q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab grade
* grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade
 
*** SMOKING Q30
sort q30
gen smoke = . 
replace smoke = 0 if q30==1
replace smoke = 1 if inrange(q30,2,7)

*** ALCOHOL Q41
sort q41
gen alcohol = . 
replace alcohol = 0 if q41==1
replace alcohol = 1 if inrange(q41,2,7)
gen year=2007

*** BINGE 
gen binge = . 
replace binge = 0 if q42==1
replace binge = 1 if inrange(q42,2,7)

*** FREQ BINGE 
gen freq_binge = . 
replace freq_binge = 0 if q42==1
replace freq_binge = 1 if inrange(q42,2,7)

save "National_07.dta", replace
***tab fips
***

**********
***2009*** ***NOT STRING
**********
capture use "NYRBS_2009.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2009.dta", clear

capture rename stfips fips


*MML, 47, 47, 48, 57
gen marijuana30=.
replace marijuana30=1 if inrange(q47,2,6)
replace marijuana30=0 if q47==1

gen mfreq=.
replace mfreq=1 if inrange(q47,4,6)
replace mfreq=0 if inrange(q47,1,3)

gen mschool=.
replace mschool=1 if inrange(q48,2,6)
replace mschool=0 if q48==1

gen drugschool=.
replace drugschool=1 if q57==1
replace drugschool=0 if q57==2


*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth==5
replace white=0 if inlist(raceeth,1,2,3,4,6,7,8)

gen black=.
replace black=1 if raceeth==3
replace black=0 if inlist(raceeth,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(raceeth,6,7)
replace hispanic=0 if inlist(raceeth,1,2,3,4,5,8)

gen otherrace=.
replace otherrace=1 if inlist(raceeth,1,2,4,8)
replace otherrace=0 if inlist(raceeth,3,5,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*** SSM(VARIABLES)
*RACE(SSM)
generate race4 = 1 if raceeth==5
replace race4 = 2 if raceeth==3
replace race4 = 3 if inlist(raceeth,6,7)
replace race4 = 4 if inlist(raceeth,1,2,4,8)
*** AGE VARIABLES ***
rename q1 age
tab age

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
gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q26
qui gen suicideattempt = 0 if q26==1
qui replace suicideattempt = 1 if inrange(q26,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q23
qui gen depression = 0 if q23==2
qui replace depression = 1 if q23==1
tab depression

*** SUICIDE IDEATION *** Q24
qui gen suicideideation = 0 if q24==2
qui replace suicideideation = 1 if q24==1
tab suicideideation

*** SUICIDE PLAN *** Q25
qui gen suicideplan = 0 if q25 == 2
qui replace suicideplan = 1 if q25==1
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION *** Q76

qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE *** Q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab grade
* grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

*** SMOKING Q30
sort q30
gen smoke = . 
replace smoke = 0 if q30==1
replace smoke = 1 if inrange(q30,2,7)

*** ALCOHOL Q41
sort q41
gen alcohol = . 
replace alcohol = 0 if q41==1
replace alcohol = 1 if inrange(q41,2,7)
gen year=2009

*** BINGE 
gen binge = . 
replace binge = 0 if q42==1
replace binge = 1 if inrange(q42,2,7)

*** FREQ BINGE 
gen freq_binge = . 
replace freq_binge = 0 if q42==1
replace freq_binge = 1 if inrange(q42,2,7)

*** BULLY Q22 & Q23
gen bullied=.
replace bullied=0 if q22==2
replace bullied=1 if q22==1

gen ebullied=.
replace ebullied=0 if q23==2
replace ebullied=1 if q23==1


save "National_09.dta", replace
***tab fips
***

**********
***2011*** ***NOT STRING
**********
capture use "NYRBS_2011.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2011.dta", clear

capture rename stfips fips


*MML, 48, 48, 49, 59
gen marijuana30=.
replace marijuana30=1 if inrange(q48,2,6)
replace marijuana30=0 if q48==1

gen mfreq=.
replace mfreq=1 if inrange(q48,4,6)
replace mfreq=0 if inrange(q48,1,3)

gen mschool=.
replace mschool=1 if inrange(q49,2,6)
replace mschool=0 if q49==1

gen drugschool=.
replace drugschool=1 if q59==1
replace drugschool=0 if q59==2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth==5
replace white=0 if inlist(raceeth,1,2,3,4,6,7,8)

gen black=.
replace black=1 if raceeth==3
replace black=0 if inlist(raceeth,1,2,4,5,6,7,8)

gen hispanic=.
replace hispanic=1 if inlist(raceeth,6,7)
replace hispanic=0 if inlist(raceeth,1,2,3,4,5,8)

gen otherrace=.
replace otherrace=1 if inlist(raceeth,1,2,4,8)
replace otherrace=0 if inlist(raceeth,3,5,6,7)

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade==1
replace grade9=0 if inlist(grade,2,3,4)

gen grade10=.
replace grade10=1 if grade==2
replace grade10=0 if inlist(grade,1,3,4)

gen grade11=.
replace grade11=1 if grade==3
replace grade11=0 if inlist(grade,1,2,4)

gen grade12=.
replace grade12=1 if grade==4
replace grade12=0 if inlist(grade,1,2,3)

*SEX
rename q2 sex

gen male=.
replace male=1 if sex==2
replace male=0 if sex==1

gen female=.
replace female=1 if sex==1
replace female=0 if sex==2

*** SSM(VARIABLES)
*RACE(SSM)
generate race4 = 1 if raceeth==5
replace race4 = 2 if raceeth==3
replace race4 = 3 if inlist(raceeth,6,7)
replace race4 = 4 if inlist(raceeth,1,2,4,8)
*** AGE VARIABLES ***
rename q1 age
tab age

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

gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q27
qui gen suicideattempt = 0 if q27==1
qui replace suicideattempt = 1 if inrange(q27,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q24
qui gen depression = 0 if q24==2
qui replace depression = 1 if q24==1
tab depression

*** SUICIDE IDEATION *** Q25
qui gen suicideideation = 0 if q25==2
qui replace suicideideation = 1 if q25==1
tab suicideideation

*** SUICIDE PLAN *** Q26
qui gen suicideplan = 0 if q26 == 2
qui replace suicideplan = 1 if q26==1
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q72
qui gen juiceconsump=1 if inrange(q72,2,7)
qui replace juiceconsump=0 if q72==1
tab juiceconsump

*** CARROT CONSUMPTION *** Q76

qui gen carrotconsump=1 if inrange(q76,2,7)
qui replace carrotconsump=0 if q76==1
tab carrotconsump

*** SEATBELT USE *** Q9
qui gen nrseatbelt=1 if inrange(q9,1,2)
qui replace nrseatbelt=0 if inrange(q9,3,5)
tab nrseatbelt

*** GRADE/CLASSROOM ***
tab grade
* grade
qui replace grade = 9 if grade == 1
qui replace grade = 10 if grade == 2
qui replace grade = 11 if grade == 3
qui replace grade = 12 if grade == 4
qui replace grade = 0 if grade == 5
tab grade

*** SMOKING Q31
sort q31
gen smoke = . 
replace smoke = 0 if q31==1
replace smoke = 1 if inrange(q31,2,7)

*** ALCOHOL Q42
sort q42
gen alcohol = . 
replace alcohol = 0 if q42==1
replace alcohol = 1 if inrange(q42,2,7)
gen year=2011

*** BINGE 
gen binge = . 
replace binge = 0 if q43==1
replace binge = 1 if inrange(q43,2,7)

*** FREQ BINGE 
gen freq_binge = . 
replace freq_binge = 0 if q43==1
replace freq_binge = 1 if inrange(q43,2,7)

*** BULLY Q22 & Q23
gen bullied=.
replace bullied=0 if q22==2
replace bullied=1 if q22==1

gen ebullied=.
replace ebullied=0 if q23==2
replace ebullied=1 if q23==1


save "National_11.dta", replace
***tab fips
***

**********
***2013*** 
**********
capture use "NYRBS_2013.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2013.dta", clear

capture rename stfips fips


*MML, 49, 49, 58
gen marijuana30=.
replace marijuana30=1 if inlist(q49,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q49=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q49,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q49,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q58=="Yes"
*1
replace drugschool=0 if q58=="no"
*2

**"Am Indian/Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White"

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth=="White"
*5
replace white=0 if inlist(raceeth,"Am Indian / Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,3,4,6,7,8

gen black=.
replace black=1 if raceeth=="Black or African American"
*3
replace black=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(raceeth,"Hispanic/Latino", "Multiple-Hispanic")
*6,7
replace hispanic=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,3,4,5,8

gen otherrace=.
replace otherrace=1 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,4,8
replace otherrace=0 if inlist(raceeth, "Hispanic/Latino", "Multiple-Hispanic", "White", "Black or African American")
*3,5,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")


*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"

*** SSM(VARIABLES)
*RACE(SSM)
sort raceeth
encode raceeth, gen(raceeths)
generate race4 = 1 if raceeths==9
replace race4 = 2 if raceeths==3
replace race4 = 3 if inlist(raceeths,4,6)
replace race4 = 4 if inlist(raceeths,1,2,7,8)

/*
Am Indian / Alaska Native |        121        0.89        0.89
                    Asian |        491        3.61        4.51
Black or African American |      2,993       22.03       26.54
          Hispanic/Latino |      1,734       12.77       39.31
                  Missing |        318        2.34       41.65
      Multiple - Hispanic |      1,661       12.23       53.88
  Multiple - Non-Hispanic |        681        5.01       58.89
 Native Hawaiian/other PI |        135        0.99       59.88
                    White |      5,449       40.12      100.00


*/
*** AGE VARIABLES ***
sort q1
encode q1, gen(age)
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
gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q29
sort q29
encode q29, gen(suicide)
qui gen suicideattempt = 0 if suicide==1
qui replace suicideattempt = 1 if inrange(suicide,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q26
qui gen depression = 0 if q26=="No"
qui replace depression = 1 if q26=="Yes"
tab depression

*** SUICIDE IDEATION *** Q27
qui gen suicideideation = 0 if q27=="No"
qui replace suicideideation = 1 if q27=="Yes"
tab suicideideation

*** SUICIDE PLAN *** Q28
qui gen suicideplan = 0 if q28 == "No"
qui replace suicideplan = 1 if q28== "Yes"
tab suicideplan

*** SEX MINORITY *** 
*MISSING

*
*** JUICE CONSUMPTION *** Q71
sort q71
encode q71, gen(juice)
qui gen juiceconsump=1 if inrange(juice,1,6)
qui replace juiceconsump=0 if juice==7
tab juiceconsump

*** CARROT CONSUMPTION *** Q75
sort q75
encode q75, gen(carrot)
qui gen carrotconsump=1 if inrange(carrot,1,6)
qui replace carrotconsump=0 if carrot==7
tab carrotconsump

*** SEATBELT USE *** Q9
sort q10
encode q10, gen(seatbelt)
qui gen nrseatbelt=1 if inlist(seatbelt,4,5)
qui replace nrseatbelt=0 if inlist(seatbelt,1,3,6)
tab nrseatbelt

*** GRADE/CLASSROOM ***
sort grade
encode grade, gen(grade_)
rename grade q3
qui gen grade = 9 if grade_ == 4
qui replace grade = 10 if grade_ == 1
qui replace grade = 11 if grade_ == 2
qui replace grade = 12 if grade_ == 3
qui replace grade = 0 if grade_ == 6
tab grade

*** SMOKING Q33
sort q33
encode q33, gen(smoke_)
gen smoke = . 
replace smoke = 0 if smoke_==1
replace smoke = 1 if inrange(smoke_,2,7)

*** ALCOHOL Q43
sort q43
encode q43, gen(alcohol_)
gen alcohol = . 
replace alcohol = 0 if alcohol_==1
replace alcohol = 1 if inrange(alcohol_,2,7)
gen year=2013

*** BINGE
gen binge=.
replace binge=0 if q44=="0 days"
replace binge=1 if inlist(q44, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

*** FREQ BINGE
gen freq_binge=.
replace freq_binge=0 if inlist(q44, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q44, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

*** BULLY Q24 & Q25
gen bullied=.
replace bullied=0 if q24=="No"
replace bullied=1 if q24=="Yes"

gen ebullied=.
replace ebullied=0 if q25=="No"
replace ebullied=1 if q25=="Yes"

save "National_13.dta", replace
***tab fips
***

**********
***2015***
**********
capture use "NYRBS_2015.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2015.dta", clear


capture rename stfips fips

*MML, 49, 49, 59
gen marijuana30=.
replace marijuana30=1 if inlist(q49,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q49=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q49,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q49,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q59=="Yes"
*1
replace drugschool=0 if q59=="no"
*2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth=="White"
*5
replace white=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,3,4,6,7,8

gen black=.
replace black=1 if raceeth=="Black or African American"
*3
replace black=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(raceeth,"Hispanic/Latino", "Multiple-Hispanic")
*6,7
replace hispanic=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,3,4,5,8

gen otherrace=.
replace otherrace=1 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,4,8
replace otherrace=0 if inlist(raceeth, "Hispanic/Latino", "Multiple-Hispanic", "White", "Black or African American")
*3,5,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")


*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"

*** SSM(VARIABLES)
*RACE(SSM)
sort raceeth
encode raceeth, gen(raceeths)
generate race4 = 1 if raceeths==9
replace race4 = 2 if raceeths==3
replace race4 = 3 if inlist(raceeths,4,6)
replace race4 = 4 if inlist(raceeths,1,2,7,8)

/*
Am Indian / Alaska Native |        163        1.04        1.04
                    Asian |        627        4.01        5.06
Black or African American |      1,667       10.67       15.73
          Hispanic/Latino |      2,365       15.14       30.86
                  Missing |        358        2.29       33.15
      Multiple - Hispanic |      2,756       17.64       50.79
  Multiple - Non-Hispanic |        739        4.73       55.52
 Native Hawaiian/other PI |        100        0.64       56.16
                    White |      6,849       43.84      100.00



*/
*** AGE VARIABLES ***
sort q1
encode q1, gen(age)
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
gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q29
sort q29
encode q29, gen(suicide)
qui gen suicideattempt = 0 if suicide==1
qui replace suicideattempt = 1 if inrange(suicide,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q26
qui gen depression = 0 if q26=="No"
qui replace depression = 1 if q26=="Yes"
tab depression

*** SUICIDE IDEATION *** Q27
qui gen suicideideation = 0 if q27=="No"
qui replace suicideideation = 1 if q27=="Yes"
tab suicideideation

*** SUICIDE PLAN *** Q28
qui gen suicideplan = 0 if q28 == "No"
qui replace suicideplan = 1 if q28== "Yes"
tab suicideplan

*** SEX MINORITY *** 
sort q68
encode q68, gen(sexor)
gen sexminority = 1 if inlist(sexor,1,2,5)
replace sexminority = 0 if sexor==3

*
*** JUICE CONSUMPTION *** Q71
sort q71
encode q71, gen(juice)
qui gen juiceconsump=1 if inrange(juice,1,6)
qui replace juiceconsump=0 if juice==7
tab juiceconsump

*** CARROT CONSUMPTION *** Q75
sort q75
encode q75, gen(carrot)
qui gen carrotconsump=1 if inrange(carrot,1,6)
qui replace carrotconsump=0 if carrot==7
tab carrotconsump

*** SEATBELT USE *** Q9
sort q9
encode q9, gen(seatbelt)
qui gen nrseatbelt=1 if inlist(seatbelt,4,5)
qui replace nrseatbelt=0 if inlist(seatbelt,1,3,6)
tab nrseatbelt

*** GRADE/CLASSROOM ***
sort grade
encode grade, gen(grade_)
rename grade q3
qui gen grade = 9 if grade_ == 4
qui replace grade = 10 if grade_ == 1
qui replace grade = 11 if grade_ == 2
qui replace grade = 12 if grade_ == 3
qui replace grade = 0 if grade_ == 6
tab grade

*** SMOKING Q33
sort q33
encode q33, gen(smoke_)
gen smoke = . 
replace smoke = 0 if smoke_==1
replace smoke = 1 if inrange(smoke_,2,7)

*** ALCOHOL Q43
sort q43
encode q43, gen(alcohol_)
gen alcohol = . 
replace alcohol = 0 if alcohol_==1
replace alcohol = 1 if inrange(alcohol_,2,7)
gen year=2015

*** BINGE
gen binge=.
replace binge=0 if q44=="0 days"
replace binge=1 if inlist(q44, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

*** FREQ BINGE
gen freq_binge=.
replace freq_binge=0 if inlist(q44, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q44, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

*** BULLY Q24 & A25
gen bullied=.
replace bullied=0 if q24=="No"
replace bullied=1 if q24=="Yes"

gen ebullied=.
replace ebullied=0 if q25=="No"
replace ebullied=1 if q25=="Yes"

save "National_15.dta", replace
***tab fips
***

**********
***2017***
**********
capture use "NYRBS_2017.dta", clear
capture use "/Users/Kevin/Documents/National YRBS /Data Files/NYRBS_2017.dta", clear

capture rename stfips fips


*MML, 48, 48, 58
gen marijuana30=.
replace marijuana30=1 if inlist(q48,"1 or 2 times", "3 to 9 times", "10 to 19 times", "20 to 39 times", "40 or more times")
*2,6
replace marijuana30=0 if q48=="0 times"
*1

gen mfreq=.
replace mfreq=1 if inlist(q48,"10 to 19 times", "20 to 39 times", "40 or more times")
*4,6
replace mfreq=0 if inlist(q48,"0 times", "1 or 2 times", "3 to 9 times")
*1,3

*mschool not in survey

gen drugschool=.
replace drugschool=1 if q58=="Yes"
*1
replace drugschool=0 if q58=="no"
*2

*RACE
**hispanic = hispanic/latino (6) + multiple-hispanic (7)
gen white=.
replace white=1 if raceeth=="White"
*5
replace white=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,3,4,6,7,8

gen black=.
replace black=1 if raceeth=="Black or African American"
*3
replace black=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Hispanic/Latino", "Multiple-Hispanic", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,4,5,6,7,8

gen hispanic=.
replace hispanic=1 if inlist(raceeth,"Hispanic/Latino", "Multiple-Hispanic")
*6,7
replace hispanic=0 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Black or African American", "Multiple - Non-hispanic", "Native Hawaiian/Other PI", "White")
*1,2,3,4,5,8

gen otherrace=.
replace otherrace=1 if inlist(raceeth,"Am Indian/Alaska Native", "Asian", "Multiple - Non-hispanic", "Native Hawaiian/Other PI")
*1,2,4,8
replace otherrace=0 if inlist(raceeth, "Hispanic/Latino", "Multiple-Hispanic", "White", "Black or African American")
*3,5,6,7

*GRADE
rename q3 grade

gen grade9=.
replace grade9=1 if grade=="9th grade"
replace grade9=0 if inlist(grade, "10th grade", "11th grade", "12th grade")

gen grade10=.
replace grade10=1 if grade=="10th grade"
replace grade10=0 if inlist(grade, "9th grade", "11th grade", "12th grade")

gen grade11=.
replace grade11=1 if grade=="11th grade"
replace grade11=0 if inlist(grade, "10th grade", "9th grade", "12th grade")

gen grade12=.
replace grade12=1 if grade=="12th grade"
replace grade12=0 if inlist(grade, "10th grade", "11th grade", "9th grade")


*SEX
rename q2 sex

gen male=.
replace male=1 if sex=="Male"
replace male=0 if sex=="Female"

gen female=.
replace female=1 if sex=="Female"
replace female=0 if sex=="Male"


*** SSM(VARIABLES)
*RACE(SSM)
sort raceeth
encode raceeth, gen(raceeths)
generate race4 = 1 if raceeths==9
replace race4 = 2 if raceeths==3
replace race4 = 3 if inlist(raceeths,4,6)
replace race4 = 4 if inlist(raceeths,1,2,7,8)

/*
  Am Indian/Alaska Native |        137        0.93        0.93
                    Asian |        648        4.39        5.32
Black or African American |      2,796       18.94       24.25
          Hispanic/Latino |      1,543       10.45       34.70
                  Missing |        337        2.28       36.99
      Multiple - Hispanic |      2,104       14.25       51.24
  Multiple - Non-Hispanic |        823        5.57       56.81
 Native Hawaiian/Other PI |        116        0.79       57.60
                    White |      6,261       42.40      100.00




*/
*** AGE VARIABLES ***
sort q1
encode q1, gen(age)
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
gen age_new = age+11

*** SUICIDE ATTEMPT VARIABLE *** Q28
sort q28
encode q28, gen(suicide)
qui gen suicideattempt = 0 if suicide==1
qui replace suicideattempt = 1 if inrange(suicide,2,5)
tab suicideattempt

*** DEPRESSION VARIABLE *** Q25
qui gen depression = 0 if q25=="No"
qui replace depression = 1 if q25=="Yes"
tab depression

*** SUICIDE IDEATION *** Q26
qui gen suicideideation = 0 if q26=="No"
qui replace suicideideation = 1 if q26=="Yes"
tab suicideideation

*** SUICIDE PLAN *** Q27
qui gen suicideplan = 0 if q27 == "No"
qui replace suicideplan = 1 if q27== "Yes"
tab suicideplan

*** SEX MINORITY *** 
sort q67
encode q67, gen(sexor)
gen sexminority = 1 if inlist(sexor,1,2,5)
replace sexminority = 0 if sexor==3
*
*** JUICE CONSUMPTION *** Q70
sort q70
encode q70, gen(juice)
qui gen juiceconsump=1 if inrange(juice,1,6)
qui replace juiceconsump=0 if juice==7
tab juiceconsump

*** CARROT CONSUMPTION *** Q74
sort q74
encode q74, gen(carrot)
qui gen carrotconsump=1 if inrange(carrot,1,6)
qui replace carrotconsump=0 if carrot==7
tab carrotconsump

*** SEATBELT USE *** Q8
sort q8
encode q8, gen(seatbelt)
qui gen nrseatbelt=1 if inlist(seatbelt,4,5)
qui replace nrseatbelt=0 if inlist(seatbelt,1,3,6)
tab nrseatbelt

*** GRADE/CLASSROOM ***
sort grade
encode grade, gen(grade_)
rename grade q3
qui gen grade = 9 if grade_ == 4
qui replace grade = 10 if grade_ == 1
qui replace grade = 11 if grade_ == 2
qui replace grade = 12 if grade_ == 3
qui replace grade = 0 if grade_ == 6
tab grade

*** SMOKING 
sort q33
encode q33, gen(smoke_)
gen smoke = . 
replace smoke =0 if smoke_==5
replace smoke = 1 if inlist(smoke_,1,2,3,4,6)

*** ALCOHOL
sort q42
encode q42, gen(alcohol_)
gen alcohol = . 
replace alcohol = 0 if alcohol_==1
replace alcohol = 1 if inrange(alcohol_,2,7)

*** BINGE
gen binge=.
replace binge=0 if q44=="0 days"
replace binge=1 if inlist(q44, "1 day", "10 to 19 days", "2 days", "20 or more days", "3 to 5 days", "6 to 9 days")

*** FREQ BINGE
gen freq_binge=.
replace freq_binge=0 if inlist(q44, "0 days", "1 day", "2 days")
replace freq_binge=1 if inlist(q44, "3 to 5 days", "6 to 9 days", "10 to 19 days", "20 or more days")

*** BULLY Q23 &  Q24
gen bullied=.
replace bullied=0 if q23=="No"
replace bullied=1 if q23=="Yes"

gen ebullied=.
replace ebullied=0 if q24=="No"
replace ebullied=1 if q24=="Yes"


gen year=2017

save "National_17.dta", replace


**************************
* Combining the datasets *
**************************
use "National_17.dta", clear
append using "National_15.dta", force
append using "National_13.dta", force
append using "National_11.dta", force
append using "National_09.dta", force
append using "National_07.dta", force
append using "National_05.dta", force
append using "National_03.dta", force
append using "National_01.dta", force
append using "National_99.dta", force
append using "National_97.dta", force
append using "National_95.dta", force
append using "National_93.dta", force
drop white black hispanic otherrace
gen white = 1 if race4==1
replace white = 0 if inlist(race4,2,3,4)

gen black = 1 if race4==2
replace black = 0 if inlist(race4,1,3,4)

gen hispanic = 1 if race4==3
replace hispanic = 0 if inlist(race4,1,2,4)

gen otherrace = 1 if race4==4
replace otherrace = 0 if inlist(race4,1,2,3)

keep if inrange(year,1999,2017) // FOR SSM RANGE

gen national = 1 

keep fips year weight age14 age15 age16 age17 age18 age_new race4 white black ///
hispanic otherrace  male female ///
suicideattempt depression suicideideation suicideplan sexminority  ///
juiceconsump carrotconsump nrseatbelt grade national alcohol smoke ///
bullied ebullied binge freq_binge marijuana30

save "National_YRBS.dta", replace

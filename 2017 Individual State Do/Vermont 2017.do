***************************
*** VERMONT 2017 YRBS *******
***************************
capture cd "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files"
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State"
capture cd "F:\YRBS\State"
************************************************************************************************
clear
set more 1 
capture import delimited "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Individual State Raws/CSV/VT_yrbs2017.csv"
capture import delimited "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State\VT_yrbs2017"
capture import delimited "F:\YRBS\State\VT_yrbs2017.csv"
************************************************************************************************
egen age = group(q1)

***Age 14 (12yr = 52, 13yr = 31, 14yr = 2501)
*Category is described as 14 years or younger
gen age14 = 0 if inrange(age,4,7)
replace age14 = 1 if inrange(age,1,3)

***Age 15 (15yr = 5391)
gen age15 = 0 if inlist(age,1,2,3,5,6,7)
replace age15 = 1 if inlist(age,4)

***Age 16 (16yr = 5183)
gen age16 = 0 if inlist(age,1,2,3,4,6,7)
replace age16 = 1 if inlist(age,5)

***Age 17 (17yr = 4794)
gen age17 = 0 if inlist(age,1,2,3,4,5,7)
replace age17 = 1 if inlist(age,6)

***Age 18 (18yr+ = 2525)
*Category is described as 18 years or older
gen age18 = 0 if inrange(age,1,6)
replace age18 = 1 if inlist(age,7)

***Actual Age
qui gen age_new = age + 11 if inrange(age,1,7)
tab age_new


*** RACE VARIABLES *** 
encode raceeth, gen(race) // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:

/*
1:  Am Indian/Alaska Native |        346        1.68        1.68
2:                    Asian |        689        3.34        5.01
3:Black or African American |        502        2.43        7.44
4:          Hispanic/Latino |         97        0.47        7.91
5:                  Missing |        688        3.33       11.24
6:      Multiple - Hispanic |        816        3.95       15.19
7:  Multiple - Non-Hispanic |        860        4.16       19.36
8: Native Hawaiian/Other PI |         33        0.16       19.52
9:                    White |     16,622       80.48      100.00


*/
gen race4=.
replace race4=1 if race==9 & q4=="No"
replace race4=2 if race==3 & q4=="No"
replace race4=3 if inlist(race,4,6) & q4=="Yes"
replace race4=3 if race4==. & q4=="Yes"
replace race4=4 if inlist(race,1,2,7,8) & q4=="No"

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
replace race4_new=1 if race==9 & q4=="No"
replace race4_new=2 if race==3 & q4=="No"
replace race4_new=3 if inlist(race,4) & q4=="Yes"
replace race4_new=3 if race4_new==. & q4=="Yes"
replace race4_new=4 if inlist(race,1,2,6,7,8) 

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

*** Male
gen male = 0 if sex == "Female"
replace male = 1 if sex == "Male"

*** Female
gen female = 0 if sex == "Male" 
replace female = 1 if sex == "Female" 



*** SUICIDE ATTEMPT VARIABLE ***(Q28)
encode q28, gen(suicide)

gen suicideattempt = 0 if suicide == 1
replace suicideattempt = 1 if inrange(suicide,2,5)

*** DEPRESSION VARIABLE ***  (Q25) 
gen depression = 0 if q25 == "No"
replace depression = 1 if q25 == "Yes"

*** SUICIDE IDEATION *** (Q26) // MISSING FROM VERMONT
gen suicideideation = 0 if q26 == "No"
replace suicideideation = 1 if q26 == "Yes"

*** SUICIDE PLAN *** (Q27)
gen suicideplan = 0 if q27 == "No"
replace suicideplan = 1 if q27 == "Yes" 

*** SEX MINORITY VARIABLES *** (Q67)
encode q67, gen(sexualidentity)
gen sexminority = 0 if sexualidentity==3
replace sexminority = 1 if inlist(sexualidentity,1,2,5)

gen sexidentity = 1 if inrange(sexualidentity,1,2)
replace sexidentity = 0 if sexid==3
/*
1:               Bisexual |      1,605        7.77        7.77
2:         Gay or lesbian |        462        2.24       10.01
3:Heterosexual (straight) |     17,490       84.69       94.69
4:                Missing |        152        0.74       95.43
5:               Not sure |        944        4.57      100.00
*/


*** JUICE CONSUMPTION **** (Q70)
encode q70, gen(juice)
gen juiceconsump = 0 if juice==7
replace juiceconsump = 1 if inrange(juice,1,6)

/*
--------------------------+-----------------------------------
1:           1 time per day |      1,374        6.65        6.65
2:             1 to 3 times |      8,373       40.54       47.19
3:          2 times per day |      1,009        4.89       52.08
4:          3 times per day |        376        1.82       53.90
5:  4 or more times per day |        634        3.07       56.97
6:             4 to 6 times |      2,999       14.52       71.49
7:Did not drink fruit juice |      5,616       27.19       98.68
8:                  Missing |        272        1.32      100.00
*/

*** CARROT CONSUMPION *** 
encode q74, gen(carrot)
gen carrotconsump = 0 if carrot==7
replace carrotconsump = 1 if inrange(carrot,1,6)

/*
1:         1 time per day |        878        4.25        4.25
2:           1 to 3 times |      8,891       43.05       47.30
3:        2 times per day |        327        1.58       48.88
4:        3 times per day |        118        0.57       49.46
5:4 or more times per day |        279        1.35       50.81
6:           4 to 6 times |      2,017        9.77       60.57
7:    Did not eat carrots |      7,829       37.91       98.48
8:                Missing |        314        1.52      100.00
*/

*** SEATBELT USE *** // NOT ASKED IN VERMONT YRBS: 
/*
         Q8 |      Freq.     Percent        Cum.
------------+-----------------------------------
    Missing |     20,653      100.00      100.00
------------+-----------------------------------
      Total |     20,653      100.00
*/

*** SMOKING CONSUMPTION *** 
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
gen binge = . 
replace binge=0 if q44=="0 days"
replace binge=1 if inlist(q44,"1 day","2 days","3 to 5 days","6 to 9 days","10 to 19 days","20 or more days")

*** FREQUENT BINGE DRINKING ***
gen freq_binge = . 
replace freq_binge=0 if inlist(q44,"0 days","1 day","2 days")
replace freq_binge=1 if inlist(q44,"3 to 5 days","6 to 9 days","10 to 19 days","20 or more days")

*** MARIJUANA USE *** 
encode q48, gen(smokedays)
gen marijuana30=.
replace marijuana30=1 if inrange(smokedays,2,6) 
replace marijuana30=0 if smokedays==1 
sum marijuana30

*** BULLYING *** 
gen bullied=.
replace bullied=0 if q23=="No"
replace bullied=1 if q23=="Yes"

gen ebullied=.
replace ebullied=0 if q24=="No"
replace ebullied=1 if q24=="Yes"

gen year = 2017

*** GRADE/CLASSROOM *** (Q3)
gen grade = 9 if q3=="9th grade"
replace grade = 10 if q3=="10th grade"
replace grade = 11 if q3=="11th grade"
replace grade = 12 if q3=="12th grade"
replace grade = 0 if q3=="Ungraded or other grade"

drop if weight==.
gen fips = 50
gen state = "Vermont"

save "VT_labeled_2017.dta", replace



***************************
*** NEW MEXICO 2017 YRBS *******
***************************
capture cd "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files"
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State"
capture cd "F:\YRBS\State"

clear
set more 1 
************************************************************************************************
capture import delimited "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Individual State Raws/CSV/NM_yrbs2017.csv"
capture import delimited "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State/NM_yrbs2017.csv"
capture import delimited "F:\YRBS\State\NM_yrbs2017.csv"
************************************************************************************************
egen age = group(q1)

***Age 14 (12yr = 17, 13yr = 25, 14yr = 1055)
*Category is described as 14 years or younger
gen age14 = 0 if inrange(age,4,7)
replace age14 = 1 if inrange(age,1,3)

***Age 15 (15yr = 1600)
gen age15 = 0 if inlist(age,1,2,3,5,6,7)
replace age15 = 1 if inlist(age,4)

***Age 16 (16yr = 1453)
gen age16 = 0 if inlist(age,1,2,3,4,6,7)
replace age16 = 1 if inlist(age,5)

***Age 17 (17yr = 1219)
gen age17 = 0 if inlist(age,1,2,3,4,5,7)
replace age17 = 1 if inlist(age,6)

***Age 18 (18yr+ = 403)
*Category is described as 18 years or older
gen age18 = 0 if inrange(age,1,6)
replace age18 = 1 if inlist(age,7)

***Actual Age
qui gen age_new = age + 11 if inrange(age,1,7)
tab age_new


*** RACE VARIABLES *** 
encode raceeth, gen(race) // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:

/*
1:  Am Indian/Alaska Native |        884       15.29       15.29
2:                    Asian |         98        1.70       16.99
3:Black or African American |        100        1.73       18.72
4:          Hispanic/Latino |        720       12.45       31.17
5:                  Missing |         99        1.71       32.88
6:      Multiple - Hispanic |      2,569       44.44       77.32
7:  Multiple - Non-Hispanic |        154        2.66       79.99
8: Native Hawaiian/Other PI |         26        0.45       80.44
9:                    White |      1,131       19.56      100.00

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

*** SUICIDE IDEATION *** (Q26)
gen suicideideation = 0 if q26 == "No"
replace suicideideation = 1 if q26 == "Yes"

*** SUICIDE PLAN *** (Q27)
gen suicideplan = 0 if q27 == "No"
replace suicideplan = 1 if q27 == "Yes" 

*** SEX MINORITY VARIABLES *** // (Q67)
encode q67, gen(sexualidentity)
gen sexminority = 0 if sexualidentity==3
replace sexminority = 1 if inlist(sexualidentity,1,2,5)

gen sexidentity = 1 if inrange(sexualidentity,1,2)
replace sexidentity = 0 if sexid==3
/*
1:               Bisexual |        477        8.25        8.25
2:         Gay or lesbian |        173        2.99       11.24
3:Heterosexual (straight) |      4,643       80.31       91.56
4:                Missing |        228        3.94       95.50
5:               Not sure |        260        4.50      100.00

*/

*** JUICE CONSUMPTION **** (Q70)
encode q70, gen(juice)
gen juiceconsump = 0 if juice==7
replace juiceconsump = 1 if inrange(juice,1,6)

/*
--------------------------+-----------------------------------
1:           1 time per day |        296        5.12        5.12
2:             1 to 3 times |      2,161       37.38       42.50
3:          2 times per day |        286        4.95       47.45
4:          3 times per day |        156        2.70       50.15
5:  4 or more times per day |        283        4.90       55.04
6:             4 to 6 times |        712       12.32       67.36
7:Did not drink fruit juice |      1,672       28.92       96.28
8:                  Missing |        215        3.72      100.00


*/

*** CARROT CONSUMPION *** 
encode q74, gen(carrot)
gen carrotconsump = 0 if carrot==7
replace carrotconsump = 1 if inrange(carrot,1,6)

/*
1:         1 time per day |        235        4.07        4.07
2:           1 to 3 times |      1,782       30.83       34.89
3:        2 times per day |         93        1.61       36.50
4:        3 times per day |         60        1.04       37.54
5:4 or more times per day |        128        2.21       39.75
6:           4 to 6 times |        418        7.23       46.98
7:    Did not eat carrots |      2,825       48.87       95.85
8:                Missing |        240        4.15      100.00


*/

*** SEATBELT USE *** // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:
encode q8, gen(seatbelt)
/*
              Q8 |      Freq.     Percent        Cum.
-----------------+-----------------------------------
          Always |      1,144       54.14       54.14
         Missing |          9        0.43       54.57
Most of the time |        597       28.25       82.82
           Never |         45        2.13       84.95
          Rarely |         96        4.54       89.49
       Sometimes |        222       10.51      100.00
*/
gen nrseatbelt=0 if inlist(1,3,5,6)
replace nrseatbelt=1 if inlist(seatbelt,4)

*** GRADE/CLASSROOM *** (Q3)
gen grade = 9 if q3=="9th grade"
replace grade = 10 if q3=="10th grade"
replace grade = 11 if q3=="11th grade"
replace grade = 12 if q3=="12th grade"
replace grade = 0 if q3=="Ungraded or other grade"

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

*Marijuana Use in Past 30 Days
/*
1:         0 times |      4,006       69.30       69.30
2:    1 or 2 times |        476        8.23       77.53
3:  10 to 19 times |        238        4.12       81.65
4:  20 to 39 times |        160        2.77       84.41
5:    3 to 9 times |        382        6.61       91.02
6:40 or more times |        365        6.31       97.34
7:         Missing |        154        2.66      100.00

*/
encode q48, gen(smokedays)
gen marijuana30=.
replace marijuana30=1 if inrange(smokedays,2,6) 
replace marijuana30=0 if smokedays==1 
sum marijuana30

* BULLY
gen bullied=.
replace bullied=0 if q23=="No"
replace bullied=1 if q23=="Yes"

gen ebullied=.
replace ebullied=0 if q24=="No"
replace ebullied=1 if q24=="Yes"


gen year = 2017

drop if weight==.
gen fips = 35
gen state = "New Mexico"

save "NM_labeled_2017.dta", replace



******************************
*** MASSACHUSETTS 2017 YRBS *******
******************************
capture cd "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Data Files"
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State"
capture cd "F:\YRBS\State"
************************************************************************************************
clear
set more 1 
capture import delimited "/Users/Kevin/Documents/GitHub/CHEPS/2017 YRBS/Individual State Raws/CSV/MAH_yrbs2017.csv"
capture import delimited "F:\YRBS\State\MAH_yrbs2017.csv"
capture import delimited "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State/MAH_yrbs2017.csv"
************************************************************************************************
egen age = group(q1)

***Age 14 (12yr = 9, 13yr = 13, 14yr = 296)
*Category is described as 14 years or younger
gen age14 = 0 if inrange(age,4,7)
replace age14 = 1 if inrange(age,1,3)

***Age 15 (15yr = 757)
gen age15 = 0 if inlist(age,1,2,3,5,6,7)
replace age15 = 1 if inlist(age,4)

***Age 16 (16yr = 828)
gen age16 = 0 if inlist(age,1,2,3,4,6,7)
replace age16 = 1 if inlist(age,5)

***Age 17 (17yr = 839)
gen age17 = 0 if inlist(age,1,2,3,4,5,7)
replace age17 = 1 if inlist(age,6)

***Age 18 (18yr+ = 546)
*Category is described as 18 years or older
gen age18 = 0 if inrange(age,1,6)
replace age18 = 1 if inlist(age,7)

***Actual Age
qui gen age_new = age + 11 if inrange(age,1,7)
tab age_new


*** RACE VARIABLES *** 
encode raceeth, gen(race) // DIFFERENT FROM CODEBOOK USE REFERENCE BELOW:

/*
--------------------------+-----------------------------------
1:  Am Indian/Alaska Native |         23        0.70        0.70
2:                    Asian |        261        7.94        8.64
3:Black or African American |        477       14.52       23.16
4:          Hispanic/Latino |        252        7.67       30.83
5:                  Missing |         87        2.65       33.48
6:      Multiple - Hispanic |        498       15.16       48.63
7:  Multiple - Non-Hispanic |        166        5.05       53.68
8: Native Hawaiian/Other PI |         22        0.67       54.35
9:                    White |      1,500       45.65      100.00
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

*** SEX MINORITY VARIABLES *** // 
encode q67, gen(sexualidentity)
/*
1:               Bisexual |        233        7.09        7.09
2:         Gay or lesbian |         92        2.80        9.89
3:Heterosexual (straight) |      2,779       84.57       94.46
4:                Missing |         41        1.25       95.71
5:               Not sure |        141        4.29      100.00
*/
gen sexminority = 1 if inlist(sexualidentity, 1,2,5)
replace sexminority = 0 if sexualidentity==3

gen sexidentity = 1 if inrange(sexualidentity,1,2)
replace sexidentity = 0 if sexualidentity==3

gen heterosexual = 1 if sexualidentity==3
replace heterosexual = 0 if inlist(sexualidentity, 1,2,5)


*** JUICE CONSUMPTION **** (Q70)
encode q70, gen(juice)
/*
1:           1 time per day |        169        5.14        5.14
2:             1 to 3 times |      1,236       37.61       42.76
3:          2 times per day |        154        4.69       47.44
4:          3 times per day |         89        2.71       50.15
5:  4 or more times per day |        127        3.86       54.02
6:             4 to 6 times |        483       14.70       68.72
7:Did not drink fruit juice |        949       28.88       97.60
8:                  Missing |         79        2.40      100.00

*/
gen juiceconsump = 0 if juice==7
replace juiceconsump = 1 if inrange(juice,1,6)

*** CARROT CONSUMPION *** 
encode q74, gen(carrot)
gen carrotconsump = 0 if carrot==7
replace carrotconsump = 1 if inrange(carrot,1,6)

*** SEATBELT USE *** // (Q8) ALL LABELED MISSING

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

*** MARIJUANA CONSUMPTION *** 
/*
1:         0 times |      2,470       75.17       75.17
2:    1 or 2 times |        261        7.94       83.11
3:  10 to 19 times |        107        3.26       86.37
4:  20 to 39 times |         57        1.73       88.10
5:    3 to 9 times |        186        5.66       93.76
6:40 or more times |        125        3.80       97.57
7:         Missing |         80        2.43      100.00
-----------------+-----------------------------------

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

*** 
gen year = 2017

drop if weight==.
gen state = "Massachusetts"
gen fips = 25

save "MA_labeled_2017.dta", replace



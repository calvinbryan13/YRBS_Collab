**********************************************************
******** HARMONIZING DO FILE FOR NATIONAL YRBS ***********
**********************************************************
capture log close
set more 1 
clear all

****************************************************
*** MASTER YRBS DATASET CONTAINING VARIABLES FOR ***
*** MULTIPLE PROJECTS WITHIN CHEPS ORG           ***
*** WE HARMONIZE THE VARIABLES AND COMBINE THEM  ***
*** INTO ONE MASTER FILE FOR WHICH WE WORK WITH  ***
****************************************************

program define setcd // // INSERT CAPTURE CONTROL DIRECTORY HERE TO MASTER DO YRBS FOLDER, REMEMBER TO GO INTO THOSE FILES AND SET CD PATHS AS NEEDED

capture cd "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\National"
*capture cd "F:\YRBS\National"
*capture cd
*capture cd
*capture cd

end
setcd
********************************************************************************
use NYRBS_1991.dta, clear
gen nat1991 = 1
gen national = 1

gen year = 1991
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you?
gen race6 = q4 // How do you describe yourself?
gen student_rank = q5 // Compared to other students in your class, what student would you say you are?
gen seatbelt = q6 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen motorcycle_ride = q7 // During the past 12 months, how many times did you ride a motorcycle?
gen motorcycle_helmet = q8 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen bicycle_ride = q9 // During the past 12 months, how many times did you ride a bicycle?
gen helmet = q10 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen drinkingdriver = q11 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q12 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen lifeguard = q13 // During the past 12 months, when you went swimming in places such as a pool, lake, or ocean, how often was an adult or lifeguard watching you?
gen weaponcarry = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen most_carried_weapon = q15 // During the past 30 days, what one kind of weapon did you carry most often?
gen physical_fight = q16 // During the past 12 months, how many times were you in a physical fight?
gen fight_target = q17 // The last time you were in a physical fight, with whom did you fight?
gen fightinjured = q18 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen suicideconsider = q19 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q20 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q21 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q22 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q23 // Have you ever tried cigarette smoking, even one or two puffs?
gen willtrycigarettes = q24 // Do you think you will try cigarette smoking during the next 12 months?
gen cigarettewhole = q25 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q26 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen agestartsmoke = q27 // How old were you when you first started smoking cigarettes regularly? (at least one cigarette every day for 30 days)
gen cigarette30days = q28 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q29 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen quitcigarettes6 = q30 // During the past 6 months, did you try to quit smoking cigarettes?
gen tobaccochew = q31 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen?
gen alcage = q32 // How old were you had your first drink of alcohol other than a few sips?
gen alcdrink = q33 // During your life, on how many days have you had a least one drink of alcohol?
gen alc30 = q34 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q35 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen howoldmarijuana = q36 // How old were you when you tried marijuana for the first time?
gen marijuanause = q37 // During your life, how many times have you used marijuana?
gen marijuana30days = q38 // During the past 30 days, how many times did you use marijuana?
gen howoldcocaine = q39 // How old were you when you tried any form of cocaine, including powder, crack, or freebase, for the first time?
gen cocaineuse = q40 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q41 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen freebasecocaine = q42 // During your life, how many times have you used the crack or freebase forms of cocaine?
gen qillegaldrug = q43 // During your life, how many times have you used any other type of illegal drug, such as LSD, PCP, ecstasy, mushrooms, speed, ice, heroin, or pills without a doctor's prescription?
gen steroiduse = q44 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen everneedleinject = q45 // During your life, have you ever injected (shot up) any illegal drugs?
gen qtaughtHIV = q46 // Have you ever been taught about AIDS/HIV infection in school?
gen parentstaughtHIV = q47 // Have you ever talked about AIDS/HIV infection with your parents or other adults in your family?
gen anyintercourse = q48 // Have you ever had sexual intercourse?
gen agefirstintercourse = q49 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q50 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q51 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q52 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q53 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol4 = q54 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q55 // How many times have you been pregnant or gotten someone pregnant?
gen hadstd = q56 // Have you ever been told by a doctor or nurse that you had a sexually transmitted disease such as genital herpes, genital warts, chlamydia, syphilis, gonorrhea, AIDS, or HIV infection?
gen weightperception2 = q57 // How do you think of yourself?
gen weightloss2 = q58 // Which of the following are you trying to do?
gen weightlossmethod = q59 // During the past 7 days, which one of the following did you do to lose weight or keep from gaining weight? **diet and exercise answers
gen weightlossmethod2 = q60 // During the past 7 days, which one of the following did you do to lose weight or to keep from gaining weight? **eating disorder answers
gen yesterdayfruit = q61 // Yesterday, did you eat fruit?
gen yesterdayfruitjuice = q62 // Yesterday, did you drink fruit juice?
gen yesterdaysalad = q63 // Yesterday, did you eat green salad?
gen yesterdayvegetable = q64 // Yesterday, did you eat cooked vegetables?
gen yesterdaymeat = q65 // Yesterday, did you eat hamburger, hot dogs, or sausage?
gen yesterdaypotato = q66 // Yesterday, did you eat french fries or potato chips?
gen yesterdaysweets = q67 // Yesterday, did you eat cookies, doughnuts, pie, or cake?
gen sportsactivity = q68 // On how many of the past 7 days did you exercise or participate in sports activities that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activities?
gen stretchactivity = q69 // On how many of the past 7 days did you do stretching exercises, such as toe touching, knee bending, or leg stretching?
gen qmusclestrength = q70 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen walk30 = q71 // Yesterday, did you walk or bicycle for at least 30 minutes at a time? (Include walking or bicycling to or from school.)
gen peattendance = q72 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes = q73 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen schoolsports = q74 // During the past 12 months, on how many sports teams run by your school, did you play? (Do not include PE classes.)
gen outofschoolsports = q75 // During the past 12 months, on how many sports teams run by organizations outside of your school, did you play?

save National91harmonized.dta, replace

********************************************************************************
use NYRBS_1993.dta, clear
gen nat1993 = 1
gen national = 1

gen year = 1993
gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade =	q3	//	In what grade are you?
gen	race6 =	q4	//	6-level variable from race and ethnicity questions:
gen student_rank = q5 // Compared to other students in your class, what student would you say you are?
gen seatbelt = q6 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen motorcycle_ride = q7 // During the past 12 months, how many times did you ride a motorcycle?
gen motorcycle_helmet = q8 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen bicycle_ride = q9 // During the past 12 months, how many times did you ride a bicycle?
gen helmet = q10 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen drinkingdriver = q11 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q12 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q13 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q14 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q15 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q16 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q17 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q18 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q19 // During the past 12 months, how many times were you in a physical fight?
gen fight_target = q20 // The last time you were in a physical fight, with whom did you fight?
gen fightinjured = q21 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q22 // During the past 12 months, how many times were you in a physical fight on school property?
gen lifeguard = q23 // During the past 12 months, when you went swimming in places such as a pool, lake, or ocean, how often was an adult or lifeguard watching you?
gen suicideconsider = q24 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q25 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q26 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q27 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q28 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q29 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q30 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen agestartsmoke = q31 // How old were you when you first started smoking cigarettes regularly? (at least one cigarette every day for 30 days)
gen cigarette30days = q32 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q33 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen qcigschool = q34 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes6 = q35 // During the past 6 months, did you try to quit smoking cigarettes?
gen tobaccochew = q36 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen?
gen tobaccochew2school = q37 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen on school property?
gen alcage = q38 // How old were you had your first drink of alcohol other than a few sips?
gen alcdrink = q39 // During your life, on how many days have you had a least one drink of alcohol?
gen alc30 = q40 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q41 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q42 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howoldmarijuana = q43 // How old were you when you tried marijuana for the first time?
gen marijuanause = q44 // During your life, how many times have you used marijuana?
gen marijuana30days = q45 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q46 // During the past 30 days, how many times did you use marijuana on school property?
gen howoldcocaine = q47 // How old were you when you tried any form of cocaine, including powder, crack, or freebase, for the first time?
gen cocaineuse = q48 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q49 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen freebasecocaine = q50 // During your life, how many times have you used the crack or freebase forms of cocaine?
gen qillegaldrug = q51 // During your life, how many times have you used any other type of illegal drug, such as LSD, PCP, ecstasy, mushrooms, speed, ice, heroin, or pills without a doctor's prescription?
gen steroiduse = q52 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen everneedleinject = q53 // During your life, have you ever injected (shot up) any illegal drugs? 
gen illegaldrugs = q54 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q55 // Have you ever been taught about AIDS/HIV infection in school?
gen parentstaughtHIV = q56 // Have you ever talked about AIDS/HIV infection with your parents or other adults in your family?
gen anyintercourse = q57 // Have you ever had sexual intercourse?
gen agefirstintercourse = q58 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q59 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q60 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q61 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q62 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol4 = q63 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q64 // How many times have you been pregnant or gotten someone pregnant?
gen hadstd = q65 // Have you ever been told by a doctor or nurse that you had a sexually transmitted disease such as genital herpes, genital warts, chlamydia, syphilis, gonorrhea, AIDS, or HIV infection?
gen weightperception2 = q66 // How do you think of yourself?
gen weightloss2 = q67 // Which of the following are you trying to do?
gen weightlossmethod = q68 // During the past 7 days, which one of the following did you do to lose weight or keep from gaining weight?
gen weightlossmethod2 = q69 // During the past 7 days, which one of the following did you do to lose weight or to keep from gaining weight?
gen yesterdayfruit = q70 // Yesterday, did you eat fruit?
gen yesterdayfruitjuice = q71 // Yesterday, did you drink fruit juice?
gen yesterdaysalad = q72 // Yesterday, did you eat green salad?
gen yesterdayvegetable = q73 // Yesterday, did you eat cooked vegetables?
gen yesterdaymeat = q74 // Yesterday, did you eat hamburger, hot dogs, or sausage?
gen yesterdaypotato = q75 // Yesterday, did you eat french fries or potato chips?
gen yesterdaysweets = q76 // Yesterday, did you eat cookies, doughnuts, pie, or cake?
gen sportsactivity20 = q77 // On how many of the past 7 days did you exercise or participate in sports activities for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activities?
gen stretchactivity = q78 // On how many of the past 7 days did you do stretching exercises, such as toe touching, knee bending, or leg stretching?
gen qmusclestrength = q79 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen walk30 = q80 // Yesterday, did you walk or bicycle for at least 30 minutes at a time? (Include walking or bicycling to or from school.)
gen peattendance = q81 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes = q82 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen schoolsports = q83 // During the past 12 months, on how many sports teams run by your school, did you play? (Do not include PE classes.)
gen outofschoolsports = q84 // During the past 12 months, on how many sports teams run by organizations outside of your school, did you play?
gen noclasseshiv = q85 // During this school year, in how many class periods were you taught about AIDS/HIV infection?
gen meduc = q86 // How far in school did your mother go?
gen feduc = q87 // How far in school did your father go?

save National93harmonized.dta, replace
********************************************************************************
use NYRBS_1995.dta, clear
gen nat1995 = 1
gen national = 1

gen year = 1995
gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade =	q3	//	In what grade are you?
gen	race6 =	q4	//	6-level variable from race and ethnicity questions:
gen seatbelt = q5 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen motorcycle_ride = q6 // During the past 12 months, how many times did you ride a motorcycle?
gen motorcycle_helmet = q7 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen bicycle_ride = q8 // During the past 12 months, how many times did you ride a bicycle?
gen helmet = q9 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q17 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen fight_target = q21 // The last time you were in a physical fight, with whom did you fight?
gen suicideconsider = q22 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q23 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q24 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q25 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q26 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q27 // How old were you when you smoked a whole cigarette for the first time?
gen cigarette30days = q28 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q29 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes3 = q30 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response)
gen idcigarettes3 = q31 // When you bought cigarettes in a store during the past 30 days, were you ever asked to show proof of age?
gen qcigschool = q32 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes = q33 // Have you ever tried to quit smoking cigarettes?
gen tobaccochew = q34 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen?
gen tobaccochew2school = q35 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen on school property?
gen alcage = q36 // How old were you had your first drink of alcohol other than a few sips?
gen alcdrink = q37 // During your life, on how many days have you had a least one drink of alcohol?
gen alc30 = q38 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q39 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q40 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howoldmarijuana = q41 // How old were you when you tried marijuana for the first time?
gen marijuanause = q42 // During your life, how many times have you used marijuana?
gen marijuana30days = q43 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q44 // During the past 30 days, how many times did you use marijuana on school property?
gen howoldcocaine = q45 // How old were you when you tried any form of cocaine, including powder, crack, or freebase, for the first time?
gen cocaineuse = q46 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q47 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen freebasecocaine = q48 // During your life, how many times have you used the crack or freebase forms of cocaine?
gen inhalantuse = q49 // During your life, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen steroiduse = q50 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen qillegaldrug = q51 // During your life, how many times have you used any other type of illegal drug, such as LSD, PCP, ecstasy, mushrooms, speed, ice, heroin, or pills without a doctor's prescription?
gen needleinject = q52 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q53 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q54 // Have you ever been taught about AIDS/HIV infection in school?
gen parentstaughtHIV = q55 // Have you ever talked about AIDS/HIV infection with your parents or other adults in your family?
gen anyintercourse = q56 // Have you ever had sexual intercourse?
gen agefirstintercourse = q57 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q58 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q59 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q60 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q61 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol4 = q62 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q63 // How many times have you been pregnant or gotten someone pregnant?
gen weightperception = q64 // How do you describe your weight?
gen weightloss = q65 // Which of the following are you trying to do about your weight?
gen dietweight = q66 // During the past 30 days, did you diet to lose weight or to keep from gaining weight?
gen exerciseweight = q67 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen weightvomit = q68 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills2 = q69 // During the past 30 days, did you take diet pills to lose weight or to keep from gaining weight?
gen yesterdaynofruit = q70 // Yesterday, how many times did you eat fruit?
gen yesterdaynofruitjuice = q71 // Yesterday, how many times did you drink fruit juice?
gen yesterdaynosalad = q72 // Yesterday, how many times did you eat green salad?
gen yesterdaynovegetable = q73 // Yesterday, how many times did you eat cooked vegetables?
gen yesterdaynomeat = q74 // Yesterday, how many times did you eat hamburger, hot dogs, or sausage?
gen yesterdaynopotato = q75 // Yesterday, how many times did you eat french fries or potato chips?
gen yesterdaynosweets = q76 // Yesterday, how many times did you eat cookies, doughnuts, pie, or cake?
gen sportsactivity20 = q77 // On how many of the past 7 days did you exercise or participate in sports activities for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activities?
gen stretchactivity = q78 // On how many of the past 7 days did you do stretching exercises, such as toe touching, knee bending, or leg stretching?
gen qmusclestrength = q79 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen nowalk30 = q80 // On how many of the past 7 days did you walk or bicycle for at least 30 minutes at a time (including walking or bicycling to or from school)?
gen peattendance = q81 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes = q82 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen schoolsports = q83 // During the past 12 months, on how many sports teams run by your school, did you play? (Do not include PE classes.)
gen outofschoolsports = q84 // During the past 12 months, on how many sports teams run by organizations outside of your school, did you play?
gen cigaretteregular = q85 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen agestartsmoke = q86 // How old were you when you first started smoking cigarettes regularly? (at least one cigarette every day for 30 days)
gen meduc = q87 // How much education does your mother have?
gen feduc = q88 // How much education does your father have?

***Dropping American Samoa***
*drop if fips==3

save National95harmonized.dta, replace
********************************************************************************
use NYRBS_1997.dta, clear
gen nat1997 = 1
gen national = 1

gen year = 1997
gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade =	q3	//	In what grade are you?
gen	race6 =	q4	//	6-level variable from race and ethnicity questions:
gen seatbelt = q5 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen motorcycle_ride = q6 // During the past 12 months, how many times did you ride a motorcycle?
gen motorcycle_helmet = q7 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen bicycle_ride = q8 // During the past 12 months, how many times did you ride a bicycle?
gen helmet = q9 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q17 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen suicideconsider = q22 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q23 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q24 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q25 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q26 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q27 // How old were you when you smoked a whole cigarette for the first time?
gen cigarette30days = q28 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q29 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes3 = q30 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response)
gen idcigarettes3 = q31 // When you bought cigarettes in a store during the past 30 days, were you ever asked to show proof of age?
gen qcigschool = q32 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes = q33 // Have you ever tried to quit smoking cigarettes?
gen everdip = q34 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen tobaccochewschool = q35 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen alcage = q36 // How old were you had your first drink of alcohol other than a few sips?
gen alcdrink = q37 // During your life, on how many days have you had a least one drink of alcohol?
gen alc30 = q38 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q39 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q40 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howoldmarijuana = q41 // How old were you when you tried marijuana for the first time?
gen marijuanause = q42 // During your life, how many times have you used marijuana?
gen marijuana30days = q43 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q44 // During the past 30 days, how many times did you use marijuana on school property?
gen howoldcocaine = q45 // How old were you when you tried any form of cocaine, including powder, crack, or freebase, for the first time?
gen cocaineuse = q46 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q47 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen freebasecocaine = q48 // During your life, how many times have you used the crack or freebase forms of cocaine?
gen inhalantuse = q49 // During your life, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen steroiduse = q50 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen qillegaldrug = q51 // During your life, how many times have you used any other type of illegal drug, such as LSD, PCP, ecstasy, mushrooms, speed, ice, heroin, or pills without a doctor's prescription?
gen needleinject = q52 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q53 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q54 // Have you ever been taught about AIDS/HIV infection in school?
gen parentstaughtHIV = q55 // Have you ever talked about AIDS/HIV infection with your parents or other adults in your family?
gen anyintercourse = q56 // Have you ever had sexual intercourse?
gen agefirstintercourse = q57 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q58 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q59 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q60 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q61 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol4 = q62 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q63 // How many times have you been pregnant or gotten someone pregnant?
gen weightperception = q64 // How do you describe your weight?
gen weightloss = q65 // Which of the following are you trying to do about your weight?
gen dietweight = q66 // During the past 30 days, did you diet to lose weight or to keep from gaining weight?
gen exerciseweight = q67 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen weightvomit = q68 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills2 = q69 // During the past 30 days, did you take diet pills to lose weight or to keep from gaining weight?
gen yesterdaynofruit = q70 // Yesterday, how many times did you eat fruit?
gen yesterdaynofruitjuice = q71 // Yesterday, how many times did you drink fruit juice?
gen yesterdaynosalad = q72 // Yesterday, how many times did you eat green salad?
gen yesterdaynovegetable = q73 // Yesterday, how many times did you eat cooked vegetables?
gen yesterdaynomeat = q74 // Yesterday, how many times did you eat hamburger, hot dogs, or sausage?
gen yesterdaynopotato = q75 // Yesterday, how many times did you eat french fries or potato chips?
gen yesterdaynosweets = q76 // Yesterday, how many times did you eat cookies, doughnuts, pie, or cake?
gen sportsactivity20 = q77 // On how many of the past 7 days did you exercise or participate in sports activities for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activities?
gen stretchactivity = q78 // On how many of the past 7 days did you do stretching exercises, such as toe touching, knee bending, or leg stretching?
gen qmusclestrength = q79 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen nowalk30 = q80 // On how many of the past 7 days did you walk or bicycle for at least 30 minutes at a time (including walking or bicycling to or from school)?
gen peattendance = q81 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes = q82 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen schoolsports = q83 // During the past 12 months, on how many sports teams run by your school, did you play? (Do not include PE classes.)
gen outofschoolsports = q84 // During the past 12 months, on how many sports teams run by organizations outside of your school, did you play?
gen cigaretteregular = q85 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen cigarsmoke = q86 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars
gen sexpartnerage = q87 // The last time you had sexual intercourse, how old was your partner?
gen meduc = q88 // How much education does your mother have?
gen feduc = q89 // How much education does your father have?

save National97harmonized.dta, replace
********************************************************************************
use NYRBS_1999.dta, clear
gen nat1999 = 1
gen national = 1

gen year = 1999
gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade =	q3	//	In what grade are you?
gen race8 = q4 // How do you describe yourself?
gen stheight = q5 // How tall are you without your shoes on? (m)
gen stweight = q6 // How much do you weigh without your shoes on? (kg)
gen motorcycle_helmet = q7 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen most_carried_weapon = q12 // During the past 30 days, what one kind of weapon did you carry most often?
gen weaponschool = q13 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q14 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q15 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q16 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen fight_target = q17 // The last time you were in a physical fight, with whom did you fight?
gen fightschool = q18 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q19 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q20 // Have you ever been forced to have sexual intercourse when you did not want to?
gen sexualthingsforced = q21 // During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen sad2weeks = q22 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usualy activities?
gen suicideplanned = q24 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q25 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q26 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q27 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q28 // How old were you when you smoked a whole cigarette for the first time?
gen cigarette30days = q29 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q30 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes3 = q31 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response)
gen idcigarettes2 = q32 // When you bought cigarettes in a store during the past 30 days, were you ever asked to show proof of age?
gen qcigschool = q33 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen agestartsmoke = q34 // How old were you when you first started smoking cigarettes regularly? (at least one cigarette every day for 30 days)
gen quitcigarettes = q35 // Have you ever tried to quit smoking cigarettes?
gen everdip = q36 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen?
gen tobaccochew2school = q37 // During the past 30 days, did you use chewing tobacco, such as Redman, Levi Garrett, or Beechnut, or snuff, such as Skoal, Skoal Bandits, or Copenhagen on school property?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen alcdrink = q39 // During your life, on how many days have you had a least one drink of alcohol?
gen alcage = q40 // How old were you had your first drink of alcohol other than a few sips?
gen alc30 = q41 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q42 // During the past 30 days, on how many days did you have 5 or more drinks in a row, that is, within a few hours?
gen qalcoholschool = q43 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen marijuanause = q44 // During your life, how many times have you used marijuana?
gen howoldmarijuana = q45 // How old were you when you tried marijuana for the first time?
gen qhowmarijuana = q46 // During the past 30 days, how did you usually use marijuana?
gen qmarijuanaschool = q47 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q48 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q49 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen inhalantuse = q50 // During your life, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen inhalantuse30 = q51 // During the past 30 days, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen heroinuse = q52 // During your life, how many times have you used heroin (also called smack, junk, or China White)
gen methuse = q53 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q54 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q55 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q56 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen anyintercourse = q57 // Have you ever had sexual intercourse?
gen agefirstintercourse = q58 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q59 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q60 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q61 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q62 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol3 = q63 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q64 // How many times have you been pregnant or gotten someone pregnant?
gen weightperception = q65 // How do you describe your weight?
gen weightloss = q66 // Which of the following are you trying to do?
gen exerciseweight = q67 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen dietweight2 = q68 // During the past 30 days, did you eat less food, fewer calories, or foods low in fat to lose weight or keep from gaining weight
gen eatingdisorder = q69 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen dietpills = q70 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen weightvomit = q71 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen fruitjuice = q72 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q73 // During the past 7 days, how many times did you eat fruit?
gen salad = q74 // During the past 7 days, how many times did you eat green salad?
gen potato = q75 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q76 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q77 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q78 // During the past 7 days, how many glasses of milk did you drink?
gen physicalactivity20 = q79 // On how many of the past 7 days did you exercise or participate in physical activities for at least 20 minutes that made you sweat and breathe hard?
gen physicalactivity30 = q80 // On how many of the past 7 days did you participate in physical activity for at least 30 minutes that did not make you sweat or breathe hard?
gen qmusclestrength = q81 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen tvwatching = q82 // On an average school day, how many hours do you watch TV?
gen peattendance = q83 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes = q84 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen sportsparticipation = q85 // During the past 12 months, on how many sports teams did you play?
gen exerciseinjury = q86 // During the past 12 months, how many times were you injured while exercising, playing sports, or being physically ative and had to be treated by a doctor or nurse?
gen qtaughtHIV = q87 // Have you ever been taught about AIDS/HIV infection in school?
gen cigarettebrand = q88 // During the past 30 days, what brand of cigarettes did you usually smoke?
gen drcheckup = q89 // When was the last time you saw a doctor or nurse for a check-up or physical exam when you were not sick or injured?
gen drsexed = q90 // During your last check-up, did your doctor or nurse discuss ways to prevent pregnancy, AIDS, or other sexually transmitted diseases (STDs)?
gen oralhealthcare = q91 // When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen qsunscreenuse = q92 // How often do you wear sunscreen or sunblock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day?

save National99harmonized.dta, replace
********************************************************************************
use NYRBS_2001.dta, clear
gen nat2001 = 1
gen national = 1

gen year = 2001
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you?
gen race8 = q4 // How do you describe yourself?
gen stheight = q5 // How tall are you without your shoes on? (m)
gen stweight = q6 // How much do you weigh without your shoes on? (kg)
gen grades = q7 // During the past 12 months how would you describe your grades in school?
gen motorcycle_helmet = q8 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen helmet = q9 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q10 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q11 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q12 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q13 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q14 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q15 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q16 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q17 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q21 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q22 // Have you ever been forced to have sexual intercourse when you did not want to?
gen sad2weeks = q23 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usualy activities?
gen suicideconsider = q24 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q25 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q26 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q27 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q28 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q29 // How old were you when you smoked a whole cigarette for the first time?
gen cigarette30days = q30 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q31 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q32 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response)
gen idcigarettes = q33 // When you bought cigarettes in a store during the past 30 days, were you ever asked to show proof of age?
gen qcigschool = q34 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen cigaretteregular = q35 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen quitcigarettes12 = q36 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q37 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen tobaccochew2school = q38 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen cigarsmoke = q39 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars
gen alcdrink = q40 // During your life, on how many days have you had a least one drink of alcohol?
gen alcage = q41 // How old were you had your first drink of alcohol other than a few sips?
gen alc30 = q42 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q43 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q44 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen marijuanause = q45 // During your life, how many times have you used marijuana?
gen howoldmarijuana = q46 // How old were you when you tried marijuana for the first time?
gen marijuana30days = q47 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q48 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q49 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q50 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen inhalantuse = q51 // During your life, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen inhalantuse30 = q52 // During the past 30 days, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen heroinuse = q53 // During your life, how many times have you used heroin (also called smack, junk, or China White)
gen methuse = q54 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q55 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q56 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q57 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen anyintercourse = q58 // Have you ever had sexual intercourse?
gen agefirstintercourse = q59 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q60 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q61 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q62 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q63 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol3 = q64 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q65 // How many times have you been pregnant or gotten someone pregnant?
gen weightperception = q66 // How do you describe your weight?
gen weightloss = q67 // Which of the following are you trying to do about your weight?
gen exerciseweight = q68 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen dietweight2 = q69 // During the past 30 days, did you eat less food, fewer calories, or foods low in fat to lose weight or keep from gaining weight
gen eatingdisorder = q70 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen dietpills = q71 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen weightvomit = q72 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen fruitjuice = q73 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q74 // During the past 7 days, how many times did you eat fruit?
gen salad = q75 // During the past 7 days, how many times did you eat green salad?
gen potato = q76 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q77 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q78 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q79 // During the past 7 days, how many glasses of milk did you drink?
gen sportsactivity20 = q80 // On how many of the past 7 days did you exercise or participate in sports activities for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activities?
gen physicalactivity30 = q81 // On how many of the past 7 days did you participate in physical activity for at least 30 minutes that did NOT make you sweat or breathe hard?
gen qmusclestrength = q82 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen tvwatching = q83 // On an average school day, how many hours do you watch TV?
gen peattendance = q84 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes2 = q85 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen sportsparticipation = q86 // During the past 12 months, on how many sports teams did you play?
gen qtaughtHIV = q87 // Have you ever been taught about AIDS/HIV infection in school?
gen driveseatbelt = q88 // How often do you wear a seatbelt when driving a car?
gen cigarettebrand = q89 // During the past 30 days, what brand of cigarettes did you usually smoke?
gen ecstatcyuse = q90 // During your life, how many times have you used ecstacy (also called MDMA)?
gen qhallucdrug = q91 // During your life, how many times have you used hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen exerciseinjury30 = q92 // During the past 30 days, did you see a doctor or nurse for an injury that happened while exercising or playing sports?
gen drcheckup = q93 // When was the last time you saw a doctor or nurse for a check-up or physical exam when you were not sick or injured?
gen oralhealthcare = q94 // When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen qsunscreenuse = q95 // How often do you wear sunscreen or sunblock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day?

save National01harmonized.dta, replace
********************************************************************************
use NYRBS_2003.dta, clear
gen nat2003 = 1
gen national = 1

gen year = 2003
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you?
gen race8 = q4 // How do you describe yourself?
gen stheight = q5 // How tall are you without your shoes on? (m)
gen stweight = q6 // How much do you weigh without your shoes on? (kg)
gen grades = q7 // During the past 12 months how would you describe your grades in school?
gen motorcycle_helmet = q8 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q17 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q21 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q22 // Have you ever been forced to have sexual intercourse when you did not want to?
gen sad2weeks = q23 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usualy activities?
gen suicideconsider = q24 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q25 // During the past 12 months, did you make a plan about how you would attempt suicide?
gen suicideattempted = q26 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q27 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q28 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q29 // How old were you when you smoked a whole cigarette for the first time?
gen cigarette30days = q30 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q31 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q32 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response)
gen qcigschool = q33 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen cigaretteregular = q34 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen quitcigarettes12 = q35 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q36 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen tobaccochewschool = q37 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars
gen alcdrink = q39 // During your life, on how many days have you had a least one drink of alcohol?
gen alcage = q40 // How old were you had your first drink of alcohol other than a few sips?
gen alc30 = q41 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q42 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q43 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen marijuanause = q44 // During your life, how many times have you used marijuana?
gen howoldmarijuana = q45 // How old were you when you tried marijuana for the first time?
gen marijuana30days = q46 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q47 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q48 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q49 // During the past 30 days, how many times did you use any form of cocaine, including powder, crack, or freebase?
gen inhalantuse = q50 // During your life, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen inhalantuse30 = q51 // During the past 30 days, how many times have you sniffed glue, or breathed the contents of aersol spray cans, or inhaled any paints or sprays to get high?
gen heroinuse = q52 // During your life, how many times have you used heroin (also called smack, junk, or China White)
gen methuse = q53 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen ecstatcyuse = q54 // During your life, how many times have you used ecstacy (also called MDMA)?
gen steroiduse = q55 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q56 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q57 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen anyintercourse = q58 // Have you ever had sexual intercourse?
gen agefirstintercourse = q59 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q60 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q61 // During the past 3 months, with how many people did you have sexual intercourse?
gen alcoholdrugwsex = q62 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q63 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol3 = q64 // The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy?
gen pregnant = q65 // How many times have you been pregnant or gotten someone pregnant?
gen weightperception = q66 // How do you describe your weight?
gen weightloss = q67 // Which of the following are you trying to do about your weight?
gen exerciseweight = q68 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen dietweight2 = q69 // During the past 30 days, did you eat less food, fewer calories, or foods low in fat to lose weight or keep from gaining weight
gen eatingdisorder = q70 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen dietpills = q71 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen weightvomit = q72 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen fruitjuice = q73 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q74 // During the past 7 days, how many times did you eat fruit?
gen salad = q75 // During the past 7 days, how many times did you eat green salad?
gen potato = q76 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q77 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q78 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q79 // During the past 7 days, how many glasses of milk did you drink?
gen sportsactivity20 = q80 // On how many of the past 7 days did you exercise or participate in sports activities for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activities?
gen physicalactivity30 = q81 // On how many of the past 7 days did you participate in physical activity for at least 30 minutes that did NOT make you sweat or breathe hard?
gen qmusclestrength = q82 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen tvwatching = q83 // On an average school day, how many hours do you watch TV?
gen peattendance = q84 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes2 = q85 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen sportsparticipation = q86 // During the past 12 months, on how many sports teams did you play?
gen qtaughtHIV = q87 // Have you ever been taught about AIDS/HIV infection in school?
gen driveseatbelt = q88 // How often do you wear a seatbelt when driving a car?
gen idcigarettes = q89 // When you bought cigarettes in a store during the past 30 days, were you ever asked to show proof of age?
gen cigarettebrand = q90 // During the past 30 days, what brand of cigarettes did you usually smoke?
gen qhallucdrug = q91 // During your life, how many times have you used hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen computeruse = q92 // On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work?
gen exerciseinjury30 = q93 // During the past 30 days, did you see a doctor or nurse for an injury that happened while exercising or playing sports?
gen oralhealthcare = q94 // When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen qsunscreenuse = q95 // How often do you wear sunscreen or sunblock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day?
gen asthma = q96 // Has a doctor or nurse ever told you that you have asthma?
gen asthmaattack = q97 // During the past 12 months, have you had an episode of asthma or an asthma attack?

save National03harmonized.dta, replace

*** 2005 ***

use NYRBS_2005.dta, clear
gen nat2005=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen fips = fips // State FIPS code
gen greg = greg // Geographic Region (1: Northeast, 2: Midwest, 3: South, 4: West)
gen metrost = metrost // Metropolitan Status (0: Unknown, 1: Urban, 2: Suburban, 3: Rural)
gen ethorig = ethorig
gen raceorig = raceorig
gen q4orig = q4orig
gen bmipct = bmipct
*/


gen year = 2005
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen race8 = q4 // How do you describe yourself? (8 answer options)
gen stheight = q5 // How tall are you without your shoes on? (m)
gen stweight = q6 // How much do you weigh without your shoes on? (kg)
gen describe_health = q7 // How do you describe your health in general?
gen motorcycle_helmet = q88 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q17 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q21 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q22 // Have you ever been forced to have sexual intercourse when you did not want to?
gen sad2weeks = q23 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q24 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q25 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q26 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q27 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q28 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q29 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q34 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen cigarette30days = q30 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q31 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q32 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen idcigarettes = q89 // When you bought cigarettes in a store during the past 30 days, were you ever asked to show proof of age?
gen qcigschool = q33 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes12= q35 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q36 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen tobaccochewschool = q37 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen alcage = q40 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q39 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q41 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q42 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q43 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howoldmarijuana = q45 // How old were you when you tried marijuana for the first time?
gen marijuanause = q44 // During your life, how many times have you used marijuana?
gen marijuana30days = q46 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q47 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q48 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q49 // During the past 30 days, how many times did you use any form of cocaine, inlcuding powder, crack, or freebase?
gen inhalantuse = q50 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q51  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q52 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q54 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q55 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q56 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q85 // Have you ever been taught about AIDS/HIV infection in school
gen anyintercourse = q57 // Have you ever had sexual intercourse?
gen agefirstintercourse = q58 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q59 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q60 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q61 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q62 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol3 = q63 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q64 // How do you describe your weight?
gen weightloss = q65 // Which of the following are you trying to do about your weight?
gen dietweight2 = q67 // During the past 30 days, did you eat less food, fewer calories, or foods low in fat to lose weight or keep from gaining weight?
gen exerciseweight = q66 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen eatingdisorder = q68 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen weightvomit = q70 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills = q69 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen fruitjuice = q71 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q72 // During the past 7 days, how many times did you eat fruit?
gen salad = q73 // During the past 7 days, how many times did you eat green salad?
gen potato = q74 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q75 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q76 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q77 // During the past 7 days, how many glasses of milk did you drink?
gen sportsactivity20 = q78 // On how many of the past 7 days did you exercise or participate in sports activites for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activies?
gen physicalactivity30 = q79 // On how many of the past 7 days did you participate in physical activity for at least 30 minutes that did NOT make you sweat or breathe hard?
gen physicalactivity = q80 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen peattendance = q82 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes2 = q83 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen sportsparticipation = q84 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q93 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q86 // Has a doctor or nurse ever told you that you have asthma?
gen asthmaattack = q87 // During the past 12 months, have you had an episode of asthma or an asthma attack?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q81 // On an average school day, how many hours do you watch TV?
gen qsunscreenuse = q94 // How often do you wear sunscreen or sublock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day? 
gen ecstasyuse = q53 // During your life, how many times have you used ecstasy (also called MDMA)?
gen qhallucdrug = q90 // During your life, how many times have you tried hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen exerciseinjury30 = q92 // During the past 30 days, did you see a doctor or nurse for an injury that happened while exercising or playing sports?
gen computeruse = q91 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sunprotection = q95 // When you are outside for more than one hour on a sunny day, how often do you do one or more of the following: stay in the shade, wear long pants, wear a long-sleeved shirt, or wear a hat that shades your face, ears, and neck?
gen disability = q96 // Do you have any physical disabilities or long-term health problems?
gen missschool = q97 // During the past 30 days, on how many days did you miss classes or school without permission?


save National05harmonized.dta, replace

********************************************************************************
********************************************************************************

*** 2007 ***

use NYRBS_2007.dta, clear
gen nat2007=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen raceeth = raceeth
gen bmipct = bmipct
*/


gen year = 2007
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen hispanic_latino = q4 // Are you hispanic or latino?
gen what_race = q5 // What is your race?
gen stheight = q6 // How tall are you without your shoes on? (m)
gen stweight = q7 // How much do you weigh without your shoes on? (kg)
gen describe_health = q98 // How do you describe your health in general?
gen motorcycle_helmet = q88 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q17 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q21 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q22 // Have you ever been forced to have sexual intercourse when you did not want to?
gen sad2weeks = q23 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q24 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q25 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q26 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q27 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q28 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q29 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q34 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen cigarette30days = q30 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q31 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q32 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen qcigschool = q33 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes12= q35 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q36 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen tobaccochewschool = q37 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen alcage = q40 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q39 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q41 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q42 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q44 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howgetalcohol = q43 // During the past 30 days, how did you usually get the alcohol you drank?
gen howoldmarijuana = q46 // How old were you when you tried marijuana for the first time?
gen marijuanause = q45 // During your life, how many times have you used marijuana?
gen marijuana30days = q47 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q48 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q49 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q50 // During the past 30 days, how many times did you use any form of cocaine, inlcuding powder, crack, or freebase?
gen inhalantuse = q51 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q52  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q53 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q55 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q56 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q57 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q85 // Have you ever been taught about AIDS/HIV infection in school
gen anyintercourse = q58 // Have you ever had sexual intercourse?
gen agefirstintercourse = q59 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q60 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q61 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q62 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q63 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol3 = q64 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q65 // How do you describe your weight?
gen weightloss = q66 // Which of the following are you trying to do about your weight?
gen dietweight2 = q68 // During the past 30 days, did you eat less food, fewer calories, or foods low in fat to lose weight or keep from gaining weight?
gen exerciseweight = q67 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen eatingdisorder = q69 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen weightvomit = q71 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills = q70 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen fruitjuice = q72 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q73 // During the past 7 days, how many times did you eat fruit?
gen salad = q74 // During the past 7 days, how many times did you eat green salad?
gen potato = q75 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q76 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q77 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q78 // During the past 7 days, how many glasses of milk did you drink?
gen nosoda = q79 // During the past 7 days, how many times did you drink a can, bottle,or glass of soda or pop, such as Coke Pepsi, or Sprite? (Do not include diet soda or diet pop). 
gen sportsactivity20 = q90 // On how many of the past 7 days did you exercise or participate in sports activites for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activies?
gen physicalactivity30 = q91 // On how many of the past 7 days did you participate in physical activity for at least 30 minutes that did NOT make you sweat or breathe hard?
gen physicalactivity = q80 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen peattendance = q83 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes2 = q92 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen sportsparticipation = q84 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q94 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q86 // Has a doctor or nurse ever told you that you have asthma?
gen qcurrentasthma = q87 // Do you still have asthma?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q81 // On an average school day, how many hours do you watch TV?
gen qsunscreenuse = q95 // How often do you wear sunscreen or sublock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day? 
gen ecstasyuse = q54 // During your life, how many times have you used ecstasy (also called MDMA)?
gen qhallucdrug = q89 // During your life, how many times have you tried hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen exerciseinjury30 = q93 // During the past 30 days, did you see a doctor or nurse for an injury that happened while exercising or playing sports?
gen computeruse = q82 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sunprotection = q96 // When you are outside for more than one hour on a sunny day, how often do you do one or more of the following: stay in the shade, wear long pants, wear a long-sleeved shirt, or wear a hat that shades your face, ears, and neck?
gen sleephours = q97 // On an average school night, how many hours of sleep do you get? 


save National07harmonized.dta, replace

********************************************************************************
********************************************************************************

*** 2009 ***

use NYRBS_2009.dta, clear
gen nat2009=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen raceeth = raceeth
gen bmipct = bmipct
*/


gen year = 2009
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen hispanic_latino = q4 // Are you hispanic or latino?
gen what_race = q5 // What is your race?
gen stheight = q6 // How tall are you without your shoes on? (m)
gen stweight = q7 // How much do you weigh without your shoes on? (kg)
gen grades = q98 // During the past 12 months, how would you describe your grades in school?
gen motorcycle_helmet = q88 // When you rode a motorcycle during the past 12 months, how often did you wear a helmet?
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen physical_fight = q17 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q18 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q19 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q20 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q21 // Have you ever been forced to have sexual intercourse when you did not want to?
gen schoolbully = q22 // During the past 12 months, have you ever been bullied on school property?
gen sad2weeks = q23 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q24 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q25 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q26 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q27 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q28 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q29 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q34 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen cigarette30days = q30 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q31 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q32 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen qcigschool = q33 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes12= q35 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q36 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen tobaccochewschool = q37 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen alcage = q40 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q39 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q41 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q42 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q44 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howgetalcohol = q43 // During the past 30 days, how did you usually get the alcohol you drank?
gen howoldmarijuana = q46 // How old were you when you tried marijuana for the first time?
gen marijuanause = q45 // During your life, how many times have you used marijuana?
gen marijuana30days = q47 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q48 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q49 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q50 // During the past 30 days, how many times did you use any form of cocaine, inlcuding powder, crack, or freebase?
gen inhalantuse = q51 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q52  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q53 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q55 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q56 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q57 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q85 // Have you ever been taught about AIDS/HIV infection in school
gen anyintercourse = q58 // Have you ever had sexual intercourse?
gen agefirstintercourse = q59 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q60 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q61 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q62 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q63 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol3 = q64 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q65 // How do you describe your weight?
gen weightloss = q66 // Which of the following are you trying to do about your weight?
gen dietweight2 = q68 // During the past 30 days, did you eat less food, fewer calories, or foods low in fat to lose weight or keep from gaining weight?
gen exerciseweight = q67 // During the past 30 days, did you exercise to lose weight or to keep from gaining weight?
gen eatingdisorder = q69 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen weightvomit = q71 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills = q70 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen fruitjuice = q72 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q73 // During the past 7 days, how many times did you eat fruit?
gen salad = q74 // During the past 7 days, how many times did you eat green salad?
gen potato = q75 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q76 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q77 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q79 // During the past 7 days, how many glasses of milk did you drink?
gen nosoda = q78 // During the past 7 days, how many times did you drink a can, bottle,or glass of soda or pop, such as Coke Pepsi, or Sprite? (Do not include diet soda or diet pop). 
gen sportsactivity20 = q91 // On how many of the past 7 days did you exercise or participate in sports activites for at least 20 minutes that made you sweat and breathe hard, such as basketball, jogging, fast dancing, swimming laps, tennis, fast bicycling, or similar aerobic activies?
gen physicalactivity30 = q92 // On how many of the past 7 days did you participate in physical activity for at least 30 minutes that did NOT make you sweat or breathe hard?
gen physicalactivity = q80 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen peattendance = q83 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen exerciseminutes2 = q93 // During an average physical education (PE) class, how many minutes do you spend actually exercising or playing sports?
gen sportsparticipation = q84 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q94 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q86 // Has a doctor or nurse ever told you that you have asthma?
gen qcurrentasthma = q87 // Do you still have asthma?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q81 // On an average school day, how many hours do you watch TV?
gen qsunscreenuse = q95 // How often do you wear sunscreen or sublock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day? 
gen qindoortanning = q96 // During the past 12 months, how many times did you use an indoor tanning device such as a sunlamp, sunbed, or tanning booth? (Do not include getting a spray-on tan.)(
gen ecstasyuse = q54 // During your life, how many times have you used ecstasy (also called MDMA)?
gen qhallucdrug = q89 // During your life, how many times have you tried hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen computeruse = q82 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sleephours = q97 // On an average school night, how many hours of sleep do you get? 
gen prescriptionuse = q90 // During your life, how many times have you taken a prescription drug (such as OcyContin, Percocet, Vicodin, Adderall, Ritalin, or Xanax) without a doctor's prescription?


save National09harmonized.dta, replace

********************************************************************************
********************************************************************************

*** 2011 ***

use NYRBS_2011.dta, clear
gen nat2011=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen raceeth = raceeth
gen bmipct = bmipct
*/


gen year = 2011
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen hispanic_latino = q4 // Are you hispanic or latino?
gen what_race = q5 // What is your race?
gen stheight = q6 // How tall are you without your shoes on? (m)
gen stweight = q7 // How much do you weigh without your shoes on? (kg)
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive2 = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q13 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q14 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen qpropertydamage = q88 // During the past 12 months, how many times has someone stolen or deliberately damaged your property such as your car, clothing, or books on school property?
gen physical_fight = q17 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q18 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q19 // During the past 12 months, how many times were you in a physical fight on school property?
gen partner_hit = q20 // During the past 12 months, did your boyfriend or girlfriend ever hit, slap, or physically hurt you on purpose?
gen intercourseforced = q21 // Have you ever been forced to have sexual intercourse when you did not want to?
gen schoolbully = q22 // During the past 12 months, have you ever been bullied on school property?
gen electronicbully = q23 // During the past 12 months, have you ever been electronically bullied? (Include being bullied through email, chat rooms, instant messaging, websites, or texting.)
gen sad2weeks = q24 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q25 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q26 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q27 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q28 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q29 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q30 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q35 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen cigarette30days = q31 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q32 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q33 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen qcigschool = q34 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes12= q36 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q37 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen tobaccochewschool = q38 // During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip on school property?
gen alcage = q41 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q40 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q42 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q43 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen qalcoholschool = q45 // During the past 30 days, on how many days did you have at least one drink of alcohol on school property?
gen howgetalcohol = q44 // During the past 30 days, how did you usually get the alcohol you drank?
gen howoldmarijuana = q47 // How old were you when you tried marijuana for the first time?
gen marijuanause = q46 // During your life, how many times have you used marijuana?
gen marijuana30days = q48 // During the past 30 days, how many times did you use marijuana?
gen qmarijuanaschool = q49 // During the past 30 days, how many times did you use marijuana on school property?
gen cocaineuse = q50 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen qcurrentcocaine = q51 // During the past 30 days, how many times did you use any form of cocaine, inlcuding powder, crack, or freebase?
gen inhalantuse = q52 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q53  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q54 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q56 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q58 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q59 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q84 // Have you ever been taught about AIDS/HIV infection in school
gen anyintercourse = q60 // Have you ever had sexual intercourse?
gen agefirstintercourse = q61 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q62 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q63 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q64 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q65 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol2 = q66 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q67 // How do you describe your weight?
gen weightloss = q68 // Which of the following are you trying to do about your weight?
gen eatingdisorder = q69 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen weightvomit = q71 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills = q70 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen fruitjuice = q72 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q73 // During the past 7 days, how many times did you eat fruit?
gen salad = q74 // During the past 7 days, how many times did you eat green salad?
gen potato = q75 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q76 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q77 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q90 // During the past 7 days, how many glasses of milk did you drink?
gen nosoda = q78 // During the past 7 days, how many times did you drink a can, bottle,or glass of soda or pop, such as Coke Pepsi, or Sprite? (Do not include diet soda or diet pop). 
gen physicalactivity = q79 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen qmusclestrength = q92 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen peattendance = q82 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen sportsparticipation = q83 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q93 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q85 // Has a doctor or nurse ever told you that you have asthma?
gen qcurrentasthma = q86 // Do you still have asthma?
gen cigarsmoke = q39 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q80 // On an average school day, how many hours do you watch TV?
gen qsunscreenuse = q94 // How often do you wear sunscreen or sublock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day? 
gen qindoortanning = q95 // During the past 12 months, how many times did you use an indoor tanning device such as a sunlamp, sunbed, or tanning booth? (Do not include getting a spray-on tan.)(
gen ecstasyuse = q55 // During your life, how many times have you used ecstasy (also called MDMA)?
gen qhallucdrug = q89 // During your life, how many times have you tried hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen computeruse = q81 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sleephours = q96 // On an average school night, how many hours of sleep do you get? 
gen prescriptionuse = q57 // During your life, how many times have you taken a prescription drug (such as OcyContin, Percocet, Vicodin, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen textdrive = q87 // During the past 30 days, on how many days did you text or email while driving a car or other vehicle (1: 0)
gen breakfast = q91 // During the past 7 days, on how may days did you eat breakfast?
gen schooladvice = q97 // During the past 12 months, did you talk to a teacher or other adult in your school about a personal problem you had?


save National11harmonized.dta, replace

********************************************************************************
********************************************************************************

*** 2013 ***

use NYRBS_2013.dta, clear
gen nat2013=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen raceeth = raceeth
gen bmipct = bmipct
gen site = site
gen q6orig = q6orig
gen q7orig = q7orig
*/


gen year = 2013
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen hispanic_latino = q4 // Are you hispanic or latino?
gen what_race = q5 // What is your race?
gen stheight = q6 // How tall are you without your shoes on? (m)
gen stweight = q7 // How much do you weigh without your shoes on? (kg)
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q13 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q14 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q15 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q16 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q17 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen intercourseforced = q21 // Have you ever been forced to have sexual intercourse when you did not want to?
gen dateviolence = q22 // During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen datesexviolence = q23 // During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen schoolbully = q24 // During the past 12 months, have you ever been bullied on school property?
gen electronicbully = q25 // During the past 12 months, have you ever been electronically bullied? (Include being bullied through email, chat rooms, instant messaging, websites, or texting.)
gen sad2weeks = q26 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q27 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q28 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q29 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q30 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q31 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q32 // How old were you when you smoked a whole cigarette for the first time?
gen cigaretteregular = q37 // Have you ever smoked cigarettes regularly, that is, at least one cigarette every day for 30 days?
gen cigarette30days = q33 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q34 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes2 = q35 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen qcigschool = q36 // During the past 30 days, on how many days did you smoke cigarettes on school property?
gen quitcigarettes12= q38 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q39 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen alcage = q42 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q41 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q43 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q44 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen alcdrinksrow = q45 // During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen howgetalcohol = q46 // During the past 30 days, how did you usually get the alcohol you drank?
gen howoldmarijuana = q48 // How old were you when you tried marijuana for the first time?
gen marijuanause = q47 // During your life, how many times have you used marijuana?
gen marijuana30days = q49 // During the past 30 days, how many times did you use marijuana?
gen cocaineuse = q50 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen inhalantuse = q51 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q52  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q53 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q55 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q57 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q58 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen qtaughtHIV = q85 // Have you ever been taught about AIDS/HIV infection in school
gen anyintercourse = q59 // Have you ever had sexual intercourse?
gen agefirstintercourse = q60 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q61 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q62 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q63 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q64 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol = q65 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q66 // How do you describe your weight?
gen weightloss = q67 // Which of the following are you trying to do about your weight?
gen eatingdisorder = q68 // During the past 30 days, did you go without eating for 24 hours or more (also called fasting) to lose weight or keep from gaining weight?
gen weightvomit = q70 // During the past 30 days, did you vomit or take laxatives to lose weight or to keep from gaining weight?
gen dietpills = q69 // During the past 30 days, did you take any diet pills, powders, or liquids without a doctor's advice to lose weight?
gen fruitjuice = q71 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q72 // During the past 7 days, how many times did you eat fruit?
gen salad = q73 // During the past 7 days, how many times did you eat green salad?
gen potato = q74 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q75 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q76 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q78 // During the past 7 days, how many glasses of milk did you drink?
gen nosoda = q77 // During the past 7 days, how many times did you drink a can, bottle,or glass of soda or pop, such as Coke Pepsi, or Sprite? (Do not include diet soda or diet pop). 
gen physicalactivity = q80 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen qmusclestrength = q88 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen peattendance = q83 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen sportsparticipation = q84 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q89 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q86 // Has a doctor or nurse ever told you that you have asthma?
gen qcurrentasthma = q87 // Do you still have asthma?
gen cigarsmoke = q40 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q81 // On an average school day, how many hours do you watch TV?
gen qsunscreenuse = q90 // How often do you wear sunscreen or sublock with an SPF of 15 or higher when you are outside for more than one hour on a sunny day? 
gen qindoortanning = q91 // During the past 12 months, how many times did you use an indoor tanning device such as a sunlamp, sunbed, or tanning booth? (Do not include getting a spray-on tan.)(
gen ecstasyuse = q54 // During your life, how many times have you used ecstasy (also called MDMA)?
gen computeruse = q82 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sleephours = q92 // On an average school night, how many hours of sleep do you get? 
gen prescriptionuse = q56 // During your life, how many times have you taken a prescription drug (such as OcyContin, Percocet, Vicodin, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen textdrive = q12 // During the past 30 days, on how many days did you text or email while driving a car or other vehicle (1: 0)
gen breakfast = q79 // During the past 7 days, on how may days did you eat breakfast?


save National13harmonized.dta, replace

********************************************************************************
********************************************************************************

*** 2015 *** 

use NYRBS_2015.dta, clear
gen nat2015=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen raceeth = raceeth
gen bmipct = bmipct
gen site = site
gen q6orig = q6orig
gen q7orig = q7orig
*/


gen year = 2015
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen hispanic_latino = q4 // Are you hispanic or latino?
gen what_race = q5 // What is your race?
gen stheight = q6 // How tall are you without your shoes on? (m)
gen stweight = q7 // How much do you weigh without your shoes on? (kg)
gen grades = q89 // During the past 12 months how would you describe your grades in school?
gen helmet = q8 // When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen seatbelt = q9 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q10 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive = q11 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q13 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q14 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q15 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q16 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q17 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen physical_fight = q18 // During the past 12 months, how many times were you in a physical fight?
gen fightinjured = q19 // During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen fightschool = q20 // During the past 12 months, how many times were you in a physical fight on school property?
gen intercourseforced = q21 // Have you ever been forced to have sexual intercourse when you did not want to?
gen dateviolence = q22 // During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen datesexviolence = q23 // During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen schoolbully = q24 // During the past 12 months, have you ever been bullied on school property?
gen electronicbully = q25 // During the past 12 months, have you ever been electronically bullied? (Include being bullied through email, chat rooms, instant messaging, websites, or texting.)
gen sad2weeks = q26 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q27 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q28 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q29 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q30 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q31 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettewhole = q32 // How old were you when you smoked a whole cigarette for the first time?
gen cigarette30days = q33 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q34 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen getcigarettes = q35 // During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen quitcigarettes12= q36 // During the past 12 months, did you try to quit smoking cigarettes?
gen tobaccochew = q37 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen evaporuse = q39 // Have you ever used an electronic vapor product?
gen evaporuse30 = q40 // During the past 30 days, on how many days did you use an electronic vapor product?
gen alcage = q42 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q41 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q43 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc5row = q44 // During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen alcdrinksrow = q45 // During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen howgetalcohol = q46 // During the past 30 days, how did you usually get the alcohol you drank?
gen howoldmarijuana = q48 // How old were you when you tried marijuana for the first time?
gen marijuanause = q47 // During your life, how many times have you used marijuana?
gen marijuana30days = q49 // During the past 30 days, how many times did you use marijuana?
gen qhowmarijuana = q90 // During the past 30 days, how did you usually use marijuana?
gen synthmarijuanause = q55 // During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen cocaineuse = q50 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen inhalantuse = q51 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q52  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q53 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q56 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q58 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q59 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen anyintercourse = q60 // Have you ever had sexual intercourse?
gen agefirstintercourse = q61 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q62 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q63 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q64 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q65 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol = q66 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q69 // How do you describe your weight?
gen weightloss = q70 // Which of the following are you trying to do about your weight?
gen fruitjuice = q71 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q72 // During the past 7 days, how many times did you eat fruit?
gen salad = q73 // During the past 7 days, how many times did you eat green salad?
gen potato = q74 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q75 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q76 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q78 // During the past 7 days, how many glasses of milk did you drink?
gen nosoda = q77 // During the past 7 days, how many times did you drink a can, bottle,or glass of soda or pop, such as Coke Pepsi, or Sprite? (Do not include diet soda or diet pop). 
gen physicalactivity = q80 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen qmusclestrength = q95 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen peattendance = q83 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen sportsparticipation = q84 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q85 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q87 // Has a doctor or nurse ever told you that you have asthma?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q81 // On an average school day, how many hours do you watch TV?
gen oralhealthcare = q86 // When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen qindoortanning = q96 // During the past 12 months, how many times did you use an indoor tanning device such as a sunlamp, sunbed, or tanning booth? (Do not include getting a spray-on tan.)(
gen ecstasyuse = q54 // During your life, how many times have you used ecstasy (also called MDMA)?
gen qhallucdrug = q91 // During your life, how many times have you used hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen computeruse = q82 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sleephours = q88 // On an average school night, how many hours of sleep do you get? 
gen prescriptionuse = q57 // During your life, how many times have you taken a prescription drug (such as OcyContin, Percocet, Vicodin, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen textdrive = q12 // During the past 30 days, on how many days did you text or email while driving a car or other vehicle (1: 0)
gen breakfast = q79 // During the past 7 days, on how may days did you eat breakfast?
gen qsportsdrink  = q92 // During the past 7 days, how many times did you drink a can, bottle, or glass of a sports drink such as Gatorade or PowerAde? 
gen qwater = q93 // During the past 7 days, how many times did you drink a bottle or glass of plain water?
gen qfoodallergy = q94 // Are there any foods that you have to avoid because eating the food could cause an allergic reaction, like skin rashes, swelling, itching, vomiting, coughing, or trouble breathing?
gen qsunburn = q97 // During the past 12 months, how many times have you had a sunburn?
gen qconcentrating = q98 // Because of a physical, mental, or emotional problem, do you have serious difficulty concentrating, remembering, or making decisions?
gen qspeakenglish = q99 // How well do you speak English?


save National15harmonized.dta, replace

********************************************************************************
********************************************************************************

*** 2017 ***

use NYRBS_2017.dta, clear
gen nat2017=1
gen national = 1

/*gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen raceeth = raceeth
gen bmipct = bmipct
gen site = site
gen q6orig = q6orig
gen q7orig = q7orig
*/


gen year = 2017
gen fips = stfips
gen age = q1 // How old are you?
gen sex = q2 // What is your sex?
gen grade = q3 // In what grade are you? 
gen hispanic_latino = q4 // Are you hispanic or latino?
gen what_race = q5 // What is your race?
gen stheight = q6 // How tall are you without your shoes on? (m)
gen stweight = q7 // How much do you weigh without your shoes on? (kg)
gen grades = q89 // During the past 12 months how would you describe your grades in school?
gen seatbelt = q8 // How often do you wear a seatbelt when riding in a car driven by someone else?
gen drinkingdriver = q9 // During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen drinkdrive = q10 // During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen weaponcarry = q12 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen guncarry30days = q14 // During the past 30 days, on how many days did you carry a gun?
gen weaponschool = q13 // During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen safetyschool = q15 // During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen threatenschool = q16 // During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen physical_fight = q17 // During the past 12 months, how many times were you in a physical fight?
gen fight_target = q18 // The last time you were in a physical fight, with whom did you fight?
gen intercourseforced = q19 // Have you ever been forced to have sexual intercourse when you did not want to?
gen sexualthingsforced = q20 // During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen dateviolence = q22 // During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen datesexviolence = q21 // During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen schoolbully = q23 // During the past 12 months, have you ever been bullied on school property?
gen electronicbully = q24 // During the past 12 months, have you ever been electronically bullied? (Include being bullied through email, chat rooms, instant messaging, websites, or texting.)
gen sad2weeks = q25 // During the last 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen suicideconsider = q26 // During the past 12 months, did you ever seriously consider attempting suicide?
gen suicideplanned = q27 // During the past 12 months, did you ever make a plan about how you would attempt suicide?
gen suicideattempted = q28 // During the past 12 months, how many times did you actually attempt suicide?
gen suicideinjured = q29 // If you attempted suicide during the past 12 months, did any attempt results in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen cigarettetried = q30 // Have you ever tried cigarette smoking, even one or two puffs?
gen cigarettefirststage = q31 // How old were you when you first tried cigarette smoking, even one or two puffs?
gen cigarette30days = q32 // During the past 30 days, on how many days did you smoke cigarettes?
gen cigaretteperday = q33 // During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen tobaccochew = q37 // During the past 30 days, on how many days did you use chewing tobaccof, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen
gen evaporuse = q34 // Have you ever used an electronic vapor product?
gen evaporuse30 = q35 // During the past 30 days, on how many days did you use an electronic vapor product?
gen evaporget = q36 // During the past 30 days, how did you usually get your own electronic vapor products?
gen quittobacco = q39 // During the past 12 months, did you ever try to quit using all tobacco products, including cigarettes, cigars, smokeless tobacco, shisha, or hookah tobacco, and electronic vapor products?
gen alcage = q41 // How old were you when you had your first drink of alcohol other than a few sips?
gen alcdrink = q40 // During your life, on how many days have you had at least one drink of alcohol?
gen alc30 = q42 // During the past 30 days, on how many days did you have at least one drink of alcohol?
gen alc4or5row = q44 // During the past 30 days, on how many days did you have 4 or more drinks of alcohol in a row (if you are female) or 5 or more drinks in a row (if you are male)
gen alcdrinksrow = q45 // During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen howgetalcohol = q43 // During the past 30 days, how did you usually get the alcohol you drank?
gen howoldmarijuana = q47 // How old were you when you tried marijuana for the first time?
gen marijuanause = q46 // During your life, how many times have you used marijuana?
gen synthmarijuanause = q54 // During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen cocaineuse = q49 // During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen inhalantuse = q50 // During your life, how many times have you sniffed glue, or breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get you high?
gen heroinuse  = q51  // During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen methuse = q52 // During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)?
gen steroiduse = q55 // During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen needleinject = q57 // During your life, how many times have you used a needle to inject any illegal drug into your body?
gen illegaldrugs = q58 // During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen anyintercourse = q59 // Have you ever had sexual intercourse?
gen agefirstintercourse = q60 // How old were you when you had sexual intercourse for the first time?
gen sexualpartners = q61 // During your life, with how many people have you had sexual intercourse?
gen currentsexualactivity = q62 // During the past 3 months, with how many people have you had sexual intercourse?
gen alcoholdrugwsex = q63 // Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen condomuse = q64 // The last time you had sexual intercourse, did you or your partner use a condom?
gen birthcontrol = q65 // The last time you had sexual intercourse, what one method of birth control did you or your partner use to prevent pregnancy?
gen weightperception = q68 // How do you describe your weight?
gen weightloss = q69 // Which of the following are you trying to do about your weight?
gen fruitjuice = q70 // During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice?
gen fruit = q71 // During the past 7 days, how many times did you eat fruit?
gen salad = q72 // During the past 7 days, how many times did you eat green salad?
gen potato = q73 // During the past 7 days, how many times did you eat potatoes?
gen carrot = q74 // During the past 7 days, how many times did you eat carrots?
gen othervegetable = q75 // During the past 7 days, how many times did you eat other vegetables?
gen nomilk = q77 // During the past 7 days, how many glasses of milk did you drink?
gen nosoda = q76 // During the past 7 days, how many times did you drink a can, bottle,or glass of soda or pop, such as Coke Pepsi, or Sprite? (Do not include diet soda or diet pop). 
gen physicalactivity = q79 // During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day?
gen qmusclestrength = q95 // On how many of the past 7 days did you do exercises to strengthen or tone your muscles, such as push-ups, sit-ups, or weight lifting?
gen peattendance = q82 // In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen sportsparticipation = q83 // During the past 12 months, on how many sports teams did you play?
gen hivtesting = q85 // Have you ever been tested for HIB, the virus that causes AIDS?
gen asthma = q87 // Has a doctor or nurse ever told you that you have asthma?
gen cigarsmoke = q38 // During the past 30 days, on how many days did you smoke any cigars, cigarillos, or little cigars?
gen tvwatching = q80 // On an average school day, how many hours do you watch TV?
gen oralhealthcare = q86 // When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen qindoortanning = q96 // During the past 12 months, how many times did you use an indoor tanning device such as a sunlamp, sunbed, or tanning booth? (Do not include getting a spray-on tan.)(
gen ecstasyuse = q53 // During your life, how many times have you used ecstasy (also called MDMA)?
gen qhallucdrug = q91 // During your life, how many times have you used hallucinogenic drugs, such as LSD, acid, PCP, angel dust, mescaline, or mushrooms?
gen computeruse = q81 // On an average school day, how many hours do you play video games or use a computer for something that is not school work?
gen sleephours = q88 // On an average school night, how many hours of sleep do you get? 
gen prescriptionuse = q56 // During your life, how many times have you taken a prescription drug (such as OcyContin, Percocet, Vicodin, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen textdrive = q11 // During the past 30 days, on how many days did you text or email while driving a car or other vehicle (1: 0)
gen breakfast = q78 // During the past 7 days, on how may days did you eat breakfast?
gen qsportsdrink  = q92 // During the past 7 days, how many times did you drink a can, bottle, or glass of a sports drink such as Gatorade or PowerAde? 
gen qwater = q93 // During the past 7 days, how many times did you drink a bottle or glass of plain water?
gen qfoodallergy = q94 // Are there any foods that you have to avoid because eating the food could cause an allergic reaction, like skin rashes, swelling, itching, vomiting, coughing, or trouble breathing?
gen qsunburn = q97 // During the past 12 months, how many times have you had a sunburn?
gen qconcentrating = q98 // Because of a physical, mental, or emotional problem, do you have serious difficulty concentrating, remembering, or making decisions?
gen qspeakenglish = q99 // How well do you speak English?
gen concussion = q84 // During the past 12 months, how many times did you have a concussion from playing a sport or being physically active?
gen qdrivemarijuana = q90 // During the past 30 days, how many times did you drive a car or other vehicle when you had been using marijuana (also called grass, pot, or weed)?


save National17harmonized.dta, replace
********************************************************************************
use National91harmonized.dta, clear
append using National93harmonized.dta, force
append using National95harmonized.dta, force
append using National97harmonized.dta, force
append using National99harmonized.dta, force
append using National01harmonized.dta, force
append using National03harmonized.dta, force
append using National05harmonized.dta, force
append using National07harmonized.dta, force
append using National09harmonized.dta, force
append using National11harmonized.dta, force
append using National13harmonized.dta, force
append using National15harmonized.dta, force
append using National17harmonized.dta, force

foreach var in national nat1991 nat1993 nat1995 nat1997 nat1999 nat2001 nat2003 nat2005 nat2007 nat2009 nat2011 nat2013 nat2015 nat2017 {
replace `var' = `var'==1
label variable `var' "Comes from `var' Dataset"
}

drop q1* q2* q3* q4* q5* q6 q60 q61 q62 q63 q64 q65 q66 q67 q68 q69 q7 q70 q71 q72 q73 q74 q75 q76 q77 q78 q79 q8* q9* qn1* qn2* qn3* qn4* qn5* qn6* qn7* qn8* qn9*
// no q6* q7* to preserve variables "q6orig" & "q7orig" 

save National_Master.dta, replace

*********************************
*** COMBINE WITH STATE MASTER ***
*********************************



*****************************For looking at National and State**********************************

use National_Master.dta, clear
append using "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State\State_Master.dta", force

foreach var in national nat1991 nat1993 nat1995 nat1997 nat1999 nat2001 nat2003 nat2005 nat2007 nat2009 nat2011 nat2013 nat2015 nat2017 yrbs2015 yrbs2017 yrbstam yrbsmassachusetts2015 yrbsconnecticut2017 yrbsvermont2015 yrbsindiana2015 yrbsvermont2017 yrbsmaryland2017 yrbsmassachusetts2017 yrbsnewmexico2017 yrbstexas2017{
replace `var' = `var'==1
label variable `var' "Comes from `var' Dataset"
}

save "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State\Combined_Master.dta", replace


/*
****************************For when looking just at National************************************
foreach var in national nat1991 nat1993 nat1995 nat1997 nat1999 nat2001 nat2003 nat2005 nat2007 nat2009 nat2011 nat2013 nat2015 nat2017 {
replace `var' = `var'==1
label variable `var' "Comes from `var' Dataset"
}



save "C:\Users\Cal\OneDrive\Grad School Documents\CHEPS materials\School Choice on Mental Health\Data\State\National_Master.dta", replace

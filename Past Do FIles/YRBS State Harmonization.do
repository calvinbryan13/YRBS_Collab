**********************************************************
**** HARMONIZING DO FILE STATE 2015 AND STATE 2017 *******
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
capture cd "/Users/Kevin/Documents/YRBS-Master-Dataset/Data Files" // KEVIN
capture cd "C:\Users\Cal\OneDrive\Grad School Documents\YRBS-Master-Dataset\2017 Individual State Do" // CAL
capture cd "F:\YRBS\State" // ALICIA
// INSERT CD HERE
// INSERT CD HERE
end
setcd
************************************************************************
use State15.dta, clear
gen yrbs2015 = 1 

/*gen	sitecode	=	sitecode	//	Two- or three-character survey site code that uniquely identifies a survey location
gen	sitename	=	sitename	//	Name of location covered by a survey
gen	sitetype	=	sitetype	//	ype of survey site – “District”, “State”, or “National”
gen	year	=	year	//	4-digit year of survey – 1991, 1993, etc.
gen	survyear	=	survyear	//	Number of year of survey:
gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen	record	=	record	//	Record
gen	age	=	age	//	How old are you?
gen	sex	=	sex	//	What is your sex?
gen	grade	=	grade	//	In what grade are you?
gen	race4	=	race4	//	4-level variable from race and ethnicity questions:
gen	race7	=	race7	//	7-level variable from race and ethnicity questions:
gen	stheight	=	stheight	//	How tall are you without your shoes on?
gen	stweight	=	stweight	//	How much do you weigh without your shoes on?
gen	bmi	=	bmi	//	Body mass index (BMI)
gen	bmipct	=	bmipct	//	Student’s bmi percentile
gen	sexid	=	sexid	//	Sexual identity:
gen	sexid2	=	sexid2	//	Collapsed sexual identity:
gen	sexpart	=	sexpart	//	Sex of sexual contact(s):
gen	sexpart2	=	sexpart2	//	Collapsed sex of sexual contact(s):
*/
gen	helmet	=	q8	//	When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen	seatbelt	=	q9	//	How often do you wear a seat belt when riding in a car driven by someone else?
gen	drinkingdriver	=	q10	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q11	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q12	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry30days	=	q14	//	During the past 30 days, on how many days did you carry a gun
gen	weaponschool	=	q15	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q16	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q17	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q18	//	During the past 12 months, how many times were you in a physical fight?
gen	fightinjured	=	q19	//	During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen	fightschool	=	q20	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	intercourseforced	=	q21	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q23	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q24	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q25	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q26	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q27	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q28	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q29	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q30	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q31	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarettewhole	=	q32	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q33	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	cigaretteperday	=	q34	//	During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen	getcigarettes	=	q35	//	During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen	quitcigarettes	=	q36	//	During the past 12 months, did you ever try to quit smoking cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q39	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q40	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcdrink	=	q41	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q42	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q43	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc5row	=	q44	//	During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen	alcdrinksrow	=	q45	//	During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen	howgetalcohol	=	q46	//	During the past 30 days, how did you usually get the alcohol you drank?
gen	marijuanause	=	q47	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q48	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q49	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q50	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	inhalantuse	=	q51	//	During your life, how many times have you sniffed glue, breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get high?
gen	heroinuse	=	q52	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q53	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q54	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q55	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	steroiduse	=	q56	//	During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen	prescriptionuse	=	q57	//	During your life, how many times have you taken a prescription drug (such as OxyContin, Percocet, Vicodin, codeine, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen	needleinject	=	q58	//	During your life, how many times have you used a needle to inject any illegal drug into your body?
gen	illegaldrugs	=	q59	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q60	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q61	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q62	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q63	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q64	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q65	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q66	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q67	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q68	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q69	//	How do you describe your weight?
gen	weightloss	=	q70	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q71	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q72	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q73	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q74	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q75	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q76	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q77	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q78	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q79	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q80	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	tvwatching	=	q81	//	On an average school day, how many hours do you watch TV?
gen	computeruse	=	q82	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q83	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	sportsparticipation	=	q84	//	During the past 12 months, on how many sports teams did you play? (Count any teams run by your school or community groups.)
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	oralhealthcare	=	q86	//	When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen	asthma	=	q87	//	Has a doctor or nurse ever told you that you have asthma?
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?

save State15_Harmonized.dta, replace

************
*** 2017 ***
************
use State17.dta, clear

*** WE WANT JUST HAWAII AND 2017 FROM THIS DATA SET
keep if sitecode=="HI" | year==2017
gen yrbs2017 = 1

/*
gen	sitecode	=	sitecode	//	Two- or three-character survey site code that uniquely identifies a survey location
gen	sitename	=	sitename	//	Name of location covered by a survey
gen	sitetype	=	sitetype	//	ype of survey site – “District”, “State”, or “National”
gen	year	=	year	//	4-digit year of survey – 1991, 1993, etc.
gen	survyear	=	survyear	//	Number of year of survey:
gen	weight	=	weight	//	Analytical weight – used in statistical analyses
gen	stratum	=	stratum	//	Stratum – used in statistical analyses
gen	psu	=	psu	//	Primary Sampling Unit (PSU) – used in statistical analyses
gen	record	=	record	//	Record
gen	age	=	age	//	How old are you?
gen	sex	=	sex	//	What is your sex?
gen	grade	=	grade	//	In what grade are you?
gen	race4	=	race4	//	4-level variable from race and ethnicity questions:
gen	race7	=	race7	//	7-level variable from race and ethnicity questions:
gen	stheight	=	stheight	//	How tall are you without your shoes on?
gen	stweight	=	stweight	//	How much do you weigh without your shoes on?
gen	bmi	=	bmi	//	Body mass index (BMI)
gen	bmipct	=	bmipct	//	Student’s bmi percentile
gen	sexid	=	sexid	//	Sexual identity:
gen	sexid2	=	sexid2	//	Collapsed sexual identity:
gen	sexpart	=	sexpart	//	Sex of sexual contact(s):
gen	sexpart2	=	sexpart2	//	Collapsed sex of sexual contact(s):
*/
gen	helmet	=	qbikehelmet	//	When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen	seatbelt	=	q8	//	How often do you wear a seat belt when riding in a car driven by someone else?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q12	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry12mon	=	q14	//	During the past 12 months, on how many days did you carry a gun? (Do not count the days when you carried a gun only for hunting or for a sport, such as target shooting.)
gen	weaponschool	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q15	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q16	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q17	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q18	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	anyoneintercourseforced	=	q20	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q21	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q23	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q26	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q28	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q29	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q30	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarettewhole	=	q31	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	cigaretteperday	=	q33	//	During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen	quittobacco	=	q39	//	During the past 12 months, did you ever try to quit using all tobacco products, including cigarettes, smokeless tobacco, shisha or hookah tobacco, and electronic vapor products?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	evaporget	=	q36	//	During the past 30 days, how did you usually get your own electronic vapor products? (Select only one response.)
gen	alcdrink	=	q40	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q41	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc4or5row	=	q44	//	During the past 30 days, on how many days did you have 4 or more drinks of alcohol in a row (if you are female) or 5 or more drinks of alcohol in a row (if you are male)?
gen	alcdrinksrow	=	q45	//	During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen	howgetalcohol	=	q43	//	During the past 30 days, how did you usually get the alcohol you drank?
gen	marijuanause	=	q46	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	inhalantuse	=	q50	//	During your life, how many times have you sniffed glue, breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get high?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q53	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q54	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	steroiduse	=	q55	//	During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen	prescriptionuse2	=	q56	//	During your life, how many times have you taken a prescription pain medicine without a doctor's prescription or differently than how a doctor told you to use it? (Count drugs such as codeine, Vicodin, OxyContin, Hydrocodone, and Percocet.)
gen	needleinject	=	q57	//	During your life, how many times have you used a needle to inject any illegal drug into your body?
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q59	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q66	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q68	//	How do you describe your weight?
gen	weightloss	=	q69	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q77	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q78	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	tvwatching	=	q80	//	On an average school day, how many hours do you watch TV?
gen	computeruse	=	q81	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q82	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	sportsparticipation	=	q83	//	During the past 12 months, on how many sports teams did you play? (Count any teams run by your school or community groups.)
gen	concussion	=	q84	//	During the past 12 months, how many times did you have a concussion from playing a sport or being physically active?
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	oralhealthcare	=	q86	//	When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen	asthma	=	q87	//	Has a doctor or nurse ever told you that you have asthma?
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	drivemarijuana	=	qdrivemarijuana	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been using marijuana (also called grass, pot, or weed)?

																		
save State2017_Harmonized.dta, replace

***********************
*** 2015 NEW MEXICO ***
***********************
use NMHq.dta, clear

gen newmexico2015 = 1

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	helmet	=	q8	//	When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen	seatbelt	=	q9	//	How often do you wear a seat belt when riding in a car driven by someone else?
gen	drinkingdriver	=	q10	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q11	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q12	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry30days	=	q14	//	During the past 30 days, on how many days did you carry a gun
gen	weaponschool	=	q15	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q16	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	physicalfight	=	q18	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q20	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	intercourseforced	=	q21	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q23	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q24	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q25	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q26	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q27	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q28	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q29	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q30	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q31	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarettewhole	=	q32	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q33	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	cigaretteperday	=	q34	//	During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen	quitcigarettes	=	q36	//	During the past 12 months, did you ever try to quit smoking cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q39	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q40	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcage	=	q42	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q43	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc5row	=	q44	//	During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen	alcdrinksrow	=	q45	//	During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen	howgetalcohol	=	q46	//	During the past 30 days, how did you usually get the alcohol you drank?
gen	howoldmarijuana	=	q48	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q49	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q50	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q52	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q53	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q54	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	prescriptionuse	=	q57	//	During your life, how many times have you taken a prescription drug (such as OxyContin, Percocet, Vicodin, codeine, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen	needleinject	=	q58	//	During your life, how many times have you used a needle to inject any illegal drug into your body?
gen	illegaldrugs	=	q59	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q60	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q61	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q62	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q63	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q64	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q65	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q66	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q67	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q68	//	Which of the following best describes you?  **sex id
gen	fruitjuice	=	q71	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q72	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q73	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q74	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q75	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q76	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q77	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	breakfast	=	q79	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q80	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	tvwatching	=	q81	//	On an average school day, how many hours do you watch TV?
gen	computeruse	=	q82	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q83	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	oralhealthcare	=	q86	//	When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen	asthma	=	q87	//	Has a doctor or nurse ever told you that you have asthma?
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	meduc	=	q91	//	What is the highest level of education completed by your mother (or the person who is like a mother to you)?
gen	hurtself	=	q94	//	During the past 12 months, how many times did you do something to purposely hurt yourself without wanting to die, such as cutting or burning yourself on purpose?
gen	drinklocation	=	q99	//	During the past 30 days, where did you usually drink alcohol?
gen	racegroup	=	q90	//	Which of these groups best describes you? (*race group question)
gen	feduc	=	q92	//	What is the highest level of schooling your father completed? 
gen	gunhome	=	q93	//	Is there a gun in your home?
gen	hookah30	=	q95	//	During the past 30 days, on how many days did you smoke tobacco or flavored tobacco in a hookah, even just a puff?
gen	flavoredtobacco30	=	q96	//	During the past 30 days, were any of the tobacco products you used flavored to taste like menthol (mint), clove, spice, alcohol (wine or cognac), candy, fruit, chocolate, or other sweets?
gen	roomcig7	=	q97	//	During the past 7 days, on how many days were you in the same room with someone who was smoking cigarettes? 
gen	tobaccohome7	=	q98	//	During the past 7 days, on how many days did someone smoke tobacco products in your home while you were there?
gen	sniff30	=	q102	//	During the past 30 days, how many times did you sniff glue, breathe the contents of aerosol spray cans, or inhale any paints or sprays to get high?
gen	ecstasy30	=	q105	//	During the past 30 days, how many times did you use ecstasy (also called MDMA)?
gen	synmj30	=	q106	//	During the past 30 days, how many times did you use synthetic marijuana (also called K2 or Spice)?
gen	painkiller30	=	q107	//	During the past 30 days, how many times did you use a pain killer to get high, like Vicodin, OxyContin (also called Oxy or OC), or Percocet (also called Percs)?
gen	disability	=	q109	//	Do you have any physical disabilities or long-term health problems? 
gen	otherhomelanguage	=	q111	//	How often do you speak a language other than English at home?
gen	bornusa	=	q112	//	Were you born in the USA?
gen	parentinterestedschool	=	q113	//	In my home, there is a parent or some other adult who is interested in my school work.
gen	parentbelievesuccess	=	q114	//	In my home, there is a parent or some other adult who believes that I will be a success.
gen	teacherlistens	=	q115	//	At my school, there is a teacher or some other adult who listens to me when I have something to say
gen	teacherbelivesuccess	=	q116	//	At my school, there is a teacher or some other adult who believes that I will be a success.
gen	adultcares	=	q117	//	Outside of my home and school, there is an adult who really cares about me.
gen	adultgoodjob	=	q118	//	Outside of my home and school, there is an adult who tells me when I do a good job.
gen	friendcares	=	q119	//	I have a friend about my own age who really cares about me.
gen	friendhelp	=	q120	//	I have a friend about my own age who helps me when I'm having a hard time.
gen	parentknowslocation	=	q121	//	When I am not at home, one of my parents/guardians knows where I am and who I am with
gen	schoolrules	=	q122	//	In my school, there are clear rules about what students can and cannot do
gen	collegeplans	=	q123	//	I plan to go to college or some other school after high school.
gen	schoolecactivity	=	q124	//	At school I am involved in sports, clubs, or other extra-curricular activities (such as band, cheerleading, or student council). 
gen	otherecactivity	=	q125	//	Outside of my home and school, I am a part of clubs, sports teams, church/temple, or other group activities. 
gen	otherarts	=	q126	//	Outside of my home and school, I am involved in music, art, literature, sports, or a hobby
gen	ditch30	=	q127	//	During the past 30 days, how many days of school did you miss classes or school without permission? 

save NewMexico2015_Harmonized.dta, replace


***********************
*** 2015 VERMONT    ***
***********************
use VTAHq.dta, clear

gen vermont2015 = 1

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	helmet	=	q8	//	When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen	drinkingdriver	=	q10	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q11	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q12	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry30days	=	q14	//	During the past 30 days, on how many days did you carry a gun
gen	weaponschool	=	q15	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q16	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q17	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q18	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q20	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	intercourseforced	=	q21	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	schoolbully	=	q93	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q25	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q26	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideplanned	=	q28	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q29	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q30	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettewhole	=	q32	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q33	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	cigaretteperday	=	q34	//	During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen	getcigarettes	=	q35	//	During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen	quitcigarettes	=	q36	//	During the past 12 months, did you ever try to quit smoking cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q39	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q40	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcage	=	q42	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q43	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc5row	=	q44	//	During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen	alcdrinksrow	=	q45	//	During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen	howgetalcohol	=	q46	//	During the past 30 days, how did you usually get the alcohol you drank?
gen	howoldmarijuana	=	q48	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q49	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q50	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	inhalantuse	=	q51	//	During your life, how many times have you sniffed glue, breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get high?
gen	heroinuse	=	q52	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q53	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	prescriptionuse	=	q104	//	During your life, how many times have you taken a prescription drug (such as OxyContin, Percocet, Vicodin, codeine, Adderall, Ritalin, or Xanax) without a doctor's prescription?
gen	illegaldrugs	=	q59	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	agefirstintercourse	=	q61	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q62	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q63	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q64	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q65	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q66	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q67	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q68	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q69	//	How do you describe your weight?
gen	weightloss	=	q70	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q71	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q72	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q73	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q74	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q75	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q76	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q77	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	breakfast	=	q79	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q80	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	computeruse	=	q111	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	drivemarijuana	=	q92	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been using marijuana (also called grass, pot, or weed)?
gen	meduc	=	q90	//	What is the highest level of education completed by your mother (or the person who is like a mother to you)?
gen	ridemarijuana	=	q91	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been using marijuana?
gen	bullyothers	=	q94	//	During the past 30 days, on how many days did you bully someone?
gen	hurtself	=	q95	//	During the past 12 months, how many times did you do something to purposely hurt yourself without wanting to die, such as cutting or burning yourself on purpose?
gen	flavoredtobacco	=	q96	//	How old were you when you first tried a tobacco product flavored to taste like menthol (mint), clove, spice, alcohol (wine or cognac), candy, fruit, chocolate, or other sweets?
gen	sameroomcigs	=	q97	//	During the past 7 days, were you in the same room with someone who was smoking cigarettes?
gen	samecarcigs	=	q98	//	During the past 7 days, were you in the same car with someone who was smoking cigarettes?
gen	doctorsmoke	=	q99	//	During the past 12 months, did a doctor, dentist, or nurse ask you if you smoke?
gen	tobaccoads	=	q100	//	When you go to a convenience store, supermarket, or gas station, how often do you see ads for cigarettes or other tobacco products?
gen	vermonthscigarettes	=	q101	//	Out of 100 Vermont high school students, how many do you think smoke cigarettes?
gen	drinklocation	=	q102	//	During the past 30 days, where did you usually drink alcohol?
gen	vermonthsmarijuana	=	q103	//	Out of 100 Vermont high school students, how many do you think use marijuana?
gen	prescriptionuse3	=	q105	//	During the past 30 days, how many times have you taken a prescription pain reliever such as OxyContin, Vicodin, or other prescription pain reliever not prescribed to you?
gen	prescriptionstimulant	=	q106	//	During your life, how many times have you taken the prescription stimulant Ritalin or Adderall not prescribed to you?
gen	prescriptionstimulant2	=	q107	//	During the past 30 days, how many times have you taken the prescription stimulant Ritalin or Adderall not prescribed to you?
gen	oralsex	=	q108	//	Have you ever had oral sex?
gen	wantcigs	=	q112	//	If you wanted to get cigarettes, how hard or easy would it be for you to get some?
gen	wantalcohol	=	q113	//	If you wanted to get alcohol, how hard or easy would it be for you to get some?
gen	wantmarijuana	=	q114	//	If you wanted to get marijuana, how hard or easy would it be for you to get some?
gen	moralcigs	=	q115	//	How wrong do you think it is for someone your age to smoke cigarettes?
gen	moralalcohol	=	q116	//	How wrong do you think it is for someone your age to drink alcohol?
gen	moralmarijuana	=	q117	//	How wrong do you think it is for someone your age to use marijuana?
gen	moralparentscigs	=	q118	//	How wrong do your parents or guardians feel it would be for you to smoke cigarettes?
gen	moralparentsalcohol	=	q119	//	How wrong do your parents or guardians feel it would be for you to drink alcohol?
gen	moralparentsmarijuana	=	q120	//	How wrong do your parents or guardians feel it would be for you to use marijuana?
gen	cigharm	=	q121	//	How much do you think people your age risk harming themselves (physically or in other ways) if they smoke one or more packs of cigarettes per day?
gen	alcoholharm	=	q122	//	How much do you think people your age risk harming themselves (physically or in other ways) if they have five or more drinks of alcohol once or twice each weekend?
gen	marijuanaharm	=	q123	//	How much do you think people your age risk harming themselves (physically or in other ways) if they use marijuana regularly?
gen	policeparty	=	q124	//	If you were at a party with other students from your high school, where people your age were drinking alcohol, how likely is it that it would be broken up by the police?
gen	schoolparents	=	q127	//	How often does one of your parents talk with you about what you are doing in school?
gen	afterschool	=	q128	//	In an average week when you are in school, how many total hours do you participate in afterschool activities such as sports, band, drama, or clubs run by your school or community groups?
gen	teacherencouragement	=	q129	//	Do you agree or disagree that your teachers really care about you and give you a lot of encouragement?
gen	studentsdecide	=	q130	//	Do you agree or disagree that students help decide what goes on in your school?
gen	communitymatter	=	q131	//	Do you agree or disagree that in your community you feel like you matter to people?
gen	posthighschool	=	q132	//	How likely is it that you will complete a post high school program such as a vocational training program, military service, community college, or 4-year college?

save Vermont2015_Harmonized.dta, replace

***********************
*** 2015 Indiana    ***
***********************
use INHQ.dta, clear

gen indiana2015 = 1

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	drinkingdriver	=	q10	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q11	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q12	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry30days	=	q14	//	During the past 30 days, on how many days did you carry a gun
gen	weaponschool	=	q15	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q16	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q17	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q18	//	During the past 12 months, how many times were you in a physical fight?
gen	fightinjured	=	q19	//	During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen	fightschool	=	q20	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	intercourseforced	=	q21	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q23	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q24	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q25	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q26	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q27	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q28	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q29	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q30	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q30	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarettewhole	=	q32	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q33	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q39	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q40	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcdrink	=	q41	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q42	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q43	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc5row	=	q44	//	During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen	marijuanause	=	q47	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q48	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q49	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q50	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q52	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q53	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q54	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q55	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	illegaldrugs	=	q59	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q60	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q61	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q62	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q63	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q64	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q65	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q66	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q67	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q68	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q69	//	How do you describe your weight?
gen	weightloss	=	q70	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q71	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q72	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q73	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q74	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q75	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q76	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q77	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q78	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q79	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q80	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	computeruse	=	q82	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q83	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	sportsparticipation	=	q84	//	During the past 12 months, on how many sports teams did you play? (Count any teams run by your school or community groups.)
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?

save Indiana2015_Harmonized.dta, replace


***********************
*** 2015 Massachusetts    ***
***********************
use MAHq.dta, clear

gen massachusetts2015 = 1

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	drinkingdriver	=	q10	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q11	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q12	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry30days	=	q14	//	During the past 30 days, on how many days did you carry a gun
gen	weaponschool	=	q15	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q16	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q17	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q18	//	During the past 12 months, how many times were you in a physical fight?
gen	fightinjured	=	q19	//	During the past 12 months, how many times were you in a physical fight in which you were injured and had to be treated by a doctor or nurse?
gen	fightschool	=	q20	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	anyoneintercourseforced	=	q96	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q21	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q23	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q24	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q25	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q26	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q27	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q28	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q29	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q30	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q31	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarettewhole	=	q32	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q33	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q39	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q40	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcdrink	=	q41	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q42	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q43	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc5row	=	q44	//	During the past 30 days, on how many days did you have 5 or more drinks of alcohol in a row, that is, within a couple of hours?
gen	marijuanause	=	q47	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q48	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q49	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q50	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q52	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q53	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q54	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q55	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	illegaldrugs	=	q59	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q60	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q61	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q62	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q63	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q64	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q65	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q66	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q67	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q68	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q69	//	How do you describe your weight?
gen	weightloss	=	q70	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q71	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q72	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q73	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q74	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q75	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q76	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q77	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q78	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q79	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q80	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	computeruse	=	q82	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q83	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	sportsparticipation	=	q84	//	During the past 12 months, on how many sports teams did you play? (Count any teams run by your school or community groups.)
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	hurtself	=	q97	//	During the past 12 months, how many times did you do something to purposely hurt yourself without wanting to die, such as cutting or burning yourself on purpose?
gen	sniff30	=	q100	//	During the past 30 days, how many times did you sniff glue, breathe the contents of aerosol spray cans, or inhale any paints or sprays to get high?
gen	disability	=	q111	//	Do you have any physical disabilities or long-term health problems? 
gen	otherhomelanguage	=	q90	//	How often do you speak a language other than English at home?
gen	kickedout	=	q91	//	During the past 12 months, did you ever live away from your parents or guardians because you were kicked out, ran away, or were abandoned?
gen	gang	=	q95	//	During the past 12 months, have you ever been a member of a gang?
gen	pregnant	=	q101	//	How many times have you been pregnant or gotten someone pregnant?
gen	sextalk	=	q105	//	During the past 12 months, how often did you talk with your parents or other adults in your family about sexuality or ways to prevent HIV infection, other sexually transmitted diseases (STDs), or pregnancy?
gen	sexhealthservices	=	q106	//	Is there an adult in your school who can help you find sexual health services such as HIV, STD and pregnancy testing, access to birth control, or support around your sexuality?
gen	sexhealthservicescomfort	=	q107	//	If you needed help finding sexual health services, would you feel comfortable asking an adult at your school?
gen	stdtesting	=	q108	//	Have you ever been tested for other sexually transmitted diseases (STDs) such as genital herpes, chlamydia, syphilis, or genital warts?
gen	hadstd	=	q109	//	Have you ever been told by a doctor or nurse that you had HIV infection or any other sexually transmitted disease (STD)?
gen	learningdisability	=	q110	//	Do you have any long-term learning disabilities?
gen	adultinschool	=	q112	//	Is there at least one teacher or other adult in your school that you can talk to if you have a problem?
gen	familyimportant	=	q113	//	Can you talk with at least one of your parents or other adult family members about things that are important to you?

save Massachusetts2015_Harmonized.dta, replace
***********************
*** 2017 Connecticut   ***
***********************
use CTH_2017.dta, clear

gen connecticut2017 = 1
gen year = 2017
gen fips = 9

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q12	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	weaponschool	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q15	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q16	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q17	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q18	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	anyoneintercourseforced	=	q20	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q21	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q23	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q26	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q28	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q29	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q30	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcdrink	=	q40	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q41	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	marijuanause	=	q46	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q53	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q54	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q59	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q66	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q68	//	How do you describe your weight?
gen	weightloss	=	q69	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q77	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q78	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	computeruse	=	q81	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q82	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	sportsparticipation	=	q83	//	During the past 12 months, on how many sports teams did you play? (Count any teams run by your school or community groups.)
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?

save Connecticut2017_Harmonized.dta, replace

***********************
*** 2017 Vermont   ***
***********************
use vtyrbs2017.dta, replace 

gen vermont2017 = 1
gen year = 2017
gen fips = 50

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponschool	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q15	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q16	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q17	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q18	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q21	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q28	//	During the past 12 months, how many times did you actually attempt suicide?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcage	=	q41	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q66	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q68	//	How do you describe your weight?
gen	weightloss	=	q69	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	breakfast	=	q78	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	computeruse	=	q112	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?

save Vermont2017_Harmonized.dta, replace

***********************
*** Massachusetts 2017   ***
***********************
use MAHyrbs2017.dta, replace

gen massachusetts2017  = 1
gen year = 2017
gen fips = 25

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q12	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry12mon	=	q14	//	During the past 12 months, on how many days did you carry a gun? (Do not count the days when you carried a gun only for hunting or for a sport, such as target shooting.)
gen	weaponschool	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q15	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q16	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q17	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q18	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	anyoneintercourseforced	=	q20	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q21	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q23	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q26	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q28	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q29	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q30	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcdrink	=	q40	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc4or5row	=	q44	//	During the past 30 days, on how many days did you have 4 or more drinks of alcohol in a row (if you are female) or 5 or more drinks of alcohol in a row (if you are male)?
gen	marijuanause	=	q46	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	inhalantuse	=	q100	//	During your life, how many times have you sniffed glue, breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get high?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q53	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q54	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q59	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q66	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q68	//	How do you describe your weight?
gen	weightloss	=	q69	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76 //*does not have diet comment	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q77	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q78	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	computeruse	=	q81	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q82	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	drivemarijuana	=	q93	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been using marijuana (also called grass, pot, or weed)?
gen	hurtself	=	q96	//	During the past 12 months, how many times did you do something to purposely hurt yourself without wanting to die, such as cutting or burning yourself on purpose?
gen	posthighschool	=	q114	//	How likely is it that you will complete a post high school program such as a vocational training program, military service, community college, or 4-year college?
gen	disability	=	q110	//	Do you have any physical disabilities or long-term health problems? 
gen	gang	=	q95	//	During the past 12 months, have you ever been a member of a gang?
gen	pregnant	=	q101	//	How many times have you been pregnant or gotten someone pregnant?
gen	sextalk	=	q106	//	During the past 12 months, how often did you talk with your parents or other adults in your family about sexuality or ways to prevent HIV infection, other sexually transmitted diseases (STDs), or pregnancy?
gen	sexhealthservices	=	q107	//	Is there an adult in your school who can help you find sexual health services such as HIV, STD and pregnancy testing, access to birth control, or support around your sexuality?
gen	sexhealthservicescomfort	=	q108	//	If you needed help finding sexual health services, would you feel comfortable asking an adult at your school?
gen	stdtesting	=	q102	//	Have you ever been tested for other sexually transmitted diseases (STDs) such as genital herpes, chlamydia, syphilis, or genital warts?
gen	learningdisability	=	q109	//	Do you have any long-term learning disabilities?
gen	adultinschool	=	q111	//	Is there at least one teacher or other adult in your school that you can talk to if you have a problem?
gen	familyimportant	=	q112	//	Can you talk with at least one of your parents or other adult family members about things that are important to you?
gen	sleepaway30	=	q91	//	During the past 30 days, did you ever sleep away from your parents or guardians because you were kicked out, ran away, or were abandoned?
gen	familyfeelmj	=	q99	//	How would your parents or other adults in your family feel if you smoked marijuana?
gen	miltaryfamily	=	q113	//	Are either of your parents or other adults in your family serving on active duty in the military?

save Massachusetts2017_Harmonized.dta, replace
***********************
*** New Mexico 2017   ***
***********************
use nmyrbs2017.dta, clear

gen newmexico2017 = 1 
gen year = 2017
gen fips = 35

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q6	//	How much do you weigh without your shoes on?
gen	helmet	=	q93	//	When you rode a bicycle during the past 12 months, how often did you wear a helmet?
gen	seatbelt	=	q8	//	How often do you wear a seat belt when riding in a car driven by someone else?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q12	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry12mon	=	q14	//	During the past 12 months, on how many days did you carry a gun? (Do not count the days when you carried a gun only for hunting or for a sport, such as target shooting.)
gen	weaponschool	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	safetyschool	=	q15	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	physicalfight	=	q17	//	During the past 12 months, how many times were you in a physical fight?
gen	fightschool	=	q18	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	anyoneintercourseforced	=	q20	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	schoolbully	=	q23	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q26	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q28	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q29	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarettetried	=	q30	//	Have you ever tried cigarette smoking, even one or two puffs?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	cigaretteperday	=	q33	//	During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	alcage	=	q41	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc4or5row	=	q44	//	During the past 30 days, on how many days did you have 4 or more drinks of alcohol in a row (if you are female) or 5 or more drinks of alcohol in a row (if you are male)?
gen	alcdrinksrow	=	q45	//	During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen	howgetalcohol	=	q43	//	During the past 30 days, how did you usually get the alcohol you drank?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q53	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	prescriptionuse2	=	q56	//	During your life, how many times have you taken a prescription pain medicine without a doctor's prescription or differently than how a doctor told you to use it? (Count drugs such as codeine, Vicodin, OxyContin, Hydrocodone, and Percocet.)
gen	needleinject	=	q57	//	During your life, how many times have you used a needle to inject any illegal drug into your body?
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q59	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q66	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	breakfast	=	q78	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	tvwatching	=	q80	//	On an average school day, how many hours do you watch TV?
gen	computeruse	=	q81	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q82	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	concussion	=	q84	//	During the past 12 months, how many times did you have a concussion from playing a sport or being physically active?
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	oralhealthcare	=	q86	//	When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen	asthma	=	q87	//	Has a doctor or nurse ever told you that you have asthma?
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	meduc	=	q91	//	What is the highest level of education completed by your mother (or the person who is like a mother to you)?
gen	hurtself	=	q95	//	During the past 12 months, how many times did you do something to purposely hurt yourself without wanting to die, such as cutting or burning yourself on purpose?
gen	drinklocation	=	q99	//	During the past 30 days, where did you usually drink alcohol?
gen	racegroup	=	q90	//	Which of these groups best describes you? (*race group question)
gen	feduc	=	q92	//	What is the highest level of schooling your father completed? 
gen	gunhome	=	q94	//	Is there a gun in your home?
gen	hookah30	=	q97	//	During the past 30 days, on how many days did you smoke tobacco or flavored tobacco in a hookah, even just a puff?
gen	roomcig7	=	q98	//	During the past 7 days, on how many days were you in the same room with someone who was smoking cigarettes? 
gen	sniff30	=	q104	//	During the past 30 days, how many times did you sniff glue, breathe the contents of aerosol spray cans, or inhale any paints or sprays to get high?
gen	synmj30	=	q105	//	During the past 30 days, how many times did you use synthetic marijuana (also called K2 or Spice)?
gen	painkiller30	=	q106	//	During the past 30 days, how many times did you use a pain killer to get high, like Vicodin, OxyContin (also called Oxy or OC), or Percocet (also called Percs)?
gen	disability	=	q108	//	Do you have any physical disabilities or long-term health problems? 
gen	otherhomelanguage	=	q112	//	How often do you speak a language other than English at home?
gen	bornusa	=	q113	//	Were you born in the USA?
gen	parentinterestedschool	=	q114	//	In my home, there is a parent or some other adult who is interested in my school work.
gen	parentbelievesuccess	=	q115	//	In my home, there is a parent or some other adult who believes that I will be a success.
gen	teacherlistens	=	q116	//	At my school, there is a teacher or some other adult who listens to me when I have something to say
gen	teacherbelivesuccess	=	q117	//	At my school, there is a teacher or some other adult who believes that I will be a success.
gen	adultcares	=	q118	//	Outside of my home and school, there is an adult who really cares about me.
gen	adultgoodjob	=	q119	//	Outside of my home and school, there is an adult who tells me when I do a good job.
gen	friendcares	=	q120	//	I have a friend about my own age who really cares about me.
gen	friendhelp	=	q121	//	I have a friend about my own age who helps me when I'm having a hard time.
gen	parentknowslocation	=	q122	//	When I am not at home, one of my parents/guardians knows where I am and who I am with
gen	schoolrules	=	q123	//	In my school, there are clear rules about what students can and cannot do
gen	collegeplans	=	q124	//	I plan to go to college or some other school after high school.
gen	schoolecactivity	=	q125	//	At school I am involved in sports, clubs, or other extra-curricular activities (such as band, cheerleading, or student council). 
gen	otherecactivity	=	q126	//	Outside of my home and school, I am a part of clubs, sports teams, church/temple, or other group activities. 
gen	otherarts	=	q127	//	Outside of my home and school, I am involved in music, art, literature, sports, or a hobby
gen	ditch30	=	q128	//	During the past 30 days, how many days of school did you miss classes or school without permission? 
gen	vaporcontent	=	q96	//	The last time you used an electronic vapor product, what was in the mist or vapor you inhaled? 
gen	gamble	=	q111	//	During the past 12 months, how many times have you gambled on a sports team, gambled when playing cards or a dice game, played one of New Mexico's lottery games, gambled on the INternet, or bet on a game or personal skill such as pool or a video game?

save NewMexico2017_Harmonized.dta, replace
***********************
*** Texas 2017   ***
***********************
use txyrbs2017.dta, clear

gen texas2017  = 1
gen year = 2017
gen fips = 48

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	seatbelt	=	q8	//	How often do you wear a seat belt when riding in a car driven by someone else?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	weaponcarry	=	q12	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club?
gen	guncarry12mon	=	q14	//	During the past 12 months, on how many days did you carry a gun? (Do not count the days when you carried a gun only for hunting or for a sport, such as target shooting.)
gen	safetyschool	=	q15	//	During the past 30 days, on how many days did you not go to school because you felt you would be unsafe at school or on your way to or from school?
gen	threatenschool	=	q16	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	physicalfight	=	q17	//	During the past 12 months, how many times were you in a physical fight?
gen	anyoneintercourseforced	=	q20	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q21	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q23	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q26	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	suicideattempted	=	q28	//	During the past 12 months, how many times did you actually attempt suicide?
gen	suicideinjured	=	q29	//	If you attempted suicide during the past 12 months, did any attempt result in an injury, poisoning, or overdose that had to be treated by a doctor or nurse?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	cigaretteperday	=	q33	//	During the past 30 days, on the days you smoked, how many cigarettes did you smoke per day?
gen	getcigarettes	=	q91	//	During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen	quittobacco	=	q39	//	During the past 12 months, did you ever try to quit using all tobacco products, including cigarettes, smokeless tobacco, shisha or hookah tobacco, and electronic vapor products?
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	evaporget	=	q36	//	During the past 30 days, how did you usually get your own electronic vapor products? (Select only one response.)
gen	alcdrink	=	q40	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q41	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc4or5row	=	q44	//	During the past 30 days, on how many days did you have 4 or more drinks of alcohol in a row (if you are female) or 5 or more drinks of alcohol in a row (if you are male)?
gen	alcdrinksrow	=	q45	//	During the past 30 days, what is the largest number of alcoholic drinks you had in a row, that is, within a couple of hours?
gen	howgetalcohol	=	q43	//	During the past 30 days, how did you usually get the alcohol you drank?
gen	marijuanause	=	q46	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	inhalantuse	=	q50	//	During your life, how many times have you sniffed glue, breathed the contents of aerosol spray cans, or inhaled any paints or sprays to get high?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q53	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q54	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	steroiduse	=	q55	//	During your life, how many times have you taken steroid pills or shots without a doctor's prescription?
gen	prescriptionuse2	=	q56	//	During your life, how many times have you taken a prescription pain medicine without a doctor's prescription or differently than how a doctor told you to use it? (Count drugs such as codeine, Vicodin, OxyContin, Hydrocodone, and Percocet.)
gen	needleinject	=	q57	//	During your life, how many times have you used a needle to inject any illegal drug into your body?
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q59	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	lifesexualcontact	=	q66	//	During your life, with whom have you had sexual contact?
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q68	//	How do you describe your weight?
gen	weightloss	=	q69	//	Which of the following are you trying to do about your weight?
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	nomilk	=	q77	//	During the past 7 days, how many glasses of milk did you drink? (Count the milk you drank in a glass or cup, from a carton, or with cereal. Count the half pint of milk served at school as equal to one glass.)
gen	breakfast	=	q78	//	During the past 7 days, on how many days did you eat breakfast?
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	tvwatching	=	q80	//	On an average school day, how many hours do you watch TV?
gen	computeruse	=	q81	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q82	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	sportsparticipation	=	q83	//	During the past 12 months, on how many sports teams did you play? (Count any teams run by your school or community groups.)
gen	concussion	=	q84	//	During the past 12 months, how many times did you have a concussion from playing a sport or being physically active?
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	oralhealthcare	=	q86	//	When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen	asthma	=	q87	//	Has a doctor or nurse ever told you that you have asthma?
gen	sleephours	=	q88	//	On an average school night, how many hours of sleep do you get?
gen	grades	=	q89	//	During the past 12 months, how would you describe your grades in school?
gen	drcheckup	=	q98	//	When was the last time you saw a doctor or nurse for a check-up or physical exam when you were not sick or injured?
gen	numberoftrustadults	=	q100	//	Besides your parents, how many adults would you feel comfortable seeking help from if you had an important question affecting your life?
gen	eatingdisorder	=	q92	//	During the past 30 days, did you try to lose weight or keep from gaining weight by going without eating for 24 hours or more; taking any diet pills, powders, or liquids; vomiting or taking laxatives; smoking cigarettes; or skipping meals?
gen	dinnerwithparent	=	q93	//	During the past 7 days, on how many days did you eat dinner at home with at least one of your parents?
gen	toothpain12	=	q94	//	During the past 12 months, how many times have your teeth or mouth been painful or sore?
gen	toothpainschool	=	q95	//	During the past 12 months, how many times have you missed school because of problems with your teeth or mouth?
gen	toothpainer	=	q96	//	During the past 12 months, how many times did you go to an emergency room or urgent care center for problems with your teeth or mouth?
gen	drsexed	=	q97	//	During your last check-up, did your doctor or nurse discuss ways to prevent pregnancy, AIDS, or other sexually transmitted diseases (STDs)?
gen	closepark	=	q101	//	Is there a neighborhood park or other public outdoor area within walking distance of your home?
gen	avoidpark	=	q102	//	What is the main reason that you do not use a neighborhood park or other public outdoor area that is within walking distance of your home?

save Texas2017_Harmonized.dta, replace

***********************
*** Maryland 2017/2016   ***
***********************
use mdyrbs2017.dta, clear

gen maryland2017 = 1 
gen year = 2017
gen fips = 24

gen	age	=	q1	//	How old are you?
gen	sex	=	q2	//	What is your sex?
gen	grade	=	q3	//	In what grade are you?
gen	hispanic_latino	=	q4	//	Are you Hispanic or Latino?
gen	what_race	=	q5	//	What is your race? (select one or more responses)
*gen	raceeth	=	raceeth	//	combined from q4 and q5
gen	stheight	=	q6	//	How tall are you without your shoes on?
gen	stweight	=	q7	//	How much do you weigh without your shoes on?
gen	drinkingdriver	=	q9	//	During the past 30 days, how many times did you ride in a car or other vehicle driven by someone who had been drinking alcohol?
gen	drinkdrive	=	q10	//	During the past 30 days, how many times did you drive a car or other vehicle when you had been drinking alcohol?
gen	textdrive	=	q11	//	During the past 30 days, on how many days did you text or e-mail while driving a car or other vehicle? A. I did not drive a car or other vehicle during the past 30 days
gen	guncarry12mon	=	q14	//	During the past 12 months, on how many days did you carry a gun? (Do not count the days when you carried a gun only for hunting or for a sport, such as target shooting.)
gen	weaponschool	=	q13	//	During the past 30 days, on how many days did you carry a weapon such as a gun, knife, or club on school property?
gen	threatenschool	=	q16	//	During the past 12 months, how many times has someone threatened or injured you with a weapon such as a gun, knife, or club on school property?
gen	fightschool	=	q18	//	During the past 12 months, how many times were you in a physical fight on school property?
gen	anyoneintercourseforced	=	q20	//	During the past 12 months, how many times did anyone force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.
gen	intercourseforced	=	q19	//	Have you ever been physically forced to have sexual intercourse when you did not want to?
gen	dateviolence	=	q22	//	During the past 12 months, how many times did someone you were dating or going out with physically hurt you on purpose? (Count such things as being hit, slammed into something, or injured with an object or weapon.)
gen	datesexviolence	=	q21	//	During the past 12 months, how many times did someone you were dating or going out with force you to do sexual things that you did not want to do? (Count such things as kissing, touching, or being physically forced to have sexual intercourse.)
gen	schoolbully	=	q23	//	During the past 12 months, have you ever been bullied on school property?
gen	electronicbully	=	q24	//	During the past 12 months, have you ever been electronically bullied? (Count being bullied through e-mail, chat rooms, instant messaging, websites, or texting.)
gen	sad2weeks	=	q25	//	During the past 12 months, did you ever feel so sad or hopeless almost every day for two weeks or more in a row that you stopped doing some usual activities?
gen	suicideconsider	=	q26	//	During the past 12 months, did you ever seriously consider attempting suicide?
gen	suicideplanned	=	q27	//	During the past 12 months, did you make a plan about how you would attempt suicide?
gen	cigarettewhole	=	q94	//	How old were you when you smoked a whole cigarette for the first time?
gen	cigarette30days	=	q32	//	During the past 30 days, on how many days did you smoke cigarettes?
gen	getcigarettes	=	q95	//	During the past 30 days, how did you usually get your own cigarettes? (Select only one response.)
gen	tobaccochew	=	q37	//	During the past 30 days, on how many days did you use chewing tobacco, snuff, or dip, such as Redman, Levi Garrett, Beechnut, Skoal, Skoal Bandits, or Copenhagen?
gen	cigarsmoke	=	q38	//	During the past 30 days, on how many days did you smoke cigars, cigarillos, or little cigars?
gen	evaporuse	=	q34	//	Have you ever used an electronic vapor product?
gen	evaporuse30	=	q35	//	During the past 30 days, on how many days did you use an electronic vapor product?
gen	evaporget	=	q36	//	During the past 30 days, how did you usually get your own electronic vapor products? (Select only one response.)
gen	alcdrink	=	q40	//	During your life, on how many days have you had at least one drink of alcohol?
gen	alcage	=	q41	//	How old were you when you had your first drink of alcohol other than a few sips?
gen	alc30	=	q42	//	During the past 30 days, on how many days did you have at least one drink of alcohol?
gen	alc4or5row	=	q44	//	During the past 30 days, on how many days did you have 4 or more drinks of alcohol in a row (if you are female) or 5 or more drinks of alcohol in a row (if you are male)?
gen	marijuanause	=	q46	//	During your life, how many times have you used marijuana?
gen	howoldmarijuana	=	q47	//	How old were you when you tried marijuana for the first time?
gen	marijuana30days	=	q48	//	During the past 30 days, how many times did you use marijuana?
gen	cocaineuse	=	q49	//	During your life, how many times have you used any form of cocaine, including powder, crack, or freebase?
gen	heroinuse	=	q51	//	During your life, how many times have you used heroin (also called smack, junk, or China White)?
gen	methuse	=	q52	//	During your life, how many times have you used methamphetamines (also called speed, crystal, crank, or ice)
gen	ectasyuse	=	q53	//	During your life, how many times have you used ecstasy (also called MDMA)?
gen	synthmarijuanause	=	q54	//	During your life, how many times have you used synthetic marijuana (also called K2, Spice, fake weed, King Kong, Yucatan Fire, Skunk, or Moon Rocks)?
gen	prescriptionuse2	=	q56	//	During your life, how many times have you taken a prescription pain medicine without a doctor's prescription or differently than how a doctor told you to use it? (Count drugs such as codeine, Vicodin, OxyContin, Hydrocodone, and Percocet.)
gen	needleinject	=	q57	//	During your life, how many times have you used a needle to inject any illegal drug into your body?
gen	illegaldrugs	=	q58	//	During the past 12 months, has anyone offered, sold, or given you an illegal drug on school property?
gen	anyintercourse	=	q59	//	Have you ever had sexual intercourse?
gen	agefirstintercourse	=	q60	//	How old were you when you had sexual intercourse for the first time?
gen	sexualpartners	=	q61	//	During your life, with how many people have you had sexual intercourse?
gen	currentsexualactivity	=	q62	//	During the past 3 months, with how many people did you have sexual intercourse?
gen	alcoholdrugwsex	=	q63	//	Did you drink alcohol or use drugs before you had sexual intercourse the last time?
gen	condomuse	=	q64	//	The last time you had sexual intercourse, did you or your partner use a condom?
gen	birthcontrol	=	q65	//	The last time you had sexual intercourse, what one method did you or your partner use to prevent pregnancy? (Select only one response.)
gen	sexualidentity	=	q67	//	Which of the following best describes you?  **sex id
gen	weightperception	=	q68	//	How do you describe your weight?
gen	fruitjuice	=	q70	//	During the past 7 days, how many times did you drink 100% fruit juices such as orange juice, apple juice, or grape juice? (Do not count punch, Kool-Aid, sports drinks, or other fruit-flavored drinks.)
gen	fruit	=	q71	//	During the past 7 days, how many times did you eat fruit? (Do not count fruit juice.)
gen	salad	=	q72	//	During the past 7 days, how many times did you eat green salad?
gen	potato	=	q73	//	During the past 7 days, how many times did you eat potatoes? (Do not count french fries, fried potatoes, or potato chips.)
gen	carrot	=	q74	//	During the past 7 days, how many times did you eat carrots?
gen	othervegetable	=	q75	//	During the past 7 days, how many times did you eat other vegetables? (Do not count green salad, potatoes, or carrots.)
gen	nosoda	=	q76	//	During the past 7 days, how many times did you drink a can, bottle, or glass of soda or pop, such as Coke, Pepsi, or Sprite? (Do not count diet soda or diet pop.)
gen	physicalactivity	=	q79	//	During the past 7 days, on how many days were you physically active for a total of at least 60 minutes per day? (Add up all the time you spent in any kind of physical activity that increased your heart rate and made you breathe hard some of the time.)
gen	tvwatching	=	q80	//	On an average school day, how many hours do you watch TV?
gen	computeruse	=	q81	//	On an average school day, how many hours do you play video or computer games or use a computer for something that is not school work? (Count time spent on things such as Xbox, PlayStation, an iPod, an iPad or other tablet, a smartphone, YouTube, Facebook or other social networking tools, and the Internet.)
gen	peattendance	=	q82	//	In an average week when you are in school, on how many days do you go to physical education (PE) classes?
gen	concussion	=	q84	//	During the past 12 months, how many times did you have a concussion from playing a sport or being physically active?
gen	hivtesting	=	q85	//	Have you ever been tested for HIV, the virus that causes AIDS? (Do not count tests done if you donated blood.)
gen	oralhealthcare	=	q86	//	When was the last time you saw a dentist for a check-up, exam, teeth cleaning, or other dental work?
gen	asthma	=	q87	//	Has a doctor or nurse ever told you that you have asthma?
gen	schoolecactivity	=	q111	//	At school I am involved in sports, clubs, or other extra-curricular activities (such as band, cheerleading, or student council). 
gen	adultinschool	=	q119	//	Is there at least one teacher or other adult in your school that you can talk to if you have a problem?
gen	ownhome	=	q90	//	Do your parents or guardians own or rent the home or place where you are living now?
gen	missschool	=	q91	//	During the past 30 days, on how many days did you miss school for any reason, with or without permission?
gen	skippedschool	=	q92	//	During the past 30 days, on how many days did you miss school for any reason, without permission?
gen	idcigarettes	=	q96	//	When you bought or tried to buy cigarettes at a store during the past 30 days, were you ever asked to show proof of age?
gen	refusecigs	=	q97	//	During the past 30 days, did anyone refuse to sell you cigarettes because of your age?
gen	hookah	=	q98	//	During the past 30 days, on how many days did you smoke tobacco in a hookah, narghile, or other type of waterpipe?
gen	ecigflavor	=	q99	//	What kind of flavoring do you usually use with an electronic vapor product?
gen	emarijuana	=	q100	//	What kind of flavoring do you usually use with an electronic vapor product?
gen	expectsmoke	=	q101	//	Do you think you will smoke a cigarette, cigar, cigarillo, or little cigar in the next year?
gen	tobaccoflavortype	=	q102	//	Do you think you will smoke a cigarette, cigar, cigarillo, or little cigar in the next year?
gen	tobaccofirst	=	q103	//	During the past 12 months, did you try or use tobacco products for the first time?
gen	completelyquit	=	q104	//	During the past 12 months, did you completely quit using all tobacco products?
gen	livewithsmoke	=	q105	//	Does anyone who lives with you now smoke cigarettes or cigars?
gen	indoorsmokerules	=	q106	//	Which statement best describes the rules about smoking inside your home?
gen	sameroomsmoke	=	q107	//	During the past 7 days, on how many days were you in the same room with someone who was smoking?
gen	taughttobaccodanger	=	q112	//	During the last school year, were you taught in any of your classes about the dangers of tobacco use?
gen	smokefriends	=	q113	//	Do you think young people who smoke have more friends?
gen	smokingcool	=	q114	//	Do you think smoking makes young people look cool or fit in?
gen	alceverydayfeelings	=	q115	//	How do you feel about someone your age having one or two drinks of an alcoholic beverage nearly every day?
gen	alcoholrisk	=	q116	//	How much do people risk harming themselves (physically and in other ways) if they have five or more drinks of alcohol (beer, wine, or liquor) once or twice a week?
gen	outsideschooladult	=	q117	//	Outside of school, is there an adult you can talk to about things that are important to you?
gen	numberoftrustadults	=	q118	//	Besides your parents, how many adults would you feel comfortable seeking help from if you had an important question affecting your life?

save Maryland2017_Harmonized.dta, replace
********************************************************************************************************************
*****WE NOW APPEND THE TWO FILES TOGETHER. STATE2015 CONTAINS 1991-2015 AND STATE2017 2017 AND HAWAII 1991-2017 ****
*** USING 2015 AS OUR BASE, WE APPEND IN THE 2015 & 2017 INDIVIDUAL DATA FROM THE INDEPENEDENT GATHERED STATES ***********
********************************************************************************************************************
use State15_Harmonized.dta, clear
append using State2017_Harmonized.dta
append using Massachusetts2015_Harmonized.dta, force
append using Vermont2015_Harmonized.dta, force
append using Indiana2015_Harmonized.dta, force
append using NewMexico2015_Harmonized.dta, force
append using Vermont2017_Harmonized.dta, force
append using Maryland2017_Harmonized.dta, force
append using NewMexico2017_Harmonized.dta, force
append using Connecticut2017_Harmonized.dta, force
append using Texas2017_Harmonized.dta, force
append using Massachusetts2017_Harmonized.dta, force

foreach var in yrbs2015 yrbs2017 massachusetts2015 connecticut2017 vermont2015 indiana2015 vermont2017 maryland2017 massachusetts2017 newmexico2017 texas2017 {
replace `var' = `var'==1
label variable `var' "Comes from `var' Dataset"
}

save State_Master.dta, replace

export State_master



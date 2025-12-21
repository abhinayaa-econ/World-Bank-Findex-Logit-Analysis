**************************************************
* Project: Digital Access & Formal Borrowing
* Purpose: Data cleaning and variable construction
* Data: World Bank FINDEX (2021)
* Author: Abhinayaa Kumar Subramanian
**************************************************

clear all
set more off

* Load data
use "/Users/abhinayaaksubramanian/Desktop/Final Dataset.dta"

* Dropping variables irrelevant to the analysis
drop economy economycode regionwb pop_adult wpid_random
drop fin1_1a fin1_1b fin2 fin4 fin4a fin5 fin6 fin8 fin8a fin8b fin9 fin9a fin10 fin10_1a fin10_1b fin10_1c fin10_1d fin10_1e fin10a fin10b fin11_1 fin11a fin11b fin11c fin11d fin11e fin11e fin11f fin11g fin11h fin13_1a fin13_1b fin13_1c fin13_1d fin13_1e fin13_1f fin13a fin13b fin13d fin14_1 fin14_2 fin14_2_China fin14a fin14a1 fin14b fin14c fin14c_2 fin14c_2_China fin16 fin17a fin17a1 fin17b fin20 fin24 fin24a fin24b fin26 fin27_1 fin27c1 fin27c2 fin28 fin29_1 fin29c1 fin29c2 fin30 fin31a fin31b fin31b1 fin31b1_China fin31c fin32 fin33 fin34a fin34b fin34d fin34e fin35 fin37 fin38 fin39a fin39b fin39d fin39e fin42 fin42a fin43a fin43b fin43d fin43e fin44a fin44b fin44c fin44d fin45 fin45_1 fin45_1_China saved receive_wages receive_transfers receive_pension receive_agriculture pay_utilities remittances wgt 

drop if year == 2022

* Dependent variable
gen formal_borr =.
replace formal_borr = 0 if fin22b == 1 
replace formal_borr = 0 if fin22c == 1 
replace formal_borr = 1 if fin22a == 1 
tab formal_borr, missing
count if fin22a != 1 & fin22b != 1 & fin22c != 1
drop if formal_borr == .
label define formal_borr_label 0 "Informal Sources" 1 "Formal Sources"
label values formal_borr formal_borr_label


* Generating digital access variables

replace internetaccess = 1 if internetaccess == 1
replace internetaccess = 0 if internetaccess == 2
replace internetaccess = 0 if internetaccess == 3
replace internetaccess = 0 if internetaccess == 4
label values internetaccess
label define internetaccess_label 0 "No" 1 "Yes"
label values internetaccess internetaccess_label

replace mob_borrow = 1 if mob_borrow == 1
replace mob_borrow = 0 if mob_borrow == 2
replace mob_borrow = 0 if mob_borrow == 3
replace mob_borrow = 0 if mob_borrow == 4
label values mob_borrow
label define mob_borrow_label 0 "No" 1 "Yes"
label values mob_borrow mob_borrow_label

tab anydigpayment
tab fin22a
tab fin22b
replace fin22a = 1 if fin22a == 1
replace fin22a = 0 if fin22a == 2
replace fin22a = 0 if fin22a == 3
replace fin22a = 0 if fin22a == 4
label values fin22a
label values fin22a fin22a_label
tab fin22a
replace fin22b = 1 if fin22b == 1
replace fin22b = 0 if fin22b == 2
replace fin22b = 0 if fin22b == 3
replace fin22b = 0 if fin22b == 4
label values fin22b
label values fin22b fin22b_label
tab fin22b
replace fin22c = 1 if fin22c == 1
replace fin22c = 0 if fin22c == 2
replace fin22c = 0 if fin22c == 3
replace fin22c = 0 if fin22c == 4
label values fin22c
label values fin22c fin22c_label

rename fin7 has_credit
replace has_credit = 1 if has_credit == 1
replace has_credit = 0 if has_credit == 2
replace has_credit = 0 if has_credit == 3
replace has_credit = 0 if has_credit == 4
label values has_credit
label define has_credit_label 0 "No" 1 "Yes"
label values has_credit has_credit_label

* Education

replace educ = . if educ == 4
replace educ = . if educ == 5
replace educ = 0 if educ == 1
replace educ = 0 if educ == 2
replace educ = 1 if educ == 3
tab educ

* Income quintile
tab inc_q

* Controls
tab age
tab female

rename urbanicity_f2f rural
tab rural
replace rural = 1 if rural == 1
replace rural = 0 if rural == 2
label values rural 
label define rural_label 0 "Urban" 1 "Rural"
label values rural rural_label

tab emp_in







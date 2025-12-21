**************************************************
* Purpose: Logit estimation of formal borrowing
**************************************************

* Load cleaned data
do "01_Data_cleaning.do"

 
* Logistic Regression

logit formal_borr internetaccess mob_borrow anydigpayment has_credit i.educ i.inc_q c.age##c.age female rural emp_in, vce(robust)

estimates store logit_main

* Average marginal effects
margins, dydx(*) post


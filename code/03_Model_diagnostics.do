**************************************************
* Purpose: Model diagnostics
**************************************************

do "02_Logit_and_margins.do"


* Multicollinearity check - VIF
reg formal_borr internetaccess mob_borrow anydigpayment has_credit i.educ i.inc_q age c.age#c.age female rural emp_in
estat vif

* restoring Logit Regression results
estimates restore logit_main

* ROC curve
lroc 

* Goodness of fit
estat gof, group(10)

* Classification matrix needed for further interpretation

predict phat, pr
gen yhat = (phat > 0.5)
tabulate formal_borr yhat, missing

gen correct = (formal_borr == yhat)
summarize correct


* Plot the Coefficients graphsss
coefplot, drop(_cons)


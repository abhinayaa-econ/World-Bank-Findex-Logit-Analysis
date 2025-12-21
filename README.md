# Digital Access and Formal Borrowing Decisions  
### Logit Analysis using World Bank FINDEX Microdata (Stata)

## Overview
This project analyses how digital access, education, income, and demographic factors
influence an individual’s likelihood of borrowing from formal financial institutions.
Using individual-level survey data from the World Bank Global FINDEX (2021),
a logistic regression (Logit) framework is applied to model formal borrowing behaviour.

The study focuses on whether digital financial tools act as a gateway
from informal to formal credit sources.

## Data
- **Source:** World Bank Global FINDEX Database (2021)
- **Coverage:** ~145,000 individuals across 139 economies
- **Nature:** Cross-sectional, nationally representative survey data

**Dependent variable**
- Formal borrowing  
  (1 = borrowed from formal institutions, 0 = informal sources)

**Key explanatory variables**
- Internet access  
- Digital payment usage  
- Mobile-based borrowing  
- Credit card ownership  
- Education level (tertiary vs non-tertiary)  
- Income quintiles  

**Controls**
- Age and age-squared  
- Gender  
- Rural/urban residence  
- Employment status  

> Raw FINDEX data are not uploaded due to licensing restrictions.  
> Replication logic and variable construction are documented in the code files.

## Methodology
- Binary choice modelling using **Logistic Regression (Logit)**
- Robust standard errors to account for heteroskedasticity
- Interpretation via **Average Marginal Effects**

**Model diagnostics include**
- Wald chi-square test  
- Pseudo R-squared  
- Variance Inflation Factors (VIF)  
- Hosmer–Lemeshow goodness-of-fit test  
- ROC curve and Area Under the Curve (AUC)

## Key Findings
- Digital access significantly increases the probability of formal borrowing
- Credit card ownership has the strongest effect, increasing formal borrowing
  probability by approximately **21 percentage points**
- Internet access and digital payment usage raise borrowing likelihood
  by around **7 percentage points**
- Higher education and income levels are positively associated with formal credit use
- Women are less likely to borrow formally than men, controlling for other factors
- The model demonstrates moderate discriminatory power (**AUC ≈ 0.66**) and acceptable fit

## Policy Implications
- Expanding digital infrastructure can improve access to formal credit
- Early financial touchpoints (e.g., credit cards) act as gateways to broader financial inclusion
- Targeted digital financial literacy initiatives are crucial
- Gender-sensitive credit products may help reduce borrowing gaps

## Repository Structure
- `code/` – Stata do-files for cleaning, estimation, margins, and diagnostics
- `output/` – Regression tables and figures
- `report/` – Full project report (PDF)

## Tools
- Stata  
- World Bank FINDEX

## Author
**Abhinayaa Kumar Subramanian**  
MSc Applied Economics, National University of Singapore

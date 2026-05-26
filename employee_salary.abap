*&---------------------------------------------------------------------*
*& Report ZEMPLOYEE_SALARY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEMPLOYEE_SALARY.


* User Input Parameters
PARAMETERS:
  p_name TYPE string,
  p_id   TYPE i,
  p_sal  TYPE p DECIMALS 2.

* Variable Declaration
DATA:
  lv_bonus TYPE p DECIMALS 2,
  lv_tax   TYPE p DECIMALS 2,
  lv_final TYPE p DECIMALS 2,
  lv_tax_per TYPE p DECIMALS 2.

* Constant Declaration
CONSTANTS:
  lc_bonus TYPE p VALUE '10'.

* Bonus Calculation
lv_bonus = ( p_sal * lc_bonus ) / 100.

* Tax Slab Logic
IF p_sal > 50000.
  lv_tax_per = 10.
ELSE.
  lv_tax_per = 5.
ENDIF.

* Tax Calculation
lv_tax = ( p_sal * lv_tax_per ) / 100.

* Final Salary
lv_final = p_sal + lv_bonus - lv_tax.

* Output
WRITE: / '==================================='.
WRITE: / '     EMPLOYEE SALARY REPORT        '.
WRITE: / '==================================='.

WRITE: / 'Employee Name :', p_name.
WRITE: / 'Employee ID   :', p_id.
WRITE: / 'Basic Salary  :', p_sal.
WRITE: / 'Bonus Amount  :', lv_bonus.
WRITE: / 'Tax Percent   :', lv_tax_per.
WRITE: / 'Tax Amount    :', lv_tax.
WRITE: / 'Net Salary    :', lv_final.

WRITE: / '==================================='.

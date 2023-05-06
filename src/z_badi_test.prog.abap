*&---------------------------------------------------------------------*
*& Report z_badi_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_badi_test.

DATA: handle TYPE REF TO z_badi_calc_vat,

sum TYPE p,

vat TYPE p,

percent TYPE p.

sum = 50.

GET BADI handle.

CALL BADI handle->get_vat

EXPORTING iv_amount = sum

IMPORTING ev_amount_vat = vat

ev_percent_vat = percent.

WRITE: 'percentage:', percent, 'VAT:', vat.

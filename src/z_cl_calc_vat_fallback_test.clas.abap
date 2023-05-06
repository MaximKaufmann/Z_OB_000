CLASS z_cl_calc_vat_fallback_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES z_if_calc_vat .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_cl_calc_vat_fallback_test IMPLEMENTATION.
  METHOD z_if_calc_vat~get_vat.
DATA: percent TYPE p VALUE 20.

ev_amount_vat = iv_amount * percent / 100.

ev_percent_vat = percent.
  ENDMETHOD.

ENDCLASS.

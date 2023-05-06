CLASS z_ob_cl_000_tochter DEFINITION INHERITING FROM z_ob_cl_000
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_quotient
      IMPORTING
        !iv_divident TYPE int4
        !iv_divisor  TYPE int4
      EXPORTING
        !ev_quotient TYPE float.

    METHODS is_even REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_ob_cl_000_tochter IMPLEMENTATION.

  METHOD get_quotient.
    ev_quotient = iv_divident / iv_divisor.
  ENDMETHOD.

  METHOD is_even.
    CALL METHOD super->is_even(
      EXPORTING
        iv_zahl     = iv_zahl
      IMPORTING
        ev_ergebnis = ev_ergebnis ).
    ev_ergebnis = ev_ergebnis && '!'.
  ENDMETHOD.

ENDCLASS.

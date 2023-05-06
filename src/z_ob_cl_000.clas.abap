CLASS z_ob_cl_000 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS gc_even TYPE string VALUE 'gerade'.
    METHODS is_even
      IMPORTING
        !iv_zahl     TYPE int4
      EXPORTING
        !ev_ergebnis TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_text
      IMPORTING
        !iv_zahl TYPE int4
      EXPORTING
        !ev_text TYPE string.

ENDCLASS.



CLASS z_ob_cl_000 IMPLEMENTATION.

  METHOD is_even.
    IF iv_zahl MOD 2 EQ 0.
      ev_ergebnis = gc_even.
    ELSE.
      ev_ergebnis = 'ungerade'.
    ENDIF.

    get_text(
    EXPORTING
    iv_zahl = iv_zahl
    IMPORTING
    ev_text = DATA(lv_text)
     ).

    ev_ergebnis = lv_text && ev_ergebnis.

  ENDMETHOD.

  METHOD get_text.
    ev_text = |Ihre Zahl { iv_zahl } ist |.
  ENDMETHOD.
ENDCLASS.

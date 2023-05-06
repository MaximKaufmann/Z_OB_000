*&---------------------------------------------------------------------*
*& Report z_ob_000_badcode01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_000_badcode03.

DATA: lv_name TYPE string,
      lv_age TYPE i,
      lt_data TYPE TABLE OF sairport.

lv_name = 'John'.
lv_age = 30.

IF lv_age >= 18.
  SELECT * FROM sairport INTO TABLE lt_data.
ENDIF.

IF lt_data IS INITIAL.
  WRITE: / 'Id', 'Name'.
  LOOP AT lt_data INTO DATA(ls_data).
    WRITE: / ls_data-id, ls_data-name.
  ENDLOOP.
ENDIF.

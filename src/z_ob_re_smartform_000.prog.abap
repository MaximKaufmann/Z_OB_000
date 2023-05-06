*&---------------------------------------------------------------------*
*& Report Z_OB_RE_SMARTFORM_000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_smartform_000.

"Datendeklaration
DATA: lv_fm_name  TYPE rs38l_fnam.

"Ermittle den generischen Funktionsbausteinnamen
CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname           = 'Z_OB_SF_000'
  IMPORTING
    fm_name            = lv_fm_name
  EXCEPTIONS
    no_form            = 1
    no_function_module = 2
    OTHERS             = 3.


"Parameter werden beim Aufruf des Funktionsbausteins übergeben
CALL FUNCTION lv_fm_name
  EXPORTING
    ip_username      = sy-uname
    ip_language      = sy-langu
    ip_client        = sy-mandt
  EXCEPTIONS
    formatting_error = 1
    internal_error   = 2
    send_error       = 3
    user_canceled    = 4
    OTHERS           = 5.

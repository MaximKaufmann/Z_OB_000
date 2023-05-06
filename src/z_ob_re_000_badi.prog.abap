*&---------------------------------------------------------------------*
*& Report z_ob_re_000_badi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_000_badi.

*parameters: ctry(2) type c.
*
*DATA: handle  TYPE REF TO z_badi_calc_vat_000,
*      sum     TYPE p,
*      vat     TYPE p,
*      percent TYPE p.
*
*sum = 50.
*
*GET BADI handle FILTERS Country = ctry.
*
*CALL BADI handle->get_vat
*  EXPORTING
*    iv_amount      = sum
*  IMPORTING
*    ev_amount_vat  = vat
*    ev_percent_vat = percent.
*
*WRITE: 'Prozent:', percent, 'Umsatzsteuer:', vat.

DATA(ls_jsondata2) = '{ "animals" :[{ "type": "cat", "name": "Tishka", "age": 5,' +
'"loves": "sausage", "breed": "red cat" }, { "type": "dog", "name": "Tuzik", "age":' +
'5, "breed": "Ovcharka", "hobby": "throw a ball" } ]}'.

WRITE ls_jsondata2.

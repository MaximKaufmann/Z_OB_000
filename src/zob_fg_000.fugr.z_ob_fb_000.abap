FUNCTION z_ob_fb_000.
*"----------------------------------------------------------------------
*"*"Verbuchungsfunktionsbaustein:
*"
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_FLTIME) TYPE  S_FLTIME
*"----------------------------------------------------------------------
  DATA: lv_carrid TYPE s_carr_id VALUE 'LH',
        lv_connid TYPE s_conn_id VALUE '2402'.

  SELECT SINGLE * FROM zob_t_lock_000 WHERE carrid = @lv_carrid AND connid = @lv_connid INTO @DATA(ls_tableline).

  ls_tableline-fltime = iv_fltime. "lv_num.

  MODIFY zob_t_lock_000 FROM ls_tableline.

ENDFUNCTION.

*&---------------------------------------------------------------------*
*& Report z_ob_re_000_cw
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*_OB_
REPORT z_ob_re_000_cw.


DATA: lv_carrid       TYPE s_carr_id VALUE 'LH',
      lv_connid       TYPE s_conn_id VALUE '0402',
      lt_cdtxt        LIKE TABLE OF cdtxt,
      ls_tchange_before TYPE zob_t_change_000,
      ls_tchange_after  TYPE zob_t_change_000.


SELECT SINGLE * FROM zob_t_change_000 WHERE carrid = @lv_carrid AND connid = @lv_connid INTO @DATA(ls_tableline).

ls_tchange_before = ls_tableline.


ls_tableline-connid = '2402'.
ls_tableline-fltime = 111.
ls_tableline-notes = 'Heute 10 Minuten später'.
MODIFY zob_t_change_000 FROM ls_tableline.

ls_tchange_after = ls_tableline.

CALL FUNCTION 'ZOB_000_CHANGE_WRITE_DOCUMENT'
  EXPORTING
    objectid                  = 'ZOB_T_CHANGE_000'
    tcode                     = sy-tcode
    utime                     = sy-timlo
    udate                     = sy-datlo
    username                  = sy-uname
*    planned_change_number     = space
    object_change_indicator   = 'I'
*    planned_or_real_changes   = space
*    no_change_pointers        = space
*    upd_icdtxt_zob_000_change = space
    n_zob_t_change_000        = ls_tchange_after
    o_zob_t_change_000        = ls_tchange_before
    upd_zob_t_change_000      = 'I'
  TABLES
    icdtxt_zob_000_change     = lt_cdtxt
  .


*
*CALL FUNCTION 'ENQUEUE_EZOB_T_LOCK_000'
*  EXPORTING
*    mode_zob_t_lock_000 = 'E'
*    client              = sy-mandt
*    carrid              = lv_carrid
*    connid              = lv_connid
*  EXCEPTIONS
*    foreign_lock        = 1
*    system_failure      = 2
*    OTHERS              = 3.
*
*IF sy-subrc <> 0.
*  MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*ENDIF.
*
*DATA: lt_cdtxt LIKE TABLE OF CDTXT.
*DATA: ls_tlock_before TYPE zob_t_lock_000.
*DATA: ls_tlock_after TYPE zob_t_lock_000.
*
*SELECT SINGLE * FROM zob_t_lock_000 WHERE carrid = @lv_carrid AND connid = @lv_connid INTO @DATA(ls_tableline).
*
*ls_tlock_before = ls_tableline.
*
*ls_tableline-fltime = 222.
*ls_tableline-notes = 'Heute 30 Minuten später'.
*MODIFY zob_t_lock_000 FROM ls_tableline.
*
*ls_tlock_after = ls_tableline.
*
*CALL FUNCTION 'DEQUEUE_EZOB_T_LOCK_000'
*  EXPORTING
*    mode_zob_t_lock_000 = 'E'
*    client              = sy-mandt
*    carrid              = lv_carrid
*    connid              = lv_connid.
*
*** Änderungsbelege schreiben
*      CALL FUNCTION 'ZOB_000_NOTES_WRITE_DOCUMENT'
*        EXPORTING
*          objectid                 = 'ZOB_T_LOCK_000'
*          tcode                    = sy-tcode
*          utime                    = sy-timlo
*          udate                    = sy-datlo
*          username                 = sy-uname
**          planned_change_number    = space
*          object_change_indicator  = 'U'
**          planned_or_real_changes  = space
**          no_change_pointers       = space
**          upd_icdtxt_zob_000_notes = space
*          n_zob_t_lock_000         = ls_tlock_after
*          o_zob_t_lock_000         = ls_tlock_before
*          upd_zob_t_lock_000       = 'U'
*        tables
*          icdtxt_zob_000_notes     = lt_cdtxt
*        .

*&---------------------------------------------------------------------*
*& Report z_ob_000_badcode01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_000_badcode02.

DATA: lv_number TYPE i.

lv_number = 20.

IF lv_number = 0.
  WRITE 'Die Zahl ist  zero.'.
ELSE.
  IF lv_number = 1.
    WRITE 'Die Zahl ist  one.'.
  ELSE.
    IF lv_number = 2.
      WRITE 'Die Zahl ist  two.'.
    ELSE.
      IF lv_number = 3.
        WRITE 'Die Zahl ist  three.'.
      ELSE.
        IF lv_number = 4.
          WRITE 'Die Zahl ist  four.'.
        ELSE.
          IF lv_number = 5.
            WRITE 'Die Zahl ist  five.'.
          ELSE.
            IF lv_number = 6.
              WRITE 'Die Zahl ist  six.'.
            ELSE.
              IF lv_number = 7.
                WRITE 'Die Zahl ist  seven.'.
              ELSE.
                IF lv_number = 8.
                  WRITE 'Die Zahl ist  eight.'.
                ELSE.
                  IF lv_number = 9.
                    WRITE 'Die Zahl ist  nine.'.
                  ELSE.
                    WRITE 'Die Zahl ist  größer als nine.'.
                  ENDIF.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDIF.
ENDIF.

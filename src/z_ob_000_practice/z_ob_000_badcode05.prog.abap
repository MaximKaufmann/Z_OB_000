*&---------------------------------------------------------------------*
*& Report z_ob_000_badcode01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_000_badcode05.

DATA:lt_numbers TYPE TABLE OF i.
DATA: lv_counter    TYPE i,
      lv_iterations TYPE i VALUE 5,
      lv_result     TYPE int8,
      lv_limit      TYPE i VALUE 2,
      lv_power      TYPE i VALUE 1.


lt_numbers = VALUE #( ( 1 ) ( 2 ) ( 3 ) ( 4 )  ).

APPEND '1' TO lt_numbers.
APPEND '2' TO lt_numbers.
APPEND '3' TO lt_numbers.
APPEND '4' TO lt_numbers.
APPEND '5' TO lt_numbers.
APPEND '6' TO lt_numbers.
APPEND '7' TO lt_numbers.
APPEND '8' TO lt_numbers.
APPEND '9' TO lt_numbers.
APPEND '10' TO lt_numbers.

LOOP AT lt_numbers INTO DATA(lv_number).

  WHILE lv_counter < lv_limit.

    DO lv_iterations TIMES.
      lv_result = lv_number * lv_power.
      WRITE: / lv_number, '*', lv_power, '=', lv_result.
      lv_power = lv_power + 1.
    ENDDO.

    lv_counter = lv_counter + 1.

  ENDWHILE.

  lv_counter = 0.
  lv_power = 1.

ENDLOOP.

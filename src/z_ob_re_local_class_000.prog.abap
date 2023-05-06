*&---------------------------------------------------------------------*
*& Report z_ob_re_local_class_000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_local_class_000.

CLASS cl_local DEFINITION.
* Public-Deklarationen, global inner- und außerhalb des Objektes sichtbar
  PUBLIC SECTION.
    DATA: today TYPE d.        " dyn. Variable, nur zur Obj-Laufzeit verfügbar

* statische Methode, hat keinen Zugriff auf today
    CLASS-METHODS: say_hello_world
      IMPORTING
                iv_name            TYPE string
      RETURNING VALUE(rv_greeting) TYPE string. " wenn RETURNING VALUE, dann kein EXPORTING oder CHANGING möglich

* dynamische Methode, hat Zugriff auf today
    METHODS: say_date
      RETURNING VALUE(rv_message) TYPE string.

    METHODS: constructor
      IMPORTING
        today TYPE date.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS cl_local IMPLEMENTATION.

  METHOD constructor.
    me->today = |{ today+6(2) }.{ today+4(2) }.{ today+2(2) }|.
  ENDMETHOD.

  METHOD say_hello_world.
    rv_greeting = |Hallo Welt! Ich bins { iv_name }.|.
  ENDMETHOD.

  METHOD say_date.
    rv_message = |Heute ist der { today }.|.
  ENDMETHOD.

ENDCLASS.


START-OF-SELECTION.
* statische Objektaufrufe
  DATA(lv_returning) = cl_local=>say_hello_world( |Learn-000| ).
  WRITE: lv_returning.

* dynamische Objektaufrufe
  DATA(o_class) = NEW cl_local( today = CONV #( sy-datum ) ).
  WRITE: o_class->say_date( ).
*
*  DATA: lv_return TYPE string.
*  o_class->say_date(
*    RECEIVING
*        rv_message = lv_return ).
*  WRITE lv_return.

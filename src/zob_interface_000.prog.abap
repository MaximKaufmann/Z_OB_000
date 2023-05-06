*&---------------------------------------------------------------------*
*& Report zob_interface_000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_interface_000.

DATA: lt_ids     LIKE TABLE OF zob00_airline_ids,
      ls_airline TYPE scarr.
*      lt_airlines TYPE TABLE OF scarr.

"Aufruf RFC

CALL FUNCTION 'ZOB00_GET_AIRLINE_ID_000' DESTINATION 'obd_OBD_00'
  TABLES
    t_airline_ids = lt_ids.

*cl_demo_output=>display( lt_ids ).



ls_airline = VALUE scarr( carrid = 'XF'
                          carrname = 'X Flights'
                          currcode = 'EUR'
                          url = 'x-flights.com'  ).

CALL FUNCTION 'ZOB00_CREATE_AIRLINE_000' DESTINATION 'obd_OBD_00'
  EXPORTING
    is_airline = ls_airline.


"Aufruf BAPI

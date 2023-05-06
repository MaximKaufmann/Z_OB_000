FUNCTION zob00_create_airline_000.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IS_AIRLINE) TYPE  SCARR
*"----------------------------------------------------------------------
  INSERT scarr FROM is_airline.


ENDFUNCTION.

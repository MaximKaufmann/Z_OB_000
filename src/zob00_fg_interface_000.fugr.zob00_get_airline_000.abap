FUNCTION ZOB00_GET_AIRLINE_000.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_AIRLINE_ID) TYPE  SCARR-CARRID
*"  TABLES
*"      ET_AIRLINE_INFO STRUCTURE  SCARR
*"----------------------------------------------------------------------
  SELECT
      *
      FROM scarr
*    LEFT JOIN SPFLI ON spfli~carrid = scarr~carrid
      WHERE scarr~carrid = @iv_airline_id
      INTO TABLE @et_airline_info.


ENDFUNCTION.

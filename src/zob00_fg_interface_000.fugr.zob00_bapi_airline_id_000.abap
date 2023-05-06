FUNCTION zob00_bapi_airline_id_000.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(ID) TYPE  S_CARRID
*"  EXPORTING
*"     VALUE(RETURN) TYPE  BAPIRET2
*"  TABLES
*"      ITEMTAB STRUCTURE  SCARR
*"----------------------------------------------------------------------
  SELECT
      *
      FROM scarr
      INTO TABLE @itemtab
      WHERE carrid = @id.





ENDFUNCTION.

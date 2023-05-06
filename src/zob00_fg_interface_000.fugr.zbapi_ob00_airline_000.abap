FUNCTION zbapi_ob00_airline_000.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(ID) TYPE  ZBAPI_OB00_AIRLINE_000-CARRID
*"  EXPORTING
*"     VALUE(RETURN) TYPE  BAPIRET2
*"  TABLES
*"      ITEMTAB STRUCTURE  ZBAPI_OB00_AIRLINE_000
*"----------------------------------------------------------------------
  SELECT
      carrid,
      carrname,
      currcode,
      url
      FROM scarr
      INTO CORRESPONDING FIELDS OF TABLE @itemtab
      WHERE carrid = @id.

ENDFUNCTION.

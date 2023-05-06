**********************************************************************
* Gibt alle vegebenen IDs zurück
**********************************************************************

FUNCTION zob00_get_airline_id_000.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  TABLES
*"      T_AIRLINE_IDS STRUCTURE  ZOB00_AIRLINE_IDS
*"----------------------------------------------------------------------
  SELECT
      carrid AS scarr_id
      FROM scarr
      INTO CORRESPONDING FIELDS OF TABLE @t_airline_ids
      ORDER BY carrid.




ENDFUNCTION.

*&---------------------------------------------------------------------*
*& Report z_ob_000_badcode01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_000_badcode04.

DATA: BEGIN OF ls_result,
        fldate   TYPE sflight-fldate,
        carrid   TYPE sflight-carrid,
        carrname TYPE scarr-carrname,
        airpfrom TYPE sairport-name,
        airpto   TYPE sairport-name,
      END OF ls_result,
      lt_result LIKE TABLE OF ls_result.

SELECT DISTINCT
*    sflight~fldate,
    spfli~carrid,
    scarr~carrname,
    sairport~name AS airpfrom,
    sairportto~name AS airpto
    FROM spfli
    LEFT JOIN sflight ON sflight~carrid = spfli~carrid
        AND sflight~connid = spfli~connid
*        AND sflight~fldate = spfli~fldate
    LEFT JOIN scarr ON scarr~carrid = spfli~carrid
    LEFT JOIN sairport ON sairport~id = spfli~airpfrom
    LEFT JOIN sairport AS sairportto ON sairport~id = spfli~airpto
    INTO TABLE @DATA(lt_flights).

cl_demo_output=>display( lt_flights ).

*
*SELECT
*    *
*    FROM spfli
*    INTO TABLE @DATA(lt_flights).
*
*
*LOOP AT lt_flights INTO DATA(ls_flight).
*
*  ls_result-carrid = ls_flight-carrid.
*
*  SELECT SINGLE
*   *
*   FROM Sflight
*   WHERE carrid = @ls_flight-carrid
*    AND connid = @ls_flight-connid
*   INTO @DATA(ls_sflight).
*
*  ls_result-fldate = ls_sflight-fldate.
*
*
*  SELECT SINGLE
*    *
*    FROM sairport
*    WHERE id = @ls_flight-airpfrom
*    INTO @DATA(ls_airport).
*
*  ls_result-airpfrom = ls_airport-name.
*
*  SELECT SINGLE
*    *
*    FROM sairport
*    WHERE id = @ls_flight-airpto
*    INTO @DATA(ls_airport2).
*
*  ls_result-airpto = ls_airport2-name.
*
*    SELECT SINGLE
*    *
*    FROM scarr
*    WHERE carrid = @ls_flight-carrid
*    INTO @DATA(ls_scarr).
*
*  ls_result-carrname = ls_scarr-carrname.
*
*
*  APPEND ls_result TO lt_result.
*
*ENDLOOP.
*
*cl_demo_output=>display( lt_result ).

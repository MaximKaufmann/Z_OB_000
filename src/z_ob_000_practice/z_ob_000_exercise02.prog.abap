*&---------------------------------------------------------------------*
*& Report z_ob_000_badcode01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_000_exercise02.
"Geben Sie die Adresse des Kunden 132986 aus
" Tablle KNA1
DATA lv_kunnr TYPE kunnr VALUE 132986.

lv_kunnr = |{ lv_kunnr ALPHA = IN }|.

SELECT SINGLE ort01, pstlz
FROM kna1
*WHERE kunnr = '0000132986'
WHERE kunnr = @lv_kunnr
INTO @DATA(result1).

cl_demo_output=>display( result1 ).

"Finden Sie alle Belegnummern von Warenausgabe vom 08/01/2021 über den Betrag 120,000.00 (Deutscher Buchungskreis) heraus
" Ggf. Datum und Betrag anpassen
" Tabellen: BKPF, BSEG

"Finden Sie heraus aus welchen Teilen das 'E-Otto Performance Cityrad' besteht
" tabellen: MARA / MAKT, MAST, STPO

*Geben Sie nur eine Buchung des Kunden Christa Heller aus.
*Tabelle: SBOOK
*

*Wählen Sie alle Linienflüge der Fluggesellschaft „Lufthansa“ aus.
*Tabelle: SPFLI, SCARR
*

*Sie wollen die durchschnittlichen Sitzplätze der Economy, Business und First Class wissen.
*Gruppieren Sie die Ergebnisse nach carrid und connid.
*Tabelle: SFLIGHT
*

*Sortieren Sie alle Flughäfen nach ihrer Zeitzone.
*Tabelle: SAIRPORT
*

*Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus. Geben Sie maximal 20 Einträge aus.
*Tabellen: SBOOK und SCUSTOM
*

*Legen Sie sich eine Datenbanktabelle ZOB_T_EXAMPLE_###.
*

*Fügen Sie drei Einträge in die ZOB_T_EXAMPLE_### Tabelle ein.
*

*Ändern Sie einen zuvor angelegten Eintrag in der ZOB_T_EXAMPLE_### Tabelle.

*Löschen Sie einen zuvor angelegten Eintrag in der ZOB_T_EXAMPLE_### Tabelle.

*&---------------------------------------------------------------------*
*& Report z_ob_httpclient_000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_httpclient_000.

"Datendeklaration
DATA: lv_host      TYPE string VALUE 'openlibrary.org', "Datenquellem Server mit dem kommuniziert werden soll
      lv_service   TYPE string VALUE '443', "Standard-HTTPS-Port
      li_client    TYPE REF TO if_http_client, "Client für Anfrage

      lv_path      TYPE string VALUE
           '/api/books?bibkeys=ISBN:9684760892&jscmd=data&format=json',
      lv_errortext TYPE string. "Fehlertext der Anfrage
DATA: lv_data   TYPE string, "Die Daten vom Response
      lt_fields TYPE tihttpnvp, "Felder aus dem Header
      ls_field  LIKE LINE OF lt_fields,
      lt_data   TYPE stringtab, "Zerhackte Daten
      ls_data   LIKE LINE OF lt_data.


* Ein Client-Objekt für die Kommunikation instanziieren
CALL METHOD cl_http_client=>create
  EXPORTING
    host               = lv_host
    service            = lv_service
    scheme             = cl_http_client=>schemetype_https "= 2
  IMPORTING
    client             = li_client
  EXCEPTIONS "
    argument_not_found = 1
    internal_error     = 2
    plugin_not_active  = 3
    OTHERS             = 4.

"Fehlerbehandlung
IF sy-subrc <> 0."
  WRITE: / 'Die Anlage des Clients schlug fehlt'.
  EXIT. "Beende die Verarbeitung
ENDIF.

"Die Request-Methode auf GET setzen
CALL METHOD li_client->request->set_method(
  if_http_request=>co_request_method_get ).

* Protokollversion HTTPS/1.1 setzen
li_client->request->set_version(
  if_http_request=>co_protocol_version_1_1 ).

* Die Request-URI festlegen
cl_http_utility=>set_request_uri(
  request = li_client->request
  uri = lv_path ).

****************************************************************
* Senden des Requests
CALL METHOD li_client->send
  EXCEPTIONS
    http_communication_failure = 1
    http_invalid_state         = 2
    http_processing_failed     = 3
    OTHERS                     = 4.

* Fehlerbehandlung
IF sy-subrc <> 0.
* Ermittlung des Fehlers
  CALL METHOD li_client->get_last_error
    IMPORTING
      message = lv_errortext.
  WRITE: / 'Kommunikationsfehler beim send.', 'Fehlernachricht: ',  lv_errortext.
  EXIT. "Beende die Verarbeitung
ENDIF.
****************************************************************
* Empfangen der Ergebnisse
CALL METHOD li_client->receive
  EXCEPTIONS
    http_communication_failure = 1
    http_invalid_state         = 2
    http_processing_failed     = 3
    OTHERS                     = 4.

* Fehlerbehandlung
IF sy-subrc <> 0.
  CALL METHOD li_client->get_last_error
    IMPORTING
      message = lv_errortext.
  WRITE: / 'Kommunikationsfehler beim receive', 'Fehlernachricht: ',
  lv_errortext.
  EXIT. "Beende die Verarbeitung
ENDIF.

****************************************************************
"Ausgabe der Daten
"Header-Daten der Übertragung
CALL METHOD li_client->response->get_header_fields
  CHANGING
    fields = lt_fields.

"Ausgabe der Header Fields auf Standardliste

WRITE: / 'Header Fields:'.

LOOP AT lt_fields INTO ls_field.
  WRITE: / 'header_name', ls_field-name,
  'header_value', ls_field-value.
ENDLOOP.

"Response-Daten ermitteln aus Response-Objekt
lv_data = li_client->response->get_cdata( ).

WRITE: / , /'Data:'.
SPLIT lv_data AT '{' INTO TABLE lt_data.
LOOP AT lt_data INTO ls_data.
  WRITE: / ls_data.
ENDLOOP.

****************************************************************
"Schließen der Verbindung
CALL METHOD li_client->close
  EXCEPTIONS
    http_invalid_state = 1
    OTHERS             = 2.

"Fehlerbehandlung
IF sy-subrc <> 0.
  CALL METHOD li_client->get_last_error
    IMPORTING
      message = lv_errortext.
  WRITE: / 'Kommunikationsfehler beim close:', lv_errortext.
  EXIT. "Beende die Verarbeitung
ENDIF.

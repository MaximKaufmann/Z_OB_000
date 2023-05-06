*&---------------------------------------------------------------------*
*& Report z_ob_re_000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_re_000.

DATA: ls_addr   TYPE bapiaddr3,
      ls_addr_x TYPE bapiaddr3x,
      lt_return TYPE STANDARD TABLE OF bapiret2,
      ls_return LIKE LINE OF lt_return.

*CALL FUNCTION 'BAPI_USER_GET_DETAIL'
*  EXPORTING
*    username = 'DWINDHEUSER'
*  IMPORTING
*    address  = ls_addr
*  TABLES
*    return   = lt_return.

*ls_addr-e_mail = '123@in4md-service.de'.
*ls_addr_x-e_mail = abap_true.


CALL FUNCTION 'BAPI_USER_CHANGE'
  EXPORTING
    username = 'DWINDHEUSER'
    address  = ls_addr
    addressx = ls_addr_x
  tables
    return   = lt_return.

CALL FUNCTION 'BAPI_USER_LOCK'
  EXPORTING
    username = 'LEARN-000'
  TABLES
    return   = lt_return
  .

DATA(lv_error) = abap_true.

IF lv_error = abap_true.
*    ROLLBACK WORK.
    CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'
      IMPORTING
        return = ls_return
      .
ELSE.
*    COMMIT WORK.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      IMPORTING
        return = ls_return
      .
ENDIF.





*DATA: lt_roles  TYPE STANDARD TABLE OF bapiagr,
*      ls_role LIKE LINE OF lt_roles,
*      lt_return TYPE STANDARD TABLE OF bapiret2,
*      ls_return LIKE LINE OF lt_return.
*
*CALL FUNCTION 'BAPI_USER_GET_DETAIL'
*  EXPORTING
*    username       = 'DWINDHEUSER'
*  TABLES
*    activitygroups = lt_roles
*    return         = lt_return.
*
*ls_role-agr_name = 'SAP_BC_DB_ADMIN'.
**ls_role-agr_name = 'ZZZ'.
*APPEND ls_role TO lt_roles.
*
*
*CALL FUNCTION 'BAPI_USER_ACTGROUPS_ASSIGN'
*  EXPORTING
*    username       = 'DWINDHEUSER'
*  TABLES
*    activitygroups = lt_roles
*    return         = lt_return.
*
*DATA(lv_error) = abap_true.
*
*IF lv_error = abap_true.
*  CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'
*    IMPORTING
*      return = ls_return.
*ELSE.
*  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*    IMPORTING
*      return = ls_return.
*ENDIF.

*BREAK-POINT.

*CALL FUNCTION 'Z_OB_FB_000' IN UPDATE TASK
*  EXPORTING
*    iv_fltime = 111.
*
*CALL FUNCTION 'Z_OB_FB_000' IN UPDATE TASK
*  EXPORTING
*    iv_fltime = 222.

*CALL FUNCTION 'Z_OB_FB_000' IN UPDATE TASK
*  EXPORTING
*    iv_fltime = 333.

*BREAK-POINT.

*ROLLBACK WORK.

**********************************************************************
*** Datenquellen

*** Upload CSV
*"Datendeklaration
*DATA: BEGIN OF ls_organization,
*        index               TYPE i,
*        organization_Id     TYPE string,
*        name                TYPE string,
*        website             TYPE string,
*        country             TYPE string,
*        description         TYPE string,
*        founded             TYPE gjahr,
*        industry            TYPE string,
*        number_of_employees TYPE i,
*      END OF ls_organization,
*      lt_organizations LIKE TABLE OF ls_organization.
*
*DATA: lt_csv_data   TYPE  truxs_t_text_data.
*
*
*CALL FUNCTION 'GUI_UPLOAD'
*  EXPORTING
*    filename = 'C:\Users\DeniseRocioWindheuse\Desktop\Schulung\Datenquellen_organizations.csv'
*  TABLES
*    data_tab = lt_csv_data.
*
**cl_demo_output=>display( lt_csv_data ).
*
*
*DATA(lv_headerline) = lt_csv_data[ 1 ].
*"entferne die Kopfzeile
*DELETE lt_csv_data INDEX 1.
*
*CALL FUNCTION 'TEXT_CONVERT_CSV_TO_SAP'
*  EXPORTING
*    i_tab_raw_data       = lt_csv_data
*  TABLES
*    i_tab_converted_data = lt_organizations.
*
**cl_demo_output=>display( lt_organizations  ).
*
*
**** Download CSV
*
*LOOP AT lt_organizations ASSIGNING FIELD-SYMBOL(<line>) WHERE founded >= 2000.
*  DELETE lt_organizations.
*ENDLOOP.
*
**cl_demo_output=>display( lt_organizations ).
*
*
*CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'
*  EXPORTING
*    i_field_seperator    = ';'
*  TABLES
*    i_tab_sap_data       = lt_organizations
*  CHANGING
*    i_tab_converted_data = lt_csv_data
*  EXCEPTIONS
*    conversion_failed    = 1
*    OTHERS               = 2.
*
**cl_demo_output=>display( lt_csv_data  ).
*
*INSERT lv_headerline INTO lt_csv_data INDEX 1.
*
*CALL FUNCTION 'GUI_DOWNLOAD'
*  EXPORTING
*    filename = 'C:\Users\DeniseRocioWindheuse\Desktop\Schulung\Datenquellen_old_organizations.csv'
*  TABLES
*    data_tab = lt_csv_data.
*

*** JSON

*TYPES: BEGIN OF ts_json,
*         key   TYPE string,
*         value TYPE string,
*       END OF ts_json.
*
*DATA:  ls_jsondata TYPE ts_json.
*
*DATA(lv_jsondata) = '{ "key": "1", "value": "One" }'.
*
*/ui2/cl_json=>deserialize(
*  EXPORTING json = CONV #( lv_jsondata )
*  CHANGING data = ls_jsondata
*).
*
*
*cl_demo_output=>display( ls_jsondata  ).


*
*DATA(ls_jsondata2) = '{ "animals" :[{ "type": "cat", "name": "Tishka", "age": 5, "loves": "sausage", "breed": "red cat" }, { "type": "dog", "name": "Tuzik", "age": 5, "breed": "Ovcharka", "hobby": "throw a ball" } ]}'.
*
*TYPES:
*  BEGIN OF ts_animal_characteristics,
*    type  TYPE string,
*    name  TYPE string,
*    age   TYPE string,
*    loves TYPE string,
*    breed TYPE string,
*  END OF ts_animal_characteristics,
*  tt_animals TYPE STANDARD TABLE OF ts_animal_characteristics WITH EMPTY KEY.
*
*TYPES: BEGIN OF ts_animals,
*         animals TYPE tt_animals,
*       END OF ts_animals.
*
*DATA ls_animals TYPE ts_animals.
*
*/ui2/cl_json=>deserialize(
*  EXPORTING json = CONV #( ls_jsondata2 )
*  CHANGING data = ls_animals
*).
*
*cl_demo_output=>display( ls_animals-animals  ).

*BREAK-POINT.



*** XML

*DATA xmlbin_tab TYPE TABLE OF x255.
*DATA xml_xstr TYPE xstring.
*DATA len TYPE i.
*BREAK-POINT.
*CALL FUNCTION 'GUI_UPLOAD'
*  EXPORTING
*    filename   = 'C:\Users\DeniseRocioWindheuse\Desktop\Schulung\Datenquellen_billing.xml'
*    filetype   = 'BIN'
*  IMPORTING
*    filelength = len
*  TABLES
*    data_tab   = xmlbin_tab.
*
*CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
*  EXPORTING
*    input_length = len
*  IMPORTING
*    buffer       = xml_xstr
*  TABLES
*    binary_tab   = xmlbin_tab.
*
*    DATA(test) = ''.

**********************************************************************
*** Klassen
*DATA(lo_class) = NEW z_ob_cl_000(  ).   "Klasseninstanz
*lo_class->is_even( "Methodenaufruf
*    EXPORTING
*    iv_zahl = 8
*    IMPORTING
*    ev_ergebnis = DATA(lv_erg)
*     ).
*
*WRITE lv_erg.
**
*DATA(lo_class2) = NEW z_ob_cl_000_tochter(  ).
*lo_class2->get_quotient( "Methodenaufruf
*EXPORTING
*    iv_divident = 8
*    iv_divisor = 2
*IMPORTING
*   ev_quotient = DATA(lv_result)
*).
*
*WRITE lv_result.

**********************************************************************
*** Konstanten
*WRITE z_ob_cl_000=>gc_even.

**********************************************************************
*** ALV
**Datendeklaration
*DATA: lt_fieldcat TYPE slis_t_fieldcat_alv. "Feldkatalog
*
**Datenselektion
*SELECT
*    *
*    FROM scustom
*    INTO TABLE @DATA(lt_flight_customer).
*
**Build Feldkatalog
*APPEND VALUE #( fieldname = 'ID' seltext_m = 'Kundennummer' col_pos = 2 tabname = 'Flugkunden' ) TO lt_fieldcat.
*
*APPEND VALUE #( fieldname = 'NAME' seltext_m = 'Kundenname' col_pos = 3 ) TO lt_fieldcat.
*
*APPEND VALUE #( fieldname = 'FORM' seltext_m = 'Anrede' col_pos = 0 ) TO lt_fieldcat.
*"col_pos kann zum gruppieren der Spalten verwendet werden, kein Wert = 1
*APPEND VALUE #( fieldname = 'STREET' seltext_m = 'Strasse' outputlen = 1 ) TO lt_fieldcat.
*
*APPEND VALUE #( fieldname = 'POSTBOX' seltext_m = 'Postfach' ) TO lt_fieldcat.
*
*APPEND VALUE #( fieldname = 'CITY' seltext_m = 'Stadt' ) TO lt_fieldcat.
*
*
**Übergabe der Daten und Feldkatalog an den ALV-Funktionsbaustein, um die ALV-Liste anzuzeigen
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*  EXPORTING
*    it_fieldcat   = lt_fieldcat
*  TABLES
*    t_outtab      = lt_flight_customer
*  EXCEPTIONS
*    program_error = 1
*    OTHERS        = 2.
*"Error Handling
*IF sy-subrc <> 0.
*  MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*  WRITE |{ sy-msgv1 } { sy-msgv2 } { sy-msgv3 } { sy-msgv4 }|.
*ENDIF.


**********************************************************************
*** Debuggen
*DATA(lv_test) = '|Test'.
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.


**********************************************************************
*** Tabelle
*DATA: ls_test TYPE zob_members_000.
*ls_test-id = 1.
*ls_test-Lastname = 'Hubert'.
*ls_test-Firstname = 'Hans'.
*INSERT zob_members_000 FROM ls_test .

**********************************************************************
*** SQL
*SELECT
*    FROM
*    sbook
*    FIELDS
*        *
*    WHERE passname = 'Christa Delon'
*    INTO TABLE @DATA(lt_sbook).
*
*cl_demo_output=>display( lt_sbook ).
*
*SELECT SINGLE
*    FROM
*    sbook
*    FIELDS
*        *
*    WHERE passname = 'Christa Delon'
*    INTO @DATA(ls_sbook).
*
*Cl_demo_output=>display( ls_sbook ).

*SELECT
*    FROM sbook
*    LEFT OUTER JOIN scustom
*        ON scustom~id = sbook~customid
*        FIELDS
*                  sbook~carrid,
*                  sbook~connid,
*                  sbook~fldate,
*                  sbook~bookid,
*                  sbook~customid,
*                  sbook~custtype,
*                  sbook~smoker,
*                  sbook~invoice,
*                  sbook~loccurkey,
*                  sbook~order_date,
*                  sbook~counter,
*                  sbook~agencynum,
*                  sbook~cancelled,
*                  sbook~reserved,
*                  scustom~name AS passname,
*                  scustom~form AS passform
*    INTO TABLE @DATA(lt_join_specific).
*
*Cl_demo_output=>display( lt_join_specific ).

*DATA(ls_for_insert) = VALUE scustom(
*    id = 5001
*    name = 'Hans Harburg'
*    form = 'Frau'
*    street = 'Hululuweg 2'
*    postbox = '12345'
*    postcode = '1231'
*    city = 'Hunnenstätte'
*    ).

*INSERT scustom FROM ls_for_insert.

*UPDATE scustom SET
*    telephone = '1321546'
*    custtype = ''
*    discount = ''
*    langu = 'DE'
*    email = ''
*    webuser = ''
*    WHERE id = 5001.

*DELETE FROM scustom WHERE id = 5000.
*DELETE FROM scustom WHERE name = 'Hans Harburg'.
*
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE: 'Das hat nicht geklappt.'.
*ENDIF.

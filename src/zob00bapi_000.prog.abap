*****           Implementation of object type ZOB00_000            *****
INCLUDE <object>.
BEGIN_DATA OBJECT. " Do not change.. DATA is generated
* only private members may be inserted into structure private
DATA:
" begin of private,
"   to declare private attributes remove comments and
"   insert private attributes here ...
" end of private,
      KEY LIKE SWOTOBJID-OBJKEY.
END_DATA OBJECT. " Do not change.. DATA is generated

BEGIN_METHOD ZBAPIAIRLINE000 CHANGING CONTAINER.
DATA:
      ID TYPE ZBAPI_OB00_AIRLINE_000-CARRID,
      RETURN LIKE BAPIRET2,
      ITEMTAB LIKE ZBAPI_OB00_AIRLINE_000 OCCURS 0.
  SWC_GET_ELEMENT CONTAINER 'Id' ID.
  SWC_GET_TABLE CONTAINER 'Itemtab' ITEMTAB.
  CALL FUNCTION 'ZBAPI_OB00_AIRLINE_000'
    EXPORTING
      ID = ID
    IMPORTING
      RETURN = RETURN
    TABLES
      ITEMTAB = ITEMTAB
    EXCEPTIONS
      OTHERS = 01.
  CASE SY-SUBRC.
    WHEN 0.            " OK
    WHEN OTHERS.       " to be implemented
  ENDCASE.
  SWC_SET_ELEMENT CONTAINER 'Return' RETURN.
  SWC_SET_TABLE CONTAINER 'Itemtab' ITEMTAB.
END_METHOD.

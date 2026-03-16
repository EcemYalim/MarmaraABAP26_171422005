CLASS zcl_171422005_global_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

"F5 ile source, F6 ile jump through"

CLASS zcl_171422005_global_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA status TYPE int4.
    DATA flight_date TYPE d.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " 1-)
    TRY.
        connection = NEW #( i_carrier_id = 'IH'
                            i_connection_id = '0400'
                            i_status = 0
                            i_flight_date = '11221963' ).

        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method Call Failed' ).
   ENDTRY.

   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

   " 2-)
    TRY.
        connection = NEW #( i_carrier_id = 'AA'
                            i_connection_id = '0017'
                            i_status = 0
                            i_flight_date = '11221963' ).

        APPEND connection TO connections.
      CATCH cx_ABAP_INVALID_VALUE.
        out->write( 'Method Call Failed' ).
   ENDTRY.


    ..........................................
    LOOP AT connections INTO connection.
        connection->get_attributes(
        IMPORTING
            e_carrier_id = carrier_id
            e_connection_id = connection_id
            e_status = status
            e_flight_date = flight_date ).

        out->write( |Flight Connection { carrier_id } { connection_id } { status } { flight_date }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.

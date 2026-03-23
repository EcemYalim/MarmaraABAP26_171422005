CLASS zcl_171422005_work_with_intbl3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_171422005_work_with_intbl3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   TYPES: BEGIN OF ty_employee,
           pernr TYPE i, "Personnel number key
           ad    TYPE string,
           soyad TYPE string,
           yas   TYPE i,
           kayit_tarihi TYPE d,
       END OF ty_employee.

   TYPES: tt_standard TYPE STANDARD TABLE OF ty_employee WITH NON-UNIQUE KEY pernr,
          tt_sorted   TYPE SORTED TABLE OF ty_employee WITH UNIQUE KEY pernr,
          tt_hashed   TYPE HASHED TABLE OF ty_employee WITH UNIQUE KEY pernr.

   DATA: lt_standard TYPE tt_standard,
         lt_sorted TYPE tt_sorted,
         lt_hashed TYPE tt_hashed.

   DATA: ls_employee TYPE ty_employee.

   ls_employee-pernr = 1001.
   ls_employee-ad = 'Ali'.
   ls_employee-soyad = 'Yilmaz'.
   ls_employee-yas = 28.
   ls_employee-kayit_tarihi = '20230115'.
   APPEND ls_employee TO lt_standard.
   INSERT ls_employee INTO TABLE lt_sorted.
   INSERT ls_employee INTO TABLE lt_hashed.
   CLEAR ls_employee.

   "
   ls_employee-pernr = 1002.
   ls_employee-ad = 'Mert'.
   ls_employee-soyad = 'Çoban'.
   ls_employee-yas = 23.
   ls_employee-kayit_tarihi = '2023012'.
   APPEND ls_employee TO lt_standard.
   INSERT ls_employee INTO TABLE lt_sorted.
   INSERT ls_employee INTO TABLE lt_hashed.
   CLEAR ls_employee.

   "
   ls_employee-pernr = 1003.
   ls_employee-ad = 'Merve'.
   ls_employee-soyad = 'Kartal'.
   ls_employee-yas = 32.
   ls_employee-kayit_tarihi = '20130115'.
   APPEND ls_employee TO lt_standard.
   INSERT ls_employee INTO TABLE lt_sorted.
   INSERT ls_employee INTO TABLE lt_hashed.
   CLEAR ls_employee.

   "
   ls_employee-pernr = 1004.
   ls_employee-ad = 'Bahadır'.
   ls_employee-soyad = 'Yilmaz'.
   ls_employee-yas = 37.
   ls_employee-kayit_tarihi = '20240118'.
   APPEND ls_employee TO lt_standard.
   INSERT ls_employee INTO TABLE lt_sorted.
   INSERT ls_employee INTO TABLE lt_hashed.
   CLEAR ls_employee.

   "
   ls_employee-pernr = 1005.
   ls_employee-ad = 'Selami'.
   ls_employee-soyad = 'Şahin'.
   ls_employee-yas = 79.
   ls_employee-kayit_tarihi = '20230515'.
   APPEND ls_employee TO lt_standard.
   INSERT ls_employee INTO TABLE lt_sorted.
   INSERT ls_employee INTO TABLE lt_hashed.
   CLEAR ls_employee.

   "
   ls_employee-pernr = 1006.
   ls_employee-ad = 'Garip'.
   ls_employee-soyad = 'Yılmış'.
   ls_employee-yas = 28.
   ls_employee-kayit_tarihi = '20230327'.
   APPEND ls_employee TO lt_standard.
   INSERT ls_employee INTO TABLE lt_sorted.
   INSERT ls_employee INTO TABLE lt_hashed.
   CLEAR ls_employee.

   " 1) LİNEAR SEARCH
   READ TABLE lt_standard INTO ls_employee WITH KEY pernr = 1003.
   IF sy-subrc = 0.
        out->write( |Employee found: { ls_employee-pernr }|
        && | { ls_employee-ad } { ls_employee-soyad }| ).

   ENDIF.
   CLEAR ls_employee.

   " 2) SORT STANDARD
   SORT lt_standard BY ad.
   READ TABLE lt_standard INTO ls_employee WITH KEY ad = 'Garip' BINARY SEARCH.
   IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
    && | { ls_employee-ad } { ls_employee-soyad }| ).

   ENDIF.
   CLEAR ls_employee.

   " 3) SEARCH ON SORTED, AUTOMATIC BINARY
   READ TABLE lt_sorted INTO ls_employee WITH TABLE KEY pernr = 1002.
    IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
    && | { ls_employee-ad } { ls_employee-soyad }| ).

    ENDIF.
    CLEAR ls_employee.

   " 4) SEARCH HASHED TABLE
   READ TABLE lt_hashed INTO ls_employee WITH TABLE KEY pernr = 1004.
    IF sy-subrc = 0.
    out->write( |Employee found: { ls_employee-pernr }|
    && | { ls_employee-ad } { ls_employee-soyad }| ).

    ENDIF.
    CLEAR ls_employee.

  ENDMETHOD.
ENDCLASS.

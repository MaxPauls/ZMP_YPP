*&---------------------------------------------------------------------*
*& Report  ZMP_TESTFILES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

INCLUDE zmp_testfiles_top                       .    " global Data

TYPES BEGIN OF ty_type.
TYPES comp1 TYPE bkpf-bukrs.
TYPES comp2 TYPE bkpf-budat.
TYPES END OF ty_type.


DATA gv_filename TYPE string.
DATA gv_path TYPE string.
DATA gv_fullpath TYPE string.
DATA gv_useraction TYPE i.
DATA gt_data TYPE STANDARD TABLE OF ty_type.
DATA gs_data TYPE ty_type.
DATA gt_data_csv TYPE STANDARD TABLE OF string.
DATA gv_data_out TYPE string.
DATA gv_data_str TYPE string.
FIELD-SYMBOLS: <fs_tab>, <fs_struct>, <ls_data>.

* Add some data to the table
SELECT bukrs budat FROM bkpf
  INTO TABLE gt_data.


*CALL FUNCTION 'SAP_CONVERT_TO_CSV_FORMAT'
*  EXPORTING
*    i_field_seperator    = '|'
**   I_LINE_HEADER        =
**   I_FILENAME           =
**   I_APPL_KEEP          = ' '
*  TABLES
*    i_tab_sap_data       = gt_data
*  CHANGING
*    i_tab_converted_data = gt_data_csv
*  EXCEPTIONS
**   CONVERSION_FAILED    = 1
*    OTHERS               = 2.
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.

LOOP AT gt_data INTO gs_data.

  CLEAR gv_data_out.
  DO.
    ASSIGN COMPONENT sy-index OF STRUCTURE gs_data TO <fs_tab>.
    IF sy-subrc <> 0.
      EXIT.
    ENDIF.
    IF sy-index = 1.
      gv_data_out = <fs_tab>.
    ELSE.
      gv_data_str = <fs_tab>.
      CONDENSE gv_data_str.    "use string , it will work for all data type
      CONCATENATE gv_data_out gv_data_str INTO gv_data_out SEPARATED BY '|'.    "separator will be as per given
    ENDIF.
  ENDDO.

  APPEND gv_data_out TO gt_data_csv.

  CLEAR : gs_data, gv_data_str.
ENDLOOP.

* Show the file download dialog
CALL METHOD cl_gui_frontend_services=>file_save_dialog
  EXPORTING
    default_file_name    = 'extraction'
    default_extension    = 'csv'
    file_filter = 'CSV Files(*.csv)|*.csv|All Files(*.*)|*.*|Text files(*.txt)|*.txt|PDF(*.pdf)|*.pdf'
  CHANGING
    filename             = gv_filename
    path                 = gv_path
    fullpath             = gv_fullpath
    user_action          = gv_useraction
  EXCEPTIONS
    cntl_error           = 1
    error_no_gui         = 2
    not_supported_by_gui = 3
    OTHERS               = 4.

* Check if the user clicked OK
IF gv_useraction <> 0.
  EXIT.
ENDIF.


CALL METHOD cl_gui_frontend_services=>gui_download(
  EXPORTING
*   bin_filesize              =     " Dateilänge bei Binärdateien
    filename = gv_filename    " Name der Datei
  CHANGING
    data_tab = gt_data_csv  " Übergabetabelle
               ).
IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
ENDIF.

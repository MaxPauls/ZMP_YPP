report zmp_formular.

*data: gv_name type rs38l_fnam,
*      gt_positionen type table of lips,
*      gs_likp type likp,
*      gv_adrnr type kna1-adrnr.

*select vbeln posnr arktx lfimg meins from lips into corresponding fields of table gt_positionen where vbeln = '0080015322'.
*select single * from likp into corresponding fields of gs_likp where vbeln = '0080015322'.
*select single adrnr from kna1 into gv_adrnr where kunnr = gs_likp-kunnr.
*
*call function 'SSF_FUNCTION_MODULE_NAME'
*  exporting
*    formname = 'ZMP_FORMULAR'
*  importing
*    fm_name  = gv_name.
*
*call function gv_name
*  exporting
*    it_positionen = gt_positionen
*    ls_kopfdaten  = gs_likp
*    iv_adrnr = gv_adrnr.

data gv_formname type funcname.
data gv_name type funcname.
data gs_outputparams type sfpoutputparams.
data gt_positionen type table of lips.
data gs_likp type likp.


select vbeln posnr arktx lfimg meins from lips into corresponding fields of table gt_positionen where vbeln = '0080015322'.
select single * from likp into corresponding fields of gs_likp where vbeln = '0080015322'.

call function 'FP_FUNCTION_MODULE_NAME'
  exporting
    i_name = 'ZMP_AIF_UEBUNG_LIEF'
  importing
    e_funcname  = gv_name.

call function 'FP_JOB_OPEN'
  changing
    ie_outputparams       = gs_outputparams.
* EXCEPTIONS
*   CANCEL                = 1
*   USAGE_ERROR           = 2
*   SYSTEM_ERROR          = 3
*   INTERNAL_ERROR        = 4
*   OTHERS                = 5


call function gv_name
  exporting
        gs_likp  = gs_likp
        gt_lips  = gt_positionen.

call function 'FP_JOB_CLOSE'.
* IMPORTING
*   E_RESULT             =
* EXCEPTIONS
*   USAGE_ERROR          = 1
*   SYSTEM_ERROR         = 2
*   INTERNAL_ERROR       = 3
*   OTHERS               = 4.

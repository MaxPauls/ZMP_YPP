*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 10.01.2019 at 08:00:08 by user PAULS
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZMP_PV_PARTNER..................................*
TABLES: ZMP_PV_PARTNER, *ZMP_PV_PARTNER. "view work areas
CONTROLS: TCTRL_ZMP_PV_PARTNER
TYPE TABLEVIEW USING SCREEN '0100'.
DATA: BEGIN OF STATUS_ZMP_PV_PARTNER. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZMP_PV_PARTNER.
* Table for entries selected to show on screen
DATA: BEGIN OF ZMP_PV_PARTNER_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZMP_PV_PARTNER.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZMP_PV_PARTNER_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZMP_PV_PARTNER_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZMP_PV_PARTNER.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZMP_PV_PARTNER_TOTAL.

*.........table declarations:.................................*
TABLES: SBUSPART                       .
TABLES: STRAVELAG                      .

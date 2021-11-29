*&---------------------------------------------------------------------*
*& Include ZMP_PROSPEKTPFLEGE_TOP                            Modulpool        ZMP_PROSPEKTPFLEGE
*&
*&---------------------------------------------------------------------*

PROGRAM zmp_prospektpflege MESSAGE-ID ZMP_PROSPEKTMESSAGE.

TABLES: zmp_t_prosp,
  zmp_t_angebot.

DATA: gv_okcode TYPE sy-ucomm,
      gv_prosp type zmp_t_prosp,
      gv_angebot type zmp_t_angebot.

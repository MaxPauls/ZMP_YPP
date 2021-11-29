class ZCX_ZMP_EXCEPTION definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  interfaces IF_T100_MESSAGE .

  constants:
    begin of ZCX_ZMP_EXCEPTION,
      msgid type symsgid value 'ZMP_MSG',
      msgno type symsgno value '000',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ZCX_ZMP_EXCEPTION .
  constants:
    begin of NO_CONNECTION,
      msgid type symsgid value 'ZMP_MSG',
      msgno type symsgno value '001',
      attr1 type scx_attrname value 'MV_CARRID',
      attr2 type scx_attrname value 'MV_CONNID',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NO_CONNECTION .
  data MV_CARRID type S_CARR_ID .
  data MV_CONNID type S_CONN_ID .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !MV_CARRID type S_CARR_ID optional
      !MV_CONNID type S_CONN_ID optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_ZMP_EXCEPTION IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->MV_CARRID = MV_CARRID .
me->MV_CONNID = MV_CONNID .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = ZCX_ZMP_EXCEPTION .
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.

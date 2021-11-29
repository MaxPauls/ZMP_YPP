*&---------------------------------------------------------------------*
*& Report  ZMP_SO_WRITE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_SO_WRITE.

DATA ref type REF TO zmp_area.
DATA root type REF TO zmp_root.
DATA cataloge type REF TO ZMP_CATALOGUE.

ref = zmp_area=>attach_for_write( ).

create OBJECT root AREA HANDLE ref.
create OBJECT cataloge AREA HANDLE ref.

root->catalogue = cataloge.

ref->set_root( root = root ).

SELECT * from spfli into TABLE cataloge->connections.

ref->detach_commit( ).

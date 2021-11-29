*&---------------------------------------------------------------------*
*& Report  ZMP_DUMPS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_DUMPS.

types: begin of gs_y_dumps,
         uname  type sy-uname,
         anzahl type i,
       end of gs_y_dumps.

data gs_dumps type gs_y_dumps.
data gt_dumps type table of gs_y_dumps.

parameters: p_von type sy-datum default sy-datum,
            p_bis type sy-datum default sy-datum.

select uname count( distinct uzeit ) as anzahl
 from snap_beg
 into table gt_dumps
 where datum ge p_von and datum le p_bis
 group by uname
 order by anzahl descending.

loop at gt_dumps into gs_dumps.
  write: / gs_dumps-uname, gs_dumps-anzahl.
endloop.

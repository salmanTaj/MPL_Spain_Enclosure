/PROG  PNS0000
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 409;
CREATE		= DATE 12-09-19  TIME 01:27:26;
MODIFIED	= DATE 18-01-24  TIME 09:03:52;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 13;
MEMORY_SIZE	= 737;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 7;
DEFAULT_GROUP	= *,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC : TRUE ; 
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:   ;
   2:  !set imstp off, BL sets ON ;
   3:  DO[85]=OFF ;
   4:  DO[86]=ON ;
   5:  DO[89]=ON ;
   6:  R[162]=0    ;
   7:  OVERRIDE=100% ;
   8:  R[241]=0    ;
   9:  R[431]=0    ;
  10:  R[432]=0    ;
  11:  R[433]=0    ;
  12:   ;
  13:  RUN START ;
/POS
/END

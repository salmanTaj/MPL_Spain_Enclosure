/PROG  ARCSET03
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 411;
CREATE		= DATE 17-07-05  TIME 03:11:56;
MODIFIED	= DATE 17-07-05  TIME 03:11:56;
FILE_NAME	= ARCSET13;
VERSION		= 0;
LINE_COUNT	= 5;
MEMORY_SIZE	= 763;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,1,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC : TRUE ; 
  ARC Welding Equipment : 1,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:   ;
   2:  !ARC ;
   3:  Weld End E1[1,R[111]] ;
   4:   ;
   5:  Weld Start E2[1,R[112],E0] ;
/POS
/END

/PROG  PB_MOVEALL
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 299;
CREATE		= DATE 17-07-05  TIME 05:45:48;
MODIFIED	= DATE 18-10-11  TIME 14:53:30;
FILE_NAME	= PB_JUMP1;
VERSION		= 0;
LINE_COUNT	= 4;
MEMORY_SIZE	= 655;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,1,1,*,*;
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
   1:  UFRAME_NUM=R[96] ;
   2:  UTOOL_NUM[GP1,3]=1 ;
   3:   ;
   4:L PR[14] 50mm/sec FINE    ;
/POS
/END
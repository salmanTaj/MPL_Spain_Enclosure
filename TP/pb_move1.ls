/PROG  PB_MOVE1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 413;
CREATE		= DATE 17-07-05  TIME 05:45:48;
MODIFIED	= DATE 18-03-19  TIME 19:41:06;
FILE_NAME	= PB_JUMP1;
VERSION		= 0;
LINE_COUNT	= 8;
MEMORY_SIZE	= 885;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
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
   1:  UFRAME_NUM=1 ;
   2:  !skip if R1 or R3 needs to unfold ;
   3:  SKIP CONDITION R[158]=1 OR R[159]=(-1) OR R[113]=0    ;
   4:   ;
   5:  PR[14]=JPOS    ;
   6:  PR[14,7]=PR[11,7]    ;
   7:L PR[14] R[126]cm/min FINE Skip,LBL[1]    ;
   8:  LBL[1] ;
/POS
/END

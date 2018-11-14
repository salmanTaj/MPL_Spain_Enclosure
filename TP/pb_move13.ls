/PROG  PB_MOVE13
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 473;
CREATE		= DATE 17-12-12  TIME 10:46:10;
MODIFIED	= DATE 18-01-30  TIME 22:55:52;
FILE_NAME	= PB_MOVE2;
VERSION		= 0;
LINE_COUNT	= 12;
MEMORY_SIZE	= 929;
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
   1:  UFRAME_NUM=1 ;
   2:  !skip if R1 or R3 needs to unfold ;
   3:  SKIP CONDITION R[158]=1 OR R[159]=1    ;
   4:  PR[14]=JPOS    ;
   5:  PR[14,7]=PR[11,7]    ;
   6:L PR[14] 100mm/sec FINE Skip,LBL[1]    ;
   7:  JMP LBL[999] ;
   8:   ;
   9:  LBL[1] ;
  10:  !robot reach end ;
  11:  R[71]=999    ;
  12:  LBL[999] ;
/POS
/END

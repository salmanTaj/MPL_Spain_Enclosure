/PROG  PB_MOVE2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 615;
CREATE		= DATE 17-07-05  TIME 05:45:48;
MODIFIED	= DATE 18-10-17  TIME 10:42:38;
FILE_NAME	= PB_JUMP1;
VERSION		= 0;
LINE_COUNT	= 20;
MEMORY_SIZE	= 1039;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,1,*,*,*;
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
   2:  !if main welding task ;
   3:  IF (R[221]=18 AND R[70]<>15) THEN ;
   4:  !skip if R1 or R3 needs to unfold ;
   5:  SKIP CONDITION R[158]=1 OR R[159]=1    ;
   6:L PR[11] 100mm/sec FINE Skip,LBL[1]    ;
   7:  JMP LBL[999] ;
   8:   ;
   9:  ELSE ;
  10:L PR[11] 100mm/sec FINE    ;
  11:  JMP LBL[999] ;
  12:  ENDIF ;
  13:   ;
  14:  LBL[1] ;
  15:  !robot reach end ;
  16:  IF (R[70]<>15 AND R[71]<>0) THEN ;
  17:  R[71]=999    ;
  18:  ENDIF ;
  19:   ;
  20:  LBL[999] ;
/POS
/END

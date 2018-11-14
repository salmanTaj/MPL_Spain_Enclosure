/PROG  SCAN_OHA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 629;
CREATE		= DATE 17-06-07  TIME 08:56:06;
MODIFIED	= DATE 17-12-11  TIME 16:24:00;
FILE_NAME	= SCANNING;
VERSION		= 0;
LINE_COUNT	= 19;
MEMORY_SIZE	= 1089;
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
   1:  LBL[1] ;
   2:  DO[130]=ON ;
   3:  PR[1]=LPOS    ;
   4:  PR[1,1]=1    ;
   5:  PR[2]=LPOS    ;
   6:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
   7:  PR[2,1]=R[134]    ;
   8:   ;
   9:  IF (R[321]=1) THEN ;
  10:  SKIP CONDITION R[321]<>1    ;
  11:L PR[2] 25mm/sec FINE Skip,LBL[1]    ;
  12:  ENDIF ;
  13:   ;
  14:  IF (R[321]=(-1)) THEN ;
  15:  SKIP CONDITION R[321]<>(-1)    ;
  16:L PR[1] 25mm/sec FINE Skip,LBL[1]    ;
  17:  ENDIF ;
  18:   ;
  19:  JMP LBL[1] ;
/POS
/END

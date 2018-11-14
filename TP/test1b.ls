/PROG  TEST1B
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 931;
CREATE		= DATE 17-04-20  TIME 14:05:12;
MODIFIED	= DATE 17-04-25  TIME 10:07:44;
FILE_NAME	= TEST3;
VERSION		= 0;
LINE_COUNT	= 36;
MEMORY_SIZE	= 1427;
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
   1:  PR[5]=LPOS    ;
   2:  //PR[5,1]=PR[5,1]+3    ;
   3:  PR[1]=LPOS    ;
   4:  IF (R[81]=1) THEN ;
   5:  PR[5,1]=PR[5,1]+25    ;
   6:  ENDIF ;
   7:  IF (R[81]=2) THEN ;
   8:  PR[5,2]=PR[5,2]+25    ;
   9:  PR[5,7]=PR[5,7]+25    ;
  10:  ENDIF ;
  11:   ;
  12:  //R[113]=2    ;
  13:  //R[114]=0    ;
  14:  //CALL WEA1    ;
  15:  Weave Sine[1] ;
  16:  Track TAST[1] ;
  17:L PR[5] R[126]cm/min CNT100    ;
  18:  R[75]=R[75]+1    ;
  19:   ;
  20:  SKIP CONDITION R[75]=4    ;
  21:   ;
  22:  PR[6]=LPOS    ;
  23:  IF (R[81]=1) THEN ;
  24:  PR[6,1]=PR[6,1]+25    ;
  25:  ENDIF ;
  26:  IF (R[81]=2) THEN ;
  27:  PR[6,2]=PR[6,2]+50    ;
  28:  PR[6,7]=PR[6,7]+50    ;
  29:  ENDIF ;
  30:   ;
  31:L PR[6] R[126]cm/min CNT100 Skip,LBL[1]    ;
  32:   ;
  33:  LBL[1] ;
  34:  Weave End ;
  35:  R[75]=R[75]+1    ;
  36:   ;
/POS
/END

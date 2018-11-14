/PROG  TESTSTART1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 939;
CREATE		= DATE 17-04-25  TIME 14:21:16;
MODIFIED	= DATE 17-04-27  TIME 10:12:00;
FILE_NAME	= START1;
VERSION		= 0;
LINE_COUNT	= 37;
MEMORY_SIZE	= 1431;
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
   1:  R[13]=7    ;
   2:   ;
   3:  R[113]=2    ;
   4:  R[114]=0    ;
   5:  //CALL WEA1    ;
   6:  Weave Sine[1] ;
   7:  Track TAST[1] ;
   8:   ;
   9:  PR[1]=LPOS    ;
  10:  PR[1,1]=PR[1,1]    ;
  11:  IF (R[81]=1) THEN ;
  12:  PR[1,1]=PR[1,1]+25    ;
  13:  ENDIF ;
  14:  IF (R[81]=2) THEN ;
  15:  PR[1,2]=PR[1,2]+25    ;
  16:  PR[1,7]=PR[1,7]+25    ;
  17:  ENDIF ;
  18:   ;
  19:L PR[1] R[126]cm/min CNT100    ;
  20:  R[75]=R[75]+1    ;
  21:   ;
  22:  SKIP CONDITION R[75]=4    ;
  23:   ;
  24:  PR[2]=LPOS    ;
  25:  IF (R[81]=1) THEN ;
  26:  PR[2,1]=PR[2,1]+25    ;
  27:  ENDIF ;
  28:  IF (R[81]=2) THEN ;
  29:  PR[2,2]=PR[2,2]+50    ;
  30:  PR[2,7]=PR[2,7]+50    ;
  31:  ENDIF ;
  32:L PR[2] R[126]cm/min CNT100 Skip,LBL[1]    ;
  33:   ;
  34:  LBL[1] ;
  35:  Weave End ;
  36:  R[75]=R[75]+1    ;
  37:   ;
/POS
/END

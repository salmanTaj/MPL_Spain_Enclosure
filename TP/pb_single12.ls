/PROG  PB_SINGLE12
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1043;
CREATE		= DATE 17-06-09  TIME 15:00:26;
MODIFIED	= DATE 18-10-19  TIME 08:50:12;
FILE_NAME	= START1;
VERSION		= 0;
LINE_COUNT	= 40;
MEMORY_SIZE	= 1515;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,1,*,*,*;
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
   2:  Weave Sine[1] ;
   3:  Track TAST[R[21]] ;
   4:   ;
   5:   ;
   6:  !skip if R1 needs to fold or R3 t ;
   7:  SKIP CONDITION R[158]=(-1) OR R[159]=1    ;
   8:   ;
   9:  !checking if speed up is needed ;
  10:  !-------------------------------- ;
  11:  ! if profile in X direction ;
  12:  !-------------------------------- ;
  13:  IF (R[81]=1) THEN ;
  14:  PR[120]=LPOS    ;
  15:  R[134]=((-150)*R[82]-PR[GP1:120,1]) ;
  16:   ;
  17:  !Correction arm position ;
  18:  PR[12]=LPOS    ;
  19:  PR[GP2:12,1]=(PR[GP2:12,1]+150*R[82]) ;
  20:   ;
  21:  PR[GP1:12,1]=(-150)*R[82]    ;
  22:  PR[GP2:12,1]=PR[GP2:12,1]-R[134]    ;
  23:   ;
  24:L PR[12] R[126]cm/min CNT100 Skip,LBL[2] COORD    ;
  25:  JMP LBL[999] ;
  26:  ENDIF ;
  27:  LBL[2] ;
  28:   ;
  29:L PR[11] R[126]cm/min CNT100 Skip,LBL[1] COORD    ;
  30:   ;
  31:  ! skip weld off ;
  32:  JMP LBL[999] ;
  33:   ;
  34:  LBL[1] ;
  35:  !Weld off ;
  36:  Weave End[3] ;
  37:  Track End ;
  38:  R[113]=0    ;
  39:   ;
  40:  LBL[999] ;
/POS
/END

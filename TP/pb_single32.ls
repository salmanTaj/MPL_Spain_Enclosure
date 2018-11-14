/PROG  PB_SINGLE32
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1035;
CREATE		= DATE 17-06-09  TIME 15:00:26;
MODIFIED	= DATE 18-10-19  TIME 08:50:26;
FILE_NAME	= START1;
VERSION		= 0;
LINE_COUNT	= 39;
MEMORY_SIZE	= 1511;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,1,1,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC : TRUE ; 
  ARC Welding Equipment : *,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  UFRAME_NUM=1 ;
   2:  Weave Sine[3] ;
   3:  Track TAST[R[23]] ;
   4:   ;
   5:  !skip if R3 needs to fold or R1 t ;
   6:  SKIP CONDITION R[158]=1 OR R[159]=(-1)    ;
   7:   ;
   8:  !checking if speed up is needed ;
   9:  !-------------------------------- ;
  10:  ! if profile in X direction ;
  11:  !-------------------------------- ;
  12:  IF (R[81]=1) THEN ;
  13:  PR[120]=LPOS    ;
  14:  R[137]=((-150)*R[82]-PR[GP3:120,1]) ;
  15:   ;
  16:  !Correction arm position ;
  17:  PR[12]=LPOS    ;
  18:  PR[GP2:12,1]=(PR[GP2:12,1]+150*R[82]) ;
  19:   ;
  20:  PR[GP3:12,1]=(-150)*R[82]    ;
  21:  PR[GP2:12,1]=PR[GP2:12,1]-R[137]    ;
  22:   ;
  23:L PR[12] R[127]cm/min CNT100 Skip,LBL[2] COORD    ;
  24:  JMP LBL[999] ;
  25:  ENDIF ;
  26:  LBL[2] ;
  27:   ;
  28:L PR[11] R[127]cm/min CNT100 Skip,LBL[1] COORD    ;
  29:   ;
  30:  ! skip weld off ;
  31:  JMP LBL[999] ;
  32:   ;
  33:  LBL[1] ;
  34:  !Weld off ;
  35:  Weave End[3] ;
  36:  Track End ;
  37:  R[113]=0    ;
  38:   ;
  39:  LBL[999] ;
/POS
/END

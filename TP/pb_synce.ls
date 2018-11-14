/PROG  PB_SYNCE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1305;
CREATE		= DATE 18-10-16  TIME 09:27:34;
MODIFIED	= DATE 18-10-16  TIME 09:29:12;
FILE_NAME	= PB_SYNC;
VERSION		= 0;
LINE_COUNT	= 57;
MEMORY_SIZE	= 1709;
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
   1:  ! Frame value used in jmp ;
   2:  UFRAME_NUM=1 ;
   3:   ;
   4:   ;
   5:  R[163]=1    ;
   6:   ;
   7:  R[164]=1    ;
   8:  !for test ;
   9:   ;
  10:  R[75]=0    ;
  11:  Weld Start E1[1,R[111],E0] ;
  12:  Weld Start E2[1,R[112],E0] ;
  13:   ;
  14:  R[113]=3    ;
  15:   ;
  16:  Weave Sine[1] ;
  17:  Track TAST[R[21]] ;
  18:  Weave Sine[3] ;
  19:  Track TAST[R[23]] ;
  20:   ;
  21:  ! IF WELD CONTINUES ;
  22:  !skip if jump ;
  23:  SKIP CONDITION R[158]<>2 OR R[159]<>2    ;
  24:   ;
  25:L PR[11] R[126]cm/min CNT99 Skip,LBL[100] COORD    ;
  26:   ;
  27:  LBL[2] ;
  28:   ;
  29:  !temp ;
  30:  JMP LBL[101] ;
  31:   ;
  32:  !Stop ARC on R1 ;
  33:  IF (R[158]<>2) THEN ;
  34:  Weave End[1] ;
  35:  Track End ;
  36:  Weld End E1[1,R[111]] ;
  37:  ENDIF ;
  38:   ;
  39:  !Stop ARC on R3 ;
  40:  IF (R[159]<>2) THEN ;
  41:  Weave End[3] ;
  42:  Track End ;
  43:  Weld End E2[1,R[112]] ;
  44:  ENDIF ;
  45:   ;
  46:  JMP LBL[1000] ;
  47:  LBL[100] ;
  48:  R[158]=999    ;
  49:  R[159]=999    ;
  50:  LBL[101] ;
  51:  Weld End E1[1,R[111]] ;
  52:  Weld End E2[1,R[112]] ;
  53:  Weave End ;
  54:  Track End ;
  55:  LBL[1000] ;
  56:  //R[151]=0    ;
  57:  //R[153]=0    ;
/POS
/END

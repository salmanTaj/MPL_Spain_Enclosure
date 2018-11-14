/PROG  PB_SYNC
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2929;
CREATE		= DATE 17-03-14  TIME 13:47:58;
MODIFIED	= DATE 18-10-08  TIME 14:42:20;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 128;
MEMORY_SIZE	= 3441;
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
   4:  !gap detect ;
   5:  IF (R[480]=5),R[480]=(0) ;
   6:   ;
   7:  IF (R[480]=0 AND R[480]<>1234 AND DO[95]=ON) THEN ;
   8:  R[480]=1    ;
   9:  RUN CURCHK ;
  10:  WAIT R[480]=2    ;
  11:  ENDIF ;
  12:   ;
  13:  R[163]=1    ;
  14:   ;
  15:  R[164]=1    ;
  16:  !for test ;
  17:   ;
  18:  R[75]=0    ;
  19:  Weld Start E1[1,R[111],E0] ;
  20:  Weld Start E2[1,R[112],E0] ;
  21:   ;
  22:  R[113]=3    ;
  23:   ;
  24:  Weave Sine[1] ;
  25:  Track TAST[R[21]] ;
  26:  Weave Sine[3] ;
  27:  Track TAST[R[23]] ;
  28:   ;
  29:  !Set angles ;
  30:  //PR[GP1,3:11,4]=PR[GP1,3:21,4]    ;
  31:  //PR[GP1,3:11,5]=PR[GP1,3:21,5]    ;
  32:  //PR[GP1,3:11,6]=PR[GP1,3:21,6]    ;
  33:   ;
  34:  !checking if speed up is needed ;
  35:  !add group ;
  36:  PR[120]=LPOS    ;
  37:  R[134]=0    ;
  38:  IF (R[81]=1) THEN ;
  39:   ;
  40:  !-------------------------------- ;
  41:  ! if profile in X direction ;
  42:  !-------------------------------- ;
  43:  !correction of pr11 ;
  44:  IF (PR[GP1:11,1]<>0) THEN ;
  45:  R[134]=PR[GP1:11,1]    ;
  46:  PR[GP1,3:11,1]=PR[GP1,3:11,1]-R[134]    ;
  47:  PR[GP2:11,1]=PR[GP2:11,1]+R[134]    ;
  48:  ENDIF ;
  49:   ;
  50:  !skip correction if last piece of ;
  51:  IF (R[293]=1),JMP LBL[1] ;
  52:  IF (PR[GP1:120,1]>10),R[134]=PR[GP1:120,1] ;
  53:  IF (PR[GP1:120,1]<(-10)),R[134]=PR[GP1:120,1] ;
  54:   ;
  55:  !Correction arm position ;
  56:  IF (R[134]<>0) THEN ;
  57:  PR[GP1,3:120,1]=PR[GP1,3:120,1]-R[134]    ;
  58:  PR[GP2:120,1]=(PR[GP2:120,1]+R[134]+(500*R[82])) ;
  59:  R[136]=R[94]/10/R[126]*60    ;
  60:   ;
  61:  !skip if jump ;
  62:  SKIP CONDITION R[158]<>2 OR R[159]<>2    ;
  63:   ;
  64:   ;
  65:L PR[120] R[126]cm/min CNT99 Skip,LBL[1] COORD    ;
  66:   ;
  67:  LBL[1] ;
  68:  ENDIF ;
  69:   ;
  70:  ELSE ;
  71:  !-------------------------------- ;
  72:  !if profile in Y direction ;
  73:  !-------------------------------- ;
  74:  !Correct 7 axis position ;
  75:  PR[GP1:11,7]=(PR[GP1:11,2]-(100*R[83])) ;
  76:  PR[GP3:11,7]=(PR[GP3:11,2]-(100*R[83])) ;
  77:  ENDIF ;
  78:   ;
  79:   ;
  80:  ! IF END OR STEP WELD ;
  81:  IF (R[87]=1 OR R[71]=999) THEN ;
  82:   ;
  83:L PR[11] R[126]cm/min FINE COORD    ;
  84:   ;
  85:  Weld End E1[1,R[111]] ;
  86:  Weld End E2[1,R[112]] ;
  87:  Weave End ;
  88:  Track End ;
  89:   ;
  90:  ELSE ;
  91:  ! IF WELD CONTINUES ;
  92:  !skip if jump ;
  93:  SKIP CONDITION R[158]<>2 OR R[159]<>2    ;
  94:   ;
  95:L PR[11] R[126]cm/min CNT99 Skip,LBL[100] COORD    ;
  96:   ;
  97:  LBL[2] ;
  98:  ENDIF ;
  99:   ;
 100:  !temp ;
 101:  JMP LBL[101] ;
 102:   ;
 103:  !Stop ARC on R1 ;
 104:  IF (R[158]<>2) THEN ;
 105:  Weave End[1] ;
 106:  Track End ;
 107:  Weld End E1[1,R[111]] ;
 108:  ENDIF ;
 109:   ;
 110:  !Stop ARC on R3 ;
 111:  IF (R[159]<>2) THEN ;
 112:  Weave End[3] ;
 113:  Track End ;
 114:  Weld End E2[1,R[112]] ;
 115:  ENDIF ;
 116:   ;
 117:  JMP LBL[1000] ;
 118:  LBL[100] ;
 119:  R[158]=999    ;
 120:  R[159]=999    ;
 121:  LBL[101] ;
 122:  Weld End E1[1,R[111]] ;
 123:  Weld End E2[1,R[112]] ;
 124:  Weave End ;
 125:  Track End ;
 126:  LBL[1000] ;
 127:  //R[151]=0    ;
 128:  //R[153]=0    ;
/POS
/END
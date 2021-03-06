/PROG  UNFOLD1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2537;
CREATE		= DATE 17-03-14  TIME 14:13:06;
MODIFIED	= DATE 18-08-15  TIME 12:27:38;
FILE_NAME	= UNFOLD;
VERSION		= 0;
LINE_COUNT	= 116;
MEMORY_SIZE	= 2993;
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
/MN
   1:  JMP LBL[555] ;
   2:  !start here if manual ;
   3:  R[208]=6    ;
   4:  LBL[555] ;
   5:   ;
   6:  R[75]=0    ;
   7:   ;
   8:  TIMER[1]=RESET ;
   9:  TIMER[1]=START ;
  10:   ;
  11:  UFRAME_NUM=1 ;
  12:  UTOOL_NUM=1 ;
  13:  PR[140]=LPOS    ;
  14:   ;
  15:  !************************** ;
  16:  !Points ;
  17:  !************************** ;
  18:  !Unfold point ;
  19:  PR[120]=JPOS    ;
  20:  PR[120,1]=(-90)    ;
  21:  PR[120,2]=(-64)    ;
  22:  PR[120,3]=0    ;
  23:  PR[120,4]=0    ;
  24:  PR[120,5]=70    ;
  25:  PR[120,6]=0    ;
  26:   ;
  27:  PR[130]=JPOS    ;
  28:  IF (R[70]=51 AND R[208]<600 AND R[221]=18 AND PR[130,1]<(-75)),JMP LBL[120] ;
  29:  IF (R[70]=999 AND R[208]<600 AND R[221]=18 AND PR[130,1]<(-75)),JMP LBL[120] ;
  30:  IF (R[208]<>6),PR[120,7]=PR[9,7] ;
  31:  IF (R[70]=51),PR[120,7]=PR[11,7] ;
  32:   ;
  33:   ;
  34:  !Rotate under boom ;
  35:  PR[121]=PR[120]    ;
  36:  PR[121,5]=(-25)    ;
  37:   ;
  38:  !perhaps shift 7. axis ;
  39:  !if too close to start ;
  40:  PR[130]=JPOS    ;
  41:  IF ((PR[130,7])<500) THEN ;
  42:  PR[130,7]=PR[130,7]+750    ;
  43:  ENDIF ;
  44:  !if too close to end ;
  45:  R[134]=$param_group[1].$upperlims[7] ;
  46:   ;
  47:  IF ((R[134]-750)<PR[130,7]) THEN ;
  48:  PR[130,7]=PR[130,7]-750    ;
  49:  ENDIF ;
  50:   ;
  51:  ! 2. axis all way back ;
  52:  PR[122]=PR[121]    ;
  53:  PR[122,7]=PR[130,7]    ;
  54:   ;
  55:  ! 2. axis all way back side boom ;
  56:  PR[123]=PR[122]    ;
  57:  PR[123,1]=(75) ;
  58:  PR[123,2]=((-67)) ;
  59:  PR[123,3]=(0) ;
  60:  PR[123,4]=((90)) ;
  61:  PR[123,7]=PR[130,7]+0    ;
  62:   ;
  63:   ;
  64:  !Pointing down with 2. axis ;
  65:  PR[125]=PR[123]    ;
  66:  PR[125,2]=(0) ;
  67:  PR[125,3]=((-55)) ;
  68:  PR[125,5]=(-25)    ;
  69:  PR[125,7]=PR[130,7]-0    ;
  70:  IF (PR[125,7]<0),PR[125,7]=1 ;
  71:   ;
  72:  !Folded up ;
  73:  PR[127]=PR[125]    ;
  74:  PR[127,1]=(10) ;
  75:  PR[127,2]=90    ;
  76:  PR[127,3]=(-90)    ;
  77:  PR[127,4]=0    ;
  78:  PR[127,5]=29    ;
  79:  PR[127,6]=0    ;
  80:  PR[127,7]=PR[130,7]-0    ;
  81:  IF (PR[127,7]<0),PR[127,7]=1 ;
  82:   ;
  83:   ;
  84:  !************************** ;
  85:  !******** Motion ********* ;
  86:  !************************** ;
  87:  IF (PR[130,1]>(5) AND (PR[130,2]>0)),JMP LBL[125] ;
  88:  IF (PR[130,1]>(5) AND (PR[130,2]>0)),JMP LBL[124] ;
  89:  IF (PR[130,1]<(-45)),JMP LBL[121] ;
  90:   ;
  91:  LBL[125] ;
  92:J PR[127] 100% CNT0    ;
  93:J PR[125] 100% CNT0    ;
  94:   ;
  95:  LBL[123] ;
  96:J PR[123] 100% CNT0    ;
  97:   ;
  98:  LBL[122] ;
  99:J PR[122] 100% CNT0    ;
 100:   ;
 101:  LBL[121] ;
 102:J PR[121] 100% CNT0    ;
 103:  IF (R[70]=15 AND R[208]<600 AND R[221]=18 AND R[291]=3),JMP LBL[999] ;
 104:   ;
 105:  LBL[120] ;
 106:J PR[120] 50% FINE    ;
 107:   ;
 108:   ;
 109:   ;
 110:  LBL[999] ;
 111:  !delay ;
 112:  IF (TIMER[1]<.5) THEN ;
 113:  WAIT    .50(sec) ;
 114:  ENDIF ;
 115:  TIMER[1]=STOP ;
 116:  !IF (R[75]<1),R[75]=(R[75]+1) ;
/POS
/END

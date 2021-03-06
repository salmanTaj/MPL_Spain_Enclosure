/PROG  PB_WEB1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4057;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-09-14  TIME 10:11:30;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 187;
MEMORY_SIZE	= 4485;
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
   1:  JMP LBL[555] ;
   2:  R[151]=0    ;
   3:  LBL[555] ;
   4:  !************************** ;
   5:  !** WELD V/U Robot1 ;
   6:  !************************** ;
   7:   ;
   8:  UFRAME_NUM=2 ;
   9:  UTOOL_NUM=1 ;
  10:  Weave End ;
  11:  Track End ;
  12:   ;
  13:   ;
  14:  !-- ARC PARAM -- ;
  15:  WAIT R[109]=0    ;
  16:  R[13]=6    ;
  17:  R[115]=1    ;
  18:  R[116]=1    ;
  19:  CALL WELD_PA    ;
  20:   ;
  21:  !-- AT RESUME JMP TO LABEL ;
  22:  IF ((R[151]>100)),JMP LBL[R[151]] ;
  23:   ;
  24:   ;
  25:  !**************************** ;
  26:  !**** POSITION CALC & POINTS ;
  27:  !**************************** ;
  28:   ;
  29:  !* FUT 000 OR FUT 00-1 (PR[43-44) ;
  30:   ;
  31:  !***  POSITION CALC START ;
  32:  R[102]=(60+(R[95]*10)) ;
  33:   ;
  34:  !***  CONFIG CALC ;
  35:  R[103]=43    ;
  36:  IF (R[95]=(1)),R[103]=(45) ;
  37:   ;
  38:  CALL PRG_CALC1    ;
  39:   ;
  40:  !Start Angle up point ;
  41:  !-- WELDING  POINT 5 ;
  42:  R[141]=1    ;
  43:  !Depending on Profile type ;
  44:  R[135]=20    ;
  45:  IF (R[252]=2),R[135]=50 ;
  46:  IF (R[257]=1),R[135]=60 ;
  47:  R[142]=R[135]    ;
  48:   ;
  49:  CALL PRG_CALC1    ;
  50:  R[101]=R[102]+11    ;
  51:  PR[5]=PR[R[101]]    ;
  52:  PR[5,1]=PR[5,1]+R[141]    ;
  53:  PR[5,2]=PR[5,2]+R[142]    ;
  54:  PR[5,3]=PR[5,3]+0    ;
  55:  !7 axis ;
  56:  IF (R[258]=1 AND R[81]=2) THEN ;
  57:  PR[5,7]=(PR[5,7]+200*R[83]*R[179]) ;
  58:  ENDIF ;
  59:   ;
  60:  !End Angle up point ;
  61:  !-- WELDING  POINT 6 ;
  62:  R[141]=0    ;
  63:  R[136]=R[135]+100    ;
  64:  IF (R[252]=1),R[136]=R[135]+50 ;
  65:  R[142]=R[136]    ;
  66:   ;
  67:  CALL PRG_CALC1    ;
  68:  R[101]=R[102]+11    ;
  69:  PR[6]=PR[26]+PR[R[101]]    ;
  70:  PR[6,1]=PR[6,1]+R[141]    ;
  71:  PR[6,2]=PR[6,2]+R[142]    ;
  72:  PR[6,7]=PR[6,7]    ;
  73:   ;
  74:  !--  WELDING  POINT 16 ;
  75:  R[141]=6    ;
  76:  R[142]=7    ;
  77:  CALL PRG_CALC1    ;
  78:  R[101]=R[102]+10    ;
  79:  PR[16]=PR[25]+PR[R[101]]    ;
  80:  PR[16,1]=PR[16,1]+R[141]    ;
  81:  PR[16,2]=PR[16,2]+R[142]    ;
  82:  PR[16,3]=PR[16,3]    ;
  83:  PR[16,4]=PR[26,4]    ;
  84:  PR[16,5]=PR[26,5]    ;
  85:  PR[16,6]=PR[26,6]    ;
  86:  ! 7 axis ;
  87:  IF (PR[16,7]>PR[16,2]) THEN ;
  88:  PR[16,7]=(PR[16,2]+(200+PR[16,1]/2)) ;
  89:  ELSE ;
  90:  PR[16,7]=(PR[16,2]-(200+PR[16,1]/2)) ;
  91:  ENDIF ;
  92:   ;
  93:  !resetting angles ;
  94:  R[181]=0    ;
  95:  R[182]=0    ;
  96:  R[183]=0    ;
  97:  CALL PRG_CALC1    ;
  98:  R[258]=R[180]    ;
  99:  !**************************** ;
 100:  ! Call sub programs for Starting ;
 101:  !**************************** ;
 102:   ;
 103:  IF (R[257]=1 OR R[257]=5) THEN ;
 104:  CALL PB_WEMID1    ;
 105:  ENDIF ;
 106:   ;
 107:  IF (R[257]=2 OR R[257]=4) THEN ;
 108:  CALL PB_WEEDGE1    ;
 109:  ENDIF ;
 110:   ;
 111:  !**************************** ;
 112:  ! ***** WELDING ***** ;
 113:  ! ***** Sub points ***** ;
 114:  !**************************** ;
 115:   ;
 116:   ;
 117:  LBL[205] ;
 118:  R[151]=205    ;
 119:  !using current angles ;
 120:  PR[120]=LPOS    ;
 121:  PR[5,4]=PR[120,4]    ;
 122:  PR[5,5]=PR[120,5]    ;
 123:  PR[5,6]=PR[120,6]    ;
 124:  !use different angles for endtyp ;
 125:  IF (R[257]=2 OR R[257]=4) THEN ;
 126:  PR[5,4]=PR[26,4]    ;
 127:  PR[5,5]=PR[26,5]    ;
 128:  PR[5,6]=PR[26,6]    ;
 129:  CALL PRG_CALC1    ;
 130:  ENDIF ;
 131:   ;
 132:  Weave Sine[1] ;
 133:  Track TAST[R[21]] ;
 134:  Weld Start E1[1,R[111],E0] ;
 135:  WAIT    .10(sec) ;
 136:  //R[134]=R[126]*.85    ;
 137:   ;
 138:L PR[5] R[126]cm/min CNT100    ;
 139:   ;
 140:   ;
 141:  LBL[206] ;
 142:  R[151]=206    ;
 143:  !skip PR6 if short end ;
 144:  IF ((R[97]=1) OR (R[97]=4)),JMP LBL[216] ;
 145:   ;
 146:  Weave Sine[1] ;
 147:  Track TAST[R[21]] ;
 148:  Weld Start E1[1,R[111],E0] ;
 149:   ;
 150:L PR[6] R[126]cm/min CNT100    ;
 151:  LBL[216] ;
 152:  R[151]=216    ;
 153:  UFRAME_NUM=1 ;
 154:  Weave Sine[1] ;
 155:  Track TAST[R[21]] ;
 156:  Weld Start E1[1,R[111],E0] ;
 157:   ;
 158:L PR[16] R[126]cm/min FINE    ;
 159:  Weave End[1] ;
 160:  Track End ;
 161:  Weld End E1[1,R[111]] ;
 162:   ;
 163:  UFRAME_NUM=2 ;
 164:  !returning point ;
 165:  !Unfold point ;
 166:  PR[120]=JPOS    ;
 167:  PR[120,1]=(-90)    ;
 168:  PR[120,2]=(-55)    ;
 169:  PR[120,3]=20    ;
 170:  PR[120,4]=0    ;
 171:  PR[120,5]=50    ;
 172:  PR[120,6]=0    ;
 173:   ;
 174:  LBL[217] ;
 175:  R[151]=217    ;
 176:L PR[120] 150mm/sec FINE    ;
 177:   ;
 178:  LBL[999] ;
 179:  //R[151]=0    ;
 180:   ;
 181:  LBL[1000] ;
 182:   ;
 183:  ! Cleaning for China ;
 184:  ! IF (R[495]=21226) THEN ;
 185:  !CALL CLEAN1 ;
 186:  !CALL UNFOLD1 ;
 187:  !ENDIF ;
/POS
/END

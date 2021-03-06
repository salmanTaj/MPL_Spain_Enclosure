/PROG  PB_EDGE1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4721;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-10-25  TIME 16:54:20;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 225;
MEMORY_SIZE	= 5229;
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
   5:  !** Close edge ;
   6:  !************************** ;
   7:   ;
   8:  UFRAME_NUM=2 ;
   9:  UTOOL_NUM=1 ;
  10:  Weave End ;
  11:  Track End ;
  12:   ;
  13:   ;
  14:  !-- AT RESUME JMP TO LABEL ;
  15:  IF ((R[151]>0)),JMP LBL[R[151]] ;
  16:   ;
  17:   ;
  18:  !****************************** ;
  19:  !--   ANGLE CALC  -- ;
  20:  !****************************** ;
  21:  !* FUT 000 OR FUT 00-1 (PR[43-44) ;
  22:   ;
  23:  !***  POSITION CALC START ;
  24:  R[102]=(60+(R[95]*10)) ;
  25:   ;
  26:  !***  CONFIG CALC ;
  27:  R[103]=43    ;
  28:  IF (R[95]=(1)),R[103]=(45) ;
  29:   ;
  30:  CALL PRG_CALC1    ;
  31:   ;
  32:  !**************************** ;
  33:  !**** CLOSE WEB ;
  34:  !**** POSITION CALC & WELDING ;
  35:  !**************************** ;
  36:   ;
  37:   ;
  38:  !-- SAFE START  POINT ;
  39:  !low angle ;
  40:  R[180]=R[258]    ;
  41:  ! if normal angle and rat or no s ;
  42:  IF ((R[258]=0) AND ((R[70]=55) OR (R[257]=0) OR (R[288]=1) OR R[254]=3)) THEN ;
  43:  R[258]=0    ;
  44:  ELSE ;
  45:  R[258]=1    ;
  46:  ENDIF ;
  47:  R[185]=R[258]    ;
  48:   ;
  49:  ! changing angle for Side profile ;
  50:  IF (R[253]=1) THEN ;
  51:  R[182]=(-10)    ;
  52:  ENDIF ;
  53:   ;
  54:  !change angle ;
  55:  IF (((R[254]<>3) AND (R[254]<>7) AND (R[253]=2)) OR (R[495]=21232)) THEN ;
  56:  R[135]=0    ;
  57:  R[181]=5    ;
  58:  R[182]=(-17)    ;
  59:  R[183]=13    ;
  60:  ENDIF ;
  61:   ;
  62:   ;
  63:  R[141]=0    ;
  64:  R[142]=50    ;
  65:  !Mirror if rat hole ;
  66:  IF (R[70]=55),R[141]=R[141]*(-1) ;
  67:  CALL PRG_CALC1    ;
  68:  R[101]=R[102]+2    ;
  69:  PR[35]=PR[21]+PR[R[101]]    ;
  70:  PR[35,1]=PR[35,1]+R[141]    ;
  71:  PR[35,2]=PR[35,2]+R[142]    ;
  72:  PR[35,3]=PR[35,3]+20    ;
  73:  !------- ;
  74:   ;
  75:  !--  WELDING  POINT 1 ;
  76:  !profile thickness ;
  77:  R[141]=3.5    ;
  78:  R[142]=R[14]/2*(-1)    ;
  79:  !Mirror if rat hole ;
  80:  IF (R[70]=55),R[141]=R[141]*(-1) ;
  81:  CALL PRG_CALC1    ;
  82:  R[101]=R[102]+2    ;
  83:  PR[1]=PR[21]+PR[R[101]]    ;
  84:  PR[1,1]=PR[1,1]+R[141]    ;
  85:  PR[1,2]=PR[1,2]+R[142]    ;
  86:  PR[1,3]=PR[1,3]+3    ;
  87:  !------- ;
  88:   ;
  89:  !-- WELDING  POINT 2 ;
  90:  R[141]=4.5    ;
  91:  R[142]=1.3    ;
  92:  !Mirror if rat hole ;
  93:  IF (R[70]=55),R[141]=R[141]*(-1) ;
  94:  CALL PRG_CALC1    ;
  95:  R[101]=R[102]+2    ;
  96:  PR[2]=PR[21]+PR[R[101]]    ;
  97:  PR[2,1]=PR[2,1]+R[141]    ;
  98:  PR[2,2]=PR[2,2]+R[142]    ;
  99:  PR[2,3]=(PR[2,3]+0) ;
 100:  !------- ;
 101:   ;
 102:   ;
 103:  !-- WELDING  POINT 3 ;
 104:   ;
 105:  R[141]=(-5)    ;
 106:  !skip edge ;
 107:  R[136]=0    ;
 108:  IF (R[136]=1),R[141]=((-25)) ;
 109:  //ENDIF ;
 110:  R[142]=(-4)    ;
 111:  !Mirror if rat hole ;
 112:  IF (R[70]=55),R[141]=R[141]*(-1) ;
 113:  CALL PRG_CALC1    ;
 114:  R[101]=R[102]+2    ;
 115:  PR[3]=PR[21]+PR[R[101]]    ;
 116:  PR[3,1]=PR[3,1]+R[141]    ;
 117:  PR[3,2]=PR[3,2]+R[142]    ;
 118:  PR[3,3]=PR[3,3]+0    ;
 119:   ;
 120:  !-- WELDING  POINT 8 ;
 121:  R[141]=(-15)    ;
 122:  R[142]=(-1)    ;
 123:  !Mirror if rat hole ;
 124:  IF (R[70]=55),R[141]=R[141]*(-1) ;
 125:  CALL PRG_CALC1    ;
 126:  R[101]=R[102]+2    ;
 127:  PR[8]=PR[21]+PR[R[101]]    ;
 128:  PR[8,1]=PR[8,1]+R[141]    ;
 129:  PR[8,2]=PR[8,2]+R[142]    ;
 130:   ;
 131:  !resetting angles ;
 132:  IF ((R[254]<>3) AND (R[254]<>7)) THEN ;
 133:  R[181]=0    ;
 134:  R[182]=(-8)    ;
 135:  R[183]=5    ;
 136:  ENDIF ;
 137:  CALL PRG_CALC1    ;
 138:  R[181]=0    ;
 139:  R[182]=0    ;
 140:  R[183]=0    ;
 141:  R[258]=R[180]    ;
 142:  !---------------------------- ;
 143:  ! ***** WELDING ***** ;
 144:   ;
 145:  !-- MOVE TO SAFE START ;
 146:   ;
 147:  !skip edge ;
 148:  IF (R[136]=1) THEN ;
 149:  IF (R[185]=0) THEN ;
 150:L PR[3] 150mm/sec CNT0    ;
 151:  ELSE ;
 152:L PR[3] 5sec CNT0    ;
 153:  ENDIF ;
 154:  JMP LBL[14] ;
 155:  ENDIF ;
 156:   ;
 157:  IF (R[185]=0) THEN ;
 158:L PR[35] 350mm/sec CNT0    ;
 159:  ELSE ;
 160:L PR[35] 5sec CNT0    ;
 161:  ENDIF ;
 162:   ;
 163:  !** -------------------  ** ;
 164:   ;
 165:  !-- MOVE TO WELD START ;
 166:  R[163]=1    ;
 167:   ;
 168:  LBL[11] ;
 169:  R[151]=11    ;
 170:   ;
 171:L PR[1] 150mm/sec FINE    ;
 172:  !Jump back to main program to sta ;
 173:  IF (R[151]<12 AND ((R[221]=18 OR R[221]=22 AND R[81]=1))) THEN ;
 174:  R[151]=12    ;
 175:  JMP LBL[1000] ;
 176:  ENDIF ;
 177:   ;
 178:   ;
 179:  !** -------------------  ** ;
 180:   ;
 181:  LBL[12] ;
 182:  R[151]=12    ;
 183:  IF ((R[221]<>18) AND (R[221]<>22 OR R[81]=2)) THEN ;
 184:  Weld Start E1[1,10,E0] ;
 185:  ENDIF ;
 186:   ;
 187:  GO[3]=10 ;
 188:  WAIT   1.00(sec) ;
 189:   ;
 190:L PR[2] R[126]cm/min FINE    ;
 191:  WAIT    .50(sec) ;
 192:  !---------------------------- ;
 193:   ;
 194:  LBL[13] ;
 195:  R[151]=13    ;
 196:   ;
 197:   ;
 198:  GO[3]=10 ;
 199:   ;
 200:  IF ((R[221]<>18) AND (R[221]<>22 OR R[81]=2)) THEN ;
 201:  Weld Start E1[1,10,E0] ;
 202:  ENDIF ;
 203:   ;
 204:L PR[3] R[126]cm/min FINE    ;
 205:  WAIT   0.00(sec) ;
 206:  GO[3]=R[111] ;
 207:   ;
 208:   ;
 209:  LBL[14] ;
 210:  R[151]=14    ;
 211:   ;
 212:  IF ((R[221]<>18) AND (R[221]<>22 OR R[81]=2)) THEN ;
 213:  Weld Start E1[1,R[111],E0] ;
 214:  ENDIF ;
 215:   ;
 216:  Weave Sine[1] ;
 217:  Track TAST[R[21]] ;
 218:   ;
 219:L PR[8] R[126]cm/min FINE    ;
 220:   ;
 221:  LBL[999] ;
 222:   ;
 223:  //R[151]=0    ;
 224:   ;
 225:  LBL[1000] ;
/POS
/END

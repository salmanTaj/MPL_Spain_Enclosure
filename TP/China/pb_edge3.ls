/PROG  PB_EDGE3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4887;
CREATE		= DATE 17-06-07  TIME 11:03:12;
MODIFIED	= DATE 18-10-25  TIME 15:33:10;
FILE_NAME	= PB_EDGE1;
VERSION		= 0;
LINE_COUNT	= 233;
MEMORY_SIZE	= 5363;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,1,*,*;
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
   1:  JMP LBL[555] ;
   2:  R[153]=0    ;
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
  15:  IF ((R[153]>0)),JMP LBL[R[153]] ;
  16:   ;
  17:   ;
  18:  !Handling Rat hole points ;
  19:  IF (R[70]=55) THEN ;
  20:  R[140]=11    ;
  21:  ELSE ;
  22:  R[140]=2    ;
  23:  ! PR[15]=PR[11] ;
  24:  ENDIF ;
  25:   ;
  26:  !****************************** ;
  27:  !* FUT 000 OR FUT 00-1 (PR[43-44) ;
  28:   ;
  29:  !***  POSITION CALC START ;
  30:  R[105]=(60+(R[95]*10)) ;
  31:   ;
  32:  !***  CONFIG CALC ;
  33:  R[106]=43    ;
  34:  IF (R[95]=(1)),R[106]=(45) ;
  35:   ;
  36:  CALL PRG_CALC3    ;
  37:   ;
  38:  !**************************** ;
  39:  !**** CLOSE WEB ;
  40:  !**** POSITION CALC & WELDING ;
  41:  !**************************** ;
  42:   ;
  43:   ;
  44:  !-- SAFE START  POINT ;
  45:  !low angle ;
  46:  R[190]=R[268]    ;
  47:  ! if normal angle and rat or no s ;
  48:  IF ((R[268]=0) AND ((R[70]=55) OR (R[267]=0) OR (R[288]=1) OR R[264]=3)) THEN ;
  49:  R[268]=0    ;
  50:  ELSE ;
  51:  R[268]=1    ;
  52:  ENDIF ;
  53:  R[195]=R[268]    ;
  54:   ;
  55:  ! changing angle for Side profile ;
  56:  IF (R[263]=1) THEN ;
  57:  R[192]=(-10)    ;
  58:  ENDIF ;
  59:   ;
  60:  !change angle ;
  61:  IF (((R[264]<>3) AND (R[264]<>7) AND (R[263]=2)) OR (R[495]=21232)) THEN ;
  62:  R[138]=0    ;
  63:  R[191]=5    ;
  64:  R[192]=(-17)    ;
  65:  R[193]=13    ;
  66:  ENDIF ;
  67:   ;
  68:   ;
  69:  R[145]=0    ;
  70:  R[146]=50    ;
  71:  !Mirror if rat hole ;
  72:  IF (R[70]=55),R[145]=R[145]*(-1) ;
  73:  CALL PRG_CALC3    ;
  74:  R[104]=R[105]+R[140]    ;
  75:  PR[35]=PR[21]+PR[R[104]]    ;
  76:  PR[35,1]=PR[35,1]+R[145]    ;
  77:  PR[35,2]=PR[35,2]+R[146]    ;
  78:  PR[35,3]=PR[35,3]+20    ;
  79:  !------- ;
  80:   ;
  81:  !--  WELDING  POINT 1 ;
  82:  !profile thickness ;
  83:  R[145]=1.9    ;
  84:  R[146]=R[14]/2*(-1)    ;
  85:  !Mirror if rat hole ;
  86:  IF (R[70]=55),R[145]=R[145]*(-1) ;
  87:  CALL PRG_CALC3    ;
  88:  R[104]=R[105]+R[140]    ;
  89:  PR[1]=PR[21]+PR[R[104]]    ;
  90:  PR[1,1]=PR[1,1]+R[145]    ;
  91:  PR[1,2]=PR[1,2]+R[146]    ;
  92:  PR[1,3]=PR[1,3]+3    ;
  93:  !------- ;
  94:   ;
  95:  !-- WELDING  POINT 2 ;
  96:  R[145]=3.2    ;
  97:  R[146]=1    ;
  98:  !Mirror if rat hole ;
  99:  IF (R[70]=55),R[145]=R[145]*(-1) ;
 100:  CALL PRG_CALC3    ;
 101:  R[104]=R[105]+R[140]    ;
 102:  PR[2]=PR[21]+PR[R[104]]    ;
 103:  PR[2,1]=PR[2,1]+R[145]    ;
 104:  PR[2,2]=PR[2,2]+R[146]    ;
 105:  PR[2,3]=(PR[2,3]-0) ;
 106:  !------- ;
 107:   ;
 108:  !-- WELDING  POINT 3 ;
 109:  R[145]=(-5)    ;
 110:  !skip edge ;
 111:  R[139]=0    ;
 112:  IF (R[139]=1),R[145]=((-25)) ;
 113:  R[146]=(0) ;
 114:  !Mirror if rat hole ;
 115:  IF (R[70]=55),R[145]=R[145]*(-1) ;
 116:  CALL PRG_CALC3    ;
 117:  R[104]=R[105]+R[140]    ;
 118:  PR[3]=PR[21]+PR[R[104]]    ;
 119:  PR[3,1]=PR[3,1]+R[145]    ;
 120:  PR[3,2]=PR[3,2]+R[146]    ;
 121:   ;
 122:  !-- WELDING  POINT 8 ;
 123:  R[145]=(-15)    ;
 124:  R[146]=((-1)) ;
 125:  !Mirror if rat hole ;
 126:  IF (R[70]=55),R[145]=R[145]*(-1) ;
 127:  R[191]=R[191]+0    ;
 128:  CALL PRG_CALC3    ;
 129:  R[104]=R[105]+R[140]    ;
 130:  PR[8]=PR[21]+PR[R[104]]    ;
 131:  PR[8,1]=PR[8,1]+R[145]    ;
 132:  PR[8,2]=PR[8,2]+R[146]    ;
 133:   ;
 134:   ;
 135:  !resetting angles ;
 136:  IF ((R[264]<>3) AND (R[264]<>7)) THEN ;
 137:  R[191]=0    ;
 138:  R[192]=(-8)    ;
 139:  R[193]=5    ;
 140:  ENDIF ;
 141:  CALL PRG_CALC3    ;
 142:  R[191]=0    ;
 143:  R[192]=0    ;
 144:  R[193]=0    ;
 145:  R[268]=R[190]    ;
 146:  !---------------------------- ;
 147:  ! ***** WELDING ***** ;
 148:   ;
 149:  !-- MOVE TO SAFE START ;
 150:  !skip edge ;
 151:  IF (R[139]=1) THEN ;
 152:  IF (R[195]=0) THEN ;
 153:L PR[3] 150mm/sec FINE    ;
 154:  ELSE ;
 155:L PR[3] 3.0sec FINE    ;
 156:  ENDIF ;
 157:  JMP LBL[14] ;
 158:  ENDIF ;
 159:   ;
 160:   ;
 161:  ! wait for robot 1 has moved away ;
 162:  ! if not swap robot ;
 163:  IF (R[290]=0 AND R[70]<>55) THEN ;
 164:  WAIT (R[75]=1 OR R[221]>24)    ;
 165:   ;
 166:  ENDIF ;
 167:   ;
 168:  ! move to safe point ;
 169:  ! change speed, if low angle ;
 170:  IF (R[195]=0) THEN ;
 171:L PR[35] 350mm/sec CNT0    ;
 172:  ELSE ;
 173:L PR[35] 5sec CNT0    ;
 174:  ENDIF ;
 175:   ;
 176:   ;
 177:   ;
 178:   ;
 179:  !** -------------------  ** ;
 180:   ;
 181:  !-- MOVE TO WELD START ;
 182:  R[164]=1    ;
 183:   ;
 184:  LBL[11] ;
 185:  R[153]=11    ;
 186:   ;
 187:L PR[1] 150mm/sec FINE    ;
 188:   ;
 189:  ! wait for R1 to move away ;
 190:  IF (R[290]=0 AND R[70]<>55) THEN ;
 191:  WAIT (R[468]>R[93] OR R[221]>24)    ;
 192:  ENDIF ;
 193:   ;
 194:  !** -------------------  ** ;
 195:   ;
 196:  LBL[12] ;
 197:  R[153]=12    ;
 198:  Weld Start E2[1,10,E0] ;
 199:   ;
 200:  !Set low current seq ;
 201:  GO[13]=10 ;
 202:  WAIT   1.00(sec) ;
 203:   ;
 204:L PR[2] R[127]cm/min FINE    ;
 205:  WAIT    .50(sec) ;
 206:   ;
 207:  !---------------------------- ;
 208:  LBL[13] ;
 209:  R[153]=13    ;
 210:   ;
 211:  GO[13]=10 ;
 212:  Weld Start E2[1,10,E0] ;
 213:   ;
 214:L PR[3] R[127]cm/min FINE    ;
 215:  GO[13]=R[112] ;
 216:   ;
 217:  LBL[14] ;
 218:  R[153]=14    ;
 219:   ;
 220:  IF (R[221]<>18) THEN ;
 221:  Weld Start E2[1,R[112],E0] ;
 222:  ENDIF ;
 223:   ;
 224:  Weave Sine[3] ;
 225:  Track TAST[R[23]] ;
 226:   ;
 227:L PR[8] R[127]cm/min FINE    ;
 228:   ;
 229:   ;
 230:  LBL[999] ;
 231:   ;
 232:  //R[153]=0    ;
 233:   ;
/POS
/END

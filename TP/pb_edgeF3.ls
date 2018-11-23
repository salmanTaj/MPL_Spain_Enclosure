/PROG  PB_EDGEF3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4921;
CREATE		= DATE 17-06-07  TIME 11:03:12;
MODIFIED	= DATE 18-11-23  TIME 08:36:08;
FILE_NAME	= PB_EDGE1;
VERSION		= 0;
LINE_COUNT	= 234;
MEMORY_SIZE	= 5393;
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
   2:  R[153:TP JMP R3]=0    ;
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
  15:  IF ((R[153:TP JMP R3]>0)),JMP LBL[R[153]] ;
  16:   ;
  17:   ;
  18:  !Handling Rat hole points ;
  19:  IF (R[70:TP step]=55) THEN ;
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
  30:  R[105:PosPtr L/R 3]=(60+(R[95:SE]*10)) ;
  31:   ;
  32:  !***  CONFIG CALC ;
  33:  R[106:Config L/R 3]=43    ;
  34:  IF (R[95:SE]=(1)),R[106:Config L/R 3]=(45) ;
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
  46:  R[190:W. ang 1]=R[268:Low ang3]    ;
  47:  ! if normal angle and rat or no s ;
  48:  IF ((R[268:Low ang3]=0) AND ((R[70:TP step]=55) OR (R[267:web type3]=0) OR (R[288:Rat closing]=1) OR R[264:End type3]=3)) THEN ;
  49:  R[268:Low ang3]=0    ;
  50:  ELSE ;
  51:  R[268:Low ang3]=1    ;
  52:  ENDIF ;
  53:  R[195]=R[268:Low ang3]    ;
  54:   ;
  55:  ! changing angle for Side profile ;
  56:  IF (R[263:Flange3]=1) THEN ;
  57:  R[192:W. ang 3]=(-10)    ;
  58:  ENDIF ;
  59:   ;
  60:  !change angle ;
  61:  IF (((R[264:End type3]<>3) AND (R[264:End type3]<>7) AND (R[263:Flange3]=2)) OR (R[495:projekt number]<>21226)) THEN ;
  62:  R[138:Calc free 3]=0    ;
  63:  R[191:W. ang 2]=5    ;
  64:  R[192:W. ang 3]=(-17)    ;
  65:  R[193:W. ang 4]=13    ;
  66:  ENDIF ;
  67:   ;
  68:   ;
  69:  R[145:X TP3]=0    ;
  70:  R[146:Y TP3]=50    ;
  71:  !Mirror if rat hole ;
  72:  IF (R[70:TP step]=55),R[145:X TP3]=R[145:X TP3]*(-1) ;
  73:  CALL PRG_CALC3    ;
  74:  R[104:Pos calc 3]=R[105:PosPtr L/R 3]+R[140]    ;
  75:  PR[35:Start pos]=PR[21:DH nor]+PR[R[104]]    ;
  76:  PR[35,1:Start pos]=PR[35,1:Start pos]+R[145:X TP3]    ;
  77:  PR[35,2:Start pos]=PR[35,2:Start pos]+R[146:Y TP3]    ;
  78:  PR[35,3:Start pos]=PR[35,3:Start pos]+20    ;
  79:  !------- ;
  80:   ;
  81:  !--  WELDING  POINT 1 ;
  82:  !profile thickness ;
  83:  R[145:X TP3]=2    ;
  84:  R[146:Y TP3]=R[14:Profile Thicknes]-2-0    ;
  85:  R[146:Y TP3]=R[146:Y TP3]*(-1)    ;
  86:  !Mirror if rat hole ;
  87:  IF (R[70:TP step]=55),R[145:X TP3]=R[145:X TP3]*(-1) ;
  88:  CALL PRG_CALC3    ;
  89:  R[104:Pos calc 3]=R[105:PosPtr L/R 3]+R[140]    ;
  90:  PR[1:WP01]=PR[29:WeldAng 09]+PR[R[104]]    ;
  91:  PR[1,1:WP01]=PR[1,1:WP01]+R[145:X TP3]    ;
  92:  PR[1,2:WP01]=PR[1,2:WP01]+R[146:Y TP3]    ;
  93:  PR[1,3:WP01]=PR[1,3:WP01]+3    ;
  94:  !------- ;
  95:   ;
  96:  !-- WELDING  POINT 2 ;
  97:  R[145:X TP3]=2    ;
  98:  R[146:Y TP3]=1    ;
  99:  !Mirror if rat hole ;
 100:  IF (R[70:TP step]=55),R[145:X TP3]=R[145:X TP3]*(-1) ;
 101:  CALL PRG_CALC3    ;
 102:  R[104:Pos calc 3]=R[105:PosPtr L/R 3]+R[140]    ;
 103:  PR[2:WP02]=PR[29:WeldAng 09]+PR[R[104]]    ;
 104:  PR[2,1:WP02]=PR[2,1:WP02]+R[145:X TP3]    ;
 105:  PR[2,2:WP02]=PR[2,2:WP02]+R[146:Y TP3]    ;
 106:  PR[2,3:WP02]=(PR[2,3:WP02]-0) ;
 107:  !------- ;
 108:   ;
 109:  !-- WELDING  POINT 3 ;
 110:  R[145:X TP3]=(-5)    ;
 111:  !skip edge ;
 112:  R[139:Calc free 3]=0    ;
 113:  IF (R[139:Calc free 3]=1),R[145:X TP3]=((-25)) ;
 114:  R[146:Y TP3]=(0) ;
 115:  !Mirror if rat hole ;
 116:  IF (R[70:TP step]=55),R[145:X TP3]=R[145:X TP3]*(-1) ;
 117:  CALL PRG_CALC3    ;
 118:  R[104:Pos calc 3]=R[105:PosPtr L/R 3]+R[140]    ;
 119:  PR[3:WP03]=PR[21:DH nor]+PR[R[104]]    ;
 120:  PR[3,1:WP03]=PR[3,1:WP03]+R[145:X TP3]    ;
 121:  PR[3,2:WP03]=PR[3,2:WP03]+R[146:Y TP3]    ;
 122:   ;
 123:  !-- WELDING  POINT 8 ;
 124:  R[145:X TP3]=(-15)    ;
 125:  R[146:Y TP3]=((-1)) ;
 126:  !Mirror if rat hole ;
 127:  IF (R[70:TP step]=55),R[145:X TP3]=R[145:X TP3]*(-1) ;
 128:  R[191:W. ang 2]=R[191:W. ang 2]+0    ;
 129:  CALL PRG_CALC3    ;
 130:  R[104:Pos calc 3]=R[105:PosPtr L/R 3]+R[140]    ;
 131:  PR[8:WP08]=PR[21:DH nor]+PR[R[104]]    ;
 132:  PR[8,1:WP08]=PR[8,1:WP08]+R[145:X TP3]    ;
 133:  PR[8,2:WP08]=PR[8,2:WP08]+R[146:Y TP3]    ;
 134:   ;
 135:   ;
 136:  !resetting angles ;
 137:  IF ((R[264:End type3]<>3) AND (R[264:End type3]<>7)) THEN ;
 138:  R[191:W. ang 2]=0    ;
 139:  R[192:W. ang 3]=(-8)    ;
 140:  R[193:W. ang 4]=5    ;
 141:  ENDIF ;
 142:  CALL PRG_CALC3    ;
 143:  R[191:W. ang 2]=0    ;
 144:  R[192:W. ang 3]=0    ;
 145:  R[193:W. ang 4]=0    ;
 146:  R[268:Low ang3]=R[190:W. ang 1]    ;
 147:  !---------------------------- ;
 148:  ! ***** WELDING ***** ;
 149:   ;
 150:  !-- MOVE TO SAFE START ;
 151:  !skip edge ;
 152:  IF (R[139:Calc free 3]=1) THEN ;
 153:  IF (R[195]=0) THEN ;
 154:L PR[3:WP03] 150mm/sec FINE    ;
 155:  ELSE ;
 156:L PR[3:WP03] 3.0sec FINE    ;
 157:  ENDIF ;
 158:  JMP LBL[14] ;
 159:  ENDIF ;
 160:   ;
 161:   ;
 162:  ! wait for robot 1 has moved away ;
 163:  ! if not swap robot ;
 164:  IF (R[294]>0 AND R[70:TP step]<>55) THEN ;
 165:  WAIT ((R[75:Robot done]>=1) OR (R[294]=2))    ;
 166:   ;
 167:  ENDIF ;
 168:   ;
 169:  ! move to safe point ;
 170:  ! change speed, if low angle ;
 171:  IF (R[195]=0) THEN ;
 172:L PR[35:Start pos] 350mm/sec CNT0    ;
 173:  ELSE ;
 174:L PR[35:Start pos] 5.0sec CNT0    ;
 175:  ENDIF ;
 176:   ;
 177:   ;
 178:   ;
 179:   ;
 180:  !** -------------------  ** ;
 181:   ;
 182:  !-- MOVE TO WELD START ;
 183:  R[164:in seam R3]=1    ;
 184:   ;
 185:  LBL[11] ;
 186:  R[153:TP JMP R3]=11    ;
 187:   ;
 188:L PR[1:WP01] 150mm/sec FINE    ;
 189:   ;
 190:  ! wait for R1 to move away ;
 191:  IF (R[294]=1 AND R[70:TP step]<>55) THEN ;
 192:  WAIT ((R[468]>R[93:robot distance] AND R[75:Robot done]>=1) OR (R[294]=2))    ;
 193:  ENDIF ;
 194:   ;
 195:  !** -------------------  ** ;
 196:   ;
 197:  LBL[12] ;
 198:  R[153:TP JMP R3]=12    ;
 199:  Weld Start E2[1,10,E0] ;
 200:   ;
 201:  !Set low current seq ;
 202:  GO[13:E2 Memory Channel]=10 ;
 203:  WAIT   1.00(sec) ;
 204:   ;
 205:L PR[2:WP02] R[127:WS_Calc R3]cm/min FINE    ;
 206:  WAIT    .50(sec) ;
 207:   ;
 208:  !---------------------------- ;
 209:  LBL[13] ;
 210:  R[153:TP JMP R3]=13    ;
 211:   ;
 212:  GO[13:E2 Memory Channel]=10 ;
 213:  Weld Start E2[1,10,E0] ;
 214:   ;
 215:L PR[3:WP03] R[127:WS_Calc R3]cm/min FINE    ;
 216:  GO[13:E2 Memory Channel]=R[112:E2 Schedule] ;
 217:   ;
 218:  LBL[14] ;
 219:  R[153:TP JMP R3]=14    ;
 220:   ;
 221:  IF (R[221:Tasknr1]<>18) THEN ;
 222:  Weld Start E2[1,R[112],E0] ;
 223:  ENDIF ;
 224:   ;
 225:  Weave Sine[3] ;
 226:  Track TAST[R[23]] ;
 227:   ;
 228:L PR[8:WP08] R[127:WS_Calc R3]cm/min FINE    ;
 229:   ;
 230:   ;
 231:  LBL[999] ;
 232:   ;
 233:  //R[153:TP JMP R3]=0    ;
 234:   ;
/POS
/END

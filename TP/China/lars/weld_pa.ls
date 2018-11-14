/PROG  WELD_PA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "China";
PROG_SIZE	= 6619;
CREATE		= DATE 17-07-01  TIME 11:10:36;
MODIFIED	= DATE 17-10-18  TIME 15:08:46;
FILE_NAME	= WELD_PA1;
VERSION		= 0;
LINE_COUNT	= 310;
MEMORY_SIZE	= 7131;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,*,*,*;
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
   1:  R[109]=1    ;
   2:  !************************** ;
   3:  !*** CHINA WELDING PARAMETERS ;
   4:  !************************** ;
   5:   ;
   6:  !setting scale ;
   7:  IF (DO[95]=ON),R[6]=(1) ;
   8:  IF (DO[95]=ON),R[7]=(1) ;
   9:   ;
  10:   ;
  11:  !Weld position ;
  12:  !Select 1 - PB Web/Flat ;
  13:  !       2 - PF Vertical up ;
  14:  SELECT R[115]=1,JMP LBL[100] ;
  15:         =2,JMP LBL[200] ;
  16:         ELSE,JMP LBL[99] ;
  17:   ;
  18:  LBL[100] ;
  19:  !************************** ;
  20:  !PB position (downhand) ;
  21:  !************************** ;
  22:  !Throat Thickness ;
  23:   ;
  24:  IF R[11]<=3.5,JMP LBL[135] ;
  25:  IF R[11]<=4,JMP LBL[140] ;
  26:  IF R[11]<=5,JMP LBL[145] ;
  27:  IF R[11]<=5.5,JMP LBL[150] ;
  28:  IF R[11]>5.5,JMP LBL[160] ;
  29:   ;
  30:  LBL[135] ;
  31:  !*** 3.5mm Throat Thickness ;
  32:   ;
  33:  !Select welding Schedule ;
  34:  R[110]=1    ;
  35:   ;
  36:  !Arc sensor schedule ;
  37:  !value ;
  38:  R[20]=951.5    ;
  39:  !Schedule number ;
  40:  R[22]=1    ;
  41:   ;
  42:  !- WELDING TRAVEL SPEED cm/min - ;
  43:  R[117]=47    ;
  44:   ;
  45:  !-- weav. frequency ;
  46:  R[118]=5    ;
  47:  !-- weav. amplitude ;
  48:  R[119]=1.2    ;
  49:  !-- dwell time ;
  50:  R[120]=(.15) ;
  51:  R[121]=(.15) ;
  52:  JMP LBL[10] ;
  53:   ;
  54:  LBL[140] ;
  55:  !*** 4mm Throat Thickness ;
  56:   ;
  57:  !Select welding Schedule ;
  58:  R[110]=2    ;
  59:   ;
  60:  !Arc sensor schedule ;
  61:  !value ;
  62:  R[20]=1006    ;
  63:  !Schedule number ;
  64:  R[22]=1    ;
  65:   ;
  66:  !- WELDING TRAVEL SPEED cm/min - ;
  67:  R[117]=43    ;
  68:   ;
  69:  !-- weav. frequency ;
  70:  R[118]=5    ;
  71:  !-- weav. amplitude ;
  72:  R[119]=1.2    ;
  73:  !-- dwell time ;
  74:  R[120]=(.15) ;
  75:  R[121]=(.15) ;
  76:  JMP LBL[10] ;
  77:   ;
  78:  LBL[145] ;
  79:  !*** 5mm Throat Thickness ;
  80:   ;
  81:  !Select welding Schedule ;
  82:  R[110]=3    ;
  83:   ;
  84:  !Arc sensor schedule ;
  85:  !value ;
  86:  R[20]=1103    ;
  87:  !Schedule number ;
  88:  R[22]=1    ;
  89:   ;
  90:  !- WELDING TRAVEL SPEED cm/min - ;
  91:  R[117]=36    ;
  92:   ;
  93:  !-- weav. frequency ;
  94:  R[118]=3    ;
  95:  !-- weav. amplitude ;
  96:  R[119]=1.5    ;
  97:  !-- dwell time ;
  98:  R[120]=(.10) ;
  99:  R[121]=(.10) ;
 100:  JMP LBL[10] ;
 101:   ;
 102:  LBL[150] ;
 103:  !*** 5.5mm Throat Thickness ;
 104:   ;
 105:  !Select welding Schedule ;
 106:  R[110]=4    ;
 107:   ;
 108:  !Arc sensor schedule ;
 109:  !value ;
 110:  R[20]=1111    ;
 111:  !Schedule number ;
 112:  R[22]=1    ;
 113:   ;
 114:  !- WELDING TRAVEL SPEED cm/min - ;
 115:  R[117]=34    ;
 116:   ;
 117:  !-- weav. frequency ;
 118:  R[118]=3    ;
 119:  !-- weav. amplitude ;
 120:  R[119]=1.3    ;
 121:  !-- dwell time ;
 122:  R[120]=(.10) ;
 123:  R[121]=(.10) ;
 124:  JMP LBL[10] ;
 125:   ;
 126:  LBL[160] ;
 127:  !*** 2.2 mm Gap ;
 128:   ;
 129:  !Select welding Schedule ;
 130:  R[110]=4    ;
 131:   ;
 132:  !Arc sensor schedule ;
 133:  !value ;
 134:  R[20]=1040    ;
 135:  !Schedule number ;
 136:  R[22]=1    ;
 137:   ;
 138:  !- WELDING TRAVEL SPEED cm/min - ;
 139:  R[117]=30    ;
 140:   ;
 141:  !-- weav. frequency ;
 142:  R[118]=3    ;
 143:  !-- weav. amplitude ;
 144:  R[119]=1.2    ;
 145:  !-- dwell time ;
 146:  R[120]=(.10) ;
 147:  R[121]=(.10) ;
 148:  JMP LBL[10] ;
 149:   ;
 150:  LBL[200] ;
 151:  !************************** ;
 152:  !PF position (vertical up) ;
 153:  !************************** ;
 154:  !Throat Thickness ;
 155:  IF R[12]<=4.5,JMP LBL[240] ;
 156:  IF R[12]<=5,JMP LBL[245] ;
 157:  IF R[12]>=5,JMP LBL[250] ;
 158:   ;
 159:  LBL[240] ;
 160:  !*** 4,5mm Throat Thickness ;
 161:   ;
 162:  !Select welding Schedule ;
 163:  R[110]=10    ;
 164:   ;
 165:  !Arc sensor schedule ;
 166:  !value ;
 167:  R[20]=702.6    ;
 168:  !Schedule number ;
 169:  R[22]=1    ;
 170:   ;
 171:  !- WELDING TRAVEL SPEED cm/min - ;
 172:  R[117]=20    ;
 173:   ;
 174:  !-- weav. frequency ;
 175:  R[118]=3    ;
 176:  !-- weav. amplitude ;
 177:  R[119]=3    ;
 178:  !-- dwell time ;
 179:  R[120]=(.3) ;
 180:  R[121]=(.3) ;
 181:  JMP LBL[10] ;
 182:   ;
 183:  LBL[245] ;
 184:  !*** 5mm Throat Thickness ;
 185:   ;
 186:  !Select welding Schedule ;
 187:  R[110]=11    ;
 188:   ;
 189:  !Arc sensor schedule ;
 190:  !value ;
 191:  R[20]=755.7    ;
 192:  !Schedule number ;
 193:  R[22]=1    ;
 194:   ;
 195:  !- WELDING TRAVEL SPEED cm/min - ;
 196:  R[117]=18    ;
 197:   ;
 198:  !-- weav. frequency ;
 199:  R[118]=3    ;
 200:  !-- weav. amplitude ;
 201:  R[119]=3    ;
 202:  !-- dwell time ;
 203:  R[120]=(.3) ;
 204:  R[121]=(.3) ;
 205:  JMP LBL[10] ;
 206:   ;
 207:  LBL[250] ;
 208:  !*** 6mm Throat Thickness ;
 209:   ;
 210:  !Select welding Schedule ;
 211:  R[110]=12    ;
 212:   ;
 213:  !Arc sensor schedule ;
 214:  !value ;
 215:  R[20]=892.6    ;
 216:  !Schedule number ;
 217:  R[22]=1    ;
 218:   ;
 219:  !- WELDING TRAVEL SPEED cm/min - ;
 220:  R[117]=17    ;
 221:   ;
 222:  !-- weav. frequency ;
 223:  R[118]=3    ;
 224:  !-- weav. amplitude ;
 225:  R[119]=3    ;
 226:  !-- dwell time ;
 227:  R[120]=(.3) ;
 228:  R[121]=(.3) ;
 229:  JMP LBL[10] ;
 230:   ;
 231:  LBL[10] ;
 232:  !************************** ;
 233:  !*** Scaling ;
 234:  !************************** ;
 235:  !-- calc. weav. frequency ;
 236:  R[124]=R[118]*R[R[13]]    ;
 237:   ;
 238:  !-- calc. weav. amplitude ;
 239:  R[125]=R[119]/R[R[13]]    ;
 240:   ;
 241:   ;
 242:  !-- Writing for R1 ;
 243:  IF ((R[116]=1) OR (R[116]=4)) THEN ;
 244:  $WVSCH[1].$FREQUENCY=R[124] ;
 245:  $WVSCH[1].$AMPLITUDE=R[125] ;
 246:   ;
 247:  $WVSCH[1].$dwell_left=R[120] ;
 248:  $WVSCH[1].$dwell_right=R[121] ;
 249:   ;
 250:  !-- calc. welding speed ;
 251:  R[126]=R[117]*R[R[13]]    ;
 252:   ;
 253:  !TAST  number ;
 254:  R[21]=R[22]    ;
 255:  $TAST_PARAM[1].$M_I_DATA=R[20] ;
 256:   ;
 257:  !Welding Channel ;
 258:  R[111]=R[110]    ;
 259:   ;
 260:  ENDIF ;
 261:   ;
 262:  IF ((R[116]=3) OR (R[116]=4)) THEN ;
 263:  !Writing for R3 ;
 264:  !-- writin ;
 265:  $WVSCH[3].$FREQUENCY=R[124] ;
 266:  $WVSCH[3].$AMPLITUDE=R[125] ;
 267:   ;
 268:  $WVSCH[3].$dwell_left=R[120] ;
 269:  $WVSCH[3].$dwell_right=R[121] ;
 270:   ;
 271:  !-- calc. welding speed ;
 272:  R[127]=R[117]*R[R[13]]    ;
 273:   ;
 274:  !TAST  number ;
 275:  R[23]=R[22]+2    ;
 276:  $TAST_PARAM[3].$M_I_DATA=R[20] ;
 277:   ;
 278:   ;
 279:  !Welding Channel ;
 280:  R[112]=R[110]    ;
 281:  ENDIF ;
 282:   ;
 283:  JMP LBL[111] ;
 284:  LBL[99] ;
 285:  PAUSE ;
 286:   ;
 287:  LBL[111] ;
 288:  !Setting Chain welding length ;
 289:  !depending on baseplate thickness ;
 290:  IF (R[14]=6),R[88]=(85) ;
 291:  IF (R[14]=6),R[89]=(150) ;
 292:   ;
 293:  IF (R[14]=7),R[88]=(100) ;
 294:  IF (R[14]=7),R[89]=(150) ;
 295:   ;
 296:  IF (R[14]=8),R[88]=(130) ;
 297:  IF (R[14]=8),R[89]=(150) ;
 298:   ;
 299:  IF (R[14]=9),R[88]=(160) ;
 300:  IF (R[14]=9),R[89]=(150) ;
 301:   ;
 302:  IF (R[14]=10),R[88]=(200) ;
 303:  IF (R[14]=10),R[89]=(150) ;
 304:   ;
 305:  IF (R[14]=11),R[88]=(230) ;
 306:  IF (R[14]=11),R[89]=(150) ;
 307:   ;
 308:  IF (R[14]=12),R[88]=(260) ;
 309:  IF (R[14]=12),R[89]=(150) ;
 310:  R[109]=0    ;
/POS
/END

/PROG  WELD_PA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 6855;
CREATE		= DATE 17-07-01  TIME 11:10:36;
MODIFIED	= DATE 17-12-05  TIME 10:10:22;
FILE_NAME	= WELD_PA1;
VERSION		= 0;
LINE_COUNT	= 322;
MEMORY_SIZE	= 7447;
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
   3:  !***  Bilbao WELDING PARAMETERS ;
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
  23:  IF R[11]<=3,JMP LBL[135] ;
  24:  IF R[11]<=3.5,JMP LBL[135] ;
  25:  IF R[11]<=4,JMP LBL[140] ;
  26:  IF R[11]<=4.5,JMP LBL[145] ;
  27:  IF R[11]>4.5,JMP LBL[150] ;
  28:   ;
  29:  LBL[130] ;
  30:  !*** 3mm Throat Thickness ;
  31:  !Select welding Schedule ;
  32:  R[110]=1    ;
  33:   ;
  34:  !Arc sensor schedule ;
  35:  !value ;
  36:  R[20]=900    ;
  37:  !Schedule number ;
  38:  R[22]=1    ;
  39:   ;
  40:  !- WELDING TRAVEL SPEED cm/min - ;
  41:  R[117]=45    ;
  42:   ;
  43:  !-- weav. frequency ;
  44:  R[118]=5    ;
  45:  !-- weav. amplitude ;
  46:  R[119]=1.2    ;
  47:  !-- dwell time ;
  48:  R[120]=(.15) ;
  49:  R[121]=(.15) ;
  50:  JMP LBL[10] ;
  51:   ;
  52:  LBL[135] ;
  53:  !*** 3.5mm Throat Thickness ;
  54:   ;
  55:  !Select welding Schedule ;
  56:  R[110]=2    ;
  57:   ;
  58:  !Arc sensor schedule ;
  59:  !value ;
  60:  R[20]=910    ;
  61:  !Schedule number ;
  62:  R[22]=1    ;
  63:   ;
  64:  !- WELDING TRAVEL SPEED cm/min - ;
  65:  R[117]=41    ;
  66:   ;
  67:  !-- weav. frequency ;
  68:  R[118]=5    ;
  69:  !-- weav. amplitude ;
  70:  R[119]=1.2    ;
  71:  !-- dwell time ;
  72:  R[120]=(.15) ;
  73:  R[121]=(.15) ;
  74:  JMP LBL[10] ;
  75:   ;
  76:  LBL[140] ;
  77:  !*** 4mm Throat Thickness ;
  78:   ;
  79:  !Select welding Schedule ;
  80:  R[110]=3    ;
  81:   ;
  82:  !Arc sensor schedule ;
  83:  !value ;
  84:  R[20]=925    ;
  85:  !Schedule number ;
  86:  R[22]=1    ;
  87:   ;
  88:  !- WELDING TRAVEL SPEED cm/min - ;
  89:  R[117]=35    ;
  90:   ;
  91:  !-- weav. frequency ;
  92:  R[118]=4    ;
  93:  !-- weav. amplitude ;
  94:  R[119]=1.2    ;
  95:  !-- dwell time ;
  96:  R[120]=(.15) ;
  97:  R[121]=(.15) ;
  98:  JMP LBL[10] ;
  99:   ;
 100:  LBL[145] ;
 101:  !*** 4.5mm Throat Thickness ;
 102:   ;
 103:  !Select welding Schedule ;
 104:  R[110]=4    ;
 105:   ;
 106:  !Arc sensor schedule ;
 107:  !value ;
 108:  R[20]=975    ;
 109:  !Schedule number ;
 110:  R[22]=1    ;
 111:   ;
 112:  !- WELDING TRAVEL SPEED cm/min - ;
 113:  R[117]=30    ;
 114:   ;
 115:  !-- weav. frequency ;
 116:  R[118]=3    ;
 117:  !-- weav. amplitude ;
 118:  R[119]=1.5    ;
 119:  !-- dwell time ;
 120:  R[120]=(.15) ;
 121:  R[121]=(.15) ;
 122:  JMP LBL[10] ;
 123:   ;
 124:  LBL[150] ;
 125:  !*** 5mm Throat Thickness ;
 126:   ;
 127:  !Select welding Schedule ;
 128:  R[110]=5    ;
 129:   ;
 130:  !Arc sensor schedule ;
 131:  !value ;
 132:  R[20]=970    ;
 133:  !Schedule number ;
 134:  R[22]=1    ;
 135:   ;
 136:  !- WELDING TRAVEL SPEED cm/min - ;
 137:  R[117]=30    ;
 138:   ;
 139:  !-- weav. frequency ;
 140:  R[118]=3    ;
 141:  !-- weav. amplitude ;
 142:  R[119]=2    ;
 143:  !-- dwell time ;
 144:  R[120]=(.15) ;
 145:  R[121]=(.15) ;
 146:   ;
 147:  JMP LBL[10] ;
 148:   ;
 149:   ;
 150:  LBL[200] ;
 151:  !************************** ;
 152:  !PF position (vertical up) ;
 153:  !************************** ;
 154:  !Throat Thickness ;
 155:  IF R[12]<=3,JMP LBL[240] ;
 156:  IF R[12]<=3.5,JMP LBL[240] ;
 157:  IF R[12]<=4,JMP LBL[240] ;
 158:  IF R[12]<=4.5,JMP LBL[245] ;
 159:  IF R[12]>4.5,JMP LBL[250] ;
 160:   ;
 161:  LBL[240] ;
 162:  !*** 4mm Throat Thickness ;
 163:  IF (R[11]=4) THEN ;
 164:  R[123]=9    ;
 165:  ENDIF ;
 166:   ;
 167:  !Select welding Schedule ;
 168:  R[110]=11    ;
 169:   ;
 170:  !Arc sensor schedule ;
 171:  !value ;
 172:  R[20]=620    ;
 173:  !Schedule number ;
 174:  R[22]=1    ;
 175:   ;
 176:  !- WELDING TRAVEL SPEED cm/min - ;
 177:  R[117]=24    ;
 178:   ;
 179:  !-- weav. frequency ;
 180:  R[118]=2.7    ;
 181:  !-- weav. amplitude ;
 182:  R[119]=1.4    ;
 183:  !-- dwell time ;
 184:  R[120]=(.2) ;
 185:  R[121]=(.2) ;
 186:  JMP LBL[10] ;
 187:   ;
 188:  LBL[245] ;
 189:  !*** 4.5mm Throat Thickness ;
 190:  IF (R[11]=4.5) THEN ;
 191:  R[123]=9    ;
 192:  ENDIF ;
 193:   ;
 194:  !Select welding Schedule ;
 195:  R[110]=12    ;
 196:   ;
 197:  !Arc sensor schedule ;
 198:  !value ;
 199:  R[20]=730    ;
 200:  !Schedule number ;
 201:  R[22]=1    ;
 202:   ;
 203:  !- WELDING TRAVEL SPEED cm/min - ;
 204:  R[117]=21    ;
 205:   ;
 206:  !-- weav. frequency ;
 207:  R[118]=2.5    ;
 208:  !-- weav. amplitude ;
 209:  R[119]=2.3    ;
 210:  !-- dwell time ;
 211:  R[120]=(.25) ;
 212:  R[121]=(.25) ;
 213:  JMP LBL[10] ;
 214:   ;
 215:  LBL[250] ;
 216:  !*** 5mm Throat Thickness ;
 217:  IF (R[11]=5) THEN ;
 218:  R[123]=10    ;
 219:  ENDIF ;
 220:   ;
 221:  !Select welding Schedule ;
 222:  R[110]=13    ;
 223:   ;
 224:  !Arc sensor schedule ;
 225:  !value ;
 226:  R[20]=740    ;
 227:  !Schedule number ;
 228:  R[22]=1    ;
 229:   ;
 230:  !- WELDING TRAVEL SPEED cm/min - ;
 231:  R[117]=20    ;
 232:   ;
 233:  !-- weav. frequency ;
 234:  R[118]=2.7    ;
 235:  !-- weav. amplitude ;
 236:  R[119]=2.7    ;
 237:  !-- dwell time ;
 238:  R[120]=(.3) ;
 239:  R[121]=(.3) ;
 240:  JMP LBL[10] ;
 241:   ;
 242:  LBL[10] ;
 243:  !************************** ;
 244:  !*** Scaling ;
 245:  !************************** ;
 246:  !-- calc. weav. frequency ;
 247:  R[124]=R[118]*R[R[13]]    ;
 248:   ;
 249:  !-- calc. weav. amplitude ;
 250:  R[125]=R[119]/R[R[13]]    ;
 251:   ;
 252:   ;
 253:  !-- Writing for R1 ;
 254:  IF ((R[116]=1) OR (R[116]=4)) THEN ;
 255:  $WVSCH[1].$FREQUENCY=R[124] ;
 256:  $WVSCH[1].$AMPLITUDE=R[125] ;
 257:   ;
 258:  $WVSCH[1].$dwell_left=R[120] ;
 259:  $WVSCH[1].$dwell_right=R[121] ;
 260:   ;
 261:  !-- calc. welding speed ;
 262:  R[126]=R[117]*R[R[13]]    ;
 263:   ;
 264:  !TAST  number ;
 265:  R[21]=R[22]    ;
 266:  $TAST_PARAM[1].$M_I_DATA=R[20] ;
 267:   ;
 268:  !Welding Channel ;
 269:  R[111]=R[110]    ;
 270:   ;
 271:  ENDIF ;
 272:   ;
 273:  IF ((R[116]=3) OR (R[116]=4)) THEN ;
 274:  !Writing for R3 ;
 275:  !-- writin ;
 276:  $WVSCH[3].$FREQUENCY=R[124] ;
 277:  $WVSCH[3].$AMPLITUDE=R[125] ;
 278:   ;
 279:  $WVSCH[3].$dwell_left=R[120] ;
 280:  $WVSCH[3].$dwell_right=R[121] ;
 281:   ;
 282:  !-- calc. welding speed ;
 283:  R[127]=R[117]*R[R[13]]    ;
 284:   ;
 285:  !TAST  number ;
 286:  R[23]=R[22]+2    ;
 287:  $TAST_PARAM[3].$M_I_DATA=R[20] ;
 288:   ;
 289:   ;
 290:  !Welding Channel ;
 291:  R[112]=R[110]    ;
 292:  ENDIF ;
 293:   ;
 294:  JMP LBL[111] ;
 295:  LBL[99] ;
 296:  PAUSE ;
 297:   ;
 298:  LBL[111] ;
 299:  !Setting Chain welding length ;
 300:  !depending on Profile thickness ;
 301:  IF (R[14]=6),R[88]=(85) ;
 302:  IF (R[14]=6),R[89]=(150) ;
 303:   ;
 304:  IF (R[14]=7),R[88]=(100) ;
 305:  IF (R[14]=7),R[89]=(150) ;
 306:   ;
 307:  IF (R[14]=8),R[88]=(130) ;
 308:  IF (R[14]=8),R[89]=(150) ;
 309:   ;
 310:  IF (R[14]=9),R[88]=(160) ;
 311:  IF (R[14]=9),R[89]=(150) ;
 312:   ;
 313:  IF (R[14]=10),R[88]=(200) ;
 314:  IF (R[14]=10),R[89]=(150) ;
 315:   ;
 316:  IF (R[14]=11),R[88]=(230) ;
 317:  IF (R[14]=11),R[89]=(150) ;
 318:   ;
 319:  IF (R[14]=12),R[88]=(260) ;
 320:  IF (R[14]=12),R[89]=(150) ;
 321:   ;
 322:  R[109]=0    ;
/POS
/END
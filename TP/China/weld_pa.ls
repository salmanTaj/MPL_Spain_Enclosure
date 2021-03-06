/PROG  WELD_PA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "China 2.5";
PROG_SIZE	= 8757;
CREATE		= DATE 17-07-01  TIME 11:10:36;
MODIFIED	= DATE 18-08-13  TIME 08:49:12;
FILE_NAME	= WELD_PA1;
VERSION		= 0;
LINE_COUNT	= 407;
MEMORY_SIZE	= 9265;
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
   9:  ! Resetting R3 hot weld ;
  10:  R[130]=0    ;
  11:   ;
  12:   ;
  13:  !Weld position ;
  14:  !Select 1 - PB Web/Flat ;
  15:  !       2 - PF Vertical up ;
  16:  SELECT R[115]=1,JMP LBL[100] ;
  17:         =2,JMP LBL[200] ;
  18:         ELSE,JMP LBL[99] ;
  19:   ;
  20:  LBL[100] ;
  21:  !************************** ;
  22:  !PB position (downhand) ;
  23:  !************************** ;
  24:  !Throat Thickness ;
  25:   ;
  26:  IF R[11]<=4.5,JMP LBL[145] ;
  27:  IF R[11]<=5,JMP LBL[150] ;
  28:  IF R[11]<=6,JMP LBL[160] ;
  29:  IF R[11]<=7,JMP LBL[170] ;
  30:  IF R[11]>7.1,JMP LBL[175] ;
  31:   ;
  32:  !----------------------------- ;
  33:  LBL[145] ;
  34:  !*** leg length 4.5 ;
  35:   ;
  36:  !Select welding Schedule ;
  37:  R[110]=17    ;
  38:  ! Setting R3 hot weld ;
  39:  R[130]=16    ;
  40:   ;
  41:  !Arc sensor schedule ;
  42:  !value ;
  43:  R[20]=900    ;
  44:   ;
  45:  !- WELDING TRAVEL SPEED cm/min - ;
  46:  R[117]=47    ;
  47:   ;
  48:  !-- weav. frequency ;
  49:  R[118]=4    ;
  50:  !-- weav. amplitude ;
  51:  R[119]=.7    ;
  52:  !-- dwell time ;
  53:  R[120]=(.15) ;
  54:  R[121]=(.15) ;
  55:  JMP LBL[10] ;
  56:   ;
  57:  !----------------------------- ;
  58:  LBL[150] ;
  59:  !*** leg length 5 ;
  60:   ;
  61:  !Select welding Schedule ;
  62:  R[110]=25    ;
  63:  ! for test only ;
  64:  R[110]=22    ;
  65:  ! Setting R3 hot weld ;
  66:  R[130]=22    ;
  67:   ;
  68:  !Arc sensor schedule ;
  69:  !value ;
  70:  R[20]=915    ;
  71:   ;
  72:  !- WELDING TRAVEL SPEED cm/min - ;
  73:  R[117]=40    ;
  74:   ;
  75:  !-- weav. frequency ;
  76:  R[118]=5    ;
  77:  !-- weav. amplitude ;
  78:  R[119]=1.4    ;
  79:  !-- dwell time ;
  80:  R[120]=(.15) ;
  81:  R[121]=(.15) ;
  82:  JMP LBL[10] ;
  83:   ;
  84:  !----------------------------- ;
  85:  LBL[160] ;
  86:  !*** leg length 6 ;
  87:   ;
  88:  !Select welding Schedule ;
  89:  R[110]=26    ;
  90:  ! for test only ;
  91:  R[110]=23    ;
  92:  ! Setting R3 hot weld ;
  93:  R[130]=23    ;
  94:   ;
  95:  !Arc sensor schedule ;
  96:  !value ;
  97:  R[20]=999    ;
  98:   ;
  99:  !- WELDING TRAVEL SPEED cm/min - ;
 100:  R[117]=32    ;
 101:   ;
 102:  !-- weav. frequency ;
 103:  R[118]=4    ;
 104:  !-- weav. amplitude ;
 105:  R[119]=2.1    ;
 106:  !-- dwell time ;
 107:  R[120]=(.2) ;
 108:  R[121]=(.2) ;
 109:  JMP LBL[10] ;
 110:   ;
 111:   ;
 112:  !----------------------------- ;
 113:  LBL[170] ;
 114:  !*** leg length 7 ;
 115:   ;
 116:  !Select welding Schedule ;
 117:  R[110]=27    ;
 118:  ! Setting R3 hot weld ;
 119:  R[130]=24    ;
 120:   ;
 121:  !Arc sensor schedule ;
 122:  !value ;
 123:  R[20]=1111    ;
 124:   ;
 125:  !- WELDING TRAVEL SPEED cm/min - ;
 126:  R[117]=34    ;
 127:   ;
 128:  !-- weav. frequency ;
 129:  R[118]=5    ;
 130:  !-- weav. amplitude ;
 131:  R[119]=3.2    ;
 132:  !-- dwell time ;
 133:  R[120]=(.1) ;
 134:  R[121]=(.1) ;
 135:  JMP LBL[10] ;
 136:   ;
 137:  !----------------------------- ;
 138:  LBL[175] ;
 139:  !*** leg length 7,5 ;
 140:   ;
 141:  !Select welding Schedule ;
 142:  R[110]=19    ;
 143:  ! Setting R3 hot weld ;
 144:  R[130]=18    ;
 145:   ;
 146:  !Arc sensor schedule ;
 147:  !value ;
 148:  R[20]=900    ;
 149:   ;
 150:  !- WELDING TRAVEL SPEED cm/min - ;
 151:  R[117]=31    ;
 152:   ;
 153:  !-- weav. frequency ;
 154:  R[118]=5    ;
 155:  !-- weav. amplitude ;
 156:  R[119]=4.3    ;
 157:  !-- dwell time ;
 158:  R[120]=(.1) ;
 159:  R[121]=(.1) ;
 160:  JMP LBL[10] ;
 161:   ;
 162:  LBL[200] ;
 163:  !************************** ;
 164:  !PF position (vertical up) ;
 165:  !************************** ;
 166:  !Throat Thickness ;
 167:  IF R[12]<=4.5,JMP LBL[245] ;
 168:  IF R[12]<=5,JMP LBL[250] ;
 169:  IF R[12]<=6,JMP LBL[260] ;
 170:  IF R[12]>=7,JMP LBL[270] ;
 171:  IF R[12]>7.1,JMP LBL[280] ;
 172:   ;
 173:  !----------------------------- ;
 174:  LBL[245] ;
 175:  !*** leg length 4.5 ;
 176:   ;
 177:  !Select welding Schedule ;
 178:  R[110]=14    ;
 179:   ;
 180:  !Arc sensor schedule ;
 181:  !value ;
 182:  R[20]=603    ;
 183:   ;
 184:  !- WELDING TRAVEL SPEED cm/min - ;
 185:  R[117]=22    ;
 186:   ;
 187:  !-- weav. frequency ;
 188:  R[118]=4    ;
 189:  !-- weav. amplitude ;
 190:  R[119]=1.2    ;
 191:  !-- dwell time ;
 192:  R[120]=(.05) ;
 193:  R[121]=(.05) ;
 194:  JMP LBL[10] ;
 195:   ;
 196:  !----------------------------- ;
 197:  LBL[250] ;
 198:  !*** leg length 5 ;
 199:   ;
 200:  !Select welding Schedule ;
 201:  R[110]=30    ;
 202:   ;
 203:  !Arc sensor schedule ;
 204:  !value ;
 205:  R[20]=630    ;
 206:   ;
 207:  !- WELDING TRAVEL SPEED cm/min - ;
 208:  R[117]=23    ;
 209:   ;
 210:  !-- weav. frequency ;
 211:  R[118]=2    ;
 212:  !-- weav. amplitude ;
 213:  R[119]=1.2    ;
 214:  !-- dwell time ;
 215:  R[120]=(.35) ;
 216:  R[121]=(.35) ;
 217:  JMP LBL[10] ;
 218:   ;
 219:  !----------------------------- ;
 220:  LBL[260] ;
 221:  !*** leg length 6 ;
 222:   ;
 223:  !Select welding Schedule ;
 224:  R[110]=31    ;
 225:   ;
 226:  !Arc sensor schedule ;
 227:  !value ;
 228:  R[20]=702.5    ;
 229:   ;
 230:  !- WELDING TRAVEL SPEED cm/min - ;
 231:  R[117]=20    ;
 232:   ;
 233:  !-- weav. frequency ;
 234:  R[118]=3    ;
 235:  !-- weav. amplitude ;
 236:  R[119]=2.8    ;
 237:  !-- dwell time ;
 238:  R[120]=(.3) ;
 239:  R[121]=(.3) ;
 240:  JMP LBL[10] ;
 241:   ;
 242:  !----------------------------- ;
 243:  LBL[270] ;
 244:  !*** leg length 7 ;
 245:   ;
 246:  !Select welding Schedule ;
 247:  R[110]=32    ;
 248:   ;
 249:  !Arc sensor schedule ;
 250:  !value ;
 251:  R[20]=755    ;
 252:   ;
 253:  !- WELDING TRAVEL SPEED cm/min - ;
 254:  R[117]=19    ;
 255:   ;
 256:  !-- weav. frequency ;
 257:  R[118]=3    ;
 258:  !-- weav. amplitude ;
 259:  R[119]=2.8    ;
 260:  !-- dwell time ;
 261:  R[120]=(.3) ;
 262:  R[121]=(.3) ;
 263:  JMP LBL[10] ;
 264:   ;
 265:  !----------------------------- ;
 266:  LBL[280] ;
 267:  !*** leg length 8 ;
 268:   ;
 269:  !Select welding Schedule ;
 270:  R[110]=15    ;
 271:   ;
 272:  !Arc sensor schedule ;
 273:  !value ;
 274:  R[20]=736    ;
 275:   ;
 276:  !- WELDING TRAVEL SPEED cm/min - ;
 277:  R[117]=18    ;
 278:   ;
 279:  !-- weav. frequency ;
 280:  R[118]=3    ;
 281:  !-- weav. amplitude ;
 282:  R[119]=3    ;
 283:  !-- dwell time ;
 284:  R[120]=(.3) ;
 285:  R[121]=(.3) ;
 286:  JMP LBL[10] ;
 287:   ;
 288:  LBL[10] ;
 289:  !************************** ;
 290:  !*** Scaling ;
 291:  !************************** ;
 292:  !-- calc. weav. frequency ;
 293:  R[124]=R[118]*R[R[13]]    ;
 294:  R[124]=R[118]    ;
 295:   ;
 296:  !-- calc. weav. amplitude ;
 297:  R[125]=R[119]/R[R[13]]    ;
 298:  R[125]=R[119]    ;
 299:   ;
 300:   ;
 301:  !-- Writing for R1 ;
 302:  IF ((R[116]=1) OR (R[116]=4)) THEN ;
 303:  !Bias R1 ;
 304:  $TAST_PARAM[1].$BIAS_RATE_Y=0 ;
 305:   ;
 306:  $WVSCH[1].$FREQUENCY=R[124] ;
 307:  $WVSCH[1].$AMPLITUDE=R[125] ;
 308:   ;
 309:  $WVSCH[1].$dwell_left=R[120] ;
 310:  $WVSCH[1].$dwell_right=R[121] ;
 311:   ;
 312:  !-- calc. welding speed ;
 313:  R[126]=R[117]*R[R[13]]    ;
 314:   ;
 315:  !TAST  value ;
 316:  R[21]=1    ;
 317:  $TAST_PARAM[1].$M_I_DATA=R[20] ;
 318:   ;
 319:  !Welding Channel ;
 320:  R[111]=R[110]    ;
 321:   ;
 322:  ENDIF ;
 323:   ;
 324:  IF ((R[116]=3) OR (R[116]=4)) THEN ;
 325:  !Writing for R3 ;
 326:  !  Setting Bias for R3 ;
 327:  ! we need downforce ;
 328:  R[137]=.4    ;
 329:  ! Swapping direction ;
 330:  ! For normal  web welding and X p ;
 331:  IF (((R[223]=7) OR (R[223]=21)) AND (R[81]=1)) THEN ;
 332:  R[137]=R[137]*(-1)    ;
 333:  JMP LBL[137] ;
 334:  ENDIF ;
 335:   ;
 336:  ! For normal sync welding ;
 337:  ! X positive dir ;
 338:  IF ((R[81]=1) AND (R[82]=1)) THEN ;
 339:  R[137]=R[137]*(-1)    ;
 340:  ENDIF ;
 341:   ;
 342:  ! Y positive dir ;
 343:  IF ((R[81]=2) AND (R[83]=1)) THEN ;
 344:  R[137]=R[137]*(-1)    ;
 345:  ENDIF ;
 346:   ;
 347:  ! for welding back, swap again ;
 348:  IF ((R[223]=9) OR (R[223]=23)) THEN ;
 349:  R[137]=R[137]*(-1)    ;
 350:  ENDIF ;
 351:   ;
 352:  LBL[137] ;
 353:  $TAST_PARAM[3].$BIAS_RATE_Y=R[137] ;
 354:   ;
 355:  !-- writin ;
 356:  $WVSCH[3].$FREQUENCY=R[124] ;
 357:  $WVSCH[3].$AMPLITUDE=R[125] ;
 358:   ;
 359:  $WVSCH[3].$dwell_left=R[120] ;
 360:  $WVSCH[3].$dwell_right=R[121] ;
 361:   ;
 362:  !-- calc. welding speed ;
 363:  R[127]=R[117]*R[R[13]]    ;
 364:   ;
 365:  !TAST  value ;
 366:  R[23]=3    ;
 367:  $TAST_PARAM[3].$M_I_DATA=R[20] ;
 368:   ;
 369:   ;
 370:  !Welding Channel ;
 371:  R[112]=R[110]    ;
 372:  ! if R3 welds hot ;
 373:  IF (((R[221]=18) OR (R[223]=23)) AND (R[130]<>0)) THEN ;
 374:  !Welding Channel ;
 375:  R[112]=R[130]    ;
 376:  ENDIF ;
 377:  ENDIF ;
 378:   ;
 379:  JMP LBL[111] ;
 380:  LBL[99] ;
 381:  PAUSE ;
 382:   ;
 383:  LBL[111] ;
 384:  !Setting Chain welding length ;
 385:  !depending on baseplate thickness ;
 386:  IF (R[14]=6),R[88]=(85) ;
 387:  IF (R[14]=6),R[89]=(150) ;
 388:   ;
 389:  IF (R[14]=7),R[88]=(100) ;
 390:  IF (R[14]=7),R[89]=(150) ;
 391:   ;
 392:  IF (R[14]=8),R[88]=(130) ;
 393:  IF (R[14]=8),R[89]=(150) ;
 394:   ;
 395:  IF (R[14]=9),R[88]=(160) ;
 396:  IF (R[14]=9),R[89]=(150) ;
 397:   ;
 398:  IF (R[14]=10),R[88]=(200) ;
 399:  IF (R[14]=10),R[89]=(150) ;
 400:   ;
 401:  IF (R[14]=11),R[88]=(230) ;
 402:  IF (R[14]=11),R[89]=(150) ;
 403:   ;
 404:  IF (R[14]=12),R[88]=(260) ;
 405:  IF (R[14]=12),R[89]=(150) ;
 406:   ;
 407:  R[109]=0    ;
/POS
/END

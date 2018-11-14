/PROG  A_CALW3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 5627;
CREATE		= DATE 17-06-02  TIME 15:57:00;
MODIFIED	= DATE 18-03-07  TIME 13:07:36;
FILE_NAME	= A_CALW1;
VERSION		= 0;
LINE_COUNT	= 309;
MEMORY_SIZE	= 6055;
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
   1:  !****************************** ;
   2:  !**** WIRE CALIBRATION ;
      :!****  25 deg angle *******;
   3:  !****************************** ;
   4:  OVERRIDE=100% ;
   5:   ;
   6:  !If Robot is not folded ;
   7:  PR[120]=JPOS    ;
   8:  IF (PR[120,2]<70) THEN ;
   9:  CALL FOLD3    ;
  10:  ENDIF ;
  11:   ;
  12:  !------- SENS OVERRIDE ------- ;
  13:  R[138]=50    ;
  14:   ;
  15:  UTOOL_NUM=9 ;
  16:  UFRAME_NUM=8 ;
  17:   ;
  18:  !------- TOOL WIDTH ------- ;
  19:   ;
  20:   ;
  21:  !------- SET ZERO TOOL ------- ;
  22:  PR[180]=LPOS    ;
  23:  PR[180,1]=0    ;
  24:  PR[180,2]=0    ;
  25:  PR[180,3]=0    ;
  26:  PR[180,4]=0    ;
  27:  PR[180,5]=0    ;
  28:  PR[180,6]=0    ;
  29:   ;
  30:  UTOOL[9]=PR[180] ;
  31:   ;
  32:  ! to get correct userframe ;
  33:  PR[180,6]=(-90)    ;
  34:  UFRAME[8]=PR[180] ;
  35:  PR[180,6]=0    ;
  36:   ;
  37:  !Touch sensing off ;
  38:  DO[408]=OFF ;
  39:   ;
  40:   ;
  41:  PR[126]=LPOS    ;
  42:  IF (PR[126,1]>550),JMP LBL[120] ;
  43:  PR[126,1]=PR[126,1]+100    ;
  44:   ;
  45:L PR[126] 50mm/sec FINE    ;
  46:   ;
  47:  !------- UNFOLD POINT ------- ;
  48:  LBL[120] ;
  49:  PR[120]=JPOS    ;
  50:  PR[120,1]=(-90)    ;
  51:  PR[120,7]=1000    ;
  52:J PR[120] 50% FINE    ;
  53:   ;
  54:  LBL[121] ;
  55:  PR[121]=JPOS    ;
  56:  PR[121,1]=(-90)    ;
  57:  PR[121,2]=90    ;
  58:  PR[121,3]=(-80)    ;
  59:  PR[121,4]=0    ;
  60:  PR[121,5]=30    ;
  61:  PR[121,6]=0    ;
  62:   ;
  63:J PR[121] 50% FINE    ;
  64:   ;
  65:  PR[122]=PR[121]    ;
  66:  PR[122,5]=(-100)    ;
  67:J PR[122] 50% FINE    ;
  68:   ;
  69:   ;
  70:  !****************************** ;
  71:  !**** SENSING ;
  72:  !****************************** ;
  73:   ;
  74:  !------------ Z1 --------------- ;
  75:   ;
  76:  PR[124]=LPOS    ;
  77:  PR[124,1]=485    ;
  78:  PR[124,2]=PR[124,2]    ;
  79:  PR[124,3]=(-415)    ;
  80:  PR[124,4]=0    ;
  81:  PR[124,5]=90    ;
  82:  PR[124,6]=180    ;
  83:   ;
  84:L PR[124] 50mm/sec FINE    ;
  85:   ;
  86:  PR[160]=PR[124]    ;
  87:  PR[160,1]=PR[160,1]-40    ;
  88:  SKIP CONDITION DI[408]=ON    ;
  89:   ;
  90:  OVERRIDE=R[138] ;
  91:  DO[408]=ON ;
  92:L PR[160] 1mm/sec FINE Skip,LBL[991],PR[170]=LPOS    ;
  93:   ;
  94:  DO[408]=OFF ;
  95:  OVERRIDE=100% ;
  96:   ;
  97:  !****************************** ;
  98:  !------------ X1 --------------- ;
  99:   ;
 100:L PR[124] 50mm/sec FINE    ;
 101:   ;
 102:  PR[125]=PR[124]    ;
 103:  PR[125,2]=PR[125,2]-100    ;
 104:  PR[125,3]=(-480)    ;
 105:L PR[125] 50mm/sec FINE    ;
 106:   ;
 107:   ;
 108:  PR[123]=PR[124]    ;
 109:  PR[123,1]=PR[170,1]-5    ;
 110:  PR[123,2]=PR[123,2]-90    ;
 111:  PR[123,3]=(-350)    ;
 112:  PR[123,4]=90    ;
 113:  PR[123,5]=0    ;
 114:  PR[123,6]=(-90)    ;
 115:   ;
 116:  PR[127]=JPOS    ;
 117:  PR[127,3]=(-65)    ;
 118:J PR[127] 50% FINE    ;
 119:   ;
 120:  PR[127,4]=0    ;
 121:  PR[127,5]=(-31)    ;
 122:  PR[127,6]=0    ;
 123:J PR[127] 50% FINE    ;
 124:   ;
 125:L PR[123] 50mm/sec FINE    ;
 126:   ;
 127:  PR[161]=PR[123]    ;
 128:  PR[161,2]=PR[161,2]+40    ;
 129:  SKIP CONDITION DI[408]=ON    ;
 130:   ;
 131:  OVERRIDE=R[138] ;
 132:  DO[408]=ON ;
 133:L PR[161] 1mm/sec FINE Skip,LBL[991],PR[171]=LPOS    ;
 134:   ;
 135:  DO[408]=OFF ;
 136:  OVERRIDE=100% ;
 137:   ;
 138:  !------------ X2 --------------- ;
 139:   ;
 140:L PR[123] 50mm/sec FINE    ;
 141:   ;
 142:  PR[125]=LPOS    ;
 143:  PR[125,1]=PR[125,1]+20    ;
 144:L PR[125] 50mm/sec FINE    ;
 145:L PR[124] 48mm/sec FINE    ;
 146:   ;
 147:  PR[125]=PR[124]    ;
 148:  PR[125,2]=PR[125,2]+100    ;
 149:  PR[125,3]=(-480)    ;
 150:L PR[125] 50mm/sec FINE    ;
 151:   ;
 152:  PR[126]=PR[123]    ;
 153:  PR[126,2]=PR[124,2]+90    ;
 154:  PR[126,4]=PR[123,4]*(-1)    ;
 155:  PR[126,5]=0    ;
 156:  PR[126,6]=PR[123,6]*(-1)    ;
 157:   ;
 158:L PR[126] 50mm/sec FINE    ;
 159:   ;
 160:  PR[162]=PR[126]    ;
 161:  PR[162,2]=PR[162,2]-40    ;
 162:  SKIP CONDITION DI[408]=ON    ;
 163:   ;
 164:  OVERRIDE=R[138] ;
 165:  DO[408]=ON ;
 166:L PR[162] 1mm/sec FINE Skip,LBL[991],PR[172]=LPOS    ;
 167:   ;
 168:  DO[408]=OFF ;
 169:  OVERRIDE=100% ;
 170:   ;
 171:  PR[180,1]=(((PR[172,2]-PR[171,2]-30)/2-0)*(-1)) ;
 172:   ;
 173:  !****************************** ;
 174:  !------------ Y1 --------------- ;
 175:   ;
 176:L PR[126] 48mm/sec FINE    ;
 177:  PR[125]=LPOS    ;
 178:  PR[125,1]=PR[125,1]+20    ;
 179:L PR[125] 50mm/sec FINE    ;
 180:L PR[124] 50mm/sec FINE    ;
 181:   ;
 182:  PR[123]=LPOS    ;
 183:  PR[123,1]=PR[170,1]-2    ;
 184:  PR[123,2]=PR[124,2]-70    ;
 185:  PR[123,3]=(-365)    ;
 186:  PR[123,4]=90    ;
 187:  PR[123,5]=0    ;
 188:  PR[123,6]=(-90)    ;
 189:   ;
 190:  PR[125]=PR[124]    ;
 191:  PR[125,1]=PR[125,1]+50    ;
 192:  PR[125,3]=PR[125,3]-50    ;
 193:L PR[125] 50mm/sec FINE    ;
 194:L PR[123] 50mm/sec FINE    ;
 195:   ;
 196:  PR[163]=PR[123]    ;
 197:  PR[163,3]=PR[163,3]+40    ;
 198:  SKIP CONDITION DI[408]=ON    ;
 199:   ;
 200:  OVERRIDE=R[138] ;
 201:  DO[408]=ON ;
 202:L PR[163] 1mm/sec FINE Skip,LBL[991],PR[173]=LPOS    ;
 203:   ;
 204:  DO[408]=OFF ;
 205:  OVERRIDE=100% ;
 206:   ;
 207:  !------------ Y2 --------------- ;
 208:   ;
 209:L PR[123] 125mm/sec CNT50    ;
 210:L PR[125] 60mm/sec FINE    ;
 211:   ;
 212:  PR[126]=PR[123]    ;
 213:  PR[126,2]=PR[124,2]+70    ;
 214:  PR[126,4]=(-90)    ;
 215:  PR[126,6]=90    ;
 216:   ;
 217:L PR[126] 50mm/sec FINE    ;
 218:   ;
 219:  PR[164]=PR[126]    ;
 220:  PR[164,3]=PR[164,3]+40    ;
 221:  SKIP CONDITION DI[408]=ON    ;
 222:   ;
 223:  OVERRIDE=R[138] ;
 224:  DO[408]=ON ;
 225:L PR[164] 1mm/sec FINE Skip,LBL[991],PR[174]=LPOS    ;
 226:   ;
 227:  DO[408]=OFF ;
 228:  OVERRIDE=100% ;
 229:   ;
 230:  PR[180,2]=((PR[174,3]-PR[173,3])/2) ;
 231:   ;
 232:  !****************************** ;
 233:  !------------ Z2 --------------- ;
 234:   ;
 235:  PR[126,1]=500    ;
 236:L PR[126] 125mm/sec CNT50    ;
 237:   ;
 238:  PR[127]=LPOS    ;
 239:  PR[127,1]=266    ;
 240:  PR[127,2]=PR[124,7]-60    ;
 241:  PR[127,3]=(-28)    ;
 242:  PR[127,4]=(-180)    ;
 243:  PR[127,5]=0    ;
 244:  PR[127,6]=0    ;
 245:   ;
 246:  PR[125]=PR[127]    ;
 247:  PR[125,1]=500    ;
 248:  PR[125,2]=PR[124,2]    ;
 249:L PR[125] 60mm/sec FINE    ;
 250:   ;
 251:L PR[127] 120mm/sec FINE    ;
 252:   ;
 253:  PR[165]=PR[127]    ;
 254:  PR[165,3]=PR[165,3]-40    ;
 255:  SKIP CONDITION DI[408]=ON    ;
 256:   ;
 257:  OVERRIDE=R[138] ;
 258:  DO[408]=ON ;
 259:L PR[165] 1mm/sec FINE Skip,LBL[991],PR[175]=LPOS    ;
 260:   ;
 261:  DO[408]=OFF ;
 262:  OVERRIDE=100% ;
 263:   ;
 264:   ;
 265:  PR[180,3]=(PR[175,3]-PR[174,3]+PR[180,2]-25-.5) ;
 266:   ;
 267:   ;
 268:  !****************************** ;
 269:  !**** SET TOOL POINT ;
 270:  !****************************** ;
 271:   ;
 272:   ;
 273:  !----- ;
 274:  PR[180,4]=(-180)    ;
 275:  PR[180,5]=(-25)    ;
 276:  PR[180,6]=0    ;
 277:   ;
 278:  UTOOL[1]=PR[180] ;
 279:   ;
 280:L PR[125] 60mm/sec FINE    ;
 281:J PR[121] 50% CNT50    ;
 282:   ;
 283:  JMP LBL[9999] ;
 284:   ;
 285:  !****************************** ;
 286:  !**** ERROR HANDLING ;
 287:  !****************************** ;
 288:  LBL[991] ;
 289:  DO[408]=OFF ;
 290:  R[162]=603    ;
 291:   ;
 292:  PR[126]=LPOS    ;
 293:  PR[126,1]=PR[126,1]+100    ;
 294:   ;
 295:L PR[126] 50mm/sec FINE    ;
 296:   ;
 297:J PR[121] 50% FINE    ;
 298:  ABORT ;
 299:   ;
 300:  LBL[9999] ;
 301:  OVERRIDE=100% ;
 302:  CALL FOLD3    ;
 303:  UTOOL_NUM=1 ;
 304:  UFRAME_NUM=1 ;
 305:  !Calibration OK ;
 306:  R[216]=6070    ;
 307:   ;
 308:   ;
 309:   ;
/POS
/END
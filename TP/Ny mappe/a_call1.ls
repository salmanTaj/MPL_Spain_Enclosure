/PROG  A_CALL3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 5037;
CREATE		= DATE 17-06-02  TIME 15:02:20;
MODIFIED	= DATE 17-10-30  TIME 15:50:24;
FILE_NAME	= A_CALL1;
VERSION		= 0;
LINE_COUNT	= 273;
MEMORY_SIZE	= 5481;
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
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  !****************************** ;
   2:  !**** LASER CALIBRATION ;
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
  19:  R[167]=30    ;
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
  37:  RO[9]=OFF ;
  38:  DO[128]=OFF ;
  39:  !- SAFE POINT IF PROGRAM RESTART ;
  40:   ;
  41:  PR[126]=LPOS    ;
  42:  IF (PR[126,1]>530),JMP LBL[120] ;
  43:  PR[126,1]=PR[126,1]+100    ;
  44:   ;
  45:L PR[126] 50mm/sec FINE    ;
  46:   ;
  47:   ;
  48:  !------- UNFOLD POINT ------- ;
  49:  LBL[120] ;
  50:  PR[120]=JPOS    ;
  51:  PR[120,1]=(-90)    ;
  52:  PR[120,7]=1000    ;
  53:J PR[120] 50% FINE    ;
  54:   ;
  55:  LBL[121] ;
  56:  PR[121]=JPOS    ;
  57:  PR[121,1]=(-90)    ;
  58:  PR[121,2]=90    ;
  59:  PR[121,3]=(-80)    ;
  60:  PR[121,4]=0    ;
  61:  PR[121,5]=30    ;
  62:  PR[121,6]=0    ;
  63:   ;
  64:J PR[121] 50% FINE    ;
  65:   ;
  66:  PR[122]=PR[121]    ;
  67:  PR[122,5]=(-100)    ;
  68:J PR[122] 50% FINE    ;
  69:   ;
  70:  !****************************** ;
  71:  !**** SENSING ;
  72:  !****************************** ;
  73:   ;
  74:  !------------ Z1 --------------- ;
  75:  RO[9]=ON ;
  76:  DO[128]=ON ;
  77:   ;
  78:  PR[124]=LPOS    ;
  79:  PR[124,1]=525    ;
  80:  PR[124,2]=PR[124,2]    ;
  81:  PR[124,3]=(-444.5)    ;
  82:  PR[124,4]=0    ;
  83:  PR[124,5]=90    ;
  84:  PR[124,6]=180    ;
  85:   ;
  86:L PR[124] 50mm/sec FINE    ;
  87:  WAIT   1.00(sec) ;
  88:  PR[129]=PR[124]    ;
  89:   ;
  90:  LBL[170] ;
  91:L PR[129] 2mm/sec FINE    ;
  92:  PR[160]=PR[129]    ;
  93:  PR[160,1]=PR[160,1]+20    ;
  94:  SKIP CONDITION DI[127]=OFF    ;
    78:  IF DI[127]=OFF,JMP LBL[991] ;
  95:   ;
  96:  OVERRIDE=R[138] ;
  97:L PR[160] 1mm/sec FINE Skip,LBL[991],PR[170]=LPOS    ;
  98:   ;
  99:   ;
 100:  !****************************** ;
 101:  !------------ X1 --------------- ;
 102:   ;
 103:  PR[123]=LPOS    ;
 104:  PR[123,1]=PR[170,1]-2    ;
 105:  PR[123,2]=PR[123,2]-115    ;
 106:  PR[123,3]=(-339)    ;
 107:  PR[123,4]=90    ;
 108:  PR[123,5]=0    ;
 109:  PR[123,6]=(-90)    ;
 110:   ;
 111:L PR[123] 50mm/sec FINE    ;
 112:  WAIT   1.00(sec) ;
 113:  LBL[171] ;
 114:  PR[161]=PR[123]    ;
 115:  PR[161,2]=PR[161,2]-20    ;
 116:  SKIP CONDITION DI[127]=OFF    ;
     78:  IF DI[127]=OFF,JMP LBL[991] ;
 117:   ;
 118:  OVERRIDE=R[138] ;
 119:L PR[161] 1mm/sec FINE Skip,LBL[991],PR[171]=LPOS    ;
 120:   ;
 121:  OVERRIDE=100% ;
 122:   ;
 123:  !------------ X2 --------------- ;
 124:   ;
 125:  PR[124]=PR[123]    ;
 126:  PR[124,2]=PR[123,2]+230    ;
 127:  PR[124,4]=PR[123,4]*(-1)    ;
 128:  PR[124,5]=0    ;
 129:  PR[124,6]=PR[123,6]*(-1)    ;
 130:   ;
 131:J PR[122] 50% CNT50    ;
 132:L PR[124] 50mm/sec FINE    ;
 133:  WAIT   1.00(sec) ;
 134:  LBL[172] ;
 135:  PR[162]=PR[124]    ;
 136:  PR[162,2]=PR[162,2]+20    ;
 137:  SKIP CONDITION DI[127]=OFF    ;
     78:  IF DI[127]=OFF,JMP LBL[991] ;
 138:   ;
 139:  OVERRIDE=R[138] ;
 140:L PR[162] 1mm/sec FINE Skip,LBL[991],PR[172]=LPOS    ;
 141:   ;
 142:  OVERRIDE=100% ;
 143:   ;
 144:  PR[180,1]=(((PR[172,2]-PR[171,2]-R[167])/2+0)*(-1)) ;
 145:   ;
 146:  !****************************** ;
 147:  !------------ Y1 --------------- ;
 148:   ;
 149:  PR[123]=LPOS    ;
 150:  PR[123,1]=PR[170,1]-2    ;
 151:  PR[123,2]=1000-100    ;
 152:  PR[123,3]=(-341)    ;
 153:  PR[123,4]=90    ;
 154:  PR[123,5]=0    ;
 155:  PR[123,6]=(-90)    ;
 156:   ;
 157:  RO[9]=OFF ;
 158:J PR[122] 50% CNT50    ;
 159:L PR[123] 50mm/sec FINE    ;
 160:  WAIT   1.00(sec) ;
 161:  RO[9]=ON ;
 162:  WAIT    .50(sec) ;
 163:   ;
 164:  LBL[173] ;
 165:  PR[163]=PR[123]    ;
 166:  PR[163,3]=PR[163,3]+20    ;
 167:  SKIP CONDITION DI[127]=OFF    ;
     78:  IF DI[127]=OFF,JMP LBL[991] ;
 168:   ;
 169:  OVERRIDE=R[138] ;
 170:L PR[163] 1mm/sec FINE Skip,LBL[991],PR[173]=LPOS    ;
 171:   ;
 172:  OVERRIDE=100% ;
 173:   ;
 174:  !------------ Y2 --------------- ;
 175:   ;
 176:  PR[124]=PR[123]    ;
 177:  PR[124,2]=PR[123,2]+200    ;
 178:  PR[124,4]=(-90)    ;
 179:  PR[124,6]=90    ;
 180:   ;
 181:  RO[9]=OFF ;
 182:J PR[122] 50% CNT50    ;
 183:L PR[124] 50mm/sec FINE    ;
 184:  RO[9]=ON ;
 185:  WAIT   1.00(sec) ;
 186:   ;
 187:  LBL[174] ;
 188:  PR[164]=PR[124]    ;
 189:  PR[164,3]=PR[164,3]+20    ;
 190:  SKIP CONDITION DI[127]=OFF    ;
     78:  IF DI[127]=OFF,JMP LBL[991] ;
 191:   ;
 192:  OVERRIDE=R[138] ;
 193:L PR[164] 1mm/sec FINE Skip,LBL[991],PR[174]=LPOS    ;
 194:   ;
 195:  OVERRIDE=100% ;
 196:   ;
 197:  PR[180,2]=((PR[174,3]-PR[173,3])/2) ;
 198:   ;
 199:  !****************************** ;
 200:  !------------ Z2 --------------- ;
 201:   ;
 202:  RO[9]=OFF ;
 203:  PR[124]=LPOS    ;
 204:  PR[124,1]=250    ;
 205:  PR[124,2]=1000    ;
 206:  PR[124,3]=22    ;
 207:  PR[124,4]=(-180)    ;
 208:  PR[124,5]=0    ;
 209:  PR[124,6]=0    ;
 210:   ;
 211:J PR[124] 40% FINE    ;
 212:  RO[9]=ON ;
 213:  WAIT    .50(sec) ;
 214:   ;
 215:  PR[129]=PR[124]    ;
 216:   ;
 217:  LBL[175] ;
 218:L PR[129] 2mm/sec FINE    ;
 219:  PR[165]=PR[124]    ;
 220:  PR[165,3]=PR[165,3]-20    ;
 221:  SKIP CONDITION DI[127]=ON    ;
     78:  IF DI[127]=ON,JMP LBL[991] ;
 222:   ;
 223:  OVERRIDE=R[138] ;
 224:L PR[165] 1mm/sec FINE Skip,LBL[991],PR[175]=LPOS    ;
 225:   ;
 226:  OVERRIDE=100% ;
 227:   ;
 228:  PR[180,3]=(PR[175,3]-PR[174,3]+PR[180,2]) ;
 229:   ;
 230:  !****************************** ;
 231:  !**** SET TOOL POINT ;
 232:  !****************************** ;
 233:   ;
 234:  !----- ;
 235:  PR[180,4]=(-180)    ;
 236:  PR[180,5]=(-13)    ;
 237:  PR[180,6]=0    ;
 238:   ;
 239:  UTOOL[3]=PR[180] ;
 240:   ;
 241:  RO[9]=OFF ;
 242:  DO[128]=OFF ;
 243:J PR[121] 50% CNT50    ;
 244:   ;
 245:  JMP LBL[9999] ;
 246:   ;
 247:  !****************************** ;
 248:  !**** ERROR HANDLING ;
 249:  !****************************** ;
 250:  LBL[991] ;
 252:  RO[9]=OFF ;
 253:  DO[128]=OFF ;
 254:  R[162]=603    ;
 255:   ;
 256:  PR[126]=LPOS    ;
 257:  PR[126,1]=PR[126,1]+30    ;
 258:   ;
 259:L PR[126] 50mm/sec FINE    ;
 260:J PR[121] 50% CNT50    ;
 261:  ABORT ;
 262:   ;
 263:   ;
 264:  LBL[9999] ;
 265:  OVERRIDE=100% ;
 266:  CALL FOLD3    ;
 267:  UTOOL_NUM=1 ;
 268:  UFRAME_NUM=1 ;
 269:  !Calibration OK ;
 270:  R[216]=6050    ;
 271:   ;
 272:   ;
 273:   ;
/POS
/END
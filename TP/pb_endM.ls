/PROG  PB_endM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 10867;
CREATE		= DATE 17-05-30  TIME 11:08:22;
MODIFIED	= DATE 18-06-26  TIME 21:46:20;
FILE_NAME	= MAIN;
VERSION		= 0;
LINE_COUNT	= 560;
MEMORY_SIZE	= 11711;
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
  ARC Welding Equipment : 1,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  JMP LBL[555] ;
   2:  R[151]=0    ;
   3:  R[153]=0    ;
   4:  LBL[555] ;
   5:   ;

   8:  !Welding parametersM ;
   9:  WAIT R[109]=0    ;
  10:  R[13]=6    ;
  11:  R[115]=1    ;
  12:  R[116]=4    ;
  13:  CALL WELD_PA    ;
  14:   ;
  15:  !-- RESUME JMP label; 
  16:  IF ((R[157]>0)),JMP LBL[R[157]] ;

  19:  OVERRIDE=100% ;
  20:  R[151]=0    ;
  21:  R[153]=0    ;
  26:  R[113]=0    ;
   :R[158]=-2;
 :R[159]=-2; 
  27:   ;
  38:   ;
  40:   ;

 100:   ;
 101:  !****************************** ;
 102:  !Move to start R1 ;
 103:  !****************************** ;
 104:  IF (R[292]<>1) THEN ;
  314:  LBL[10] ;
 315:  R[157]=10    ;
 105:  R[75]=0    ;
 106:   ;
  :R[158]=2;
 107:  CALL PB_END1    ;
 108:  ENDIF ;
 109:   ;
 110:  !****************************** ;
 111:  !Start welding R1 + R3 ;
 112:  !****************************** ;
 113:  IF (R[292]=0) THEN ;
 114:   ;
   314:  LBL[20] ;
 315:  R[157]=20    ;
  :R[158]=2;
 :R[159]=2; 
 :;

 117:  !skip arc start if  starting is a ;
 119:  R[113]=1    ;
 120:  CALL ARCSET1    ;
 121:  RUN PB_END1 ;
 124:   ;
 125:  CALL PB_END3    ;
 126:   ;
 127:  WAIT R[75]=3    ;
 128:  WAIT DO[101]=OFF    ;
 129:  WAIT DO[103]=OFF    ;
 130:  ENDIF ;
 
  110:  !****************************** ;
 111:  !Start welding R1 without R3
 112:  !****************************** ;
 113:  IF (R[292]=3) THEN ;
    314:  LBL[30] ;
 315:  R[157]=30    ;
:;
  119:  R[113]=1    ;
  :R[75]=3;
 120:  CALL ARCSET1    ;
 121:  Call PB_END1 ;
 :Endif; 
 132:   ;
  110:  !****************************** ;
 111:  !Start welding R3 without R1
 112:  !****************************** ;
 113:  IF (R[292]=1) THEN ;
     314:  LBL[40] ;
 315:  R[157]=40    ;
  :R[159]=2; 
 121:  Call PB_END3 ;
 :Endif; 
 132:   ;
 :! define target point PR11;
 :R[71]=60;
 :call weldperf;
 :! swap direction of x-profile;
 :R[82]=R[82]*(-1);
 :;
 133:  !****************************** ;
 134:  !Sync welding ;
 135:  !****************************** ;
 136:  IF (R[292]=0) THEN ;
      314:  LBL[50] ;
 315:  R[157]=50    ;
 :;

 :! define end point!
 139:  CALL PB_SYNCE    ;
 140:  ENDIF ;
 141:   ;
 
 158:   ;

 174:   ;
 175:  !-------------------------------- ;
 176:  !Robot 1 folds first ;
 177:  !-------------------------------- ;
  201:  IF (R[158]<0) THEN ;
       314:  LBL[60] ;
 315:  R[157]=60    ;
 203:   ;
  212:  run FOLD1    ;
   211:  R[163]=0    ;
    214:  R[158]=(-2)    ;
  :;
 204:  ! weld R3 ;
 206:  R[113]=1    ;
 207:  CALL ARCSET3    ;
 208:  Call PB_SINGLE32 ;

:;
 264:  LBL[61] ;
 265:  R[157]=61    ;
  247:  R[113]=0    ;
 267:  CALL ARCSET3    ;
 :;
  212:  CALL FOLD3    ;
 210:   ;
 211:  R[164]=0    ;

 214:  R[159]=(-2)    ;
 215:  R[164]=0    ;
 217:  WAIT DO[103]=OFF    ;
  193:  WAIT DO[101]=OFF    ;
 :;
 :jmp lbl[999];
 218:   ;
 220:  ENDIF ;
 198:  !-------------------------------- ;
 199:  !Robot 3 folds ;
 200:  !-------------------------------- ;
 201:  IF (R[159]<0) THEN ;
       314:  LBL[70] ;
 315:  R[157]=70    ;
 203:   ;
  212:  run FOLD3    ;
   211:  R[164]=0    ;
  :;
 204:  ! weld R1 ;
 206:  R[113]=1    ;
 207:  CALL ARCSET1    ;
 208:  Call PB_SINGLE12 ;

:;
 264:  LBL[81] ;
 265:  R[157]=81    ;
  247:  R[113]=0    ;
 267:  CALL ARCSET1    ;
 :;
  212:  CALL FOLD1    ;
 210:   ;
 211:  R[164]=0    ;

 214:  R[159]=(-2)    ;
 215:  R[164]=0    ;
 217:  WAIT DO[103]=OFF    ;
  193:  WAIT DO[101]=OFF    ;
 
 218:   ;
 220:  ENDIF ;

 231:   ;
     314:  LBL[999] ;
 
/POS
/END

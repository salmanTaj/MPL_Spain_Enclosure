/PROG  PRG_CALC1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2651;
CREATE		= DATE 17-06-12  TIME 10:16:06;
MODIFIED	= DATE 18-11-23  TIME 09:53:18;
FILE_NAME	= PGR_CALC;
VERSION		= 0;
LINE_COUNT	= 116;
MEMORY_SIZE	= 2943;
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
   1:  !************************** ;
   2:  !** Angle  Calculation ;
   3:  !************************** ;
   4:   ;
   5:  !--  PB Normal ;
   6:  PR[21:DH nor]=PR[43:FUT_000]    ;
   7:  PR[21,4:DH nor]=0    ;
   8:  PR[21,5:DH nor]=45+R[181:W. ang 2]    ;
   9:  PR[21,6:DH nor]=0    ;
  10:   ;
  11:  !--  PB Normal  Enclosure Test ;
  12:  PR[29:WeldAng 09]=PR[43:FUT_000]    ;
  13:  PR[29,4:WeldAng 09]=0    ;
  14:  PR[29,5:WeldAng 09]=45+R[181:W. ang 2]    ;
  15:  PR[29,6:WeldAng 09]=(-45)    ;
  16:   ;
  17:  !flange side ;
  18:  //IF (R[253:Flange1]=2),R[258:Low ang1]=(1) ;
  19:   ;
  20:  IF (R[258:Low ang1]=1) THEN ;
  21:  !--  PB low ;
  22:  PR[21:DH nor]=PR[43:FUT_000]    ;
  23:  PR[21,4:DH nor]=45+R[181:W. ang 2]    ;
  24:  PR[21,5:DH nor]=R[182:W. ang 3]    ;
  25:  PR[21,6:DH nor]=(-90)+R[183:W. ang 4]    ;
  26:  ENDIF ;
  27:   ;
  28:  ! UF 1 setting ;
  29:  IF ((R[221:Tasknr1]=18) AND (R[70:TP step]=51)),PR[21,6:DH nor]=PR[21,6:DH nor]+R[80:Pro ang] ;
  30:   ;
  31:  !--  PB corner 1+2 ;
  32:  PR[23:VU]=PR[43:FUT_000]    ;
  33:  PR[23,4:VU]=0    ;
  34:  PR[23,5:VU]=50    ;
  35:  PR[23,6:VU]=45    ;
  36:   ;
  37:  !--  PB corner 3 ;
  38:  PR[24:WeldAng 04]=PR[43:FUT_000]    ;
  39:  PR[24,4:WeldAng 04]=0    ;
  40:  PR[24,5:WeldAng 04]=50    ;
  41:  PR[24,6:WeldAng 04]=45    ;
  42:   ;
  43:  !--  PB web mid ;
  44:  PR[25:WeldAng 05]=PR[43:FUT_000]    ;
  45:  PR[25,4:WeldAng 05]=0    ;
  46:  PR[25,5:WeldAng 05]=55    ;
  47:  PR[25,6:WeldAng 05]=45    ;
  48:   ;
  49:  IF (R[259]=1) THEN ;
  50:  !--  PB web mid ;
  51:  PR[25:WeldAng 05]=PR[43:FUT_000]    ;
  52:  PR[25,4:WeldAng 05]=(-48.84)+R[181:W. ang 2]    ;
  53:  PR[25,5:WeldAng 05]=(-20)    ;
  54:  PR[25,6:WeldAng 05]=158.6+R[183:W. ang 4]    ;
  55:  ENDIF ;
  56:   ;
  57:  !--  PB web ;
  58:  PR[26:WeldAng 06]=PR[43:FUT_000]    ;
  59:  PR[26,4:WeldAng 06]=0    ;
  60:  PR[26,5:WeldAng 06]=45    ;
  61:  PR[26,6:WeldAng 06]=90    ;
  62:   ;
  63:  IF (R[259]=1) THEN ;
  64:  !--  PB web low ;
  65:  PR[26:WeldAng 06]=PR[44:FUT_001]    ;
  66:  PR[26,4:WeldAng 06]=(-45)+R[181:W. ang 2]    ;
  67:  PR[26,5:WeldAng 06]=R[182:W. ang 3]    ;
  68:  PR[26,6:WeldAng 06]=180+R[183:W. ang 4]    ;
  69:  ENDIF ;
  70:   ;
  71:  !--  PF ;
  72:  PR[28:WeldAng 08]=PR[43:FUT_000]    ;
  73:  PR[28,4:WeldAng 08]=0    ;
  74:  PR[28,5:WeldAng 08]=90    ;
  75:  PR[28,6:WeldAng 08]=45    ;
  76:   ;
  77:  ! if profile in X dir ;
  78:  IF (R[81:X/Y retning]=1) THEN ;
  79:  FOR R[134:Calc free 1]=21 TO 29 ;
  80:  PR[R[134],4]=(0+(PR[R[134],4]*R[95:SE]*R[82:X +- dir]*1)) ;
  81:  PR[R[134],4]=PR[R[134],4]*R[179:Swap angl]    ;
  82:  PR[R[134],6]=((-90)+(PR[R[134],6]*R[95:SE]*R[82:X +- dir]*(-1))) ;
  83:  PR[R[134],6]=PR[R[134],6]*R[179:Swap angl]    ;
  84:   ;
  85:  ENDFOR ;
  86:   ;
  87:  ! changing again for low angle ;
  88:  IF ((R[258:Low ang1]=1) AND (R[82:X +- dir]=(-1)) AND (R[95:SE]=(-1))) THEN ;
  89:  !--  PB low ;
  90:  PR[21,4:DH nor]=PR[21,4:DH nor]-90    ;
  91:  PR[21,6:DH nor]=PR[21,6:DH nor]-180    ;
  92:  ENDIF ;
  93:   ;
  94:  ELSE ;
  95:  ! if profile in Y dir ;
  96:  FOR R[134:Calc free 1]=21 TO 29 ;
  97:  PR[R[134],4]=(0+(PR[R[134],4]*R[95:SE]*R[83:Y +- dir]*1)) ;
  98:  PR[R[134],6]=((0+(PR[R[134],6]*R[95:SE]*R[83:Y +- dir]*(-1)))) ;
  99:  ENDFOR ;
 100:  ENDIF ;
 101:  !************************** ;
 102:  !** Offset  Calculation ;
 103:  !************************** ;
 104:  ! if profile in X dir ;
 105:  IF (R[81:X/Y retning]=1) THEN ;
 106:  !X-offset ;
 107:  R[141:X TP1]=R[141:X TP1]*R[95:SE]*R[82:X +- dir]    ;
 108:  R[142:Y TP1]=R[142:Y TP1]*(-1)*R[179:Swap angl]    ;
 109:  ELSE ;
 110:  ! if profile in Y dir ;
 111:  R[134:Calc free 1]=R[141:X TP1]    ;
 112:  R[141:X TP1]=R[142:Y TP1]*1    ;
 113:  R[142:Y TP1]=R[134:Calc free 1]*R[95:SE]*R[83:Y +- dir]    ;
 114:  ENDIF ;
 115:   ;
 116:   ;
/POS
/END

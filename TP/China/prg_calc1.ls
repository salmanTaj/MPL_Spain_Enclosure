/PROG  PRG_CALC1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2333;
CREATE		= DATE 17-06-12  TIME 10:16:06;
MODIFIED	= DATE 18-02-27  TIME 15:11:36;
FILE_NAME	= PGR_CALC;
VERSION		= 0;
LINE_COUNT	= 102;
MEMORY_SIZE	= 2681;
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
   2:  !** Angle  Calc China ;
   3:  !************************** ;
   4:   ;
   5:  !--  PB Normal ;
   6:  PR[21]=PR[43]    ;
   7:  PR[21,4]=0    ;
   8:  PR[21,5]=48 +R[181]   ;
   9:  PR[21,6]=0    ;
  10:   ;
  11:  !flange side ;
  12:  //IF (R[253]=2),R[258]=(1) ;
  13:   ;
  14:  IF (R[258]=1) THEN ;
  15:  !--  PB low ;
  16:  PR[21]=PR[43]    ;
  17:  PR[21,4]=48+R[181]    ;
  18:  PR[21,5]=R[182]    ;
  19:  PR[21,6]=(-90)+R[183]    ;
  20:  ENDIF ;
  21:   ;
  22:  ! UF 1 setting ;
  23:  IF ((R[221]=18) AND (R[70]=51)),PR[21,6]=PR[21,6]+R[80] ;
  24:   ;
  25:  !--  PB corner 1+2 ;
  26:  PR[23]=PR[43]    ;
  27:  PR[23,4]=0    ;
  28:  PR[23,5]=50    ;
  29:  PR[23,6]=45    ;
  30:   ;
  31:  !--  PB corner 3 ;
  32:  PR[24]=PR[43]    ;
  33:  PR[24,4]=0    ;
  34:  PR[24,5]=50    ;
  35:  PR[24,6]=45    ;
  36:   ;
  37:  !--  PB web mid ;
  38:  PR[25]=PR[43]    ;
  39:  PR[25,4]=0    ;
  40:  PR[25,5]=55    ;
  41:  PR[25,6]=45    ;
  42:   ;
  43:  IF (R[259]=1) THEN ;
  44:  !--  PB web mid ;
  45:  PR[25]=PR[43]    ;
  46:  PR[25,4]=(-48.84)+R[181]    ;
  47:  PR[25,5]=(-20)    ;
  48:  PR[25,6]=158.6+R[183]    ;
  49:  ENDIF ;
  50:   ;
  51:  !--  PB web ;
  52:  PR[26]=PR[43]    ;
  53:  PR[26,4]=0    ;
  54:  PR[26,5]=48    ;
  55:  PR[26,6]=90    ;
  56:   ;
  57:  IF (R[259]=1) THEN ;
  58:  !--  PB web low ;
  59:  PR[26]=PR[44]    ;
  60:  PR[26,4]=(-48)+R[181]    ;
  61:  PR[26,5]=R[182]    ;
  62:  PR[26,6]=180+R[183]    ;
  63:  ENDIF ;
  64:   ;
  65:  !--  PF ;
  66:  PR[28]=PR[43]    ;
  67:  PR[28,4]=0    ;
  68:  PR[28,5]=90    ;
  69:  PR[28,6]=45    ;
  70:   ;
  71:  ! if profile in X dir ;
  72:  IF (R[81]=1) THEN ;
  73:  FOR R[134]=21 TO 29 ;
  74:  PR[R[134],4]=(0+(PR[R[134],4]*R[95]*R[82]*1)) ;
  75:  PR[R[134],4]=PR[R[134],4]*R[179]    ;
  76:  PR[R[134],6]=((-90)+(PR[R[134],6]*R[95]*R[82]*(-1))) ;
  77:  PR[R[134],6]=PR[R[134],6]*R[179]    ;
  78:   ;
  79:  ENDFOR ;
  :;
   :! changing again for low angle; 
     14:  IF ((R[258]=1) and (R[82]=(-1)) and (R[95]=(-1))) THEN ;
  15:  !--  PB low ;
  17:  PR[21,4]= PR[21,4]-90;
  19:  PR[21,6]=PR[21,6]-180    ;
  20:  ENDIF ;
  :;
  80:  ELSE ;
  81:  ! if profile in Y dir ;
  82:  FOR R[134]=21 TO 29 ;
  83:  PR[R[134],4]=(0+(PR[R[134],4]*R[95]*R[83]*1)) ;
  84:  PR[R[134],6]=((0+(PR[R[134],6]*R[95]*R[83]*(-1)))) ;
  85:  ENDFOR ;
  86:  ENDIF ;
  87:  !************************** ;
  88:  !** Offset  Calculation ;
  89:  !************************** ;
  90:  ! if profile in X dir ;
  91:  IF (R[81]=1) THEN ;
  92:  !X-offset ;
  93:  R[141]=R[141]*R[95]*R[82]    ;
  94:  R[142]=R[142]*(-1)*R[179]    ;
  95:  ELSE ;
  96:  ! if profile in Y dir ;
  97:  R[134]=R[141]    ;
  98:  R[141]=R[142]*1    ;
  99:  R[142]=R[134]*R[95]*R[83]    ;
 100:  ENDIF ;
 101:   ;
 102:   ;
/POS
/END

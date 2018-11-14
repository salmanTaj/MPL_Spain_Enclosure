/PROG  PF_HISTOP3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2903;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-03-22  TIME 06:14:02;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 126;
MEMORY_SIZE	= 3327;
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
   2:  R[95]=1    ;
   3:  //R[153]=0    ;
   4:  LBL[555] ;
   5:  !************************** ;
   6:  !** WELD V/U ;
   7:  !** Close Corner ;
   8:  !************************** ;
   9:   ;
  10:  UFRAME_NUM=2 ;
  11:  UTOOL_NUM=1 ;
  12:   ;
  13:  !****************************** ;
  14:  !** I N I T I A L I S I N G  ** ;
  15:  !****************************** ;
  16:   ;
  17:  !****************************** ;
  18:  !--   ANGLE CALC  -- ;
  19:  !****************************** ;
  20:  !* FUT 000 OR FUT 00-1 (PR[43-44) ;
  21:   ;
  22:  !***  POSITION CALC START ;
  23:  R[105]=(60+(R[95]*10)) ;
  24:   ;
  25:  !***  CONFIG CALC ;
  26:  R[106]=43    ;
  27:  R[106]=(45) ;
  28:  !** -------------------  ** ;
  29:   ;
  30:   ;
  31:   ;
  32:  !****************************** ;
  33:  !**** POSITION CALC ;
  34:  !****************************** ;
  35:   ;
  36:  !-- SAFE End  POINT ;
  37:  R[145]=(-50)    ;
  38:  R[146]=75    ;
  39:  CALL PRG_CALC3    ;
  40:  R[104]=R[105]+4    ;
  41:  PR[35]=PR[28]+PR[R[104]]    ;
  42:  PR[35,1]=PR[35,1]+R[145]    ;
  43:  PR[35,2]=(PR[35,2]+R[146]) ;
  44:  PR[35,3]=PR[35,3]    ;
  45:  PR[35,5]=75    ;
  46:  !------- ;
  47:   ;
  48:  !------- ;
  49:   ;
  50:  !--  WELDING  POINT 5 ;
  51:  R[104]=R[105]+4    ;
  52:  PR[5]=PR[R[104]]+PR[28]    ;
  53:  PR[5,3]=PR[5,3]-40    ;
  54:  IF (PR[5,3]-PR[3,3]<0),JMP LBL[241] ;
  55:  PR[5,5]=90    ;
  56:  !if flange ;
  57:  IF ((R[263]=2) AND (PR[5,3]>125)),PR[5,5]=100 ;
  58:  !------- ;
  59:   ;
  60:  !-- WELDING  POINT 6 ;
  61:  PR[6]=PR[R[104]]+PR[28]    ;
  62:  PR[6,3]=PR[6,3]-0    ;
  63:  PR[6,5]=100    ;
  64:  !low profiles ;
  65:  IF (PR[5,3]-PR[3,3]<30) THEN ;
  66:  PR[6,5]=90    ;
  67:  PR[5]=PR[6]    ;
  68:  ENDIF ;
  69:  !------- ;
  70:   ;
  71:  !****************************** ;
  72:  !****    R E S U M I N G   **** ;
  73:  !****************************** ;
  74:   ;
  75:   ;
  76:  !-- AT RESUME JMP TO LABEL ;
  77:  IF R[153]>100,JMP LBL[R[153]] ;
  78:   ;
  79:  !ARCSENSOR START COUNT AT START ;
  80:  $TAST_PARAM[7].$SAMP_ST_Z=5 ;
  81:  !****************************** ;
  82:   ;
  83:   ;
  84:   ;
  85:  !****************************** ;
  86:  !--   W E L D I N G  -- ;
  87:   ;
  88:  !-- 1. WELDING MOTION ;
  89:   ;
  90:   ;
  91:  LBL[210] ;
  92:  R[153]=210    ;
  93:   ;
  94:  Weave Sine[3] ;
  95:  Track TAST[R[23]] ;
  96:  Weld Start E2[1,R[112],E0] ;
  97:L PR[5] R[127]cm/min CNT100    ;
  98:   ;
  99:  !---------------------------- ;
 100:   ;
 101:  !-- 2. WELDING MOTION ;
 102:   ;
 103:  LBL[240] ;
 104:  R[153]=240    ;
 105:   ;
 106:  Weave Sine[3] ;
 107:  Track TAST[R[23]] ;
 108:  Weld Start E2[1,R[112],E0] ;
 109:   ;
 110:L PR[6] R[127]cm/min FINE    ;
 111:   ;
 112:  LBL[241] ;
 113:  R[153]=241    ;
 114:  Weave End ;
 115:  Track End ;
 116:  Weld End E2[1,R[112]] ;
 117:   ;
 118:L PR[35] 250mm/sec FINE    ;
 119:   ;
 120:   ;
 121:  !---------------------------- ;
 122:   ;
 123:   ;
 124:  !****************************** ;
 125:  !--   E N D I N G    P R G.  -- ;
 126:   ;
/POS
/END

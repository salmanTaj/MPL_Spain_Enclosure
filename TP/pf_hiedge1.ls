/PROG  PF_HIEDGE1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 3097;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-05-28  TIME 07:26:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 136;
MEMORY_SIZE	= 3609;
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
   1:  JMP LBL[555] ;
   2:  R[95]=(-1)    ;
   3:  //R[151]=0    ;
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
  23:  R[102]=(60+(R[95]*10)) ;
  24:   ;
  25:  !***  CONFIG CALC ;
  26:  R[103]=43    ;
  27:  R[103]=(45) ;
  28:  !** -------------------  ** ;
  29:   ;
  30:   ;
  31:   ;
  32:  !****************************** ;
  33:  !**** POSITION CALC ;
  34:  !****************************** ;
  35:   ;
  36:  !-- SAFE End  POINT ;
  37:  R[141]=(-50)    ;
  38:  R[142]=75    ;
  39:  CALL PRG_CALC1    ;
  40:  R[101]=R[102]+4    ;
  41:  PR[35]=PR[28]+PR[R[101]]    ;
  42:  PR[35,1]=PR[35,1]+R[141]    ;
  43:  PR[35,2]=(PR[35,2]+R[142]) ;
  44:  PR[35,3]=PR[35,3]    ;
  45:  PR[35,5]=80    ;
  46:  !------- ;
  47:   ;
  48:  !------- ;
  49:   ;
  50:  !--  WELDING  POINT 5 ;
  51:  R[101]=R[102]+4    ;
  52:  PR[5]=PR[R[101]]+PR[28]    ;
  53:  PR[5,3]=PR[5,3]+4    ;
  54:  !Checking length of weld ;
  55:  !to avoid collision ;
  56:  R[134]=PR[5,3]-PR[1,3]    ;
  57:   ;
  58:  IF (R[134]<90),PR[5,5]=(80) ;
  59:  !------- ;
  60:   ;
  61:  !-- WELDING  POINT 6 ;
  62:  PR[6]=PR[5]    ;
  63:  R[141]=2    ;
  64:  R[142]=R[14]/1.3*(-1)    ;
  65:   ;
  66:  !if closing over side profile. sw ;
  67:  IF (R[256]=5) THEN ;
  68:  R[134]=R[141]    ;
  69:  R[141]=R[142]*(-1)    ;
  70:  R[142]=R[134]*(-1)    ;
  71:  ENDIF ;
  72:   ;
  73:  CALL PRG_CALC1    ;
  74:  PR[6,1]=PR[6,1]+R[141]    ;
  75:  PR[6,2]=PR[6,2]+R[142]    ;
  76:   ;
  77:  PR[6,3]=PR[6,3]+2    ;
  78:  PR[6,5]=80    ;
  79:  !------- ;
  80:   ;
  81:  !****************************** ;
  82:  !****    R E S U M I N G   **** ;
  83:  !****************************** ;
  84:   ;
  85:   ;
  86:  !-- AT RESUME JMP TO LABEL ;
  87:  IF R[151]>100,JMP LBL[R[151]] ;
  88:   ;
  89:  !ARCSENSOR START COUNT AT START ;
  90:  $TAST_PARAM[7].$SAMP_ST_Z=5 ;
  91:  !****************************** ;
  92:   ;
  93:   ;
  94:   ;
  95:  !****************************** ;
  96:  !--   W E L D I N G  -- ;
  97:   ;
  98:  !-- 1. WELDING MOTION ;
  99:   ;
 100:   ;
 101:  LBL[210] ;
 102:  R[151]=210    ;
 103:   ;
 104:  Weave Sine[1] ;
 105:  Track TAST[R[21]] ;
 106:  Weld Start E1[1,R[111],E0] ;
 107:L PR[5] R[126]cm/min CNT100    ;
 108:   ;
 109:  !---------------------------- ;
 110:   ;
 111:  !-- 2. WELDING MOTION ;
 112:   ;
 113:  LBL[240] ;
 114:  R[151]=240    ;
 115:   ;
 116:  Weave Sine[1] ;
 117:  Track TAST[R[21]] ;
 118:  Weld Start E1[1,R[111],E0] ;
 119:   ;
 120:   ;
 121:  Weave End ;
 122:L PR[6] R[126]cm/min FINE DB   15.0mm,GO[3]=10    ;
 123:  Track End ;
 124:  Weld End E1[1,R[111]] ;
 125:   ;
 126:  LBL[241] ;
 127:  R[151]=241    ;
 128:L PR[35] 250mm/sec FINE    ;
 129:   ;
 130:   ;
 131:  !---------------------------- ;
 132:   ;
 133:   ;
 134:  !****************************** ;
 135:  !--   E N D I N G    P R G.  -- ;
 136:   ;
/POS
/END
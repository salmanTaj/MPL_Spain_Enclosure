/PROG  PB_WEMID3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2245;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-10-15  TIME 21:48:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 100;
MEMORY_SIZE	= 2741;
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
   2:  //R[153]=0    ;
   3:  LBL[555] ;
   4:  !************************** ;
   5:  !**  Start under scallop ;
   6:  !************************** ;
   7:   ;
   8:  UFRAME_NUM=2 ;
   9:  UTOOL_NUM=1 ;
  10:  Weave End ;
  11:  Track End ;
  12:   ;
  13:   ;
  14:  !-- AT RESUME JMP TO LABEL ;
  15:  IF ((R[153]>0)),JMP LBL[R[153]] ;
  16:   ;
  17:   ;
  18:  !****************************** ;
  19:  !--   ANGLE CALC  -- ;
  20:  !****************************** ;
  21:  !* FUT 000 OR FUT 00-1 (PR[43-44) ;
  22:   ;
  23:  !***  POSITION CALC START ;
  24:  R[105]=(60+(R[95]*10)) ;
  25:   ;
  26:  !***  CONFIG CALC ;
  27:  R[106]=43    ;
  28:  IF (R[95]=(1)),R[106]=(45) ;
  29:   ;
  30:  CALL PRG_CALC3    ;
  31:   ;
  32:  !**************************** ;
  33:  !**** PB web start mid ;
  34:  !**** POSITION CALC & WELDING ;
  35:  !**************************** ;
  36:   ;
  37:  !-- SAFE START  POINT ;
  38:  R[145]=(-50)    ;
  39:  R[146]=50    ;
  40:  CALL PRG_CALC3    ;
  41:  R[104]=R[105]+11    ;
  42:  PR[35]=PR[25]+PR[R[104]]    ;
  43:  PR[35,1]=PR[35,1]+R[145]    ;
  44:  PR[35,2]=PR[35,2]+R[146]    ;
  45:  PR[35,3]=PR[35,3]+20    ;
  46:  !7 axis ;
  47:  IF (R[268]=1 AND R[81]=2) THEN ;
  48:  PR[35,7]=(PR[35,7]+200*R[83]*R[179]) ;
  49:  ENDIF ;
  50:  !------- ;
  51:   ;
  52:  !--  WELDING  POINT 1 ;
  53:  R[145]=0    ;
  54:  R[146]=(-5)    ;
  55:  ! start out for corner ;
  56:  IF (R[267]=1),R[146]=50 ;
  57:  CALL PRG_CALC3    ;
  58:  R[104]=R[105]+11    ;
  59:  PR[1]=PR[25]+PR[R[104]]    ;
  60:  PR[1,1]=PR[1,1]+R[145]    ;
  61:  PR[1,2]=PR[1,2]+R[146]    ;
  62:  !7 axis ;
  63:  IF (R[268]=1 AND R[81]=2) THEN ;
  64:  PR[1,7]=(PR[1,7]+200*R[83]*R[179]) ;
  65:  ENDIF ;
  66:  !------- ;
  67:   ;
  68:   ;
  69:  !resetting angles ;
  70:  R[191]=0    ;
  71:  R[192]=0    ;
  72:  R[193]=0    ;
  73:  CALL PRG_CALC3    ;
  74:  R[268]=R[190]    ;
  75:   ;
  76:  !---------------------------- ;
  77:  ! ***** WELDING ***** ;
  78:   ;
  79:  !-- MOVE TO SAFE START ;
  80:   ;
  81:  IF (R[139]=0) THEN ;
  82:L PR[35] 150mm/sec CNT50    ;
  83:  ELSE ;
  84:L PR[35] 50mm/sec FINE    ;
  85:  ENDIF ;
  86:   ;
  87:  !** -------------------  ** ;
  88:   ;
  89:  !-- MOVE TO WELD START ;
  90:  R[164]=1    ;
  91:   ;
  92:  LBL[11] ;
  93:  R[153]=11    ;
  94:   ;
  95:L PR[1] 150mm/sec FINE    ;
  96:   ;
  97:  LBL[999] ;
  98:  //R[153]=0    ;
  99:   ;
 100:  LBL[1000] ;
/POS
/END
/PROG  PB_MID1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2019;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-07-15  TIME 09:16:28;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 89;
MEMORY_SIZE	= 2431;
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
   2:  R[151]=0    ;
   3:  LBL[555] ;
   4:  !************************** ;
   5:  !** Start middle of profile ;
   6:  !************************** ;
   7:   ;
   8:  UFRAME_NUM=2 ;
   9:  UTOOL_NUM=1 ;
  10:  Weave End ;
  11:  Track End ;
  12:   ;
  13:   ;
  14:  !-- AT RESUME JMP TO LABEL ;
  15:  IF ((R[151]>0)),JMP LBL[R[151]] ;
  16:   ;
  17:   ;
  18:  !****************************** ;
  19:  !--   ANGLE CALC  -- ;
  20:  !****************************** ;
  21:  !* FUT 000 OR FUT 00-1 (PR[43-44) ;
  22:   ;
  23:  !***  POSITION CALC START ;
  24:  R[102]=(60+(R[95]*10)) ;
  25:   ;
  26:  !***  CONFIG CALC ;
  27:  R[103]=43    ;
  28:  IF (R[95]=(1)),R[103]=(45) ;
  29:   ;
  30:  CALL PRG_CALC1    ;
  31:   ;
  32:  !**************************** ;
  33:  !**** Start middle of profile ;
  34:  !**** POSITION CALC & WELDING ;
  35:  !**************************** ;
  36:   ;
  37:  !-- SAFE START  POINT ;
  38:  R[141]=0    ;
  39:  R[142]=50    ;
  40:  R[101]=R[102]+1    ;
  41:  PR[35]=PR[21]+PR[R[101]]    ;
  42:  IF (R[254]=8) THEN ;
  43:  PR[35]=PR[23]+PR[R[101]]    ;
  44:  R[141]=(-40)    ;
  45:  R[142]=30    ;
  46:  ENDIF ;
  47:  CALL PRG_CALC1    ;
  48:  PR[35,1]=PR[35,1]+R[141]    ;
  49:  PR[35,2]=PR[35,2]+R[142]    ;
  50:  PR[35,3]=PR[35,3]+20    ;
  51:  !------- ;
  52:   ;
  53:  !--  WELDING  POINT 1 ;
  54:  !profile thickness ;
  55:  R[141]=(-15)    ;
  56:  R[142]=0    ;
  57:  R[101]=R[102]+1    ;
  58:  PR[1]=PR[21]+PR[R[101]]    ;
  59:  !type 8 ;
  60:  IF (R[254]=8) THEN ;
  61:  PR[1]=PR[23]+PR[R[101]]    ;
  62:  R[141]=10    ;
  63:  ENDIF ;
  64:  CALL PRG_CALC1    ;
  65:  PR[1,1]=PR[1,1]+R[141]    ;
  66:  PR[1,2]=PR[1,2]+R[142]    ;
  67:  PR[1,3]=PR[1,3]    ;
  68:  !------- ;
  69:   ;
  70:  !---------------------------- ;
  71:  ! ***** WELDING ***** ;
  72:   ;
  73:  !-- MOVE TO SAFE START ;
  74:   ;
  75:L PR[35] 150mm/sec CNT50    ;
  76:   ;
  77:  !** -------------------  ** ;
  78:   ;
  79:  !-- MOVE TO WELD START ;
  80:  R[163]=1    ;
  81:   ;
  82:  LBL[11] ;
  83:  R[151]=11    ;
  84:   ;
  85:L PR[1] 150mm/sec FINE    ;
  86:   ;
  87:  LBL[999] ;
  88:  //R[151]=0    ;
  89:   ;
/POS
/END

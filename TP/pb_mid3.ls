/PROG  PB_MID3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2461;
CREATE		= DATE 17-06-29  TIME 15:42:28;
MODIFIED	= DATE 18-10-16  TIME 12:55:14;
FILE_NAME	= PB_MID1;
VERSION		= 0;
LINE_COUNT	= 106;
MEMORY_SIZE	= 2933;
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
  33:  !**** Start middle of profile ;
  34:  !**** POSITION CALC & WELDING ;
  35:  !**************************** ;
  36:   ;
  37:  !-- SAFE START  POINT ;
  38:  R[145]=0    ;
  39:  R[146]=50    ;
  40:  R[104]=R[105]+1    ;
  41:  PR[35]=PR[21]+PR[R[104]]    ;
  42:  IF (R[264]=8) THEN ;
  43:  PR[35]=PR[23]+PR[R[104]]    ;
  44:  R[145]=(-40)    ;
  45:  R[146]=30    ;
  46:  ENDIF ;
  47:  CALL PRG_CALC3    ;
  48:  PR[35,1]=PR[35,1]+R[145]    ;
  49:  PR[35,2]=PR[35,2]+R[146]    ;
  50:  PR[35,3]=PR[35,3]+20    ;
  51:  !------- ;
  52:   ;
  53:  !--  WELDING  POINT 1 ;
  54:  !profile thickness ;
  55:  R[145]=(-15)    ;
  56:  R[146]=0    ;
  57:  R[104]=R[105]+1    ;
  58:  PR[1]=PR[21]+PR[R[104]]    ;
  59:  IF (R[264]=8) THEN ;
  60:  PR[1]=PR[23]+PR[R[104]]    ;
  61:  R[145]=10    ;
  62:  ENDIF ;
  63:  CALL PRG_CALC3    ;
  64:  PR[1,1]=PR[1,1]+R[145]    ;
  65:  PR[1,2]=PR[1,2]+R[146]    ;
  66:  PR[1,3]=PR[1,3]    ;
  67:  !------- ;
  68:   ;
  69:  !---------------------------- ;
  70:  ! ***** WELDING ***** ;
  71:   ;
  72:  !-- MOVE TO SAFE START ;
 
  87:   ;
  88:L PR[35] 150mm/sec CNT50    ;
  89:   ;
  90:  !** -------------------  ** ;
  91:   ;
  92:  !-- MOVE TO WELD START ;
  93:  R[164]=1    ;
  94:   ;
  95:  LBL[11] ;
  96:  R[153]=11    ;
  97:   ;
  98:L PR[1] 150mm/sec FINE    ;
  99:   ;
   181:  ! wait for R1 to move away ;
 : if (R[290]=0) then; 
 182:  WAIT (R[468]>R[93] OR R[221]>24)    ;
  :endif;
  :;
 104:  LBL[999] ;
 105:  //R[153]=0    ;
 106:   ;
/POS
/END

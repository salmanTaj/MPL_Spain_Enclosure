/PROG  SCANNING
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1897;
CREATE		= DATE 17-05-26  TIME 13:02:20;
MODIFIED	= DATE 18-03-10  TIME 16:26:18;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 83;
MEMORY_SIZE	= 2389;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,1,*,*,*;
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
   1:  !Start scanners ;
   2:  IF (R[491]=1) THEN ;
   3:  WAIT   2.00(sec) ;
   4:  JMP LBL[999] ;
   5:  ENDIF ;
   6:   ;
   7:  R[320]=(-10)    ;
   8:  WAIT   1.00(sec) ;
   9:   ;
  10:  DO[130]=ON ;
  11:  TIMER[5]=STOP ;
  12:  TIMER[5]=RESET ;
  13:  TIMER[5]=START ;
  14:  R[342]=1    ;
  15:   ;
  16:  !Check that robots are folded ;
  17:  R[134]=$SCR_GRP[1].$MCH_POS_Z ;
  18:  R[137]=$SCR_GRP[3].$MCH_POS_Z ;
  19:   ;
  20:  IF (R[134]>(-600)) OR (R[137]>(-600)) THEN ;
  21:  !Error-> should not be possible ;
  22:  ABORT ;
  23:  ENDIF ;
  24:   ;
  25:  !check where to start scanning: ;
  26:  PR[121]=LPOS    ;
  27:  IF (R[323]=0),R[323]=(PR[121,1]) ;
  28:   ;
  29:  !Determind end point for scanning ;
  30:  !check for active zones ;
  31:  !Zone 1 ;
  32:  IF (R[495]=21232) THEN ;
  33:  IF ((R[351]=1) AND (R[352]=0)) THEN ;
  34:  R[134]=12184    ;
  35:  ENDIF ;
  36:   ;
  37:  !Zone 2 ;
  38:  IF ((R[351]=0) AND (R[352]=1)) THEN ;
  39:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
  40:  ENDIF ;
  41:   ;
  42:  !Zone 3 ;
  43:  IF ((R[351]=1) AND (R[352]=1)) THEN ;
  44:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
  45:  ENDIF ;
  46:   ;
  47:  ELSE ;
  48:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
  49:  ENDIF ;
  50:  PR[122]=LPOS    ;
  51:   ;
  52:  PR[122,1]=R[134]-1    ;
  53:   ;
  54:  !go to start point ;
  55:  !  PR[121,1]=10045 ;
  56:L PR[121] 250mm/sec FINE    ;
  57:   ;
  58:  !checking if scanners are started ;
  59:  WAIT (TIMER[5]>15)    ;
  60:  R[320]=1    ;
  61:  WAIT R[329]=3    ;
  62:  TIMER[5]=STOP ;
  63:  R[340]=TIMER[5]    ;
  64:  R[342]=0    ;
  65:   ;
  66:  SKIP CONDITION R[320]<>1 OR R[329]>=7    ;
  67:   ;
  68:L PR[122] 30mm/sec FINE Skip,LBL[2]    ;
  69:  !store position for next panel ;
  70:  PR[125]=LPOS    ;
  71:  R[323]=(PR[125,1]-(R[324]/2)) ;
  72:  JMP LBL[3] ;
  73:  !at end of line ;
  74:  LBL[2] ;
  75:  R[320]=0    ;
  76:  R[323]=(-1)    ;
  77:   ;
  78:  LBL[3] ;
  79:  //WAIT ((R[328]=100) AND (R[329]=100) AND (R[330]=100))    ;
  80:  WAIT R[329]>=100 AND R[329]<=105    ;
  81:  LBL[999] ;
  82:  WAIT  10.00(sec) ;
  83:  DO[130]=OFF ;
/POS
/END

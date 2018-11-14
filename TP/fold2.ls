/PROG  FOLD2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1791;
CREATE		= DATE 17-07-02  TIME 13:19:04;
MODIFIED	= DATE 18-05-03  TIME 08:31:50;
FILE_NAME	= HOME_POS;
VERSION		= 0;
LINE_COUNT	= 66;
MEMORY_SIZE	= 2219;
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
  ARC Welding Equipment : *,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  !Check that robots are folded ;
   2:  R[134]=$SCR_GRP[1].$MCH_POS_Z ;
   3:  R[137]=$SCR_GRP[3].$MCH_POS_Z ;
   4:   ;
   5:  IF (R[134]>(-600)) OR (R[137]>(-600)) THEN ;
   6:  !Error-> should not be possible ;
   7:  ABORT ;
   8:  ENDIF ;
   9:   ;
  10:  ! ******************************* ;
  11:  IF (R[213]=11) THEN ;
  12:  !Move robot to gantry start pos ;
  13:  !check for active zones ;
  14:  !Zone 1 ;
  15:  IF ((R[351]=1) AND (R[352]=0)) THEN ;
  16:  R[134]=0    ;
  17:  ENDIF ;
  18:   ;
  19:  !Zone 2 ;
  20:  IF ((R[351]=0) AND (R[352]=1)) THEN ;
  21:  R[134]=15543    ;
  22:  ENDIF ;
  23:   ;
  24:  !Zone 3 ;
  25:  IF ((R[351]=1) AND (R[352]=1)) THEN ;
  26:  R[134]=0    ;
  27:  ENDIF ;
  28:  ! other than spain ;
  29:  IF (R[495]<>21232) THEN ;
  30:  R[134]=$param_group[2].$lowerlims[1] ;
  31:  ENDIF ;
  32:   ;
  33:  PR[120]=JPOS    ;
  34:  PR[GP2:120,1]=R[134]+1    ;
  35:  ENDIF ;
  36:  ! ******************************* ;
  37:  IF (R[213]=12) THEN ;
  38:  !Move robot to gantry End pos ;
  39:  !check for active zones ;
  40:  !Zone 1 ;
  41:  IF (R[495]=21232) THEN ;
  42:  IF ((R[351]=1) AND (R[352]=0)) THEN ;
  43:  R[134]=12184    ;
  44:  ENDIF ;
  45:   ;
  46:  !Zone 2 ;
  47:  IF ((R[351]=0) AND (R[352]=1)) THEN ;
  48:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
  49:  ENDIF ;
  50:   ;
  51:  !Zone 3 ;
  52:  IF ((R[351]=1) AND (R[352]=1)) THEN ;
  53:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
  54:  ENDIF ;
  55:   ;
  56:  ELSE ;
  57:  ! no zone divertion ;
  58:  R[134]=$PARAM_GROUP[2].$UpperLIMS[1] ;
  59:  ENDIF ;
  60:   ;
  61:  PR[120]=JPOS    ;
  62:  PR[GP2:120,1]=R[134]-1    ;
  63:  ENDIF ;
  64:   ;
  65:  ! ******************************* ;
  66:L PR[120] 250mm/sec FINE    ;
/POS
/END

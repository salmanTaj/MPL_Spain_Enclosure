/PROG  BL_POSE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4451;
CREATE		= DATE 17-09-29  TIME 11:48:20;
MODIFIED	= DATE 18-03-18  TIME 20:00:52;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 147;
MEMORY_SIZE	= 4811;
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
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  !****************************** ;
   2:  ! X-pro End stop position;
   3:  !****************************** ;

  30:   ;
  31:  ! IF end welding
  32:  IF ((R[221]=22) and (R[81]=1) and (R[157]>40)) THEN ;
  40:  ! Positive direction ;
  41:  !-------------------------------- ;
  42:  IF (R[82]=1) THEN ;
  43:   ;
  44:  ! --------------R1 go up--------- ;
  46:  IF (R[458]>R[461]),R[158]=(-1) ;
  48:   ;
  49:  ! --------------R3 go up--------- ;
  51:  IF (R[459]>R[463]),R[159]=(-1) ;

  53:   ;
 
  63:  ELSE ;
  64:  ! Negative direction ;
  65:  !-------------------------------- ;
  66:  ! --------------R1 go up--------- ;

  68:  IF (R[458]<R[461]),R[158]=(-1) ;

  70:   ;
  71:  ! --------------R3 go up--------- ;

  73:  IF (R[459]<R[463]),R[159]=(-1) ;

  75:   ;
  86:   ;
  87:  ENDIF ;
  88:   ;
  89:   ;
 
 147:  ENDIF ;
/POS
/END

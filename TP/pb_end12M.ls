/PROG  PB_END12M
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 601;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-03-14  TIME 13:08:22;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 20;
MEMORY_SIZE	= 1041;
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
   1:  JMP LBL[555] ;
   2:  //R[151]=0    ;
   3:  LBL[555] ;
   4:  !************************** ;
   5:  !** WELD end back with gantry ;
   6:  !************************** ;
   7:   ;
   8:  !-- AT RESUME JMP TO LABEL ;
   9:  IF ((R[151]>=200)),JMP LBL[200] ;
  10:   ;
  11:  ! start with G1 ;
  12:  CALL PB_END1    ;
  13:   ;
  14:  LBL[200] ;
  15:  R[151]=200    ;
  16:  ! Continue with G1+2 ;
  17:  CALL PB_END12    ;
  18:   ;
  19:  //R[151]=0    ;
  20:   ;
/POS
/END

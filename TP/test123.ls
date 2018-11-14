/PROG  TEST123
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 745;
CREATE		= DATE 17-04-07  TIME 10:59:28;
MODIFIED	= DATE 17-07-04  TIME 14:04:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 25;
MEMORY_SIZE	= 1041;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,1,1,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC : TRUE ; 
  ARC Welding Equipment : 1,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:L PR[1] 100mm/sec FINE    ;
   2:   ;
   3:  R[115]=1    ;
   4:  RUN WELD_PA ;
   5:  WAIT R[99]=1    ;
   6:   ;
   7:  Weld Start E1[1,1,E2] ;
   8:  Weld Start E2[1,1,E1] ;
   9:  //Weave Sine[1] ;
  10:  //Track TAST[1] ;
  11:  //Track TAST[3] ;
  12:   ;
  13:  R[113]=3    ;
  14:  R[114]=0    ;
  15:  CALL WEA1    ;
  16:  R[114]=0    ;
  17:  CALL WEA3    ;
  18:   ;
  19:L PR[2] R[126]cm/min FINE    ;
  20:   ;
  21:  R[113]=0    ;
  22:  CALL WEA1    ;
  23:  CALL WEA3    ;
  24:  Weld End E1[1,1] ;
  25:  Weld End E2[1,1] ;
/POS
/END

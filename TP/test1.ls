/PROG  TEST1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 569;
CREATE		= DATE 17-04-06  TIME 11:58:44;
MODIFIED	= DATE 18-03-15  TIME 10:49:02;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 17;
MEMORY_SIZE	= 881;
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
   1:L PR[1] 100mm/sec FINE    ;
   2:   ;
   3:  R[115]=1    ;
   4:  R[116]=4    ;
   5:  CALL WELD_PA    ;
   6:   ;
   7:  R[113]=3    ;
   9:  CALL ARCSET1    ;
  10:   ;
  12:   ;
  13:L PR[2] R[126]cm/min FINE    ;
  14:   ;
  15:  Weld End E1[1,1] ;
  16:  Weave End ;
  17:  Track End ;
/POS
/END

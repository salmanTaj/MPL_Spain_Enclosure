/PROG  ARCOFF13
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 457;
CREATE		= DATE 17-09-20  TIME 22:44:08;
MODIFIED	= DATE 17-09-21  TIME 00:45:04;
FILE_NAME	= ARCOFF3;
VERSION		= 0;
LINE_COUNT	= 8;
MEMORY_SIZE	= 797;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,1,*,*;
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
   1:   ;
   2:L PR[12] R[126]cm/min FINE    ;
   3:   ;
   4:  Weld End E1[1,R[111]] ;
   5:  Weld End E2[1,R[112]] ;
   6:  Weave End ;
   7:  Track End ;
   8:   ;
/POS
/END
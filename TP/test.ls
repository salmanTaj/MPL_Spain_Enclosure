/PROG  TEST
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 399;
CREATE		= DATE 17-03-29  TIME 12:45:04;
MODIFIED	= DATE 17-04-03  TIME 10:53:44;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 9;
MEMORY_SIZE	= 867;
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
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  LBL[1] ;
   2:L PR[1] 250mm/sec FINE    ;
   3:  PR[2]=PR[1]    ;
   4:  PR[GP1,3:2,2]=1900    ;
   5:  PR[GP1,3:2,7]=1900    ;
   6:   ;
   7:   ;
   8:L PR[2] 250mm/sec FINE    ;
   9:  JMP LBL[1] ;
/POS
/END
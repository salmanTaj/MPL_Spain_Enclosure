/PROG  CALIB_XYZ
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 561;
CREATE		= DATE 17-09-13  TIME 22:40:08;
MODIFIED	= DATE 17-09-14  TIME 10:46:24;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 18;
MEMORY_SIZE	= 861;
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
   1:   ;
   2:  PR[121]=JPOS    ;
   3:  PR[121,7]=1    ;
   4:L PR[121] 100mm/sec FINE    ;
   5:   ;
   6:  PR[120]=LPOS    ;
   7:  PR[120,1]=0    ;
   8:  PR[120,2]=0    ;
   9:  PR[120,3]=400    ;
  10:   ;
  11:  PR[GP1:120,4]=180    ;
  12:  PR[GP1:120,5]=90    ;
  13:  PR[GP1:120,6]=180    ;
  14:  PR[GP3:120,4]=180    ;
  15:  PR[GP3:120,5]=90    ;
  16:  PR[GP3:120,6]=0    ;
  17:   ;
  18:L PR[120] 100mm/sec FINE    ;
/POS
/END

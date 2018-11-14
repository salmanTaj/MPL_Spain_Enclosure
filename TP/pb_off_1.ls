/PROG  PB_OFF_1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 369;
CREATE		= DATE 17-03-22  TIME 11:58:10;
MODIFIED	= DATE 17-12-05  TIME 20:36:26;
FILE_NAME	= Y_SYNC;
VERSION		= 0;
LINE_COUNT	= 9;
MEMORY_SIZE	= 705;
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
/MN
   1:  UFRAME_NUM=1 ;
   2:  Weave End ;
   3:  Track End ;
   4:   ;
   5:  //PR[11,4]=PR[21,4]    ;
   6:  //PR[11,5]=PR[21,5]    ;
   7:  //PR[11,6]=PR[21,6]    ;
   8:   ;
   9:L PR[11] 50mm/sec FINE    ;
/POS
/END

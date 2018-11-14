/PROG  BL_EF
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 495;
CREATE		= DATE 17-06-26  TIME 14:06:46;
MODIFIED	= DATE 17-11-06  TIME 21:43:50;
FILE_NAME	= BL_TEMP;
VERSION		= 0;
LINE_COUNT	= 11;
MEMORY_SIZE	= 823;
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
/MN
   1:  !****************************** ;
   2:  !**** BL Efficiency ;
   3:  !****************************** ;
   4:  !total time ;
   5:  IF (R[201]=3) THEN ;
   6:  TIMER[1]=START ;
   7:  ENDIF ;
   8:   ;
   9:  //!-------- Lasers lid CLOSE   ---- ;
  10:  IF (DO[249]=ON),RO[1]=(OFF) ;
  11:  IF (DO[401]=ON),RO[9]=(OFF) ;
/POS
/END

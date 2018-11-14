/PROG  A_CAL_R13_1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 533;
CREATE		= DATE 13-09-16  TIME 12:39:06;
MODIFIED	= DATE 17-12-12  TIME 22:02:14;
FILE_NAME	= AUTO_CAL;
VERSION		= 0;
LINE_COUNT	= 15;
MEMORY_SIZE	= 885;
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
  ARC Welding Equipment : 1,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  !****************************** ;
   2:  !**** R1 R3 CALIBRATION ;
   3:  !****************************** ;
   4:  OVERRIDE=100% ;
   5:   ;
   6:  CALL FOLD1    ;
   7:  CALL FOLD3    ;
   8:  CALL UNFOLD1    ;
   9:  CALL UNFOLD3    ;
  10:   ;
  11:  WAIT DO[101]=OFF    ;
  12:  WAIT DO[103]=OFF    ;
  13:   ;
  14:  CALL A_CAL_R13_2    ;
  15:   ;
/POS
/END

/PROG  TESTTEST
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 515;
CREATE		= DATE 17-06-13  TIME 12:02:36;
MODIFIED	= DATE 17-07-06  TIME 00:41:20;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 20;
MEMORY_SIZE	= 979;
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
   1:  R[2]=0    ;
   2:  LBL[1] ;
   3:  R[2]=R[2]+1    ;
   4:  //RUN ALPT3 ;
   5:  CALL ALPT1    ;
   6:  CALL ALPT2    ;
   7:  JMP LBL[1] ;
   8:   ;
   9:  R[67]=1    ;
  10:   ;
  11:  CALL FOLD1    ;
  12:  PAUSE ;
  13:  R[67]=0    ;
  14:  CALL UNFOLD1    ;
  15:   ;
  16:   ;
  17:   ;
  18:   ;
  19:   ;
  20:   ;
/POS
/END

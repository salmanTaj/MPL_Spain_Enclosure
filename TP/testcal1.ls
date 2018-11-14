/PROG  TESTCAL1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 617;
CREATE		= DATE 17-11-22  TIME 12:33:44;
MODIFIED	= DATE 17-11-22  TIME 12:34:44;
FILE_NAME	= TESTCAL;
VERSION		= 0;
LINE_COUNT	= 22;
MEMORY_SIZE	= 1049;
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
   1:  R[1]=0    ;
   2:   ;
   3:  JMP LBL[3] ;
   4:  !PR[180,1]=(-107.2) ;
   5:  !PR[180,3]=(352.934) ;
   6:   ;
   7:  !UTOOL[3]=PR[180] ;
   8:   ;
   9:   ;
  10:  LBL[2] ;
  11:  R[1]=R[1]+1    ;
  12:  CALL A_CALL1    ;
  13:  R[137]=R[1]+186    ;
  14:  PR[R[137]]=PR[180]    ;
  15:  IF R[1]<10,JMP LBL[2] ;
  16:   ;
  17:  LBL[3] ;
  18:  R[1]=R[1]+1    ;
  19:  CALL A_CALL1    ;
  20:  CALL A_CHKL1    ;
  21:  IF R[1]<10,JMP LBL[3] ;
  22:  LBL[99] ;
/POS
/END

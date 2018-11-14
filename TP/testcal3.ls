/PROG  TESTCAL3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 609;
CREATE		= DATE 17-11-22  TIME 12:33:36;
MODIFIED	= DATE 17-11-22  TIME 12:34:52;
FILE_NAME	= TESTCAL;
VERSION		= 0;
LINE_COUNT	= 21;
MEMORY_SIZE	= 1045;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,1,*,*;
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
   9:  LBL[2] ;
  10:  R[1]=R[1]+1    ;
  11:  CALL A_CALL3    ;
  12:  R[137]=R[1]+186    ;
  13:  PR[R[137]]=PR[180]    ;
  14:  IF R[1]<10,JMP LBL[2] ;
  15:   ;
  16:  LBL[3] ;
  17:  R[1]=R[1]+1    ;
  18:  CALL A_CALL3    ;
  19:  CALL A_CHKL3    ;
  20:  IF R[1]<10,JMP LBL[3] ;
  21:  LBL[99] ;
/POS
/END

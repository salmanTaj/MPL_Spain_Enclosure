/PROG  PB_SINGLE1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 663;
CREATE		= DATE 17-06-09  TIME 15:00:26;
MODIFIED	= DATE 18-08-12  TIME 22:36:12;
FILE_NAME	= START1;
VERSION		= 0;
LINE_COUNT	= 24;
MEMORY_SIZE	= 1071;
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
   1:   ;
   2:  UFRAME_NUM=1 ;
   3:  Weave Sine[1] ;
   4:  Track TAST[R[21]] ;
   5:   ;
   6:   ;
   7:  !skip if R3 is done ;
   8:  SKIP CONDITION R[159]=(-2) OR R[159]=0    ;
   9:   ;
  10:  !Calculating PR12 ;
  11:  !x direction ;
  12:  IF (R[81]=1) THEN ;
  13:  PR[12]=LPOS    ;
  14:  PR[12,1]=250*R[82]    ;
  15:  ! checking limit ;
  16:  IF (PR[12,1]<(-150)),PR[12,1]=(-150) ;
  17:  ELSE ;
  18:  !Y-direction ;
  19:  PR[12]=PR[11]    ;
  20:  ENDIF ;
  21:L PR[12] R[126]cm/min CNT99 Skip,LBL[1]    ;
  22:   ;
  23:  LBL[1] ;
  24:   ;
/POS
/END

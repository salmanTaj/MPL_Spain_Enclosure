/PROG  PB_SINGLE3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 663;
CREATE		= DATE 17-06-09  TIME 15:00:26;
MODIFIED	= DATE 18-08-12  TIME 22:36:24;
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
DEFAULT_GROUP	= *,*,1,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC : TRUE ; 
  ARC Welding Equipment : *,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:   ;
   2:  UFRAME_NUM=1 ;
   3:  Weave Sine[3] ;
   4:  Track TAST[R[23]] ;
   5:   ;
   6:   ;
   7:   ;
   8:  !skip if R1 is done ;
   9:  SKIP CONDITION R[158]=(-2) OR R[158]=0    ;
  10:   ;
  11:  !Calculating PR12 ;
  12:  !x direction ;
  13:  IF (R[81]=1) THEN ;
  14:  PR[12]=LPOS    ;
  15:  PR[12,1]=250*R[82]    ;
  16:  ! checking limit ;
  17:  IF (PR[12,1]>150),PR[12,1]=150 ;
  18:  ELSE ;
  19:  !Y-direction ;
  20:  PR[12]=PR[11]    ;
  21:  ENDIF ;
  22:   ;
  23:L PR[12] R[127]cm/min CNT99 Skip,LBL[1]    ;
  24:  LBL[1] ;
/POS
/END

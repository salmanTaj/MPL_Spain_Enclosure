/PROG  PB_MOVE123
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 911;
CREATE		= DATE 17-07-05  TIME 05:45:48;
MODIFIED	= DATE 18-08-15  TIME 14:59:04;
FILE_NAME	= PB_JUMP1;
VERSION		= 0;
LINE_COUNT	= 30;
MEMORY_SIZE	= 1195;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,1,1,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC : TRUE ; 
  ARC Welding Equipment : *,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  UFRAME_NUM=1 ;
   2:  ! store pos of robot ;
   3:  PR[120]=LPOS    ;
   4:  !Keep robot arm pos ;
   5:  R[134]=(PR[GP2:11,1]-PR[GP2:120,1]) ;
   6:  R[134]=R[134]/2    ;
   7:   ;
   8:  ! robot position ;
   9:  R[135]=$SCR_GRP[1].$MCH_POS_Z ;
  10:  R[138]=$SCR_GRP[3].$MCH_POS_Z ;
  11:   ;
  12:  IF (R[135]>300) THEN ;
  13:  PR[GP1:11,1]=PR[GP1:120,1]-R[134]    ;
  14:  ! checking limit ;
  15:  IF (PR[GP1:11,1]<(-150))PR[GP1:11,1]=(-150) ;
  16:  ELSE ;
  17:  PR[GP1:11]=PR[GP1:120]    ;
  18:  ENDIF ;
  19:   ;
  20:  IF (R[138]>300) THEN ;
  21:  PR[GP3:11,1]=PR[GP3:120,1]-R[134]    ;
  22:  ! checking limit ;
  23:  IF (PR[GP3:11,1]>150)PR[GP3:11,1]=150 ;
  24:  ELSE ;
  25:  PR[GP3:11]=PR[GP3:120]    ;
  26:  ENDIF ;
  27:   ;
  28:   ;
  29:  !Move all groups ;
  30:L PR[11] 100mm/sec FINE    ;
/POS
/END

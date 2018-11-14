/PROG  PB_END12
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1357;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-06-27  TIME 08:05:14;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 59;
MEMORY_SIZE	= 1753;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,1,*,*,*;
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
   1:  JMP LBL[555] ;
   2:  R[151]=0    ;
   3:  LBL[555] ;
   4:  !************************** ;
   5:  !** WELD end back with gantry ;
   6:  !************************** ;
   7:   ;
   8:  !skip end of T-bar slopes ;
   9:  IF ((R[289]=1) AND (R[95]=1)) THEN ;
  10:  WAIT   2.00(sec) ;
  11:  JMP LBL[999] ;
  12:  ENDIF ;
  13:   ;
  14:  !-- AT RESUME JMP TO LABEL ;
  15:  IF ((R[151]>200)),JMP LBL[R[151]] ;
  16:   ;
  17:  UFRAME_NUM=1 ;
  18:  UTOOL_NUM=1 ;
  19:   ;
  20:  LBL[201] ;
  21:  R[151]=201    ;
  22:  !Store gantry point ;
  23:  PR[18]=LPOS    ;
  24:  PR[GP2:15,1]=PR[GP2:18,1]    ;
  25:   ;
  26:  ! Calc Points ;
  27:  R[134]=PR[GP1:15,1]    ;
  28:  IF (R[134]<(-140)) THEN ;
  29:  PR[GP1:15,1]=(-120)    ;
  30:  PR[GP2:15,1]=(PR[GP2:15,1]-((-120)-R[134])) ;
  31:  ENDIF ;
  32:   ;
  33:  IF (R[134]>(300)) THEN ;
  34:  PR[GP1:15,1]=(300) ;
  35:  PR[GP2:15,1]=(PR[GP2:15,1]-((300)-R[134])) ;
  36:  ENDIF ;
  37:   ;
  38:   ;
  39:   ;
  40:  ! Weld using gantry ;
  41:  LBL[202] ;
  42:  R[151]=202    ;
  43:  Weave Sine[1] ;
  44:  Track TAST[R[21]] ;
  45:  Weld Start E1[1,R[111],E0] ;
  46:L PR[15] R[126]cm/min FINE COORD    ;
  47:  Track End ;
  48:  WAIT    .50(sec) ;
  49:  Weld End E1[1,R[111]] ;
  50:   ;
  51:  ! move back with gantry ;
  52:  PR[17]=LPOS    ;
  53:  PR[GP2:17,1]=PR[GP2:18,1]    ;
  54:L PR[17] 100mm/sec FINE COORD    ;
  55:  LBL[999] ;
  56:   ;
  57:  //R[151]=0    ;
  58:   ;
  59:  LBL[1000] ;
/POS
/END

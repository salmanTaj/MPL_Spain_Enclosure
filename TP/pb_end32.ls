/PROG  PB_END32
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1321;
CREATE		= DATE 17-06-07  TIME 12:00:00;
MODIFIED	= DATE 18-06-27  TIME 08:05:32;
FILE_NAME	= PB_END1;
VERSION		= 0;
LINE_COUNT	= 56;
MEMORY_SIZE	= 1729;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,1,1,*,*;
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
   1:  JMP LBL[555] ;
   2:  R[153]=0    ;
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
  15:  IF ((R[153]>200)),JMP LBL[R[153]] ;
  16:   ;
  17:  UFRAME_NUM=1 ;
  18:  UTOOL_NUM=1 ;
  19:   ;
  20:  LBL[201] ;
  21:  R[153]=201    ;
  22:  !Store gantry point ;
  23:  PR[18]=LPOS    ;
  24:  PR[GP2:15,1]=PR[GP2:18,1]    ;
  25:   ;
  26:  ! Calc Points ;
  27:  R[137]=PR[GP3:15,1]    ;
  28:  IF (R[137]>140) THEN ;
  29:  PR[GP3:15,1]=120    ;
  30:  PR[GP2:15,1]=(PR[GP2:15,1]+(R[137]-120)) ;
  31:  ENDIF ;
  32:   ;
  33:  IF (R[137]<(-300)) THEN ;
  34:  PR[GP3:15,1]=(-300)    ;
  35:  PR[GP2:15,1]=(PR[GP2:15,1]+(R[137]-(-300))) ;
  36:  ENDIF ;
  37:   ;
  38:  ! Weld using gantry ;
  39:  LBL[202] ;
  40:  R[153]=202    ;
  41:  Weave Sine[3] ;
  42:  Track TAST[R[23]] ;
  43:  Weld Start E2[1,R[112],E0] ;
  44:   ;
  45:L PR[15] R[127]cm/min FINE COORD    ;
  46:  Weave End[3] ;
  47:  Track End ;
  48:  WAIT    .50(sec) ;
  49:  Weld End E2[1,R[112]] ;
  50:   ;
  51:  LBL[999] ;
  52:   ;
  53:  //R[153]=0    ;
  54:   ;
  55:  LBL[1000] ;
  56:   ;
/POS
/END

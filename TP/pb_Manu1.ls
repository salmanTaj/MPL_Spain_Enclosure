/PROG  PB_MANU1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1405;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 17-11-14  TIME 20:32:24;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 63;
MEMORY_SIZE	= 1809;
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
   1:  !************************** ;
   2:  !** Manual welding PB ;
   3:  !************************** ;
   4:   ;
   5:  UFRAME_NUM=1 ;
   6:  UTOOL_NUM=1 ;
   7:  Weave End ;
   8:  Track End ;
   9:   ;
  10:   ;
  11:  !**************************** ;
  12:  !-- adjust angle ;
  13:  !**************************** ;
  14:  JMP LBL[1] ;
  15:  CALL UNFOLD1    ;
  16:   ;
  17:  CALL PRG_CALC1    ;
  18:  PR[120]=LPOS    ;
  19:  PR[120,3]=150    ;
  20:  PR[120,4]=PR[21,4]    ;
  21:  PR[120,5]=PR[21,5]    ;
  22:  PR[120,6]=PR[21,6]    ;
  23:L PR[120] 100mm/sec FINE    ;
  24:  PAUSE ;
  25:  LBL[1] ;
  26:   ;
  27:   ;
  28:  !**************************** ;
  29:  !-- Teach points ;
  30:  !**************************** ;
  31:  JMP LBL[2] ;
  32:  ! Go to start point ;
  33:  PR[1]=LPOS    ;
  34:  PAUSE ;
  35:   ;
  36:  ! Go to End point ;
  37:  PR[2]=LPOS    ;
  38:  PAUSE ;
  39:   ;
  40:  LBL[2] ;
  41:   ;
  42:  !**************************** ;
  43:  !-- Welding ;
  44:  !**************************** ;
  45:  !-- ARC PARAM -- ;
  46:  WAIT R[109]=0    ;
  47:  R[13]=6    ;
  48:  R[115]=1    ;
  49:  R[116]=1    ;
  50:  CALL WELD_PA    ;
  51:   ;
  52:L PR[1] 150mm/sec FINE    ;
  53:   ;
  54:  Weave Sine[1] ;
  55:  Track TAST[R[21]] ;
  56:  Weld Start E1[1,R[111],E0] ;
  57:   ;
  58:L PR[2] R[126]cm/min FINE    ;
  59:   ;
  60:  Weave End[1] ;
  61:  Track End ;
  62:  Weld End E1[1,R[111]] ;
  63:   ;
/POS
/END

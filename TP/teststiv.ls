/PROG  TESTSTIV
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 659;
CREATE		= DATE 17-04-03  TIME 13:22:28;
MODIFIED	= DATE 17-04-03  TIME 13:52:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 29;
MEMORY_SIZE	= 1047;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,1,*,*;
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
   2:   ;
   3:   ;
   4:  JMP LBL[1] ;
   5:  PR[196]=LPOS    ;
   6:  PR[197]=LPOS    ;
   7:  PR[198]=LPOS    ;
   8:  PR[199]=LPOS    ;
   9:  PR[200]=LPOS    ;
  10:   ;
  11:  LBL[1] ;
  12:   ;
  13:  PR[197,1]=PR[196,1]    ;
  14:  PR[198,1]=PR[197,1]    ;
  15:  PR[199,1]=PR[197,1]    ;
  16:   ;
  17:L PR[197] 100mm/sec FINE    ;
  18:  Weave Sine[3.0Hz,2.0mm,0.150s,0.150s] ;
  19:L PR[198] 25cm/min FINE    ;
  20:L PR[199] 25cm/min FINE    ;
  21:   ;
  22:   ;
  23:  PR[200]=PR[199]    ;
  24:  PR[200,3]=PR[199,3]+200    ;
  25:L PR[200] 25cm/min FINE    ;
  26:   ;
  27:   ;
  28:   ;
  29:   ;
/POS
/END

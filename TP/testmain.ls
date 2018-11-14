/PROG  TESTMAIN
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1123;
CREATE		= DATE 17-04-06  TIME 11:58:20;
MODIFIED	= DATE 17-04-27  TIME 10:11:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 57;
MEMORY_SIZE	= 1475;
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
  ARC Welding Equipment : 1,1,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  OVERRIDE=100% ;
   2:  R[75]=0    ;
   3:   ;
   4:  !start ;
   5:  CALL MOVE_START    ;
   6:  R[115]=1    ;
   7:  R[99]=0    ;
   8:  //RUN WELD_PA ;
   9:  //WAIT R[99]=1    ;
  10:   ;
  11:  R[113]=3    ;
  12:  R[114]=0    ;
  13:  CALL ARCSET1    ;
  14:  RUN TESTSTART1 ;
  15:  WAIT R[75]=1    ;
  16:   ;
  17:  R[114]=0    ;
  18:  CALL ARCSET3    ;
  19:  CALL START3    ;
  20:   ;
  21:  WAIT R[75]=5    ;
  22:  WAIT DO[101]=OFF    ;
  23:  WAIT DO[103]=OFF    ;
  24:   ;
  25:   ;
  26:  !synk ;
  27:  R[74]=3    ;
  28:  CALL TESTY_SYNC    ;
  29:   ;
  30:  !seperate ;
  31:  R[75]=0    ;
  32:  RUN TEST1B ;
  33:  Weld End E2[1,1] ;
  34:  //R[113]=0    ;
  35:  //CALL ARCSET3    ;
  36:  RUN TEST3NW ;
  37:  WAIT   3.00(sec) ;
  38:   ;
  39:  WAIT DO[103]=OFF    ;
  40:   ;
  41:  WAIT R[75]=1    ;
  42:   ;
  43:  R[113]=3    ;
  44:  R[114]=0    ;
  45:  CALL ARCSET3    ;
  46:  CALL START3    ;
  47:   ;
  48:  WAIT R[75]=5    ;
  49:  WAIT DO[101]=OFF    ;
  50:  WAIT DO[103]=OFF    ;
  51:   ;
  52:  !synk ;
  53:  R[74]=4    ;
  54:  CALL TESTY_SYNC2    ;
  55:   ;
  56:   ;
  57:   ;
/POS
/END

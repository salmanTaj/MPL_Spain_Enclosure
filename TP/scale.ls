/PROG  SCALE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1017;
CREATE		= DATE 17-04-25  TIME 14:19:46;
MODIFIED	= DATE 17-04-27  TIME 15:45:16;
FILE_NAME	= ARCSET1;
VERSION		= 0;
LINE_COUNT	= 31;
MEMORY_SIZE	= 1461;
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
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  R[99]=0    ;
   2:  !********* ;
   3:  !Weld Settin ;
   4:  !********* ;
   5:   ;
   6:  !-- calc. weav. frequency  ;
   7:  R[124]=R[118]*R[R[13]]    ;
   8:   ;
   9:  !-- calc. weav. amplitude  ;
  10:  R[125]=R[119]/R[R[13]]    ;
  11:   ;
  12:  !-- calc. welding speed ;
  13:  R[126]=R[117]*R[R[13]]    ;
  14:   ;
  15:  !-- writin ;
  16:  $WVSCH[1].$FREQUENCY=R[124] ;
  17:  $WVSCH[1].$AMPLITUDE=R[125] ;
  18:   ;
  19:  $WVSCH[1].$dwell_left=R[120] ;
  20:  $WVSCH[1].$dwell_right=R[121] ;
  21:   ;
  22:  !-- writin ;
  23:  $WVSCH[3].$FREQUENCY=R[124] ;
  24:  $WVSCH[3].$AMPLITUDE=R[125] ;
  25:   ;
  26:  $WVSCH[3].$dwell_left=R[120] ;
  27:  $WVSCH[3].$dwell_right=R[121] ;
  28:  R[163]=1    ;
  29:   ;
  30:  LBL[99] ;
  31:  R[99]=1    ;
/POS
/END

/PROG  SAFEIN1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 863;
CREATE		= DATE 11-03-29  TIME 17:11:08;
MODIFIED	= DATE 18-03-08  TIME 20:28:58;
FILE_NAME	= SAFEMOVE;
VERSION		= 0;
LINE_COUNT	= 35;
MEMORY_SIZE	= 1363;
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
/MN
   1:  ! Safein for Robot1 ;
   2:  TIMER[1]=RESET ;
   3:  TIMER[1]=START ;
   4:  UFRAME_NUM=1 ;
   5:  UTOOL_NUM=1 ;
   6:  Weave End ;
   7:  Track End ;
   8:  ! jmp if program should not be ru ;
   9:  IF ((R[155]=0) OR (R[155]=3)),JMP LBL[999] ;
  10:  ! jmp if program is restarted ;
  11:  !-- AT RESUME JMP TO LABEL ;
  12:  IF R[152]>0,JMP LBL[R[152]] ;
  13:  LBL[1] ;
  14:  R[152]=1    ;
  15:  CALL UNFOLD1    ;
  16:  IF R[163]=0,JMP LBL[4] ;
  17:  LBL[2] ;
  18:  R[152]=2    ;
  19:L PR[151] 50deg/sec FINE    ;
  20:   ;
  21:  LBL[3] ;
  22:  R[152]=3    ;
  23:L PR[150] 50deg/sec FINE    ;
  24:   ;
  25:  LBL[4] ;
  26:  R[152]=4    ;
  27:  R[155]=R[155]-1    ;
  28:  LBL[999] ;
  29:  R[152]=999    ;
  30:  !delay ;
  31:  IF (TIMER[1]<.5) THEN ;
  32:  WAIT    .50(sec) ;
  33:  ENDIF ;
  34:  TIMER[1]=STOP ;
  35:  R[152]=0    ;
/POS
/END

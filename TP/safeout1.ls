/PROG  SAFEOUT1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1093;
CREATE		= DATE 11-03-29  TIME 17:11:38;
MODIFIED	= DATE 18-03-08  TIME 10:56:16;
FILE_NAME	= SAFEIN;
VERSION		= 0;
LINE_COUNT	= 50;
MEMORY_SIZE	= 1533;
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
   1:  ! Safeout for Robot1 ;
   2:  TIMER[1]=RESET ;
   3:  TIMER[1]=START ;
   4:  UFRAME_NUM=1 ;
   5:  UTOOL_NUM=1 ;
   6:  Weave End ;
   7:  Track End ;
   8:  ! jmp if program should not be ru ;
   9:  IF ((R[155]=1) OR (R[155]=4)),JMP LBL[2] ;
  10:  ! jmp if program is restarted ;
  11:  !-- AT RESUME JMP TO LABEL ;
  12:  IF R[152]>0,JMP LBL[R[152]] ;
  13:  ! STore welding point ;
  14:  IF R[163]=0,JMP LBL[20] ;
  15:  PR[150]=LPOS    ;
  16:  !Move gun out ;
  17:  UFRAME_NUM=9 ;
  18:  UTOOL_NUM=1 ;
  19:  PR[120]=LPOS    ;
  20:   ;
  21:  UFRAME[6]=PR[120] ;
  22:   ;
  23:  UFRAME_NUM=6 ;
  24:  PR[120]=LPOS    ;
  25:  PR[121]=PR[120]    ;
  26:  PR[121,3]=PR[121,3]+50    ;
  27:  LBL[1] ;
  28:  R[152]=1    ;
  29:L PR[121] 200mm/sec FINE    ;
  30:  ! Store 2. point ;
  31:  UFRAME_NUM=1 ;
  32:  UTOOL_NUM=1 ;
  33:  PR[151]=LPOS    ;
  34:   ;
  35:  !Safeout status ;
  36:  LBL[20] ;
  37:  R[155]=R[155]+1    ;
  38:   ;
  39:  LBL[2] ;
  40:  R[152]=2    ;
  41:  CALL FOLD1    ;
  42:   ;
  43:  LBL[999] ;
  44:  R[152]=999    ;
  45:  !delay ;
  46:  IF (TIMER[1]<.5) THEN ;
  47:  WAIT    .50(sec) ;
  48:  ENDIF ;
  49:  TIMER[1]=STOP ;
  50:  R[152]=0    ;
/POS
/END

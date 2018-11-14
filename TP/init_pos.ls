/PROG  INIT_POS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1047;
CREATE		= DATE 17-03-15  TIME 09:04:06;
MODIFIED	= DATE 18-08-13  TIME 20:39:28;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 46;
MEMORY_SIZE	= 1535;
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
  ARC Welding Equipment : 1,*,*,*,*;
/MN
   1:  TIMER[1]=RESET ;
   2:  TIMER[1]=START ;
   3:   ;
   4:  UFRAME_NUM=1 ;
   5:  UTOOL_NUM=1 ;
   6:  Weave End ;
   7:  Track End ;
   8:   ;
   9:  R[69]=0    ;
  10:  R[70]=0    ;
  11:  R[71]=0    ;
  12:  R[75]=0    ;
  13:  R[113]=0    ;
  14:  CALL PROF_INIT    ;
  15:   ;
  16:  ! checking profile number ;
  17:  IF R[230]>R[231],JMP LBL[999] ;
  18:   ;
  19:  !max 7 pos ;
  20:   ;
  :! robot 1;
  21:  R[134]=$param_group[1].$lowerlims[7] ;
  22:  R[137]=$param_group[1].$upperlims[7] ;
  23:   ;
  :! lower limit;
  24:  IF (R[134]>PR[GP1:9,7]) THEN ;
  :! distance between 2 and 7; 
    :R[135]=PR[GP1:9,2]-PR[GP1:9,7];
  25:  PR[GP1:9,7]=R[134]+50    ;
  26:  PR[GP1:9,2]=(PR[GP1:9,7]+R[135]) ;
  27:  ENDIF ;
  28:   ;
  :! upper limit;
  24:  IF (R[137]<PR[GP1:9,7]) THEN ;
  :! distance between 2 and 7; 
    :R[135]=PR[GP1:9,7]-PR[GP1:9,2];
  25:  PR[GP1:9,7]=R[137]-50    ;
  26:  PR[GP1:9,2]=(PR[GP1:9,7]+R[135]) ;
  27:  ENDIF ;
  33:   ;
  34:   ;
    :! robot 3;
  21:  R[134]=$param_group[3].$lowerlims[7] ;
  22:  R[137]=$param_group[3].$upperlims[7] ;
  23:   ;
  :! lower limit;
  24:  IF (R[134]>PR[GP3:9,7]) THEN ;
  :! distance between 2 and 7; 
    :R[135]=PR[GP3:9,2]-PR[GP3:9,7];
  25:  PR[GP3:9,7]=R[134]+50    ;
  26:  PR[GP3:9,2]=(PR[GP3:9,7]+R[135]) ;
  27:  ENDIF ;
  28:   ;
  :! upper limit;
  24:  IF (R[137]<PR[GP3:9,7]) THEN ;
  :! distance between 2 and 7; 
    :R[135]=PR[GP3:9,7]-PR[GP3:9,2];
  25:  PR[GP3:9,7]=R[137]-50    ;
  26:  PR[GP3:9,2]=(PR[GP3:9,7]+R[135]) ;
  27:  ENDIF ;
  
  
  
  35:L PR[9] 250mm/sec FINE    ;
  36:   ;
  37:  !7 pos unfold pos ;
  38:  R[270]=PR[GP1:9,7]    ;
  39:  R[271]=PR[GP3:9,7]    ;
  40:   ;
  41:  !delay ;
  42:  LBL[999] ;
  43:  IF (TIMER[1]<.5) THEN ;
  44:  WAIT    .50(sec) ;
  45:  ENDIF ;
  46:  TIMER[1]=STOP ;
/POS
/END

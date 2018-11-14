/PROG  PB_SYNC_OFF
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 995;
CREATE		= DATE 17-03-22  TIME 11:58:10;
MODIFIED	= DATE 17-12-05  TIME 20:35:52;
FILE_NAME	= Y_SYNC;
VERSION		= 0;
LINE_COUNT	= 39;
MEMORY_SIZE	= 1471;
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
  ARC Welding Equipment : 1,1,*,*,*;
/MN
   1:  UFRAME_NUM=1 ;
   2:  Weld End E1[1,R[111]] ;
   3:  Weld End E2[1,R[112]] ;
   4:  Weave End ;
   5:  Track End ;
   6:   ;
   7:  R[163]=1    ;
   8:  R[164]=1    ;
   9:   ;
  10:  !Set angles ;
  11:  //PR[GP1,3:11,4]=PR[GP1,3:21,4]    ;
  12:  //PR[GP1,3:11,5]=PR[GP1,3:21,5]    ;
  13:  //PR[GP1,3:11,6]=PR[GP1,3:21,6]    ;
  14:   ;
  15:  !checking if speed up is needed ;
  16:  !add group ;
  17:  PR[120]=LPOS    ;
  18:  R[134]=0    ;
  19:  IF (R[81]=1) THEN ;
  20:   ;
  21:  ! if profile in X direction ;
  22:  IF (PR[GP1:120,1]>75),R[134]=PR[GP1:120,1] ;
  23:  IF (PR[GP1:120,1]<(-75)),R[134]=PR[GP1:120,1] ;
  24:   ;
  25:  IF (R[134]<>0) THEN ;
  26:  PR[GP1,3:11,1]=PR[GP1,3:11,1]-R[134]    ;
  27:   ;
  28:   ;
  29:  PR[GP2:11,1]=PR[GP2:11,1]+R[134]    ;
  30:  ENDIF ;
  31:  ENDIF ;
  32:   ;
  33:   ;
  34:  !skip if jump ;
  35:  SKIP CONDITION R[158]<>0 OR R[159]<>0    ;
  36:   ;
  37:L PR[11] 50mm/sec FINE Skip,LBL[1]    ;
  38:   ;
  39:  LBL[1] ;
/POS
/END

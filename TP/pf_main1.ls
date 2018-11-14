/PROG  PF_MAIN1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1091;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-03-20  TIME 09:47:42;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 47;
MEMORY_SIZE	= 1575;
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
   1:  JMP LBL[555] ;
   2:  R[151]=0    ;
   3:  LBL[555] ;
   4:  !************************** ;
   5:  !** WELD V/U Robot1 ;
   6:  !************************** ;
   7:   ;
   8:  UFRAME_NUM=2 ;
   9:  UTOOL_NUM=1 ;
  10:  Weave End ;
  11:  Weave End[7] ;
  12:  Track End ;
  13:   ;
  14:   ;
  15:  !-- ARC PARAM -- ;
  16:  WAIT R[109]=0    ;
  17:  R[13]=7    ;
  18:  R[115]=2    ;
  19:  R[116]=1    ;
  20:  CALL WELD_PA    ;
  21:  !-- AT RESUME JMP TO LABEL ;
  22:  IF ((R[151]>100)),JMP LBL[2] ;
  23:   ;
  24:  ! Call sub programs for Lower par ;
  25:  IF (R[255]=1) THEN ;
  26:  CALL PF_LOCOR1    ;
  27:  IF (R[136]=1),JMP LBL[999] ;
  28:  ENDIF ;
  29:   ;
  30:  IF (R[255]=2) THEN ;
  31:  CALL PF_LOEDGE1    ;
  32:  ENDIF ;
  33:  LBL[2] ;
  34:   ;
  35:  ! Call sub programs for High part ;
  36:   ;
  37:  IF ((R[256]<=2) OR (R[256]=5)) THEN ;
  38:  CALL PF_HIEDGE1    ;
  39:  ENDIF ;
  40:   ;
  41:  IF ((R[256]=3) OR (R[256]=4)) THEN ;
  42:  CALL PF_HISTOP1    ;
  43:  ENDIF ;
  44:   ;
  45:  LBL[999] ;
  46:  //R[151]=0    ;
  47:   ;
/POS
/END

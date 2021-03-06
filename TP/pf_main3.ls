/PROG  PF_MAIN3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1099;
CREATE		= DATE 10-08-05  TIME 14:56:58;
MODIFIED	= DATE 18-08-08  TIME 14:35:54;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 48;
MEMORY_SIZE	= 1579;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,1,*,*;
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
  19:  R[116]=3    ;
  20:  CALL WELD_PA    ;
  21:   ;
  22:  !-- AT RESUME JMP TO LABEL ;
  23:  IF ((R[153]>100)),JMP LBL[2] ;
  24:   ;
  25:  ! Call sub programs for Lower par ;
  26:  IF (R[265]=1) THEN ;
  27:  CALL PF_LOCOR3    ;
  28:  IF (R[139]=1),JMP LBL[999] ;
  29:  ENDIF ;
  30:   ;
  31:  IF (R[265]=2) THEN ;
  32:  CALL PF_LOEDGE3    ;
  33:  ENDIF ;
  34:  LBL[2] ;
  35:   ;
  36:  ! Call sub programs for High part ;
  37:   ;
  38:  IF ((R[266]<=2) OR (R[266]=5)) THEN ;
  39:  CALL PF_HIEDGE3    ;
  40:  ENDIF ;
  41:   ;
  42:  IF ((R[266]=3) OR (R[266]=4)) THEN ;
  43:  CALL PF_HISTOP3    ;
  44:  ENDIF ;
  45:   ;
  46:  LBL[999] ;
  47:  //R[153]=0    ;
  48:   ;
/POS
/END

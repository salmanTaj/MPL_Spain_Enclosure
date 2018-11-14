/PROG  CLEAN1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1199;
CREATE		= DATE 17-05-24  TIME 11:37:14;
MODIFIED	= DATE 18-10-22  TIME 16:08:24;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 56;
MEMORY_SIZE	= 1655;
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
   1:  DO[254]=OFF ;
   2:  PR[130]=LPOS    ;
   3:  IF (PR[130,3]>1250),JMP LBL[1] ;
   4:  ! store 7 axis pos ;
   5:  R[270]=PR[130,7]    ;
   6:   ;
   7:  R[163]=0    ;
   8:  CALL FOLD1    ;
   9:   ;
  10:  LBL[1] ;
  11:  UTOOL_NUM=1 ;
  12:  UFRAME_NUM=1 ;
  13:   ;
  14:  PR[130]=JPOS    ;
  15:  PR[129]=LPOS    ;
  16:  R[134]=$param_group[1].$upperlims[7] ;
  17:  IF ((R[134]-500)<PR[130,7]) THEN ;
  18:  PR[129,7]=R[134]-500    ;
  19:  ENDIF ;
  20:  R[134]=PR[115,2]-PR[115,7]    ;
  21:  PR[115,7]=PR[129,7]    ;
  22:  PR[115,2]=PR[115,7]+R[134]    ;
  23:J PR[115] 100% FINE    ;
  24:  PR[116]=PR[115]    ;
  25:  PR[116,2]=PR[116,2]-40    ;
  26:L PR[116] 50mm/sec FINE    ;
  27:   ;
  28:  PR[120]=PR[116]    ;
  29:  PR[120,3]=PR[120,3]+5    ;
  30:   ;
  31:  PR[121]=PR[116]    ;
  32:  PR[121,1]=PR[121,1]-5    ;
  33:   ;
  34:  PR[122]=PR[116]    ;
  35:  PR[122,3]=PR[122,3]-5    ;
  36:   ;
  37:  PR[123]=PR[116]    ;
  38:  PR[123,1]=PR[123,1]+5    ;
  39:   ;
  40:  PR[124]=PR[116]    ;
  41:  PR[124,3]=PR[124,3]+5    ;
  42:   ;
  43:L PR[120] 250mm/sec FINE    ;
  44:   ;
  45:  DO[254]=ON ;
  46:C PR[121]    
    :  PR[122] 1.0sec FINE    ;
  47:C PR[123]    
    :  PR[124] 1.0sec FINE    ;
  48:  DO[254]=OFF ;
  49:   ;
  50:   ;
  51:J PR[115] 100% FINE    ;
  52:   ;
  53:  !Clean if R3 is sensing ;
  54:  IF (R[221]=21) THEN ;
  55:  CALL UNFOLD1    ;
  56:  ENDIF ;
/POS
/END

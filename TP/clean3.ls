/PROG  CLEAN3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1199;
CREATE		= DATE 17-05-24  TIME 11:38:00;
MODIFIED	= DATE 18-10-22  TIME 15:59:50;
FILE_NAME	= CLEAN1;
VERSION		= 0;
LINE_COUNT	= 55;
MEMORY_SIZE	= 1659;
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
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  DO[406]=OFF ;
   2:  PR[130]=LPOS    ;
   3:  IF (PR[130,3]>1250),JMP LBL[1] ;
   4:   ;
   5:  ! store 7 axis pos ;
   6:  R[271]=PR[130,7]    ;
   7:   ;
   8:  R[164]=0    ;
   9:  CALL FOLD3    ;
  10:  LBL[1] ;
  11:  R[75]=0    ;
  12:   ;
  13:  UTOOL_NUM=1 ;
  14:  UFRAME_NUM=1 ;
  15:   ;
  16:  PR[130]=JPOS    ;
  17:  PR[129]=LPOS    ;
  18:  R[137]=$param_group[1].$upperlims[7] ;
  19:  IF ((R[137]-500)<PR[130,7]) THEN ;
  20:  PR[129,7]=R[137]-500    ;
  21:  ENDIF ;
  22:  R[137]=PR[115,2]-PR[115,7]    ;
  23:  PR[115,7]=PR[129,7]    ;
  24:  PR[115,2]=PR[115,7]+R[137]    ;
  25:J PR[115] 100% FINE    ;
  26:  PR[116]=PR[115]    ;
  27:  PR[116,2]=PR[116,2]-40    ;
  28:J PR[116] 100% FINE    ;
  29:   ;
  30:  PR[120]=PR[116]    ;
  31:  PR[120,3]=PR[120,3]+5    ;
  32:   ;
  33:  PR[121]=PR[116]    ;
  34:  PR[121,1]=PR[121,1]-5    ;
  35:   ;
  36:  PR[122]=PR[116]    ;
  37:  PR[122,3]=PR[122,3]-5    ;
  38:   ;
  39:  PR[123]=PR[116]    ;
  40:  PR[123,1]=PR[123,1]+5    ;
  41:   ;
  42:  PR[124]=PR[116]    ;
  43:  PR[124,3]=PR[124,3]+5    ;
  44:   ;
  45:L PR[120] 250mm/sec FINE    ;
  46:   ;
  47:  DO[406]=ON ;
  48:C PR[121]    
    :  PR[122] 1.0sec FINE    ;
  49:C PR[123]    
    :  PR[124] 1.0sec FINE    ;
  50:  DO[406]=OFF ;
  51:J PR[116] 100% FINE    ;
  52:J PR[115] 100% FINE    ;
  53:   ;
  54:   ;
  55:  CALL UNFOLD3    ;
/POS
/END

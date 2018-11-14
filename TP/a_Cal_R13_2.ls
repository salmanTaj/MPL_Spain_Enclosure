/PROG  A_CAL_R13_2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1191;
CREATE		= DATE 13-09-16  TIME 12:39:06;
MODIFIED	= DATE 17-12-13  TIME 10:08:00;
FILE_NAME	= AUTO_CAL;
VERSION		= 0;
LINE_COUNT	= 53;
MEMORY_SIZE	= 1611;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,1,*,*;
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
   1:  !****************************** ;
   2:  !**** R1 R3 CALIBRATION ;
   3:  !****************************** ;
   4:  UFRAME_NUM=1 ;
   5:  UTOOL_NUM=3 ;
   6:   ;
   :! move to mittle;
      8:  PR[120]=JPOS    ;
           :PR[GP1:120,7]= 3200   ;
  14:  R[137]=PR[GP1:120,7]    ;
  15:  PR[GP3:120,7]=R[137]    ;
    17:J PR[120] 50% FINE    ;
    :;
   
   7:  ! Unfolding robots ;
   8:  PR[120]=LPOS    ;
   9:  PR[120,1]=0    ;
   :;
10:  R[137]=PR[GP1:120,1]    ;
     44:  PR[GP3:120,1]= R[137]+R[167]    ;
     :;
  10:  R[137]=PR[GP1:120,2]    ;
      43: PR[GP3:120,2]= R[137]+R[168]    ;
:;

  12:  PR[120,3]=25    ;
  13:  PR[120,5]=45    ;

  16:   ;

:;
  17:J PR[120] 50% FINE    ;
  18:   ;
  19:  DO[128]=ON ;
  20:  DO[136]=ON ;
  21:  RO[1]=ON ;
  22:  RO[9]=ON ;
  23:  ! R1 searching for base plate ;
  24:  PR[121]=LPOS    ;
  25:  PR[GP1:121,3]=(-50)    ;
  26:  SKIP CONDITION DI[135]=ON    ;
  27:L PR[121] 2mm/sec FINE Skip,LBL[99]    ;
  28:   ;
  29:   ;
  30:  ! R3 searching for base plate ;
  31:  PR[121]=LPOS    ;
  32:  PR[GP3:121,3]=(-50)    ;
  33:  SKIP CONDITION DI[127]=ON    ;
  34:L PR[121] 2mm/sec FINE Skip,LBL[99]    ;
  35:   ;
  36:  PAUSE ;
  37:  ! Jog R3 in X and Y to same dots ;
  38:  PR[125]=LPOS    ;
  39:  R[137]=PR[GP1:125,1]    ;
  40:  R[138]=PR[GP1:125,2]    ;
  41:  R[139]=PR[GP1:125,3]    ;
  42:   ;
  43:  R[167]=PR[GP3:125,1]-R[137]    ;
  44:  R[168]=PR[GP3:125,2]-R[138]    ;
  45:  R[169]=PR[GP3:125,3]-R[139]    ;
  46:   ;
  47:   ;
  48:   ;
  49:   ;
  50:   ;
  51:   ;
  52:   ;
  53:  LBL[99] ;
/POS
/END

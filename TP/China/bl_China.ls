/PROG  BL_China
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4451;
CREATE		= DATE 17-09-29  TIME 11:48:20;
MODIFIED	= DATE 18-03-18  TIME 20:00:52;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 147;
MEMORY_SIZE	= 4811;
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
  ARC : TRUE ; 
  ARC Welding Equipment : 1,*,*,*,*;

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  !****************************** ;
   2:  ! Reading DI from China ;
   3:  !****************************** ;
   :! STOP  Welding Gantry;
  :!20:  IF (DI[138]=ON) THEN ;
:!:R[212]=3; 
:!:endif;
:!:;
:!:! Continue  Welding Gantry;
  :!20:  IF (DI[139]=ON) THEN ;
:!:R[212]=1; 
:!:endif;
:!:;
   :!1:  !****************************** ;
   :!2:  ! Setting DO for China ;
   :!3:  !****************************** ;
   :!:! part of DOs are set in scanning.tp; 
:!:! Gantry is welding;
  :!20:  IF ((R[201]=3) and (R[221]>2)) THEN ;
:!:DO[138]=OFF; 
:!:DO[139]=ON; 
:!:endif;
:!:;
:!:! Gantry is in Error/Pause;
  :!20:  IF ((R[201]=8) OR (R[201]=5)) THEN ;
  :!:DO[137]=OFF; 
  :!:DO[138]=OFF; 
  :!:DO[139]=OFF; 
:!:DO[140]=ON; 
:!:DO[141]=OFF; 
:!:else;
:!:DO[140]=OFF; 
:!:endif;
:!:;
  :!34:   ;
  :;
  :! side profile lasers; 
  :if ((AI[1]>10) and (AI[3]>10)) then; 
 :R[325]=1; 
 :else;
 :R[325]=0;
 
 :else;
 
 :endif;
 
/POS
/END

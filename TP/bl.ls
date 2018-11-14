/PROG  BL
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2097;
CREATE		= DATE 17-06-26  TIME 14:06:46;
MODIFIED	= DATE 18-07-10  TIME 15:45:32;
FILE_NAME	= BL_TEMP;
VERSION		= 0;
LINE_COUNT	= 74;
MEMORY_SIZE	= 2461;
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
/MN
   1:  !****************************** ;
   2:  !**** BL PROGRAM ;
   3:  !****************************** ;
   4:  ! set IMSTP ON at start up ;
   5:  IF (DO[90]=ON),DO[85]=(ON) ;
   6:   ;
   7:  ! master menu ON ;
   8:  $master_enb=1 ;
   9:   ;
  10:  //!-------- TOUCH SENSOR  -------- ;
  11:  IF (DO[82]=ON),DO[256]=(OFF) ;
  12:  IF (DO[82]=ON),DO[408]=(OFF) ;
  13:   ;
  14:  //!-------- Cleaning Air   -------- ;
  15:  IF (DO[82]=ON),DO[254]=(OFF) ;
  16:  IF (DO[82]=ON),DO[406]=(OFF) ;
  17:  //    ;
  18:   ;
  19:  //!-------- Lasers lid CLOSE   ---- ;
  20:  IF (DO[249]=ON),RO[1]=(OFF) ;
  21:  IF (DO[401]=ON),RO[9]=(OFF) ;
  22:  IF (DO[249]=ON),DO[136]=(OFF) ;
  23:  IF (DO[401]=ON),DO[128]=(OFF) ;
  24:  //    ;
  25:  !-------- Cooling air -------- ;
  26:  IF (DO[249]=ON,RO[3]=(ON)) ;
  27:  IF (DO[401]=ON),RO[11]=(ON) ;
  28:  IF (DO[249]=ON OR DO[401]=ON),R[316]=(0) ;
  29:  R[316]=R[316]+1    ;
  30:  IF (R[316]>37500),RO[3]=(OFF) ;
  31:  IF (R[316]>37500),RO[11]=(OFF) ;
  32:  IF (RO[3]=OFF),R[316]=(0) ;
  33:   ;
  34:  //!------ KEMPPI HEARTBEAT ------ ;
  35:  //IF (R[317]<5),DO[25]=(ON) ;
  36:  //IF (R[317]>5),DO[25]=(OFF) ;
  37:  //IF (R[317]>10),R[317]=(0) ;
  38:  //R[317]=R[317]+1    ;
  39:   ;
  40:  !speed for panel ;
  41:  R[317]=$MCR_GRP[1].$OTF_SPEED ;
  42:  IF (DO[249]=ON),R[217]=R[317]*60/10 ;
  43:  IF (DO[249]=OFF),R[217]=0 ;
  44:   ;
  45:  R[318]=$MCR_GRP[3].$OTF_SPEED ;
  46:  IF (DO[401]=ON),R[218]=R[318]*60/10 ;
  47:  IF (DO[401]=OFF),R[218]=0 ;
  48:   ;
  49:  !Scanner count down ;
  50:  IF ((R[221]=2) AND (DO[130]=ON)) THEN ;
  51:  R[341]=30-TIMER[5]    ;
  52:  ELSE ;
  53:  R[341]=0    ;
  54:  ENDIF ;
  55:  //    ;
  56:  !-------- SAFETY   -------- ;
  57:  !reset req blinking ;
  58:  IF (DI[91]=ON),DO[121]=(ON) ;
  59:  IF (DI[91]=OFF),DO[121]=(OFF) ;
  60:   ;
  61:  !reset to SICK ;
  62:  //IF ((DI[122]=ON) AND (R[212]=800)),DO[91]=(ON) ;
  63:  IF (DI[122]=ON),DO[91]=(ON) ;
  64:  IF (DI[122]=OFF),DO[91]=(OFF) ;
  65:  //IF ((DI[122]=OFF) OR (R[212]<>800)),DO[91]=(OFF) ;
  66:   ;
  67:  !zone selection ;
  68:  IF (R[351]=0),DO[92]=(OFF) ;
  69:  IF (R[351]=1),DO[92]=(ON) ;
  70:  IF (R[352]=0),DO[93]=(OFF) ;
  71:  IF (R[352]=1),DO[93]=(ON) ;
  72:   ;
  73:  !power on scanner ;
  74:  IF (R[327]=1),DO[130]=(ON) ;
/POS
/END

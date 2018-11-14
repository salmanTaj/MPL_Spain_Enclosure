/PROG  TEST3NW
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 713;
CREATE		= DATE 17-04-20  TIME 14:04:26;
MODIFIED	= DATE 17-06-07  TIME 15:22:32;
FILE_NAME	= TEST1;
VERSION		= 0;
LINE_COUNT	= 3;
MEMORY_SIZE	= 1073;
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
   1:L P[1] 100mm/sec FINE    ;
   2:  Weld Start E1[1,1,E0] ;
   3:L P[2] 42cm/min FINE    ;
/POS
P[1]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    76.630  mm,	Y =  1420.162  mm,	Z =   -57.541  mm,
	W =      .001 deg,	P =    44.999 deg,	R =      .001 deg,
	E1=  1429.999  mm
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    76.630  mm,	Y =  1270.660  mm,	Z =   -57.541  mm,
	W =      .001 deg,	P =    44.999 deg,	R =      .001 deg,
	E1=  1429.999  mm
};
/END

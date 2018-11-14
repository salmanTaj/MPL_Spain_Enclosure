/PROG  TEST500
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 753;
CREATE		= DATE 17-06-06  TIME 13:48:12;
MODIFIED	= DATE 17-06-06  TIME 14:03:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 4;
MEMORY_SIZE	= 1241;
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

MPAS ;
MPAS_NUM_PASSES        : 0;
MPAS_LAST_PASS         : 0;
MPAS_CURRENT_PASS      : 0;
MPAS_STATUS_PASS       : 0;
/MN
   1:  LBL[1] ;
   2:J P[1] 100% FINE    ;
   3:J P[2] 100% FINE    ;
   4:  JMP LBL[1] ;
/POS
P[1]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   580.048  mm,	Y =  1641.357  mm,	Z =  1648.900  mm,
	W =   179.999 deg,	P =      .001 deg,	R =    79.998 deg,
	E1=   999.998  mm
   GP2:
	UF : 1, UT : 1,	
	J1=  1008.634  mm
   GP3:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -562.810  mm,	Y =  1582.277  mm,	Z =  1666.080  mm,
	W =  -180.000 deg,	P =    -9.998 deg,	R =    99.999 deg,
	E1=  1000.004  mm
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   580.048  mm,	Y =  1641.357  mm,	Z =  1648.900  mm,
	W =   179.999 deg,	P =      .001 deg,	R =    79.998 deg,
	E1=   999.998  mm
   GP2:
	UF : 1, UT : 1,	
	J1=  4000.000  mm
   GP3:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -562.810  mm,	Y =  1582.277  mm,	Z =  1666.080  mm,
	W =  -180.000 deg,	P =    -9.998 deg,	R =    99.999 deg,
	E1=  1000.004  mm
};
/END

/PROG  TESTMAX
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 787;
CREATE		= DATE 17-04-19  TIME 21:43:54;
MODIFIED	= DATE 17-04-20  TIME 12:37:14;
FILE_NAME	= TEST22;
VERSION		= 0;
LINE_COUNT	= 4;
MEMORY_SIZE	= 1275;
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
	X =  1096.774  mm,	Y =   292.646  mm,	Z =  1654.724  mm,
	W =   179.747 deg,	P =    -9.914 deg,	R =    -7.365 deg,
	E1=   314.864  mm
   GP2:
	UF : 1, UT : 1,	
	J1=  -315.259  mm
   GP3:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X = -1037.551  mm,	Y =   231.787  mm,	Z =  1659.691  mm,
	W =  -179.712 deg,	P =    -9.367 deg,	R =   179.433 deg,
	E1=   279.931  mm
};
P[2]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1160.413  mm,	Y =  1373.243  mm,	Z =  1035.942  mm,
	W =  -144.016 deg,	P =    25.556 deg,	R =    98.277 deg,
	E1=   814.864  mm
   GP2:
	UF : 1, UT : 1,	
	J1=   184.741  mm
   GP3:
	UF : 1, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X = -1120.107  mm,	Y =   378.651  mm,	Z =  1038.756  mm,
	W =  -131.329 deg,	P =   -17.785 deg,	R =   -72.517 deg,
	E1=   779.931  mm
};
/END

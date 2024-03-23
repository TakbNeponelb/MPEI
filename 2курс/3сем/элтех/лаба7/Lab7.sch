*version 9.2 592378971
u 33
C? 2
R? 3
V? 2
? 3
@libraries
@analysis
.TRAN 1 0 0 0
+0 20ns
+1 50us
.OP 0 
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1555 
@status
n 0 123:11:11:21:35:27;1702319727 e 
s 2832 123:11:11:21:35:31;1702319731 e 
*page 1 0 1520 970 iB
@ports
port 8 GND_EARTH 370 200 h
@parts
part 4 VPULSE 340 160 h
a 1 u 0 0 0 0 hcn 100 V1=0
a 1 u 0 0 0 0 hcn 100 V2=1
a 1 u 0 0 0 0 hcn 100 TD=0
a 1 u 0 0 0 0 hcn 100 TR=0
a 1 u 0 0 0 0 hcn 100 TF=0
a 1 u 0 0 0 0 hcn 100 PW=20u
a 1 u 0 0 0 0 hcn 100 PER=40u
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
part 3 r 380 160 u
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=1.1k
part 2 c 380 190 v
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=5.6n
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 32 nodeMarker 380 160 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=2
@conn
w 6
a 0 up 0:33 0 0 0 hln 100 V=
s 340 200 370 200 24
a 0 up 33 0 355 199 hct 100 V=
s 370 200 380 200 28
s 380 200 380 190 30
@junction
j 340 200
+ p 4 -
+ w 6
j 370 200
+ s 8
+ w 6
j 340 160
+ p 3 2
+ p 4 +
j 380 160
+ p 2 2
+ p 3 1
j 380 190
+ p 2 1
+ w 6
j 380 160
+ p 32 pin1
+ p 3 1
j 380 160
+ p 32 pin1
+ p 2 2
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics

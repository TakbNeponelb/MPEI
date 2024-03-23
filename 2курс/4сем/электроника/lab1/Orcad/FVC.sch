*version 9.2 207284710
u 23
C? 3
R? 3
V? 2
PRINT? 3
? 5
@libraries
@analysis
.AC 1 1 0
+0 10000
+1 10
+2 220.00K
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
pageloc 1 0 1621 
@status
n 0 124:01:27:02:03:27;1708988607 e 
s 2832 124:01:27:02:03:28;1708988608 e 
*page 1 0 1520 970 iB
@ports
port 6 GND_EARTH 220 130 h
@parts
part 7 VAC 180 90 h
a 0 u 13 0 -9 23 hcn 100 ACMAG=1V
a 0 sp 0 0 0 50 hln 100 PART=VAC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
part 19 C 190 90 h
a 0 sp 0 0 0 10 hlb 100 PART=C
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 u 13 0 15 25 hln 100 VALUE=15n
part 20 R 220 130 v
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=20k
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 18 nodeMarker 220 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=4
part 17 nodeMarker 180 90 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=3
@conn
w 5
a 0 up 0:33 0 0 0 hln 100 V=
s 220 130 220 120 8
s 180 130 220 130 4
a 0 up 33 0 200 129 hct 100 V=
w 22
s 180 90 190 90 21
@junction
j 220 130
+ s 6
+ w 5
j 180 130
+ p 7 -
+ w 5
j 180 90
+ p 17 pin1
+ p 7 +
j 220 90
+ p 19 2
+ p 18 pin1
j 220 90
+ p 20 2
+ p 19 2
j 220 130
+ p 20 1
+ s 6
j 220 90
+ p 20 2
+ p 18 pin1
j 220 130
+ p 20 1
+ w 5
j 180 90
+ p 7 +
+ w 22
j 190 90
+ p 19 1
+ w 22
j 180 90
+ p 17 pin1
+ w 22
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics

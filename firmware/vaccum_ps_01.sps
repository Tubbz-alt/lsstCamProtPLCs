$Name <FILENAME>

! Obj_Source
;Project created by:
;Joao Rodrigues SLAC
;joaoprod@slac.staford.edu
;
;Project reviewed by:
;
;Project tested by:
;
;
;
;History of change:

#Include <func06.fps>

! Id_Pluto_Double[D45]:0=000000000010


! I0.0=HVInterlock                      ;HEX Vacuum Gauge for interlock safety VHX-UTT-GCC-01
! I0.1=HVTurbo                          ;HEX Turbo Vac VHX-UTT-GCC-00
! I0.2=MainChamber                      ;Main Chamber redundant seal VCR-UTT-GCC-02
! I0.3=CVTurbo                          ;Cryostat Turbo Vac VCR-UTT-GCC-01
! I0.4=CVInterlock                      ;Cryostat Vacuum Gauge for interlock safety VCR-UTT-GCC-00
! I0.6=HVTurboSpeed                     ;HEX Vacuum Turbo speed VHX-UTT-PCT-01
! I0.7=CVTurboSpeed                     ;Cryostat Vacuum Turbo speed VCR-UTT-PCT-00
! Q0.0=CVStat                           ;Cryostat Vacuum Status PRT-UTT-PLC-03/I6
! Q0.1=HVStat                           ;HEX-Can Vacuum Status PRT-UTT-PLC-03/I5
! Q0.2=MainVcrVcc                       ;Cryostat VCR-UTT-VCC-00
! Q0.3=MainVhxVcc                       ;HEX-Can VHX-UTT-VCC-01
! GM0.8=OpenMainVcrVcc                  ;
! GM0.9=CloseMainVcrVcc                 ;
! GM0.10=OpenMainVhxVcc                 ;
! GM0.11=CloseMainVhxVcc                ;

! Pgm_Pluto:0
! Instruction_Set_3
! Ext_comm:0=Device 0,Packet 0
;VCR-UTT-PLC-00
;
;Cryo Vaccum PLC

! I0.0,Analog,10V
! I0.1,Analog,10V
! I0.2,Analog,10V
! I0.3,Analog,10V
! I0.4,Analog,10V
! I0.6,Analog,10V
! I0.7,Analog,10V
! I0.30,A_Pulse,Non_Inv
! I0.31,A_Pulse,Non_Inv
! I0.32,B_Pulse,Non_Inv
! I0.33,B_Pulse,Non_Inv
! I0.34,C_Pulse,Non_Inv
! I0.47,Static
! Q0.10,A_Pulse
! Q0.11,B_Pulse
! Q0.12,C_Pulse
! Q0.20,Static
! Q0.21,Static
! Q0.22,Static
! Q0.23,Static

! I0.30=MainVcrVgcOpen                  ;CVR-UTT-VGC-00 Open
! I0.31=MainVcrVgcClose                 ;CVR-UTT-VGC-00 Close
! I0.32=MainVhxVgcOpen                  ;VHX-UTT-VCC-01 Open
! I0.33=MainVhxVgcClose                 ;VHX-UTT-VCC-01 Close
! I0.34=MKS925                          ;Roughing Pump
! I0.47=TempReset                       ;
! Q0.4=VCRPumpPerm                      ;Cryo Turbo Pump Permit VCR-UTT-PCT-00/J1-3
! Q0.5=VHXPumpPerm                      ;HEX-Can Turbo Pump Permit VHX-UTT-PCT-01/J1-3
! Q0.10=APower                          ;VCR-UTT-VCC-00
! Q0.11=BPower                          ;VHX-UTT-VGC-00
! Q0.12=CPower                          ;roufhing pump contact
! Q0.20=VcrVcc01                        ;VCR-UTT-VCC-01
! Q0.21=VcrVcc02                        ;VCR-UTT-VCC-02
! Q0.22=VcrVcc03                        ;VCR-UTT-VCC-03
! Q0.23=VcrVcc04                        ;VCR-UTT-VCC-04
! M0.0=VacResetE                        ;
! M0.1=MVacReset                        ;
! M0.10=HVInterlockValid                ;
! M0.11=HVTurboValid                    ;
! M0.12=MainChamberValid                ;
! M0.13=CVTurboValid                    ;
! M0.14=CVInterlockValid                ;
! M0.15=HVInterlockHigh                 ;
! M0.16=CVInterlockHigh                 ;
! M0.17=HVInterlockHighFilter           ;
! M0.18=CVInterlockHighFilter           ;
! M0.19=HVInterlockHighL                ;
! M0.20=CVInterlockHighL                ;
! M0.30=HVTurboSpeedValid               ;
! M0.31=CVTurboSpeedValid               ;
! M0.32=HVTurboPumpON                   ;
! M0.33=HVTurboPumpOFF                  ;
! M0.34=CVTurboPumpON                   ;
! M0.35=CVTurboPumpOFF                  ;
! M0.50=ToGate0                         ;
! M0.51=ToGate1                         ;
! M0.52=ToGate2                         ;
! M0.53=ToGate3                         ;
! M0.54=ToGate4                         ;
! M0.55=ToGate5                         ;
! M0.56=ToGate6                         ;
! M0.57=ToGate7                         ;
! M0.58=ToGate8                         ;
! M0.59=ToGate9                         ;
! M0.60=ToGate10                        ;
! M0.61=ToGate11                        ;
! M0.62=ToGate12                        ;
! M0.63=ToGate13                        ;
! M0.64=ToGate14                        ;
! M0.65=ToGate15                        ;
! M0.66=ToGate16                        ;
! M0.67=ToGate17                        ;
! M0.68=ToGate18                        ;
! M0.69=ToGate19                        ;
! R0.0=HVInterlockVoltage               ;
! R0.1=HVInterlockPressure              ;
! R0.2=HVTurboVoltage                   ;
! R0.3=HVTurboPressure                  ;
! R0.4=MainChamberVoltage               ;
! R0.5=MainChamberPressure              ;
! R0.6=CVTurboVoltage                   ;
! R0.7=CVTurboPressure                  ;
! R0.8=CVInterlockVoltage               ;
! R0.9=CVInterlockPressure              ;
! R0.10=HVPressureDiff                  ;
! R0.11=CVPressureDiff                  ;
! R0.30=HVTurboPumpVoltage              ;
! R0.31=HVTurboPumpSpeed                ;
! R0.32=CVTurboPumpVoltage              ;
! R0.33=CVTurboPumpSpeed                ;


S0.0_0=Logic
MVacReset=VacResetE+TempReset
HVInterlockValid=ReadVoltage(0,0,1000,HVInterlockVoltage,HVInterlockPressure)
;Vaccum PLC outputs routed to Master PLC: PRT-UTT-PLC-03
;
;Heat-Exchanger related
HVInterlockHighFilter=Upcount(P(SM_1Hz),(HVInterlockPressure<=10),10)
HVInterlockHighL=StartT(/HVInterlockHighFilter*HVInterlockValid,MVacReset,1,0)
HVStat=HVInterlockHighL
CVInterlockvalid=ReadVoltage(4,0,10000,CVInterlockVoltage,CVInterlockPressure)
;Vaccum PLC outputs routed to Master PLC: PRT-UTT-PLC-03
;
;Cryostat related
;
CVInterlockHighFilter=Upcount(P(SM_1Hz),(CVInterlockPressure<=10),10)
CVInterlockHighL=StartT(/CVInterlockHighFilter*CVInterlockValid,MVacReset,1,0)
CVStat=CVInterlockHighL
HVTurboSpeedValid=ReadVoltage(6,0,10000,HVTurboPumpVoltage,HVTurboPumpSpeed)
;
;Heat-Exchanger Valve Control
;
HVTurboPumpOFF=(HVTurboPumpSpeed<1000)*HVTurboSpeedValid
HVTurboPumpON=(HVTurboPumpSpeed>5000)*HVTurboSpeedValid
HVTurboValid=ReadVoltage(1,0,10000,HVTurboVoltage,HVTurboPressure)
S(MainVhxVcc)=P(CloseMainVhxVcc)+HVTurboPumpON*/MKS925
;Close
R(CloseMainVhxVcc)=SM_1Hz
(HVPressureDiff=HVTurboPressure-HVInterlockPressure)=(HVInterlockPressure<=HVTurboPressure)
;OPEN
(HVPressureDiff=HVInterlockPressure-HVTurboPressure)=(HVInterlockPressure>HVTurboPressure)
R(MainVhxVcc)=P(OpenMainVhxVcc)*(HVTurboPumpOFF*(HVPressureDiff<50)+HVTurboPumpON*(HVPressureDiff=100))*HVInterlockValid*HVTurboValid
R(OpenMainVhxVcc)=SM_1Hz
VHXPumpPerm=(HVTurboPressure<10)*HVTurboValid*(/HVTurboPumpON+MKS925)
;
;Heat-Exchanger Turbo Pump Control
;
CVTurboSpeedValid=ReadVoltage(7,0,10000,CVTurboPumpVoltage,CVTurboPumpSpeed)
;
;Cryostat Gate Valve Control
;
CVTurboPumpOFF=(CVTurboPumpSpeed<1000)
CVTurboPumpON=(CVTurboPumpSpeed>5000)
CVTurboValid=ReadVoltage(3,0,10000,CVTurboVoltage,CVTurboPressure)
S(MainVcrVcc)=P(CloseMainVcrVcc)+CVTurboPumpON*/MKS925
;Close
R(CloseMainVcrVcc)=SM_1Hz
(CVPressureDiff=CVTurboPressure-CVInterlockPressure)=(CVInterlockPressure<=CVTurboPressure)
;OPEN
(CVPressureDiff=CVInterlockPressure-CVTurboPressure)=(CVInterlockPressure>CVTurboPressure)
R(MainVcrVcc)=P(OpenMainVcrVcc)*(CVTurboPumpOFF*(CVPressureDiff<50)+CVTurboPumpON*(CVPressureDiff=100))*CVTurboValid*CVInterlockValid
R(OpenMainVcrVcc)=SM_1Hz
VCRPumpPerm=(CVTurboPressure<10)*(/CVTurboPumpON+MKS925)*CVTurboValid
;
;Cryostat Turbo Pump Control
;
MainChamberValid=ReadVoltage(2,0,10000,MainChamberVoltage,MainChamberPressure)
;
;Read Main chamber Redundant seal gauge
;

S0.1_0=Communication
VacResetE=Ext_Sig(0,1)
VcrVcc01=Ext_Sig(1,0)
VcrVcc02=Ext_Sig(2,0)
VcrVcc03=Ext_Sig(3,0)
VcrVcc04=Ext_Sig(4,0)
OpenMainVcrVcc=Ext_Sig(5,0)
CloseMainVcrVcc=Ext_Sig(6,0)
OpenMainVhxVcc=Ext_Sig(7,0)
CloseMainVhxVcc=Ext_Sig(8,0)
ToGate1=ToGateway_User_A(SM_1Hz,1,HVInterlockVoltage,HVInterlockPressure)
ToGate2=ToGateway_User_A(P(/ToGate1),2,HVTurboVoltage,HVTurboPressure)
ToGate3=ToGateway_User_A(P(/ToGate2),3,MainChamberVoltage,MainChamberPressure)
ToGate4=ToGateway_User_A(P(/togate3),4,CVTurboVoltage,CVTurboPressure)
ToGate5=ToGateway_User_A(P(/togate4),5,CVInterlockVoltage,CVInterlockPressure)
ToGate6=ToGateway_User_A(P(/togate5),6,HVPressureDiff,CVPRessureDiff)
ToGate7=ToGateway_User_A(P(/togate6),7,HVTurboPumpVoltage,HVTurboPumpSpeed)
ToGate8=ToGateway_User_A(P(/togate7),8,CVTurboPumpVoltage,CVTurboPumpSpeed)
ToGate9=ToGateway_User_B(P(/ToGate8),9,VcrVcc01,VcrVcc02,VcrVcc03,VcrVcc04,MainVcrVcc,MainVcrVgcOpen,MainVcrVgcClose,MainVhxVcc,0)
ToGate10=ToGateway_User_B(P(/ToGate9),10,MainVhxVgcOpen,MainVhxVgcClose,MKS925,0,0,0,1,0,999)

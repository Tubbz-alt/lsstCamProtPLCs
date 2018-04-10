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
! I0.6=HVTurboSpeed                     ;HEX Vacuum Turbo speed
! I0.7=CVTurboSpeed                     ;Cryostat Vacuum Turbo speed
! Q0.0=CVStat                           ;Cryostat Vacuum Status PRT-UTT-PLC-03/I6
! Q0.1=HVStat                           ;HEX-Can Vacuum Status PRT-UTT-PLC-03/I5
! Q0.2=MainVcrVcc                       ;Cryostat VCR-UTT-VCC-00
! Q0.3=MainVhxVcc                       ;HEX-Can VHX-UTT-VCC-01
! GM0.0=CVStatLstatus                   ;
! GM0.8=OpenMainVcrVcc                  ;
! GM0.9=CloseMainVcrVcc                 ;
! GM0.10=OpenMainVhxVcc                 ;
! GM0.11=CloseMainVhxVcc                ;

! Pgm_Pluto:0
! Instruction_Set_3
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
! M0.12=MainChambeValid                 ;
! M0.13=CVTurboValid                    ;
! M0.14=CVInterlockvalid                ;
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
! R0.11=CVPRessureDiff                  ;
! R0.30=HVTurboSpeedVoltage             ;
! R0.31=HVTurboSpeedSpeed               ;
! R0.32=CVTurboSpeedVoltage             ;
! R0.33=CVTurboSpeedSpeed               ;


S0.0_0
MVacReset=VacResetE+TempReset
HVInterlockValid=ReadVoltage(0,0,10000,HVInterlockVoltage,HVInterlockPressure)
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
HVTurboSpeedValid=ReadVoltage(6,0,10000,HVTurboSpeedVoltage,HVTurboSpeedSpeed)
;
;Heat-Exchanger Valve Control
;
HVTurboPumpOFF=(HVTurboSpeedSpeed<1000)
HVTurboPumpON=(HVTurboSpeedSpeed>5000)
HVTurboValid=ReadVoltage(1,0,10000,HVTurboVoltage,HVTurboPressure)
S(MainVhxVcc)=P(CloseMainVhxVcc)+HVTurboPumpON*/MKS925
;Close
R(CloseMainVhxVcc)=SM_1Hz
(HVPressureDiff=HVTurboPressure-HVInterlockPressure)=(HVInterlockPressure<=HVTurboPressure)
;OPEN
(HVPressureDiff=HVInterlockPressure-HVTurboPressure)=(HVInterlockPressure>HVTurboPressure)
R(MainVhxVcc)=P(OpenMainVhxVcc)*(HVTurboPumpOFF*(HVPressureDiff<50)+HVTurboPumpON*(HVPressureDiff=100))
R(OpenMainVhxVcc)=SM_1Hz
VHXPumpPerm=(HVTurboPressure<10)*(/HVTurboPumpON+MKS925)
;
;Heat-Exchanger Turbo Pump Control
;

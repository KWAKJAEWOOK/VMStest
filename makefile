# makefile to build generated files

include ../../platform.mk

# include directories
OSROOTDIR = ..$(PS)..$(PS)..
LIBDIR  = $(OSROOTDIR)$(PS)c$(RTDIRSFX)$(PS)lib
PRJLIBDIR = .$(PS)lib
PRJBINDIR = .$(PS)bin
PRJOBJDIR = .$(PS)obj
RTSRCDIR = $(OSROOTDIR)$(PS)rtsrc
RTXSRCDIR = $(OSROOTDIR)$(PS)rtxsrc
PERSRCDIR = $(OSROOTDIR)$(PS)rtpersrc
SRCDIR = .
HFILESDIR = .
HFILES =  \
$(RTSRCDIR)$(PS)asn1type.h \
$(RTXSRCDIR)$(PS)osMacros.h \
$(RTXSRCDIR)$(PS)osSysTypes.h \
$(RTXSRCDIR)$(PS)rtxContext.h \
$(RTXSRCDIR)$(PS)rtxDList.h \
$(RTXSRCDIR)$(PS)rtxExternDefs.h \
$(RTXSRCDIR)$(PS)rtxCommonDefs.h \
$(RTXSRCDIR)$(PS)rtxStack.h \
$(PERSRCDIR)$(PS)asn1per.h

# compiler defs
CFLAGS = -c $(CVARS_) $(CFLAGS_) $(CBLDTYPE_)
IPATHS = -I$(SRCDIR) -I$(OSROOTDIR) -I$(HFILESDIR) -I. -I$(RTSRCDIR) -I$(PERSRCDIR) $(IPATHS_)
LINKOPT = $(LINKOPT_)

# run-time libraries
LIBS = $(LIBDIR)/$(LIBPFX)asn1per$(A) $(LIBDIR)/$(LIBPFX)asn1rt$(A)
LLIBS = $(LLPFX)asn1per$(LLAEXT) $(LLPFX)asn1rt$(LLAEXT) $(LLSYS)
LPATHS = $(LPPFX)$(LIBDIR)

OBJECTS =  \
$(PRJOBJDIR)$(PS)EfcDataDictionary$(OBJ) \
$(PRJOBJDIR)$(PS)J2540ITIS$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpB$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpC$(OBJ) \
$(PRJOBJDIR)$(PS)BasicSafetyMessage$(OBJ) \
$(PRJOBJDIR)$(PS)Common$(OBJ) \
$(PRJOBJDIR)$(PS)CommonSafetyRequest$(OBJ) \
$(PRJOBJDIR)$(PS)EmergencyVehicleAlert$(OBJ) \
$(PRJOBJDIR)$(PS)ITIS$(OBJ) \
$(PRJOBJDIR)$(PS)IntersectionCollision$(OBJ) \
$(PRJOBJDIR)$(PS)MapData$(OBJ) \
$(PRJOBJDIR)$(PS)MessageFrame$(OBJ) \
$(PRJOBJDIR)$(PS)NMEAcorrections$(OBJ) \
$(PRJOBJDIR)$(PS)NTCIP$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessage$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataManagement$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeVehicleData$(OBJ) \
$(PRJOBJDIR)$(PS)RTCMcorrections$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSideAlert$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequest$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatus$(OBJ) \
$(PRJOBJDIR)$(PS)SPAT$(OBJ) \
$(PRJOBJDIR)$(PS)SignalRequestMessage$(OBJ) \
$(PRJOBJDIR)$(PS)SignalStatusMessage$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTiming$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage00$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage01$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage02$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage03$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage04$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage05$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage06$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage07$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage08$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage09$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage10$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage11$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage12$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage13$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage14$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage15$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficLightStatusMessage$(OBJ) \
$(PRJOBJDIR)$(PS)TravelerInformation$(OBJ) \
$(PRJOBJDIR)$(PS)RoadWeatherMessage$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSafetyMessage$(OBJ) \
$(PRJOBJDIR)$(PS)CooperativeControlMessage$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2$(OBJ) \
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributes$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataConfig$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataReport$(OBJ) \
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessage$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessage$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessage$(OBJ) \
$(PRJOBJDIR)$(PS)TollAdvertisementMessage$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageAckMessage$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageMessage$(OBJ) \
$(PRJOBJDIR)$(PS)SensorDataSharingMessage$(OBJ)

ENCOBJECTS =  \
$(PRJOBJDIR)$(PS)EfcDataDictionaryEnc$(OBJ) \
$(PRJOBJDIR)$(PS)J2540ITISEnc$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpBEnc$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpCEnc$(OBJ) \
$(PRJOBJDIR)$(PS)BasicSafetyMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)CommonEnc$(OBJ) \
$(PRJOBJDIR)$(PS)CommonSafetyRequestEnc$(OBJ) \
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertEnc$(OBJ) \
$(PRJOBJDIR)$(PS)ITISEnc$(OBJ) \
$(PRJOBJDIR)$(PS)IntersectionCollisionEnc$(OBJ) \
$(PRJOBJDIR)$(PS)MapDataEnc$(OBJ) \
$(PRJOBJDIR)$(PS)MessageFrameEnc$(OBJ) \
$(PRJOBJDIR)$(PS)NMEAcorrectionsEnc$(OBJ) \
$(PRJOBJDIR)$(PS)NTCIPEnc$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataManagementEnc$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeVehicleDataEnc$(OBJ) \
$(PRJOBJDIR)$(PS)RTCMcorrectionsEnc$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSideAlertEnc$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestEnc$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusEnc$(OBJ) \
$(PRJOBJDIR)$(PS)SPATEnc$(OBJ) \
$(PRJOBJDIR)$(PS)SignalRequestMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)SignalStatusMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingEnc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage00Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage01Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage02Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage03Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage04Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage05Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage06Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage07Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage08Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage09Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage10Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage11Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage12Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage13Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage14Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage15Enc$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficLightStatusMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)TravelerInformationEnc$(OBJ) \
$(PRJOBJDIR)$(PS)RoadWeatherMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSafetyMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)CooperativeControlMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Enc$(OBJ) \
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesEnc$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataConfigEnc$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataReportEnc$(OBJ) \
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)TollAdvertisementMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageAckMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageMessageEnc$(OBJ) \
$(PRJOBJDIR)$(PS)SensorDataSharingMessageEnc$(OBJ)

DECOBJECTS =  \
$(PRJOBJDIR)$(PS)EfcDataDictionaryDec$(OBJ) \
$(PRJOBJDIR)$(PS)J2540ITISDec$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpBDec$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpCDec$(OBJ) \
$(PRJOBJDIR)$(PS)BasicSafetyMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)CommonDec$(OBJ) \
$(PRJOBJDIR)$(PS)CommonSafetyRequestDec$(OBJ) \
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertDec$(OBJ) \
$(PRJOBJDIR)$(PS)ITISDec$(OBJ) \
$(PRJOBJDIR)$(PS)IntersectionCollisionDec$(OBJ) \
$(PRJOBJDIR)$(PS)MapDataDec$(OBJ) \
$(PRJOBJDIR)$(PS)MessageFrameDec$(OBJ) \
$(PRJOBJDIR)$(PS)NMEAcorrectionsDec$(OBJ) \
$(PRJOBJDIR)$(PS)NTCIPDec$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataManagementDec$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeVehicleDataDec$(OBJ) \
$(PRJOBJDIR)$(PS)RTCMcorrectionsDec$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSideAlertDec$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestDec$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusDec$(OBJ) \
$(PRJOBJDIR)$(PS)SPATDec$(OBJ) \
$(PRJOBJDIR)$(PS)SignalRequestMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)SignalStatusMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingDec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage00Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage01Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage02Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage03Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage04Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage05Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage06Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage07Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage08Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage09Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage10Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage11Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage12Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage13Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage14Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage15Dec$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficLightStatusMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)TravelerInformationDec$(OBJ) \
$(PRJOBJDIR)$(PS)RoadWeatherMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSafetyMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)CooperativeControlMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Dec$(OBJ) \
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesDec$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataConfigDec$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataReportDec$(OBJ) \
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)TollAdvertisementMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageAckMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageMessageDec$(OBJ) \
$(PRJOBJDIR)$(PS)SensorDataSharingMessageDec$(OBJ)

PRTOBJECTS =  \
$(PRJOBJDIR)$(PS)EfcDataDictionaryPrint$(OBJ) \
$(PRJOBJDIR)$(PS)J2540ITISPrint$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpBPrint$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpCPrint$(OBJ) \
$(PRJOBJDIR)$(PS)BasicSafetyMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)CommonPrint$(OBJ) \
$(PRJOBJDIR)$(PS)CommonSafetyRequestPrint$(OBJ) \
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertPrint$(OBJ) \
$(PRJOBJDIR)$(PS)ITISPrint$(OBJ) \
$(PRJOBJDIR)$(PS)IntersectionCollisionPrint$(OBJ) \
$(PRJOBJDIR)$(PS)MapDataPrint$(OBJ) \
$(PRJOBJDIR)$(PS)MessageFramePrint$(OBJ) \
$(PRJOBJDIR)$(PS)NMEAcorrectionsPrint$(OBJ) \
$(PRJOBJDIR)$(PS)NTCIPPrint$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataManagementPrint$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeVehicleDataPrint$(OBJ) \
$(PRJOBJDIR)$(PS)RTCMcorrectionsPrint$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSideAlertPrint$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestPrint$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusPrint$(OBJ) \
$(PRJOBJDIR)$(PS)SPATPrint$(OBJ) \
$(PRJOBJDIR)$(PS)SignalRequestMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)SignalStatusMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingPrint$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage00Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage01Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage02Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage03Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage04Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage05Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage06Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage07Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage08Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage09Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage10Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage11Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage12Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage13Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage14Print$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage15Print$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficLightStatusMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)TravelerInformationPrint$(OBJ) \
$(PRJOBJDIR)$(PS)RoadWeatherMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSafetyMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)CooperativeControlMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Print$(OBJ) \
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesPrint$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataConfigPrint$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataReportPrint$(OBJ) \
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)TollAdvertisementMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageAckMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageMessagePrint$(OBJ) \
$(PRJOBJDIR)$(PS)SensorDataSharingMessagePrint$(OBJ)

TESTOBJECTS =  \
$(PRJOBJDIR)$(PS)EfcDataDictionaryTest$(OBJ) \
$(PRJOBJDIR)$(PS)J2540ITISTest$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpBTest$(OBJ) \
$(PRJOBJDIR)$(PS)AddGrpCTest$(OBJ) \
$(PRJOBJDIR)$(PS)BasicSafetyMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)CommonTest$(OBJ) \
$(PRJOBJDIR)$(PS)CommonSafetyRequestTest$(OBJ) \
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertTest$(OBJ) \
$(PRJOBJDIR)$(PS)ITISTest$(OBJ) \
$(PRJOBJDIR)$(PS)IntersectionCollisionTest$(OBJ) \
$(PRJOBJDIR)$(PS)MapDataTest$(OBJ) \
$(PRJOBJDIR)$(PS)MessageFrameTest$(OBJ) \
$(PRJOBJDIR)$(PS)NMEAcorrectionsTest$(OBJ) \
$(PRJOBJDIR)$(PS)NTCIPTest$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataManagementTest$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeVehicleDataTest$(OBJ) \
$(PRJOBJDIR)$(PS)RTCMcorrectionsTest$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSideAlertTest$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestTest$(OBJ) \
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusTest$(OBJ) \
$(PRJOBJDIR)$(PS)SPATTest$(OBJ) \
$(PRJOBJDIR)$(PS)SignalRequestMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)SignalStatusMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingTest$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage00Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage01Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage02Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage03Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage04Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage05Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage06Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage07Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage08Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage09Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage10Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage11Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage12Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage13Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage14Test$(OBJ) \
$(PRJOBJDIR)$(PS)TestMessage15Test$(OBJ) \
$(PRJOBJDIR)$(PS)TrafficLightStatusMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)TravelerInformationTest$(OBJ) \
$(PRJOBJDIR)$(PS)RoadWeatherMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)RoadSafetyMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)CooperativeControlMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Test$(OBJ) \
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesTest$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataConfigTest$(OBJ) \
$(PRJOBJDIR)$(PS)ProbeDataReportTest$(OBJ) \
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)TollAdvertisementMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageAckMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)TollUsageMessageTest$(OBJ) \
$(PRJOBJDIR)$(PS)SensorDataSharingMessageTest$(OBJ)

all : $(OBJECTS) $(ENCOBJECTS) $(DECOBJECTS) $(PRTOBJECTS)  \
$(TESTOBJECTS) $(PRJBINDIR)$(PS)writer$(EXE) $(PRJBINDIR)$(PS)reader$(EXE)

WRITEROBJ = $(PRJOBJDIR)$(PS)writer$(OBJ) $(OBJECTS) $(ENCOBJECTS) $(TESTOBJECTS) \
 $(PRTOBJECTS)

$(PRJBINDIR)/writer$(EXE) : $(WRITEROBJ) $(LIBS)
	$(LINK) $(WRITEROBJ) $(LINKOPT) $(LPATHS) $(LLIBS)

READEROBJ = $(PRJOBJDIR)$(PS)reader$(OBJ) \
            $(PRJOBJDIR)$(PS)VMSconnection_manager$(OBJ) \
			$(PRJOBJDIR)$(PS)VMSprotocol$(OBJ) \
			$(PRJOBJDIR)$(PS)cJSON$(OBJ) \
			$(PRJOBJDIR)$(PS)sds_json_parser$(OBJ) \
            $(OBJECTS) $(DECOBJECTS) $(ENCOBJECTS) $(PRTOBJECTS)

$(PRJBINDIR)/reader$(EXE) : $(READEROBJ) $(LIBS)
	$(LINK) $(READEROBJ) $(LINKOPT) $(LPATHS) $(LLIBS)

RWHFILES = $(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILES)

$(PRJOBJDIR)$(PS)writer$(OBJ) : $(SRCDIR)$(PS)writer.c $(RWHFILES)
	$(CC) -c $(CFLAGS) $(OBJOUT) $(IPATHS) $(SRCDIR)$(PS)writer.c

$(PRJOBJDIR)$(PS)reader$(OBJ) : \
    $(SRCDIR)$(PS)reader.c \
    $(SRCDIR)$(PS)VMSconnection_manager.h \
	$(SRCDIR)$(PS)VMSprotocol.h \
	$(SRCDIR)$(PS)cJSON.h \
	$(SRCDIR)$(PS)sds_json_types.h \
    $(RWHFILES)
	$(CC) -c $(CFLAGS) $(OBJOUT) $(IPATHS) $(SRCDIR)$(PS)reader.c

# .c -> .obj rules
# common file rules
$(PRJOBJDIR)$(PS)EfcDataDictionary$(OBJ) : $(SRCDIR)$(PS)EfcDataDictionary.c \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EfcDataDictionary.c

# decode file rules
$(PRJOBJDIR)$(PS)EfcDataDictionaryDec$(OBJ) : $(SRCDIR)$(PS)EfcDataDictionaryDec.c \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EfcDataDictionaryDec.c

# encode file rules
$(PRJOBJDIR)$(PS)EfcDataDictionaryEnc$(OBJ) : $(SRCDIR)$(PS)EfcDataDictionaryEnc.c \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EfcDataDictionaryEnc.c

# print file rules
$(PRJOBJDIR)$(PS)EfcDataDictionaryPrint$(OBJ) : $(SRCDIR)$(PS)EfcDataDictionaryPrint.c \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EfcDataDictionaryPrint.c

# test file rules
$(PRJOBJDIR)$(PS)EfcDataDictionaryTest$(OBJ) : $(SRCDIR)$(PS)EfcDataDictionaryTest.c \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EfcDataDictionaryTest.c

# common file rules
$(PRJOBJDIR)$(PS)J2540ITIS$(OBJ) : $(SRCDIR)$(PS)J2540ITIS.c \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)J2540ITIS.c

# decode file rules
$(PRJOBJDIR)$(PS)J2540ITISDec$(OBJ) : $(SRCDIR)$(PS)J2540ITISDec.c \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)J2540ITISDec.c

# encode file rules
$(PRJOBJDIR)$(PS)J2540ITISEnc$(OBJ) : $(SRCDIR)$(PS)J2540ITISEnc.c \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)J2540ITISEnc.c

# print file rules
$(PRJOBJDIR)$(PS)J2540ITISPrint$(OBJ) : $(SRCDIR)$(PS)J2540ITISPrint.c \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)J2540ITISPrint.c

# test file rules
$(PRJOBJDIR)$(PS)J2540ITISTest$(OBJ) : $(SRCDIR)$(PS)J2540ITISTest.c \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)J2540ITISTest.c

# common file rules
$(PRJOBJDIR)$(PS)AddGrpB$(OBJ) : $(SRCDIR)$(PS)AddGrpB.c \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpB.c

# decode file rules
$(PRJOBJDIR)$(PS)AddGrpBDec$(OBJ) : $(SRCDIR)$(PS)AddGrpBDec.c \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpBDec.c

# encode file rules
$(PRJOBJDIR)$(PS)AddGrpBEnc$(OBJ) : $(SRCDIR)$(PS)AddGrpBEnc.c \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpBEnc.c

# print file rules
$(PRJOBJDIR)$(PS)AddGrpBPrint$(OBJ) : $(SRCDIR)$(PS)AddGrpBPrint.c \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpBPrint.c

# test file rules
$(PRJOBJDIR)$(PS)AddGrpBTest$(OBJ) : $(SRCDIR)$(PS)AddGrpBTest.c \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpBTest.c

# common file rules
$(PRJOBJDIR)$(PS)AddGrpC$(OBJ) : $(SRCDIR)$(PS)AddGrpC.c \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpC.c

# decode file rules
$(PRJOBJDIR)$(PS)AddGrpCDec$(OBJ) : $(SRCDIR)$(PS)AddGrpCDec.c \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpCDec.c

# encode file rules
$(PRJOBJDIR)$(PS)AddGrpCEnc$(OBJ) : $(SRCDIR)$(PS)AddGrpCEnc.c \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpCEnc.c

# print file rules
$(PRJOBJDIR)$(PS)AddGrpCPrint$(OBJ) : $(SRCDIR)$(PS)AddGrpCPrint.c \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpCPrint.c

# test file rules
$(PRJOBJDIR)$(PS)AddGrpCTest$(OBJ) : $(SRCDIR)$(PS)AddGrpCTest.c \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)AddGrpCTest.c

# common file rules
$(PRJOBJDIR)$(PS)BasicSafetyMessage$(OBJ) : $(SRCDIR)$(PS)BasicSafetyMessage.c \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)BasicSafetyMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)BasicSafetyMessageDec$(OBJ) : $(SRCDIR)$(PS)BasicSafetyMessageDec.c \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)BasicSafetyMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)BasicSafetyMessageEnc$(OBJ) : $(SRCDIR)$(PS)BasicSafetyMessageEnc.c \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)BasicSafetyMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)BasicSafetyMessagePrint$(OBJ) : $(SRCDIR)$(PS)BasicSafetyMessagePrint.c \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)BasicSafetyMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)BasicSafetyMessageTest$(OBJ) : $(SRCDIR)$(PS)BasicSafetyMessageTest.c \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)BasicSafetyMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)Common$(OBJ) : $(SRCDIR)$(PS)Common.c \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)Common.c

# decode file rules
$(PRJOBJDIR)$(PS)CommonDec$(OBJ) : $(SRCDIR)$(PS)CommonDec.c \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonDec.c

# encode file rules
$(PRJOBJDIR)$(PS)CommonEnc$(OBJ) : $(SRCDIR)$(PS)CommonEnc.c \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonEnc.c

# print file rules
$(PRJOBJDIR)$(PS)CommonPrint$(OBJ) : $(SRCDIR)$(PS)CommonPrint.c \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonPrint.c

# test file rules
$(PRJOBJDIR)$(PS)CommonTest$(OBJ) : $(SRCDIR)$(PS)CommonTest.c \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonTest.c

# common file rules
$(PRJOBJDIR)$(PS)CommonSafetyRequest$(OBJ) : $(SRCDIR)$(PS)CommonSafetyRequest.c \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonSafetyRequest.c

# decode file rules
$(PRJOBJDIR)$(PS)CommonSafetyRequestDec$(OBJ) : $(SRCDIR)$(PS)CommonSafetyRequestDec.c \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonSafetyRequestDec.c

# encode file rules
$(PRJOBJDIR)$(PS)CommonSafetyRequestEnc$(OBJ) : $(SRCDIR)$(PS)CommonSafetyRequestEnc.c \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonSafetyRequestEnc.c

# print file rules
$(PRJOBJDIR)$(PS)CommonSafetyRequestPrint$(OBJ) : $(SRCDIR)$(PS)CommonSafetyRequestPrint.c \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonSafetyRequestPrint.c

# test file rules
$(PRJOBJDIR)$(PS)CommonSafetyRequestTest$(OBJ) : $(SRCDIR)$(PS)CommonSafetyRequestTest.c \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CommonSafetyRequestTest.c

# common file rules
$(PRJOBJDIR)$(PS)EmergencyVehicleAlert$(OBJ) : $(SRCDIR)$(PS)EmergencyVehicleAlert.c \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EmergencyVehicleAlert.c

# decode file rules
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertDec$(OBJ) : $(SRCDIR)$(PS)EmergencyVehicleAlertDec.c \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EmergencyVehicleAlertDec.c

# encode file rules
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertEnc$(OBJ) : $(SRCDIR)$(PS)EmergencyVehicleAlertEnc.c \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EmergencyVehicleAlertEnc.c

# print file rules
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertPrint$(OBJ) : $(SRCDIR)$(PS)EmergencyVehicleAlertPrint.c \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EmergencyVehicleAlertPrint.c

# test file rules
$(PRJOBJDIR)$(PS)EmergencyVehicleAlertTest$(OBJ) : $(SRCDIR)$(PS)EmergencyVehicleAlertTest.c \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)EmergencyVehicleAlertTest.c

# common file rules
$(PRJOBJDIR)$(PS)ITIS$(OBJ) : $(SRCDIR)$(PS)ITIS.c \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ITIS.c

# decode file rules
$(PRJOBJDIR)$(PS)ITISDec$(OBJ) : $(SRCDIR)$(PS)ITISDec.c \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ITISDec.c

# encode file rules
$(PRJOBJDIR)$(PS)ITISEnc$(OBJ) : $(SRCDIR)$(PS)ITISEnc.c \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ITISEnc.c

# print file rules
$(PRJOBJDIR)$(PS)ITISPrint$(OBJ) : $(SRCDIR)$(PS)ITISPrint.c \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ITISPrint.c

# test file rules
$(PRJOBJDIR)$(PS)ITISTest$(OBJ) : $(SRCDIR)$(PS)ITISTest.c \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ITISTest.c

# common file rules
$(PRJOBJDIR)$(PS)IntersectionCollision$(OBJ) : $(SRCDIR)$(PS)IntersectionCollision.c \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)IntersectionCollision.c

# decode file rules
$(PRJOBJDIR)$(PS)IntersectionCollisionDec$(OBJ) : $(SRCDIR)$(PS)IntersectionCollisionDec.c \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)IntersectionCollisionDec.c

# encode file rules
$(PRJOBJDIR)$(PS)IntersectionCollisionEnc$(OBJ) : $(SRCDIR)$(PS)IntersectionCollisionEnc.c \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)IntersectionCollisionEnc.c

# print file rules
$(PRJOBJDIR)$(PS)IntersectionCollisionPrint$(OBJ) : $(SRCDIR)$(PS)IntersectionCollisionPrint.c \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)IntersectionCollisionPrint.c

# test file rules
$(PRJOBJDIR)$(PS)IntersectionCollisionTest$(OBJ) : $(SRCDIR)$(PS)IntersectionCollisionTest.c \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)IntersectionCollisionTest.c

# common file rules
$(PRJOBJDIR)$(PS)MapData$(OBJ) : $(SRCDIR)$(PS)MapData.c \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MapData.c

# decode file rules
$(PRJOBJDIR)$(PS)MapDataDec$(OBJ) : $(SRCDIR)$(PS)MapDataDec.c \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MapDataDec.c

# encode file rules
$(PRJOBJDIR)$(PS)MapDataEnc$(OBJ) : $(SRCDIR)$(PS)MapDataEnc.c \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MapDataEnc.c

# print file rules
$(PRJOBJDIR)$(PS)MapDataPrint$(OBJ) : $(SRCDIR)$(PS)MapDataPrint.c \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MapDataPrint.c

# test file rules
$(PRJOBJDIR)$(PS)MapDataTest$(OBJ) : $(SRCDIR)$(PS)MapDataTest.c \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MapDataTest.c

# common file rules
$(PRJOBJDIR)$(PS)MessageFrame$(OBJ) : $(SRCDIR)$(PS)MessageFrame.c \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MessageFrame.c

# decode file rules
$(PRJOBJDIR)$(PS)MessageFrameDec$(OBJ) : $(SRCDIR)$(PS)MessageFrameDec.c \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MessageFrameDec.c

# encode file rules
$(PRJOBJDIR)$(PS)MessageFrameEnc$(OBJ) : $(SRCDIR)$(PS)MessageFrameEnc.c \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MessageFrameEnc.c

# print file rules
$(PRJOBJDIR)$(PS)MessageFramePrint$(OBJ) : $(SRCDIR)$(PS)MessageFramePrint.c \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MessageFramePrint.c

# test file rules
$(PRJOBJDIR)$(PS)MessageFrameTest$(OBJ) : $(SRCDIR)$(PS)MessageFrameTest.c \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)CommonSafetyRequest.h \
$(HFILESDIR)$(PS)EmergencyVehicleAlert.h \
$(HFILESDIR)$(PS)IntersectionCollision.h \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)MessageFrameTest.c

# common file rules
$(PRJOBJDIR)$(PS)NMEAcorrections$(OBJ) : $(SRCDIR)$(PS)NMEAcorrections.c \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NMEAcorrections.c

# decode file rules
$(PRJOBJDIR)$(PS)NMEAcorrectionsDec$(OBJ) : $(SRCDIR)$(PS)NMEAcorrectionsDec.c \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NMEAcorrectionsDec.c

# encode file rules
$(PRJOBJDIR)$(PS)NMEAcorrectionsEnc$(OBJ) : $(SRCDIR)$(PS)NMEAcorrectionsEnc.c \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NMEAcorrectionsEnc.c

# print file rules
$(PRJOBJDIR)$(PS)NMEAcorrectionsPrint$(OBJ) : $(SRCDIR)$(PS)NMEAcorrectionsPrint.c \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NMEAcorrectionsPrint.c

# test file rules
$(PRJOBJDIR)$(PS)NMEAcorrectionsTest$(OBJ) : $(SRCDIR)$(PS)NMEAcorrectionsTest.c \
$(HFILESDIR)$(PS)NMEAcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NMEAcorrectionsTest.c

# common file rules
$(PRJOBJDIR)$(PS)NTCIP$(OBJ) : $(SRCDIR)$(PS)NTCIP.c \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NTCIP.c

# decode file rules
$(PRJOBJDIR)$(PS)NTCIPDec$(OBJ) : $(SRCDIR)$(PS)NTCIPDec.c \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NTCIPDec.c

# encode file rules
$(PRJOBJDIR)$(PS)NTCIPEnc$(OBJ) : $(SRCDIR)$(PS)NTCIPEnc.c \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NTCIPEnc.c

# print file rules
$(PRJOBJDIR)$(PS)NTCIPPrint$(OBJ) : $(SRCDIR)$(PS)NTCIPPrint.c \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NTCIPPrint.c

# test file rules
$(PRJOBJDIR)$(PS)NTCIPTest$(OBJ) : $(SRCDIR)$(PS)NTCIPTest.c \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)NTCIPTest.c

# common file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessage$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessage.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessageDec$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessageDec.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessageEnc$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessageEnc.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessagePrint$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessagePrint.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessageTest$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessageTest.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)ProbeDataManagement$(OBJ) : $(SRCDIR)$(PS)ProbeDataManagement.c \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataManagement.c

# decode file rules
$(PRJOBJDIR)$(PS)ProbeDataManagementDec$(OBJ) : $(SRCDIR)$(PS)ProbeDataManagementDec.c \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataManagementDec.c

# encode file rules
$(PRJOBJDIR)$(PS)ProbeDataManagementEnc$(OBJ) : $(SRCDIR)$(PS)ProbeDataManagementEnc.c \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataManagementEnc.c

# print file rules
$(PRJOBJDIR)$(PS)ProbeDataManagementPrint$(OBJ) : $(SRCDIR)$(PS)ProbeDataManagementPrint.c \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataManagementPrint.c

# test file rules
$(PRJOBJDIR)$(PS)ProbeDataManagementTest$(OBJ) : $(SRCDIR)$(PS)ProbeDataManagementTest.c \
$(HFILESDIR)$(PS)ProbeDataManagement.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataManagementTest.c

# common file rules
$(PRJOBJDIR)$(PS)ProbeVehicleData$(OBJ) : $(SRCDIR)$(PS)ProbeVehicleData.c \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeVehicleData.c

# decode file rules
$(PRJOBJDIR)$(PS)ProbeVehicleDataDec$(OBJ) : $(SRCDIR)$(PS)ProbeVehicleDataDec.c \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeVehicleDataDec.c

# encode file rules
$(PRJOBJDIR)$(PS)ProbeVehicleDataEnc$(OBJ) : $(SRCDIR)$(PS)ProbeVehicleDataEnc.c \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeVehicleDataEnc.c

# print file rules
$(PRJOBJDIR)$(PS)ProbeVehicleDataPrint$(OBJ) : $(SRCDIR)$(PS)ProbeVehicleDataPrint.c \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeVehicleDataPrint.c

# test file rules
$(PRJOBJDIR)$(PS)ProbeVehicleDataTest$(OBJ) : $(SRCDIR)$(PS)ProbeVehicleDataTest.c \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)NTCIP.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeVehicleDataTest.c

# common file rules
$(PRJOBJDIR)$(PS)RTCMcorrections$(OBJ) : $(SRCDIR)$(PS)RTCMcorrections.c \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RTCMcorrections.c

# decode file rules
$(PRJOBJDIR)$(PS)RTCMcorrectionsDec$(OBJ) : $(SRCDIR)$(PS)RTCMcorrectionsDec.c \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RTCMcorrectionsDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RTCMcorrectionsEnc$(OBJ) : $(SRCDIR)$(PS)RTCMcorrectionsEnc.c \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RTCMcorrectionsEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RTCMcorrectionsPrint$(OBJ) : $(SRCDIR)$(PS)RTCMcorrectionsPrint.c \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RTCMcorrectionsPrint.c

# test file rules
$(PRJOBJDIR)$(PS)RTCMcorrectionsTest$(OBJ) : $(SRCDIR)$(PS)RTCMcorrectionsTest.c \
$(HFILESDIR)$(PS)RTCMcorrections.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RTCMcorrectionsTest.c

# common file rules
$(PRJOBJDIR)$(PS)RoadSideAlert$(OBJ) : $(SRCDIR)$(PS)RoadSideAlert.c \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSideAlert.c

# decode file rules
$(PRJOBJDIR)$(PS)RoadSideAlertDec$(OBJ) : $(SRCDIR)$(PS)RoadSideAlertDec.c \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSideAlertDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RoadSideAlertEnc$(OBJ) : $(SRCDIR)$(PS)RoadSideAlertEnc.c \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSideAlertEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RoadSideAlertPrint$(OBJ) : $(SRCDIR)$(PS)RoadSideAlertPrint.c \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSideAlertPrint.c

# test file rules
$(PRJOBJDIR)$(PS)RoadSideAlertTest$(OBJ) : $(SRCDIR)$(PS)RoadSideAlertTest.c \
$(HFILESDIR)$(PS)RoadSideAlert.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSideAlertTest.c

# common file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequest$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationRequest.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationRequest.c

# decode file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestDec$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestDec.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestDec.c

# encode file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestEnc$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestEnc.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestEnc.c

# print file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestPrint$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestPrint.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestPrint.c

# test file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationRequestTest$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestTest.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationRequest.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationRequestTest.c

# common file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatus$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationStatus.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationStatus.c

# decode file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusDec$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusDec.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusDec.c

# encode file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusEnc$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusEnc.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusEnc.c

# print file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusPrint$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusPrint.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusPrint.c

# test file rules
$(PRJOBJDIR)$(PS)SignalControlAndPrioritizationStatusTest$(OBJ) : $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusTest.c \
$(HFILESDIR)$(PS)SignalControlAndPrioritizationStatus.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalControlAndPrioritizationStatusTest.c

# common file rules
$(PRJOBJDIR)$(PS)SPAT$(OBJ) : $(SRCDIR)$(PS)SPAT.c \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SPAT.c

# decode file rules
$(PRJOBJDIR)$(PS)SPATDec$(OBJ) : $(SRCDIR)$(PS)SPATDec.c \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SPATDec.c

# encode file rules
$(PRJOBJDIR)$(PS)SPATEnc$(OBJ) : $(SRCDIR)$(PS)SPATEnc.c \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SPATEnc.c

# print file rules
$(PRJOBJDIR)$(PS)SPATPrint$(OBJ) : $(SRCDIR)$(PS)SPATPrint.c \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SPATPrint.c

# test file rules
$(PRJOBJDIR)$(PS)SPATTest$(OBJ) : $(SRCDIR)$(PS)SPATTest.c \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)AddGrpB.h \
$(HFILESDIR)$(PS)AddGrpC.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SPATTest.c

# common file rules
$(PRJOBJDIR)$(PS)SignalRequestMessage$(OBJ) : $(SRCDIR)$(PS)SignalRequestMessage.c \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalRequestMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)SignalRequestMessageDec$(OBJ) : $(SRCDIR)$(PS)SignalRequestMessageDec.c \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalRequestMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)SignalRequestMessageEnc$(OBJ) : $(SRCDIR)$(PS)SignalRequestMessageEnc.c \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalRequestMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)SignalRequestMessagePrint$(OBJ) : $(SRCDIR)$(PS)SignalRequestMessagePrint.c \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalRequestMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)SignalRequestMessageTest$(OBJ) : $(SRCDIR)$(PS)SignalRequestMessageTest.c \
$(HFILESDIR)$(PS)SignalRequestMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalRequestMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)SignalStatusMessage$(OBJ) : $(SRCDIR)$(PS)SignalStatusMessage.c \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalStatusMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)SignalStatusMessageDec$(OBJ) : $(SRCDIR)$(PS)SignalStatusMessageDec.c \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalStatusMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)SignalStatusMessageEnc$(OBJ) : $(SRCDIR)$(PS)SignalStatusMessageEnc.c \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalStatusMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)SignalStatusMessagePrint$(OBJ) : $(SRCDIR)$(PS)SignalStatusMessagePrint.c \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalStatusMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)SignalStatusMessageTest$(OBJ) : $(SRCDIR)$(PS)SignalStatusMessageTest.c \
$(HFILESDIR)$(PS)SignalStatusMessage.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SignalStatusMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTiming$(OBJ) : $(SRCDIR)$(PS)TrafficSignalPhaseAndTiming.c \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficSignalPhaseAndTiming.c

# decode file rules
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingDec$(OBJ) : $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingDec.c \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingDec.c

# encode file rules
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingEnc$(OBJ) : $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingEnc.c \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingEnc.c

# print file rules
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingPrint$(OBJ) : $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingPrint.c \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingPrint.c

# test file rules
$(PRJOBJDIR)$(PS)TrafficSignalPhaseAndTimingTest$(OBJ) : $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingTest.c \
$(HFILESDIR)$(PS)TrafficSignalPhaseAndTiming.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficSignalPhaseAndTimingTest.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage00$(OBJ) : $(SRCDIR)$(PS)TestMessage00.c \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage00.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage00Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage00Dec.c \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage00Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage00Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage00Enc.c \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage00Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage00Print$(OBJ) : $(SRCDIR)$(PS)TestMessage00Print.c \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage00Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage00Test$(OBJ) : $(SRCDIR)$(PS)TestMessage00Test.c \
$(HFILESDIR)$(PS)TestMessage00.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage00Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage01$(OBJ) : $(SRCDIR)$(PS)TestMessage01.c \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage01.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage01Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage01Dec.c \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage01Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage01Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage01Enc.c \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage01Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage01Print$(OBJ) : $(SRCDIR)$(PS)TestMessage01Print.c \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage01Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage01Test$(OBJ) : $(SRCDIR)$(PS)TestMessage01Test.c \
$(HFILESDIR)$(PS)TestMessage01.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage01Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage02$(OBJ) : $(SRCDIR)$(PS)TestMessage02.c \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage02.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage02Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage02Dec.c \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage02Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage02Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage02Enc.c \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage02Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage02Print$(OBJ) : $(SRCDIR)$(PS)TestMessage02Print.c \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage02Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage02Test$(OBJ) : $(SRCDIR)$(PS)TestMessage02Test.c \
$(HFILESDIR)$(PS)TestMessage02.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage02Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage03$(OBJ) : $(SRCDIR)$(PS)TestMessage03.c \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage03.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage03Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage03Dec.c \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage03Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage03Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage03Enc.c \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage03Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage03Print$(OBJ) : $(SRCDIR)$(PS)TestMessage03Print.c \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage03Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage03Test$(OBJ) : $(SRCDIR)$(PS)TestMessage03Test.c \
$(HFILESDIR)$(PS)TestMessage03.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage03Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage04$(OBJ) : $(SRCDIR)$(PS)TestMessage04.c \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage04.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage04Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage04Dec.c \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage04Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage04Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage04Enc.c \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage04Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage04Print$(OBJ) : $(SRCDIR)$(PS)TestMessage04Print.c \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage04Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage04Test$(OBJ) : $(SRCDIR)$(PS)TestMessage04Test.c \
$(HFILESDIR)$(PS)TestMessage04.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage04Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage05$(OBJ) : $(SRCDIR)$(PS)TestMessage05.c \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage05.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage05Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage05Dec.c \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage05Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage05Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage05Enc.c \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage05Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage05Print$(OBJ) : $(SRCDIR)$(PS)TestMessage05Print.c \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage05Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage05Test$(OBJ) : $(SRCDIR)$(PS)TestMessage05Test.c \
$(HFILESDIR)$(PS)TestMessage05.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage05Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage06$(OBJ) : $(SRCDIR)$(PS)TestMessage06.c \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage06.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage06Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage06Dec.c \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage06Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage06Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage06Enc.c \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage06Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage06Print$(OBJ) : $(SRCDIR)$(PS)TestMessage06Print.c \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage06Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage06Test$(OBJ) : $(SRCDIR)$(PS)TestMessage06Test.c \
$(HFILESDIR)$(PS)TestMessage06.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage06Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage07$(OBJ) : $(SRCDIR)$(PS)TestMessage07.c \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage07.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage07Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage07Dec.c \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage07Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage07Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage07Enc.c \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage07Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage07Print$(OBJ) : $(SRCDIR)$(PS)TestMessage07Print.c \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage07Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage07Test$(OBJ) : $(SRCDIR)$(PS)TestMessage07Test.c \
$(HFILESDIR)$(PS)TestMessage07.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage07Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage08$(OBJ) : $(SRCDIR)$(PS)TestMessage08.c \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage08.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage08Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage08Dec.c \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage08Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage08Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage08Enc.c \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage08Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage08Print$(OBJ) : $(SRCDIR)$(PS)TestMessage08Print.c \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage08Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage08Test$(OBJ) : $(SRCDIR)$(PS)TestMessage08Test.c \
$(HFILESDIR)$(PS)TestMessage08.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage08Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage09$(OBJ) : $(SRCDIR)$(PS)TestMessage09.c \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage09.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage09Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage09Dec.c \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage09Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage09Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage09Enc.c \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage09Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage09Print$(OBJ) : $(SRCDIR)$(PS)TestMessage09Print.c \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage09Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage09Test$(OBJ) : $(SRCDIR)$(PS)TestMessage09Test.c \
$(HFILESDIR)$(PS)TestMessage09.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage09Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage10$(OBJ) : $(SRCDIR)$(PS)TestMessage10.c \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage10.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage10Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage10Dec.c \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage10Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage10Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage10Enc.c \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage10Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage10Print$(OBJ) : $(SRCDIR)$(PS)TestMessage10Print.c \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage10Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage10Test$(OBJ) : $(SRCDIR)$(PS)TestMessage10Test.c \
$(HFILESDIR)$(PS)TestMessage10.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage10Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage11$(OBJ) : $(SRCDIR)$(PS)TestMessage11.c \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage11.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage11Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage11Dec.c \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage11Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage11Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage11Enc.c \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage11Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage11Print$(OBJ) : $(SRCDIR)$(PS)TestMessage11Print.c \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage11Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage11Test$(OBJ) : $(SRCDIR)$(PS)TestMessage11Test.c \
$(HFILESDIR)$(PS)TestMessage11.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage11Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage12$(OBJ) : $(SRCDIR)$(PS)TestMessage12.c \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage12.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage12Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage12Dec.c \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage12Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage12Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage12Enc.c \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage12Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage12Print$(OBJ) : $(SRCDIR)$(PS)TestMessage12Print.c \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage12Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage12Test$(OBJ) : $(SRCDIR)$(PS)TestMessage12Test.c \
$(HFILESDIR)$(PS)TestMessage12.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage12Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage13$(OBJ) : $(SRCDIR)$(PS)TestMessage13.c \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage13.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage13Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage13Dec.c \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage13Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage13Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage13Enc.c \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage13Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage13Print$(OBJ) : $(SRCDIR)$(PS)TestMessage13Print.c \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage13Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage13Test$(OBJ) : $(SRCDIR)$(PS)TestMessage13Test.c \
$(HFILESDIR)$(PS)TestMessage13.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage13Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage14$(OBJ) : $(SRCDIR)$(PS)TestMessage14.c \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage14.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage14Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage14Dec.c \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage14Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage14Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage14Enc.c \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage14Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage14Print$(OBJ) : $(SRCDIR)$(PS)TestMessage14Print.c \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage14Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage14Test$(OBJ) : $(SRCDIR)$(PS)TestMessage14Test.c \
$(HFILESDIR)$(PS)TestMessage14.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage14Test.c

# common file rules
$(PRJOBJDIR)$(PS)TestMessage15$(OBJ) : $(SRCDIR)$(PS)TestMessage15.c \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage15.c

# decode file rules
$(PRJOBJDIR)$(PS)TestMessage15Dec$(OBJ) : $(SRCDIR)$(PS)TestMessage15Dec.c \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage15Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)TestMessage15Enc$(OBJ) : $(SRCDIR)$(PS)TestMessage15Enc.c \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage15Enc.c

# print file rules
$(PRJOBJDIR)$(PS)TestMessage15Print$(OBJ) : $(SRCDIR)$(PS)TestMessage15Print.c \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage15Print.c

# test file rules
$(PRJOBJDIR)$(PS)TestMessage15Test$(OBJ) : $(SRCDIR)$(PS)TestMessage15Test.c \
$(HFILESDIR)$(PS)TestMessage15.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TestMessage15Test.c

# common file rules
$(PRJOBJDIR)$(PS)TrafficLightStatusMessage$(OBJ) : $(SRCDIR)$(PS)TrafficLightStatusMessage.c \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficLightStatusMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)TrafficLightStatusMessageDec$(OBJ) : $(SRCDIR)$(PS)TrafficLightStatusMessageDec.c \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficLightStatusMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)TrafficLightStatusMessageEnc$(OBJ) : $(SRCDIR)$(PS)TrafficLightStatusMessageEnc.c \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficLightStatusMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)TrafficLightStatusMessagePrint$(OBJ) : $(SRCDIR)$(PS)TrafficLightStatusMessagePrint.c \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficLightStatusMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)TrafficLightStatusMessageTest$(OBJ) : $(SRCDIR)$(PS)TrafficLightStatusMessageTest.c \
$(HFILESDIR)$(PS)TrafficLightStatusMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TrafficLightStatusMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)TravelerInformation$(OBJ) : $(SRCDIR)$(PS)TravelerInformation.c \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TravelerInformation.c

# decode file rules
$(PRJOBJDIR)$(PS)TravelerInformationDec$(OBJ) : $(SRCDIR)$(PS)TravelerInformationDec.c \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TravelerInformationDec.c

# encode file rules
$(PRJOBJDIR)$(PS)TravelerInformationEnc$(OBJ) : $(SRCDIR)$(PS)TravelerInformationEnc.c \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TravelerInformationEnc.c

# print file rules
$(PRJOBJDIR)$(PS)TravelerInformationPrint$(OBJ) : $(SRCDIR)$(PS)TravelerInformationPrint.c \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TravelerInformationPrint.c

# test file rules
$(PRJOBJDIR)$(PS)TravelerInformationTest$(OBJ) : $(SRCDIR)$(PS)TravelerInformationTest.c \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)REGION.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TravelerInformationTest.c

# common file rules
$(PRJOBJDIR)$(PS)RoadWeatherMessage$(OBJ) : $(SRCDIR)$(PS)RoadWeatherMessage.c \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadWeatherMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)RoadWeatherMessageDec$(OBJ) : $(SRCDIR)$(PS)RoadWeatherMessageDec.c \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadWeatherMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RoadWeatherMessageEnc$(OBJ) : $(SRCDIR)$(PS)RoadWeatherMessageEnc.c \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadWeatherMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RoadWeatherMessagePrint$(OBJ) : $(SRCDIR)$(PS)RoadWeatherMessagePrint.c \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadWeatherMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)RoadWeatherMessageTest$(OBJ) : $(SRCDIR)$(PS)RoadWeatherMessageTest.c \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadWeatherMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)RoadSafetyMessage$(OBJ) : $(SRCDIR)$(PS)RoadSafetyMessage.c \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSafetyMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)RoadSafetyMessageDec$(OBJ) : $(SRCDIR)$(PS)RoadSafetyMessageDec.c \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSafetyMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RoadSafetyMessageEnc$(OBJ) : $(SRCDIR)$(PS)RoadSafetyMessageEnc.c \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSafetyMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RoadSafetyMessagePrint$(OBJ) : $(SRCDIR)$(PS)RoadSafetyMessagePrint.c \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSafetyMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)RoadSafetyMessageTest$(OBJ) : $(SRCDIR)$(PS)RoadSafetyMessageTest.c \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)SPAT.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ITIS.h \
$(HFILESDIR)$(PS)J2540ITIS.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadSafetyMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)CooperativeControlMessage$(OBJ) : $(SRCDIR)$(PS)CooperativeControlMessage.c \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CooperativeControlMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)CooperativeControlMessageDec$(OBJ) : $(SRCDIR)$(PS)CooperativeControlMessageDec.c \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CooperativeControlMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)CooperativeControlMessageEnc$(OBJ) : $(SRCDIR)$(PS)CooperativeControlMessageEnc.c \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CooperativeControlMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)CooperativeControlMessagePrint$(OBJ) : $(SRCDIR)$(PS)CooperativeControlMessagePrint.c \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CooperativeControlMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)CooperativeControlMessageTest$(OBJ) : $(SRCDIR)$(PS)CooperativeControlMessageTest.c \
$(HFILESDIR)$(PS)CooperativeControlMessage.h \
$(HFILESDIR)$(PS)BasicSafetyMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)CooperativeControlMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessage2.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessage2.c

# decode file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Dec$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessage2Dec.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessage2Dec.c

# encode file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Enc$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessage2Enc.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessage2Enc.c

# print file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Print$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessage2Print.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessage2Print.c

# test file rules
$(PRJOBJDIR)$(PS)PersonalSafetyMessage2Test$(OBJ) : $(SRCDIR)$(PS)PersonalSafetyMessage2Test.c \
$(HFILESDIR)$(PS)PersonalSafetyMessage2.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)PersonalSafetyMessage2Test.c

# common file rules
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributes$(OBJ) : $(SRCDIR)$(PS)RoadGeometryAndAttributes.c \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadGeometryAndAttributes.c

# decode file rules
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesDec$(OBJ) : $(SRCDIR)$(PS)RoadGeometryAndAttributesDec.c \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadGeometryAndAttributesDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesEnc$(OBJ) : $(SRCDIR)$(PS)RoadGeometryAndAttributesEnc.c \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadGeometryAndAttributesEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesPrint$(OBJ) : $(SRCDIR)$(PS)RoadGeometryAndAttributesPrint.c \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadGeometryAndAttributesPrint.c

# test file rules
$(PRJOBJDIR)$(PS)RoadGeometryAndAttributesTest$(OBJ) : $(SRCDIR)$(PS)RoadGeometryAndAttributesTest.c \
$(HFILESDIR)$(PS)RoadGeometryAndAttributes.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadGeometryAndAttributesTest.c

# common file rules
$(PRJOBJDIR)$(PS)ProbeDataConfig$(OBJ) : $(SRCDIR)$(PS)ProbeDataConfig.c \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataConfig.c

# decode file rules
$(PRJOBJDIR)$(PS)ProbeDataConfigDec$(OBJ) : $(SRCDIR)$(PS)ProbeDataConfigDec.c \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataConfigDec.c

# encode file rules
$(PRJOBJDIR)$(PS)ProbeDataConfigEnc$(OBJ) : $(SRCDIR)$(PS)ProbeDataConfigEnc.c \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataConfigEnc.c

# print file rules
$(PRJOBJDIR)$(PS)ProbeDataConfigPrint$(OBJ) : $(SRCDIR)$(PS)ProbeDataConfigPrint.c \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataConfigPrint.c

# test file rules
$(PRJOBJDIR)$(PS)ProbeDataConfigTest$(OBJ) : $(SRCDIR)$(PS)ProbeDataConfigTest.c \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)MessageFrame.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataConfigTest.c

# common file rules
$(PRJOBJDIR)$(PS)ProbeDataReport$(OBJ) : $(SRCDIR)$(PS)ProbeDataReport.c \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataReport.c

# decode file rules
$(PRJOBJDIR)$(PS)ProbeDataReportDec$(OBJ) : $(SRCDIR)$(PS)ProbeDataReportDec.c \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataReportDec.c

# encode file rules
$(PRJOBJDIR)$(PS)ProbeDataReportEnc$(OBJ) : $(SRCDIR)$(PS)ProbeDataReportEnc.c \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataReportEnc.c

# print file rules
$(PRJOBJDIR)$(PS)ProbeDataReportPrint$(OBJ) : $(SRCDIR)$(PS)ProbeDataReportPrint.c \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataReportPrint.c

# test file rules
$(PRJOBJDIR)$(PS)ProbeDataReportTest$(OBJ) : $(SRCDIR)$(PS)ProbeDataReportTest.c \
$(HFILESDIR)$(PS)ProbeDataReport.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)RoadWeatherMessage.h \
$(HFILESDIR)$(PS)ProbeDataConfig.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ProbeDataReportTest.c

# common file rules
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessage$(OBJ) : $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessage.c \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessageDec$(OBJ) : $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessageDec.c \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessageEnc$(OBJ) : $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessageEnc.c \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessagePrint$(OBJ) : $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessagePrint.c \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)ManeuverSharingAndCoordinatingMessageTest$(OBJ) : $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessageTest.c \
$(HFILESDIR)$(PS)ManeuverSharingAndCoordinatingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)ManeuverSharingAndCoordinatingMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessage$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingConfigMessage.c \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingConfigMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessageDec$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingConfigMessageDec.c \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingConfigMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessageEnc$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingConfigMessageEnc.c \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingConfigMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessagePrint$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingConfigMessagePrint.c \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingConfigMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)RoadUserChargingConfigMessageTest$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingConfigMessageTest.c \
$(HFILESDIR)$(PS)RoadUserChargingConfigMessage.h \
$(HFILESDIR)$(PS)RoadSafetyMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingConfigMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessage$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingReportMessage.c \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingReportMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessageDec$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingReportMessageDec.c \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingReportMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessageEnc$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingReportMessageEnc.c \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingReportMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessagePrint$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingReportMessagePrint.c \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingReportMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)RoadUserChargingReportMessageTest$(OBJ) : $(SRCDIR)$(PS)RoadUserChargingReportMessageTest.c \
$(HFILESDIR)$(PS)RoadUserChargingReportMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TravelerInformation.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)RoadUserChargingReportMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)TollAdvertisementMessage$(OBJ) : $(SRCDIR)$(PS)TollAdvertisementMessage.c \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollAdvertisementMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)TollAdvertisementMessageDec$(OBJ) : $(SRCDIR)$(PS)TollAdvertisementMessageDec.c \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollAdvertisementMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)TollAdvertisementMessageEnc$(OBJ) : $(SRCDIR)$(PS)TollAdvertisementMessageEnc.c \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollAdvertisementMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)TollAdvertisementMessagePrint$(OBJ) : $(SRCDIR)$(PS)TollAdvertisementMessagePrint.c \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollAdvertisementMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)TollAdvertisementMessageTest$(OBJ) : $(SRCDIR)$(PS)TollAdvertisementMessageTest.c \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollAdvertisementMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)TollUsageAckMessage$(OBJ) : $(SRCDIR)$(PS)TollUsageAckMessage.c \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageAckMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)TollUsageAckMessageDec$(OBJ) : $(SRCDIR)$(PS)TollUsageAckMessageDec.c \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageAckMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)TollUsageAckMessageEnc$(OBJ) : $(SRCDIR)$(PS)TollUsageAckMessageEnc.c \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageAckMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)TollUsageAckMessagePrint$(OBJ) : $(SRCDIR)$(PS)TollUsageAckMessagePrint.c \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageAckMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)TollUsageAckMessageTest$(OBJ) : $(SRCDIR)$(PS)TollUsageAckMessageTest.c \
$(HFILESDIR)$(PS)TollUsageAckMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageAckMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)TollUsageMessage$(OBJ) : $(SRCDIR)$(PS)TollUsageMessage.c \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)TollUsageMessageDec$(OBJ) : $(SRCDIR)$(PS)TollUsageMessageDec.c \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)TollUsageMessageEnc$(OBJ) : $(SRCDIR)$(PS)TollUsageMessageEnc.c \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)TollUsageMessagePrint$(OBJ) : $(SRCDIR)$(PS)TollUsageMessagePrint.c \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)TollUsageMessageTest$(OBJ) : $(SRCDIR)$(PS)TollUsageMessageTest.c \
$(HFILESDIR)$(PS)TollUsageMessage.h \
$(HFILESDIR)$(PS)TollAdvertisementMessage.h \
$(HFILESDIR)$(PS)MapData.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)EfcDataDictionary.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)TollUsageMessageTest.c

# common file rules
$(PRJOBJDIR)$(PS)SensorDataSharingMessage$(OBJ) : $(SRCDIR)$(PS)SensorDataSharingMessage.c \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SensorDataSharingMessage.c

# decode file rules
$(PRJOBJDIR)$(PS)SensorDataSharingMessageDec$(OBJ) : $(SRCDIR)$(PS)SensorDataSharingMessageDec.c \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SensorDataSharingMessageDec.c

# encode file rules
$(PRJOBJDIR)$(PS)SensorDataSharingMessageEnc$(OBJ) : $(SRCDIR)$(PS)SensorDataSharingMessageEnc.c \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SensorDataSharingMessageEnc.c

# print file rules
$(PRJOBJDIR)$(PS)SensorDataSharingMessagePrint$(OBJ) : $(SRCDIR)$(PS)SensorDataSharingMessagePrint.c \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SensorDataSharingMessagePrint.c

# test file rules
$(PRJOBJDIR)$(PS)SensorDataSharingMessageTest$(OBJ) : $(SRCDIR)$(PS)SensorDataSharingMessageTest.c \
$(HFILESDIR)$(PS)SensorDataSharingMessage.h \
$(HFILESDIR)$(PS)Common.h \
$(HFILESDIR)$(PS)PersonalSafetyMessage.h \
$(HFILESDIR)$(PS)ProbeVehicleData.h \
$(HFILES)
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)SensorDataSharingMessageTest.c

# 이 문단 추가함
$(PRJOBJDIR)$(PS)VMSconnection_manager$(OBJ) : $(SRCDIR)$(PS)VMSconnection_manager.c $(SRCDIR)$(PS)VMSconnection_manager.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)VMSconnection_manager.c

$(PRJOBJDIR)$(PS)VMSprotocol$(OBJ) : $(SRCDIR)$(PS)VMSprotocol.c $(SRCDIR)$(PS)VMSprotocol.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)VMSprotocol.c

$(PRJOBJDIR)$(PS)cJSON$(OBJ) : $(SRCDIR)$(PS)cJSON.c $(SRCDIR)$(PS)cJSON.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)cJSON.c

$(PRJOBJDIR)$(PS)sds_json_parser$(OBJ) : $(SRCDIR)$(PS)sds_json_parser.c $(SRCDIR)$(PS)sds_json_types.h $(SRCDIR)$(PS)cJSON.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)sds_json_parser.c

clean:
	$(RM) $(PRJOBJDIR)$(PS)*$(OBJ)
	$(RM) *~
	$(RM) $(PRJBINDIR)$(PS)reader$(EXE)
	$(RM) $(PRJBINDIR)$(PS)writer$(EXE)
	$(RM) message.uper
	$(RM_MSVC_FILES)

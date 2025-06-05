# makefile to build generated files

include ../../platform.mk

# include directories
OSROOTDIR = ..$(PS)..$(PS)..
LIBDIR  = $(OSROOTDIR)$(PS)c$(RTDIRSFX)$(PS)lib
PRJLIBDIR = .$(PS)lib
PRJBINDIR = .$(PS)bin
PRJOBJDIR = .$(PS)obj
RTSRCDIR = $(OSROOTDIR)$(PS)rtsrc # asn1rt 라이브러리 헤더 경로로 유지 가능성 있음
RTXSRCDIR = $(OSROOTDIR)$(PS)rtxsrc # asn1rt 라이브러리 헤더 경로로 유지 가능성 있음
PERSRCDIR = $(OSROOTDIR)$(PS)rtpersrc # asn1per 라이브러리 헤더 경로로 유지 가능성 있음
SRCDIR = .
HFILESDIR = . # VMS 관련 .h 파일들이 있을 수 있으므로 SRCDIR과 함께 유지

# compiler defs
CFLAGS = -c $(CVARS_) $(CFLAGS_) $(CBLDTYPE_)
IPATHS = -I$(SRCDIR) -I$(OSROOTDIR) -I$(HFILESDIR) -I. -I$(RTSRCDIR) -I$(PERSRCDIR) $(IPATHS_) # asn1rt/per 라이브러리 헤더 경로 포함 유지
LINKOPT = $(LINKOPT_)

# run-time libraries (reader가 직접 ASN.1 코드를 사용하지 않더라도, 링크될 라이브러리가 있을 수 있음)
LIBS = $(LIBDIR)/$(LIBPFX)asn1per$(A) $(LIBDIR)/$(LIBPFX)asn1rt$(A)
LLIBS = $(LLPFX)asn1per$(LLAEXT) $(LLPFX)asn1rt$(LLAEXT) $(LLSYS)
LPATHS = $(LPPFX)$(LIBDIR)

# reader 실행 파일 빌드에 필요한 object 파일들
READEROBJ = $(PRJOBJDIR)$(PS)reader$(OBJ) \
            $(PRJOBJDIR)$(PS)VMSconnection_manager$(OBJ) \
			$(PRJOBJDIR)$(PS)VMSprotocol$(OBJ) \
			$(PRJOBJDIR)$(PS)cJSON$(OBJ) \
			$(PRJOBJDIR)$(PS)sds_json_parser$(OBJ)

all : $(PRJBINDIR)$(PS)reader$(EXE)

$(PRJBINDIR)/reader$(EXE) : $(READEROBJ) $(LIBS)
	$(LINK) $(READEROBJ) $(LINKOPT) $(LPATHS) $(LLIBS)

# reader.c 빌드 규칙 (이전 단계에서 수정된 내용 반영)
$(PRJOBJDIR)$(PS)reader$(OBJ) : \
    $(SRCDIR)$(PS)reader.c \
    $(SRCDIR)$(PS)VMSconnection_manager.h \
	$(SRCDIR)$(PS)VMSprotocol.h \
	$(SRCDIR)$(PS)cJSON.h \
	$(SRCDIR)$(PS)sds_json_types.h
	$(CC) -c $(CFLAGS) $(OBJOUT) $(IPATHS) $(SRCDIR)$(PS)reader.c

# VMS 관련 C 파일 빌드 규칙
$(PRJOBJDIR)$(PS)VMSconnection_manager$(OBJ) : $(SRCDIR)$(PS)VMSconnection_manager.c $(SRCDIR)$(PS)VMSconnection_manager.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)VMSconnection_manager.c

$(PRJOBJDIR)$(PS)VMSprotocol$(OBJ) : $(SRCDIR)$(PS)VMSprotocol.c $(SRCDIR)$(PS)VMSprotocol.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)VMSprotocol.c

# cJSON 및 sds_json_parser 빌드 규칙
$(PRJOBJDIR)$(PS)cJSON$(OBJ) : $(SRCDIR)$(PS)cJSON.c $(SRCDIR)$(PS)cJSON.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)cJSON.c

$(PRJOBJDIR)$(PS)sds_json_parser$(OBJ) : $(SRCDIR)$(PS)sds_json_parser.c $(SRCDIR)$(PS)sds_json_types.h $(SRCDIR)$(PS)cJSON.h
	$(CC) $(CFLAGS) $(OBJOUT) -c $(IPATHS) $(SRCDIR)$(PS)sds_json_parser.c

clean:
	$(RM) $(PRJOBJDIR)$(PS)*$(OBJ)
	$(RM) *~
	$(RM) $(PRJBINDIR)$(PS)reader$(EXE)
	# $(RM) $(PRJBINDIR)$(PS)writer$(EXE) # writer 관련 제거
	# $(RM) message.uper # writer 관련 파일로 추정되어 제거
	$(RM_MSVC_FILES)



   MEMBER('ARGB.clw')                                      ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ARGB001.INC'),ONCE        !Local module procedure declarations
                     END


Main PROCEDURE                                             ! Generated from procedure template - Window

Loc:ARGBAlpha        BYTE                                  !
Loc:ColorRef         LONG                                  !
Loc:ColorRefPrev     LONG                                  !
Loc:ARGBRed          BYTE                                  !
Loc:ARGBGreen        BYTE                                  !
Loc:ARGBBlue         BYTE                                  !
Loc:RGBRed           BYTE                                  !
Loc:RGBGreen         BYTE                                  !
Loc:RGBBlue          BYTE                                  !
Loc:ARGBHex          STRING(9)                             !
Loc:RGBAHex          STRING(9)                             !
Loc:RGBHex           STRING(7)                             !
Loc:ARGBUint         ULONG                                 !
Loc:RGBUint          ULONG                                 !
Loc:ARGBInt          LONG                                  !
Loc:RGBInt           LONG                                  !
Loc:Opaque           BYTE                                  !
Loc:WindowHandle     LONG                                  !
Loc:ControlHandle    LONG                                  !
Loc:WindowDeviceContextHandle LONG                         !
Loc:ControlDeviceContextHandle LONG                        !
Loc:DeviceContextMemoryAddress LONG                        !
Loc:BmiHeaderGrp     GROUP,TYPE,PRE()                      !Bit Map Info Header
biSize               ULONG                                 !
biWidth              LONG                                  !
biHeight             LONG                                  !
biPlanes             SHORT                                 !
biBitCount           SHORT                                 !
biCompression        ULONG                                 !
biSizeImage          ULONG                                 !
biXPelsPerMeter      LONG                                  !
biYPelsPerMeter      LONG                                  !
biClrUsed            ULONG                                 !
biClrImportant       ULONG                                 !
                     END                                   !
Loc:BmiRGBquadGroup  GROUP,TYPE,PRE()                      !
rgbBlue              BYTE                                  !
rgbGreen             BYTE                                  !
rgbRed               BYTE                                  !
rgbReserved          BYTE                                  !
                     END                                   !
Loc:BitMapInfo       GROUP,TYPE,PRE(BMI)                   !
bmiHeader            LIKE(Loc:BmiHeaderGrp)                !
bmiColors            LIKE(Loc:BmiRGBquadGroup)             !! Not used for 32-bit DIB
                     END                                   !
Loc:BMI              LIKE(Loc:BitMapInfo)                  !
Loc:BlendFunc        GROUP,TYPE,PRE()                      !
BlendOp              BYTE                                  !! Always 0 (AC_SRC_OVER)
BlendFlags           BYTE                                  !! Always 0
SourceConstantAlpha  BYTE                                  !! 0 for Transparent - 255 for full opacity
AlphaFormat          BYTE                                  !! 1 for per-pixel alpha (AC_SRC_ALPHA)
                     END                                   !
Loc:Blend            LIKE(Loc:BlendFunc)                   !
oldPixelBufferType   GROUP,TYPE,PRE()                      !
Pixels               LONG,DIM(20000)                       !
                     END                                   !
Loc:BitMapBufferAddr LONG                                  !
Loc:Pixel            LONG                                  !
Loc:BitmapHandle     LONG                                  !
Loc:pBitsRaw         &BYTE                                 !
Loc:pBits            LONG                                  !
Loc:pBitsAddr        LONG                                  !
Loc:pBitsAddrAddr    LONG                                  !
Loc:pixelAddr        LONG                                  !
Loc:pixelColor       LONG                                  !
Loc:X                LONG                                  !
Loc:Y                LONG                                  !
Loc:I                LONG                                  !
Loc:J                LONG                                  !
Loc:pbmiAddr         LONG                                  !
Loc:RVLong           LONG                                  !
Loc:AddrToDIBbitvalues LONG                                !
Loc:Columns          LONG                                  !
Loc:Rows             LONG                                  !
Loc:CurrentColumn    LONG                                  !
Loc:CurrentRow       LONG                                  !
Loc:ControlXpos      LONG                                  !
Loc:ControlYpos      LONG                                  !
Loc:ControlWidth     LONG                                  !
Loc:ControlHeight    LONG                                  !
Loc:ByteOffset       LONG                                  !
Loc:ARGBvalue        LONG                                  !
Loc:ObjectType       ULONG                                 !
Window               WINDOW('ARGB Convertor'),AT(,,342,205),SYSTEM,GRAY,DOUBLE
                       STRING('Alpha 0 = Transparent'),AT(102,1,97,10),USE(?StrTrans)
                       STRING('ARGB 0-255'),AT(102,24,60,10),USE(?StrARGBrange),RIGHT(4)
                       PROMPT('ARGB Alpha:'),AT(4,36,95,10),USE(?Loc:ARGBAlpha:Prompt),RIGHT
                       SPIN(@n3),AT(102,36,60,10),USE(Loc:ARGBAlpha),RIGHT(4),RANGE(0,255)
                       BOX,AT(255,136,60,34),USE(?RGBBoxColour),ROUND,COLOR(COLOR:Black),FILL(COLOR:Black)
                       BUTTON('...'),AT(167,36,14,52),USE(?BtnARGB),SKIP
                       STRING('Alpha 255 = Opaque'),AT(102,12,97,10),USE(?StrOpaque)
                       STRING('RGB 0 - 255'),AT(255,38,60,10),USE(?StrRGBrange),RIGHT(4)
                       PROMPT('ARGB Red:'),AT(4,50,95,10),USE(?Loc:ARGBRed:Prompt),RIGHT
                       SPIN(@n3),AT(102,50,60,10),USE(Loc:ARGBRed),RIGHT(4),RANGE(0,255)
                       BUTTON('...'),AT(324,50,14,39),USE(?BtnRGB),SKIP
                       PROMPT('ARGB Green:'),AT(4,64,95,10),USE(?Loc:ARGBGreen:Prompt),RIGHT
                       SPIN(@n3),AT(102,64,60,10),USE(Loc:ARGBGreen),RIGHT(4),RANGE(0,255)
                       PROMPT('ARGB Blue:'),AT(4,78,95,10),USE(?Loc:ARGBBlue:Prompt),RIGHT
                       SPIN(@n3),AT(102,78,60,10),USE(Loc:ARGBBlue),RIGHT(4),RANGE(0,255)
                       PROMPT('RGB Red:'),AT(198,50,54,10),USE(?Loc:RGBRed:Prompt),RIGHT
                       SPIN(@n3),AT(255,50,60,10),USE(Loc:RGBRed),RIGHT(4),RANGE(0,255)
                       PROMPT('RGB Green:'),AT(198,64,54,10),USE(?Loc:RGBGreen:Prompt),RIGHT
                       SPIN(@n3),AT(255,64,60,10),USE(Loc:RGBGreen),RIGHT(4),RANGE(0,255)
                       PROMPT('RGB Blue:'),AT(198,78,54,10),USE(?Loc:RGBBlue:Prompt),RIGHT
                       SPIN(@n3),AT(255,78,60,10),USE(Loc:RGBBlue),RIGHT(4),RANGE(0,255)
                       PROMPT('ARGB32 Hex:'),AT(4,92,95,10),USE(?Loc:Hex:Prompt),RIGHT
                       ENTRY(@s9),AT(102,92,60,10),USE(Loc:ARGBHex),RIGHT(4)
                       BUTTON('...'),AT(167,92,14,10),USE(?BtnARGBHex),SKIP
                       PROMPT('RGB Hex:'),AT(198,92,54,10),USE(?Loc:RGBHex:Prompt),RIGHT
                       ENTRY(@s7),AT(255,92,60,10),USE(Loc:RGBHex),RIGHT(4)
                       BUTTON('...'),AT(324,92,14,10),USE(?BtnRGBHex)
                       PROMPT('RGBA8888 && RGBA Hex:'),AT(4,106,95,10),USE(?Loc:RGBAHex:Prompt),RIGHT
                       ENTRY(@s9),AT(102,106,60,10),USE(Loc:RGBAHex),RIGHT(4)
                       BUTTON('...'),AT(167,106,14,10),USE(?BtnRGBAHex)
                       BUTTON('...'),AT(324,106,14,10),USE(?BtnRGBUint)
                       PROMPT('RGB Int:'),AT(198,120,54,10),USE(?Loc:RGBInt:Prompt),RIGHT
                       ENTRY(@n-14),AT(255,120,60,10),USE(Loc:RGBInt),RIGHT(4)
                       BUTTON('...'),AT(324,120,14,10),USE(?BtnRGBInt)
                       PROMPT('RGB Uint:'),AT(198,106,54,10),USE(?Loc:RGBUint:Prompt),RIGHT
                       ENTRY(@n13),AT(255,106,60,10),USE(Loc:RGBUint),RIGHT(4)
                       PROMPT('ARGB Uint:'),AT(4,121,95,10),USE(?Loc:Uint:Prompt),RIGHT
                       ENTRY(@n13),AT(102,121,60,10),USE(Loc:ARGBUint),RIGHT(4)
                       BUTTON('...'),AT(167,121,14,10),USE(?BtnARGBUint),SKIP
                       PROMPT('ARGB Int:'),AT(4,136,95,10),USE(?Loc:Int:Prompt),RIGHT
                       ENTRY(@n-14),AT(102,135,60,10),USE(Loc:ARGBInt),RIGHT(4)
                       BUTTON('...'),AT(167,135,14,10),USE(?BtnARGBInt),SKIP
                       STRING('RGB Colour'),AT(255,174,60,10),USE(?StringRGBColour),CENTER
                       BUTTON('Close'),AT(294,187,45,14),USE(?BtnClose)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
    Map

ARGBtoRGB       Procedure (*Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue)

RGBtoARGB       Procedure (*Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)

ARGBtoARGBHex   Procedure (*Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *String pARGBHex)
RGBtoRGBHex     Procedure (*Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue, *String pRGBHex)

ARGBtoRGBAHex   Procedure (*Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *String pRGBAHex)
ARGBtoRGBHex    Procedure (*Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *String pRGBHex)

ARGBtoRGBUint   Procedure(*Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue,*Ulong pRGBUint)

ARGBtoARGBUint  Procedure(*Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *Ulong pARGBUint)
RGBtoRGBUint    Procedure(*Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue, *Ulong pRGBUint)

ARGBUintToARGB  Procedure (*Ulong pARGBUint, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)
RGBUintToRGB    Procedure (*Ulong pRGBUint, *Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue)
ARGBIntToARGBUint   Procedure(*Long pARGBInt,*Ulong pARGBUint)
RGBIntToRGBUint   Procedure(*Long pRGBInt,*Ulong pRGBUint)

ARGBUintToARGBInt   Procedure(*Ulong pARGBUint, *Long pARGBInt)
RGBUintToRGBInt   Procedure(*Ulong pRGBUint, *Long pRGBInt)

ByteToHex       Procedure (*Byte pByte), String


ARGBHexToARGB   Procedure (*String pARGBHex, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)
RGBHexToRGB     Procedure (*String pRGBHex, *Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue)
RGBAHexToARGB   Procedure (*String pRGBAHex, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)

HexToByte       Procedure (String pHex, *Byte pARGB)
HexCharToByte   Procedure (String pHex, *Byte pByte)

SetRGBBoxColour Procedure (*Byte pRed, *Byte pGreen, *Byte pBlue)

    End


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?StrTrans
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main',Window)                              ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('Main',Window)                           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BtnARGB
      ThisWindow.Update
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      ARGBtoRGB(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      ARGBtoRGBHex(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBHex)
      ARGBtoRGBUint(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBUint)
      ARGBUintToARGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnRGB
      ThisWindow.Update
      RGBToARGB(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      RGBtoRGBHex(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:RGBHex)
      RGBtoRGBUint(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:RGBUint)
      RGBUintToRGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnARGBHex
      ThisWindow.Update
      ARGBHexToARGB(Loc:ARGBHex,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      ARGBtoRGB(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      ARGBtoRGBHex(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBHex)
      ARGBtoRGBUint(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBUint)
      ARGBUintToARGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      Display()
    OF ?BtnRGBHex
      ThisWindow.Update
      RGBHexToRGB(Loc:RGBHex,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      RGBToARGB(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      RGBtoRGBUint(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:RGBUint)
      RGBUintToRGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnRGBAHex
      ThisWindow.Update
      RGBAHexToARGB(Loc:RGBAHex,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      ARGBtoRGB(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      ARGBtoRGBHex(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBHex)
      ARGBtoRGBUint(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBUint)
      ARGBUintToARGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
      
      Display()
    OF ?BtnRGBUint
      ThisWindow.Update
      RGBUintToRGB(Loc:RGBUint,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      RGBToARGB(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      RGBtoRGBHex(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:RGBHex)
      RGBUintToRGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnRGBInt
      ThisWindow.Update
      RGBIntToRGBUint(Loc:RGBInt,Loc:RGBUint)
      
      RGBUintToRGB(Loc:RGBUint,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      RGBToARGB(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      ARGBtoARGBUint(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBUint)
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      RGBtoRGBHex(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue,Loc:RGBHex)
      
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnARGBUint
      ThisWindow.Update
      ARGBUintToARGB(Loc:ARGBUint,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      
      ARGBUintToARGBInt(Loc:ARGBUint,Loc:ARGBInt)
      
      ARGBtoRGB(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      ARGBtoRGBHex(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBHex)
      ARGBtoRGBUint(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBUint)
      ARGBUintToARGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnARGBInt
      ThisWindow.Update
      ARGBIntToARGBUint(Loc:ARGBInt,Loc:ARGBUint)
      
      
      ARGBUintToARGB(Loc:ARGBUint,Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue)
      
      ARGBtoARGBHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:ARGBHex)
      ARGBtoRGBAHex(Loc:ARGBAlpha,Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBAHex)
      
      ARGBtoRGB(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      ARGBtoRGBHex(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBHex)
      ARGBtoRGBUint(Loc:ARGBRed,Loc:ARGBGreen,Loc:ARGBBlue,Loc:RGBUint)
      ARGBUintToARGBInt(Loc:RGBUint,Loc:RGBInt)
      SetRGBBoxColour(Loc:RGBRed,Loc:RGBGreen,Loc:RGBBlue)
      
      Display()
    OF ?BtnClose
      ThisWindow.Update
      Post(Event:CloseWindow)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

! Tests
!           Dec     Hex             uint                int
!                   #
!Alpha:     255     FF  #FFFF0000   4,294,901,760       -65,536
!Red:       255     FF
!Green:     0       00
!Blue:      0       00
!
!                   #
!Alpha:     128     80  #8000FF80   2,147,549,056       -2,147,418,240
!Red:       0       00
!Green:     255     FF
!Blue:      128     80
!
!                   #
!Alpha:     192     C0  #C02DC880   3,224,225,920       -1,070,741,376
!Red:       45      2D
!Green:     200     C8
!Blue:      128     80

ARGBtoRGB       Procedure (*Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue)

    Code

    pRGBRed     = pARGBRed
    pRGBGreen   = pARGBGreen
    pRGBBlue    = pARGBBlue
RGBtoARGB       Procedure (*Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)

    Code

    pARGBAlpha  = 255 !Opaque because thats what RGB colours are
    pARGBRed    = pRGBRed
    pARGBGreen  = pRGBGreen
    pARGBBlue   = pRGBBlue



ARGBtoARGBHex   Procedure (*Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *String pARGBHex)

    Code

    pARGBHex = '#' & ByteToHex(pARGBAlpha) & ByteToHex(pARGBRed) & ByteToHex(pARGBGreen) & ByteToHex(pARGBBlue)

RGBtoRGBHex        Procedure (*Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue, *String pRGBHex)

    Code

    pRGBHex = '#' & ByteToHex(pRGBRed) & ByteToHex(pRGBGreen) & ByteToHex(pRGBBlue)

ARGBtoRGBAHex   Procedure (*Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *String pRGBAHex)
    
    Code

    pRGBAHex = '#' & ByteToHex(pARGBRed) & ByteToHex(pARGBGreen) & ByteToHex(pARGBBlue) & ByteToHex(pARGBAlpha)
ARGBtoRGBHex   Procedure (*Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *String pRGBHex)

    Code

    pRGBHex = '#' & ByteToHex(pARGBRed) & ByteToHex(pARGBGreen) & ByteToHex(pARGBBlue)

ARGBUintToARGB  Procedure (*Ulong pARGBUint, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)


    Code

    pARGBAlpha  = BAND(BShift(pARGBUint, -24), 255)
    pARGBRed    = BAND(BShift(pARGBUint, -16), 255)
    pARGBGreen  = BAND(BShift(pARGBUint, -8),  255)
    pARGBBlue   = BAND(pARGBUint, 255)

RGBUintToRGB  Procedure (*Ulong pRGBUint, *Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue)


    Code

    pRGBRed    = BAND(BShift(pRGBUint, -16), 255)
    pRGBGreen  = BAND(BShift(pRGBUint, -8),  255)
    pRGBBlue   = BAND(pRGBUint, 255)

ARGBIntToARGBUint   Procedure(*Long pARGBInt,*Ulong pARGBUint)

    Code

    IF pARGBInt < 0
        pARGBUint   = 4294967296 + pARGBInt
    Else
        pARGBUint   = pARGBInt
    End


RGBIntToRGBUint   Procedure(*Long pRGBInt,*Ulong pRGBUint)

    Code

    IF pRGBInt < 0
        pRGBUint   = 4294967296 + pRGBInt
    Else
        pRGBUint   = pRGBInt
    End


SetRGBBoxColour        Procedure (*Byte pRed, *Byte pGreen, *Byte pBlue)

    Code

    ! create the color in the three low-order bytes (bytes 0, 1, and 2) 

    ?RGBBoxColour{Prop:Fill} = BShift(pRed,0) + BShift(pGreen,8) + BShift(pBlue,16)
ARGBtoARGBUint  Procedure(*Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue, *Ulong pARGBUint)

    Code
           
    pARGBUint = BShift(pARGBAlpha,24) + BShift(pARGBRed,16) + BShift(pARGBGreen,8) + pARGBBlue

RGBtoRGBUint  Procedure(*Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue, *Ulong pRGBUint)

    Code
           
    pRGBUint = BShift(pRGBRed,16) + BShift(pRGBGreen,8) + pRGBBlue

ARGBtoRGBUint   Procedure(*Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue,*Ulong pRGBUint)

    Code
           
    pRGBUint = BShift(pARGBRed,16) + BShift(pARGBGreen,8) + pARGBBlue

ARGBUintToARGBInt   Procedure(*Ulong pARGBUint, *Long pARGBInt)

    Code


    IF pARGBUint > 2147483647
        pARGBInt = pARGBUint - 4294967296
    ELSE
        pARGBInt = pARGBUint
    End

RGBUintToRGBInt   Procedure(*Ulong pRGBUint, *Long pRGBInt)

    Code


    IF pRGBUint > 2147483647
        pRGBInt = pRGBUint - 4294967296
    ELSE
        pRGBInt = pRGBUint
    End

ARGBHexToARGB       Procedure (*String pARGBHex, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)

Loc:HexStartPos     Long(0)
Loc:HexLen          Long

    Code

    pARGBHex = Upper(pARGBHex)

    IF Sub(pARGBHex,1,1) = '#'
        Loc:HexStartPos = 1
    End
    Loc:HexLen      = Len(Clip(pARGBHex))

    IF Loc:HexLen > 7 ! Alpha is included
        HexToByte( Sub(pARGBHex,1 + Loc:HexStartPos, 2), pARGBAlpha)
        HexToByte( Sub(pARGBHex,3 + Loc:HexStartPos, 2), pARGBRed)
        HexToByte( Sub(pARGBHex,5 + Loc:HexStartPos, 2), pARGBGreen)
        HexToByte( Sub(pARGBHex,7 + Loc:HexStartPos, 2), pARGBBlue)
    Else
        HexToByte( Sub(pARGBHex,1 + Loc:HexStartPos, 2), pARGBRed)
        HexToByte( Sub(pARGBHex,3 + Loc:HexStartPos, 2), pARGBGreen)
        HexToByte( Sub(pARGBHex,5 + Loc:HexStartPos, 2), pARGBBlue)
    End


                                           
RGBHexToRGB       Procedure (*String pRGBHex, *Byte pRGBRed, *Byte pRGBGreen, *Byte pRGBBlue)

Loc:HexStartPos     Long(0)
Loc:HexLen          Long

    Code

    pRGBHex = Upper(pRGBHex)

    IF Sub(pRGBHex,1,1) = '#'
        Loc:HexStartPos = 1
    End
    Loc:HexLen      = Len(Clip(pRGBHex))

    HexToByte( Sub(pRGBHex,1 + Loc:HexStartPos, 2), pRGBRed)
    HexToByte( Sub(pRGBHex,3 + Loc:HexStartPos, 2), pRGBGreen)
    HexToByte( Sub(pRGBHex,5 + Loc:HexStartPos, 2), pRGBBlue)



                                           
RGBAHexToARGB   Procedure (*String pRGBAHex, *Byte pARGBAlpha, *Byte pARGBRed, *Byte pARGBGreen, *Byte pARGBBlue)

Loc:HexStartPos     Long(0)
Loc:HexLen          Long

    Code

    pRGBAHex = Upper(pRGBAHex)

    IF Sub(pRGBAHex,1,1) = '#'
        Loc:HexStartPos = 1
    End
    Loc:HexLen      = Len(Clip(pRGBAHex))

    IF Loc:HexLen > 7 ! Alpha is included
        HexToByte( Sub(pRGBAHex,1 + Loc:HexStartPos, 2), pARGBRed)
        HexToByte( Sub(pRGBAHex,3 + Loc:HexStartPos, 2), pARGBGreen)
        HexToByte( Sub(pRGBAHex,5 + Loc:HexStartPos, 2), pARGBBlue)
        HexToByte( Sub(pRGBAHex,7 + Loc:HexStartPos, 2), pARGBAlpha)
    Else
        HexToByte( Sub(pRGBAHex,1 + Loc:HexStartPos, 2), pARGBRed)
        HexToByte( Sub(pRGBAHex,3 + Loc:HexStartPos, 2), pARGBGreen)
        HexToByte( Sub(pRGBAHex,5 + Loc:HexStartPos, 2), pARGBBlue)
    End


                                           
!ARGBtoHex   PROCEDURE   (*Byte pAlpha, *Byte pRed, *Byte pGreen, *Byte pBlue)
!
!Loc:RVString    String(20)
!    Code
!
!    Loc:RVString = '#' & ByteToHex(pAlpha) & ByteToHex(pRed) & ByteToHex(pGreen) & ByteToHex(pBlue)
!
!    Return Loc:RVString
ByteToHex PROCEDURE(*Byte pByte)

Loc:HexChars    STRING('0123456789ABCDEF')
Loc:Hi          BYTE
Loc:Lo          BYTE
Loc:HexString   STRING(2)

CODE


    Loc:Hi              = INT(pByte / 16) ! Get 1st Hex Char
    Loc:Lo              = BAND(pByte, 15) ! Get 2nd Hex Char hence the 15 being the cut off with the "+ 1" below

    Loc:HexString[1]    = Loc:HexChars[Loc:Hi + 1]
    Loc:HexString[2]    = Loc:HexChars[Loc:Lo + 1]

    Return Loc:HexString
HexToByte   Procedure (String pHex, *Byte pARGB)

Loc:HighNibble      BYTE
Loc:LowNibble       BYTE

    Code

    HexCharToByte(SUB(pHex, 1, 1), Loc:HighNibble)
    HexCharToByte(SUB(pHex, 2, 1), Loc:LowNibble)
    pARGB   = (Loc:HighNibble * 16) + Loc:LowNibble
HexCharToByte       Procedure (String pHex, *Byte pByte)

Loc:AsciiCode  Long
    Code
    Loc:AsciiCode = Val(Upper(pHex))
    Case Upper(pHex)
    OF '0' TO '9'
        pByte = Val( Upper(pHex) ) - Val( '0' )  ! in Ascii, Decimal 0 starts at Ascii code 48, so take the pHex get Ascii code and minus Ascii zero
                                      ! Decimal 5 = 53, so 53 - 48 = 5
    OF 'A' TO 'F'
        pByte = Val( Upper(pHex) ) - Val( 'A' ) + 10   ! in Ascii, A starts at Ascii code 65, so take the pHex, get Ascii code, minus the A (65) and add 10
                                            ! because base 16 goes beyond ten.
    End

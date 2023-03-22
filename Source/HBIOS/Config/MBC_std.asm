;
;==================================================================================================
;   MBC CONFIGURATION
;==================================================================================================
;
; THE COMPLETE SET OF DEFAULT CONFIGURATION SETTINGS FOR THIS PLATFORM ARE FOUND IN THE
; CFG_<PLT>.ASM INCLUDED FILE WHICH IS FOUND IN THE PARENT DIRECTORY.  THIS FILE CONTAINS
; COMMON CONFIGURATION SETTINGS THAT OVERRIDE THE DEFAULTS.  IT IS INTENDED THAT YOU MAKE
; YOUR CUSTOMIZATIONS IN THIS FILE AND JUST INHERIT ALL OTHER SETTINGS FROM THE DEFAULTS.
; EVEN BETTER, YOU CAN MAKE A COPY OF THIS FILE WITH A NAME LIKE <PLT>_XXX.ASM AND SPECIFY
; YOUR FILE IN THE BUILD PROCESS.
;
; THE SETTINGS BELOW ARE THE SETTINGS THAT ARE MOST COMMONLY MODIFIED FOR THIS PLATFORM.
; MANY OF THEM ARE EQUAL TO THE SETTINGS IN THE INCLUDED FILE, SO THEY DON'T REALLY DO
; ANYTHING AS IS.  THEY ARE LISTED HERE TO MAKE IT EASY FOR YOU TO ADJUST THE MOST COMMON
; SETTINGS.
;
; N.B., SINCE THE SETTINGS BELOW ARE REDEFINING VALUES ALREADY SET IN THE INCLUDED FILE,
; TASM INSISTS THAT YOU USE THE .SET OPERATOR AND NOT THE .EQU OPERATOR BELOW. ATTEMPTING
; TO REDEFINE A VALUE WITH .EQU BELOW WILL CAUSE TASM ERRORS!
;
; PLEASE REFER TO THE CUSTOM BUILD INSTRUCTIONS (README.TXT) IN THE SOURCE DIRECTORY (TWO
; DIRECTORIES ABOVE THIS ONE).
;
#DEFINE	BOOT_DEFAULT	"H"		; DEFAULT BOOT LOADER CMD ON <CR> OR AUTO BOOT
;
#include "cfg_mbc.asm"
;
CPUOSC		.SET	8000000		; CPU OSC FREQ IN MHZ
CRTACT		.SET	FALSE		; ACTIVATE CRT (VDU,CVDU,PROPIO,ETC) AT STARTUP
;
INTMODE		.SET	0		; INTERRUPTS: 0=NONE, 1=MODE 1, 2=MODE 2, 3=MODE 3 (Z280)
;
DMAENABLE	.SET	FALSE		; DMA: ENABLE DMA DRIVER (DMA.ASM)
;
BATCOND		.SET	FALSE		; ENABLE LOW BATTERY WARNING MESSAGE
;
CPUSPDDEF	.SET	SPD_LOW		; CPU SPEED DEFAULT SPD_UNSUP|SPD_HIGH|SPD_LOW
;
ROMSIZE		.SET	512		; SIZE OF ROM IN KB (MUST MATCH YOUR HARDWARE!!!)
RAMSIZE		.SET	512		; SIZE OF RAM IN KB (MUST MATCH YOUR HARDWARE!!!)
;
MDFFENABLE	.SET	FALSE		; MD: ENABLE FLASH FILE SYSTEM
;
DSKYENABLE	.SET	FALSE		; ENABLES DSKY
DSKYMODE	.SET	DSKYMODE_NG	; DSKY VERSION: DSKYMODE_[V1|NG]
;
UARTINTS	.SET	FALSE		; UART: INCLUDE INTERRUPT SUPPORT UNDER IM1/2/3
;UARTCFG	.SET	UARTCFG | SER_RTS
;
CVDUMON		.SET	CVDUMON_CGA	; CVDU: CVDU MONITOR SETUP: CVDUMON_[NONE|CGA|EGA]
;
FDENABLE	.SET	TRUE		; FD: ENABLE FLOPPY DISK DRIVER (FD.ASM)
;
PPIDEENABLE	.SET	TRUE		; PPIDE: ENABLE PARALLEL PORT IDE DISK DRIVER (PPIDE.ASM)
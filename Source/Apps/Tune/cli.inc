
CLI_ABRT_IF_OPT_FIRST:
	LD	A, (FCB+1)
	CP	'-'			; OPTION FIRST OR - MISSING FILENAME?
	JP	Z, ERRCMD		; SHOW USAGE
	RET

CLI_HAVE_HBIOS_SWITCH:
 	LD	HL, CLIARGS		; TEST FOR --HBIOS ON COMMAND LINE
	LD	DE, HBIOSOPT
	CALL	STRINDEX
	JR	NZ, CLI_HAVE_HBIOS_SWITCH1
	OR	$FF			; MATCHED --HBIOS
	LD	(HBIOSMD), A
	LD	BC,(BF_SYSGET*256)+BF_SND
	RST	08			; CHECK WE HAVE
	XOR	A			; AT LEAST ONE
	CP	E			; SOUND DEVICE
	RET	NZ
	JP	ERRHW
CLI_HAVE_HBIOS_SWITCH1			; NOT MATCHED --HBIOS
	XOR	A
	LD	(HBIOSMD), A
	RET

CLI_ABRT_UNSUPPFILTYP:
	PUSH	AF
	ISHBIOS
	JR	Z, CLI_ABRT_UNSUPPFILTYP1
	POP	AF
	CP	TYPMYM
	RET	NZ
	ERRWITHMSG(MSGUNSUP)		; EXIT WITH UNSUPPORTED FILE TYPE MESSAGE

CLI_ABRT_UNSUPPFILTYP1:
	POP	AF
	RET

CLI_OCTAVE_ADJST:			; SEARCH FOR OCTAVE ADJUSTMENT SWITCH (-n or +n)
	LD	HL, CLIARGS		; TEST FOR --HBIOS ON COMMAND LINE
	LD	DE, DOWN1
	CALL	STRINDEX
	JR	NZ, CLI_OCTAVE_ADJST1

	LD	A, -1
	JR 	CLI_OCTAVE_ADJST5

CLI_OCTAVE_ADJST1:
	LD	HL, CLIARGS		; TEST FOR --HBIOS ON COMMAND LINE
	LD	DE, DOWN2
	CALL	STRINDEX
	JR	NZ, CLI_OCTAVE_ADJST2

	LD	A, -2
	JR 	CLI_OCTAVE_ADJST5

CLI_OCTAVE_ADJST2:
	LD	HL, CLIARGS		; TEST FOR --HBIOS ON COMMAND LINE
	LD	DE, UP1
	CALL	STRINDEX
	JR	NZ, CLI_OCTAVE_ADJST3

	LD	A, 1
	JR 	CLI_OCTAVE_ADJST5

CLI_OCTAVE_ADJST3:
	LD	HL, CLIARGS		; TEST FOR --HBIOS ON COMMAND LINE
	LD	DE, UP2
	CALL	STRINDEX
	JR	NZ, CLI_OCTAVE_ADJST4

	LD	A, 2
	JR 	CLI_OCTAVE_ADJST5

CLI_OCTAVE_ADJST4:
	LD	A, 0

CLI_OCTAVE_ADJST5:
	LD	(OCTAVEADJ), A
	RET

HBIOSOPT:	.DB	"--HBIOS", 0
DOWN1		.DB	"-t1", 0			; DOWN AN OCTAVE
DOWN2		.DB	"-t2", 0			; DOWN TWO OCTAVE
UP1		.DB	"+t1", 0			; UP AN OCTAVE
UP2		.DB	"+t2", 0			; UP TWO OCTAVE
;
;==================================================================================================
;   IDE DISK DRIVER - DATA
;==================================================================================================
;
SD_SLICETRKS	.EQU	65			; TRACKS PER SLICE
SD_TRKSIZE	.EQU	128			; SIZE OF TRACK (IN KB)
SD_SLICESIZE	.EQU	((SD_SLICETRKS * SD_TRKSIZE) + 1023) / 1024 ; SIZE OF EACH SLICE (IN MB)
SD_NUMSLICES	.EQU	SDCAPACITY / SD_SLICESIZE ; TOTAL SLICES IN DEVICE
SD0_SLICEDEF	.EQU	0			; DEFAULT SLICE FOR LOGICAL UNIT 0
SD1_SLICEDEF	.EQU	1			; DEFAULT SLICE FOR LOGICAL UNIT 1
SD2_SLICEDEF	.EQU	2			; DEFAULT SLICE FOR LOGICAL UNIT 2
SD3_SLICEDEF	.EQU	3			; DEFAULT SLICE FOR LOGICAL UNIT 3
;
		.DB	DIODEV_SD + 0
SDDPH0	 	.DW 	0000,0000
		.DW 	0000,0000
		.DW 	DIRBF,DPB_HD
		.DW 	SDCSV0,SDALV0
		.DB	"LU"			; LOGICAL UNIT ENHANCEMENT SIGNATURE
SD0_SLICE	.DW	SD0_SLICEDEF		; CURRENTLY ACTIVE SLICE
		.DW	SD_NUMSLICES		; NUMBER OF SLICES AVAILABLE
;
		.DB	DIODEV_SD + 0
SDDPH1	 	.DW 	0000,0000
		.DW 	0000,0000
		.DW 	DIRBF,DPB_HD
		.DW 	SDCSV1,SDALV1
		.DB	"LU"			; LOGICAL UNIT ENHANCEMENT SIGNATURE
SD1_SLICE	.DW	SD1_SLICEDEF		; CURRENTLY ACTIVE SLICE
		.DW	SD_NUMSLICES		; NUMBER OF SLICES AVAILABLE
;
		.DB	DIODEV_SD + 0
SDDPH2	 	.DW 	0000,0000
		.DW 	0000,0000
		.DW 	DIRBF,DPB_HD
		.DW 	SDCSV2,SDALV2
		.DB	"LU"			; LOGICAL UNIT ENHANCEMENT SIGNATURE
SD2_SLICE	.DW	SD2_SLICEDEF		; CURRENTLY ACTIVE SLICE
		.DW	SD_NUMSLICES		; NUMBER OF SLICES AVAILABLE
;
		.DB	DIODEV_SD + 0
SDDPH3	 	.DW 	0000,0000
		.DW 	0000,0000
		.DW 	DIRBF,DPB_HD
		.DW 	SDCSV3,SDALV3
		.DB	"LU"			; LOGICAL UNIT ENHANCEMENT SIGNATURE
SD3_SLICE	.DW	SD3_SLICEDEF		; CURRENTLY ACTIVE SLICE
		.DW	SD_NUMSLICES		; NUMBER OF SLICES AVAILABLE
;
SDCKS		.EQU	0			; CKS: 0 FOR NON-REMOVABLE MEDIA
SDALS		.EQU	256			; ALS: BLKS / 8 = 2048 / 8 = 256 (ROUNDED UP)
;
SDCSV0:		.FILL	SDCKS			; NO DIRECTORY CHECKSUM, NON-REMOVABLE DRIVE
SDALV0:		.FILL	SDALS			; MAX OF 2048 DATA BLOCKS
SDCSV1:		.FILL	SDCKS			; NO DIRECTORY CHECKSUM, NON-REMOVABLE DRIVE
SDALV1:		.FILL	SDALS			; MAX OF 2048 DATA BLOCKS
SDCSV2:		.FILL	SDCKS			; NO DIRECTORY CHECKSUM, NON-REMOVABLE DRIVE
SDALV2:		.FILL	SDALS			; MAX OF 2048 DATA BLOCKS
SDCSV3:		.FILL	SDCKS			; NO DIRECTORY CHECKSUM, NON-REMOVABLE DRIVE
SDALV3:		.FILL	SDALS			; MAX OF 2048 DATA BLOCKS
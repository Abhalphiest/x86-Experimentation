	BITS 16

start:
	mov ax, 07C0h		; Set up 4k stack space after this bootloader
	add ax, 288			; (4096 + 512) / 16 bytes per paragraph
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h		; Set data segment to where we're loaded
	mov ds, ax

	mov si, text_string	; Put string position into SI
	call print_string	; Call our string-printing routine
	jmp $				; Jump here - infinite loop!

	text_string db 'This is my cool new OS!', 0

print_string:			; Routine: output string in SI to screen
	mov ah, 0Eh			; int 10h 'print char' function

.repeat:
	lodsb				; Get character from string
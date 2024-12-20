.model small
.stack 100h
.386
.data
	str1 db "Input (IN HEXA DECIMAL) :$"
	str2 db "Invalid input! Enter a valid input (0-9/A-F)$"

.code
main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09h
	int 21h

	xor bl,bl

	mov cx,4

again:	mov ah,01h
	int 21h

	cmp al,13
	je exit

	cmp al,'9'
	ja letter 
	
	cmp al,'0'
	jb error

	sub al,48
	jmp aa

letter: cmp al,'A'
	jb error

	cmp al,'F'
	ja error

	sub al,55

aa:	shl bx,4
	or bl,al
	dec cx
	jz exit
	jmp again

exit:	mov ah,4ch
	int 21h

error: 	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h

	mov dx,offset str2
	mov ah,09h
	int 21h
	
	jmp again

main endp
end main

	
	


	
	

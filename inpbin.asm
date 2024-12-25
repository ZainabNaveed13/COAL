.model small
.stack 100h
.386
.data
	str1 db "Invalid input! Enter a valid input (0,1)$"
	str2 db "Enter binray :$"
.code
main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str2
	mov ah,09h
	int 21h

	xor bl,bl

	mov cx,8

again:	mov ah,01h
	int 21h

	cmp al,13
	je exit

	sub al,48

	cmp al,1
	je valid

	cmp al,0
	jne error
	
valid:	shl bl,1
	or bl,al

	dec cx
	jnz again

exit:	mov ah,4ch
	int 21h

error: 	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h

	mov dx,offset str1
	mov ah,09h
	int 21h
	
	jmp again

main endp
end main








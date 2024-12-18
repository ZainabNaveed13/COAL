.model small
.stack 100h
.386
.data
.code
main proc
	mov ax,@data
	mov ds,ax

	mov bx,0

again:	mov ah,01h
	int 21h

	cmp al,13
	je exit

	sub al,48
	mov cl,al
	mov ch,0

	mov ax,bx
	mov bx,10
	mul bx

	add ax,cx
	mov bx,ax

	mov bx,ax
	jmp again

exit:	mov ah,4ch
	int 21h

main endp
end main
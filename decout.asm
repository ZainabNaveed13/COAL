.model small
.stack 100h
.data
.code
main proc
	mov ax,@data
	mov ds,ax

	mov ax,251
	mov cx,0

again:	cmp ax,0
	je prnt

	mov bx,10

	mov dx,0

	div bx

	push dx
	
	inc cx

	jmp again

prnt:	pop dx
	
	add dl,48
	mov ah,02h
	int 21h
	
	loop prnt

	mov ah,4ch
	int 21h

main endp
end main
	





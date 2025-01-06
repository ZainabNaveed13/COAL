.model small
.stack 100h
.386
.data
	array1 dw 1,2,3,4,5,6
	elem dw 6
	str1 db "The average is : $ "
	rem dw 0
.code
main proc
	mov ax,@data
	mov ds,ax

	mov cx,elem
	mov bx,0

	lea si,array1

again:	cmp cx,0
	je next

	mov ax,[si]
	add bx,ax
	dec cx
	add si,1
	jmp again

next:	mov dx,offset str1
	mov ah,09h
	int 21h

	mov ax,bx
	mov bx,10
	mul bx

	mov bx,elem
	mov dx,0
	div bx
	mov rem,dx

	mov dx,ax
	add dx,48
	mov ah,02h
	int 21h

	mov dl,'.'
	mov ah,02h
	int 21h

	mov ax,rem
	mov bx,elem
	mov dx,0
	div bx

	mov dx,ax
	add dx,48
	mov ah,02h
	int 21h

	mov ah,4ch
	int 21h
main endp
end main

	

	



	
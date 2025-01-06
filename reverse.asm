.model small
.stack 100h
.data
	str1 db "Enter a string : $"
	str2 db "In reverse order : $"
	array1 db 100 dup(0)

.code
main proc
	mov ax,@data
	mov ds,ax

	mov cx,0
	
	mov  dx,offset str1
	mov ah,09h
	int 21h

	mov si, offset array1

again:	mov ah,01h
	int 21h
	mov bl,al

	cmp bl,13
	je exit

	mov [si],bl
	inc si
	inc cx

	jmp again

exit :  mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h

	mov dx,offset str2
	mov ah,09h
	int 21h

	dec si

prnt:	cmp cx,0
	je ter

	mov dl,[si]
	
	mov ah,02h
	int 21h

	dec cx
	dec si
	jmp prnt

ter : 	mov ah,4ch
	int 21h

main endp
end main





	

	

	


		

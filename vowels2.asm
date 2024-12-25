.model small
.stack 100h
.386
.data
	str1 db "Enter string : $"
	str2 db "No. of vowels is : $"
	str3 db "aeiou$"
	array1 db 50 dup (0)
	count dw 0
.code
main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09h
	int 21h
	
	mov di,offset array1
	mov si,offset str3

	mov cx,5

	cld
xx:	movsb

	loop xx

next:	mov di,offset array1

	mov count,0
	
	mov ah,01h
	int 21h

	cmp al,13
	je exit

again:	cmp count,5
	je next

	cld
	scasb

	je found

	inc count
	jmp again

found:	inc bx
	jmp next

exit:	mov dx,offset str2
	mov ah,09h
	int 21h

	mov ax,bx

	mov cx,0

aa:	cmp ax,0
	je prnt

	mov bx,10

	mov dx,0

	div bx

	push dx
	
	inc cx

	jmp aa

prnt:	pop dx
	
	add dl,48
	mov ah,02h
	int 21h
	
	loop prnt

	mov ah,4ch
	int 21h

main endp
end main


	

	
	
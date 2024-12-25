.model small
.stack 100h
.386
.data
	str1 db 10,13, "Input string : $"
	str2 db 10,13, "String is a palindrome"
	str3 db 10,13, "String is not a palindrome"
	array1 db 60 dup ('$')
.code
main proc
	mov ax,@data
	mov ds,ax

	call palindrome

	mov ah,4ch
	int 21h
main endp

palindrome proc

	mov dx,offset str1
	mov ah,09h
	int 21h

	mov si, offset array1

	mov cl,0

again:	mov ah,01h
	int 21h

	cmp al,13
	je check

	mov [si],al
	inc si

	push ax
	inc cl
	jmp again

check:	mov si, offset array1
	
aa:	cmp cl,0

	je finish

	pop ax

	cmp ax,[si]

	jne no

	dec cl
	inc si
	jmp aa

no:	mov dx, offset str3
	mov ah,09h
	int 21h
	jmp exit

finish:	mov dx,offset str2
	mov ah,09h
	int 21h

exit:	ret

palindrome endp
end main







	

	

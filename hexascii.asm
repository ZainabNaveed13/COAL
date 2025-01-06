.model small
.stack 100h
.386
.data
	str1 db "Enter a character : $"
	str2 db 10,13,"The ASCii of the character in hexa is :$"
	str3 db 10,13,"The number of 1 bit in ascii code: $"
.code
main proc
	mov ax,@data
	mov ds,ax

inp:	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h

	mov dx,offset str1
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h

	cmp al,13
	je exit

	mov bl,al
	
	mov dx,offset str2
	mov ah,09h
	int 21h

	mov cx,2

again:	rol bl,4

	mov dl,bl
	and dl,0Fh

	cmp dl,09h

	ja letter

	add dl,48
	jmp aa

letter: add dl,55

aa:	mov ah,02h
	int 21h

	dec cx
	jnz again
	
	jmp inp

exit:	mov ah,4ch
	int 21h

main endp
end main

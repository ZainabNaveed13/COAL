.model small
.stack 100h
.386
.data
	str1 db 10,13, "Hexa input : $"
	str2 db 10,13, "Invalid input!!$"
.code
main proc
	mov ax,@data
	mov ds,ax

	call hex_inp

	mov ah,4ch
	int 21h

main endp

hex_inp proc

inp:	mov dx,offset str1
	mov ah,09h
	int 21h

	mov ch,4

	xor bx,bx

again:	mov ah,01h
	int 21h

	cmp al,13

	je exit

	cmp al,'0'
	jb error

	cmp al,'9'
	ja letter

	sub al,48
	jmp aa

letter:	cmp al,'A'
	jb error

	cmp al,'F'
	ja error

	sub al,55

aa:	shl bx,4
	or bl,al

	dec ch
	jz exit

	jmp again

error:	mov dx,offset str2
	mov ah,09h
	int 21h

	jmp inp

exit:	ret

hex_inp endp
end main



	


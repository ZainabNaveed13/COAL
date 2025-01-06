.model small
.stack 100h
.386
.data
	str1 db "Input binary : $"
	str2 db 10,13, "Invalid input!!$"
.code
main proc
	mov ax,@data
	mov ds,ax

	call bin_inp

	mov ah,4ch
	int 21h

main endp

bin_inp proc

inp:	mov dx,offset str1
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

exit:	ret

error: 	mov dx,offset str2
	mov ah,09h
	int 21h
	
	jmp inp

bin_inp endp
end main

	
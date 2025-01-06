.model small
.stack 100h
.386
.data
	str1 db 10,13, "Input binary : $"
	str2 db 10,13, "Invalid input!!$"
	str3 db 10,13, "Output hexa : $"
.code
main proc
	mov ax,@data
	mov ds,ax

	call bin_inp

	call hex_out

	mov ah,4ch
	int 21h

main endp

bin_inp proc
	
inp:	mov dx,offset str1
	mov ah,09h
	int 21h

	mov cl,16

	xor bx,bx

again:	mov ah,01h
	int 21h

	cmp al,13
	je exit

	sub al,48

	cmp al,1
	je valid

	cmp al,0
	jne error

valid:	shl bx,1
	or bl,al

	dec cl
	jnz again

	jmp exit

error:	mov dx,offset str2
	mov ah,09h
	int 21h

	jmp inp

exit: ret

bin_inp endp

hex_out proc
	
	mov dx,offset str3
	mov ah,09h
	int 21h

	mov ch,4
	
ag:	cmp ch,0
	je finish

	rol bx,4
	
	mov dl,bl
	
	and dl,0Fh

	cmp dl,09h
	ja alp

	add dl,48
	jmp prnt

alp:	add dl,55

prnt:	mov ah,02h
	int 21h

	dec ch
	jnz ag

finish:	ret

hex_out endp

end main

	


	





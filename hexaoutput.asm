.model small
.stack 100h
.386
.data
.code
main proc
	mov bx,43C2h
	mov cx,4
	
again:	rol bx,4
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

exit:	mov ah,4ch
	int 21h

main endp
end main




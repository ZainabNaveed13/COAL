.model small
.stack 100h
.data
.code
main proc
	mov bx,43C2h
	mov cx,16

	rol bx,1
	jc aa

	mov dl,'0'
	mov ah,02h
	int 21h

	jmp bb

aa:	mov dl,'1'
	mov ah,02h
	int 21h

bb:	dec cx
	jnz again
	
	mov ah,4ch
	int 21h

main endp
end main


	

	

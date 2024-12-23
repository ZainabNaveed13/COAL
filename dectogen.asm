.model small
.stack 100h
.data
	str1 db 10,13,"Decimal input : $"
	str2 db 10,13,"Enter the output base : $"
	str3 db 10,13,"Output : $"
	var1 dw 0
.code
main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09h
	int 21h

	call dec_inp
	push bx

	mov dx,offset str2
	mov ah,09h
	int 21h

	call dec_inp
	mov var1,bx

	pop bx
	call gen_out

	mov ah,4ch
	int 21h
main endp

dec_inp proc
	mov bx,0

again:	mov ah,01h
	int 21h

	cmp al,13
	je exit

	sub al,48
	mov cl,al
	mov ch,0

	mov ax,bx
	mov bx,10
	mul bx

	add ax,cx
	mov bx,ax
	jmp again

exit:	ret

dec_inp endp

gen_out proc
	mov ah,0

	sub al,48
	mov var1,ax

	mov ax,bx

ag:	cmp ax,0
	je print

	mov bx,var1
	mov dx,0

	div bx
	push dx

	inc cx
	jmp ag

print:	mov dx,offset str3
	mov ah,09h
	int 21h
	
prnt:	pop dx
	
	cmp dl,'9'

	jb digit

	add dl,7

digit:	add dl,48

	mov ah,02h
	int 21h

	dec cx
	jnz prnt

	ret
gen_out endp

end main


	
	





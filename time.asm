.model small
.stack 100h
.386
.data
	str1 db 10,13,"Enter seconds : $"
	str5 db 10,13,"RESULT : "
	str2 db " Hours  $"
	str3 db " Minutes  $"
	str4 db " Seconds $"
	sec dw 0

.code
main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09h
	int 21h

	call dec_inp

	mov dx,offset str5
	mov ah,09h
	int 21h

	mov sec,bx
	mov ax,sec
	mov bx,3600
	mov dx,0

	div bx
	mov sec,dx

	call dec_out

	mov dx,offset str2
	mov ah,09h
	int 21h

	mov ax,sec
	mov bx,60
	mov dx,0
	div bx
	
	call dec_out

	mov sec,dx

	mov dx,offset str3
	mov ah,09h
	int 21h

	mov ax,sec

	call dec_out

	mov dx,offset str4
	mov ah,09h
	int 21h

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

	mov bx,ax
	jmp again

exit:	ret

dec_inp endp

dec_out proc
	mov cx,0

again:	cmp ax,0
	je prnt

	mov bx,10

	mov dx,0

	div bx

	push dx
	
	inc cx

	jmp again

prnt:	cmp cx,0
	je finish

	pop dx
	
	add dl,48
	mov ah,02h
	int 21h

	dec cx
	jmp prnt

finish:	ret

dec_out endp

end main




	
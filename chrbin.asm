.model small
.stack 100h
.data
	str1 db "Enter a character : $"
	str2 db "The binary of the character is :$"
	str3 db 10,13,"The number of 1 bit in ascii code: $"
.code
main proc
	mov ax,@data
	mov ds,ax

	mov dx,offset str1
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h
	mov bh,al

	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h

	mov dx,offset str2
	mov ah,09h
	int 21h

	mov cl,8 
	mov ch,0

again:	cmp cl,0
	je exit
	
	shl bh,1
	jc aa

	mov dl,'0'
	mov ah,02h
	int 21h

	dec cl
	jmp again

aa:	mov dl,'1'
	mov ah,02h
	int 21h
	inc ch

	dec cl
	jmp again

exit :  
	mov dx,offset str3
	mov ah,09h
	int 21h

	add ch,48
	mov dl,ch
	mov ah,02h
	int 21h

	mov ah,4ch
	int 21h

main endp
end main
	



	
	


	


	
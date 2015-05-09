assume cs:codeseg ds:dataseg ss:stackseg
dataseg segment
	dw 
dataseg ends	
stackseg segment
	dw 0,0,0,0,0,0,0,0
stackseg ends
codeseg segment
	start:
		mov ax, dataseg
		mov ds, ax
		mov ax, stackseg
		mov ss, ax
		mov sp, 16
		mov cx, 8
		mov bx, 0
		l1:
		   push [bx]
		   add bx,2
		   loop l1

		mov bx, 0
		mov cx, 8
		l2:pop [bx]
		   add bx, 2
		   loop l2
		mov ax,4c00H
		int 21h
codeseg ends
end start

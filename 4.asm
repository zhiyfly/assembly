assume cs:codeseg, ds:dataseg, ss:stackseg
dataseg segment
	dw 0012H,0345H,0678H,09abH,0cdeH,0f01H,0234H,0567H
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
		s:push [bx]
		   add bx,2
		   loop s
		mov bx, 0
		mov cx, 8
		s0:pop [bx]
		   add bx, 2
		   loop s0
		mov ax,4c00H
		int 21h
codeseg ends
end start

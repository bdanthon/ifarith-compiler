section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


_main:	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov esi, 7
	mov [rbp-16], esi
	mov edi, [rbp-16]
	mov eax, [rbp-8]
	mov eax, edi
	mov [rbp-8], eax
	mov edi, [rbp-8]
	mov eax, [rbp-16]
	mul eax, edi
	mov [rbp-16], eax
	mov esi, [rbp-16]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
finish_up:	add rsp, 32
	leave 
	ret 


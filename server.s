.intel_syntax noprefix

# socket
mov rax, 41             # socket syscall code
mov rdi, 2              # address family ipv4
mov rsi, 1              # sock stream
mov rdx, 0              # default protocol
syscall

mov r8, rax

# bind

mov rcx, 0
push rcx                # padding
mov rcx, 0x0000000050000002     # address + port + family
push rcx

mov rbx, rsp

mov rdi, r8
mov rsi, rbx
mov rdx, 0x10           # move fd to for the next call
mov rax, 49
syscall


# listen

mov rdi, r8
mov rsi, 0
mov rax, 50 
syscall


# accept
mov rdi, r8
mov rsi, 0
mov rdx, 0
mov rax, 43
syscall


# exit
mov rax, 60
mov rdi, 0
syscall

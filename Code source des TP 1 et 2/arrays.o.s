	.file	"arrays.c"
	.intel_syntax noprefix
	.text
	.globl	malloc_aligned
	.type	malloc_aligned, @function
malloc_aligned:
.LFB50:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	and	rdi, -32
	lea	rsi, 32[rdi]
	mov	edi, 32
	call	aligned_alloc@PLT
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	malloc_aligned, .-malloc_aligned
	.globl	db_init
	.type	db_init, @function
db_init:
.LFB51:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	r14, rdi
	mov	ebp, esi
	mov	edi, 64
	call	malloc@PLT
	mov	rbx, rax
	movsx	r12, ebp
	lea	r13, 0[0+r12*8]
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR [rbx], rax
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 8[rbx], rax
	lea	r13, 0[0+r12*4]
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 16[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 24[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 32[rbx], rax
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 40[rbx], rax
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 48[rbx], rax
	mov	DWORD PTR 56[rbx], ebp
	test	ebp, ebp
	jle	.L3
	mov	rdi, r14
	lea	esi, -1[rbp]
	mov	eax, 0
.L5:
	mov	rcx, QWORD PTR [rdi]
	mov	rdx, QWORD PTR [rbx]
	mov	QWORD PTR [rdx+rax*8], rcx
	mov	rcx, QWORD PTR 8[rdi]
	mov	rdx, QWORD PTR 8[rbx]
	mov	QWORD PTR [rdx+rax*8], rcx
	mov	ecx, DWORD PTR 20[rdi]
	mov	rdx, QWORD PTR 16[rbx]
	mov	DWORD PTR [rdx+rax*4], ecx
	movzx	ecx, BYTE PTR 16[rdi]
	mov	rdx, QWORD PTR 24[rbx]
	mov	BYTE PTR [rdx+rax], cl
	movzx	ecx, BYTE PTR 17[rdi]
	mov	rdx, QWORD PTR 32[rbx]
	mov	BYTE PTR [rdx+rax], cl
	movss	xmm0, DWORD PTR 24[rdi]
	mov	rdx, QWORD PTR 40[rbx]
	movss	DWORD PTR [rdx+rax*4], xmm0
	movss	xmm0, DWORD PTR 28[rdi]
	mov	rdx, QWORD PTR 48[rbx]
	movss	DWORD PTR [rdx+rax*4], xmm0
	mov	rdx, rax
	add	rax, 1
	add	rdi, 32
	cmp	rdx, rsi
	jne	.L5
.L3:
	mov	rax, rbx
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	db_init, .-db_init
	.globl	db_free
	.type	db_free, @function
db_free:
.LFB52:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR [rdi]
	call	free@PLT
	mov	rdi, QWORD PTR 8[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 16[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 24[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 32[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 40[rbx]
	call	free@PLT
	mov	rdi, QWORD PTR 48[rbx]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE52:
	.size	db_free, .-db_free
	.globl	db_get
	.type	db_get, @function
db_get:
.LFB53:
	.cfi_startproc
	endbr64
	mov	rax, rdi
	mov	rcx, QWORD PTR 8[rsi]
	mov	r9, QWORD PTR [rcx+rdx*8]
	mov	rcx, QWORD PTR 24[rsi]
	movzx	r8d, BYTE PTR [rcx+rdx]
	mov	rcx, QWORD PTR 32[rsi]
	movzx	edi, BYTE PTR [rcx+rdx]
	mov	rcx, QWORD PTR 16[rsi]
	mov	ecx, DWORD PTR [rcx+rdx*4]
	mov	r10, QWORD PTR 40[rsi]
	movss	xmm1, DWORD PTR [r10+rdx*4]
	mov	r10, QWORD PTR 48[rsi]
	movss	xmm0, DWORD PTR [r10+rdx*4]
	mov	rsi, QWORD PTR [rsi]
	mov	rdx, QWORD PTR [rsi+rdx*8]
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 8[rax], r9
	mov	BYTE PTR 16[rax], r8b
	mov	BYTE PTR 17[rax], dil
	mov	DWORD PTR 20[rax], ecx
	movss	DWORD PTR 24[rax], xmm1
	movss	DWORD PTR 28[rax], xmm0
	ret
	.cfi_endproc
.LFE53:
	.size	db_get, .-db_get
	.globl	db_count_male
	.type	db_count_male, @function
db_count_male:
.LFB54:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR 24[rdi]
	mov	edx, DWORD PTR 56[rdi]
	test	edx, edx
	jle	.L14
	mov	rax, rcx
	lea	edx, -1[rdx]
	lea	rsi, 1[rcx+rdx]
	mov	edx, 0
.L13:
	cmp	BYTE PTR [rax], 0
	sete	cl
	movzx	ecx, cl
	add	edx, ecx
	add	rax, 1
	cmp	rax, rsi
	jne	.L13
.L11:
	mov	eax, edx
	ret
.L14:
	mov	edx, 0
	jmp	.L11
	.cfi_endproc
.LFE54:
	.size	db_count_male, .-db_count_male
	.globl	db_max_age
	.type	db_max_age, @function
db_max_age:
.LFB55:
	.cfi_startproc
	endbr64
	mov	eax, 0
	ret
	.cfi_endproc
.LFE55:
	.size	db_max_age, .-db_max_age
	.globl	db_oldest
	.type	db_oldest, @function
db_oldest:
.LFB56:
	.cfi_startproc
	endbr64
	mov	rax, -1
	ret
	.cfi_endproc
.LFE56:
	.size	db_oldest, .-db_oldest
	.globl	db_closest
	.type	db_closest, @function
db_closest:
.LFB57:
	.cfi_startproc
	endbr64
	mov	rax, -1
	ret
	.cfi_endproc
.LFE57:
	.size	db_closest, .-db_closest
	.globl	db_count_female_muggles
	.type	db_count_female_muggles, @function
db_count_female_muggles:
.LFB58:
	.cfi_startproc
	endbr64
	mov	eax, 0
	ret
	.cfi_endproc
.LFE58:
	.size	db_count_female_muggles, .-db_count_female_muggles
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:

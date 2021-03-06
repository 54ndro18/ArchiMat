	.file	"arrays.c"
	.intel_syntax noprefix
	.text
	.globl	thread_process_requests_split
	.type	thread_process_requests_split, @function
thread_process_requests_split:
.LFB5337:
	.cfi_startproc
	endbr64
	mov	edx, DWORD PTR 16[rdi]
	test	edx, edx
	jle	.L2
	mov	eax, 0
.L3:
	add	eax, 1
	cmp	edx, eax
	jne	.L3
.L2:
	mov	eax, 0
	ret
	.cfi_endproc
.LFE5337:
	.size	thread_process_requests_split, .-thread_process_requests_split
	.globl	extract_float
	.type	extract_float, @function
extract_float:
.LFB5318:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	and	rsp, -32
	vmovaps	YMMWORD PTR -32[rsp], ymm0
	movsx	rdi, edi
	vmovss	xmm0, DWORD PTR -32[rsp+rdi*4]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5318:
	.size	extract_float, .-extract_float
	.globl	extract_uint32
	.type	extract_uint32, @function
extract_uint32:
.LFB5319:
	.cfi_startproc
	endbr64
	cmp	edi, 7
	ja	.L8
	mov	edi, edi
	lea	rdx, .L10[rip]
	movsx	rax, DWORD PTR [rdx+rdi*4]
	add	rax, rdx
	notrack jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L10:
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L17:
	vmovd	eax, xmm0
	ret
.L16:
	vpextrd	eax, xmm0, 1
	ret
.L15:
	vpextrd	eax, xmm0, 2
	ret
.L14:
	vpextrd	eax, xmm0, 3
	ret
.L13:
	vextracti128	xmm0, ymm0, 0x1
	vmovd	eax, xmm0
	ret
.L12:
	vextracti128	xmm0, ymm0, 0x1
	vpextrd	eax, xmm0, 1
	ret
.L11:
	vextracti128	xmm0, ymm0, 0x1
	vpextrd	eax, xmm0, 2
	ret
.L9:
	vextracti128	xmm0, ymm0, 0x1
	vpextrd	eax, xmm0, 3
	ret
.L8:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	and	rsp, -32
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE5319:
	.size	extract_uint32, .-extract_uint32
	.globl	min_float_in_vector
	.type	min_float_in_vector, @function
min_float_in_vector:
.LFB5320:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	and	rsp, -32
	sub	rsp, 64
	vmovaps	ymm2, ymm0
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 56[rsp], rax
	xor	eax, eax
	lea	rax, 4[rsp]
	lea	rdx, 32[rsp]
.L24:
	vmovaps	YMMWORD PTR [rsp], ymm2
	vmovss	xmm1, DWORD PTR [rax]
	vminss	xmm0, xmm1, xmm0
	add	rax, 4
	cmp	rax, rdx
	jne	.L24
	mov	rax, QWORD PTR 56[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L29
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L29:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5320:
	.size	min_float_in_vector, .-min_float_in_vector
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%20s: "
.LC1:
	.string	"%10.2f  "
	.text
	.globl	print_vec
	.type	print_vec, @function
print_vec:
.LFB5321:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r13
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	push	rbx
	sub	rsp, 48
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	mov	rdx, rdi
	vmovaps	YMMWORD PTR -80[rbp], ymm0
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rbx, -80[rbp]
	lea	r13, -48[rbp]
	lea	r12, .LC1[rip]
.L31:
	vxorpd	xmm1, xmm1, xmm1
	vcvtss2sd	xmm0, xmm1, DWORD PTR [rbx]
	mov	rsi, r12
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	add	rbx, 4
	cmp	rbx, r13
	jne	.L31
	mov	edi, 10
	call	putchar@PLT
	add	rsp, 48
	pop	rbx
	pop	r10
	.cfi_def_cfa 10, 0
	pop	r12
	pop	r13
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5321:
	.size	print_vec, .-print_vec
	.section	.rodata.str1.1
.LC2:
	.string	"%10u  "
	.text
	.globl	print_vec_epu32
	.type	print_vec_epu32, @function
print_vec_epu32:
.LFB5322:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	push	rbx
	sub	rsp, 56
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	mov	rdx, rdi
	vmovdqa	YMMWORD PTR -80[rbp], ymm0
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	ebx, 0
	lea	r12, .LC2[rip]
.L35:
	mov	edi, ebx
	vmovdqa	ymm0, YMMWORD PTR -80[rbp]
	call	extract_uint32
	mov	edx, eax
	mov	rsi, r12
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	add	ebx, 1
	cmp	ebx, 8
	jne	.L35
	mov	edi, 10
	call	putchar@PLT
	add	rsp, 56
	pop	rbx
	pop	r10
	.cfi_def_cfa 10, 0
	pop	r12
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5322:
	.size	print_vec_epu32, .-print_vec_epu32
	.section	.rodata.str1.1
.LC3:
	.string	"%10X  "
	.text
	.globl	print_vec_mask
	.type	print_vec_mask, @function
print_vec_mask:
.LFB5323:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	push	rbx
	sub	rsp, 56
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	mov	rdx, rdi
	vmovdqa	YMMWORD PTR -80[rbp], ymm0
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	ebx, 0
	lea	r12, .LC3[rip]
.L39:
	mov	edi, ebx
	vmovdqa	ymm0, YMMWORD PTR -80[rbp]
	call	extract_uint32
	mov	edx, eax
	mov	rsi, r12
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	add	ebx, 1
	cmp	ebx, 8
	jne	.L39
	mov	edi, 10
	call	putchar@PLT
	add	rsp, 56
	pop	rbx
	pop	r10
	.cfi_def_cfa 10, 0
	pop	r12
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5323:
	.size	print_vec_mask, .-print_vec_mask
	.globl	malloc_aligned
	.type	malloc_aligned, @function
malloc_aligned:
.LFB5325:
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
.LFE5325:
	.size	malloc_aligned, .-malloc_aligned
	.globl	db_init
	.type	db_init, @function
db_init:
.LFB5326:
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
	mov	edi, 72
	call	malloc@PLT
	mov	rbx, rax
	movsx	r13, ebp
	lea	r12, 0[0+r13*8]
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR [rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 8[rbx], rax
	lea	r12, 0[0+r13*4]
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 16[rbx], rax
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 24[rbx], rax
	mov	rdi, r13
	call	malloc_aligned
	mov	QWORD PTR 32[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 40[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 48[rbx], rax
	mov	rdi, r12
	call	malloc_aligned
	mov	QWORD PTR 56[rbx], rax
	mov	DWORD PTR 64[rbx], 0
	mov	DWORD PTR 68[rbx], ebp
	test	ebp, ebp
	jle	.L44
	mov	rdi, r14
	lea	esi, -1[rbp]
	mov	eax, 0
.L46:
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
	vmovss	xmm0, DWORD PTR 24[rdi]
	mov	rdx, QWORD PTR 40[rbx]
	vmovss	DWORD PTR [rdx+rax*4], xmm0
	vmovss	xmm0, DWORD PTR 28[rdi]
	mov	rdx, QWORD PTR 48[rbx]
	vmovss	DWORD PTR [rdx+rax*4], xmm0
	mov	rdx, QWORD PTR 56[rbx]
	mov	DWORD PTR [rdx+rax*4], 0
	mov	rdx, rax
	add	rax, 1
	add	rdi, 32
	cmp	rdx, rsi
	jne	.L46
.L44:
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
.LFE5326:
	.size	db_init, .-db_init
	.globl	db_free
	.type	db_free, @function
db_free:
.LFB5327:
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
	mov	rdi, QWORD PTR 56[rbx]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5327:
	.size	db_free, .-db_free
	.globl	db_get
	.type	db_get, @function
db_get:
.LFB5328:
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
	vmovss	xmm1, DWORD PTR [r10+rdx*4]
	mov	r10, QWORD PTR 48[rsi]
	vmovss	xmm0, DWORD PTR [r10+rdx*4]
	mov	rsi, QWORD PTR [rsi]
	mov	rdx, QWORD PTR [rsi+rdx*8]
	mov	QWORD PTR [rax], rdx
	mov	QWORD PTR 8[rax], r9
	mov	BYTE PTR 16[rax], r8b
	mov	BYTE PTR 17[rax], dil
	mov	DWORD PTR 20[rax], ecx
	vmovss	DWORD PTR 24[rax], xmm1
	vmovss	DWORD PTR 28[rax], xmm0
	ret
	.cfi_endproc
.LFE5328:
	.size	db_get, .-db_get
	.globl	db_max_age_old
	.type	db_max_age_old, @function
db_max_age_old:
.LFB5329:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR 16[rdi]
	mov	edx, DWORD PTR 68[rdi]
	test	edx, edx
	jle	.L55
	mov	rax, rcx
	lea	edx, -1[rdx]
	lea	rsi, 4[rcx+rdx*4]
	mov	edx, 0
.L54:
	mov	ecx, DWORD PTR [rax]
	cmp	edx, ecx
	cmovb	edx, ecx
	add	rax, 4
	cmp	rax, rsi
	jne	.L54
.L52:
	mov	eax, edx
	ret
.L55:
	mov	edx, 0
	jmp	.L52
	.cfi_endproc
.LFE5329:
	.size	db_max_age_old, .-db_max_age_old
	.globl	db_max_age
	.type	db_max_age, @function
db_max_age:
.LFB5330:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r12
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	push	rbx
	sub	rsp, 56
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	mov	rcx, QWORD PTR 16[rdi]
	mov	edx, DWORD PTR 68[rdi]
	test	edx, edx
	jle	.L61
	mov	rax, rcx
	sub	edx, 1
	shr	edx, 3
	mov	edx, edx
	sal	rdx, 5
	lea	rdx, 32[rcx+rdx]
	vpxor	xmm3, xmm3, xmm3
	vmovdqa	YMMWORD PTR -80[rbp], ymm3
.L59:
	vmovdqa	ymm2, YMMWORD PTR -80[rbp]
	vpmaxud	ymm1, ymm2, YMMWORD PTR [rax]
	vmovdqa	YMMWORD PTR -80[rbp], ymm1
	add	rax, 32
	cmp	rdx, rax
	jne	.L59
.L58:
	mov	ebx, 0
	mov	r12d, 0
.L60:
	mov	edi, ebx
	vmovdqa	ymm0, YMMWORD PTR -80[rbp]
	call	extract_uint32
	cmp	r12d, eax
	cmovb	r12d, eax
	add	ebx, 1
	cmp	ebx, 8
	jne	.L60
	mov	eax, r12d
	add	rsp, 56
	pop	rbx
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	r12
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
.L61:
	.cfi_restore_state
	vpxor	xmm4, xmm4, xmm4
	vmovdqa	YMMWORD PTR -80[rbp], ymm4
	jmp	.L58
	.cfi_endproc
.LFE5330:
	.size	db_max_age, .-db_max_age
	.globl	db_min_dist_old
	.type	db_min_dist_old, @function
db_min_dist_old:
.LFB5331:
	.cfi_startproc
	endbr64
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	vmovss	xmm4, DWORD PTR .LC4[rip]
	vdivss	xmm4, xmm4, DWORD PTR .LC5[rip]
	mov	eax, DWORD PTR 68[rdi]
	mov	rcx, QWORD PTR 40[rdi]
	mov	rsi, QWORD PTR 48[rdi]
	test	eax, eax
	jle	.L66
	lea	edi, -1[rax]
	mov	eax, 0
	jmp	.L69
.L71:
	mov	rax, rdx
.L69:
	vmovss	xmm2, DWORD PTR [rcx+rax*4]
	vsubss	xmm2, xmm2, xmm0
	vmovss	xmm3, DWORD PTR [rsi+rax*4]
	vsubss	xmm3, xmm3, xmm1
	vmulss	xmm2, xmm2, xmm2
	vmulss	xmm3, xmm3, xmm3
	vaddss	xmm2, xmm2, xmm3
	vminss	xmm4, xmm2, xmm4
	lea	rdx, 1[rax]
	cmp	rax, rdi
	jne	.L71
.L66:
	vsqrtss	xmm5, xmm4, xmm4
	vmovss	DWORD PTR 12[rsp], xmm5
	vxorps	xmm0, xmm0, xmm0
	vucomiss	xmm0, xmm4
	ja	.L74
.L65:
	vmovss	xmm0, DWORD PTR 12[rsp]
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L74:
	.cfi_restore_state
	vmovaps	xmm0, xmm4
	call	sqrtf@PLT
	jmp	.L65
	.cfi_endproc
.LFE5331:
	.size	db_min_dist_old, .-db_min_dist_old
	.globl	db_min_dist
	.type	db_min_dist, @function
db_min_dist:
.LFB5332:
	.cfi_startproc
	endbr64
	lea	r10, 8[rsp]
	.cfi_def_cfa 10, 0
	and	rsp, -32
	push	QWORD PTR -8[r10]
	push	rbp
	mov	rbp, rsp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	push	r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	sub	rsp, 40
	mov	edx, DWORD PTR 68[rdi]
	mov	rcx, QWORD PTR 40[rdi]
	mov	rsi, QWORD PTR 48[rdi]
	vbroadcastss	ymm4, xmm0
	vmovss	xmm0, DWORD PTR .LC4[rip]
	vdivss	xmm0, xmm0, DWORD PTR .LC5[rip]
	vbroadcastss	ymm0, xmm0
	test	edx, edx
	jle	.L76
	vbroadcastss	ymm1, xmm1
	mov	eax, 0
.L77:
	vmovaps	ymm5, YMMWORD PTR [rcx+rax*4]
	vsubps	ymm2, ymm5, ymm4
	vmovaps	ymm6, YMMWORD PTR [rsi+rax*4]
	vsubps	ymm3, ymm6, ymm1
	vmulps	ymm2, ymm2, ymm2
	vmulps	ymm3, ymm3, ymm3
	vaddps	ymm2, ymm2, ymm3
	vminps	ymm0, ymm0, ymm2
	add	rax, 8
	cmp	edx, eax
	jg	.L77
.L76:
	call	min_float_in_vector
	vsqrtss	xmm7, xmm0, xmm0
	vmovss	DWORD PTR -20[rbp], xmm7
	vxorps	xmm1, xmm1, xmm1
	vucomiss	xmm1, xmm0
	ja	.L81
.L75:
	vmovss	xmm0, DWORD PTR -20[rbp]
	add	rsp, 40
	pop	r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	pop	rbp
	lea	rsp, -8[r10]
	.cfi_def_cfa 7, 8
	ret
.L81:
	.cfi_restore_state
	call	sqrtf@PLT
	jmp	.L75
	.cfi_endproc
.LFE5332:
	.size	db_min_dist, .-db_min_dist
	.globl	db_closest
	.type	db_closest, @function
db_closest:
.LFB5333:
	.cfi_startproc
	endbr64
	vmovss	xmm4, DWORD PTR .LC4[rip]
	vdivss	xmm4, xmm4, DWORD PTR .LC5[rip]
	mov	eax, DWORD PTR 68[rdi]
	mov	rsi, QWORD PTR 40[rdi]
	mov	rdi, QWORD PTR 48[rdi]
	test	eax, eax
	jle	.L87
	lea	r8d, -1[rax]
	mov	edx, 0
	mov	eax, -1
	jmp	.L86
.L88:
	mov	rdx, rcx
.L86:
	vsubss	xmm2, xmm0, DWORD PTR [rsi+rdx*4]
	vsubss	xmm3, xmm1, DWORD PTR [rdi+rdx*4]
	vmulss	xmm2, xmm2, xmm2
	vmulss	xmm3, xmm3, xmm3
	vaddss	xmm2, xmm2, xmm3
	vcomiss	xmm4, xmm2
	cmova	eax, edx
	vminss	xmm4, xmm2, xmm4
	lea	rcx, 1[rdx]
	cmp	rdx, r8
	jne	.L88
.L83:
	cdqe
	ret
.L87:
	mov	eax, -1
	jmp	.L83
	.cfi_endproc
.LFE5333:
	.size	db_closest, .-db_closest
	.section	.rodata.str1.1
.LC6:
	.string	"Error unsupported operation"
	.text
	.globl	db_process_single_request
	.type	db_process_single_request, @function
db_process_single_request:
.LFB5334:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 24
	.cfi_def_cfa_offset 64
	mov	rbp, rdi
	mov	rbx, rsi
	mov	r13d, edx
	mov	eax, DWORD PTR [rsi]
	mov	r12, QWORD PTR 8[rsi]
	test	eax, eax
	jne	.L91
	mov	rax, QWORD PTR 24[rsi]
	test	rax, rax
	je	.L92
	mov	rdx, QWORD PTR 16[rdi]
	mov	edx, DWORD PTR [rdx+r12*4]
	mov	DWORD PTR [rax], edx
.L92:
	test	r13b, r13b
	jne	.L97
	mov	rax, QWORD PTR 56[rbp]
	add	DWORD PTR [rax+r12*4], 1
.L90:
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L91:
	.cfi_restore_state
	cmp	eax, 1
	je	.L100
	cmp	eax, 2
	je	.L101
	cmp	eax, 3
	jne	.L95
	mov	rax, QWORD PTR 40[rdi]
	vmovss	xmm1, DWORD PTR [rax+r12*4]
	mov	rax, QWORD PTR 48[rdi]
	vmovss	xmm0, DWORD PTR [rax+r12*4]
	vmulss	xmm1, xmm1, xmm1
	vmulss	xmm0, xmm0, xmm0
	vaddss	xmm2, xmm1, xmm0
	vmovss	DWORD PTR 12[rsp], xmm2
	vxorps	xmm0, xmm0, xmm0
	vucomiss	xmm0, xmm2
	ja	.L102
.L96:
	mov	rax, QWORD PTR 24[rbx]
	test	rax, rax
	je	.L92
	vmovss	xmm0, DWORD PTR 12[rsp]
	vsqrtss	xmm0, xmm0, xmm0
	vmovss	DWORD PTR [rax], xmm0
	jmp	.L92
.L100:
	mov	edx, DWORD PTR 16[rsi]
	mov	rax, QWORD PTR 16[rdi]
	mov	DWORD PTR [rax+r12*4], edx
	jmp	.L92
.L101:
	mov	rax, QWORD PTR 24[rsi]
	test	rax, rax
	je	.L92
	mov	rdx, QWORD PTR 24[rdi]
	movzx	edx, BYTE PTR [rdx+r12]
	mov	BYTE PTR [rax], dl
	jmp	.L92
.L102:
	vmovaps	xmm0, xmm2
	call	sqrtf@PLT
	jmp	.L96
.L95:
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L97:
	mov	rax, QWORD PTR 56[rbp]
	lock add	DWORD PTR [rax+r12*4], 1
	jmp	.L90
	.cfi_endproc
.LFE5334:
	.size	db_process_single_request, .-db_process_single_request
	.globl	thread_process_requests_base
	.type	thread_process_requests_base, @function
thread_process_requests_base:
.LFB5336:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	mov	r15, QWORD PTR [rdi]
	mov	rax, QWORD PTR 8[rdi]
	mov	r13d, DWORD PTR 16[rdi]
	mov	ebx, DWORD PTR 20[rdi]
	mov	r14d, DWORD PTR 24[rdi]
	cmp	r13d, ebx
	jle	.L104
	movsx	r12, r14d
	sal	r12, 5
	movsx	rbp, ebx
	sal	rbp, 5
	add	rbp, rax
.L105:
	mov	edx, 1
	mov	rsi, rbp
	mov	rdi, r15
	call	db_process_single_request
	add	ebx, r14d
	add	rbp, r12
	cmp	ebx, r13d
	jl	.L105
.L104:
	mov	eax, 0
	add	rsp, 8
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5336:
	.size	thread_process_requests_base, .-thread_process_requests_base
	.globl	db_process_many_requests
	.type	db_process_many_requests, @function
db_process_many_requests:
.LFB5335:
	.cfi_startproc
	endbr64
	test	edx, edx
	jle	.L113
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbp, rdi
	mov	rbx, rsi
	lea	eax, -1[rdx]
	sal	rax, 5
	lea	r12, 32[rsi+rax]
.L110:
	mov	edx, 0
	mov	rsi, rbx
	mov	rdi, rbp
	call	db_process_single_request
	add	rbx, 32
	cmp	rbx, r12
	jne	.L110
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L113:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE5335:
	.size	db_process_many_requests, .-db_process_many_requests
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"pthread_create error for thread %d\n"
	.text
	.globl	db_process_many_requests_parallel
	.type	db_process_many_requests_parallel, @function
db_process_many_requests_parallel:
.LFB5338:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 56
	.cfi_def_cfa_offset 112
	mov	QWORD PTR 8[rsp], rdi
	mov	QWORD PTR 16[rsp], rsi
	mov	r14d, edx
	mov	r12d, ecx
	mov	r15d, r8d
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	movsx	rdi, ecx
	sal	rdi, 3
	call	malloc@PLT
	mov	QWORD PTR 24[rsp], rax
	test	r12d, r12d
	jle	.L116
	mov	r13, rax
	mov	rbp, rax
	mov	ebx, 0
	jmp	.L120
.L118:
	lea	rdx, thread_process_requests_split[rip]
	mov	esi, 0
	mov	rdi, rbp
	call	pthread_create@PLT
	test	eax, eax
	js	.L126
.L119:
	lea	eax, 1[rbx]
	add	rbp, 8
	cmp	r12d, eax
	je	.L127
	mov	ebx, eax
.L120:
	mov	edi, 32
	call	malloc@PLT
	mov	rcx, rax
	mov	DWORD PTR 20[rax], ebx
	mov	DWORD PTR 24[rax], r12d
	mov	rax, QWORD PTR 8[rsp]
	mov	QWORD PTR [rcx], rax
	mov	rax, QWORD PTR 16[rsp]
	mov	QWORD PTR 8[rcx], rax
	mov	DWORD PTR 16[rcx], r14d
	test	r15b, r15b
	jne	.L118
	lea	rdx, thread_process_requests_base[rip]
	mov	esi, 0
	mov	rdi, rbp
	call	pthread_create@PLT
	test	eax, eax
	jns	.L119
	mov	ecx, ebx
	lea	rdx, .LC7[rip]
	mov	esi, 1
	mov	rdi, QWORD PTR stderr[rip]
	mov	eax, 0
	call	__fprintf_chk@PLT
	mov	edi, 1
	call	exit@PLT
.L126:
	mov	ecx, ebx
	lea	rdx, .LC7[rip]
	mov	esi, 1
	mov	rdi, QWORD PTR stderr[rip]
	mov	eax, 0
	call	__fprintf_chk@PLT
	mov	edi, 1
	call	exit@PLT
.L127:
	mov	ebx, ebx
	mov	rax, QWORD PTR 24[rsp]
	lea	rbp, 8[rax+rbx*8]
	lea	rbx, 32[rsp]
.L121:
	mov	rsi, rbx
	mov	rdi, QWORD PTR 0[r13]
	call	pthread_join@PLT
	add	r13, 8
	cmp	r13, rbp
	jne	.L121
.L116:
	mov	rax, QWORD PTR 40[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L128
	add	rsp, 56
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L128:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5338:
	.size	db_process_many_requests_parallel, .-db_process_many_requests_parallel
	.globl	db_total_accesses
	.type	db_total_accesses, @function
db_total_accesses:
.LFB5339:
	.cfi_startproc
	endbr64
	mov	eax, DWORD PTR 64[rdi]
	ret
	.cfi_endproc
.LFE5339:
	.size	db_total_accesses, .-db_total_accesses
	.globl	db_sum_individual_accesses
	.type	db_sum_individual_accesses, @function
db_sum_individual_accesses:
.LFB5340:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR 56[rdi]
	mov	edx, DWORD PTR 68[rdi]
	test	edx, edx
	jle	.L133
	mov	rax, rcx
	lea	edx, -1[rdx]
	lea	rcx, 4[rcx+rdx*4]
	mov	edx, 0
.L132:
	add	edx, DWORD PTR [rax]
	add	rax, 4
	cmp	rax, rcx
	jne	.L132
.L130:
	mov	eax, edx
	ret
.L133:
	mov	edx, 0
	jmp	.L130
	.cfi_endproc
.LFE5340:
	.size	db_sum_individual_accesses, .-db_sum_individual_accesses
	.globl	db_clear_accesses
	.type	db_clear_accesses, @function
db_clear_accesses:
.LFB5341:
	.cfi_startproc
	endbr64
	mov	rcx, QWORD PTR 56[rdi]
	mov	edx, DWORD PTR 68[rdi]
	test	edx, edx
	jle	.L136
	mov	rax, rcx
	lea	edx, -1[rdx]
	lea	rdx, 4[rcx+rdx*4]
.L137:
	mov	DWORD PTR [rax], 0
	add	rax, 4
	cmp	rax, rdx
	jne	.L137
.L136:
	mov	DWORD PTR 64[rdi], 0
	ret
	.cfi_endproc
.LFE5341:
	.size	db_clear_accesses, .-db_clear_accesses
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC4:
	.long	1065353216
	.align 4
.LC5:
	.long	0
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

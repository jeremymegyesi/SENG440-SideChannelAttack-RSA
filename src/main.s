	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"main.c"
	.global	E
	.data
	.align	3
	.type	E, %object
	.size	E, 8
E:
	.word	65537
	.word	0
	.text
	.align	2
	.global	BI_get_bit
	.type	BI_get_bit, %function
BI_get_bit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, fp}
	add	fp, sp, #20
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #63
	bgt	.L2
	ldr	r3, [fp, #-24]
	add	r6, r3, #8
	ldmia	r6, {r5-r6}
	ldr	r3, [fp, #-28]
	sub	r1, r3, #32
	mov	r3, #1
	mov	r8, r3, asl r1
	ldr	r3, [fp, #-28]
	rsb	r2, r3, #32
	mov	r3, #1
	mov	r0, r3, lsr r2
	mov	ip, #0
	ldr	r2, [fp, #-28]
	cmp	r1, #0
	mov	r7, #1
	ldr	r1, [fp, #-28]
	mov	r4, ip, asl r2
	orr	r4, r0, r4
	movge	r4, r8
	mov	r3, r7, asl r1
	and	r1, r5, r3
	and	r2, r6, r4
	ldr	r3, [fp, #-28]
	sub	r0, r3, #32
	mov	r5, r2, lsr r0
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #32
	mov	r6, r2, asl r3
	ldr	ip, [fp, #-28]
	cmp	r0, #0
	ldr	r0, [fp, #-28]
	mov	r3, r1, lsr ip
	orr	r3, r6, r3
	movge	r3, r5
	mov	r4, r2, lsr r0
	mov	r2, #0
	strb	r2, [fp, #-44]
	mov	r2, r3
	orr	r2, r2, r4
	cmp	r2, #0
	beq	.L3
	mov	r3, #1
	strb	r3, [fp, #-44]
.L3:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	str	r3, [fp, #-32]
	b	.L4
.L2:
	ldr	r3, [fp, #-28]
	cmp	r3, #127
	bgt	.L5
	ldr	r3, [fp, #-28]
	sub	r3, r3, #64
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r6, r3, #8
	ldmia	r6, {r5-r6}
	ldr	r3, [fp, #-28]
	sub	r1, r3, #32
	mov	r3, #1
	mov	r8, r3, asl r1
	ldr	r3, [fp, #-28]
	rsb	r2, r3, #32
	mov	r3, #1
	mov	r0, r3, lsr r2
	mov	ip, #0
	ldr	r2, [fp, #-28]
	cmp	r1, #0
	mov	r7, #1
	ldr	r1, [fp, #-28]
	mov	r4, ip, asl r2
	orr	r4, r0, r4
	movge	r4, r8
	mov	r3, r7, asl r1
	and	r1, r5, r3
	and	r2, r6, r4
	ldr	r3, [fp, #-28]
	sub	r0, r3, #32
	mov	r5, r2, lsr r0
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #32
	mov	r6, r2, asl r3
	ldr	ip, [fp, #-28]
	cmp	r0, #0
	ldr	r0, [fp, #-28]
	mov	r3, r1, lsr ip
	orr	r3, r6, r3
	movge	r3, r5
	mov	r4, r2, lsr r0
	mov	r2, #0
	strb	r2, [fp, #-52]
	mov	r2, r3
	orr	r2, r2, r4
	cmp	r2, #0
	beq	.L6
	mov	r3, #1
	strb	r3, [fp, #-52]
.L6:
	ldrb	r3, [fp, #-52]
	and	r3, r3, #255
	str	r3, [fp, #-32]
	b	.L4
.L5:
	mov	r3, #0
	str	r3, [fp, #-32]
.L4:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp}
	bx	lr
	.size	BI_get_bit, .-BI_get_bit
	.align	2
	.global	BI_shift_left
	.type	BI_shift_left, %function
BI_shift_left:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	mov	r3, r4, lsr #31
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	adds	r3, r3, r3
	adc	r4, r4, r4
	ldr	r2, [fp, #-16]
	str	r3, [r2, #8]
	str	r4, [r2, #12]
	ldr	r3, [fp, #-16]
	ldmia	r3, {r3-r4}
	adds	r3, r3, r3
	adc	r4, r4, r4
	mov	r1, r3
	mov	r2, r4
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	orr	r3, r3, r1
	orr	r4, r4, r2
	ldr	r2, [fp, #-16]
	stmia	r2, {r3-r4}
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
	.size	BI_shift_left, .-BI_shift_left
	.align	2
	.global	BI_shift_right
	.type	BI_shift_right, %function
BI_shift_right:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldmia	r3, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	and	r3, r3, r1
	and	r4, r4, r2
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	movs	r1, r4, lsr #1
	mov	r0, r3, rrx
	ldr	r2, [fp, #-12]
	mov	r4, r2, asl #31
	mov	r3, #0
	orr	r3, r3, r0
	orr	r4, r4, r1
	ldr	r2, [fp, #-16]
	str	r3, [r2, #8]
	str	r4, [r2, #12]
	ldr	r3, [fp, #-16]
	ldmia	r3, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	ldr	r2, [fp, #-16]
	stmia	r2, {r3-r4}
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
	.size	BI_shift_right, .-BI_shift_right
	.align	2
	.global	BI_to_BigInt
	.type	BI_to_BigInt, %function
BI_to_BigInt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #28
	mov	r5, r0
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	mov	ip, r5
	sub	r3, fp, #28
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, r5
	sub	sp, fp, #8
	ldmfd	sp!, {r4, r5, fp}
	bx	lr
	.size	BI_to_BigInt, .-BI_to_BigInt
	.section	.rodata
	.align	3
	.type	C.0.1712, %object
	.size	C.0.1712, 16
C.0.1712:
	.space	16
	.text
	.align	2
	.global	BI_sub
	.type	BI_sub, %function
BI_sub:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #64
	str	r0, [fp, #-64]
	str	r1, [fp, #-48]
	str	r2, [fp, #-52]
	ldr	r3, .L20
	sub	ip, fp, #44
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [fp, #-48]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	ldr	r3, [fp, #-52]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	sub	r2, fp, #20
	ldmia	r2, {r1-r2}
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-16]
	ldr	r4, [fp, #-56]
	cmp	r3, r4
	bcc	.L19
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-56]
	cmp	r3, r2
	bne	.L15
	ldr	r3, [fp, #-20]
	ldr	r4, [fp, #-60]
	cmp	r3, r4
	bcc	.L19
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-60]
	cmp	r3, r2
	b	.L15
.L19:
	mvn	r3, #0
	mvn	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	b	.L17
.L15:
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
.L17:
	ldr	r3, [fp, #-48]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	ldr	r3, [fp, #-52]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	sub	r2, fp, #20
	ldmia	r2, {r1-r2}
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	subs	r1, r1, r3
	sbc	r2, r2, r4
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	ip, [fp, #-64]
	sub	r3, fp, #44
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r0, [fp, #-64]
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
.L21:
	.align	2
.L20:
	.word	C.0.1712
	.size	BI_sub, .-BI_sub
	.section	.rodata
	.align	3
	.type	C.1.1731, %object
	.size	C.1.1731, 16
C.1.1731:
	.space	16
	.text
	.align	2
	.global	BI_add
	.type	BI_add, %function
BI_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #64
	str	r0, [fp, #-64]
	str	r1, [fp, #-48]
	str	r2, [fp, #-52]
	ldr	r3, .L28
	sub	ip, fp, #44
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [fp, #-48]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	ldr	r3, [fp, #-52]
	add	r4, r3, #8
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	sub	r2, fp, #20
	ldmia	r2, {r1-r2}
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-16]
	ldr	r4, [fp, #-56]
	cmp	r3, r4
	bhi	.L27
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-56]
	cmp	r3, r2
	bne	.L23
	ldr	r3, [fp, #-20]
	ldr	r4, [fp, #-60]
	cmp	r3, r4
	bhi	.L27
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-60]
	cmp	r3, r2
	b	.L23
.L27:
	mov	r3, #1
	mov	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	b	.L25
.L23:
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
.L25:
	ldr	r3, [fp, #-48]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	ldr	r3, [fp, #-52]
	ldmia	r3, {r3-r4}
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	sub	r2, fp, #20
	ldmia	r2, {r1-r2}
	sub	r4, fp, #12
	ldmia	r4, {r3-r4}
	adds	r1, r1, r3
	adc	r2, r2, r4
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	ip, [fp, #-64]
	sub	r3, fp, #44
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r0, [fp, #-64]
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
.L29:
	.align	2
.L28:
	.word	C.1.1731
	.size	BI_add, .-BI_add
	.align	2
	.global	BI_greater_than
	.type	BI_greater_than, %function
BI_greater_than:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-68]
	str	r2, [fp, #-64]
	ldr	r3, [fp, #-12]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-60]
	str	r2, [fp, #-56]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bne	.L31
	ldr	r1, [fp, #-64]
	ldr	r2, [fp, #-56]
	cmp	r1, r2
	bne	.L31
	ldr	r3, [fp, #-8]
	add	r2, r3, #8
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-12]
	add	r2, r3, #8
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-76]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bhi	.L33
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-32]
	cmp	r1, r2
	bne	.L32
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-36]
	cmp	r3, r1
	bhi	.L33
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	b	.L32
.L33:
	mov	r3, #1
	strb	r3, [fp, #-76]
.L32:
	ldrb	r1, [fp, #-76]
	and	r1, r1, #255
	str	r1, [fp, #-48]
	b	.L34
.L31:
	ldr	r3, [fp, #-8]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-28]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-20]
	str	r2, [fp, #-16]
	mov	r3, #0
	strb	r3, [fp, #-84]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bhi	.L36
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	cmp	r1, r2
	bne	.L35
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-20]
	cmp	r3, r1
	bhi	.L36
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	b	.L35
.L36:
	mov	r3, #1
	strb	r3, [fp, #-84]
.L35:
	ldrb	r1, [fp, #-84]
	and	r1, r1, #255
	str	r1, [fp, #-48]
.L34:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	BI_greater_than, .-BI_greater_than
	.align	2
	.global	BI_equals
	.type	BI_equals, %function
BI_equals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-44]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-12]
	ldmia	r3, {r1-r2}
	str	r1, [fp, #-36]
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L39
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-32]
	cmp	r1, r2
	bne	.L39
	ldr	r3, [fp, #-8]
	add	r2, r3, #8
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-28]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r2, r3, #8
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-20]
	str	r2, [fp, #-16]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L39
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	cmp	r1, r2
	bne	.L39
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L40
.L39:
	mov	r1, #0
	str	r1, [fp, #-48]
.L40:
	ldr	r2, [fp, #-48]
	and	r3, r2, #255
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	BI_equals, .-BI_equals
	.align	2
	.global	BI_mod
	.type	BI_mod, %function
BI_mod:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #132
	str	r1, [fp, #-120]
	str	r2, [fp, #-124]
	ldr	r3, [fp, #-124]
	sub	ip, fp, #52
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	sub	r3, fp, #68
	mov	r0, r3
	ldr	r1, [fp, #-124]
	ldr	r2, [fp, #-124]
	bl	BI_add
	ldr	r3, [fp, #-120]
	sub	ip, fp, #84
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	sub	r3, fp, #84
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-124]
	sub	ip, fp, #100
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	sub	ip, fp, #116
	sub	r3, fp, #68
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r3, #64
	str	r3, [fp, #-28]
	b	.L43
.L46:
	sub	r3, fp, #68
	ldr	r0, [fp, #-120]
	mov	r1, r3
	bl	BI_greater_than
	mov	r3, r0
	cmp	r3, #0
	beq	.L44
	sub	r3, fp, #52
	mov	r0, r3
	bl	BI_shift_left
	sub	r3, fp, #68
	mov	r0, r3
	bl	BI_shift_left
	b	.L45
.L44:
	sub	r3, fp, #100
	mov	r0, r3
	bl	BI_shift_left
	sub	r3, fp, #116
	mov	r0, r3
	bl	BI_shift_left
.L45:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L43:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L46
	mov	r3, #64
	str	r3, [fp, #-24]
	b	.L47
.L62:
	ldr	r0, [fp, #-120]
	ldr	r1, [fp, #-124]
	bl	BI_greater_than
	mov	r3, r0
	strb	r3, [fp, #-18]
	ldr	r0, [fp, #-120]
	ldr	r1, [fp, #-124]
	bl	BI_equals
	mov	r3, r0
	strb	r3, [fp, #-17]
	sub	r3, fp, #52
	ldr	r0, [fp, #-120]
	mov	r1, r3
	bl	BI_greater_than
	mov	r3, r0
	strb	r3, [fp, #-16]
	sub	r3, fp, #52
	ldr	r0, [fp, #-120]
	mov	r1, r3
	bl	BI_equals
	mov	r3, r0
	strb	r3, [fp, #-15]
	sub	r3, fp, #52
	mov	r0, r3
	ldr	r1, [fp, #-124]
	bl	BI_greater_than
	mov	r3, r0
	strb	r3, [fp, #-14]
	sub	r3, fp, #52
	mov	r0, r3
	ldr	r1, [fp, #-124]
	bl	BI_equals
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L48
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L49
.L48:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L50
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L51
.L50:
	ldr	r4, [fp, #-120]
	sub	r3, fp, #140
	sub	r2, fp, #52
	mov	r0, r3
	ldr	r1, [fp, #-120]
	bl	BI_sub
	mov	ip, r4
	sub	r3, fp, #140
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	b	.L52
.L51:
	ldr	r4, [fp, #-32]
	sub	r3, fp, #140
	sub	r2, fp, #100
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	BI_sub
	mov	ip, r4
	sub	r3, fp, #140
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
.L52:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L53
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L54
.L53:
	sub	r3, fp, #52
	mov	r0, r3
	bl	BI_shift_right
	b	.L56
.L54:
	sub	r3, fp, #100
	mov	r0, r3
	bl	BI_shift_right
	b	.L56
.L49:
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L57
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L58
.L57:
	ldr	r4, [fp, #-32]
	sub	r3, fp, #140
	sub	r2, fp, #100
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	BI_sub
	mov	ip, r4
	sub	r3, fp, #140
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	b	.L59
.L58:
	ldr	r4, [fp, #-32]
	sub	r3, fp, #140
	sub	r2, fp, #100
	mov	r0, r3
	ldr	r1, [fp, #-32]
	bl	BI_sub
	mov	ip, r4
	sub	r3, fp, #140
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
.L59:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L60
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L61
.L60:
	sub	r3, fp, #100
	mov	r0, r3
	bl	BI_shift_right
	b	.L56
.L61:
	sub	r3, fp, #100
	mov	r0, r3
	bl	BI_shift_right
.L56:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L47:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L62
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
	.size	BI_mod, .-BI_mod
	.align	2
	.global	constant_delay
	.type	constant_delay, %function
constant_delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r1, [fp, #-16]
	mov	r3, r1
	mov	r2, r3, asl #2
	mov	r3, r2, asl #5
	rsb	r3, r2, r3
	add	r3, r3, r1
	mov	r3, r3, asl #3
	str	r3, [fp, #-12]
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-8]
.L65:
	bl	clock
	mov	r2, r0
	ldr	r3, [fp, #-8]
	rsb	r2, r3, r2
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L65
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	constant_delay, .-constant_delay
	.global	__aeabi_idivmod
	.align	2
	.global	random_delay
	.type	random_delay, %function
random_delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	bl	rand
	mov	r1, r0
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, r2
	add	r3, r3, #1
	mov	r0, r1
	mov	r1, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	constant_delay
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	random_delay, .-random_delay
	.align	2
	.global	count_num_bits
	.type	count_num_bits, %function
count_num_bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L70
.L71:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
.L70:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L71
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {r4, fp}
	bx	lr
	.size	count_num_bits, .-count_num_bits
	.section	.rodata
	.align	3
	.type	C.11.1882, %object
	.size	C.11.1882, 16
C.11.1882:
	.space	16
	.align	3
	.type	C.10.1881, %object
	.size	C.10.1881, 16
C.10.1881:
	.space	16
	.text
	.align	2
	.global	MMM
	.type	MMM, %function
MMM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 192
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #196
	str	r0, [fp, #-156]
	str	r1, [fp, #-152]
	str	r2, [fp, #-164]
	str	r3, [fp, #-160]
	ldr	r3, .L87
	sub	ip, fp, #84
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, .L87+4
	sub	ip, fp, #100
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, .L87+8
	ldmia	r3, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	bl	count_num_bits
	mov	r3, r0
	strb	r3, [fp, #-61]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	b	.L74
.L77:
	sub	r3, fp, #84
	mov	r0, r3
	mov	r1, #0
	bl	BI_get_bit
	mov	r3, r0
	str	r3, [fp, #-212]
	ldr	r1, [fp, #-60]
	sub	r0, r1, #32
	ldr	r3, [fp, #-152]
	mov	ip, r3, lsr r0
	rsb	r2, r1, #32
	ldr	r3, [fp, #-152]
	mov	r5, r3, asl r2
	ldr	r2, [fp, #-156]
	cmp	r0, #0
	ldr	r0, [fp, #-152]
	mov	r3, r2, lsr r1
	orr	r3, r5, r3
	movge	r3, ip
	mov	r4, r0, lsr r1
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L75
	ldr	r3, [fp, #-164]
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L75
	mov	r1, #1
	str	r1, [fp, #-208]
	b	.L76
.L75:
	mov	r2, #0
	str	r2, [fp, #-208]
.L76:
	ldr	r3, [fp, #-212]
	ldr	r4, [fp, #-208]
	cmp	r3, r4
	moveq	r3, #0
	movne	r3, #1
	strb	r3, [fp, #-45]
	ldr	r1, [fp, #-60]
	sub	r0, r1, #32
	mov	r3, #1
	mov	ip, r3, asl r0
	rsb	r2, r1, #32
	mov	r3, #1
	mov	lr, r3, lsr r2
	mov	r2, #0
	cmp	r0, #0
	mov	r0, #1
	mov	r4, r2, asl r1
	orr	r4, lr, r4
	movge	r4, ip
	mov	r3, r0, asl r1
	sub	r2, fp, #156
	ldmia	r2, {r1-r2}
	and	r1, r1, r3
	and	r2, r2, r4
	ldr	r0, [fp, #-60]
	sub	ip, r0, #32
	mov	r5, r2, lsr ip
	rsb	r3, r0, #32
	mov	lr, r2, asl r3
	cmp	ip, #0
	mov	r3, r1, lsr r0
	orr	r3, lr, r3
	movge	r3, r5
	mov	r4, r2, lsr r0
	ldr	r2, [fp, #-164]
	mul	r1, r4, r2
	ldr	r2, [fp, #-160]
	mul	r2, r3, r2
	add	r1, r1, r2
	ldr	r2, [fp, #-164]
	umull	r5, r6, r2, r3
	mov	r3, r5
	mov	r4, r6
	add	r1, r1, r4
	mov	r4, r1
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldrb	r1, [fp, #-45]
	mov	r2, #0
	ldr	r3, .L87+8
	ldmia	r3, {r3-r4}
	mul	r0, r3, r2
	mul	ip, r1, r4
	add	r0, r0, ip
	umull	r5, r6, r1, r3
	mov	r3, r5
	mov	r4, r6
	add	r0, r0, r4
	mov	r4, r0
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r3, fp, #132
	mov	r0, r3
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	BI_to_BigInt
	sub	r3, fp, #148
	mov	r0, r3
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	BI_to_BigInt
	sub	r3, fp, #180
	sub	r2, fp, #84
	sub	ip, fp, #132
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	BI_add
	sub	ip, fp, #84
	sub	r3, fp, #180
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	sub	r3, fp, #180
	sub	r2, fp, #84
	sub	ip, fp, #148
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	BI_add
	sub	ip, fp, #84
	sub	r3, fp, #180
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	sub	r3, fp, #84
	mov	r0, r3
	bl	BI_shift_right
	sub	r2, fp, #60
	ldmia	r2, {r1-r2}
	mov	r3, #1
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
.L74:
	ldrb	r1, [fp, #-61]
	mov	r2, #0
	str	r1, [fp, #-204]
	str	r2, [fp, #-200]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-200]
	cmp	r3, r2
	bcc	.L77
	ldr	r3, [fp, #-56]
	ldr	r4, [fp, #-200]
	cmp	r3, r4
	bne	.L86
	ldr	r3, [fp, #-60]
	ldr	r5, [fp, #-204]
	cmp	r3, r5
	bcc	.L77
	ldr	r3, [fp, #-60]
	ldr	r6, [fp, #-204]
	cmp	r3, r6
.L86:
	ldr	r3, .L87+8
	ldmia	r3, {r1-r2}
	sub	r3, fp, #116
	mov	r0, r3
	mov	r3, r2
	mov	r2, r1
	bl	BI_to_BigInt
	sub	r2, fp, #84
	ldmia	r2, {r1-r2}
	mov	r3, r1
	orr	r3, r3, r2
	cmp	r3, #0
	bne	.L79
	sub	r2, fp, #76
	ldmia	r2, {r1-r2}
	str	r1, [fp, #-196]
	str	r2, [fp, #-192]
	ldr	r3, .L87+8
	ldmia	r3, {r4-r5}
	str	r4, [fp, #-188]
	str	r5, [fp, #-184]
	ldr	r5, [fp, #-184]
	ldr	r6, [fp, #-192]
	cmp	r5, r6
	bhi	.L80
	ldr	r1, [fp, #-184]
	ldr	r2, [fp, #-192]
	cmp	r1, r2
	bne	.L79
	ldr	r3, [fp, #-188]
	ldr	r4, [fp, #-196]
	cmp	r3, r4
	bhi	.L80
	ldr	r5, [fp, #-188]
	ldr	r6, [fp, #-196]
	cmp	r5, r6
.L79:
	sub	r3, fp, #180
	sub	r2, fp, #84
	sub	ip, fp, #116
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	BI_sub
	sub	ip, fp, #84
	sub	r3, fp, #180
	ldmia	r3, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	b	.L82
.L80:
	sub	r3, fp, #100
	sub	r2, fp, #84
	sub	ip, fp, #116
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	BI_sub
.L82:
	ldrb	r3, [fp, #-61]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	b	.L83
.L84:
	sub	r3, fp, #84
	mov	r0, r3
	bl	BI_shift_left
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L83:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L84
	sub	r3, fp, #180
	sub	r2, fp, #84
	sub	ip, fp, #116
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	BI_mod
	sub	r4, fp, #76
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L88:
	.align	2
.L87:
	.word	C.10.1881
	.word	C.11.1882
	.word	N
	.size	MMM, .-MMM
	.global	__aeabi_uldivmod
	.align	2
	.global	RTL_MME
	.type	RTL_MME, %function
RTL_MME:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #48
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	mov	r3, #1
	mov	r4, #0
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	mov	r3, #1
	mov	r4, #0
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	mov	r0, #0
	mov	r1, #1000
	bl	random_delay
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L90
.L93:
	ldr	r3, [fp, #-16]
	sub	r1, r3, #32
	ldr	r3, [fp, #-56]
	mov	r5, r3, lsr r1
	ldr	r3, [fp, #-16]
	rsb	r2, r3, #32
	ldr	r3, [fp, #-56]
	mov	r0, r3, asl r2
	ldr	ip, [fp, #-60]
	ldr	r2, [fp, #-16]
	cmp	r1, #0
	ldr	lr, [fp, #-56]
	ldr	r1, [fp, #-16]
	mov	r3, ip, lsr r2
	orr	r3, r0, r3
	movge	r3, r5
	mov	r4, lr, lsr r1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L91
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	MMM
	mov	r2, r1
	mov	r1, r0
	ldr	r3, .L95
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	b	.L92
.L91:
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	MMM
	mov	r2, r1
	mov	r1, r0
	ldr	r3, .L95
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
.L92:
	mov	r0, #0
	mov	r1, #250
	bl	random_delay
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	bl	MMM
	mov	r2, r1
	mov	r1, r0
	ldr	r3, .L95
	ldmia	r3, {r3-r4}
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	mov	r3, r4
	bl	__aeabi_uldivmod
	mov	r4, r3
	mov	r3, r2
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L90:
	ldr	r3, [fp, #-16]
	cmp	r3, #63
	ble	.L93
	mov	r0, #0
	mov	r1, #1000
	bl	random_delay
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	N
	.size	RTL_MME, .-RTL_MME
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\012----------------------- TESTING ENCRYPTION ----"
	.ascii	"-------------------\000"
	.align	2
.LC1:
	.ascii	"N: %llu\011 E: %llu\011 D: %llu\011 msg: %llu\012\000"
	.align	2
.LC2:
	.ascii	"\011\011Encrypted Message: %llu\012\000"
	.align	2
.LC3:
	.ascii	"\011\011Elapsed time: %i ms\012\000"
	.align	2
.LC4:
	.ascii	"\011\011Decrypted Message: %llu\012\000"
	.align	2
.LC5:
	.ascii	"---------------------------------------------------"
	.ascii	"---------------\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #68
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	ldr	r2, .L99+16
	adr	r4, .L99
	ldmia	r4, {r3-r4}
	stmia	r2, {r3-r4}
	ldr	r2, .L99+20
	adr	r4, .L99+8
	ldmia	r4, {r3-r4}
	stmia	r2, {r3-r4}
	ldr	r3, .L99+16
	ldmia	r3, {r3-r4}
	movs	r4, r4, lsr #1
	mov	r3, r3, rrx
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	ldr	r0, .L99+24
	bl	puts
	ldr	r3, .L99+16
	ldmia	r3, {r5-r6}
	ldr	r3, .L99+28
	ldmia	r3, {r1-r2}
	ldr	r3, .L99+20
	ldmia	r3, {r3-r4}
	stmia	sp, {r1-r2}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r4, fp, #60
	ldmia	r4, {r3-r4}
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	ldr	r0, .L99+32
	mov	r2, r5
	mov	r3, r6
	bl	printf
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r3, .L99+28
	ldmia	r3, {r3-r4}
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	mov	r2, r3
	mov	r3, r4
	bl	RTL_MME
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r0, .L99+36
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	rsb	r1, r3, r2
	ldr	r3, .L99+40
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #6
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	ldr	r0, .L99+44
	mov	r1, r3
	bl	printf
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r3, .L99+20
	ldmia	r3, {r3-r4}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, r3
	mov	r3, r4
	bl	RTL_MME
	mov	r3, r0
	mov	r4, r1
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	bl	clock
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r0, .L99+48
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	printf
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-44]
	rsb	r1, r3, r2
	ldr	r3, .L99+40
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #6
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	ldr	r0, .L99+44
	mov	r1, r3
	bl	printf
	ldr	r0, .L99+52
	bl	puts
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp!, {r4, r5, r6, fp, lr}
	bx	lr
.L100:
	.align	3
.L99:
	.word	1612330605
	.word	-1116838592
	.word	71150473
	.word	248190529
	.word	N
	.word	D
	.word	.LC0
	.word	E
	.word	.LC1
	.word	.LC2
	.word	274877907
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.comm	N,8,8
	.comm	D,8,8
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

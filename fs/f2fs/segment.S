__find_rev_next_zero_bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, r1
	bcs	.L30
	lsr	r3, r2, #5
	bic	ip, r2, #31
	.save {r4, lr}
	str	r4, [sp, #-8]!
	sub	ip, r1, ip
	str	lr, [sp, #4]
	add	r0, r0, r3, lsl #2
	and	r2, r2, #31
	mvn	r4, #0
	sub	r0, r0, #4
.L14:
	ldr	r3, [r0, #4]!
	cmn	r3, #1
	rev	r3, r3
	beq	.L3
	cmp	r2, #0
	rsb	lr, r2, #32
	orrne	r3, r3, r4, lsl lr
	cmp	ip, #31
	bhi	.L5
	mvn	r2, #0
	orr	r3, r3, r2, lsr ip
	cmp	r3, r2
	beq	.L2
.L6:
	mov	r0, #0
	mvn	r2, r3
	movt	r0, 65535
	sub	ip, r1, ip
	bics	r3, r0, r3
	moveq	r1, #24
	moveq	r3, #16
	bne	.L34
.L7:
	tst	r2, #65280
	lsrne	r2, r2, #8
	movne	r1, r3
	tst	r2, #240
	lsrne	r2, r2, #4
	addeq	r1, r1, #4
	tst	r2, #12
	lsrne	r2, r2, #2
	addeq	r1, r1, #2
	tst	r2, #2
	addeq	r1, r1, #1
	add	r1, r1, ip
.L2:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, r1
	ldr	pc, [sp], #4
.L5:
	cmn	r3, #1
	bne	.L6
.L3:
	cmp	ip, #32
	mov	r2, #0
	sub	ip, ip, #32
	bhi	.L14
	b	.L2
.L30:
	mov	r0, r1
	bx	lr
.L34:
	lsr	r2, r2, #16
	mov	r1, #8
	mov	r3, #0
	b	.L7
	.fnend
	.size	__find_rev_next_zero_bit, .-__find_rev_next_zero_bit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	add_discard_addrs, %function
add_discard_addrs:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	mov	fp, r1
	str	lr, [sp, #32]
	ldr	r1, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r3, [fp, #8]
	ldr	r6, [r0, #500]
	str	r2, [sp, #12]
	ldr	r0, [r1]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #3
	ldr	r2, [r0, #60]
	ldrh	ip, [r2, r3]
	add	r3, r2, r3
	cmp	r6, ip, lsr #6
	beq	.L39
	ldr	r2, [r8]
	ldr	lr, [r2, #208]
	ldr	lr, [lr, #88]
	ldr	lr, [lr, #492]
	ldr	lr, [lr, #556]
	tst	lr, #16384
	beq	.L94
.L38:
	ldr	r10, [fp]
	ldr	r1, [r1, #80]
	ldr	lr, [r3, #4]
	ldrd	r2, [r3, #8]
	ands	r10, r10, #16
	ldr	r7, [r0, #24]
	str	r1, [sp, #16]
	beq	.L66
	add	r1, r3, #8
	add	lr, r7, #8
	add	r0, r2, #8
	cmp	r3, lr
	cmpcc	r7, r1
	orr	ip, r3, r2
	movcs	r1, #1
	movcc	r1, #0
	orr	ip, r7, ip
	cmp	r2, lr
	cmpcc	r7, r0
	movcs	r0, #1
	movcc	r0, #0
	tst	ip, #7
	andeq	r1, r1, r0
	movne	r1, #0
	cmp	r1, #0
	beq	.L42
	ldm	r3, {r0, ip}
	ldr	lr, [r2]
	ldr	r1, [r2, #4]
	orr	r0, r0, lr
	orr	r1, r1, ip
	mvn	r0, r0
	mvn	r1, r1
	strd	r0, [r7]
	ldrd	r0, [r2, #8]
	ldr	lr, [r3, #8]
	ldr	ip, [r3, #12]
	orr	r0, r0, lr
	orr	r1, r1, ip
	mvn	r0, r0
	mvn	r1, r1
	strd	r0, [r7, #8]
	ldrd	r0, [r2, #16]
	ldr	lr, [r3, #16]
	ldr	ip, [r3, #20]
	orr	r0, r0, lr
	orr	r1, r1, ip
	mvn	r0, r0
	mvn	r1, r1
	strd	r0, [r7, #16]
	ldrd	r0, [r2, #24]
	ldr	lr, [r3, #24]
	ldr	ip, [r3, #28]
	orr	r0, r0, lr
	orr	r1, r1, ip
	mvn	r0, r0
	mvn	r1, r1
	strd	r0, [r7, #24]
	ldrd	r0, [r2, #32]
	ldr	lr, [r3, #32]
	ldr	ip, [r3, #36]
	orr	r0, r0, lr
	orr	r1, r1, ip
	mvn	r0, r0
	mvn	r1, r1
	strd	r0, [r7, #32]
	ldrd	r0, [r2, #40]
	ldr	lr, [r3, #40]
	ldr	ip, [r3, #44]
	orr	r0, r0, lr
	orr	r1, r1, ip
	mvn	r0, r0
	mvn	r1, r1
	strd	r0, [r7, #40]
	ldr	lr, [r2, #48]
	ldr	r0, [r3, #48]
	ldr	r1, [r2, #52]
	ldr	ip, [r3, #52]
	orr	r0, r0, lr
	mvn	r0, r0
	orr	r1, r1, ip
	mvn	r1, r1
	strd	r0, [r7, #48]
	ldr	r1, [r2, #56]
	ldr	r0, [r3, #56]
	ldr	r2, [r2, #60]
	ldr	r3, [r3, #60]
	orr	r1, r1, r0
	mvn	r1, r1
	orr	r3, r2, r3
	mvn	r3, r3
	str	r1, [r7, #56]
	str	r3, [r7, #60]
.L43:
	mov	r3, #0
	mov	r9, #0
	subs	r2, r10, r3
	movt	r3, 65535
	movne	r2, #1
	mvn	r4, #0
	strd	r8, [sp]
	str	r3, [sp, #20]
	ldr	r3, [sp, #16]
	str	r2, [sp, #8]
	add	r3, r3, #4
	str	r3, [sp, #28]
.L45:
	cmp	r10, #0
	bne	.L65
	ldr	r3, [sp]
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #80]
	add	r3, r3, #4096
	ldrd	r2, [r3, #52]
	cmp	r2, r3
	bhi	.L39
.L65:
	add	r4, r4, #1
	cmp	r6, r4
	bls	.L39
	lsr	r2, r4, #5
	bic	r5, r4, #31
	ldrd	r8, [sp]
	and	r4, r4, #31
	add	r2, r7, r2, lsl #2
	sub	r5, r6, r5
	mvn	r1, #0
	sub	r2, r2, #4
	mov	r3, r4
	b	.L57
.L46:
	cmp	r5, #32
	mov	r3, #0
	sub	r5, r5, #32
	bls	.L39
.L57:
	ldr	r0, [r2, #4]!
	cmp	r0, #0
	rev	r0, r0
	and	r3, r0, r1, lsr r3
	beq	.L46
	cmp	r5, #31
	bhi	.L47
	rsb	r2, r5, #32
	strd	r8, [sp]
	ands	r3, r3, r1, lsl r2
	beq	.L39
.L48:
	ldr	r2, [sp, #20]
	sub	r5, r6, r5
	tst	r3, r2
	moveq	r2, #24
	moveq	r1, #16
	beq	.L49
	lsr	r3, r3, #16
	mov	r2, #8
	mov	r1, #0
.L49:
	tst	r3, #65280
	lsrne	r3, r3, #8
	movne	r2, r1
	tst	r3, #240
	lsrne	r3, r3, #4
	addeq	r2, r2, #4
	tst	r3, #12
	lsrne	r3, r3, #2
	addeq	r2, r2, #2
	tst	r3, #2
	addeq	r2, r2, #1
	add	r5, r2, r5
	cmp	r6, r5
	bls	.L39
	add	r2, r5, #1
	mov	r1, r6
	mov	r0, r7
	bl	__find_rev_next_zero_bit
	ldr	r3, [sp, #8]
	cmp	r5, #0
	mov	r4, r0
	moveq	r3, #0
	cmp	r6, r0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L58
	sub	r2, r0, r5
	ldrd	r0, [fp, #24]
	mov	r3, #0
	cmp	r3, r1
	cmpeq	r2, r0
	bcc	.L45
.L58:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L69
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L95
.L60:
	cmp	r4, r5
	mov	r3, r5
	bls	.L64
	ldrd	r8, [sp]
	mov	ip, #1
	add	r0, r9, #12
.L63:
	cmp	r3, #0
	add	r2, r3, #31
	movge	r2, r3
	rsbs	r1, r3, #0
	asr	r2, r2, #5
	and	r1, r1, #31
	and	lr, r3, #31
	rsbpl	lr, r1, #0
	ldr	r1, [r0, r2, lsl #2]
	add	r3, r3, #1
	cmp	r4, r3
	orr	r1, r1, ip, lsl lr
	str	r1, [r0, r2, lsl #2]
	bhi	.L63
	strd	r8, [sp]
.L64:
	ldr	r3, [sp]
	ldr	r3, [r3, #28]
	ldr	r2, [r3, #80]
	add	r2, r2, #4096
	ldr	r3, [r2, #52]
	sub	r5, r3, r5
	add	r5, r5, r4
	str	r5, [r2, #52]
	b	.L45
.L94:
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L38
.L39:
	mov	r0, #0
.L90:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L66:
	ldr	r3, [r8, #672]
	tst	r3, #4
	beq	.L39
	bic	ip, ip, #63
	cmp	ip, #0
	beq	.L39
	add	r3, r1, #4096
	ldr	r1, [r3, #52]
	ldr	r3, [r3, #56]
	cmp	r1, r3
	bcs	.L39
	add	r3, r2, #8
	add	ip, r7, #8
	add	r1, lr, #8
	cmp	r2, ip
	cmpcc	r7, r3
	orr	r0, r2, lr
	movcs	r3, #1
	movcc	r3, #0
	orr	r0, r7, r0
	cmp	lr, ip
	cmpcc	r7, r1
	movcs	r1, #1
	movcc	r1, #0
	tst	r0, #7
	andeq	r3, r3, r1
	movne	r3, #0
	cmp	r3, #0
	beq	.L40
	ldm	r2, {r1, r3}
	ldr	ip, [lr]
	ldr	r0, [lr, #4]
	bic	r1, r1, ip
	bic	r3, r3, r0
	stm	r7, {r1, r3}
	ldr	r1, [r2, #8]
	ldr	ip, [lr, #8]
	ldr	r3, [r2, #12]
	ldr	r0, [lr, #12]
	bic	r1, r1, ip
	bic	r3, r3, r0
	str	r1, [r7, #8]
	str	r3, [r7, #12]
	ldr	r1, [r2, #16]
	ldr	ip, [lr, #16]
	ldr	r3, [r2, #20]
	ldr	r0, [lr, #20]
	bic	r1, r1, ip
	bic	r3, r3, r0
	str	r1, [r7, #16]
	str	r3, [r7, #20]
	ldr	r1, [r2, #24]
	ldr	ip, [lr, #24]
	ldr	r3, [r2, #28]
	ldr	r0, [lr, #28]
	bic	r1, r1, ip
	bic	r3, r3, r0
	str	r1, [r7, #24]
	str	r3, [r7, #28]
	ldr	r1, [r2, #32]
	ldr	ip, [lr, #32]
	ldr	r3, [r2, #36]
	ldr	r0, [lr, #36]
	bic	r1, r1, ip
	bic	r3, r3, r0
	str	r1, [r7, #32]
	str	r3, [r7, #36]
	ldr	r1, [r2, #40]
	ldr	r3, [r2, #44]
	ldr	ip, [lr, #40]
	ldr	r0, [lr, #44]
	bic	r1, r1, ip
	bic	r3, r3, r0
	str	r1, [r7, #40]
	str	r3, [r7, #44]
	ldr	r1, [r2, #48]
	ldr	ip, [lr, #48]
	ldr	r3, [r2, #52]
	ldr	r0, [lr, #52]
	bic	r1, r1, ip
	bic	r3, r3, r0
	str	r1, [r7, #48]
	str	r3, [r7, #52]
	ldr	r1, [r2, #56]
	ldr	ip, [lr, #56]
	ldr	r3, [r2, #60]
	ldr	r0, [lr, #60]
	bic	r2, r1, ip
	bic	r3, r3, r0
	strd	r2, [r7, #56]
	b	.L43
.L47:
	cmp	r3, #0
	beq	.L46
	strd	r8, [sp]
	b	.L48
.L95:
	movw	r3, #:lower16:.LANCHOR0
	movw	r1, #32848
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3]
	mov	r0, r3
	str	r3, [sp, #24]
	bl	kmem_cache_alloc
	subs	r3, r0, #0
	str	r3, [sp, #4]
	ldr	r3, [sp, #24]
	beq	.L96
.L61:
	ldr	ip, [sp]
	ldrd	r8, [fp, #8]
	ldr	r0, [sp, #4]
	ldr	r2, [sp, #28]
	ldr	r3, [ip, #28]
	ldr	ip, [ip, #496]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	adds	r8, r8, r1
	add	r3, r3, r8, lsl ip
	str	r3, [r0, #8]
	ldr	r3, [sp, #16]
	ldr	r1, [r3, #8]
	bl	__list_add
	b	.L60
.L69:
	mov	r0, r3
	b	.L90
.L96:
	mov	r0, r3
	movw	r1, #34896
	bl	kmem_cache_alloc
	str	r0, [sp, #4]
	b	.L61
.L42:
	ldr	r0, [r3]
	ldr	r1, [r2]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7]
	ldr	r0, [r3, #4]
	ldr	r1, [r2, #4]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #4]
	ldr	r0, [r3, #8]
	ldr	r1, [r2, #8]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #8]
	ldr	r0, [r3, #12]
	ldr	r1, [r2, #12]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #12]
	ldr	r0, [r3, #16]
	ldr	r1, [r2, #16]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #16]
	ldr	r0, [r3, #20]
	ldr	r1, [r2, #20]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #20]
	ldr	r0, [r3, #24]
	ldr	r1, [r2, #24]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #24]
	ldr	r0, [r3, #28]
	ldr	r1, [r2, #28]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #28]
	ldr	r0, [r3, #32]
	ldr	r1, [r2, #32]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #32]
	ldr	r0, [r3, #36]
	ldr	r1, [r2, #36]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #36]
	ldr	r0, [r3, #40]
	ldr	r1, [r2, #40]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #40]
	ldr	r0, [r3, #44]
	ldr	r1, [r2, #44]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #44]
	ldr	r0, [r3, #48]
	ldr	r1, [r2, #48]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #48]
	ldr	r0, [r3, #52]
	ldr	r1, [r2, #52]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #52]
	ldr	r1, [r2, #56]
	ldr	r0, [r3, #56]
	orr	r1, r1, r0
	mvn	r1, r1
	str	r1, [r7, #56]
	ldr	r2, [r2, #60]
	ldr	r3, [r3, #60]
	orr	r3, r3, r2
	mvn	r3, r3
	str	r3, [r7, #60]
	b	.L43
.L40:
	ldr	r1, [lr]
	ldr	r3, [r2]
	bic	r3, r3, r1
	str	r3, [r7]
	ldr	r1, [lr, #4]
	ldr	r3, [r2, #4]
	bic	r3, r3, r1
	str	r3, [r7, #4]
	ldr	r1, [lr, #8]
	ldr	r3, [r2, #8]
	bic	r3, r3, r1
	str	r3, [r7, #8]
	ldr	r1, [lr, #12]
	ldr	r3, [r2, #12]
	bic	r3, r3, r1
	str	r3, [r7, #12]
	ldr	r1, [lr, #16]
	ldr	r3, [r2, #16]
	bic	r3, r3, r1
	str	r3, [r7, #16]
	ldr	r1, [lr, #20]
	ldr	r3, [r2, #20]
	bic	r3, r3, r1
	str	r3, [r7, #20]
	ldr	r1, [lr, #24]
	ldr	r3, [r2, #24]
	bic	r3, r3, r1
	str	r3, [r7, #24]
	ldr	r1, [lr, #28]
	ldr	r3, [r2, #28]
	bic	r3, r3, r1
	str	r3, [r7, #28]
	ldr	r1, [lr, #32]
	ldr	r3, [r2, #32]
	bic	r3, r3, r1
	str	r3, [r7, #32]
	ldr	r1, [lr, #36]
	ldr	r3, [r2, #36]
	bic	r3, r3, r1
	str	r3, [r7, #36]
	ldr	r1, [lr, #40]
	ldr	r3, [r2, #40]
	bic	r3, r3, r1
	str	r3, [r7, #40]
	ldr	r1, [lr, #44]
	ldr	r3, [r2, #44]
	bic	r3, r3, r1
	str	r3, [r7, #44]
	ldr	r1, [lr, #48]
	ldr	r3, [r2, #48]
	bic	r3, r3, r1
	str	r3, [r7, #48]
	ldr	r1, [lr, #52]
	ldr	r3, [r2, #52]
	bic	r3, r3, r1
	str	r3, [r7, #52]
	ldr	r1, [lr, #56]
	ldr	r3, [r2, #56]
	bic	r3, r3, r1
	str	r3, [r7, #56]
	ldr	r3, [r2, #60]
	ldr	r1, [lr, #60]
	bic	r3, r3, r1
	str	r3, [r7, #60]
	b	.L43
	.fnend
	.size	add_discard_addrs, .-add_discard_addrs
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	reset_curseg, %function
reset_curseg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	ip, #0
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r7, r2
	str	r8, [sp, #16]
	mov	r1, #5
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	mvn	r0, #0
	ldr	r4, [r3, #12]
	add	r4, r4, r6, lsl #6
	ldr	r8, [r4, #20]
	ldr	r3, [r4, #60]
	str	r3, [r4, #48]
	ldr	r2, [r5, #504]
	udiv	r3, r3, r2
	ldr	r2, [r5, #508]
	strh	ip, [r4, #52]	@ movhi
	str	r0, [r4, #60]
	add	r0, r8, #4080
	add	r0, r0, #11
	udiv	r3, r3, r2
	str	r3, [r4, #56]
	bl	__memzero
	cmp	r6, #2
	movle	r3, #0
	movgt	r3, #1
	cmp	r7, #0
	strb	r3, [r8, #4091]
	ldr	r2, [r5, #28]
	ldr	r3, [r4, #48]
	ldr	r2, [r2]
	add	r1, r3, r3, lsl #1
	ldr	r2, [r2, #60]
	ldrb	r0, [r2, r1, lsl #3]	@ zero_extendqisi2
	bfi	r0, r6, #0, #6
	strb	r0, [r2, r1, lsl #3]
	beq	.L97
	ldr	r0, [r5, #28]
	rsbs	r2, r3, #0
	and	r1, r3, #31
	and	r2, r2, #31
	add	ip, r3, #31
	rsbpl	r1, r2, #0
	cmp	r3, #0
	movlt	r3, ip
	mov	r2, #1
	ldr	ip, [r0]
	lsl	r2, r2, r1
	asr	r3, r3, #5
	ldr	r1, [ip, #28]
	ldr	r0, [r1, r3, lsl #2]
	tst	r2, r0
	orr	r2, r2, r0
	str	r2, [r1, r3, lsl #2]
	beq	.L102
.L97:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L102:
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	b	.L97
	.fnend
	.size	reset_curseg, .-reset_curseg
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/home/jprim/hlte/lolz/fs/f2fs/segment.c\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__locate_dirty_segment, %function
__locate_dirty_segment:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r1, [r0, #28]
	ldr	r3, [r1, #12]
	ldr	ip, [r3, #48]
	cmp	ip, r4
	beq	.L103
	mov	r5, r2
	ldr	r2, [r3, #112]
	cmp	r2, r4
	beq	.L103
	ldr	r2, [r3, #176]
	cmp	r2, r4
	beq	.L103
	ldr	r2, [r3, #240]
	cmp	r2, r4
	beq	.L103
	ldr	r2, [r3, #304]
	cmp	r2, r4
	beq	.L103
	ldr	r3, [r3, #368]
	cmp	r3, r4
	beq	.L103
	ldr	r7, [r1, #8]
	mov	r6, r0
	mov	r0, r4
	add	r8, r7, r5, lsl #2
	ldr	r1, [r8, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L107
	ldr	r3, [r8, #56]
	add	r3, r3, #1
	str	r3, [r8, #56]
.L107:
	cmp	r5, #6
	beq	.L110
.L103:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L110:
	ldr	r2, [r6, #28]
	add	r3, r4, r4, lsl #1
	ldr	r2, [r2]
	ldr	r2, [r2, #60]
	ldrb	r3, [r2, r3, lsl #3]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r3, #5
	bhi	.L111
	add	r7, r7, r3, lsl #2
	mov	r0, r4
	ldr	r1, [r7, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L103
	ldr	r3, [r7, #56]
	add	r3, r3, #1
	str	r3, [r7, #56]
	b	.L103
.L111:
	movw	r0, #:lower16:.LC0
	movw	r1, #677
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	_set_bit
	.fnend
	.size	__locate_dirty_segment, .-__locate_dirty_segment
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	add_sit_entry, %function
add_sit_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #4767
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	movt	r3, 10724
	strd	r6, [sp, #8]
	mov	r6, #55
	str	r8, [sp, #16]
	umull	r2, r3, r3, r0
	str	lr, [sp, #20]
	ldr	r4, [r1]
	sub	r0, r0, r3
	cmp	r4, r1
	add	r3, r3, r0, lsr #1
	lsr	r3, r3, #5
	mul	r6, r6, r3
	beq	.L113
	mov	r7, r4
	b	.L118
.L114:
	cmp	r4, r5
	mov	r7, r4
	beq	.L113
.L118:
	ldr	r3, [r4, #8]
	mov	r2, r4
	ldr	r4, [r4]
	cmp	r3, r6
	bne	.L114
	ldr	r1, [r2, #12]
	cmp	r5, r4
	add	r1, r1, #1
	str	r1, [r2, #12]
	beq	.L112
	cmp	r4, r5
	bne	.L117
	b	.L116
.L125:
	ldr	r4, [r4]
	cmp	r5, r4
	beq	.L116
.L117:
	ldr	r3, [r4, #12]
	cmp	r1, r3
	bhi	.L125
.L116:
	mov	r0, r7
	bl	__list_del_entry
	mov	r2, r4
	mov	r0, r7
	ldr	r1, [r4, #4]
	b	.L124
.L113:
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #80
	movt	r3, #:upper16:.LANCHOR0
	ldr	r4, [r3, #4]
	mov	r0, r4
	bl	kmem_cache_alloc
	cmp	r0, #0
	beq	.L126
.L119:
	mov	r3, #1
	str	r0, [r0]
	mov	r1, r5
	stmib	r0, {r0, r6}
	str	r3, [r0, #12]
	ldr	r2, [r5]
.L124:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	__list_add
.L126:
	mov	r0, r4
	mov	r1, #2128
	bl	kmem_cache_alloc
	b	.L119
.L112:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	add_sit_entry, .-add_sit_entry
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__submit_flush_wait, %function
__submit_flush_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r1
	mov	r1, #0
	strd	r6, [sp, #8]
	mov	r6, r0
	mov	r0, #16
	strd	r8, [sp, #16]
	str	lr, [sp, #24]
	.pad #12
	sub	sp, sp, #12
	bl	bio_alloc
	subs	r4, r0, #0
	beq	.L142
.L128:
	mov	r3, #1
	mov	r1, r4
	str	r5, [r4, #12]
	movw	r0, #2577
	str	r3, [r4, #20]
	bl	submit_bio_wait
	mov	r3, r0
	mov	r0, r4
	mov	r4, r3
	bl	bio_put
	movw	r2, #:lower16:__tracepoint_f2fs_issue_flush
	movt	r2, #:upper16:__tracepoint_f2fs_issue_flush
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L143
.L127:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L142:
	mov	r1, r4
	mov	r0, #2064
	bl	bio_alloc
	mov	r4, r0
	b	.L128
.L143:
	mov	r3, sp
	ldr	r8, [r6, #672]
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #4]
	add	r1, r1, #1
	str	r1, [r3, #4]
	ldr	r6, [r2, #16]
	cmp	r6, #0
	beq	.L131
	and	r9, r8, #2048
	and	r8, r8, #1024
.L132:
	mov	r1, r5
	mov	r3, r8
	ldr	r0, [r6, #4]
	mov	r2, r9
	str	r4, [sp]
	ldr	r7, [r6]
	blx	r7
	ldr	r1, [r6, #8]!
	cmp	r1, #0
	bne	.L132
.L131:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L127
	bl	preempt_schedule
	b	.L127
	.fnend
	.size	__submit_flush_wait, .-__submit_flush_wait
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Issue discard(%u, %u, %u) failed, ret: %d\000"
	.align	2
.LC2:
	.ascii	"<6>\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__remove_discard_cmd, %function
__remove_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	str	r6, [sp, #8]
	mov	r6, r0
	str	lr, [sp, #12]
	ldrh	r2, [r1, #52]
	.pad #16
	sub	sp, sp, #16
	ldr	r3, [r0, #28]
	cmp	r2, #0
	ldr	r4, [r3, #80]
	bne	.L156
.L145:
	ldr	r3, [r5, #56]
	cmn	r3, #95
	moveq	r3, #0
	streq	r3, [r5, #56]
	beq	.L147
	cmp	r3, #0
	bne	.L157
.L147:
	ldrb	r3, [r5, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L148
	add	r3, r4, #4160
	add	r3, r3, #4
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L148:
	add	r0, r5, #24
	bl	list_del
	add	r1, r4, #4160
	mov	r0, r5
	add	r1, r1, #12
	bl	rb_erase
	add	ip, r4, #4096
	ldr	lr, [r5, #16]
	movw	r2, #:lower16:.LANCHOR0
	ldr	r3, [ip, #60]
	movt	r2, #:upper16:.LANCHOR0
	mov	r1, r5
	ldr	r0, [r2, #8]
	sub	r3, r3, lr
	str	r3, [ip, #60]
	bl	kmem_cache_free
	add	r3, r4, #4160
	add	r3, r3, #8
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L157:
	ldr	lr, [r5, #16]
	movw	r2, #:lower16:.LC1
	movw	r1, #:lower16:.LC2
	ldr	ip, [r5, #20]
	movt	r2, #:upper16:.LC1
	movt	r1, #:upper16:.LC2
	str	r3, [sp, #8]
	ldr	r0, [r6]
	str	lr, [sp, #4]
	ldr	r3, [r5, #12]
	str	ip, [sp]
	bl	f2fs_msg
	b	.L147
.L156:
	movw	r0, #:lower16:.LC0
	movw	r1, #801
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L145
	.fnend
	.size	__remove_discard_cmd, .-__remove_discard_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_submit_discard_endio, %function
f2fs_submit_discard_endio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r2, #2
	mov	r4, r0
	str	lr, [sp, #4]
	ldr	r3, [r0, #60]
	add	r0, r3, #32
	strb	r2, [r3, #54]
	str	r1, [r3, #56]
	bl	complete_all
	mov	r0, r4
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	b	bio_put
	.fnend
	.size	f2fs_submit_discard_endio, .-f2fs_submit_discard_endio
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_sit_entry, %function
update_sit_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	sub	r3, r1, #1
	strd	r6, [sp, #8]
	cmn	r3, #3
	mov	r7, r2
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r0, [r0, #28]
	.pad #20
	sub	sp, sp, #20
	ldr	r6, [r0, #16]
	sub	r1, r1, r6
	bhi	.L178
	ldr	r2, [r0, #4]
	mov	fp, #1
	ldr	r3, [r4, #496]
	ldr	r9, [r2]
	rsb	r9, r9, r1, lsr r3
	rsbs	r3, r9, #0
	and	r2, r9, #31
	and	r3, r3, #31
	add	r10, r9, #31
	rsbpl	r2, r3, #0
	cmp	r9, #0
	movge	r10, r9
	add	r5, r9, r9, lsl fp
	asr	r10, r10, #5
	lsl	fp, fp, r2
	lsl	r10, r10, #2
	lsl	r3, r5, #3
.L161:
	ldr	r0, [r0]
	ldr	r2, [r4, #500]
	ldr	r5, [r0, #60]
	sub	r6, r2, #1
	and	r6, r6, r1
	ldrh	r8, [r5, r3]
	add	r5, r5, r3
	add	r8, r7, r8, lsr #6
	lsrs	r3, r8, #16
	bne	.L162
	cmp	r2, r8
	bcc	.L162
.L163:
	ldrh	r3, [r5]
	bfi	r3, r8, #6, #10
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4, #28]
	ldr	r8, [r3]
	ldr	r3, [r8, #72]
	ldr	r1, [r8, #76]
	str	r1, [sp, #8]
	str	r3, [sp, #12]
	bl	get_seconds
	ldr	ip, [r8, #80]
	mov	r2, r0
	mvn	r0, r6
	ldr	r3, [sp, #12]
	and	r0, r0, #7
	ldr	r1, [sp, #8]
	ldr	lr, [r8, #84]
	mov	r8, #1
	lsl	r8, r8, r0
	subs	r3, r3, ip
	str	r3, [sp]
	sbc	r3, r1, lr
	str	r3, [sp, #4]
	sxtb	r3, r8
	ldrd	r0, [sp]
	adds	r0, r0, r2
	adc	r1, r1, r2, asr #31
	cmp	r7, #1
	strd	r0, [r5, #16]
	ldr	r2, [r4, #28]
	ldr	r2, [r2]
	strd	r0, [r2, #96]
	bne	.L164
	ldr	r1, [r5, #4]
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r8
	orr	r2, r3, r2
	strb	r2, [r1, r6, lsr #3]
	bne	.L184
.L165:
	ldr	r2, [r4]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L185
.L166:
	ldr	r1, [r5, #12]
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r8
	orr	r2, r3, r2
	strb	r2, [r1, r6, lsr #3]
	beq	.L175
.L167:
	ldr	r0, [r5, #8]
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, #63
	cmp	r2, #4
	and	r2, r1, r8
	beq	.L186
.L168:
	cmp	r2, #0
	bne	.L172
	ldrh	r3, [r5, #2]
	ubfx	r2, r3, #0, #10
	add	r2, r7, r2
	bfi	r3, r2, #0, #10
	strh	r3, [r5, #2]	@ movhi
.L172:
	ldr	r3, [r4, #28]
	ldr	r1, [r3]
	ldr	r2, [r1, #28]
	ldr	r3, [r2, r10]
	tst	r3, fp
	orr	fp, r3, fp
	str	fp, [r2, r10]
	bne	.L173
	ldr	r3, [r1, #32]
	add	r3, r3, #1
	str	r3, [r1, #32]
.L173:
	ldr	r3, [r4, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, r7
	str	r3, [r2, #12]
	ldr	r3, [r4, #504]
	cmp	r3, #1
	bls	.L160
	ldr	r2, [r4, #28]
	udiv	r9, r9, r3
	ldr	r3, [r2]
	ldr	r3, [r3, #64]
	ldr	r2, [r3, r9, lsl #2]
	add	r7, r2, r7
	str	r7, [r3, r9, lsl #2]
.L160:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L178:
	mov	r10, #0
	mvn	r3, #23
	mov	fp, r10
	mvn	r9, #0
	b	.L161
.L185:
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L166
	b	.L167
.L164:
	ldr	r0, [r5, #4]
	mvn	r2, r3
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	bic	r3, r1, r3
	tst	r1, r8
	strb	r3, [r0, r6, lsr #3]
	beq	.L187
.L170:
	ldr	r3, [r4]
	ldr	r1, [r3, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	bne	.L171
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L183
.L171:
	ldr	r3, [r5, #12]
	ldrb	r1, [r3, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r1
	tst	r1, r8
	strb	r2, [r3, r6, lsr #3]
	beq	.L183
	ldr	r3, [r4, #552]
	add	r3, r3, #1
	str	r3, [r4, #552]
.L183:
	ldr	r3, [r5, #8]
	ldrb	r2, [r3, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r8
	b	.L168
.L186:
	orr	r3, r3, r1
	cmp	r2, #0
	strb	r3, [r0, r6, lsr #3]
	bne	.L183
	ldrh	r3, [r5, #2]
	ldr	r2, [r5, #8]
	add	r1, r3, #1
	bfi	r3, r1, #0, #10
	strh	r3, [r5, #2]	@ movhi
	ldrb	r2, [r2, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r8
	b	.L168
.L184:
	movw	r0, #:lower16:.LC0
	movw	r1, #1622
	str	r3, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp]
	b	.L165
.L175:
	ldr	r2, [r4, #552]
	sub	r2, r2, #1
	str	r2, [r4, #552]
	b	.L167
.L162:
	movw	r0, #:lower16:.LC0
	movw	r1, #1605
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L163
.L187:
	movw	r0, #:lower16:.LC0
	movw	r1, #1643
	str	r2, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp]
	b	.L170
	.fnend
	.size	update_sit_entry, .-update_sit_entry
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__remove_dirty_segment, %function
__remove_dirty_segment:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r4, r2
	strd	r6, [sp, #8]
	mov	r7, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	mov	r0, r1
	ldr	r8, [r3, #8]
	add	r6, r8, r2, lsl #2
	ldr	r1, [r6, #4]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L189
	ldr	r3, [r6, #56]
	sub	r3, r3, #1
	str	r3, [r6, #56]
.L189:
	cmp	r4, #6
	beq	.L203
.L188:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L203:
	ldr	r2, [r7, #28]
	add	r3, r5, r5, lsl #1
	mov	r0, r5
	lsl	r6, r3, #3
	ldr	r2, [r2]
	ldr	r2, [r2, #60]
	ldrb	r4, [r2, r3, lsl #3]	@ zero_extendqisi2
	and	r4, r4, #63
	add	r4, r8, r4, lsl #2
	ldr	r1, [r4, #4]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L192
	ldr	r3, [r4, #56]
	sub	r3, r3, #1
	str	r3, [r4, #56]
.L192:
	ldr	r3, [r7, #28]
	ldr	r0, [r7, #504]
	ldr	r2, [r3]
	cmp	r0, #1
	bls	.L193
	udiv	r3, r5, r0
	ldr	r2, [r2, #64]
	ldr	r3, [r2, r3, lsl #2]
.L194:
	cmp	r3, #0
	bne	.L188
	udiv	r0, r5, r0
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #20]
	ldr	r1, [r8, #88]
	ldr	r8, [sp, #16]
	add	sp, sp, #24
	b	_clear_bit
.L193:
	ldr	r3, [r2, #60]
	ldrh	r3, [r3, r6]
	lsr	r3, r3, #6
	b	.L194
	.fnend
	.size	__remove_dirty_segment, .-__remove_dirty_segment
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"/home/jprim/hlte/lolz/fs/f2fs/f2fs.h\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_current_sum_page, %function
write_current_sum_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r3, r1
	mov	r1, r2
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	ip, [r0, #28]
	ldr	r4, [ip, #12]
	add	r4, r4, r3, lsl #6
	bl	grab_meta_page
	mov	r5, r0
	ldr	r7, [r4, #20]
	add	r8, r4, #24
	bl	page_address
	mov	r6, r0
	mov	r0, r4
	bl	mutex_lock
	mov	r0, r8
	bl	down_read
	movw	r2, #507
	add	r0, r6, #3584
	ldr	r1, [r4, #40]
	bl	memcpy
	mov	r0, r8
	bl	up_read
	mov	r1, r7
	mov	r2, #3584
	mov	r0, r6
	bl	memcpy
	movw	r3, #4091
	mov	r0, r4
	ldr	r2, [r7, r3]	@ unaligned
	add	r7, r7, r3
	str	r2, [r6, #4091]	@ unaligned
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	strb	r3, [r6, #4095]
	bl	mutex_unlock
	mov	r0, r5
	bl	set_page_dirty
	cmp	r5, #0
	beq	.L204
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L211
.L206:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	put_page
.L204:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L211:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L206
	.fnend
	.size	write_current_sum_page, .-write_current_sum_page
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"&x->wait\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__insert_discard_tree.constprop.0, %function
__insert_discard_tree.constprop.0:
	.fnstart
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r2
	mov	r2, #0
	strd	r10, [sp, #24]
	mov	r10, r1
	mov	fp, r3
	str	lr, [sp, #32]
	ldr	ip, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	mov	r3, r8
	ldr	r6, [sp, #64]
	str	r2, [sp, #20]
	add	r2, sp, #20
	ldr	r1, [ip, #80]
	add	r1, r1, #4160
	add	r1, r1, #12
	bl	__lookup_rb_tree_for_insert
	ldr	r2, [sp, #20]
	cmp	r6, #0
	ldr	r3, [r4, #28]
	stm	sp, {r0, r2}
	ldr	r7, [r3, #80]
	beq	.L216
.L213:
	movw	r3, #:lower16:.LANCHOR0
	cmp	r6, #512
	movt	r3, #:upper16:.LANCHOR0
	movcc	r2, r6
	ldr	r5, [r3, #8]
	movcs	r2, #512
	mov	r1, #80
	sub	r3, r2, #1
	add	r9, r7, r2, lsl #3
	str	r3, [sp, #8]
	add	r9, r9, #4
	mov	r0, r5
	bl	kmem_cache_alloc
	subs	r4, r0, #0
	beq	.L217
.L214:
	add	r3, r4, #24
	mov	r5, #0
	ldr	r2, .L218
	movw	r1, #:lower16:.LC4
	add	r0, r4, #36
	str	r8, [r4, #12]
	movt	r1, #:upper16:.LC4
	str	r6, [r4, #16]
	str	fp, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r5, [r4, #32]
	str	r10, [r4, #48]
	strh	r5, [r4, #52]	@ movhi
	strb	r5, [r4, #54]
	str	r5, [r4, #56]
	str	r3, [sp, #12]
	bl	__init_waitqueue_head
	ldr	r3, [sp, #8]
	mov	r2, r9
	add	r1, r7, r3, lsl #3
	ldr	r3, [sp, #12]
	ldr	r1, [r1, #16]
	mov	r0, r3
	bl	__list_add
	add	r3, r7, #4160
	add	r3, r3, #8
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	add	r2, r7, #4096
	add	r1, r7, #4160
	ldr	r3, [r2, #60]
	mov	r0, r4
	add	r1, r1, #12
	add	r6, r3, r6
	ldr	r3, [sp, #4]
	str	r6, [r2, #60]
	stm	r4, {r3, r5}
	ldr	r3, [sp]
	str	r5, [r4, #8]
	str	r4, [r3]
	bl	rb_insert_color
	cmp	r4, r5
	movcs	r0, r4
	movcc	r0, r5
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L217:
	mov	r0, r5
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r4, r0
	b	.L214
.L216:
	movw	r0, #:lower16:.LC0
	mov	r1, #744
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L213
.L219:
	.align	2
.L218:
	.word	.LANCHOR0+12
	.fnend
	.size	__insert_discard_tree.constprop.0, .-__insert_discard_tree.constprop.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__submit_discard_cmd, %function
__submit_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldrb	r3, [r1, #54]	@ zero_extendqisi2
	.pad #36
	sub	sp, sp, #36
	str	r0, [sp, #24]
	cmp	r3, #0
	bne	.L220
	mov	fp, r1
	movw	r3, #:lower16:__tracepoint_f2fs_issue_discard
	ldr	r1, [r0, #28]
	movt	r3, #:upper16:__tracepoint_f2fs_issue_discard
	ldr	r4, [fp, #16]
	ldr	r2, [r3, #4]
	ldr	r6, [fp, #20]
	ldr	r1, [r1, #80]
	ldr	r10, [fp, #48]
	cmp	r2, #0
	str	r1, [sp, #20]
	bne	.L270
.L223:
	ldr	r3, [r10, #88]
	lsr	r2, r6, #29
	lsl	r6, r6, #3
	mov	r8, r2
	lsr	r2, r4, #29
	ldr	ip, [r3, #492]
	str	r2, [sp, #4]
	lsl	r2, r4, #3
	cmp	ip, #0
	str	r2, [sp]
	mvneq	r3, #5
	streq	r3, [fp, #56]
	beq	.L230
	ldr	r3, [ip, #556]
	tst	r3, #16384
	mvneq	r3, #94
	streq	r3, [fp, #56]
	beq	.L230
	add	r3, ip, #776
	ldrh	r2, [r3]
	cmp	r2, #0
	bne	.L271
.L232:
	ldr	r7, [ip, #768]
	mov	r5, #0
	ldr	r3, [r10, #68]
	ldrd	r0, [sp]
	lsr	r7, r7, #9
	cmp	r7, #1
	movcc	r7, #1
	cmp	r3, r10
	ldrne	r3, [r10, #76]
	ldreq	r3, [ip, #772]
	ldrne	r3, [r3, #24]
	orrs	r2, r0, r1
	asr	r3, r3, #9
	udiv	r2, r3, r7
	mls	r3, r7, r2, r3
	str	r3, [sp, #12]
	beq	.L235
	str	r10, [sp, #8]
	str	r3, [sp, #16]
	str	fp, [sp, #28]
	mov	fp, r8
	b	.L246
.L269:
	ldrd	r0, [sp]
	subs	r0, r0, r9
	sbc	r1, r1, #0
	strd	r0, [sp]
	stm	r5, {r6, fp}
	ldr	r2, [sp, #8]
	str	r2, [r5, #12]
	mov	r2, #129
	str	r3, [r5, #32]
	str	r2, [r5, #20]
	bl	_cond_resched
	ldrd	r0, [sp]
	orrs	r3, r0, r1
	beq	.L265
	mov	r6, r8
	mov	fp, r10
.L246:
	ldrd	r2, [sp]
	cmp	r3, #0
	cmpeq	r2, #8388608
	bcc	.L236
	movw	r2, #65535
	mov	r3, #0
	movt	r2, 127
.L236:
	ldrd	r0, [sp]
	adds	r8, r2, r6
	mov	r9, r2
	adc	r10, r3, fp
	cmp	r1, r3
	cmpeq	r0, r2
	bls	.L237
	mov	r4, r7
	mov	r0, r8
	mov	r1, r10
	.syntax divided
@ 869 "/home/jprim/hlte/lolz/fs/f2fs/segment.c" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [sp, #12]
	cmp	r3, r1
	beq	.L237
	ldr	r9, [sp, #16]
	mov	r3, #0
	subs	r0, r8, r9
	sbc	r1, r10, r3
	.syntax divided
@ 871 "/home/jprim/hlte/lolz/fs/f2fs/segment.c" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	.arm
	.syntax unified
	mov	r1, r3
	umull	r2, r3, r7, r2
	mla	r3, r7, r1, r3
	adds	r8, r2, r9
	sub	r9, r8, r6
	adc	r10, r3, #0
.L237:
	cmp	r5, #0
	beq	.L243
	mov	r1, r5
	mov	r0, #129
	bl	submit_bio_wait
	mov	r4, r0
	mov	r0, r5
	bl	bio_put
	cmp	r4, #0
	bne	.L272
.L243:
	mov	r1, #1
	mov	r0, #16
	bl	bio_alloc
	subs	r5, r0, #0
	lslne	r3, r9, #9
	bne	.L269
	mov	r1, #1
	mov	r0, #2064
	bl	bio_alloc
	mov	r5, r0
	lsl	r3, r9, #9
	b	.L269
.L220:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L271:
	ldrd	r4, [sp]
	lsr	r2, r2, #9
	sub	r2, r2, #1
	orr	lr, r8, r5
	asr	r5, r2, #31
	orr	r3, r6, r4
	and	r0, r2, r3
	and	r1, r5, lr
	orrs	r3, r0, r1
	mvnne	r3, #21
	strne	r3, [fp, #56]
	beq	.L232
.L230:
	ldr	r0, [sp, #24]
	mov	r1, fp
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	__remove_discard_cmd
.L265:
	ldr	fp, [sp, #28]
.L235:
	ldr	r0, [sp, #20]
	mov	r2, #0
	mov	r1, #1
	strb	r1, [fp, #54]
	str	r2, [fp, #56]
	add	r3, r0, #4160
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r3, #4
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r5, #0
	beq	.L220
	movw	r3, #:lower16:f2fs_submit_discard_endio
	mov	r1, r5
	str	fp, [r5, #60]
	movt	r3, #:upper16:f2fs_submit_discard_endio
	add	r4, fp, #24
	mov	r0, #16
	str	r3, [r5, #56]
	bl	submit_bio
	mov	r0, r4
	bl	__list_del_entry
	ldr	r2, [sp, #20]
	mov	r0, r4
	add	r3, r2, #4096
	ldr	r1, [r3, #16]
	add	r2, r3, #12
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	__list_add
.L272:
	ldr	fp, [sp, #28]
	str	r4, [fp, #56]
	b	.L230
.L270:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L228
.L227:
	mov	r3, r4
	mov	r2, r6
	ldr	r7, [r5]
	mov	r1, r10
	ldr	r0, [r5, #4]
	blx	r7
	ldr	r0, [r5, #8]!
	cmp	r0, #0
	bne	.L227
.L228:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L273
.L267:
	ldr	r4, [fp, #16]
	ldr	r6, [fp, #20]
	ldr	r10, [fp, #48]
	b	.L223
.L273:
	bl	preempt_schedule
	b	.L267
	.fnend
	.size	__submit_discard_cmd, .-__submit_discard_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	issue_discard_thread, %function
issue_discard_thread:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r2, #:lower16:system_freezing_cnt
	movw	r1, #:lower16:jiffies
	strd	r6, [sp, #8]
	movt	r2, #:upper16:system_freezing_cnt
	movt	r1, #:upper16:jiffies
	strd	r8, [sp, #16]
	mov	r4, r0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #60
	sub	sp, sp, #60
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	ldr	r5, [r3, #80]
	str	r5, [sp, #12]
	bl	set_freezable
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	str	r3, [sp, #16]
	add	r3, r5, #4096
	add	r3, r3, #20
	str	r3, [sp, #20]
.L306:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L276
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L327
.L277:
	ldr	r3, [sp, #12]
	add	r5, r3, #4096
	ldr	r3, [r5, #72]
	cmp	r3, #0
	beq	.L328
.L276:
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L284
.L287:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L315
	ldr	r3, [r4, #28]
	ldr	r6, [r3, #80]
	add	r9, r6, #4096
	add	r9, r9, #32
	mov	r0, r9
	bl	mutex_lock
	add	r1, r6, #4160
	mov	r0, r4
	add	r1, r1, #12
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	beq	.L329
.L289:
	add	r10, sp, #32
	add	r3, r6, #4
	add	r8, r6, #4096
	movw	fp, #:lower16:.LC0
	mov	r0, r10
	add	r8, r8, #4
	str	r3, [sp]
	movt	fp, #:upper16:.LC0
	mov	r7, #0
	bl	blk_start_plug
.L298:
	ldr	r6, [r8]
	cmp	r8, r6
	ldr	r5, [r6], #-24
	sub	r5, r5, #24
	bne	.L297
	b	.L290
.L291:
	ldr	r3, [r4]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #492]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L292
	ldr	r3, [r3, #16]
	add	r0, sp, #24
	cmp	r3, #0
	bne	.L292
	ldr	r2, [r4, #280]
	strd	r2, [sp, #24]
	bl	timespec_to_jiffies
	ldr	r3, [sp, #8]
	mov	r2, r0
	mov	r1, r6
	mov	r0, r4
	ldr	ip, [r3]
	ldr	r3, [r4, #272]
	sub	r3, r3, ip
	cmn	r3, r2
	bpl	.L292
	bl	__submit_discard_cmd
.L292:
	cmp	r7, #8
	add	r3, r7, #1
	add	r2, r5, #24
	mov	r6, r5
	mov	r7, r3
	bgt	.L299
	ldr	r5, [r5, #24]
	cmp	r8, r2
	sub	r5, r5, #24
	beq	.L290
.L297:
	ldrb	r3, [r6, #54]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L291
	mov	r0, fp
	movw	r1, #1125
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L291
.L290:
	ldr	r3, [sp]
	sub	r8, r8, #8
	cmp	r3, r8
	bne	.L298
.L299:
	mov	r0, r10
	movw	r5, #4128
	bl	blk_finish_plug
	mov	r0, r9
	movw	r10, #:lower16:.LC0
	bl	mutex_unlock
	ldr	r3, [r4, #28]
	movt	r10, #:upper16:.LC0
	ldr	r6, [r3, #80]
	add	r9, r6, #4096
	add	r5, r6, r5
	add	r9, r9, #12
	add	r6, r6, #4096
.L296:
	mov	r0, r5
	bl	mutex_lock
	ldr	r7, [r6, #12]
	cmp	r9, r7
	ldr	r8, [r7], #-24
	sub	r8, r8, #24
	bne	.L302
	b	.L300
.L330:
	bl	wait_for_completion_io
	mov	r1, r7
	mov	r0, r4
	bl	__remove_discard_cmd
	ldr	r3, [r8, #24]
	add	r2, r8, #24
	mov	r7, r8
	cmp	r9, r2
	sub	r8, r3, #24
	beq	.L300
.L302:
	ldr	r3, [r7, #52]
	add	r0, r7, #32
	bic	r3, r3, #-16777216
	cmp	r3, #131072
	beq	.L330
	ldrh	r3, [r7, #52]
	mov	fp, r0
	mov	r0, r5
	add	r3, r3, #1
	strh	r3, [r7, #52]	@ movhi
	bl	mutex_unlock
	ldr	r3, [r4, #28]
	mov	r0, fp
	ldr	r8, [r3, #80]
	bl	wait_for_completion_io
	add	r8, r8, #4096
	add	r8, r8, #32
	mov	r0, r8
	bl	mutex_lock
	ldrb	r3, [r7, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L331
.L304:
	ldrh	r3, [r7, #52]
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r7, #52]	@ movhi
	beq	.L332
.L305:
	mov	r0, r8
	bl	mutex_unlock
	b	.L296
.L300:
	mov	r0, r5
	bl	mutex_unlock
	mov	r1, #6
	mov	r0, #1
	bl	congestion_wait
.L288:
	bl	kthread_should_stop
	cmp	r0, #0
	beq	.L306
.L315:
	mov	r0, #0
	add	sp, sp, #60
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L332:
	mov	r1, r7
	mov	r0, r4
	bl	__remove_discard_cmd
	b	.L305
.L331:
	mov	r0, r10
	movw	r1, #1145
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L304
.L328:
	movw	r2, #:lower16:autoremove_wake_function
	add	r1, sp, #44
	ldr	r8, [sp, #4]
	ldrd	r6, [sp, #16]
	movt	r2, #:upper16:autoremove_wake_function
	add	r10, sp, #32
	ldr	r0, [r6, #12]
	str	r3, [sp, #32]
	str	r0, [sp, #36]
	str	r2, [sp, #40]
	str	r1, [sp, #44]
	str	r1, [sp, #48]
	b	.L283
.L282:
	ldr	r3, [r5, #72]
	cmp	r3, #0
	bne	.L279
	ldr	r3, [r6, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	bne	.L279
	bl	schedule
.L283:
	mov	r2, #1
	mov	r1, r10
	mov	r0, r7
	bl	prepare_to_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L279
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L282
	ldr	r0, [r6, #12]
	bl	freezing_slow_path
	cmp	r0, #0
	beq	.L282
.L279:
	mov	r1, r10
	ldr	r0, [sp, #20]
	bl	finish_wait
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L287
.L284:
	ldr	r3, [sp, #16]
	ldr	r0, [r3, #12]
	bl	freezing_slow_path
	cmp	r0, #0
	beq	.L287
	mov	r0, #0
	bl	__refrigerator
	cmp	r0, #0
	beq	.L287
	b	.L288
.L329:
	movw	r0, #:lower16:.LC0
	movw	r1, #1119
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L289
.L327:
	ldr	r3, [sp, #16]
	ldr	r0, [r3, #12]
	bl	freezing_slow_path
	cmp	r0, #0
	bne	.L276
	b	.L277
	.fnend
	.size	issue_discard_thread, .-issue_discard_thread
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	issue_flush_thread, %function
issue_flush_thread:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	.pad #24
	sub	sp, sp, #24
	mov	r3, sp
	bic	r6, r3, #8128
	ldr	r3, [r0, #28]
	bic	r6, r6, #63
	ldr	r5, [r3, #76]
	add	r7, r5, #4
.L334:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L358
.L362:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L360
.L336:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L334
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L334
	ldr	r0, [r6, #12]
	movw	r2, #:lower16:autoremove_wake_function
	add	r1, sp, #16
	movt	r2, #:upper16:autoremove_wake_function
	str	r3, [sp, #4]
	str	r1, [sp, #16]
	str	r0, [sp, #8]
	str	r2, [sp, #12]
	str	r1, [sp, #20]
	b	.L346
.L361:
	bl	schedule
.L346:
	mov	r2, #1
	add	r1, sp, #4
	mov	r0, r7
	bl	prepare_to_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L345
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L345
	ldr	r3, [r6, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L361
.L345:
	add	r1, sp, #4
	mov	r0, r7
	bl	finish_wait
	bl	kthread_should_stop
	cmp	r0, #0
	beq	.L362
.L358:
	mov	r0, #0
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L360:
	.syntax divided
@ 37 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r2, r5, #24
	.syntax divided
@ 52 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r3, [r2]
	strex	r1, r0, [r2]
	teq	r1, #0
	bne	1b
@ 0 "" 2
@ 98 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	str	r3, [r5, #28]
	bne	.L338
	b	.L337
.L348:
	mov	r3, r2
.L338:
	ldr	r2, [r3]
	str	r0, [r3]
	mov	r0, r3
	cmp	r2, #0
	bne	.L348
.L337:
	str	r3, [r5, #28]
	ldr	r3, [r4]
	mov	r0, r4
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r4, #884]
	subs	r3, r0, #0
	mov	r8, r0
	movne	r3, #1
	cmp	r2, #0
	moveq	r3, #1
	cmp	r3, #0
	beq	.L363
.L339:
	add	r3, r5, #16
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r5, #28]
	cmp	r3, #0
	sub	r0, r3, #16
	beq	.L342
.L343:
	ldr	r9, [r0, #16]
	str	r8, [r0, #20]
	bl	complete
	cmp	r9, #0
	sub	r0, r9, #16
	bne	.L343
.L342:
	mov	r3, #0
	str	r3, [r5, #28]
	b	.L336
.L363:
	cmp	r2, #1
	movgt	r9, #80
	movgt	r10, #1
	ble	.L341
.L340:
	ldr	r3, [r4, #888]
	mov	r0, r4
	add	r10, r10, #1
	ldr	r1, [r3, r9]
	add	r9, r9, #80
	bl	__submit_flush_wait
	subs	r8, r0, #0
	bne	.L339
	ldr	r3, [r4, #884]
	cmp	r10, r3
	blt	.L340
.L341:
	mov	r8, #0
	b	.L339
	.fnend
	.size	issue_flush_thread, .-issue_flush_thread
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__queue_discard_cmd, %function
__queue_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:__tracepoint_f2fs_queue_discard
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r3
	movt	ip, #:upper16:__tracepoint_f2fs_queue_discard
	strd	r6, [sp, #8]
	mov	r6, r2
	strd	r8, [sp, #16]
	mov	r8, r0
	mov	r9, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	lr, [ip, #4]
	.pad #68
	sub	sp, sp, #68
	cmp	lr, #0
	bne	.L438
.L366:
	ldr	r3, [r8, #884]
	cmp	r3, #0
	streq	r6, [sp, #20]
	bne	.L439
.L372:
	ldr	r3, [r8, #28]
	mov	r5, #0
	add	r7, r6, r4
	str	r5, [sp, #48]
	str	r5, [sp, #52]
	ldr	fp, [r3, #80]
	str	r5, [sp, #56]
	str	r5, [sp, #60]
	add	r10, fp, #4096
	add	r10, r10, #32
	mov	r0, r10
	bl	mutex_lock
	add	r0, sp, #60
	add	r3, sp, #56
	add	r1, sp, #52
	mov	r2, #1
	str	r0, [sp, #8]
	add	r0, fp, #4160
	add	r0, r0, #12
	stm	sp, {r1, r3}
	mov	r1, r5
	add	r3, sp, #48
	str	r2, [sp, #12]
	mov	r2, r6
	bl	__lookup_rb_tree_ret
	subs	r1, r0, #0
	beq	.L373
	mov	r4, r5
	mov	r2, r5
	str	r1, [sp, #48]
.L374:
	ldr	r3, [sp, #20]
	cmp	r1, #0
	str	fp, [sp, #24]
	sub	r3, r3, r6
	str	r3, [sp, #20]
	add	r3, fp, #4096
	mov	fp, r2
	str	r3, [sp, #28]
	beq	.L376
.L442:
	ldr	r3, [r1, #12]
	ldr	r0, [r1, #16]
	add	r3, r0, r3
	cmp	r6, r3
	movcs	r5, r6
	movcc	r5, r3
	cmp	r7, r5
	bls	.L391
	ldr	ip, [sp, #20]
	ldr	r2, [sp, #52]
	add	fp, ip, r5
	cmp	r2, #0
	beq	.L378
	ldr	r4, [r2, #12]
	cmp	r7, r4
	bcc	.L379
	subs	r4, r4, r5
	beq	.L386
.L432:
	ldrb	ip, [r1, #54]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L399
.L398:
	ldr	ip, [r1, #48]
	cmp	r9, ip
	beq	.L440
.L383:
	cmp	r2, #0
	beq	.L390
.L399:
	ldrb	r3, [r2, #54]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L390
	ldr	r1, [r2, #48]
	cmp	r9, r1
	bne	.L390
	ldr	r1, [r2, #12]
	add	r0, r5, r4
	cmp	r0, r1
	bne	.L390
.L405:
	ldr	r1, [r2, #16]
	str	r3, [sp, #44]
	add	r0, r2, #24
	ldr	r3, [sp, #28]
	str	r5, [r2, #12]
	str	fp, [r2, #20]
	str	r0, [sp, #40]
	add	r1, r1, r4
	str	r1, [r2, #16]
	ldr	r1, [r3, #60]
	add	r1, r1, r4
	str	r1, [r3, #60]
	ldr	r1, [r2, #16]
	ldr	r3, [sp, #24]
	cmp	r1, #512
	movcs	r1, #512
	lsl	r1, r1, #3
	add	r2, r1, #4
	add	r2, r3, r2
	str	r2, [sp, #32]
	str	r1, [sp, #36]
	bl	__list_del_entry
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #32]
	ldr	r1, [sp, #36]
	ldr	r0, [sp, #40]
	add	r1, r3, r1
	ldr	r1, [r1, #8]
	bl	__list_add
	ldr	r3, [sp, #44]
	cmp	r3, #0
	beq	.L437
	mov	r1, r3
	mov	r0, r8
	bl	__remove_discard_cmd
	ldr	r2, [sp, #52]
	b	.L382
.L378:
	subs	r4, r7, r5
	beq	.L441
	ldrb	ip, [r1, #54]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L398
.L390:
	mov	r3, fp
	mov	r2, r5
	str	r4, [sp]
	mov	r1, r9
	mov	r0, r8
	bl	__insert_discard_tree.constprop.0
.L437:
	ldr	r2, [sp, #52]
.L382:
	cmp	r2, #0
	str	r2, [sp, #48]
	beq	.L391
.L395:
	mov	r0, r2
	bl	rb_next
	ldr	r1, [sp, #48]
	cmp	r0, #0
	movcc	r0, #0
	str	r0, [sp, #52]
	cmp	r1, #0
	bne	.L442
.L376:
	cmp	r4, #0
	ldr	r2, [sp, #52]
	bne	.L383
	b	.L382
.L440:
	cmp	r6, r3
	bhi	.L383
	ldr	r2, [sp, #28]
	add	r3, r0, r4
	add	fp, r1, #24
	mov	r0, fp
	str	r3, [r1, #16]
	ldr	r3, [r2, #60]
	add	r4, r3, r4
	ldr	r3, [sp, #24]
	str	r4, [r2, #60]
	ldr	r4, [r1, #16]
	cmp	r4, #512
	movcs	r4, #512
	lsl	r4, r4, #3
	add	r5, r4, #4
	add	r5, r3, r5
	bl	__list_del_entry
	ldr	r3, [sp, #24]
	mov	r2, r5
	mov	r0, fp
	add	r4, r3, r4
	ldr	r1, [r4, #8]
	bl	__list_add
	ldr	r2, [sp, #52]
	cmp	r2, #0
	beq	.L443
	ldrb	r1, [r2, #54]	@ zero_extendqisi2
	ldr	r3, [sp, #48]
	cmp	r1, #0
	ldr	r5, [r3, #12]
	ldr	r4, [r3, #16]
	ldr	fp, [r3, #20]
	beq	.L444
.L386:
	str	r2, [sp, #48]
	b	.L395
.L379:
	subs	r4, r7, r5
	bne	.L432
	str	r2, [sp, #48]
	b	.L395
.L443:
	str	r2, [sp, #48]
.L391:
	mov	r0, r10
	bl	mutex_unlock
	mov	r0, #0
	add	sp, sp, #68
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L441:
	str	r4, [sp, #48]
	b	.L391
.L439:
	mov	r1, r6
	mov	r0, r8
	bl	f2fs_target_device_index
	ldr	r3, [r8, #888]
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #4
	ldr	fp, [r0, #72]
	sub	r3, r6, fp
	str	r3, [sp, #20]
	b	.L372
.L373:
	ldr	r1, [sp, #48]
	cmp	r1, #0
	bne	.L407
	ldr	r3, [sp, #52]
	cmp	r3, #0
	beq	.L375
	ldr	r3, [r3, #12]
	sub	r3, r3, r6
	cmp	r4, r3
	movcs	r4, r3
.L375:
	ldr	r3, [sp, #20]
	mov	r5, r6
	mov	r2, r3
	b	.L374
.L438:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r5, [ip, #16]
	cmp	r5, #0
	beq	.L371
.L370:
	mov	r3, r4
	mov	r2, r6
	ldr	r7, [r5]
	mov	r1, r9
	ldr	r0, [r5, #4]
	blx	r7
	ldr	r0, [r5, #8]!
	cmp	r0, #0
	bne	.L370
.L371:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L366
	bl	preempt_schedule
	b	.L366
.L444:
	ldr	r1, [r2, #48]
	cmp	r9, r1
	bne	.L386
	ldr	r1, [r2, #12]
	add	r0, r5, r4
	cmp	r0, r1
	bne	.L386
	b	.L405
.L407:
	mov	r4, r5
	mov	r2, r5
	b	.L374
	.fnend
	.size	__queue_discard_cmd, .-__queue_discard_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_issue_discard, %function
f2fs_issue_discard:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	add	r10, r1, r2
	mov	r2, #0
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	bl	f2fs_target_device
	cmp	r4, r10
	bcs	.L446
	mov	r2, r4
	mov	r3, #0
	str	r10, [sp]
	add	r4, r4, #1
	mov	r6, #0
	mov	r7, #0
	mov	r5, #0
	mov	r9, r0
	mov	fp, r3
	mov	r10, r2
	b	.L447
.L452:
	cmp	fp, r5
	cmpeq	r10, r4
	beq	.L449
	mov	r2, #0
	mov	r0, r8
	bl	f2fs_target_device
	cmp	r9, r0
	str	r0, [sp, #4]
	beq	.L449
	mov	r3, r6
	mov	r2, r10
	mov	r1, r9
	mov	r0, r8
	bl	__queue_discard_cmd
	cmp	r0, #0
	bne	.L445
	ldr	r9, [sp, #4]
	mov	r10, r4
	mov	fp, r5
	mov	r6, #0
	mov	r7, #0
.L449:
	adds	r4, r4, #1
	adc	r5, r5, #0
.L447:
	ldr	ip, [r8, #28]
	cmp	r4, #1
	sub	r3, r4, #1
	mov	r1, r4
	mvnls	r0, #23
	ldr	r2, [ip, #16]
	sub	r2, r3, r2
	bls	.L450
	ldr	r0, [ip, #4]
	ldr	r3, [r8, #496]
	ldr	r0, [r0]
	rsb	r0, r0, r2, lsr r3
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #3
.L450:
	ldr	ip, [ip]
	ldr	r3, [r8, #500]
	ldr	ip, [ip, #60]
	sub	r3, r3, #1
	and	r3, r3, r2
	mvn	r2, r3
	add	r0, ip, r0
	and	r2, r2, #7
	ldr	ip, [r0, #12]
	mov	r0, #1
	lsl	r2, r0, r2
	ldrb	r0, [ip, r3, lsr #3]	@ zero_extendqisi2
	tst	r0, r2
	orr	r2, r0, r2
	strb	r2, [ip, r3, lsr #3]
	bne	.L451
	ldr	r3, [r8, #552]
	sub	r3, r3, #1
	str	r3, [r8, #552]
.L451:
	ldr	r3, [sp]
	adds	r6, r6, #1
	adc	r7, r7, #0
	cmp	r3, r1
	bhi	.L452
	orrs	r3, r6, r7
	bne	.L460
.L446:
	mov	r0, #0
.L445:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L460:
	mov	r3, r6
	mov	r2, r10
	mov	r1, r9
	mov	r0, r8
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	__queue_discard_cmd
	.fnend
	.size	f2fs_issue_discard, .-f2fs_issue_discard
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	locate_dirty_segment, %function
locate_dirty_segment:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r1, #1
	bxeq	lr
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	mov	r5, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r2, [r0, #28]
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r1, r4
	beq	.L461
	ldr	r1, [r3, #112]
	cmp	r1, r4
	beq	.L461
	ldr	r1, [r3, #176]
	cmp	r1, r4
	beq	.L461
	ldr	r1, [r3, #240]
	cmp	r1, r4
	beq	.L461
	ldr	r1, [r3, #304]
	cmp	r1, r4
	beq	.L461
	ldr	r3, [r3, #368]
	cmp	r3, r4
	beq	.L461
	ldr	r6, [r2, #8]
	add	r6, r6, #36
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r5, #28]
	add	r3, r4, r4, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L475
	ldr	r2, [r5, #500]
	cmp	r2, r3
	bls	.L465
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__locate_dirty_segment
.L467:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L461:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L475:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r4, r1
	beq	.L465
	ldr	r1, [r3, #112]
	cmp	r4, r1
	beq	.L465
	ldr	r1, [r3, #176]
	cmp	r4, r1
	beq	.L465
	ldr	r1, [r3, #240]
	cmp	r4, r1
	beq	.L465
	ldr	r1, [r3, #304]
	cmp	r4, r1
	beq	.L465
	ldr	r3, [r3, #368]
	cmp	r4, r3
	beq	.L465
	ldr	r7, [r2, #8]
	mov	r0, r4
	ldr	r1, [r7, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L465
	ldr	r3, [r7, #84]
	add	r3, r3, #1
	str	r3, [r7, #84]
.L465:
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L467
	.fnend
	.size	locate_dirty_segment, .-locate_dirty_segment
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"discard_entry\000"
	.align	2
.LC6:
	.ascii	"discard_cmd\000"
	.align	2
.LC7:
	.ascii	"sit_entry_set\000"
	.align	2
.LC8:
	.ascii	"inmem_page_entry\000"
	.section	.init.text,"ax",%progbits
	.align	2
	.global	create_segment_manager_caches
	.syntax unified
	.arm
	.fpu softvfp
	.type	create_segment_manager_caches, %function
create_segment_manager_caches:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, #0
	.pad #12
	sub	sp, sp, #12
	movw	r0, #:lower16:.LC5
	mov	r3, #131072
	mov	r2, r4
	movt	r0, #:upper16:.LC5
	mov	r1, #76
	str	r4, [sp]
	bl	kmem_cache_create
	movw	r3, #:lower16:.LANCHOR0
	cmp	r0, r4
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3]
	mvneq	r0, #11
	beq	.L476
	movw	r0, #:lower16:.LC6
	mov	r5, r3
	str	r4, [sp]
	mov	r3, #131072
	movt	r0, #:upper16:.LC6
	mov	r2, r4
	mov	r1, #60
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5, #8]
	beq	.L478
	movw	r0, #:lower16:.LC7
	mov	r3, #131072
	str	r4, [sp]
	movt	r0, #:upper16:.LC7
	mov	r2, r4
	mov	r1, #16
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5, #4]
	beq	.L479
	movw	r0, #:lower16:.LC8
	mov	r3, #131072
	str	r4, [sp]
	movt	r0, #:upper16:.LC8
	mov	r2, r4
	mov	r1, #16
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5, #12]
	movne	r0, r4
	bne	.L476
	ldr	r0, [r5, #4]
	bl	kmem_cache_destroy
.L479:
	ldr	r0, [r5, #8]
	bl	kmem_cache_destroy
.L478:
	ldr	r0, [r5]
	bl	kmem_cache_destroy
	mvn	r0, #11
.L476:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
	.fnend
	.size	create_segment_manager_caches, .-create_segment_manager_caches
	.text
	.align	2
	.global	llist_reverse_order
	.syntax unified
	.arm
	.fpu softvfp
	.type	llist_reverse_order, %function
llist_reverse_order:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	beq	.L490
	mov	r2, #0
	b	.L491
.L492:
	mov	r0, r3
.L491:
	ldr	r3, [r0]
	str	r2, [r0]
	mov	r2, r0
	cmp	r3, #0
	bne	.L492
.L490:
	bx	lr
	.fnend
	.size	llist_reverse_order, .-llist_reverse_order
	.align	2
	.global	register_inmem_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	register_inmem_page, %function
register_inmem_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	mov	r6, r0
	mov	r0, #11
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	str	r3, [r1, #28]
	bl	_set_bit
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #80
	movt	r3, #:upper16:.LANCHOR0
	ldr	r7, [r3, #12]
	mov	r0, r7
	bl	kmem_cache_alloc
	subs	r5, r0, #0
	beq	.L517
.L497:
	add	r7, r6, #432
	str	r5, [r5]
	mov	r0, r7
	str	r5, [r5, #4]
	str	r4, [r5, #8]
	bl	mutex_lock
	ldr	r3, [r4]
	tst	r3, #32768
	bne	.L498
.L500:
	mov	r3, r4
	ldr	r2, [r3, #16]!
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L499:
	add	r2, r6, #424
	mov	r0, r5
	ldr	r1, [r6, #428]
	bl	__list_add
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #616]
	add	r2, r3, #580
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, r7
	bl	mutex_unlock
	movw	r3, #:lower16:__tracepoint_f2fs_register_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_register_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L518
.L496:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L517:
	mov	r0, r7
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r5, r0
	b	.L497
.L498:
	mov	r0, r4
	bl	__get_page_tail
	cmp	r0, #0
	bne	.L499
	b	.L500
.L518:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L503
.L504:
	mov	r2, #5
	mov	r1, r4
	ldr	r3, [r5]
	ldr	r0, [r5, #4]
	blx	r3
	ldr	r3, [r5, #8]!
	cmp	r3, #0
	bne	.L504
.L503:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L496
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	preempt_schedule
	.fnend
	.size	register_inmem_page, .-register_inmem_page
	.align	2
	.global	drop_inmem_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	drop_inmem_page, %function
drop_inmem_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r4, r0
	strd	r6, [sp, #8]
	add	r6, r0, #424
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r2, [r1, #28]
	ldr	r3, [r0, #28]
	cmn	r2, #1
	ldr	r7, [r3, #616]
	bne	.L552
.L520:
	add	r8, r4, #432
	mov	r0, r8
	bl	mutex_lock
	ldr	r4, [r4, #424]
	cmp	r4, r6
	mov	r0, r4
	bne	.L523
	b	.L521
.L553:
	ldr	r4, [r4]
	cmp	r4, r6
	mov	r0, r4
	beq	.L521
.L523:
	ldr	r3, [r4, #8]
	cmp	r3, r5
	bne	.L553
	cmp	r4, #0
	beq	.L554
.L525:
	bl	list_del
	mov	r0, r8
	bl	mutex_unlock
	add	r3, r7, #580
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, r4
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3, #12]
	bl	kmem_cache_free
	mov	r1, r5
	mov	r0, #3
	bl	_clear_bit
	mov	r3, #0
	mov	r1, r5
	mov	r0, #11
	str	r3, [r5, #28]
	bl	_clear_bit
	cmp	r5, #0
	beq	.L526
	mov	r0, r5
	bl	put_page
.L526:
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L555
.L519:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L521:
	cmp	r4, #0
	beq	.L524
	ldr	r3, [r4, #8]
	cmp	r3, r5
	moveq	r0, r6
	beq	.L525
.L524:
	movw	r0, #:lower16:.LC0
	mov	r1, #328
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r7, #16
	bl	_set_bit
	mov	r0, r6
	b	.L525
.L555:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r4, [r3, #16]
	cmp	r4, #0
	beq	.L529
.L530:
	mov	r2, #7
	mov	r1, r5
	ldr	r3, [r4]
	ldr	r0, [r4, #4]
	blx	r3
	ldr	r3, [r4, #8]!
	cmp	r3, #0
	bne	.L530
.L529:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L519
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	preempt_schedule
.L552:
	movw	r0, #:lower16:.LC0
	mov	r1, #320
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L520
.L554:
	mov	r6, r4
	b	.L524
	.fnend
	.size	drop_inmem_page, .-drop_inmem_page
	.align	2
	.global	f2fs_balance_fs_bg
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_balance_fs_bg, %function
f2fs_balance_fs_bg:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	.pad #24
	sub	sp, sp, #24
	bl	available_free_memory
	cmp	r0, #0
	beq	.L581
.L557:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L582
.L558:
	mov	r1, #0
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L559
	movw	r1, #3640
	mov	r0, r4
	bl	try_to_free_nids
.L560:
	ldr	r3, [r4]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #492]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L561
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L583
.L561:
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcc	.L556
.L570:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L584
.L569:
	ldr	r3, [r4, #672]
	tst	r3, #32768
	bne	.L585
.L568:
	mov	r1, #1
	ldr	r0, [r4]
	bl	f2fs_sync_fs
	ldr	r2, [r4, #716]
	ldr	r3, [r2, #308]
	add	r3, r3, #1
	str	r3, [r2, #308]
.L556:
	add	sp, sp, #24
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L583:
	ldr	r2, [r4, #280]
	mov	r0, sp
	strd	r2, [sp]
	bl	timespec_to_jiffies
	movw	r2, #:lower16:jiffies
	ldr	r3, [r4, #272]
	movt	r2, #:upper16:jiffies
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L561
	b	.L570
.L584:
	mov	r1, #3
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L569
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #8]
	ldr	r3, [r3, #44]
	ldr	r2, [r2, #84]
	cmp	r2, r3
	bhi	.L569
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcs	.L569
	ldr	r3, [r4, #276]
	mov	r2, #0
	mov	r0, sp
	str	r3, [sp]
	str	r2, [sp, #4]
	bl	timespec_to_jiffies
	movw	r2, #:lower16:jiffies
	ldr	r3, [r4, #268]
	movt	r2, #:upper16:jiffies
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L556
	b	.L569
.L585:
	mov	r0, sp
	bl	blk_start_plug
	mov	r1, #1
	mov	r0, r4
	bl	sync_dirty_inodes
	mov	r0, sp
	bl	blk_finish_plug
	b	.L568
.L559:
	mov	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	build_free_nids
	b	.L560
.L582:
	movw	r1, #455
	mov	r0, r4
	bl	try_to_free_nats
	b	.L558
.L581:
	mov	r1, #128
	mov	r0, r4
	bl	f2fs_shrink_extent_tree
	b	.L557
	.fnend
	.size	f2fs_balance_fs_bg, .-f2fs_balance_fs_bg
	.align	2
	.global	f2fs_balance_fs
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_balance_fs, %function
f2fs_balance_fs:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	beq	.L587
	ldr	r2, [r0, #20]
	movw	r3, #34464
	movt	r3, 1
	ldr	r2, [r2, #76]
	cmp	r2, r3
	bcs	.L596
.L587:
	add	r3, r4, #496
	ldr	r0, [r4, #572]
	mov	lr, #0
	ldm	r3, {r3, r5, ip}
	asr	r1, r0, #31
	subs	r6, r0, #1
	mul	r5, r5, ip
	sbc	r7, r1, #0
	rsb	r2, r3, #32
	adds	r6, r6, r5
	adc	r7, r7, #0
	lsr	r1, r6, r3
	subs	r0, r3, #32
	orr	r1, r1, r7, lsl r2
	orrpl	r1, r1, r7, asr r0
	ldr	r0, [r4, #564]
	udiv	r7, r1, ip
	asr	r1, r0, #31
	subs	r6, r0, #1
	sbc	r1, r1, #0
	adds	r6, r6, r5
	adc	r1, r1, lr
	lsr	r6, r6, r3
	subs	r0, r3, #32
	orr	r6, r6, r1, lsl r2
	orrpl	r6, r6, r1, asr r0
	ldr	r0, [r4, #584]
	ldr	r8, [r4, #16]
	udiv	r6, r6, ip
	asr	r9, r0, #31
	subs	r0, r0, #1
	sbc	r1, r9, #0
	adds	r5, r0, r5
	adc	lr, r1, lr
	lsr	r5, r5, r3
	subs	r3, r3, #32
	orr	r5, r5, lr, lsl r2
	orrpl	r5, r5, lr, asr r3
	tst	r8, #8
	ubfx	r8, r8, #3, #1
	udiv	r5, r5, ip
	bne	.L586
	ldr	r3, [r4, #28]
	add	r7, r7, r5
	ldr	r5, [r3, #36]
	ldr	r3, [r3, #4]
	udiv	ip, r5, ip
	ldr	r3, [r3, #8]
	add	r5, ip, r7
	add	r6, r5, r6, lsl #1
	cmp	r3, r6
	bls	.L597
.L586:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L597:
	add	r0, r4, #676
	bl	mutex_lock
	mov	r0, r4
	mov	r2, r8
	ldrd	r4, [sp]
	mov	r1, r8
	mvn	r3, #0
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	f2fs_gc
.L596:
	bl	f2fs_balance_fs_bg
	b	.L587
	.fnend
	.size	f2fs_balance_fs, .-f2fs_balance_fs
	.align	2
	.global	f2fs_issue_flush
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_issue_flush, %function
f2fs_issue_flush:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #672]
	.pad #52
	sub	sp, sp, #52
	ands	ip, r3, #2048
	movne	r5, #0
	bne	.L598
	ldr	r2, [r0, #28]
	tst	r3, #1024
	mov	r4, r0
	ldr	r6, [r2, #76]
	beq	.L633
	mov	r7, r6
	ldr	r3, [r7, #20]!
	cmp	r3, #0
	beq	.L634
	movw	r1, #:lower16:.LC4
	ldr	r2, .L641
	add	r0, sp, #28
	movt	r1, #:upper16:.LC4
	str	ip, [sp, #24]
	bl	__init_waitqueue_head
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r7]
	add	r3, r3, #1
	strex	r2, r3, [r7]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r4, r6
	add	r2, sp, #40
	ldr	r3, [r4, #24]!
.L617:
	str	r3, [sp, #40]
	.syntax divided
@ 193 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
.L616:
	.syntax divided
@ 170 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@ __cmpxchg4
	ldrex	r0, [r4]
	mov	r1, #0
	teq	r0, r3
	strexeq r1, r2, [r4]

@ 0 "" 2
	.arm
	.syntax unified
	cmp	r1, #0
	bne	.L616
	.syntax divided
@ 195 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, r0
	beq	.L635
	mov	r3, r0
	b	.L617
.L634:
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r7]
	add	r3, r3, #1
	strex	r2, r3, [r7]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r0]
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r4, #884]
	cmp	r0, #0
	mov	r5, r0
	clz	r3, r2
	lsr	r3, r3, #5
	movne	r3, #1
	cmp	r3, #0
	beq	.L636
.L613:
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r7]
	sub	r3, r3, #1
	strex	r2, r3, [r7]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L632:
	add	r3, r6, #16
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L598:
	mov	r0, r5
	add	sp, sp, #52
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L635:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L637
.L618:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L619
	add	r0, sp, #24
	bl	wait_for_completion
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r7]
	sub	r3, r3, #1
	strex	r2, r3, [r7]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L620:
	ldr	r5, [sp, #44]
	b	.L598
.L619:
	.syntax divided
@ 37 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
@ 52 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r2, [r4]
	strex	r1, r3, [r4]
	teq	r1, #0
	bne	1b
@ 0 "" 2
@ 98 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [r6, #20]
	b	.L620
.L633:
	ldr	r3, [r0]
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r4, #884]
	cmp	r0, #0
	mov	r5, r0
	clz	r3, r2
	lsr	r3, r3, #5
	movne	r3, #1
	cmp	r3, #0
	bne	.L632
	cmp	r2, #1
	ble	.L611
	mov	r3, sp
	movw	fp, #:lower16:__tracepoint_f2fs_issue_flush
	str	r6, [sp, #16]
	bic	r3, r3, #8128
	movt	fp, #:upper16:__tracepoint_f2fs_issue_flush
	bic	r3, r3, #63
	mov	r7, #80
	mov	r8, #1
	str	r3, [sp, #12]
	b	.L602
.L603:
	mov	r3, #1
	mov	r1, r6
	str	r9, [r6, #12]
	movw	r0, #2577
	str	r3, [r6, #20]
	bl	submit_bio_wait
	mov	r5, r0
	mov	r0, r6
	bl	bio_put
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L638
.L605:
	cmp	r5, #0
	bne	.L629
	ldr	r3, [r4, #884]
	add	r8, r8, #1
	add	r7, r7, #80
	cmp	r8, r3
	bge	.L639
.L602:
	ldr	r3, [r4, #888]
	mov	r1, #0
	mov	r0, #16
	ldr	r9, [r3, r7]
	bl	bio_alloc
	subs	r6, r0, #0
	bne	.L603
	mov	r1, r6
	mov	r0, #2064
	bl	bio_alloc
	mov	r6, r0
	b	.L603
.L636:
	cmp	r2, #1
	movgt	r8, #80
	movgt	r9, #1
	bgt	.L614
	b	.L615
.L640:
	ldr	r3, [r4, #884]
	cmp	r9, r3
	bge	.L615
.L614:
	ldr	r3, [r4, #888]
	mov	r0, r4
	add	r9, r9, #1
	ldr	r1, [r3, r8]
	add	r8, r8, #80
	bl	__submit_flush_wait
	cmp	r0, #0
	beq	.L640
	mov	r5, r0
	b	.L613
.L637:
	mov	r2, #1
	mov	r1, #3
	add	r0, r6, #4
	bl	__wake_up
	b	.L618
.L638:
	ldr	r1, [sp, #12]
	ldr	r3, [r4, #672]
	ldr	r2, [r1, #4]
	add	r2, r2, #1
	str	r2, [r1, #4]
	ldr	r6, [fp, #16]
	cmp	r6, #0
	beq	.L610
	and	r10, r3, #1024
	and	r2, r3, #2048
	str	r7, [sp, #20]
	mov	r7, r10
	mov	r10, r4
	mov	r4, r2
.L609:
	mov	r2, r4
	mov	r3, r7
	ldr	r0, [r6, #4]
	mov	r1, r9
	str	r5, [sp]
	ldr	ip, [r6]
	blx	ip
	ldr	r2, [r6, #8]!
	cmp	r2, #0
	bne	.L609
	ldr	r7, [sp, #20]
	mov	r4, r10
.L610:
	ldr	r2, [sp, #12]
	ldr	r3, [r2, #4]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r2]
	tst	r3, #2
	beq	.L605
	bl	preempt_schedule
	b	.L605
.L615:
	mov	r5, #0
	b	.L613
.L639:
	ldr	r6, [sp, #16]
.L611:
	mov	r5, #0
	b	.L632
.L629:
	ldr	r6, [sp, #16]
	b	.L632
.L642:
	.align	2
.L641:
	.word	.LANCHOR0+12
	.fnend
	.size	f2fs_issue_flush, .-f2fs_issue_flush
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"&fcc->flush_wait_queue\000"
	.align	2
.LC10:
	.ascii	"f2fs_flush-%u:%u\000"
	.text
	.align	2
	.global	create_flush_cmd_control
	.syntax unified
	.arm
	.fpu softvfp
	.type	create_flush_cmd_control, %function
create_flush_cmd_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	ldr	r3, [r0]
	.pad #12
	sub	sp, sp, #12
	ldr	r2, [r0, #28]
	ldr	r3, [r3, #208]
	ldr	r5, [r2, #76]
	ldr	r6, [r3]
	cmp	r5, #0
	beq	.L652
.L644:
	lsr	r1, r6, #20
	ubfx	r6, r6, #0, #20
	movw	r3, #:lower16:.LC10
	movw	r0, #:lower16:issue_flush_thread
	movt	r3, #:upper16:.LC10
	movt	r0, #:upper16:issue_flush_thread
	mvn	r2, #0
	stm	sp, {r1, r6}
	mov	r1, r4
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L647
	mov	r7, #0
	bl	wake_up_process
	str	r6, [r5]
.L643:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L652:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L648
	mov	r2, #32
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L653
.L645:
	mov	r7, #0
	movw	r1, #:lower16:.LC9
	ldr	r2, .L654
	movt	r1, #:upper16:.LC9
	add	r0, r5, #4
	str	r7, [r5, #16]
	str	r7, [r5, #20]
	bl	__init_waitqueue_head
	str	r7, [r5, #24]
	ldr	r3, [r4, #28]
	str	r5, [r3, #76]
	ldr	r7, [r4, #672]
	ands	r7, r7, #1024
	bne	.L644
	b	.L643
.L648:
	mov	r5, #16
	b	.L645
.L647:
	mov	r0, r5
	str	r6, [r5]
	mov	r7, r6
	bl	kfree
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3, #76]
	b	.L643
.L653:
	mvn	r7, #11
	b	.L643
.L655:
	.align	2
.L654:
	.word	.LANCHOR0+16
	.fnend
	.size	create_flush_cmd_control, .-create_flush_cmd_control
	.align	2
	.global	destroy_flush_cmd_control
	.syntax unified
	.arm
	.fpu softvfp
	.type	destroy_flush_cmd_control, %function
destroy_flush_cmd_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #28]
	ldr	r6, [r3, #76]
	cmp	r6, #0
	beq	.L657
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L657
	mov	r3, #0
	str	r3, [r6]
	bl	kthread_stop
.L657:
	cmp	r5, #0
	bne	.L669
.L656:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L669:
	mov	r0, r6
	bl	kfree
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3, #76]
	b	.L656
	.fnend
	.size	destroy_flush_cmd_control, .-destroy_flush_cmd_control
	.align	2
	.global	f2fs_wait_discard_bio
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_wait_discard_bio, %function
f2fs_wait_discard_bio:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	movw	r7, #4128
	mov	r6, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r4, [r3, #80]
	add	r8, r4, r7
	mov	r0, r8
	bl	mutex_lock
	add	r0, r4, #4160
	mov	r2, r5
	add	r0, r0, #12
	mov	r1, #0
	bl	__lookup_rb_tree
	subs	r4, r0, #0
	beq	.L681
	ldrb	r3, [r4, #54]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L684
	ldrh	r3, [r4, #52]
	mov	r0, r8
	add	r3, r3, #1
	strh	r3, [r4, #52]	@ movhi
	bl	mutex_unlock
	ldr	r3, [r6, #28]
	add	r0, r4, #32
	ldr	r5, [r3, #80]
	bl	wait_for_completion_io
	add	r7, r5, r7
	mov	r0, r7
	bl	mutex_lock
	ldrb	r3, [r4, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L685
.L679:
	ldrh	r3, [r4, #52]
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r4, #52]	@ movhi
	beq	.L686
.L680:
	mov	r0, r7
.L683:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L684:
	ldr	r2, [r4, #16]
	cmp	r2, #1
	beq	.L687
	ldr	r3, [r6, #28]
	ldr	r7, [r4, #12]
	ldr	r10, [r4, #20]
	ldr	r1, [r3, #80]
	add	r9, r7, r2
	cmp	r5, r7
	sub	fp, r9, #1
	add	r3, r1, #4096
	ldr	r0, [r3, #60]
	sub	r2, r0, r2
	str	r2, [r3, #60]
	bhi	.L674
	cmp	r5, fp
	bcs	.L681
	ldr	ip, [r4, #12]
	add	r5, r4, #24
	str	r1, [sp, #8]
	ldr	r2, [r4, #16]
	ldr	r0, [r4, #20]
	add	ip, ip, #1
	sub	r2, r2, #1
	add	r0, r0, #1
	str	ip, [r4, #12]
	str	r2, [r4, #16]
	str	r0, [r4, #20]
	ldr	ip, [r3, #60]
	mov	r0, r5
	add	r2, ip, r2
	str	r2, [r3, #60]
	ldr	r4, [r4, #16]
	cmp	r4, #512
	movcs	r4, #512
	lsl	r4, r4, #3
	add	r6, r4, #4
	add	r6, r1, r6
	bl	__list_del_entry
	ldr	r1, [sp, #8]
	mov	r0, r5
	mov	r2, r6
	add	r1, r1, r4
	ldr	r1, [r1, #8]
	bl	__list_add
	mov	r0, r8
	b	.L683
.L674:
	ldr	r2, [r4, #12]
	add	r0, r4, #24
	str	r1, [sp, #12]
	str	r0, [sp, #20]
	sub	r2, r5, r2
	str	r2, [r4, #16]
	ldr	ip, [r3, #60]
	add	r2, ip, r2
	str	r2, [r3, #60]
	ldr	r3, [r4, #16]
	cmp	r3, #512
	movcs	r3, #512
	lsl	r3, r3, #3
	add	r2, r3, #4
	add	r2, r1, r2
	str	r2, [sp, #8]
	str	r3, [sp, #16]
	bl	__list_del_entry
	ldr	r2, [sp, #8]
	ldr	r1, [sp, #12]
	ldr	r3, [sp, #16]
	ldr	r0, [sp, #20]
	add	r1, r1, r3
	ldr	r1, [r1, #8]
	bl	__list_add
	cmp	r5, fp
	bcc	.L688
.L681:
	mov	r0, r8
	b	.L683
.L687:
	mov	r0, r6
	mov	r1, r4
	bl	__remove_discard_cmd
	mov	r0, r8
	b	.L683
.L686:
	mov	r1, r4
	mov	r0, r6
	bl	__remove_discard_cmd
	b	.L680
.L688:
	mvn	r3, r5
	add	r2, r5, #1
	ldr	r1, [r4, #48]
	add	r9, r3, r9
	add	r3, r10, r2
	mov	r0, r6
	sub	r3, r3, r7
	str	r9, [sp]
	bl	__insert_discard_tree.constprop.0
	mov	r0, r8
	b	.L683
.L685:
	movw	r0, #:lower16:.LC0
	movw	r1, #1145
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L679
	.fnend
	.size	f2fs_wait_discard_bio, .-f2fs_wait_discard_bio
	.align	2
	.global	f2fs_wait_discard_bios
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_wait_discard_bios, %function
f2fs_wait_discard_bios:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r6, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #60
	sub	sp, sp, #60
	ldr	r7, [r3, #80]
	add	r9, r7, #4096
	add	r9, r9, #32
	mov	r0, r9
	bl	mutex_lock
	add	r1, r7, #4160
	mov	r0, r6
	add	r1, r1, #12
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	beq	.L717
.L690:
	add	r4, r7, #4096
	movw	r10, #:lower16:.LC0
	add	r0, sp, #32
	add	r4, r4, #4
	add	r7, r7, #4
	movt	r10, #:upper16:.LC0
	add	fp, r6, #16
	bl	blk_start_plug
.L692:
	ldr	r5, [r4]
	cmp	r4, r5
	ldr	r8, [r5], #-24
	sub	r8, r8, #24
	bne	.L691
	b	.L696
.L694:
	bl	__submit_discard_cmd
	mov	r2, r8
	ldr	r3, [r2, #24]!
	cmp	r4, r2
	sub	r3, r3, #24
	beq	.L696
	mov	r5, r8
	mov	r8, r3
.L691:
	ldrb	r3, [r5, #54]	@ zero_extendqisi2
	mov	r1, r5
	mov	r0, r6
	cmp	r3, #0
	beq	.L694
	movw	r1, #1125
	mov	r0, r10
	bl	warn_slowpath_null
	mov	r1, fp
	mov	r0, #2
	bl	_set_bit
	mov	r1, r5
	mov	r0, r6
	b	.L694
.L696:
	sub	r4, r4, #8
	cmp	r7, r4
	bne	.L692
.L693:
	add	r0, sp, #32
	bl	blk_finish_plug
	mov	r0, r9
	bl	mutex_unlock
	ldr	r3, [r6, #28]
	ldr	r4, [r3, #80]
	add	r8, r4, #4096
	add	r4, r4, #4096
	mov	r9, r8
	add	r8, r8, #32
	mov	r0, r8
	add	r9, r9, #12
	bl	mutex_lock
	ldr	r4, [r4, #12]
	mov	r7, r4
	ldr	r3, [r4], #-24
	cmp	r9, r7
	sub	r3, r3, #24
	str	r3, [sp, #20]
	beq	.L702
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC2
	movt	r3, #:upper16:.LANCHOR0
	movt	r2, #:upper16:.LC2
	movw	fp, #:lower16:.LC0
	movw	r10, #:lower16:.LC1
	movt	fp, #:upper16:.LC0
	movt	r10, #:upper16:.LC1
	str	r3, [sp, #24]
	str	r2, [sp, #28]
	b	.L697
.L698:
	ldr	r0, [r4, #56]
	cmn	r0, #95
	moveq	r3, #0
	streq	r3, [r4, #56]
	beq	.L700
	cmp	r0, #0
	mov	r2, r10
	ldr	r1, [sp, #28]
	beq	.L700
	ldr	r3, [r4, #12]
	str	r0, [sp, #8]
	ldr	ip, [r4, #16]
	ldr	r0, [r6]
	str	ip, [sp, #4]
	ldr	ip, [r4, #20]
	str	ip, [sp]
	bl	f2fs_msg
.L700:
	ldrb	r3, [r4, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L701
	add	r3, r5, #4160
	add	r3, r3, #4
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L701:
	mov	r0, r7
	bl	list_del
	add	r1, r5, #4160
	mov	r0, r4
	add	r1, r1, #12
	bl	rb_erase
	add	r2, r5, #4096
	ldr	ip, [r4, #16]
	mov	r1, r4
	ldr	r3, [r2, #60]
	add	r5, r5, #4160
	ldr	r0, [sp, #24]
	add	r5, r5, #8
	sub	r3, r3, ip
	ldr	r0, [r0, #8]
	str	r3, [r2, #60]
	bl	kmem_cache_free
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r5]
	sub	r3, r3, #1
	strex	r2, r3, [r5]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r7, [sp, #20]
	mov	r4, r7
	ldr	r3, [r7, #24]!
	sub	r3, r3, #24
	cmp	r9, r7
	str	r3, [sp, #20]
	beq	.L702
.L697:
	add	r0, r4, #32
	bl	wait_for_completion_io
	ldrh	r2, [r4, #52]
	ldr	r3, [r6, #28]
	cmp	r2, #0
	ldr	r5, [r3, #80]
	beq	.L698
	mov	r0, fp
	movw	r1, #801
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L698
.L702:
	mov	r0, r8
	bl	mutex_unlock
	add	sp, sp, #60
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L717:
	movw	r0, #:lower16:.LC0
	movw	r1, #1119
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L690
	.fnend
	.size	f2fs_wait_discard_bios, .-f2fs_wait_discard_bios
	.align	2
	.global	release_discard_addrs
	.syntax unified
	.arm
	.fpu softvfp
	.type	release_discard_addrs, %function
release_discard_addrs:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	ldr	r6, [r3, #80]
	ldr	r5, [r6, #4]
	add	r6, r6, #4
	cmp	r6, r5
	ldr	r4, [r5]
	beq	.L718
	movw	r7, #:lower16:.LANCHOR0
	mov	r0, r5
	movt	r7, #:upper16:.LANCHOR0
.L720:
	bl	list_del
	mov	r1, r5
	ldr	r0, [r7]
	mov	r5, r4
	bl	kmem_cache_free
	cmp	r4, r6
	mov	r0, r4
	ldr	r4, [r4]
	bne	.L720
.L718:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	release_discard_addrs, .-release_discard_addrs
	.align	2
	.global	clear_prefree_segments
	.syntax unified
	.arm
	.fpu softvfp
	.type	clear_prefree_segments, %function
clear_prefree_segments:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	r4, #0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r1
	strd	r10, [sp, #24]
	mov	r10, r0
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r2, [r1]
	ldr	r7, [r3, #8]
	ldr	r3, [r3, #80]
	and	r2, r2, #16
	ldr	r6, [r7, #32]
	str	r3, [sp]
	add	r3, r3, #4
	str	r2, [sp, #16]
	add	r2, r7, #36
	mov	r0, r2
	str	r2, [sp, #4]
	str	r3, [sp, #24]
	bl	mutex_lock
	ldr	ip, [r10, #28]
.L724:
	add	r2, r4, #1
	mov	r0, r6
	ldr	r1, [ip, #32]
	bl	_find_next_bit_le
	ldr	r3, [r10, #28]
	mov	fp, r0
	mov	r5, r0
	ldr	r1, [r3, #32]
	cmp	r1, r0
	bls	.L725
	add	r8, r0, #1
	mov	r0, r6
	mov	r2, r8
	bl	_find_next_zero_bit_le
	cmp	fp, r0
	mov	r4, r0
	movcc	r0, fp
	bcs	.L729
.L726:
	mov	r1, r6
	bl	_clear_bit
	cmp	r4, r8
	mov	r0, r8
	add	r8, r8, #1
	bne	.L726
.L729:
	ldr	r3, [r7, #84]
	add	r3, r5, r3
	sub	r3, r3, r4
	str	r3, [r7, #84]
	ldr	lr, [r10, #672]
	tst	lr, #4
	beq	.L769
	ldr	r3, [sp, #16]
	ldr	ip, [r10, #28]
	cmp	r3, #0
	beq	.L730
	ldrd	r2, [r9, #8]
	mov	r1, #0
	cmp	r1, r3
	cmpeq	r5, r2
	bcc	.L730
	ldrd	r0, [r9, #16]
	mov	r3, #0
	sub	r2, r4, #1
	cmp	r3, r1
	cmpeq	r2, r0
	bls	.L724
.L730:
	tst	lr, #262144
	beq	.L732
	ldr	r2, [r10, #504]
	cmp	r2, #1
	beq	.L732
.L733:
	ldr	r0, [ip, #12]
	udiv	r3, r5, r2
	ldr	r1, [r0, #48]
	udiv	r1, r1, r2
	mul	r8, r2, r3
	cmp	r1, r3
	beq	.L734
	ldr	r1, [r0, #112]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L734
	ldr	r1, [r0, #176]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L734
	ldr	r1, [r0, #240]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L734
	ldr	r1, [r0, #304]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L734
	ldr	r1, [r0, #368]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L734
	cmp	r2, #1
	ldr	r1, [ip]
	bls	.L735
	ldr	r1, [r1, #64]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r3, #0
	beq	.L770
.L734:
	add	r5, r8, r2
	cmp	r4, r5
	bhi	.L733
	sub	r4, r5, #1
	b	.L724
.L769:
	ldr	ip, [r10, #28]
	b	.L724
.L732:
	ldr	r3, [ip, #4]
	sub	r2, r4, r5
	mov	r0, r10
	ldr	ip, [ip, #16]
	ldr	r1, [r10, #496]
	ldr	r3, [r3]
	lsl	r2, r2, r1
	add	r5, r5, r3
	add	r1, ip, r5, lsl r1
	bl	f2fs_issue_discard
	ldr	ip, [r10, #28]
	b	.L724
.L725:
	ldr	r0, [sp, #4]
	bl	mutex_unlock
	ldr	r3, [sp]
	ldr	r7, [r3, #4]
	ldr	r3, [sp, #24]
	str	r7, [sp, #12]
	cmp	r3, r7
	ldr	r3, [r7]
	str	r3, [sp, #20]
	beq	.L745
	movw	r3, #:lower16:.LANCHOR0
	mov	fp, r9
	movt	r3, #:upper16:.LANCHOR0
	str	r3, [sp, #28]
.L737:
	ldr	r3, [sp, #16]
	mov	r6, r7
	ldr	r5, [r6, #12]!
	ldr	r1, [r10, #500]
	cmp	r3, #0
	and	r5, r5, #1
	beq	.L771
	mov	r3, #0
	str	r6, [sp]
	mov	r4, r3
	stmib	sp, {r3, r7}
	b	.L738
.L773:
	bl	_find_next_zero_bit_le
	ldr	r1, [r10]
	mov	r3, r0
	mov	r9, #0
	sub	ip, r3, r4
	mov	r0, r10
	mov	r2, ip
	mov	r8, ip
	ldr	r1, [r1, #616]
	ldr	r1, [r1, #8]
	ldr	r1, [r1, #2180]	@ unaligned
	tst	r1, #2
	bne	.L749
	ldrd	r6, [fp, #24]
	cmp	r7, r9
	cmpeq	r6, ip
	bhi	.L749
	ldr	lr, [sp, #4]
	ldr	r1, [sp, #8]
	add	ip, lr, ip
	ldr	r1, [r1, #8]
	str	ip, [sp, #4]
	add	r1, r4, r1
	mov	r4, r3
	bl	f2fs_issue_discard
	ldr	r3, [fp, #32]
	ldr	r2, [fp, #36]
	adds	r3, r3, r8
	adc	r2, r2, r9
	str	r3, [fp, #32]
	str	r2, [fp, #36]
.L744:
	ldr	r1, [r10, #500]
	eor	r5, r5, #1
	cmp	r1, r4
	bls	.L772
.L738:
	cmp	r5, #0
	mov	r2, r4
	ldr	r0, [sp]
	bne	.L773
	bl	_find_next_bit_le
	ldr	r1, [r10, #500]
	mov	r4, r0
	eor	r5, r5, #1
	cmp	r1, r4
	bhi	.L738
.L772:
	ldr	r7, [sp, #8]
.L742:
	ldr	r0, [sp, #12]
	ldr	r4, [sp, #20]
	str	r4, [sp, #12]
	bl	list_del
	ldr	r3, [r10, #28]
	mov	r1, r7
	mov	r7, r4
	ldr	ip, [sp, #4]
	ldr	r2, [sp, #28]
	ldr	r3, [r3, #80]
	ldr	r0, [r2]
	add	r3, r3, #4096
	ldr	r2, [r3, #52]
	sub	r2, r2, ip
	str	r2, [r3, #52]
	bl	kmem_cache_free
	ldr	r3, [sp, #24]
	cmp	r4, r3
	ldr	r3, [r4]
	beq	.L745
	str	r3, [sp, #20]
	b	.L737
.L749:
	mov	r4, r3
	b	.L744
.L771:
	mov	r4, r3
	mov	r8, r3
	b	.L741
.L775:
	bl	_find_next_bit_le
	mov	r4, r0
.L740:
	ldr	r1, [r10, #500]
	eor	r5, r5, #1
	cmp	r1, r4
	bls	.L774
.L741:
	cmp	r5, #0
	mov	r2, r4
	mov	r0, r6
	beq	.L775
	bl	_find_next_zero_bit_le
	ldr	r1, [r10]
	mov	r3, r0
	mov	r0, r10
	sub	r9, r3, r4
	mov	r2, r9
	ldr	r1, [r1, #616]
	ldr	r1, [r1, #8]
	ldr	r1, [r1, #2180]	@ unaligned
	tst	r1, #2
	movne	r4, r3
	bne	.L740
	ldr	r1, [r7, #8]
	add	r8, r8, r9
	eor	r5, r5, #1
	add	r1, r4, r1
	mov	r4, r3
	bl	f2fs_issue_discard
	ldrd	r2, [fp, #32]
	adds	r2, r2, r9
	adc	r3, r3, #0
	strd	r2, [fp, #32]
	ldr	r1, [r10, #500]
	cmp	r1, r4
	bhi	.L741
.L774:
	str	r8, [sp, #4]
	b	.L742
.L745:
	ldr	r0, [r10, #28]
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	ldr	r0, [r0, #80]
	add	r0, r0, #4096
	add	r0, r0, #20
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	__wake_up
.L735:
	add	r5, r5, r5, lsl #1
	ldr	r1, [r1, #60]
	lsl	r3, r5, #3
	ldrh	r3, [r1, r3]
	lsr	r3, r3, #6
	cmp	r3, #0
	bne	.L734
.L770:
	ldr	r3, [ip, #4]
	mov	r0, r10
	ldr	ip, [ip, #16]
	ldr	r1, [r10, #496]
	ldr	r3, [r3]
	lsl	r2, r2, r1
	add	r3, r8, r3
	add	r1, ip, r3, lsl r1
	bl	f2fs_issue_discard
	ldr	ip, [r10, #28]
	ldr	r2, [r10, #504]
	b	.L734
	.fnend
	.size	clear_prefree_segments, .-clear_prefree_segments
	.align	2
	.global	refresh_sit_entry
	.syntax unified
	.arm
	.fpu softvfp
	.type	refresh_sit_entry, %function
refresh_sit_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r1, r2
	mov	r2, #1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	bl	update_sit_entry
	sub	r3, r6, #1
	cmn	r3, #3
	bhi	.L778
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #496]
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #16]
	ldr	r3, [r3]
	sub	r2, r6, r2
	rsb	r3, r3, r2, lsr r1
	cmn	r3, #1
	bne	.L803
.L778:
	sub	r3, r5, #1
	cmn	r3, #3
	bhi	.L776
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #496]
	ldr	r3, [r1, #4]
	ldr	r0, [r1, #16]
	ldr	r3, [r3]
	sub	r5, r5, r0
	rsb	r5, r3, r5, lsr r2
	cmn	r5, #1
	beq	.L776
	ldr	r3, [r1, #12]
	ldr	r2, [r3, #48]
	cmp	r5, r2
	beq	.L776
	ldr	r2, [r3, #112]
	cmp	r5, r2
	beq	.L776
	ldr	r2, [r3, #176]
	cmp	r5, r2
	beq	.L776
	ldr	r2, [r3, #240]
	cmp	r5, r2
	beq	.L776
	ldr	r2, [r3, #304]
	cmp	r5, r2
	beq	.L776
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L776
	ldr	r6, [r1, #8]
	add	r6, r6, #36
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r4, #28]
	add	r3, r5, r5, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L804
	ldr	r2, [r4, #500]
	mov	r1, r5
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcs	.L792
	bl	__locate_dirty_segment
.L791:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L776:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L803:
	mov	r1, r6
	mvn	r2, #0
	mov	r0, r4
	bl	update_sit_entry
	ldr	r0, [r4, #28]
	ldr	r2, [r4, #496]
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r3, [r3]
	sub	r6, r6, r1
	rsb	r6, r3, r6, lsr r2
	cmn	r6, #1
	beq	.L778
	ldr	r3, [r0, #12]
	ldr	r2, [r3, #48]
	cmp	r6, r2
	beq	.L778
	ldr	r2, [r3, #112]
	cmp	r6, r2
	beq	.L778
	ldr	r2, [r3, #176]
	cmp	r6, r2
	beq	.L778
	ldr	r2, [r3, #240]
	cmp	r6, r2
	beq	.L778
	ldr	r2, [r3, #304]
	cmp	r6, r2
	beq	.L778
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L778
	ldr	r7, [r0, #8]
	add	r7, r7, #36
	mov	r0, r7
	bl	mutex_lock
	ldr	r2, [r4, #28]
	add	r3, r6, r6, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L805
	ldr	r2, [r4, #500]
	mov	r1, r6
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcs	.L785
	bl	__locate_dirty_segment
.L784:
	mov	r0, r7
	bl	mutex_unlock
	b	.L778
.L785:
	bl	__remove_dirty_segment
	b	.L784
.L792:
	bl	__remove_dirty_segment
	b	.L791
.L805:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r6, r1
	beq	.L782
	ldr	r1, [r3, #112]
	cmp	r6, r1
	beq	.L782
	ldr	r1, [r3, #176]
	cmp	r6, r1
	beq	.L782
	ldr	r1, [r3, #240]
	cmp	r6, r1
	beq	.L782
	ldr	r1, [r3, #304]
	cmp	r6, r1
	beq	.L782
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L782
	ldr	r8, [r2, #8]
	mov	r0, r6
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L782
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L782:
	mov	r1, r6
	mov	r2, #6
	mov	r0, r4
	bl	__remove_dirty_segment
	b	.L784
.L804:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r5, r1
	beq	.L789
	ldr	r1, [r3, #112]
	cmp	r5, r1
	beq	.L789
	ldr	r1, [r3, #176]
	cmp	r5, r1
	beq	.L789
	ldr	r1, [r3, #240]
	cmp	r5, r1
	beq	.L789
	ldr	r1, [r3, #304]
	cmp	r5, r1
	beq	.L789
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L789
	ldr	r7, [r2, #8]
	mov	r0, r5
	ldr	r1, [r7, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L789
	ldr	r3, [r7, #84]
	add	r3, r3, #1
	str	r3, [r7, #84]
.L789:
	mov	r1, r5
	mov	r0, r4
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L791
	.fnend
	.size	refresh_sit_entry, .-refresh_sit_entry
	.align	2
	.global	invalidate_blocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	invalidate_blocks, %function
invalidate_blocks:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	sub	r2, r1, #1
	mov	r4, r0
	strd	r6, [sp, #8]
	cmn	r2, #3
	mov	r5, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	ldr	r7, [r3]
	bhi	.L807
	ldr	r1, [r3, #4]
	add	r7, r7, #40
	ldr	r3, [r3, #16]
	mov	r0, r7
	ldr	r2, [r4, #496]
	ldr	r6, [r1]
	sub	r3, r5, r3
	rsb	r6, r6, r3, lsr r2
	bl	mutex_lock
	mvn	r2, #0
	mov	r1, r5
	mov	r0, r4
	bl	update_sit_entry
	cmn	r6, #1
	ldr	r2, [r4, #28]
	beq	.L808
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r6, r1
	beq	.L808
	ldr	r1, [r3, #112]
	cmp	r6, r1
	beq	.L808
	ldr	r1, [r3, #176]
	cmp	r6, r1
	beq	.L808
	ldr	r1, [r3, #240]
	cmp	r6, r1
	beq	.L808
	ldr	r1, [r3, #304]
	cmp	r6, r1
	beq	.L808
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L808
	ldr	r5, [r2, #8]
	add	r5, r5, #36
	mov	r0, r5
	bl	mutex_lock
	ldr	r2, [r4, #28]
	add	r3, r6, r6, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L822
	ldr	r2, [r4, #500]
	mov	r1, r6
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcc	.L823
	bl	__remove_dirty_segment
.L815:
	mov	r0, r5
	bl	mutex_unlock
.L808:
	mov	r0, r7
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L807:
	cmp	r1, #0
	beq	.L824
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L824:
	movw	r0, #:lower16:.LC0
	movw	r1, #1677
	movt	r0, #:upper16:.LC0
	add	r7, r7, #40
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	mov	r0, r7
	bl	mutex_lock
	mov	r1, r5
	mov	r0, r4
	mvn	r2, #0
	bl	update_sit_entry
	b	.L808
.L823:
	bl	__locate_dirty_segment
	b	.L815
.L822:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r6, r1
	beq	.L813
	ldr	r1, [r3, #112]
	cmp	r6, r1
	beq	.L813
	ldr	r1, [r3, #176]
	cmp	r6, r1
	beq	.L813
	ldr	r1, [r3, #240]
	cmp	r6, r1
	beq	.L813
	ldr	r1, [r3, #304]
	cmp	r6, r1
	beq	.L813
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L813
	ldr	r8, [r2, #8]
	mov	r0, r6
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L813
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L813:
	mov	r1, r6
	mov	r0, r4
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L815
	.fnend
	.size	invalidate_blocks, .-invalidate_blocks
	.align	2
	.global	is_checkpointed_data
	.syntax unified
	.arm
	.fpu softvfp
	.type	is_checkpointed_data, %function
is_checkpointed_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r1, #1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	cmn	r3, #3
	str	r6, [sp, #8]
	movhi	r4, #1
	str	lr, [sp, #12]
	bhi	.L826
	ldr	r3, [r0, #28]
	mov	r5, r0
	mov	r4, r1
	ldr	r6, [r3]
	add	r6, r6, #40
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r5, #28]
	mov	r0, r6
	mov	ip, #1
	ldr	lr, [r5, #496]
	ldr	r3, [r5, #500]
	ldm	r2, {r5, r6}
	ldr	r1, [r2, #16]
	sub	r3, r3, #1
	ldr	r2, [r6]
	sub	r4, r4, r1
	ldr	r1, [r5, #60]
	and	r3, r3, r4
	rsb	r4, r2, r4, lsr lr
	mvn	r2, r3
	and	r2, r2, #7
	add	r4, r4, r4, lsl ip
	add	r4, r1, r4, lsl #3
	ldr	r1, [r4, #8]
	ldrb	r3, [r1, r3, lsr #3]	@ zero_extendqisi2
	ands	r3, r3, ip, lsl r2
	movne	r4, ip
	moveq	r4, #0
	bl	mutex_unlock
.L826:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	is_checkpointed_data, .-is_checkpointed_data
	.align	2
	.global	npages_for_summary_flush
	.syntax unified
	.arm
	.fpu softvfp
	.type	npages_for_summary_flush, %function
npages_for_summary_flush:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #172]
	cmp	r1, #0
	ldrb	r3, [r2, #176]	@ zero_extendqisi2
	bne	.L830
	cmp	r3, #1
	ldrb	r1, [r2, #177]	@ zero_extendqisi2
	ldrne	r3, [r0, #28]
	ldreq	r3, [r0, #500]
	ldrb	r2, [r2, #178]	@ zero_extendqisi2
	ldrne	r3, [r3, #12]
	ldrhne	r3, [r3, #52]
	cmp	r1, #1
	ldrne	r1, [r0, #28]
	ldreq	r1, [r0, #500]
	ldrne	r1, [r1, #12]
	ldrhne	r1, [r1, #116]
	cmp	r2, #1
	add	r3, r3, r1
	beq	.L847
	ldr	r2, [r0, #28]
	ldr	r2, [r2, #12]
	ldrh	r2, [r2, #180]
	add	r3, r2, r3
	cmp	r3, #440
	bge	.L848
.L845:
	mov	r0, #1
	bx	lr
.L830:
	ldrb	r1, [r2, #177]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhne	r3, [r2, #116]	@ unaligned
	ldreq	r3, [r0, #500]
	cmp	r1, #1
	ldrhne	r1, [r2, #118]	@ unaligned
	ldreq	r1, [r0, #500]
	add	r3, r3, r1
	ldrb	r1, [r2, #178]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L847
	ldrh	r2, [r2, #120]	@ unaligned
	add	r3, r2, r3
	b	.L837
.L847:
	ldr	r2, [r0, #500]
	add	r3, r3, r2
.L837:
	cmp	r3, #440
	blt	.L845
.L848:
	sub	r3, r3, #436
	sub	r3, r3, #3
	cmp	r3, #584
	movgt	r0, #3
	movle	r0, #2
	bx	lr
	.fnend
	.size	npages_for_summary_flush, .-npages_for_summary_flush
	.align	2
	.global	get_sum_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	get_sum_page, %function
get_sum_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	ldr	r3, [r3, #24]
	add	r1, r1, r3
	b	get_meta_page
	.fnend
	.size	get_sum_page, .-get_sum_page
	.align	2
	.global	update_meta_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	update_meta_page, %function
update_meta_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	mov	r1, r2
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	grab_meta_page
	mov	r4, r0
	bl	page_address
	cmp	r5, #0
	beq	.L851
	mov	r1, r5
	mov	r2, #4096
	bl	memcpy
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	beq	.L850
.L860:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L859
.L854:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	put_page
.L851:
	mov	r1, #4096
	bl	__memzero
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	bne	.L860
.L850:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L859:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L854
	.fnend
	.size	update_meta_page, .-update_meta_page
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	new_curseg, %function
new_curseg:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r2
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r1
	strd	r10, [sp, #24]
	lsl	r10, r1, #6
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r8, [r3, #12]
	ldr	r3, [r3, #24]
	add	r8, r8, r10
	ldr	r1, [r8, #20]
	ldr	r2, [r8, #48]
	add	r2, r2, r3
	bl	update_meta_page
	ldr	r3, [r4, #672]
	tst	r3, #8
	movne	r3, #0
	strne	r3, [sp]
	bne	.L862
	sub	r3, r9, #1
	cmp	r3, #1
	movls	r3, #0
	movhi	r3, #1
	str	r3, [sp]
.L862:
	ldr	r3, [r4, #28]
	ldr	r6, [r4, #504]
	cmp	r6, #1
	beq	.L863
	ldr	r2, [r3, #12]
	add	r10, r2, r10
	ldr	r7, [r10, #48]
	udiv	r6, r7, r6
.L864:
	ldr	r10, [r3, #4]
	ldr	r3, [r4, #508]
	ldr	r2, [r4, #512]
	add	r1, r10, #12
	mov	r0, r1
	str	r1, [sp, #16]
	udiv	r1, r6, r3
	udiv	r3, r2, r3
	str	r3, [sp, #4]
	str	r1, [sp, #12]
	bl	_raw_spin_lock
	cmp	r5, #0
	bne	.L867
	ldr	r1, [r4, #504]
	add	r2, r7, #1
	udiv	r3, r2, r1
	mls	r3, r1, r3, r2
	cmp	r3, #0
	bne	.L914
.L867:
	movw	r3, #:lower16:.LC0
	mov	r7, r6
	movt	r3, #:upper16:.LC0
	mov	fp, #0
	str	r3, [sp, #20]
	mov	r3, #1
	str	r3, [sp, #8]
.L866:
	mov	r2, r6
	ldr	r0, [r10, #20]
	ldr	r1, [r4, #512]
	bl	_find_next_zero_bit_le
	ldr	r1, [r4, #512]
	mov	r5, r0
	cmp	r0, r1
	bcc	.L869
	ldr	r3, [sp]
	ldr	r0, [r10, #20]
	cmp	r3, #0
	subne	r7, r6, #1
	beq	.L915
.L871:
	cmp	r7, #0
	add	r3, r7, #31
	movge	r3, r7
	and	fp, r7, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	fp, r3, fp
	ands	fp, fp, #1
	moveq	r0, #1
	moveq	r5, r7
	moveq	fp, r0
	beq	.L872
.L875:
	cmp	r7, #0
	beq	.L874
	sub	r7, r7, #1
	cmp	r7, #0
	add	r3, r7, #31
	movge	r3, r7
	and	r2, r7, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	r3, r3, r2
	tst	r3, #1
	bne	.L875
	mov	r5, r7
	mov	r0, #1
	b	.L872
.L915:
	mov	r2, r3
	bl	_find_next_zero_bit_le
	ldr	r3, [r4, #512]
	mov	r5, r0
	cmp	r0, r3
	bcc	.L869
	movw	r1, #1852
	ldr	r0, [sp, #20]
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
.L869:
	cmp	fp, #0
	moveq	r0, fp
	bne	.L916
.L872:
	ldr	r3, [sp, #8]
	ldr	r6, [sp, #12]
	ldr	r1, [r4, #508]
	ldr	lr, [r4, #504]
	eor	ip, r3, #1
	udiv	r3, r5, r1
	cmp	r1, #1
	orreq	ip, ip, #1
	mul	r2, r5, lr
	cmp	r6, r3
	orreq	ip, ip, #1
	cmp	ip, #0
	str	ip, [sp, #8]
	bne	.L913
	ldr	ip, [sp]
	cmp	ip, #1
	beq	.L917
	ldr	r0, [r4, #28]
	ldr	ip, [r0, #12]
	ldr	r0, [ip, #56]
	cmp	r3, r0
	beq	.L882
.L888:
	ldr	r0, [ip, #120]
	cmp	r3, r0
	beq	.L882
	ldr	r0, [ip, #184]
	cmp	r0, r3
	beq	.L882
	ldr	r0, [ip, #248]
	cmp	r3, r0
	beq	.L882
	ldr	r0, [ip, #312]
	cmp	r3, r0
	beq	.L882
	ldr	r0, [ip, #376]
	cmp	r3, r0
	beq	.L882
.L913:
	mov	r5, r2
.L868:
	cmp	r5, #0
	ldr	r1, [r10, #16]
	add	r3, r5, #31
	movge	r3, r5
	and	r0, r5, #31
	asr	r3, r3, #5
	ldr	r1, [r1, r3, lsl #2]
	lsr	r3, r1, r0
	tst	r3, #1
	bne	.L918
.L885:
	ldr	r3, [r4, #28]
	mov	r0, r5
	udiv	r6, r2, lr
	str	r2, [sp]
	ldr	r5, [r3, #4]
	ldr	r1, [r5, #16]
	bl	_set_bit
	ldr	r3, [r5, #4]
	mov	r0, r6
	ldr	r1, [r5, #20]
	sub	r3, r3, #1
	str	r3, [r5, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	ldr	r2, [sp]
	bne	.L886
	ldr	r3, [r5, #8]
	sub	r3, r3, #1
	str	r3, [r5, #8]
.L886:
	ldr	r0, [sp, #16]
	str	r2, [sp]
	bl	_raw_spin_unlock
	ldr	r2, [sp]
	mov	r1, r9
	mov	r0, r4
	str	r2, [r8, #60]
	mov	r2, #1
	bl	reset_curseg
	mov	r3, #0
	strb	r3, [r8, #44]
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L882:
	cmp	fp, #0
	addeq	r6, r3, #1
	bne	.L887
.L883:
	ldr	r3, [sp, #4]
	cmp	r3, r6
	movls	fp, #0
	movls	r6, fp
	bls	.L866
	mul	r6, r6, r1
	mov	fp, #0
	b	.L866
.L917:
	cmp	fp, #0
	bne	.L879
	ldr	r0, [sp, #4]
	add	r6, r3, #1
	cmp	r0, r6
	bls	.L913
	ldr	r0, [r4, #28]
	ldr	ip, [r0, #12]
	ldr	r0, [ip, #56]
	cmp	r3, r0
	bne	.L888
	b	.L883
.L879:
	cmp	r5, r1
	movcs	r0, #0
	andcc	r0, r0, #1
	cmp	r0, #0
	bne	.L913
	ldr	r0, [r4, #28]
	ldr	ip, [r0, #12]
	ldr	r0, [ip, #56]
	cmp	r3, r0
	bne	.L888
.L887:
	mul	r6, r3, r1
	mov	fp, #1
	sub	r6, r6, #1
	b	.L866
.L916:
	ldr	r0, [r10, #20]
	b	.L871
.L874:
	mov	r2, #0
	ldr	r1, [r4, #512]
	bl	_find_next_zero_bit_le
	ldr	r3, [r4, #512]
	mov	r5, r0
	cmp	r0, r3
	movcc	r7, r0
	movcc	r0, #1
	bcc	.L872
	movw	r1, #1868
	ldr	r0, [sp, #20]
	mov	r7, r5
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r4, #16
	bl	_set_bit
	mov	r0, #1
	b	.L872
.L863:
	cmp	r9, #2
	movle	r2, #0
	movgt	r2, #1
	cmp	r9, #0
	moveq	r2, #1
	cmp	r2, #0
	bne	.L890
	ldr	r2, [r3]
	ldr	r7, [r2, #112]
	cmp	r7, #0
	movne	r6, r7
	bne	.L864
	ldr	r2, [r3, #12]
	add	r10, r2, r10
	ldr	r7, [r10, #48]
	mov	r6, r7
	b	.L864
.L890:
	mov	r6, #0
	mov	r7, r6
	b	.L864
.L914:
	mla	r1, r6, r1, r1
	ldr	r0, [r10, #16]
	bl	_find_next_zero_bit_le
	ldr	lr, [r4, #504]
	add	r3, r6, #1
	mov	r5, r0
	mov	r2, r0
	mul	r3, lr, r3
	cmp	r0, r3
	bcs	.L867
	b	.L868
.L918:
	movw	r0, #:lower16:.LC0
	movw	r1, #1907
	str	r2, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp]
	ldr	lr, [r4, #504]
	b	.L885
	.fnend
	.size	new_curseg, .-new_curseg
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	change_curseg.constprop.0, %function
change_curseg.constprop.0:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	ldr	r8, [r3, #8]
	ldr	r5, [r3, #12]
	ldr	r2, [r3, #24]
	add	r5, r5, r1, lsl #6
	ldr	r1, [r5, #20]
	ldr	r3, [r5, #48]
	ldr	r6, [r5, #60]
	add	r2, r2, r3
	bl	update_meta_page
	ldr	r3, [r4, #28]
	ldr	fp, [r4, #504]
	ldr	r9, [r3, #4]
	add	r10, r9, #12
	mov	r0, r10
	bl	_raw_spin_lock
	mov	r0, r6
	ldr	r1, [r9, #16]
	bl	_test_and_set_bit
	cmp	r0, #0
	beq	.L935
.L921:
	mov	r0, r10
	add	r8, r8, #36
	bl	_raw_spin_unlock
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [r4, #28]
	mov	r0, r6
	ldr	r9, [r3, #8]
	ldr	r1, [r9, #32]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L923
	ldr	r3, [r9, #84]
	sub	r3, r3, #1
	str	r3, [r9, #84]
.L923:
	mov	r2, #6
	mov	r1, r6
	mov	r0, r4
	bl	__remove_dirty_segment
	mov	r0, r8
	bl	mutex_unlock
	mov	r1, r7
	mov	r2, #1
	mov	r0, r4
	bl	reset_curseg
	mov	r3, #1
	ldr	r2, [r5, #48]
	strb	r3, [r5, #44]
	ldr	r1, [r4, #28]
	add	r3, r2, r2, lsl r3
	ldr	r1, [r1]
	ldr	r0, [r1, #24]
	ldr	r2, [r1, #60]
	add	r7, r0, #8
	add	r2, r2, r3, lsl #3
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #8]
	add	r1, r3, #8
	add	ip, r2, #8
	cmp	r3, r7
	cmpcc	r0, r1
	orr	lr, r3, r2
	movcs	r1, #1
	movcc	r1, #0
	orr	lr, r0, lr
	cmp	r2, r7
	cmpcc	r0, ip
	movcs	ip, #1
	movcc	ip, #0
	tst	lr, #7
	andeq	r1, r1, ip
	movne	r1, #0
	cmp	r1, #0
	beq	.L924
	ldm	r3, {r7, lr}
	ldr	ip, [r2]
	ldr	r1, [r2, #4]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0]
	str	r1, [r0, #4]
	ldr	r7, [r3, #8]
	ldr	ip, [r2, #8]
	ldr	lr, [r3, #12]
	ldr	r1, [r2, #12]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0, #8]
	str	r1, [r0, #12]
	ldr	r7, [r3, #16]
	ldr	ip, [r2, #16]
	ldr	lr, [r3, #20]
	ldr	r1, [r2, #20]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0, #16]
	str	r1, [r0, #20]
	ldr	r7, [r3, #24]
	ldr	ip, [r2, #24]
	ldr	lr, [r3, #28]
	ldr	r1, [r2, #28]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0, #24]
	str	r1, [r0, #28]
	ldr	ip, [r2, #32]
	ldr	r7, [r3, #32]
	ldr	lr, [r3, #36]
	ldr	r1, [r2, #36]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0, #32]
	str	r1, [r0, #36]
	ldr	ip, [r2, #40]
	ldr	r1, [r2, #44]
	ldr	r7, [r3, #40]
	ldr	lr, [r3, #44]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0, #40]
	str	r1, [r0, #44]
	ldr	r7, [r2, #48]
	ldr	ip, [r3, #48]
	ldr	lr, [r2, #52]
	ldr	r1, [r3, #52]
	orr	ip, ip, r7
	orr	r1, r1, lr
	str	ip, [r0, #48]
	str	r1, [r0, #52]
	ldr	r1, [r3, #56]
	ldr	lr, [r2, #56]
	ldr	ip, [r2, #60]
	ldr	r3, [r3, #60]
	orr	r2, r1, lr
	orr	r3, r3, ip
	strd	r2, [r0, #56]
.L925:
	mov	r2, #0
	ldr	r1, [r4, #500]
	bl	__find_rev_next_zero_bit
	mov	r3, r0
	mov	r0, r4
	strh	r3, [r5, #52]	@ movhi
	ldr	r3, [r4, #28]
	ldr	r1, [r3, #24]
	add	r1, r6, r1
	bl	get_meta_page
	mov	r4, r0
	bl	page_address
	mov	r1, r0
	mov	r2, #3584
	ldr	r0, [r5, #20]
	bl	memcpy
	cmp	r4, #0
	beq	.L919
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L936
.L927:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	put_page
.L935:
	ldr	r3, [r9, #4]
	udiv	r0, r6, fp
	ldr	r1, [r9, #20]
	sub	r3, r3, #1
	str	r3, [r9, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L921
	ldr	r3, [r9, #8]
	sub	r3, r3, #1
	str	r3, [r9, #8]
	b	.L921
.L924:
	ldr	ip, [r3]
	ldr	r1, [r2]
	orr	r1, r1, ip
	str	r1, [r0]
	ldr	ip, [r3, #4]
	ldr	r1, [r2, #4]
	orr	r1, r1, ip
	str	r1, [r0, #4]
	ldr	ip, [r3, #8]
	ldr	r1, [r2, #8]
	orr	r1, r1, ip
	str	r1, [r0, #8]
	ldr	ip, [r3, #12]
	ldr	r1, [r2, #12]
	orr	r1, r1, ip
	str	r1, [r0, #12]
	ldr	ip, [r3, #16]
	ldr	r1, [r2, #16]
	orr	r1, r1, ip
	str	r1, [r0, #16]
	ldr	ip, [r3, #20]
	ldr	r1, [r2, #20]
	orr	r1, r1, ip
	str	r1, [r0, #20]
	ldr	ip, [r3, #24]
	ldr	r1, [r2, #24]
	orr	r1, r1, ip
	str	r1, [r0, #24]
	ldr	ip, [r3, #28]
	ldr	r1, [r2, #28]
	orr	r1, r1, ip
	str	r1, [r0, #28]
	ldr	ip, [r3, #32]
	ldr	r1, [r2, #32]
	orr	r1, r1, ip
	str	r1, [r0, #32]
	ldr	ip, [r3, #36]
	ldr	r1, [r2, #36]
	orr	r1, r1, ip
	str	r1, [r0, #36]
	ldr	ip, [r3, #40]
	ldr	r1, [r2, #40]
	orr	r1, r1, ip
	str	r1, [r0, #40]
	ldr	ip, [r3, #44]
	ldr	r1, [r2, #44]
	orr	r1, r1, ip
	str	r1, [r0, #44]
	ldr	ip, [r3, #48]
	ldr	r1, [r2, #48]
	orr	r1, r1, ip
	str	r1, [r0, #48]
	ldr	ip, [r3, #52]
	ldr	r1, [r2, #52]
	orr	r1, r1, ip
	str	r1, [r0, #52]
	ldr	r1, [r2, #56]
	ldr	ip, [r3, #56]
	orr	r1, r1, ip
	str	r1, [r0, #56]
	ldr	r2, [r2, #60]
	ldr	r3, [r3, #60]
	orr	r3, r2, r3
	str	r3, [r0, #60]
	b	.L925
.L919:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L936:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L927
	.fnend
	.size	change_curseg.constprop.0, .-change_curseg.constprop.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	allocate_segment_by_default, %function
allocate_segment_by_default:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r2, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	ip, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [ip, #12]
	add	r6, r6, r1, lsl #6
	bne	.L972
	ldr	r3, [r0, #172]
	mov	r5, r1
	sub	r1, r1, #4
	clz	r1, r1
	lsr	r1, r1, #5
	ldr	r3, [r3, #132]	@ unaligned
	eor	r3, r3, #64
	ands	r3, r1, r3, lsr #6
	bne	.L973
	ldrb	r3, [r6, #44]	@ zero_extendqisi2
	ldr	r2, [r0, #504]
	cmp	r3, #0
	beq	.L974
.L941:
	ldr	r0, [r4, #572]
	ldr	r1, [r4, #564]
	ldr	r3, [r4, #672]
	str	r1, [sp, #8]
	ldr	r1, [r4, #584]
	tst	r3, #262144
	str	r1, [sp, #16]
	bne	.L942
	asr	r1, r0, #31
	subs	r8, r0, #1
	ldr	r3, [r4, #496]
	ldr	r7, [r4, #500]
	mov	lr, #0
	sbc	r9, r1, #0
	ldr	r1, [ip, #4]
	str	r1, [sp, #20]
	mul	r1, r7, r2
	rsb	r7, r3, #32
	adds	r10, r8, r1
	mov	r8, r1
	adc	fp, r9, #0
	lsr	r9, r10, r3
	ldr	r10, [sp, #16]
	subs	r0, r3, #32
	orr	r9, r9, fp, lsl r7
	orrpl	r9, r9, fp, asr r0
	subs	r0, r10, #1
	asr	fp, r10, #31
	sbc	r10, fp, #0
	adds	r1, r0, r1
	udiv	r9, r9, r2
	adc	r0, r10, lr
	lsr	r1, r1, r3
	subs	r10, r3, #32
	orr	r1, r1, r0, lsl r7
	orrpl	r1, r1, r0, asr r10
	ldr	r0, [sp, #8]
	udiv	r10, r1, r2
	asr	r1, r0, #31
	strd	r0, [sp, #8]
	subs	r0, r0, #1
	ldr	r1, [sp, #12]
	sbc	r1, r1, #0
	adds	r8, r0, r8
	adc	lr, r1, lr
	lsr	r8, r8, r3
	add	r9, r9, r10
	ldr	r10, [ip, #36]
	subs	r3, r3, #32
	orr	r8, r8, lr, lsl r7
	orrpl	r8, r8, lr, asr r3
	ldr	r3, [sp, #20]
	udiv	r8, r8, r2
	udiv	r2, r10, r2
	ldr	r3, [r3, #8]
	add	r8, r8, r2
	add	r8, r9, r8, lsl #1
	cmp	r3, r8
	bls	.L975
.L942:
	mov	r1, r5
	mov	r2, #0
	mov	r0, r4
	bl	new_curseg
.L939:
	ldrb	r0, [r6, #44]	@ zero_extendqisi2
	add	r4, r4, r0, lsl #2
	ldr	r3, [r4, #720]
	add	r3, r3, #1
	str	r3, [r4, #720]
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L972:
	mov	r2, #1
	bl	new_curseg
	b	.L939
.L974:
	ldr	r1, [r6, #48]
	ldr	r0, [ip, #32]
	add	r3, r1, #1
	cmp	r3, r0
	bcs	.L941
	udiv	r0, r3, r2
	mls	r0, r2, r0, r3
	cmp	r0, #0
	beq	.L941
	ldr	lr, [ip, #4]
	cmp	r3, #0
	and	r0, r3, #31
	addlt	r3, r1, #32
	asr	r3, r3, #5
	ldr	r1, [lr, #16]
	ldr	r3, [r1, r3, lsl #2]
	mvn	r3, r3, lsr r0
	tst	r3, #1
	bne	.L942
	b	.L941
.L975:
	ldr	r7, [ip, #8]
	mvn	lr, #0
	mov	ip, #1
	mov	r3, r5
	add	r1, sp, #28
	mov	r2, #0
	mov	r0, r4
	ldr	r8, [r7]
	str	ip, [sp]
	str	lr, [sp, #28]
	ldr	r7, [r8]
	blx	r7
	subs	r7, r0, #0
	bne	.L955
	cmp	r5, #2
	bgt	.L976
	cmp	r5, #0
	movgt	r7, #2
	ble	.L950
.L949:
	sub	r9, r7, #3
	mov	r10, #1
.L952:
	cmp	r5, r7
	mov	r3, r7
	mov	r2, #0
	add	r1, sp, #28
	mov	r0, r4
	sub	r7, r7, #1
	beq	.L951
	str	r10, [sp]
	ldr	fp, [r8]
	blx	fp
	cmp	r0, #0
	bne	.L955
.L951:
	cmp	r9, r7
	bne	.L952
	b	.L942
.L973:
	mov	r1, #4
	bl	new_curseg
	b	.L939
.L976:
	cmp	r5, #3
	moveq	r7, r5
	beq	.L950
	mov	r7, #5
	b	.L949
.L955:
	ldr	r3, [sp, #28]
	mov	r1, r5
	mov	r0, r4
	str	r3, [r6, #60]
	bl	change_curseg.constprop.0
	b	.L939
.L950:
	add	r9, r7, #3
	mov	r10, #1
.L956:
	cmp	r5, r7
	mov	r3, r7
	mov	r2, #0
	add	r1, sp, #28
	mov	r0, r4
	add	r7, r7, #1
	beq	.L954
	str	r10, [sp]
	ldr	fp, [r8]
	blx	fp
	cmp	r0, #0
	bne	.L955
.L954:
	cmp	r7, r9
	bne	.L956
	b	.L942
	.fnend
	.size	allocate_segment_by_default, .-allocate_segment_by_default
	.align	2
	.global	allocate_new_segments
	.syntax unified
	.arm
	.fpu softvfp
	.type	allocate_new_segments, %function
allocate_new_segments:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	strd	r6, [sp, #8]
	mov	r6, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
.L985:
	ldr	ip, [r6, #28]
	mov	r2, #1
	mov	r1, r5
	mov	r0, r6
	ldr	r3, [ip, #12]
	ldr	ip, [ip]
	add	r3, r3, r5, lsl #6
	ldr	ip, [ip]
	ldr	r4, [r3, #48]
	ldr	r3, [ip]
	blx	r3
	cmn	r4, #1
	beq	.L978
	ldr	r2, [r6, #28]
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r4, r1
	beq	.L978
	ldr	r1, [r3, #112]
	cmp	r4, r1
	beq	.L978
	ldr	r1, [r3, #176]
	cmp	r4, r1
	beq	.L978
	ldr	r1, [r3, #240]
	cmp	r4, r1
	beq	.L978
	ldr	r1, [r3, #304]
	cmp	r4, r1
	beq	.L978
	ldr	r3, [r3, #368]
	cmp	r4, r3
	beq	.L978
	ldr	r7, [r2, #8]
	add	r7, r7, #36
	mov	r0, r7
	bl	mutex_lock
	ldr	r2, [r6, #28]
	add	r3, r4, r4, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L991
	ldr	r2, [r6, #500]
	mov	r1, r4
	mov	r0, r6
	cmp	r3, r2
	mov	r2, #6
	bcc	.L992
	bl	__remove_dirty_segment
.L983:
	mov	r0, r7
	bl	mutex_unlock
.L978:
	add	r5, r5, #1
	cmp	r5, #3
	bne	.L985
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L992:
	bl	__locate_dirty_segment
	b	.L983
.L991:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r4, r1
	beq	.L981
	ldr	r1, [r3, #112]
	cmp	r4, r1
	beq	.L981
	ldr	r1, [r3, #176]
	cmp	r4, r1
	beq	.L981
	ldr	r1, [r3, #240]
	cmp	r4, r1
	beq	.L981
	ldr	r1, [r3, #304]
	cmp	r4, r1
	beq	.L981
	ldr	r3, [r3, #368]
	cmp	r4, r3
	beq	.L981
	ldr	r8, [r2, #8]
	mov	r0, r4
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L981
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L981:
	mov	r1, r4
	mov	r2, #6
	mov	r0, r6
	bl	__remove_dirty_segment
	b	.L983
	.fnend
	.size	allocate_new_segments, .-allocate_new_segments
	.align	2
	.global	exist_trim_candidates
	.syntax unified
	.arm
	.fpu softvfp
	.type	exist_trim_candidates, %function
exist_trim_candidates:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	r10, r0
	mov	fp, r1
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	ldrd	r8, [r1, #8]
	ldr	r0, [r3]
	add	r0, r0, #40
	bl	mutex_lock
	ldrd	r4, [fp, #8]
	ldrd	r2, [fp, #16]
	cmp	r5, r3
	cmpeq	r4, r2
	bls	.L996
	b	.L994
.L999:
	ldr	r1, [fp, #8]
	ldr	r0, [fp, #12]
	ldrd	r2, [fp, #16]
	adds	r6, r1, #1
	adc	r7, r0, #0
	cmp	r7, r3
	cmpeq	r6, r2
	strd	r6, [fp, #8]
	bhi	.L994
.L996:
	mov	r2, #1
	mov	r1, fp
	mov	r0, r10
	bl	add_discard_addrs
	cmp	r0, #0
	mov	r4, r0
	beq	.L999
.L995:
	ldr	r3, [r10, #28]
	ldr	r0, [r3]
	add	r0, r0, #40
	bl	mutex_unlock
	mov	r0, r4
	strd	r8, [fp, #8]
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L994:
	mov	r4, #0
	b	.L995
	.fnend
	.size	exist_trim_candidates, .-exist_trim_candidates
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"Found FS corruption, run fsck to fix.\000"
	.align	2
.LC12:
	.ascii	"<4>\000"
	.text
	.align	2
	.global	f2fs_trim_fs
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_trim_fs, %function
f2fs_trim_fs:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r1, [r1]
	.pad #44
	sub	sp, sp, #44
	ldr	ip, [r0, #28]
	ldrd	r6, [r5, #8]
	ldr	r10, [r5, #4]
	lsr	r2, r1, #12
	ldr	lr, [r0, #496]
	ldr	r0, [ip, #16]
	lsr	r1, r6, #12
	ldr	fp, [ip, #28]
	orr	r2, r2, r10, lsl #20
	orr	r1, r1, r7, lsl #20
	lsr	r3, r10, #12
	lsr	r10, r7, #12
	adds	r1, r1, r2
	adc	r10, r10, r3
	add	r0, r0, fp, lsl lr
	subs	r8, r1, #1
	mov	r1, #0
	sbc	r9, r10, #0
	cmp	r1, r3
	cmpeq	r0, r2
	bls	.L1016
	ldr	r0, [r4, #480]
	mov	r1, #0
	cmp	r7, r1
	cmpeq	r6, r0
	bcc	.L1016
	mov	r0, #0
	mov	r1, #0
	strd	r0, [sp, #32]
	ldr	r0, [ip, #20]
	mov	r1, #0
	cmp	r1, r9
	cmpeq	r0, r8
	bcs	.L1009
	ldr	r6, [r4, #16]
	tst	r6, #4
	ubfx	r6, r6, #2, #1
	bne	.L1022
	cmp	r1, r3
	cmpeq	r0, r2
	ldr	r0, [ip, #16]
	movcs	r1, r6
	bcs	.L1005
	ldr	r6, [ip, #4]
	subs	r2, r2, r0
	rsb	r7, lr, #32
	sbc	r3, r3, #0
	lsr	r1, r2, lr
	orr	r1, r1, r3, lsl r7
	ldr	r2, [r6]
	sub	r6, lr, #32
	orr	r1, r1, r3, lsr r6
	sub	r1, r1, r2
.L1005:
	ldr	r2, [ip, #28]
	mov	r3, #0
	cmp	r3, r9
	add	r2, r0, r2, lsl lr
	cmpeq	r2, r8
	bls	.L1023
	ldr	r3, [ip, #4]
	subs	r8, r8, r0
	rsb	r2, lr, #32
	sbc	r9, r9, #0
	lsr	r6, r8, lr
	sub	lr, lr, #32
	orr	r6, r6, r9, lsl r2
	ldr	r3, [r3]
	orr	r6, r6, r9, lsr lr
	sub	r6, r6, r3
.L1007:
	ldr	r0, [r5, #16]
	mov	r3, #16
	ldr	ip, [r5, #20]
	str	r3, [sp]
	lsr	r0, r0, #12
	lsr	r3, ip, #12
	orr	r2, r0, ip, lsl #20
	orrs	r0, r2, r3
	moveq	r2, #1
	moveq	r3, #0
	cmp	r1, r6
	strd	r2, [sp, #24]
	bhi	.L1009
	mov	r7, #0
	add	r8, r4, #676
	b	.L1014
.L1010:
	ldr	r3, [r4, #28]
	ldr	lr, [r4, #496]
	ldr	r2, [r4, #504]
	ldr	r3, [r3, #48]
	mul	r3, r3, r2
	add	r1, r3, r1
	cmp	r0, r3, lsl lr
	sub	r3, r1, #1
	bcc	.L1012
	udiv	r0, r1, r2
	mls	r1, r2, r0, r1
	sub	r1, r3, r1
	cmp	r1, r6
	movcc	ip, r1
	movcs	ip, r6
.L1012:
	mov	r0, r8
	str	ip, [sp, #16]
	str	r7, [sp, #20]
	bl	mutex_lock
	mov	r1, sp
	mov	r0, r4
	bl	write_checkpoint
	mov	r9, r0
	mov	r0, r8
	bl	mutex_unlock
	cmp	r9, #0
	bne	.L1021
	bl	schedule
	ldr	r1, [sp, #16]
	add	r1, r1, #1
	cmp	r6, r1
	bcc	.L1021
.L1014:
	ldr	r0, [r4, #552]
	mov	ip, r6
	str	r1, [sp, #8]
	str	r7, [sp, #12]
	cmp	r0, #0
	bne	.L1010
.L1020:
	ldr	r1, [sp, #32]
	mov	r9, #0
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
.L1003:
	strd	r2, [r5, #8]
.L1000:
	mov	r0, r9
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1023:
	ldr	r6, [ip, #32]
	sub	r6, r6, #1
	b	.L1007
.L1009:
	mov	r2, #0
	mov	r3, r2
	mov	r9, r2
	b	.L1003
.L1021:
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
	b	.L1003
.L1022:
	movw	r2, #:lower16:.LC11
	movw	r1, #:lower16:.LC12
	ldr	r0, [r4]
	movt	r2, #:upper16:.LC11
	movt	r1, #:upper16:.LC12
	bl	f2fs_msg
	b	.L1020
.L1016:
	mvn	r9, #21
	b	.L1000
	.fnend
	.size	f2fs_trim_fs, .-f2fs_trim_fs
	.align	2
	.global	allocate_data_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	allocate_data_block, %function
allocate_data_block:
	.fnstart
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r6, r3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	ldrb	r0, [sp, #76]	@ zero_extendqisi2
	stmib	sp, {r1, r2}
	ldr	fp, [sp, #64]
	ldr	r7, [sp, #68]
	ldr	r9, [sp, #72]
	str	r0, [sp, #12]
	ldr	r0, [r4, #28]
	lsl	r10, r7, #6
	ldr	r3, [r0]
	ldr	r5, [r0, #12]
	add	r8, r3, #40
	str	r3, [sp, #16]
	add	r5, r5, r10
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r8
	bl	mutex_lock
	ldr	r2, [r4, #28]
	mov	r0, r4
	ldrh	r1, [r5, #52]
	ldr	ip, [r5, #48]
	ldr	lr, [r4, #496]
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #16]
	ldr	r3, [r3]
	add	r1, r1, r2
	add	r3, r3, ip
	add	r1, r1, r3, lsl lr
	str	r1, [r6]
	bl	f2fs_wait_discard_bio
	ldr	r3, [r4, #28]
	ldr	r1, [fp]	@ unaligned
	ldr	r2, [r3, #12]
	add	r2, r2, r10
	ldrh	r3, [r2, #52]
	ldr	r2, [r2, #20]
	rsb	r3, r3, r3, lsl #3
	add	r0, r2, r3
	str	r1, [r2, r3]	@ unaligned
	ldrb	r3, [fp, #6]	@ zero_extendqisi2
	ldrh	r2, [fp, #4]	@ unaligned
	strh	r2, [r0, #4]	@ unaligned
	strb	r3, [r0, #6]
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1043
	ldrh	r2, [r5, #52]
	add	r2, r2, #1
	strh	r2, [r5, #52]	@ movhi
.L1028:
	add	r3, r4, r3, lsl #2
	ldr	r2, [r3, #728]
	add	r2, r2, #1
	str	r2, [r3, #728]
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #500]
	ldr	r3, [r3, #12]
	add	r10, r3, r10
	ldrh	r3, [r10, #52]
	cmp	r3, r2
	bcc	.L1029
	ldr	r3, [sp, #16]
	mov	r2, #0
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r3]
	ldr	r3, [r3]
	blx	r3
.L1029:
	mov	r0, r4
	ldr	r2, [r6]
	ldr	r1, [sp, #8]
	bl	refresh_sit_entry
	mov	r0, r8
	bl	mutex_unlock
	ldr	r3, [sp, #4]
	cmp	r3, #0
	cmpne	r7, #2
	bgt	.L1044
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L1045
.L1032:
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L1044:
	mov	r0, r3
	ldr	r3, [r3, #4]
	ldr	r2, [r4, #28]
	ldrh	r6, [r5, #52]
	ldr	ip, [r5, #48]
	ldr	lr, [r3]
	ldr	r3, [r2, #4]
	ldr	r1, [r2, #16]
	ldr	r2, [lr, #28]
	ldr	r3, [r3]
	add	r6, r6, r1
	ldr	r1, [r4, #496]
	ldr	r2, [r2, #616]
	add	r3, r3, ip
	add	r6, r6, r3, lsl r1
	ldr	r7, [r2, #172]
	bl	page_address
	ldr	r1, [r7, #132]	@ unaligned
	ldr	r2, [r7]	@ unaligned
	ldr	r3, [r7, #4]	@ unaligned
	tst	r1, #64
	beq	.L1031
	ldr	r1, [r7, #164]	@ unaligned
	ldr	r1, [r7, r1]
	orr	r3, r1, r3
.L1031:
	str	r2, [r0, #4084]	@ unaligned
	str	r3, [r0, #4088]	@ unaligned
	ldr	r3, [sp, #12]
	str	r6, [r0, #4092]	@ unaligned
	cmp	r3, #0
	beq	.L1032
.L1045:
	ldrd	r2, [r9, #4]
	add	r6, r9, #36
	mov	r1, #1
	str	r6, [r9, #36]
	str	r6, [r9, #40]
	add	r2, r2, #8
	strb	r1, [r9, #52]
	mov	r1, #104
	ldr	r4, [r4, r2, lsl #2]
	mla	r4, r1, r3, r4
	add	r7, r4, #88
	mov	r0, r7
	bl	_raw_spin_lock
	mov	r0, r6
	add	r2, r4, #92
	ldr	r1, [r4, #96]
	bl	__list_add
	mov	r0, r7
	bl	_raw_spin_unlock
	b	.L1032
.L1043:
	ldr	r3, [r4, #28]
	ldrh	r0, [r5, #52]
	ldr	r2, [r5, #48]
	ldr	r1, [r3]
	add	r3, r2, r2, lsl #1
	add	r2, r0, #1
	str	r2, [sp, #20]
	ldr	r0, [r1, #24]
	ldr	r2, [r1, #60]
	add	r1, r0, #8
	add	r2, r2, r3, lsl #3
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #8]
	cmp	r1, r3
	add	fp, r3, #8
	movhi	ip, #0
	movls	ip, #1
	cmp	r1, r2
	mov	lr, fp
	movhi	r1, #0
	movls	r1, #1
	add	fp, r2, #8
	cmp	r0, lr
	orrcs	ip, ip, #1
	cmp	r0, fp
	orrcs	r1, r1, #1
	orr	fp, r3, r2
	orr	fp, r0, fp
	tst	fp, #7
	andeq	r1, r1, ip
	movne	r1, #0
	cmp	r1, #0
	beq	.L1026
	ldr	lr, [r3]
	ldr	ip, [r2]
	ldr	fp, [r3, #4]
	ldr	r1, [r2, #4]
	orr	ip, lr, ip
	orr	r1, r1, fp
	str	ip, [r0]
	str	r1, [r0, #4]
	ldr	lr, [r2, #8]
	ldr	ip, [r3, #8]
	ldr	fp, [r3, #12]
	ldr	r1, [r2, #12]
	orr	ip, lr, ip
	orr	r1, r1, fp
	str	ip, [r0, #8]
	str	r1, [r0, #12]
	ldr	lr, [r2, #16]
	ldr	ip, [r3, #16]
	ldr	fp, [r3, #20]
	ldr	r1, [r2, #20]
	orr	ip, lr, ip
	orr	r1, r1, fp
	str	ip, [r0, #16]
	str	r1, [r0, #20]
	ldr	lr, [r2, #24]
	ldr	ip, [r3, #24]
	ldr	fp, [r3, #28]
	ldr	r1, [r2, #28]
	orr	ip, lr, ip
	orr	r1, r1, fp
	str	ip, [r0, #24]
	str	r1, [r0, #28]
	ldr	lr, [r2, #32]
	ldr	ip, [r3, #32]
	ldr	fp, [r3, #36]
	ldr	r1, [r2, #36]
	orr	ip, lr, ip
	orr	r1, r1, fp
	str	ip, [r0, #32]
	str	r1, [r0, #36]
	ldr	ip, [r3, #40]
	ldr	fp, [r2, #44]
	ldr	r1, [r3, #44]
	ldr	lr, [r2, #40]
	orr	r1, r1, fp
	orr	ip, lr, ip
	str	ip, [r0, #40]
	str	r1, [r0, #44]
	ldr	lr, [r2, #48]
	ldr	ip, [r3, #48]
	ldr	fp, [r2, #52]
	ldr	r1, [r3, #52]
	orr	ip, lr, ip
	orr	r1, r1, fp
	str	ip, [r0, #48]
	str	r1, [r0, #52]
	ldr	r1, [r2, #56]
	ldr	ip, [r3, #56]
	ldr	r2, [r2, #60]
	ldr	r3, [r3, #60]
	orr	r1, ip, r1
	orr	r2, r3, r2
	str	r1, [r0, #56]
	str	r2, [r0, #60]
.L1027:
	ldr	r2, [sp, #20]
	ldr	r1, [r4, #500]
	bl	__find_rev_next_zero_bit
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	strh	r0, [r5, #52]	@ movhi
	b	.L1028
.L1026:
	ldr	ip, [r3]
	ldr	r1, [r2]
	orr	r1, r1, ip
	str	r1, [r0]
	ldr	ip, [r3, #4]
	ldr	r1, [r2, #4]
	orr	r1, r1, ip
	str	r1, [r0, #4]
	ldr	ip, [r3, #8]
	ldr	r1, [r2, #8]
	orr	r1, r1, ip
	str	r1, [r0, #8]
	ldr	ip, [r3, #12]
	ldr	r1, [r2, #12]
	orr	r1, r1, ip
	str	r1, [r0, #12]
	ldr	ip, [r3, #16]
	ldr	r1, [r2, #16]
	orr	r1, r1, ip
	str	r1, [r0, #16]
	ldr	ip, [r3, #20]
	ldr	r1, [r2, #20]
	orr	r1, r1, ip
	str	r1, [r0, #20]
	ldr	ip, [r3, #24]
	ldr	r1, [r2, #24]
	orr	r1, r1, ip
	str	r1, [r0, #24]
	ldr	ip, [r3, #28]
	ldr	r1, [r2, #28]
	orr	r1, r1, ip
	str	r1, [r0, #28]
	ldr	ip, [r3, #32]
	ldr	r1, [r2, #32]
	orr	r1, r1, ip
	str	r1, [r0, #32]
	ldr	ip, [r3, #36]
	ldr	r1, [r2, #36]
	orr	r1, r1, ip
	str	r1, [r0, #36]
	ldr	ip, [r3, #40]
	ldr	r1, [r2, #40]
	orr	r1, r1, ip
	str	r1, [r0, #40]
	ldr	ip, [r3, #44]
	ldr	r1, [r2, #44]
	orr	r1, r1, ip
	str	r1, [r0, #44]
	ldr	ip, [r3, #48]
	ldr	r1, [r2, #48]
	orr	r1, r1, ip
	str	r1, [r0, #48]
	ldr	ip, [r3, #52]
	ldr	r1, [r2, #52]
	orr	r1, r1, ip
	str	r1, [r0, #52]
	ldr	r1, [r2, #56]
	ldr	ip, [r3, #56]
	orr	r1, r1, ip
	str	r1, [r0, #56]
	ldr	r2, [r2, #60]
	ldr	r3, [r3, #60]
	orr	r3, r2, r3
	str	r3, [r0, #60]
	b	.L1027
	.fnend
	.size	allocate_data_block, .-allocate_data_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	do_write_page, %function
do_write_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r4, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r0, [r1]
	.pad #16
	sub	sp, sp, #16
	ldr	r3, [r0, #536]
	cmp	r3, #4
	beq	.L1047
	cmp	r3, #6
	beq	.L1048
	cmp	r3, #2
	beq	.L1080
	movw	r0, #:lower16:.LC0
	movw	r1, #2261
	movt	r0, #:upper16:.LC0
	mov	r6, #0
	bl	warn_slowpath_null
	ldr	r1, [r4]
	mov	r0, #2
	add	r1, r1, #16
	bl	_set_bit
	ldr	r0, [r4]
	ldr	r1, [r4, #28]
.L1050:
	mov	r3, #0
	str	r3, [r4, #8]
.L1063:
	add	r8, r4, #20
	mov	r7, #1
	ldr	r2, [r4, #24]
	b	.L1065
.L1081:
	ldr	r0, [r4]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #28]
	str	r2, [r4, #24]
.L1065:
	mov	r3, r8
	stm	sp, {r5, r6}
	str	r4, [sp, #8]
	str	r7, [sp, #12]
	bl	allocate_data_block
	mov	r0, r4
	bl	f2fs_submit_page_write
	cmn	r0, #11
	beq	.L1081
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1047:
	ldr	r6, [r1, #4]
	ldr	r1, [r1, #28]
	cmp	r6, #0
	bne	.L1051
	ldr	r3, [r1, #4]
	ldr	r3, [r3]
	ldrh	r3, [r3]
	and	r3, r3, #61440
	cmp	r3, #16384
	beq	.L1050
.L1070:
	mov	r6, #2
.L1066:
	mov	r3, #2
	str	r3, [r4, #8]
	b	.L1063
.L1080:
	ldr	r3, [r1, #4]
	ldr	r1, [r1, #28]
	cmp	r3, #0
	moveq	r6, #0
	movne	r6, #3
	b	.L1050
.L1048:
	ldr	r3, [r1, #4]
	ldr	r1, [r1, #28]
	cmp	r3, #0
	bne	.L1058
	ldr	r6, [r1]
	tst	r6, #256
	ubfx	r6, r6, #8, #1
	bne	.L1070
	ldr	r3, [r1, #4]
	ldr	r3, [r3]
	ldrb	r2, [r3, #340]	@ zero_extendqisi2
	tst	r2, #1
	bne	.L1070
	ldr	r3, [r3, #356]
	tst	r3, #16777216
	moveq	r6, #1
	bne	.L1050
.L1059:
	mov	r3, #1
	str	r3, [r4, #8]
	b	.L1063
.L1058:
	mov	r0, r1
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L1082
	movw	r2, #1022
	movw	r0, #2041
	ldr	r1, [r4, #28]
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r0
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L1079
	cmp	r3, r0
	bls	.L1061
	sub	r3, r3, #2032
	movw	r2, #36659
	sub	r3, r3, #10
	movt	r2, 10354
	movw	r0, #20580
	mul	r3, r2, r3
	movt	r0, 64
	cmp	r3, r0
	bls	.L1079
.L1061:
	mov	r0, r1
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	tst	r3, #1
	ldreq	r0, [r4]
	moveq	r6, #3
	ldreq	r1, [r4, #28]
	beq	.L1050
.L1056:
	mov	r6, #4
	ldr	r0, [r4]
	ldr	r1, [r4, #28]
	b	.L1059
.L1051:
	mov	r0, r1
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L1053
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L1055
	cmp	r3, r1
	bls	.L1053
	sub	r3, r3, #2032
	movw	r2, #36659
	sub	r3, r3, #10
	movt	r2, 10354
	movw	r1, #20580
	mul	r3, r2, r3
	movt	r1, 64
	cmp	r3, r1
	bls	.L1055
.L1053:
	ldr	r0, [r4, #28]
	bl	page_address
	ldr	r6, [r0, #4080]	@ unaligned
	and	r6, r6, #1
	cmp	r6, #0
	rsb	r6, r6, #5
	bne	.L1056
	ldr	r0, [r4]
	ldr	r1, [r4, #28]
	b	.L1066
.L1055:
	mov	r6, #5
	ldr	r0, [r4]
	ldr	r1, [r4, #28]
	b	.L1066
.L1079:
	mov	r6, #5
	ldr	r0, [r4]
	b	.L1066
.L1082:
	ldr	r1, [r4, #28]
	b	.L1061
	.fnend
	.size	do_write_page, .-do_write_page
	.align	2
	.global	write_meta_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_meta_page, %function
write_meta_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	ip, [r1, #8]
	mov	r2, #0
	str	lr, [sp, #4]
	ldr	lr, [r0, #28]
	.pad #56
	sub	sp, sp, #56
	mov	r3, #0
	mov	r4, #2
	str	r1, [sp, #28]
	strd	r2, [sp, #8]
	str	ip, [sp, #20]
	str	ip, [sp, #24]
	stm	sp, {r0, r4}
	mov	r0, r1
	strd	r2, [sp, #32]
	strd	r2, [sp, #40]
	strd	r2, [sp, #48]
	ldr	r2, [lr, #20]
	mov	r3, #624
	mov	lr, #1
	str	r3, [sp, #16]
	cmp	ip, r2
	str	lr, [sp, #12]
	movcs	r3, #592
	strcs	r3, [sp, #16]
	bl	test_set_page_writeback
	mov	r0, sp
	bl	f2fs_submit_page_write
	add	sp, sp, #56
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	write_meta_page, .-write_meta_page
	.align	2
	.global	write_node_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_node_page, %function
write_node_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, r0
	.save {lr}
	str	lr, [sp, #-4]!
	.pad #12
	sub	sp, sp, #12
	add	r0, sp, #1
	str	r2, [sp, #1]	@ unaligned
	strb	r3, [sp, #5]
	strb	r3, [sp, #6]
	strb	r3, [sp, #7]
	bl	do_write_page
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	write_node_page, .-write_node_page
	.align	2
	.global	write_data_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_data_page, %function
write_data_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #24]
	.pad #24
	sub	sp, sp, #24
	ldr	r6, [r1]
	cmp	r3, #0
	beq	.L1091
.L1089:
	mov	r0, r6
	add	r2, sp, #8
	ldr	r1, [r4, #12]
	bl	get_node_info
	ldrb	ip, [sp, #20]	@ zero_extendqisi2
	mov	r1, r5
	add	r0, sp, #1
	ldrh	r3, [r4, #16]
	ldr	r2, [r4, #12]
	str	r2, [sp, #1]	@ unaligned
	strb	ip, [sp, #5]
	strh	r3, [sp, #6]	@ unaligned
	bl	do_write_page
	ldr	r1, [r5, #20]
	mov	r0, r4
	bl	f2fs_update_data_blkaddr
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1091:
	movw	r0, #:lower16:.LC0
	movw	r1, #2378
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1089
	.fnend
	.size	write_data_page, .-write_data_page
	.align	2
	.global	rewrite_data_page
	.syntax unified
	.arm
	.fpu softvfp
	.type	rewrite_data_page, %function
rewrite_data_page:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	ip, [r0, #24]
	add	r1, r3, #736
	str	ip, [r0, #20]
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r1]
	add	r2, r2, #1
	strex	ip, r2, [r1]
	teq	ip, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	b	f2fs_submit_page_bio
	.fnend
	.size	rewrite_data_page, .-rewrite_data_page
	.align	2
	.global	__f2fs_replace_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	__f2fs_replace_block, %function
__f2fs_replace_block:
	.fnstart
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r6, r3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	ldr	r0, [r0, #28]
	ldrb	r3, [sp, #68]	@ zero_extendqisi2
	ldrb	r10, [sp, #64]	@ zero_extendqisi2
	str	r2, [sp]
	ldr	r8, [r0]
	str	r3, [sp, #8]
	sub	r3, r6, #1
	cmn	r3, #3
	mvnhi	r2, #23
	mvnhi	r7, #0
	str	r3, [sp, #4]
	mov	r3, r1
	bhi	.L1094
	ldr	ip, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	r1, [r4, #496]
	ldr	r7, [ip]
	sub	r2, r6, r2
	rsb	r7, r7, r2, lsr r1
	add	r2, r7, r7, lsl #1
	lsl	r2, r2, #3
.L1094:
	ldr	r1, [r8, #60]
	eor	ip, r10, #1
	cmp	r10, #0
	ldr	r5, [r0, #12]
	str	ip, [sp, #12]
	ldrb	r9, [r1, r2]	@ zero_extendqisi2
	and	r9, r9, #63
	bne	.L1095
	ldrh	r2, [r1, r2]
	bic	r2, r2, #63
	cmp	r2, #0
	beq	.L1096
.L1132:
	lsl	r2, r9, #6
.L1097:
	add	r5, r5, r2
	strd	r2, [sp, #12]
	mov	r0, r5
	add	r8, r8, #40
	bl	mutex_lock
	mov	r0, r8
	bl	mutex_lock
	ldr	fp, [r5, #48]
	ldrh	r3, [r5, #52]
	ldr	r2, [sp, #12]
	cmp	r7, fp
	str	r3, [sp, #20]
	ldr	r3, [sp, #16]
	beq	.L1109
	mov	r1, r9
	mov	r0, r4
	str	r7, [r5, #60]
	bl	change_curseg.constprop.0
	ldrd	r2, [sp, #12]
.L1109:
	ldr	ip, [sp, #8]
	eor	r0, r10, #1
	ldr	r1, [r4, #28]
	orrs	r0, r0, ip
	ldr	r0, [r4, #500]
	ldr	r1, [r1, #16]
	sub	r0, r0, #1
	sub	r1, r6, r1
	and	r1, r1, r0
	strh	r1, [r5, #52]	@ movhi
	ldr	r1, [r4, #28]
	ldr	r0, [r3]	@ unaligned
	ldr	r1, [r1, #12]
	add	r1, r1, r2
	ldrh	r2, [r1, #52]
	ldr	r1, [r1, #20]
	rsb	r2, r2, r2, lsl #3
	add	ip, r1, r2
	str	r0, [r1, r2]	@ unaligned
	ldrh	r2, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r2, [ip, #4]	@ unaligned
	strb	r3, [ip, #6]
	bne	.L1133
.L1110:
	ldr	ip, [sp]
	sub	r3, ip, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L1111
	ldr	r3, [r4, #28]
	mov	r7, ip
	ldr	r0, [r4, #496]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r1, [r1]
	sub	r2, ip, r2
	rsb	r1, r1, r2, lsr r0
	cmn	r1, #1
	bne	.L1134
.L1111:
	mov	r0, r4
	bl	locate_dirty_segment
	ldr	r3, [sp, #4]
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L1113
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #496]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r6, r6, r3
	rsb	r1, r1, r6, lsr r2
.L1113:
	mov	r0, r4
	bl	locate_dirty_segment
	mov	r1, fp
	mov	r0, r4
	bl	locate_dirty_segment
	cmp	r10, #0
	beq	.L1114
	ldr	r3, [r5, #48]
	cmp	r3, fp
	bne	.L1135
.L1115:
	ldr	r3, [sp, #20]
	strh	r3, [r5, #52]	@ movhi
.L1114:
	mov	r0, r8
	bl	mutex_unlock
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L1095:
	ldr	r2, [r5, #48]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #112]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #176]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #240]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #304]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #368]
	cmp	r2, r7
	movne	r2, #64
	movne	r9, #1
	bne	.L1097
	b	.L1132
.L1096:
	ldr	r2, [r5, #48]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #112]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #176]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #240]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #304]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [r5, #368]
	cmp	r2, r7
	beq	.L1132
	ldr	r2, [sp]
	cmp	r2, #0
	moveq	r2, #128
	movne	r2, #64
	moveq	r9, #2
	movne	r9, #1
	b	.L1097
.L1135:
	mov	r1, r9
	mov	r0, r4
	str	fp, [r5, #60]
	bl	change_curseg.constprop.0
	b	.L1115
.L1134:
	mvn	r2, #0
	mov	r1, ip
	mov	r0, r4
	bl	update_sit_entry
	ldr	r3, [r4, #28]
	ldr	r0, [r4, #496]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r1, [r1]
	sub	r2, r7, r2
	rsb	r1, r1, r2, lsr r0
	b	.L1111
.L1133:
	mov	r2, #1
	mov	r1, r6
	mov	r0, r4
	bl	update_sit_entry
	b	.L1110
	.fnend
	.size	__f2fs_replace_block, .-__f2fs_replace_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__revoke_inmem_pages, %function
__revoke_inmem_pages:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	r10, r1
	str	lr, [sp, #32]
	ldr	r6, [r1]
	.pad #92
	sub	sp, sp, #92
	ldr	r1, [r0, #28]
	str	r3, [sp, #12]
	cmp	r10, r6
	ldr	r5, [r6]
	ldr	r3, [r1, #616]
	str	r3, [sp, #20]
	beq	.L1166
	movw	r3, #:lower16:.LANCHOR0
	mov	r8, r2
	movt	r3, #:upper16:.LANCHOR0
	mov	r2, sp
	bic	r2, r2, #8128
	mov	r9, r0
	str	r3, [sp, #16]
	bic	r3, r2, #63
	mov	r7, r6
	str	r3, [sp, #28]
	mov	r3, #0
	str	r3, [sp, #24]
	b	.L1164
.L1194:
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L1189
.L1148:
	mov	r1, #28
	add	r0, sp, #60
	bl	__memzero
	mov	r3, #0
	add	r0, sp, #60
	str	r9, [sp, #60]
	mov	r2, #1
	str	r3, [sp, #64]
	str	r3, [sp, #68]
	str	r3, [sp, #72]
	ldr	r1, [r4, #8]
	bl	get_dnode_of_data
	cmp	r0, #0
	mvnne	r3, #10
	strne	r3, [sp, #24]
	bne	.L1155
	add	r2, sp, #44
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #72]
	bl	get_node_info
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r3, #1
	add	r1, sp, #37
	ldr	fp, [r6, #12]
	ldrh	ip, [sp, #76]
	str	r3, [sp]
	str	r3, [sp, #4]
	ldr	r0, [sp, #20]
	ldr	lr, [sp, #72]
	mov	r3, fp
	strb	r2, [sp, #41]
	ldr	r2, [sp, #84]
	str	lr, [sp, #37]	@ unaligned
	strh	ip, [sp, #42]	@ unaligned
	bl	__f2fs_replace_block
	add	r0, sp, #60
	mov	r1, fp
	bl	f2fs_update_data_blkaddr
	ldr	fp, [sp, #68]
	cmp	fp, #0
	beq	.L1156
	ldr	r3, [fp]
	tst	r3, #1
	beq	.L1190
.L1157:
	mov	r0, fp
	bl	unlock_page
	mov	r0, fp
	bl	put_page
	ldr	r0, [sp, #64]
	cmp	r0, #0
	beq	.L1155
	ldr	r3, [sp, #68]
	cmp	r0, r3
	bne	.L1165
.L1155:
	mov	r1, r4
	mov	r0, #3
	bl	_clear_bit
.L1161:
	mov	r3, #0
	mov	r1, r4
	mov	r0, #11
	str	r3, [r4, #28]
	bl	_clear_bit
	cmp	r4, #0
	beq	.L1162
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1191
.L1163:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1162:
	mov	r0, r7
	bl	list_del
	ldr	r3, [sp, #16]
	mov	r1, r6
	ldr	r0, [r3, #12]
	bl	kmem_cache_free
	ldr	r3, [r9, #28]
	ldr	r3, [r3, #616]
	add	r2, r3, #580
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r5, r10
	mov	r7, r5
	ldr	r3, [r5]
	mov	r6, r5
	beq	.L1136
	mov	r5, r3
.L1164:
	cmp	r8, #0
	ldr	r4, [r6, #8]
	beq	.L1139
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L1192
.L1139:
	mov	r1, r4
	mov	r0, #0
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1193
.L1145:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L1194
.L1146:
	cmp	r8, #0
	beq	.L1161
	b	.L1155
.L1166:
	mov	r3, #0
	str	r3, [sp, #24]
.L1136:
	ldr	r0, [sp, #24]
	add	sp, sp, #92
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1193:
	mov	r0, r4
	bl	__lock_page
	b	.L1145
.L1156:
	ldr	r0, [sp, #64]
	cmp	r0, #0
	beq	.L1155
.L1165:
	bl	put_page
	b	.L1155
.L1191:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1163
.L1192:
	ldr	r1, [sp, #28]
	ldr	r2, [r1, #4]
	add	r2, r2, #1
	str	r2, [r1, #4]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L1144
.L1143:
	mov	r2, #6
	mov	r1, r4
	ldr	r3, [fp]
	ldr	r0, [fp, #4]
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L1143
.L1144:
	ldr	r2, [sp, #28]
	ldr	r3, [r2, #4]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r2]
	tst	r3, #2
	beq	.L1139
	bl	preempt_schedule
	b	.L1139
.L1189:
	ldr	r1, [sp, #28]
	ldr	r2, [r1, #4]
	add	r2, r2, #1
	str	r2, [r1, #4]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L1153
.L1152:
	mov	r2, #8
	mov	r1, r4
	ldr	r3, [fp]
	ldr	r0, [fp, #4]
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L1152
.L1153:
	ldr	r2, [sp, #28]
	ldr	r3, [r2, #4]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r2]
	tst	r3, #2
	beq	.L1148
	bl	preempt_schedule
	b	.L1148
.L1190:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [fp, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1157
	.fnend
	.size	__revoke_inmem_pages, .-__revoke_inmem_pages
	.align	2
	.global	drop_inmem_pages
	.syntax unified
	.arm
	.fpu softvfp
	.type	drop_inmem_pages, %function
drop_inmem_pages:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	add	r5, r0, #432
	mov	r4, r0
	mov	r0, r5
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	mutex_lock
	mov	r3, #0
	add	r1, r4, #424
	mov	r2, #1
	mov	r0, r4
	bl	__revoke_inmem_pages
	mov	r0, r5
	bl	mutex_unlock
	ldr	r3, [r4, #356]
	tst	r3, #32768
	bne	.L1201
.L1196:
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #616]
	add	r2, r3, #788
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1201:
	add	r1, r4, #356
	mov	r0, #15
	bl	_clear_bit
	b	.L1196
	.fnend
	.size	drop_inmem_pages, .-drop_inmem_pages
	.align	2
	.global	commit_inmem_pages
	.syntax unified
	.arm
	.fpu softvfp
	.type	commit_inmem_pages, %function
commit_inmem_pages:
	.fnstart
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r1, #1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #100
	sub	sp, sp, #100
	add	r2, sp, #32
	str	r2, [sp, #32]
	add	r2, r0, #356
	ldr	r0, [r3, #616]
	str	r2, [sp, #24]
	add	r2, sp, #32
	str	r2, [sp, #36]
	add	r3, r0, #208
	mov	r5, r3
	str	r3, [sp, #20]
	bl	f2fs_balance_fs
	mov	r0, r5
	bl	down_read
	ldr	r3, [r4, #356]
	tst	r3, #65536
	beq	.L1248
.L1203:
	add	r3, r4, #432
	mov	r8, r4
	mov	r0, r3
	str	r3, [sp, #16]
	bl	mutex_lock
	ldr	r3, [r4, #28]
	mov	r2, #52
	mov	r1, #0
	add	r0, sp, #44
	ldr	r3, [r3, #616]
	mov	r5, r3
	str	r3, [sp, #28]
	bl	memset
	ldr	r6, [r8, #424]!
	mov	r2, #1
	mov	r3, #80
	str	r5, [sp, #40]
	strd	r2, [sp, #52]
	cmp	r6, r8
	mov	r10, r6
	ldr	fp, [r6]
	beq	.L1228
	mov	r3, sp
	bic	r9, r3, #8128
	mvn	r3, #0
	bic	r9, r9, #63
	str	r3, [sp, #12]
	b	.L1222
.L1206:
	mov	r0, r5
	mov	r6, fp
	bl	unlock_page
	mov	r0, r10
	bl	__list_del_entry
	add	r2, sp, #32
	mov	r0, r10
	ldr	r1, [sp, #36]
	bl	__list_add
	cmp	fp, r8
	mov	r10, fp
	ldr	fp, [fp]
	beq	.L1249
.L1222:
	ldr	r5, [r6, #8]
	mov	r0, #0
	mov	r1, r5
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1250
.L1205:
	ldr	r2, [r5, #4]
	ldr	r3, [r4, #32]
	cmp	r2, r3
	bne	.L1206
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L1251
.L1208:
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #8192
	bne	.L1252
.L1215:
	mov	r0, r5
	bl	clear_page_dirty_for_io
	cmp	r0, #0
	beq	.L1217
	ldrh	r2, [r4]
	and	r3, r2, #61440
	and	r2, r2, #53248
	cmp	r3, #16384
	cmpne	r2, #32768
	bne	.L1218
	add	r2, r4, #376
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r1, [r4, #28]
	cmp	r3, #16384
	movne	r2, #568
	moveq	r2, #564
	ldr	r3, [r1, #616]
	add	r3, r3, r2
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L1218:
	mov	r0, r4
	bl	remove_dirty_inode
.L1217:
	mov	r2, #0
	mov	r3, #1
	add	r0, sp, #40
	str	r2, [sp, #64]
	str	r5, [sp, #68]
	str	r2, [sp, #72]
	str	r3, [sp, #88]
	bl	do_write_data_page
	subs	r7, r0, #0
	bne	.L1253
	ldr	r3, [sp, #64]
	str	r3, [r6, #12]
	ldr	r3, [r5, #8]
	str	r3, [sp, #12]
	b	.L1206
.L1252:
	ldmib	r5, {r1, r3}
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, [r1, #28]
	ldr	r0, [r0, #616]
	str	r2, [sp]
	bl	f2fs_submit_merged_write_cond
	ldr	r3, [r5]
	tst	r3, #8192
	beq	.L1215
	mov	r1, #13
	mov	r0, r5
	bl	wait_on_page_bit
	b	.L1215
.L1250:
	mov	r0, r5
	bl	__lock_page
	b	.L1205
.L1249:
	ldr	r3, [sp, #12]
	cmn	r3, #1
	beq	.L1228
	mov	r2, #0
	mov	r1, r4
	ldr	r0, [sp, #28]
	str	r2, [sp]
	bl	f2fs_submit_merged_write_cond
.L1228:
	mov	r3, #0
	add	r1, sp, #32
	mov	r2, r3
	mov	r0, r4
	mov	r7, r3
	bl	__revoke_inmem_pages
.L1225:
	ldr	r0, [sp, #16]
	bl	mutex_unlock
	ldr	r3, [r4, #356]
	tst	r3, #65536
	bne	.L1254
.L1226:
	ldr	r0, [sp, #20]
	bl	up_read
	mov	r0, r7
	add	sp, sp, #100
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1251:
	ldr	r2, [r9, #4]
	add	r2, r2, #1
	str	r2, [r9, #4]
	ldr	r7, [r3, #16]
	cmp	r7, #0
	beq	.L1213
.L1212:
	mov	r2, #5
	mov	r1, r5
	ldr	r3, [r7]
	ldr	r0, [r7, #4]
	blx	r3
	ldr	r3, [r7, #8]!
	cmp	r3, #0
	bne	.L1212
.L1213:
	ldr	r3, [r9, #4]
	sub	r3, r3, #1
	str	r3, [r9, #4]
	ldr	r3, [r9]
	tst	r3, #2
	beq	.L1208
	bl	preempt_schedule
	b	.L1208
.L1248:
	add	r1, r4, #356
	mov	r0, #16
	bl	_set_bit
	b	.L1203
.L1254:
	mov	r0, #16
	ldr	r1, [sp, #24]
	bl	_clear_bit
	b	.L1226
.L1253:
	mov	r0, r5
	bl	unlock_page
	ldr	r3, [sp, #12]
	cmn	r3, #1
	bne	.L1255
.L1221:
	add	r1, sp, #32
	mov	r3, #1
	mov	r2, #0
	mov	r0, r4
	bl	__revoke_inmem_pages
	mov	ip, r0
	mov	r3, #0
	cmp	ip, r3
	mov	r1, r8
	mov	r2, #1
	mov	r0, r4
	movne	r7, ip
	bl	__revoke_inmem_pages
	b	.L1225
.L1255:
	mov	r2, #0
	mov	r1, r4
	ldr	r0, [sp, #28]
	str	r2, [sp]
	bl	f2fs_submit_merged_write_cond
	b	.L1221
	.fnend
	.size	commit_inmem_pages, .-commit_inmem_pages
	.align	2
	.global	f2fs_replace_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_replace_block, %function
f2fs_replace_block:
	.fnstart
	@ args = 12, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	mov	r5, r3
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	.pad #16
	sub	sp, sp, #16
	ldr	r1, [r1, #12]
	ldrb	ip, [sp, #36]	@ zero_extendqisi2
	ldrb	r6, [sp, #40]	@ zero_extendqisi2
	ldrb	lr, [sp, #32]	@ zero_extendqisi2
	str	ip, [sp]
	ldrh	ip, [r4, #16]
	str	r6, [sp, #4]
	str	r1, [sp, #9]	@ unaligned
	add	r1, sp, #9
	strb	lr, [sp, #13]
	strh	ip, [sp, #14]	@ unaligned
	bl	__f2fs_replace_block
	mov	r1, r5
	mov	r0, r4
	bl	f2fs_update_data_blkaddr
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	f2fs_replace_block, .-f2fs_replace_block
	.align	2
	.global	f2fs_wait_on_page_writeback
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_wait_on_page_writeback, %function
f2fs_wait_on_page_writeback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	tst	r3, #8192
	bxeq	lr
	mov	ip, r1
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	str	lr, [sp, #8]
	ldmib	r0, {r1, r3}
	.pad #12
	sub	sp, sp, #12
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, [r1, #28]
	ldr	r0, [r0, #616]
	str	ip, [sp]
	bl	f2fs_submit_merged_write_cond
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1272
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1272:
	mov	r0, r4
	mov	r1, #13
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	wait_on_page_bit
	.fnend
	.size	f2fs_wait_on_page_writeback, .-f2fs_wait_on_page_writeback
	.align	2
	.global	f2fs_wait_on_encrypted_page_writeback
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_wait_on_encrypted_page_writeback, %function
f2fs_wait_on_encrypted_page_writeback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r1, #1
	cmn	r3, #3
	bxhi	lr
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r3, [r0, #184]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r3, #32]
	bl	find_lock_page
	subs	r4, r0, #0
	beq	.L1273
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1294
.L1278:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1295
.L1280:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	b	put_page
.L1273:
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L1294:
	ldmib	r4, {r1, r3}
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, [r1, #28]
	ldr	r0, [r0, #616]
	str	r2, [sp]
	bl	f2fs_submit_merged_write_cond
	ldr	r3, [r4]
	tst	r3, #8192
	beq	.L1278
	mov	r1, #13
	mov	r0, r4
	bl	wait_on_page_bit
	b	.L1278
.L1295:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1280
	.fnend
	.size	f2fs_wait_on_encrypted_page_writeback, .-f2fs_wait_on_encrypted_page_writeback
	.align	2
	.global	write_data_summaries
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_data_summaries, %function
write_data_summaries:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #172]
	.pad #12
	sub	sp, sp, #12
	ldr	r4, [r3, #132]	@ unaligned
	ands	r4, r4, #4
	bne	.L1326
.L1297:
	add	r2, r4, r7
	mov	r1, r4
	mov	r0, r8
	add	r4, r4, #1
	bl	write_current_sum_page
	cmp	r4, #3
	bne	.L1297
.L1296:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1326:
	bl	grab_meta_page
	mov	r5, r0
	movw	r4, #507
	bl	page_address
	ldr	r3, [r8, #28]
	movw	r1, #:lower16:.LC3
	mov	r2, r4
	movt	r1, #:upper16:.LC3
	mov	r6, r0
	add	r7, r7, #1
	str	r1, [sp, #4]
	mov	r1, #0
	ldr	r3, [r3, #12]
	str	r1, [sp]
	ldr	r1, [r3, #40]
	bl	memcpy
	ldr	r3, [r8, #28]
	add	r0, r6, r4
	mov	r2, r4
	ldr	r3, [r3, #12]
	ldr	r1, [r3, #168]
	bl	memcpy
	movw	r1, #1014
.L1304:
	ldr	r0, [sp]
	ldr	r2, [r8, #28]
	ldr	r3, [r8, #172]
	ldr	r2, [r2, #12]
	add	r3, r3, r0
	ldrb	r3, [r3, #176]	@ zero_extendqisi2
	add	r10, r2, r0, lsl #6
	cmp	r3, #1
	ldreq	r9, [r8, #500]
	ldrhne	r9, [r10, #52]
	uxtheq	r9, r9
	cmp	r9, #0
	beq	.L1300
	mov	r4, #0
	b	.L1303
.L1301:
	ldr	r3, [r10, #20]
	movw	lr, #4091
	cmp	ip, lr
	ldr	ip, [r3, r0]	@ unaligned
	add	r3, r3, r0
	str	ip, [r6, r1]	@ unaligned
	ldrh	r0, [r3, #4]	@ unaligned
	mov	r1, fp
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r0, [r2, #4]	@ unaligned
	strb	r3, [r2, #6]
	bls	.L1302
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1327
.L1308:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	mov	r5, #0
	bl	put_page
	mov	r1, fp
.L1302:
	add	r4, r4, #1
	cmp	r4, r9
	beq	.L1300
.L1303:
	cmp	r5, #0
	rsb	r0, r4, r4, lsl #3
	add	ip, r1, #14
	add	r2, r6, r1
	add	fp, r1, #7
	bne	.L1301
	mov	r1, r7
	mov	r0, r8
	bl	grab_meta_page
	mov	r5, r0
	add	r7, r7, #1
	bl	page_address
	ldr	r3, [r10, #20]
	rsb	r2, r4, r4, lsl #3
	mov	r6, r0
	add	r4, r4, #1
	cmp	r4, r9
	mov	r1, #7
	ldr	r0, [r3, r2]	@ unaligned
	add	r3, r3, r2
	str	r0, [r6]	@ unaligned
	ldrh	r2, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r2, [r6, #4]	@ unaligned
	strb	r3, [r6, #6]
	bne	.L1303
.L1300:
	ldr	r3, [sp]
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [sp]
	bne	.L1304
	cmp	r5, #0
	beq	.L1296
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1328
.L1306:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	put_page
.L1327:
	movw	r1, #1740
	ldr	r0, [sp, #4]
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1308
.L1328:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1306
	.fnend
	.size	write_data_summaries, .-write_data_summaries
	.align	2
	.global	write_node_summaries
	.syntax unified
	.arm
	.fpu softvfp
	.type	write_node_summaries, %function
write_node_summaries:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	mov	r5, r0
	mov	r1, #3
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	write_current_sum_page
	add	r2, r4, #1
	mov	r0, r5
	mov	r1, #4
	bl	write_current_sum_page
	add	r2, r4, #2
	mov	r0, r5
	ldrd	r4, [sp]
	mov	r1, #5
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	write_current_sum_page
	.fnend
	.size	write_node_summaries, .-write_node_summaries
	.align	2
	.global	lookup_journal_in_cursum
	.syntax unified
	.arm
	.fpu softvfp
	.type	lookup_journal_in_cursum, %function
lookup_journal_in_cursum:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	mov	ip, r0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bne	.L1332
	ldrh	r6, [r0]	@ unaligned
	cmp	r6, #0
	mov	r4, r6
	mov	r0, r6
	beq	.L1333
	mov	r5, #13
	b	.L1335
.L1370:
	add	r1, r1, #1
	cmp	r1, r4
	beq	.L1333
.L1335:
	mla	lr, r5, r1, ip
	ldr	lr, [lr, #2]	@ unaligned
	cmp	lr, r2
	bne	.L1370
.L1338:
	mov	r0, r1
	b	.L1331
.L1332:
	cmp	r1, #1
	bne	.L1346
	ldrh	r0, [r0]	@ unaligned
	cmp	r0, #0
	beq	.L1336
	ldr	lr, [ip, #2]	@ unaligned
	cmp	r2, lr
	beq	.L1341
	cmp	r0, #1
	beq	.L1336
	ldr	lr, [ip, #80]	@ unaligned
	cmp	lr, r2
	beq	.L1338
	cmp	r0, #2
	beq	.L1336
	ldr	r1, [ip, #158]	@ unaligned
	cmp	r1, r2
	beq	.L1343
	cmp	r0, #3
	beq	.L1336
	ldr	r1, [ip, #236]	@ unaligned
	cmp	r2, r1
	beq	.L1344
	cmp	r0, #4
	beq	.L1336
	ldr	r1, [ip, #314]	@ unaligned
	cmp	r2, r1
	beq	.L1345
	cmp	r0, #5
	beq	.L1336
	ldr	r1, [ip, #392]	@ unaligned
	cmp	r2, r1
	moveq	r0, #5
	beq	.L1331
.L1336:
	cmp	r3, #0
	cmpne	r0, #6
	beq	.L1346
	add	r3, r0, #1
	strh	r3, [ip]	@ unaligned
.L1331:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1333:
	cmp	r3, #0
	cmpne	r4, #38
	beq	.L1346
	add	r6, r6, #1
	strh	r6, [ip]	@ unaligned
	b	.L1331
.L1346:
	mvn	r0, #0
	b	.L1331
.L1341:
	mov	r0, #0
	b	.L1331
.L1343:
	mov	r0, #2
	b	.L1331
.L1344:
	mov	r0, #3
	b	.L1331
.L1345:
	mov	r0, #4
	b	.L1331
	.fnend
	.size	lookup_journal_in_cursum, .-lookup_journal_in_cursum
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"/home/jprim/hlte/lolz/fs/f2fs/segment.h\000"
	.text
	.align	2
	.global	flush_sit_entries
	.syntax unified
	.arm
	.fpu softvfp
	.type	flush_sit_entries, %function
flush_sit_entries:
	.fnstart
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #92
	sub	sp, sp, #92
	str	r1, [sp, #16]
	str	r3, [sp, #72]
	ldr	r4, [r3]
	ldr	r3, [r3, #12]
	add	r0, r4, #40
	str	r4, [sp, #8]
	ldr	r7, [r4, #28]
	str	r3, [sp, #60]
	ldr	r3, [r3, #168]
	str	r0, [sp, #68]
	mov	r9, r3
	bl	mutex_lock
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L1498
.L1373:
	ldr	r2, [sp, #16]
	ldr	r3, [r2]
	tst	r3, #16
	bne	.L1499
.L1418:
	ldr	r0, [sp, #68]
	bl	mutex_unlock
	ldr	r3, [r8, #28]
	ldr	r7, [r3, #8]
	add	fp, r7, #36
	mov	r0, fp
	bl	mutex_lock
	ldr	r3, [r8, #28]
	ldr	r0, [r7, #32]
	ldr	r1, [r3, #32]
	bl	_find_first_bit_le
	ldr	r3, [r8, #28]
	mov	r4, r0
	ldr	r2, [r3, #32]
	cmp	r2, r0
	bhi	.L1421
	b	.L1425
.L1423:
	mov	r0, r9
	bl	_raw_spin_unlock
	ldr	r3, [r8, #28]
	add	r2, r4, #1
	ldr	r0, [r7, #32]
	ldr	r1, [r3, #32]
	bl	_find_next_bit_le
	ldr	r3, [r8, #28]
	mov	r4, r0
	ldr	r2, [r3, #32]
	cmp	r0, r2
	bcs	.L1425
.L1421:
	ldr	r5, [r3, #4]
	ldr	r6, [r8, #504]
	add	r9, r5, #12
	mov	r0, r9
	bl	_raw_spin_lock
	mov	r0, r4
	ldr	r1, [r5, #16]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1423
	udiv	r10, r4, r6
	ldr	r3, [r5, #4]
	ldr	r0, [r5, #16]
	add	r3, r3, #1
	str	r3, [r5, #4]
	ldr	r1, [r8, #504]
	mul	r6, r10, r6
	mov	r2, r6
	add	r1, r6, r1
	bl	_find_next_bit_le
	ldr	r2, [r8, #504]
	add	r6, r6, r2
	cmp	r0, r6
	bcc	.L1423
	mov	r0, r10
	ldr	r1, [r5, #20]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1423
	ldr	r3, [r5, #8]
	add	r3, r3, #1
	str	r3, [r5, #8]
	b	.L1423
.L1425:
	mov	r0, fp
	add	sp, sp, #92
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L1499:
	ldrd	r4, [r2, #8]
	ldrd	r2, [r2, #16]
	cmp	r5, r3
	cmpeq	r4, r2
	ldrls	r6, [sp, #16]
	bhi	.L1420
.L1419:
	mov	r2, #0
	mov	r1, r6
	mov	r0, r8
	bl	add_discard_addrs
	ldr	r1, [r6, #8]
	ldr	r0, [r6, #12]
	ldrd	r2, [r6, #16]
	adds	r10, r1, #1
	adc	fp, r0, #0
	cmp	fp, r3
	cmpeq	r10, r2
	strd	r10, [r6, #8]
	bls	.L1419
.L1420:
	ldr	r3, [sp, #16]
	strd	r4, [r3, #8]
	b	.L1418
.L1498:
	ldr	r5, [r8, #28]
	ldr	r1, [r5, #32]
	ldr	r3, [r5], #52
	ldr	r4, [r3, #28]
	mov	r0, r4
	bl	_find_first_bit_le
	ldr	r3, [r8, #28]
	mov	r6, r0
	ldr	r2, [r3, #32]
	cmp	r2, r0
	bls	.L1374
.L1375:
	mov	r0, r6
	mov	r1, r5
	bl	add_sit_entry
	ldr	r3, [r8, #28]
	add	r2, r6, #1
	mov	r0, r4
	ldr	r1, [r3, #32]
	bl	_find_next_bit_le
	ldr	r3, [r8, #28]
	mov	r6, r0
	ldr	r2, [r3, #32]
	cmp	r0, r2
	bcc	.L1375
.L1374:
	ldr	r1, [sp, #8]
	ldrh	r2, [r9]	@ unaligned
	ldr	r1, [r1, #32]
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1500
.L1376:
	ldr	r2, [sp, #72]
	ldr	r3, [r2, #52]
	add	r2, r2, #52
	cmp	r2, r3
	str	r3, [sp, #12]
	str	r3, [sp, #44]
	ldr	r3, [r3]
	str	r2, [sp, #48]
	str	r3, [sp, #40]
	beq	.L1416
	movw	r0, #4767
	movw	r3, #:lower16:.LANCHOR0
	str	r8, [sp, #4]
	movt	r0, 10724
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LC3
	movw	r1, #:lower16:.LC0
	movt	r2, #:upper16:.LC3
	movt	r1, #:upper16:.LC0
	str	r3, [sp, #52]
	str	r0, [sp, #56]
	ldr	r0, [sp, #12]
	mov	r3, #1
	mov	fp, r9
	str	r3, [sp, #20]
	str	r1, [sp, #64]
	str	r2, [sp, #76]
.L1415:
	ldr	r3, [sp, #4]
	ldr	r4, [r0, #8]
	ldr	r3, [r3, #28]
	add	r1, r4, #55
	ldr	r2, [r3, #32]
	cmp	r1, r2
	movcs	r6, r2
	ldr	r2, [sp, #20]
	movcc	r6, r1
	str	r6, [sp, #24]
	cmp	r2, #0
	beq	.L1386
	ldrh	r2, [fp]	@ unaligned
	ldr	r1, [r0, #12]
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1386
	ldr	r3, [sp, #60]
	add	r5, r3, #152
	mov	r0, r5
	bl	down_write
	mov	r2, r4
	mov	r1, r6
	mov	r0, r7
	bl	_find_next_bit_le
	cmp	r6, r0
	mov	r4, r0
	movhi	r3, #0
	strhi	r3, [sp, #28]
	strhi	r3, [sp, #36]
	bls	.L1388
.L1408:
	ldr	r3, [sp, #4]
	add	r9, r4, r4, lsl #1
	ldr	r2, [sp, #16]
	lsl	r8, r9, #3
	ldr	r3, [r3, #28]
	ldr	r2, [r2]
	ldr	r3, [r3]
	ands	r2, r2, #16
	ldr	r6, [r3, #60]
	add	r5, r6, r8
	beq	.L1501
.L1397:
	ldr	r3, [sp, #20]
	cmp	r3, #0
	beq	.L1398
	ldrh	r0, [fp]	@ unaligned
	cmp	r0, #0
	beq	.L1402
	ldr	r3, [fp, #2]	@ unaligned
	cmp	r3, r4
	beq	.L1435
	cmp	r0, #1
	beq	.L1402
	ldr	r3, [fp, #80]	@ unaligned
	cmp	r4, r3
	beq	.L1436
	cmp	r0, #2
	beq	.L1402
	ldr	r3, [fp, #158]	@ unaligned
	cmp	r4, r3
	beq	.L1437
	cmp	r0, #3
	beq	.L1402
	ldr	r3, [fp, #236]	@ unaligned
	cmp	r4, r3
	beq	.L1438
	cmp	r0, #4
	beq	.L1402
	ldr	r3, [fp, #314]	@ unaligned
	cmp	r4, r3
	beq	.L1439
	cmp	r0, #5
	beq	.L1402
	ldr	r3, [fp, #392]	@ unaligned
	cmp	r3, r4
	moveq	r0, #5
	beq	.L1400
	cmp	r0, #6
	beq	.L1502
.L1402:
	mov	r3, #78
	add	r2, r0, #1
	mul	r3, r3, r0
	strh	r2, [fp]	@ unaligned
	add	r3, r3, #8
.L1401:
	mov	ip, #78
	add	r3, fp, r3
	mov	r1, r3
	mla	ip, ip, r0, fp
	str	r3, [sp, #32]
	str	r4, [ip, #2]	@ unaligned
	ldrb	lr, [r6, r9, lsl #3]	@ zero_extendqisi2
	ldrh	r2, [r6, r8]
	and	lr, lr, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, lr, lsl #10
	strh	r2, [ip, #6]	@ unaligned
	ldr	r2, [r5, #4]
	add	r3, r2, #64
.L1403:
	ldr	r10, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r9, [r2, #-12]	@ unaligned
	ldr	lr, [r2, #-8]	@ unaligned
	ldr	ip, [r2, #-4]	@ unaligned
	cmp	r2, r3
	str	r10, [r1, #-16]	@ unaligned
	str	r9, [r1, #-12]	@ unaligned
	str	lr, [r1, #-8]	@ unaligned
	str	ip, [r1, #-4]	@ unaligned
	bne	.L1403
	ldr	r3, [sp, #32]
	ldr	r2, [r5, #8]
	add	r10, r3, #64
.L1404:
	ldr	r9, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-12]	@ unaligned
	ldr	ip, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r10
	str	r9, [r2, #-16]	@ unaligned
	str	lr, [r2, #-12]	@ unaligned
	str	ip, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1404
	ldrh	r3, [r6, r8]
	mov	r1, #78
	ldrh	r2, [r5, #2]
	mla	r0, r1, r0, fp
	ldr	ip, [r5, #16]
	ldr	r1, [r5, #20]
	lsr	r3, r3, #6
	bfi	r2, r3, #0, #10
	strh	r2, [r5, #2]	@ movhi
	str	ip, [r0, #72]	@ unaligned
	str	r1, [r0, #76]	@ unaligned
.L1405:
	cmp	r4, #0
	add	r3, r4, #31
	ldr	r5, [sp, #24]
	movge	r3, r4
	rsbs	r2, r4, #0
	asr	r3, r3, #5
	and	r2, r2, #31
	and	lr, r4, #31
	ldr	ip, [r7, r3, lsl #2]
	rsbpl	lr, r2, #0
	add	r2, r4, #1
	mov	r4, #1
	mov	r0, r7
	mov	r1, r5
	bic	ip, ip, r4, lsl lr
	str	ip, [r7, r3, lsl #2]
	ldr	ip, [sp, #8]
	ldr	r3, [ip, #32]
	sub	r3, r3, #1
	str	r3, [ip, #32]
	ldr	ip, [sp, #12]
	ldr	r3, [ip, #12]
	sub	r3, r3, #1
	str	r3, [ip, #12]
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r4, r0
	bhi	.L1408
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L1503
.L1396:
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L1410
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1504
.L1411:
	ldr	r4, [sp, #36]
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1410:
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L1505
.L1412:
	ldr	r4, [sp, #40]
	ldr	r0, [sp, #44]
	str	r4, [sp, #44]
	bl	list_del
	ldr	r1, [sp, #12]
	ldr	r3, [sp, #52]
	ldr	r0, [r3, #4]
	bl	kmem_cache_free
	ldr	r3, [sp, #48]
	cmp	r4, r3
	ldr	r3, [r4]
	beq	.L1494
.L1413:
	ldr	r2, [sp, #40]
	mov	r0, r2
	str	r2, [sp, #12]
	str	r3, [sp, #40]
	b	.L1415
.L1398:
	ldr	r3, [sp, #8]
	ldrb	ip, [r6, r9, lsl #3]	@ zero_extendqisi2
	ldrh	r2, [r6, r8]
	ldr	r1, [r3, #36]
	mov	r3, #74
	and	ip, ip, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, ip, lsl #10
	udiv	r0, r4, r1
	mls	r1, r1, r0, r4
	mul	r3, r3, r1
	str	r1, [sp, #32]
	ldr	r1, [sp, #28]
	strh	r2, [r1, r3]	@ unaligned
	ldr	r2, [r5, #4]
	add	r3, r3, #2
	add	r3, r1, r3
	mov	r1, r3
	add	r0, r2, #64
.L1406:
	ldr	r10, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r9, [r2, #-12]	@ unaligned
	ldr	lr, [r2, #-8]	@ unaligned
	ldr	ip, [r2, #-4]	@ unaligned
	cmp	r2, r0
	str	r10, [r1, #-16]	@ unaligned
	str	r9, [r1, #-12]	@ unaligned
	str	lr, [r1, #-8]	@ unaligned
	str	ip, [r1, #-4]	@ unaligned
	bne	.L1406
	ldr	r2, [r5, #8]
	add	r10, r3, #64
.L1407:
	ldr	lr, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r10
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1407
	ldrh	r3, [r6, r8]
	mov	r1, #74
	ldr	ip, [sp, #28]
	ldr	r0, [sp, #32]
	ldrh	r2, [r5, #2]
	lsr	r3, r3, #6
	mla	r0, r1, r0, ip
	ldr	ip, [r5, #16]
	ldr	r1, [r5, #20]
	bfi	r2, r3, #0, #10
	strh	r2, [r5, #2]	@ movhi
	str	ip, [r0, #66]	@ unaligned
	str	r1, [r0, #70]	@ unaligned
	b	.L1405
.L1501:
	ldr	r0, [sp, #4]
	ldr	r3, [sp, #16]
	mov	r1, r3
	str	r4, [r3, #8]
	str	r2, [r3, #12]
	bl	add_discard_addrs
	b	.L1397
.L1436:
	mov	r0, #1
.L1400:
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1401
.L1386:
	ldr	r2, [sp, #56]
	ldr	r6, [r3]
	umull	r2, r8, r2, r4
	ldr	r2, [r3, #28]
	ldr	r3, [r6, #4]
	sub	r1, r4, r8
	sub	r2, r2, #1
	add	r8, r8, r1, lsr #1
	cmp	r4, r2
	movls	r2, r6
	lsr	r8, r8, #5
	add	r5, r8, r3
	bhi	.L1506
.L1389:
	ldr	r0, [r6, #16]
	mvn	r9, r8
	mov	r1, #1
	and	r9, r9, #7
	ldr	r10, [r2, #8]
	lsl	r9, r1, r9
	ldrb	r1, [r0, r8, lsr #3]	@ zero_extendqisi2
	ldr	r0, [sp, #4]
	tst	r1, r9
	ldrne	r1, [r6, #8]
	addne	r5, r5, r1
	sub	r2, r5, r3
	mov	r1, r5
	cmp	r2, r10
	addcc	r2, r2, r10
	subcs	r2, r2, r10
	add	r10, r2, r3
	bl	get_meta_page
	mov	r5, r0
	mov	r1, r10
	ldr	r0, [sp, #4]
	bl	grab_meta_page
	ldr	r3, [r5]
	str	r0, [sp, #36]
	tst	r3, #16
	bne	.L1507
.L1393:
	mov	r0, r5
	bl	page_address
	mov	r10, r0
	ldr	r0, [sp, #36]
	bl	page_address
	mov	r1, r10
	mov	r2, #4096
	bl	memcpy
	ldr	r0, [sp, #36]
	bl	set_page_dirty
	cmp	r5, #0
	beq	.L1394
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1508
.L1395:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	bl	put_page
.L1394:
	ldr	r2, [r6, #16]
	ldr	r0, [sp, #36]
	ldrb	r3, [r2, r8, lsr #3]	@ zero_extendqisi2
	eor	r9, r9, r3
	strb	r9, [r2, r8, lsr #3]
	bl	page_address
	ldr	r5, [sp, #24]
	mov	r3, r0
	mov	r2, r4
	mov	r0, r7
	str	r3, [sp, #28]
	mov	r1, r5
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r3, #0
	mov	r4, r0
	str	r3, [sp, #20]
	bhi	.L1408
	b	.L1396
.L1502:
	movw	r1, #2970
	ldr	r0, [sp, #64]
	bl	warn_slowpath_null
	ldr	r3, [sp, #4]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	mvn	r3, #69
	mvn	r0, #0
	b	.L1401
.L1503:
	ldr	r3, [sp, #60]
	add	r5, r3, #152
.L1388:
	mov	r0, r5
	bl	up_write
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1412
.L1505:
	movw	r1, #2991
	ldr	r0, [sp, #64]
	bl	warn_slowpath_null
	ldr	r3, [sp, #4]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	ldr	r4, [sp, #40]
	ldr	r0, [sp, #44]
	str	r4, [sp, #44]
	bl	list_del
	ldr	r1, [sp, #12]
	ldr	r3, [sp, #52]
	ldr	r0, [r3, #4]
	bl	kmem_cache_free
	ldr	r3, [sp, #48]
	cmp	r3, r4
	ldr	r3, [r4]
	bne	.L1413
.L1494:
	ldr	r8, [sp, #4]
	ldr	r3, [sp, #72]
	ldr	r2, [sp, #48]
	ldr	r3, [r3, #52]
	cmp	r2, r3
	bne	.L1509
.L1416:
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1373
	movw	r0, #:lower16:.LC0
	movw	r1, #2996
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r8, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1373
.L1435:
	mov	r0, #0
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1401
.L1437:
	mov	r0, #2
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1401
.L1438:
	mov	r0, #3
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1401
.L1439:
	mov	r0, #4
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1401
.L1507:
	mov	r1, #2800
	ldr	r0, [sp, #64]
	bl	warn_slowpath_null
	ldr	r3, [sp, #4]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	b	.L1393
.L1506:
	movw	r0, #:lower16:.LC13
	movw	r1, #629
	movt	r0, #:upper16:.LC13
	bl	warn_slowpath_null
	ldr	r9, [sp, #4]
	mov	r0, #2
	add	r1, r9, #16
	bl	_set_bit
	ldr	r3, [r9, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #4]
	b	.L1389
.L1508:
	movw	r1, #1740
	ldr	r0, [sp, #76]
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1395
.L1504:
	movw	r1, #1740
	ldr	r0, [sp, #76]
	bl	warn_slowpath_null
	ldr	r3, [sp, #36]
	mov	r0, #2
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1411
.L1500:
	ldr	r6, [r3, #12]
	ldr	r4, [r6, #168]
	add	r6, r6, #152
	mov	r0, r6
	bl	down_write
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #0
	moveq	r2, r3
	beq	.L1377
	ldr	r3, [r8, #28]
	mov	r1, #1
	ldr	r0, [r4, #2]	@ unaligned
	ldr	ip, [r3]
	rsbs	lr, r0, #0
	and	r2, r0, #31
	and	lr, lr, #31
	add	r3, r0, #31
	rsbpl	r2, lr, #0
	cmp	r0, #0
	ldr	lr, [ip, #28]
	movge	r3, r0
	lsl	r1, r1, r2
	asr	r3, r3, #5
	ldr	r2, [lr, r3, lsl #2]
	tst	r2, r1
	orr	r2, r2, r1
	str	r2, [lr, r3, lsl #2]
	bne	.L1378
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #52
	bl	add_sit_entry
.L1378:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #1
	movls	r2, #1
	bls	.L1379
	ldr	r3, [r8, #28]
	mov	r1, #1
	ldr	r0, [r4, #80]	@ unaligned
	ldr	ip, [r3]
	rsbs	lr, r0, #0
	and	r2, r0, #31
	and	lr, lr, #31
	add	r3, r0, #31
	rsbpl	r2, lr, #0
	cmp	r0, #0
	ldr	lr, [ip, #28]
	movge	r3, r0
	lsl	r1, r1, r2
	asr	r3, r3, #5
	ldr	r2, [lr, r3, lsl #2]
	tst	r2, r1
	orr	r2, r2, r1
	str	r2, [lr, r3, lsl #2]
	bne	.L1380
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #52
	bl	add_sit_entry
.L1380:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #2
	movls	r2, #2
	bls	.L1379
	ldr	r3, [r8, #28]
	mov	r5, #1
	ldr	r0, [r4, #158]	@ unaligned
	ldr	ip, [r3]
	rsbs	r1, r0, #0
	and	r2, r0, #31
	and	r1, r1, #31
	add	r3, r0, #31
	rsbpl	r2, r1, #0
	cmp	r0, #0
	ldr	lr, [ip, #28]
	movge	r3, r0
	lsl	r2, r5, r2
	asr	r3, r3, #5
	ldr	r1, [lr, r3, lsl #2]
	tst	r1, r2
	orr	r2, r1, r2
	str	r2, [lr, r3, lsl #2]
	bne	.L1381
	ldr	r3, [ip, #32]
	add	r3, r3, r5
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #52
	bl	add_sit_entry
.L1381:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #3
	movls	r2, #3
	bls	.L1379
	ldr	r3, [r8, #28]
	mov	r5, #1
	ldr	r0, [r4, #236]	@ unaligned
	ldr	ip, [r3]
	rsbs	r1, r0, #0
	and	r2, r0, #31
	and	r1, r1, #31
	add	r3, r0, #31
	rsbpl	r2, r1, #0
	cmp	r0, #0
	ldr	lr, [ip, #28]
	movge	r3, r0
	lsl	r2, r5, r2
	asr	r3, r3, #5
	ldr	r1, [lr, r3, lsl #2]
	tst	r1, r2
	orr	r2, r1, r2
	str	r2, [lr, r3, lsl #2]
	bne	.L1382
	ldr	r3, [ip, #32]
	add	r3, r3, r5
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #52
	bl	add_sit_entry
.L1382:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #4
	movls	r2, #4
	bls	.L1379
	ldr	r3, [r8, #28]
	mov	r5, #1
	ldr	r0, [r4, #314]	@ unaligned
	ldr	ip, [r3]
	rsbs	r1, r0, #0
	and	r2, r0, #31
	and	r1, r1, #31
	add	r3, r0, #31
	rsbpl	r2, r1, #0
	cmp	r0, #0
	ldr	lr, [ip, #28]
	movge	r3, r0
	lsl	r2, r5, r2
	asr	r3, r3, #5
	ldr	r1, [lr, r3, lsl #2]
	tst	r1, r2
	orr	r2, r1, r2
	str	r2, [lr, r3, lsl #2]
	beq	.L1510
.L1383:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #5
	movls	r2, #5
	bls	.L1379
	ldr	r3, [r8, #28]
	mov	r5, #1
	ldr	r0, [r4, #392]	@ unaligned
	ldr	r1, [r3]
	rsbs	ip, r0, #0
	and	r3, r0, #31
	and	ip, ip, #31
	add	r2, r0, #31
	rsbpl	r3, ip, #0
	cmp	r0, #0
	ldr	lr, [r1, #28]
	movge	r2, r0
	lsl	r3, r5, r3
	asr	r2, r2, #5
	ldr	ip, [lr, r2, lsl #2]
	tst	r3, ip
	orr	r3, r3, ip
	str	r3, [lr, r2, lsl #2]
	beq	.L1511
.L1384:
	ldrh	r3, [r4]	@ unaligned
	mov	r2, #6
.L1379:
	rsb	r2, r2, #0
	sxth	r2, r2
.L1377:
	add	r3, r2, r3
	mov	r0, r6
	strh	r3, [r4]	@ unaligned
	bl	up_write
	b	.L1376
.L1509:
	movw	r0, #:lower16:.LC0
	movw	r1, #2995
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r8, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1416
.L1510:
	ldr	r3, [ip, #32]
	add	r3, r3, r5
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1383
.L1511:
	ldr	r3, [r1, #32]
	add	r3, r3, r5
	str	r3, [r1, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1384
	.fnend
	.size	flush_sit_entries, .-flush_sit_entries
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"&dcc->cmd_lock\000"
	.align	2
.LC15:
	.ascii	"&dcc->discard_wait_queue\000"
	.align	2
.LC16:
	.ascii	"f2fs_discard-%u:%u\000"
	.align	2
.LC17:
	.ascii	"&sit_i->sentry_lock\000"
	.align	2
.LC18:
	.ascii	"&array[i].curseg_mutex\000"
	.align	2
.LC19:
	.ascii	"&array[i].journal_rwsem\000"
	.align	2
.LC20:
	.ascii	"&dirty_i->seglist_lock\000"
	.section	.rodata.cst4,"aM",%progbits,4
	.align	2
.LC21:
	.word	__stack_chk_guard
	.text
	.align	2
	.global	build_segment_manager
	.syntax unified
	.arm
	.fpu softvfp
	.type	build_segment_manager, %function
build_segment_manager:
	.fnstart
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r2, #:lower16:.LC21
	movt	r3, #:upper16:kmalloc_caches
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	movt	r2, #:upper16:.LC21
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r0, [r3, #28]
	.pad #140
	sub	sp, sp, #140
	ldr	r2, [r2]
	str	r2, [sp, #132]
	mov	r2,#0
	ldr	r4, [r7, #8]
	str	r3, [sp, #12]
	ldr	r5, [r7, #172]
	cmp	r0, #0
	beq	.L1675
	mov	r2, #84
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	beq	.L1521
.L1513:
	str	r0, [r7, #28]
	ldr	r3, [r4, #72]	@ unaligned
	movw	r2, #16483
	movt	r2, 6
	str	r3, [r0, #16]
	ldr	r3, [r4, #92]	@ unaligned
	str	r3, [r0, #20]
	ldr	r3, [r4, #48]	@ unaligned
	str	r3, [r0, #28]
	ldr	r3, [r5, #24]	@ unaligned
	str	r3, [r0, #36]
	ldr	r3, [r5, #28]	@ unaligned
	str	r3, [r0, #40]
	ldr	r3, [r4, #68]	@ unaligned
	str	r3, [r0, #32]
	add	r3, r3, r3, lsl #2
	ldr	r1, [r4, #88]	@ unaligned
	cmp	r3, r2
	movhi	r3, #4096
	str	r1, [r0, #24]
	strhi	r3, [r0, #44]
	bls	.L1819
.L1516:
	ldr	r3, [r7, #672]
	mov	r2, #16
	mov	r1, #8
	mov	ip, #2048
	str	ip, [r0, #48]
	tst	r3, #262144
	str	r1, [r0, #68]
	moveq	r3, #16
	str	r2, [r0, #72]
	streq	r3, [r0, #60]
	mov	r3, #70
	str	r3, [r0, #64]
	add	r3, r0, #52
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	ldr	r3, [r7]
	ldr	r2, [r3, #52]
	tst	r2, #1
	bne	.L1518
	mov	r0, r7
	bl	create_flush_cmd_control
	subs	r4, r0, #0
	bne	.L1512
	ldr	r3, [r7]
.L1518:
	ldr	r2, [r7, #28]
	ldr	r3, [r3, #208]
	ldr	r5, [r2, #80]
	ldr	r4, [r3]
	cmp	r5, #0
	beq	.L1820
.L1519:
	lsr	r1, r4, #20
	ubfx	r4, r4, #0, #20
	movw	r3, #:lower16:.LC16
	movw	r0, #:lower16:issue_discard_thread
	movt	r3, #:upper16:.LC16
	movt	r0, #:upper16:issue_discard_thread
	mvn	r2, #0
	stm	sp, {r1, r4}
	mov	r1, r7
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L1523
	bl	wake_up_process
	str	r4, [r5]
.L1668:
	ldr	r3, [sp, #12]
	ldr	r10, [r7, #8]
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L1677
	mov	r2, #120
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L1521
.L1524:
	ldr	r3, [r7, #28]
	movw	r1, #33488
	str	r4, [r3]
	ldr	r3, [r7, #28]
	ldr	r0, [r3, #32]
	add	r0, r0, r0, lsl #1
	lsl	r5, r0, #3
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4, #60]
	beq	.L1821
.L1667:
	ldr	r3, [r7, #28]
	movw	r1, #33488
	ldr	r5, [r3, #32]
	add	r5, r5, #31
	lsr	r5, r5, #5
	lsl	r5, r5, #2
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4, #28]
	beq	.L1822
.L1531:
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1537
	mov	r5, #0
	ldr	r9, [sp, #12]
	mov	r6, r5
	ldr	r8, [r4, #60]
	b	.L1536
.L1813:
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1665:
	str	r0, [fp, #12]
	ldr	r8, [r4, #60]
	add	r3, r8, r5
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1521
.L1535:
	ldr	r3, [r7, #28]
	add	r6, r6, #1
	add	r5, r5, #24
	ldr	r3, [r3, #32]
	cmp	r6, r3
	bcs	.L1537
.L1536:
	ldr	r0, [r9, #24]
	add	r8, r8, r5
	cmp	r0, #0
	moveq	r0, #16
	beq	.L1532
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1532:
	str	r0, [r8, #4]
	ldr	r0, [r9, #24]
	ldr	r8, [r4, #60]
	cmp	r0, #0
	add	r8, r8, r5
	moveq	r0, #16
	beq	.L1533
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1533:
	str	r0, [r8, #8]
	ldr	r8, [r4, #60]
	add	fp, r8, r5
	ldr	r3, [fp, #4]
	cmp	r3, #0
	beq	.L1521
	ldr	r3, [fp, #8]
	cmp	r3, #0
	beq	.L1521
	ldr	r3, [r7]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1534
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1535
.L1534:
	ldr	r0, [r9, #24]
	cmp	r0, #0
	bne	.L1813
	mov	r0, #16
	b	.L1665
.L1819:
	movw	r2, #34079
	movt	r2, 20971
	umull	r2, r3, r2, r3
	lsr	r3, r3, #5
	str	r3, [r0, #44]
	b	.L1516
.L1820:
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #52]
	cmp	r0, #0
	beq	.L1676
	movw	r2, #4176
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L1521
.L1520:
	add	ip, r5, #4096
	add	r2, r5, #4
	add	ip, ip, #12
	add	r3, r5, #12
	str	r2, [r5, #4]
	str	r2, [r5, #8]
.L1522:
	str	r3, [r3]
	str	r3, [r3, #4]
	add	r3, r3, #8
	cmp	ip, r3
	bne	.L1522
	add	r6, r5, #4096
	movw	r1, #:lower16:.LC14
	ldr	r2, .L1848
	movt	r1, #:upper16:.LC14
	add	r0, r6, #32
	str	ip, [r6, #12]
	str	ip, [r6, #16]
	bl	__mutex_init
	mov	r3, #0
	movw	r1, #:lower16:.LC15
	movt	r1, #:upper16:.LC15
	add	r0, r6, #20
	str	r3, [r6, #52]
	str	r3, [r6, #64]
	str	r3, [r6, #68]
	str	r3, [r6, #72]
	ldr	r2, [r7, #28]
	ldr	lr, [r7, #496]
	ldr	ip, [r2, #32]
	str	r3, [r6, #60]
	str	r3, [r6, #76]
	ldr	r2, .L1848
	lsl	r3, ip, lr
	str	r3, [r6, #56]
	bl	__init_waitqueue_head
	ldr	r3, [r7, #28]
	str	r5, [r3, #80]
	b	.L1519
.L1840:
	mov	r2, r5
	mov	r0, r7
	ldr	r1, [sp, #8]
	bl	restore_node_summary
	subs	r4, r0, #0
	beq	.L1586
	cmp	r10, #0
	beq	.L1512
	ldr	r3, [r10]
	tst	r3, #1
	beq	.L1823
.L1587:
	mov	r0, r10
	bl	unlock_page
	mov	r0, r10
	bl	put_page
.L1512:
	movw	r3, #:lower16:.LC21
	movt	r3, #:upper16:.LC21
	ldr	r2, [r3]
	ldr	r3, [sp, #132]
	eors	r2, r3, r2
	bne	.L1824
	mov	r0, r4
	add	sp, sp, #140
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1675:
	mov	r0, #16
	b	.L1513
.L1630:
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L1686
	mov	r2, #92
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L1521
.L1632:
	ldr	r3, [r7, #28]
	add	r6, r5, #36
	movw	r1, #:lower16:.LC20
	ldr	r2, .L1848
	mov	r0, r6
	movt	r1, #:upper16:.LC20
	movw	r8, #:lower16:pgprot_kernel
	movt	r8, #:upper16:pgprot_kernel
	str	r5, [r3, #8]
	add	r5, r5, #4
	bl	__mutex_init
	ldr	r3, [r7, #28]
	ldr	r4, [r3, #32]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	b	.L1634
.L1652:
	add	r5, r5, #4
	cmp	r6, r5
	beq	.L1825
.L1634:
	movw	r1, #33488
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5]
	bne	.L1652
	ldr	r2, [r8]
	movw	r1, #32976
	mov	r0, r4
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5]
	bne	.L1652
.L1521:
	mvn	r4, #11
	b	.L1512
.L1677:
	mov	r4, #16
	b	.L1524
.L1676:
	mov	r5, #16
	b	.L1520
.L1537:
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1826
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #24]
	beq	.L1521
.L1538:
	ldr	r3, [r7, #504]
	cmp	r3, #1
	bls	.L1540
	ldr	r5, [r7, #512]
	movw	r1, #33488
	lsl	r5, r5, #2
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4, #64]
	beq	.L1827
.L1540:
	ldr	r2, [r7, #8]
	ldr	r0, [r7, #172]
	ldr	r3, [r10, #56]	@ unaligned
	ldr	r2, [r2, #1664]	@ unaligned
	ldr	r6, [r0, #156]	@ unaligned
	lsr	r5, r3, #1
	cmp	r2, #0
	mov	r2, #208
	addne	r0, r0, #4096
	addeq	r0, r0, #192
	mov	r1, r6
	bl	kmemdup
	cmp	r0, #0
	str	r0, [r4, #16]
	beq	.L1521
	movw	r3, #:lower16:.LANCHOR1
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	mov	r0, #0
	str	r3, [r4]
	ldr	r1, [r10, #80]	@ unaligned
	mov	r3, #55
	str	r1, [r4, #4]
	ldr	r1, [r7, #496]
	str	r0, [r4, #12]
	strd	r2, [r4, #32]
	str	r6, [r4, #20]
	lsl	r3, r5, r1
	str	r3, [r4, #8]
	ldr	r3, [r7, #172]
	ldr	r2, [r3, #168]	@ unaligned
	ldr	r3, [r3, #172]	@ unaligned
	strd	r2, [r4, #72]
	bl	get_seconds
	asr	r9, r0, #31
	mov	r8, r0
	ldr	r2, .L1848
	movw	r1, #:lower16:.LC17
	add	r0, r4, #40
	movt	r1, #:upper16:.LC17
	strd	r8, [r4, #80]
	bl	__mutex_init
	ldr	r3, [sp, #12]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1680
	mov	r2, #24
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L1521
.L1545:
	ldr	r3, [r7, #28]
	mov	r1, #720
	str	r5, [r3, #4]
	ldr	r3, [r7, #28]
	ldr	r6, [r3, #32]
	add	r6, r6, #31
	lsr	r6, r6, #5
	lsl	r6, r6, #2
	mov	r0, r6
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #16]
	beq	.L1828
.L1664:
	ldr	r4, [r7, #512]
	mov	r1, #720
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #20]
	beq	.L1829
.L1663:
	cmp	r6, #0
	bne	.L1830
.L1548:
	cmp	r4, #0
	bne	.L1831
.L1549:
	ldr	r0, [r7, #28]
	mov	r2, #0
	movw	r1, #32976
	ldr	ip, [r7, #496]
	ldr	lr, [r0, #16]
	ldr	r3, [r0, #20]
	mov	r0, #384
	str	r2, [r5, #4]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	sub	r3, r3, lr
	lsr	r3, r3, ip
	str	r3, [r5]
	bl	__kmalloc
	cmp	r0, #0
	beq	.L1521
	ldr	r5, .L1848
	movw	r6, #:lower16:.LC18
	movw	r9, #:lower16:.LC19
	ldr	r10, [sp, #12]
	mov	r4, r0
	movt	r6, #:upper16:.LC18
	ldr	r3, [r7, #28]
	movt	r9, #:upper16:.LC19
	add	r8, r0, #384
	str	r0, [r3, #12]
.L1554:
	mov	r0, r4
	mov	r2, r5
	mov	r1, r6
	bl	__mutex_init
	ldr	r0, [r10, #48]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #20]
	beq	.L1551
	mov	r2, #4096
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #20]
	beq	.L1521
.L1551:
	add	r0, r4, #24
	mov	r2, r5
	mov	r1, r9
	bl	__init_rwsem
	ldr	r0, [r10, #36]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #40]
	beq	.L1553
	movw	r2, #507
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #40]
	beq	.L1521
.L1553:
	mvn	r2, #0
	mov	r3, #0
	add	r4, r4, #64
	str	r2, [r4, #-16]
	strh	r3, [r4, #-12]	@ movhi
	cmp	r8, r4
	bne	.L1554
	ldr	r2, [r7, #28]
	ldr	r9, [r7, #172]
	ldr	r2, [r2, #12]
	ldr	r3, [r9, #132]	@ unaligned
	ldr	r1, [r2, #40]
	ldr	r2, [r2, #168]
	ands	r0, r3, #4
	moveq	fp, r0
	str	r2, [sp, #32]
	moveq	r2, #6
	str	r1, [sp, #36]
	beq	.L1555
	ldrb	r3, [r9, #176]	@ zero_extendqisi2
	ldrb	r2, [r9, #177]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhne	r3, [r9, #116]	@ unaligned
	ldreq	r3, [r7, #500]
	cmp	r2, #1
	ldrhne	r2, [r9, #118]	@ unaligned
	ldreq	r2, [r7, #500]
	add	r3, r3, r2
	ldrb	r2, [r9, #178]	@ zero_extendqisi2
	cmp	r2, #1
	ldreq	r2, [r7, #500]
	ldrhne	r2, [r9, #120]	@ unaligned
	add	r3, r2, r3
	cmp	r3, #440
	blt	.L1562
	sub	r3, r3, #436
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #176]
	sub	r3, r3, #3
	cmp	r3, #584
	ldr	ip, [r9, #140]	@ unaligned
	movle	r2, #2
	movgt	r2, #3
	ldr	r1, [r1, #76]	@ unaligned
	cmp	r0, #2
	mov	r0, #1
	ldreq	r3, [r7, #500]
	str	r0, [sp]
	mov	r0, r7
	addeq	r1, r1, r3
	mov	r3, #0
	add	r1, ip, r1
	bl	ra_meta_pages
	ldr	r9, [r7, #172]
.L1562:
	ldr	r3, [r7, #8]
	mov	r0, r7
	movw	r8, #507
	ldr	r2, [r7, #176]
	movw	r5, #1014
	mov	fp, #0
	ldr	r1, [r9, #140]	@ unaligned
	ldr	r3, [r3, #76]	@ unaligned
	cmp	r2, #2
	ldreq	r2, [r7, #500]
	addeq	r3, r3, r2
	movw	r2, #:lower16:.LC3
	movt	r2, #:upper16:.LC3
	add	r1, r1, r3
	add	r10, r1, #1
	str	r2, [sp, #40]
	bl	get_meta_page
	mov	r4, r0
	bl	page_address
	ldr	r3, [r7, #28]
	mov	r6, r0
	mov	r1, r0
	add	r0, r9, #176
	mov	r2, r8
	str	r0, [sp, #16]
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #40]
	bl	memcpy
	ldr	r3, [r7, #28]
	add	r1, r6, r8
	mov	r2, r8
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #168]
	bl	memcpy
	str	fp, [sp, #8]
	str	r6, [sp, #20]
	mov	r6, r5
	str	r9, [sp, #28]
	mov	r9, r10
.L1573:
	ldr	r2, [sp, #8]
	ldr	ip, [r7, #28]
	ldr	r1, [sp, #28]
	add	r3, r2, #20
	lsl	r5, r2, #6
	ldr	r10, [ip, #12]
	add	r0, r2, #56
	add	r3, r1, r3, lsl #2
	add	r0, r1, r0, lsl #1
	ldr	r3, [r3, #4]	@ unaligned
	mov	r2, #0	@ movhi
	mov	r1, #5
	add	r10, r10, r5
	ldrh	r8, [r0, #4]	@ unaligned
	str	r3, [r10, #60]
	ldr	r3, [r7, #28]
	uxth	fp, r8
	ldr	r3, [r3, #12]
	add	r5, r3, r5
	ldr	r3, [r5, #20]
	ldr	r0, [r5, #60]
	str	r3, [sp, #24]
	str	r0, [r5, #48]
	ldr	ip, [r7, #504]
	ldr	lr, [r7, #508]
	strh	r2, [r5, #52]	@ movhi
	mvn	r2, #0
	str	r2, [r5, #60]
	udiv	ip, r0, ip
	add	r0, r3, #4080
	add	r0, r0, #11
	udiv	ip, ip, lr
	str	ip, [r5, #56]
	bl	__memzero
	mov	r1, #0
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #24]
	strb	r1, [r3, #4091]
	ldr	r1, [r7, #28]
	ldr	r3, [r5, #48]
	ldr	r1, [r1]
	add	r3, r3, r3, lsl #1
	ldr	r1, [r1, #60]
	ldrb	r0, [r1, r3, lsl #3]	@ zero_extendqisi2
	bfi	r0, r2, #0, #6
	ldr	r2, [sp, #16]
	strb	r0, [r1, r3, lsl #3]
	ldrb	r3, [r2], #1	@ zero_extendqisi2
	cmp	r3, #1
	strb	r3, [r10, #44]
	strh	r8, [r10, #52]	@ movhi
	ldreq	fp, [r7, #500]
	str	r2, [sp, #16]
	uxtheq	fp, fp
	cmp	fp, #0
	beq	.L1567
	ldr	r0, [sp, #20]
	mov	r8, #0
	movw	r5, #4091
.L1572:
	ldr	r2, [r0, r6]	@ unaligned
	rsb	r3, r8, r8, lsl #3
	add	ip, r0, r6
	ldr	r1, [r10, #20]
	add	lr, r6, #14
	cmp	lr, r5
	addls	r6, r6, #7
	str	r2, [r1, r3]	@ unaligned
	add	r3, r1, r3
	ldrh	r2, [ip, #4]	@ unaligned
	ldrb	r1, [ip, #6]	@ zero_extendqisi2
	strh	r2, [r3, #4]	@ unaligned
	strb	r1, [r3, #6]
	bls	.L1569
	cmp	r4, #0
	beq	.L1570
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1832
.L1571:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1570:
	mov	r1, r9
	mov	r0, r7
	bl	get_meta_page
	add	r9, r9, #1
	mov	r6, #0
	mov	r4, r0
	bl	page_address
.L1569:
	add	r8, r8, #1
	cmp	r8, fp
	bne	.L1572
	str	r0, [sp, #20]
.L1567:
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [sp, #8]
	bne	.L1573
	cmp	r4, #0
	mov	fp, r3
	beq	.L1833
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1834
.L1575:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
	ldr	r9, [r7, #172]
	mov	r2, #3
	mov	r0, r2
	ldr	r3, [r9, #132]	@ unaligned
.L1555:
	ands	r3, r3, #33
	beq	.L1577
	ldr	r3, [r7, #8]
	ldr	r1, [r7, #176]
	cmp	r1, #2
	ldr	r1, [r3, #76]	@ unaligned
	beq	.L1835
.L1662:
	ldr	ip, [r9, #136]	@ unaligned
	sub	lr, r0, #7
	mov	r3, #1
	mov	r0, r7
	str	r3, [sp]
	mov	r3, #0
	add	ip, ip, lr
	add	r1, ip, r1
	bl	ra_meta_pages
	ldr	r9, [r7, #172]
	ldr	r3, [r9, #132]	@ unaligned
	and	r3, r3, #33
.L1577:
	movw	r2, #:lower16:.LC3
	mov	r6, #0
	movt	r2, #:upper16:.LC3
	str	r2, [sp, #24]
	b	.L1592
.L1838:
	ldr	r2, [r7, #8]
	cmp	r3, #0
	ldr	r3, [r7, #176]
	ldr	r1, [r2, #76]	@ unaligned
	beq	.L1836
	cmp	r3, #2
	bne	.L1658
	ldr	r3, [r7, #500]
	add	r1, r1, r3
.L1658:
	ldr	r3, [r9, #136]	@ unaligned
	sub	r3, r3, #7
	add	r3, r3, fp
	add	r1, r3, r1
.L1581:
	add	r2, fp, #20
	add	r3, fp, #56
	add	r2, r9, r2, lsl #2
	add	r3, r9, r3, lsl #1
	ldr	r2, [r2, #4]	@ unaligned
	mov	r0, r7
	str	r2, [sp, #8]
	ldrh	r3, [r3, #4]	@ unaligned
	str	r3, [sp, #20]
	bl	get_meta_page
	mov	r10, r0
	bl	page_address
	mov	r5, r0
.L1586:
	ldr	r3, [r7, #28]
	lsl	r8, fp, #6
	str	r8, [sp, #16]
	ldr	r4, [r3, #12]
	add	r4, r4, r8
	add	r8, r4, #24
	mov	r0, r4
	bl	mutex_lock
	mov	r0, r8
	bl	down_write
	add	r1, r5, #3584
	movw	r2, #507
	ldr	r0, [r4, #40]
	bl	memcpy
	mov	r0, r8
	bl	up_write
	mov	r1, r5
	mov	r2, #3584
	ldr	r0, [r4, #20]
	bl	memcpy
	movw	r0, #4091
	ldr	r3, [r4, #20]
	mvn	r2, #0
	ldr	ip, [r5, r0]	@ unaligned
	add	r5, r5, r0
	mov	r1, #5
	ldr	lr, [sp, #8]
	str	ip, [r3, #4091]	@ unaligned
	ldrb	ip, [r5, #4]	@ zero_extendqisi2
	strb	ip, [r3, #4095]
	ldr	ip, [sp, #16]
	str	lr, [r4, #60]
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #12]
	add	r8, r3, ip
	ldr	r5, [r8, #20]
	ldr	r3, [r8, #60]
	add	r0, r5, r0
	str	r3, [r8, #48]
	ldr	ip, [r7, #504]
	ldr	lr, [r7, #508]
	strh	r6, [r8, #52]	@ movhi
	str	r2, [r8, #60]
	udiv	r3, r3, ip
	udiv	lr, r3, lr
	str	lr, [r8, #56]
	bl	__memzero
	cmp	fp, #2
	bgt	.L1588
	strb	r6, [r5, #4091]
	ldr	r2, [r7, #28]
	add	r9, r9, fp
	ldr	r3, [r8, #48]
	mov	r0, r4
	ldr	r2, [r2]
	add	r3, r3, r3, lsl #1
	ldr	r2, [r2, #60]
	ldrb	r1, [r2, r3, lsl #3]	@ zero_extendqisi2
	bfi	r1, fp, #0, #6
	strb	r1, [r2, r3, lsl #3]
	ldrb	r3, [r9, #176]	@ zero_extendqisi2
	ldr	r2, [sp, #20]
	strb	r3, [r4, #44]
	strh	r2, [r4, #52]	@ movhi
	bl	mutex_unlock
	cmp	r10, #0
	beq	.L1589
.L1670:
	ldr	r3, [r10]
	tst	r3, #1
	beq	.L1837
.L1590:
	mov	r0, r10
	bl	unlock_page
	mov	r0, r10
	bl	put_page
.L1669:
	add	fp, fp, #1
	cmp	fp, #6
	beq	.L1591
.L1673:
	ldr	r9, [r7, #172]
	ldr	r3, [r9, #132]	@ unaligned
	and	r3, r3, #33
.L1592:
	cmp	fp, #2
	ble	.L1838
	add	r1, fp, #5
	add	r2, fp, #29
	add	r1, r9, r1, lsl #2
	cmp	r3, #0
	add	r3, r9, r2, lsl #1
	ldr	r2, [r1, #4]	@ unaligned
	str	r2, [sp, #8]
	ldrh	r3, [r3, #4]	@ unaligned
	sub	r2, fp, #3
	str	r3, [sp, #20]
	beq	.L1839
	ldr	r3, [r7, #8]
	ldr	r1, [r7, #176]
	ldr	r3, [r3, #76]	@ unaligned
	cmp	r1, #2
	bne	.L1660
	ldr	r1, [r7, #500]
	add	r3, r3, r1
.L1660:
	ldr	r1, [r9, #136]	@ unaligned
	sub	r1, r1, #4
	add	r1, r1, r2
	add	r1, r1, r3
.L1584:
	mov	r0, r7
	bl	get_meta_page
	mov	r10, r0
	bl	page_address
	ldr	r3, [r7, #172]
	mov	r5, r0
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #33
	beq	.L1840
	ldr	r3, [r7, #500]
	cmp	r3, #0
	movne	r3, r5
	movne	r2, #0
	beq	.L1586
.L1585:
	strb	r6, [r3, #4]
	add	r2, r2, #1
	add	r3, r3, #7
	strb	r6, [r3, #-2]
	strb	r6, [r3, #-1]
	ldr	r1, [r7, #500]
	cmp	r1, r2
	bhi	.L1585
	b	.L1586
.L1680:
	mov	r5, #16
	b	.L1545
.L1523:
	mov	r0, r5
	str	r4, [r5]
	bl	kfree
	ldr	r3, [r7, #28]
	mov	r2, #0
	cmp	r4, #0
	str	r2, [r3, #80]
	bne	.L1512
	b	.L1668
.L1831:
	mov	r2, r4
	mov	r1, #255
	bl	memset
	b	.L1549
.L1830:
	mov	r2, r6
	mov	r1, #255
	ldr	r0, [r5, #16]
	bl	memset
	ldr	r0, [r5, #20]
	b	.L1548
.L1826:
	mov	r3, #16
	str	r3, [r4, #24]
	b	.L1538
.L1588:
	mov	r3, #1
	add	r9, r9, fp
	mov	r0, r4
	strb	r3, [r5, #4091]
	ldr	r2, [r7, #28]
	ldr	r3, [r8, #48]
	ldr	r2, [r2]
	add	r3, r3, r3, lsl #1
	ldr	r2, [r2, #60]
	ldrb	r1, [r2, r3, lsl #3]	@ zero_extendqisi2
	bfi	r1, fp, #0, #6
	strb	r1, [r2, r3, lsl #3]
	ldrb	r3, [r9, #176]	@ zero_extendqisi2
	ldr	r2, [sp, #20]
	strb	r3, [r4, #44]
	strh	r2, [r4, #52]	@ movhi
	bl	mutex_unlock
	cmp	r10, #0
	bne	.L1670
	b	.L1669
.L1839:
	ldr	r3, [r7, #28]
	ldr	r1, [r3, #24]
	ldr	r3, [sp, #8]
	add	r1, r3, r1
	b	.L1584
.L1836:
	cmp	r3, #2
	bne	.L1656
	ldr	r3, [r7, #500]
	add	r1, r1, r3
.L1656:
	ldr	r3, [r9, #136]	@ unaligned
	sub	r3, r3, #4
	add	r3, r3, fp
	add	r1, r3, r1
	b	.L1581
.L1821:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r5
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4, #60]
	bne	.L1667
	b	.L1521
.L1822:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r5
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4, #28]
	bne	.L1531
	b	.L1521
.L1835:
	ldr	r3, [r7, #500]
	add	r1, r1, r3
	b	.L1662
.L1589:
	add	fp, fp, #1
	b	.L1673
.L1832:
	movw	r1, #1740
	ldr	r0, [sp, #40]
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1571
.L1837:
	movw	r1, #1740
	ldr	r0, [sp, #24]
	bl	warn_slowpath_null
	ldr	r3, [r10, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1590
.L1849:
	.align	2
.L1848:
	.word	.LANCHOR0+16
.L1591:
	ldr	r3, [sp, #36]
	ldrh	r3, [r3]	@ unaligned
	cmp	r3, #38
	bhi	.L1684
	ldr	r3, [sp, #32]
	ldrh	r3, [r3]	@ unaligned
	cmp	r3, #6
	bhi	.L1684
	movw	r2, #:lower16:.LC13
	ldr	r1, [r7, #28]
	movw	r3, #4767
	movt	r2, #:upper16:.LC13
	movt	r3, 10724
	str	r2, [sp, #36]
	mov	r2, #0
	ldr	r0, [r1, #12]
	str	r2, [sp, #32]
	ldr	r2, [r1, #32]
	ldr	r1, [r1]
	add	r2, r2, #54
	str	r1, [sp, #8]
	ldr	r1, [r0, #168]
	str	r0, [sp, #52]
	str	r1, [sp, #40]
	umull	r1, r3, r3, r2
	sub	r2, r2, r3
	add	r3, r3, r2, lsr #1
	lsr	r3, r3, #5
	str	r3, [sp, #48]
.L1594:
	ldr	r4, [sp, #32]
	mov	r0, #1
	mov	r3, #2
	mov	r2, #256
	str	r0, [sp]
	mov	r0, r7
	mov	r1, r4
	bl	ra_meta_pages
	ldr	r3, [sp, #8]
	add	r2, r4, r0
	str	r2, [sp, #32]
	ldr	r3, [r3, #36]
	mul	r6, r3, r4
	mul	r3, r2, r3
	cmp	r6, r3
	str	r3, [sp, #28]
	bcs	.L1608
	movw	r3, #:lower16:.LC3
	movt	r3, #:upper16:.LC3
	str	r3, [sp, #44]
.L1593:
	ldr	r3, [r7, #28]
	ldr	r2, [r3, #32]
	cmp	r6, r2
	bcs	.L1608
	movw	r2, #4767
	ldr	fp, [r3]
	movt	r2, 10724
	ldr	r1, [sp, #8]
	ldr	r3, [r3, #28]
	umull	r2, r9, r2, r6
	add	r2, r6, r6, lsl #1
	ldr	r10, [fp, #4]
	lsl	r8, r2, #3
	ldr	r5, [r1, #60]
	str	r2, [sp, #16]
	sub	r3, r3, #1
	sub	r2, r6, r9
	cmp	r6, r3
	add	r9, r9, r2, lsr #1
	add	r4, r5, r8
	lsr	r9, r9, #5
	add	r10, r9, r10
	bhi	.L1841
.L1596:
	ldr	r2, [fp, #16]
	mvn	r3, r9
	mov	r1, #1
	and	r3, r3, #7
	mov	r0, r7
	ldrb	r2, [r2, r9, lsr #3]	@ zero_extendqisi2
	ands	r3, r2, r1, lsl r3
	ldrne	r3, [fp, #8]
	addne	r10, r10, r3
	mov	r1, r10
	bl	get_meta_page
	mov	r10, r0
	bl	page_address
	ldr	r3, [sp, #8]
	mov	r1, r0
	mov	r2, #74
	add	r0, sp, #58
	ldr	ip, [r3, #36]
	udiv	r3, r6, ip
	mls	fp, ip, r3, r6
	mla	fp, r2, fp, r1
	mov	r1, fp
	bl	memcpy
	ldr	r3, [fp, #66]	@ unaligned
	cmp	r10, #0
	ldrh	r9, [fp]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [fp, #70]	@ unaligned
	str	r3, [sp, #24]
	beq	.L1598
	ldr	r3, [r10]
	tst	r3, #1
	beq	.L1842
.L1599:
	mov	r0, r10
	bl	unlock_page
	mov	r0, r10
	bl	put_page
.L1598:
	ldr	r2, [r7, #500]
	ubfx	r3, r9, #0, #10
	mov	r10, r3
	cmp	r3, r2
	bhi	.L1600
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #28]
	sub	r3, r3, #1
	cmp	r6, r3
	bhi	.L1600
.L1601:
	ldrh	r1, [r5, r8]
	uxth	ip, r10
	add	r3, sp, #60
	mov	r2, r3
	add	r0, sp, #124
	bfi	r1, ip, #6, #10
	strh	r1, [r5, r8]	@ movhi
	ldrh	lr, [r4, #2]
	ldr	r1, [r4, #4]
	bfi	lr, ip, #0, #10
	strh	lr, [r4, #2]	@ movhi
.L1602:
	ldr	fp, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r10, [r2, #-12]	@ unaligned
	ldr	lr, [r2, #-8]	@ unaligned
	ldr	ip, [r2, #-4]	@ unaligned
	cmp	r2, r0
	str	fp, [r1, #-16]	@ unaligned
	str	r10, [r1, #-12]	@ unaligned
	str	lr, [r1, #-8]	@ unaligned
	str	ip, [r1, #-4]	@ unaligned
	bne	.L1602
	ldr	r2, [r4, #8]
.L1603:
	ldr	r10, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-12]	@ unaligned
	ldr	ip, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r0
	str	r10, [r2, #-16]	@ unaligned
	str	lr, [r2, #-12]	@ unaligned
	str	ip, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1603
	ldr	r2, [sp, #16]
	asr	r9, r9, #10
	ldrb	r3, [r5, r2, lsl #3]	@ zero_extendqisi2
	bfi	r3, r9, #0, #6
	strb	r3, [r5, r2, lsl #3]
	ldr	r3, [sp, #20]
	str	r3, [r4, #16]
	ldr	r3, [sp, #24]
	str	r3, [r4, #20]
	ldr	r3, [r7]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1604
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1605
.L1604:
	ldr	r3, [r7, #172]
	ldr	r0, [r4, #12]
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #256
	beq	.L1843
	mov	r2, #64
	mov	r1, #255
	bl	memset
.L1605:
	ldr	r3, [r7, #504]
	cmp	r3, #1
	bls	.L1607
	ldr	r2, [r7, #28]
	udiv	r3, r6, r3
	ldrh	r0, [r5, r8]
	ldr	r2, [r2]
	ldr	r1, [r2, #64]
	ldr	r2, [r1, r3, lsl #2]
	add	r2, r2, r0, lsr #6
	str	r2, [r1, r3, lsl #2]
.L1607:
	ldr	r3, [sp, #28]
	add	r6, r6, #1
	cmp	r3, r6
	bne	.L1593
.L1608:
	ldr	r2, [sp, #32]
	ldr	r3, [sp, #48]
	cmp	r3, r2
	bhi	.L1594
	ldr	r3, [sp, #52]
	add	r3, r3, #152
	mov	r0, r3
	str	r3, [sp, #48]
	bl	down_read
	ldr	r3, [sp, #40]
	ldrh	r3, [r3]	@ unaligned
	cmp	r3, #0
	beq	.L1622
	movw	r3, #:lower16:.LC13
	ldr	r2, [sp, #40]
	add	r10, sp, #124
	movt	r3, #:upper16:.LC13
	str	r3, [sp, #52]
	mov	r3, #0
	add	r9, r2, #6
	str	r3, [sp, #16]
	add	r3, sp, #60
	str	r3, [sp, #20]
.L1623:
	mov	r2, #78
	ldr	ip, [sp, #8]
	add	r0, sp, #58
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #40]
	ldr	r4, [ip, #60]
	mla	r3, r2, r3, r1
	mov	r2, #74
	mov	r1, r9
	ldr	fp, [r3, #2]	@ unaligned
	bl	memcpy
	ldrh	r6, [r9]	@ unaligned
	ldr	r3, [r7, #500]
	add	r2, fp, fp, lsl #1
	ldr	r1, [r9, #66]	@ unaligned
	lsl	r8, r2, #3
	str	r2, [sp, #24]
	ubfx	r2, r6, #0, #10
	cmp	r2, r3
	ldrh	r2, [r4, r8]
	str	r1, [sp, #28]
	ldr	r1, [r9, #70]	@ unaligned
	add	r5, r4, r8
	ubfx	r3, r6, #0, #10
	lsr	r2, r2, #6
	str	r1, [sp, #32]
	str	r2, [sp, #36]
	bhi	.L1613
	ldr	r2, [r7, #28]
	ldr	r2, [r2, #28]
	sub	r2, r2, #1
	cmp	fp, r2
	bhi	.L1613
.L1614:
	ldrh	r2, [r4, r8]
	uxth	r0, r3
	ldr	r3, [sp, #20]
	bfi	r2, r0, #6, #10
	strh	r2, [r4, r8]	@ movhi
	ldrh	r1, [r5, #2]
	ldr	r2, [r5, #4]
	bfi	r1, r0, #0, #10
	strh	r1, [r5, #2]	@ movhi
.L1615:
	ldr	lr, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r10
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1615
	ldr	r2, [r5, #8]
	ldr	r3, [sp, #20]
.L1616:
	ldr	lr, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r10
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1616
	ldr	r2, [sp, #24]
	asr	r6, r6, #10
	ldrb	r3, [r4, r2, lsl #3]	@ zero_extendqisi2
	bfi	r3, r6, #0, #6
	strb	r3, [r4, r2, lsl #3]
	ldr	r3, [sp, #28]
	str	r3, [r5, #16]
	ldr	r3, [sp, #32]
	str	r3, [r5, #20]
	ldr	r3, [r7]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1617
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1618
.L1617:
	ldr	r3, [r7, #172]
	ldr	r0, [r5, #12]
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #256
	beq	.L1844
	mov	r2, #64
	mov	r1, #255
	bl	memset
.L1618:
	ldr	r3, [r7, #504]
	cmp	r3, #1
	bls	.L1620
	udiv	r2, fp, r3
	ldr	r3, [sp, #16]
	add	r9, r9, #78
	ldr	r1, [r7, #28]
	ldrh	r0, [r4, r8]
	add	ip, r3, #1
	ldr	r3, [r1]
	str	ip, [sp, #16]
	ldr	r1, [r3, #64]
	ldr	r3, [r1, r2, lsl #2]
	add	r3, r3, r0, lsr #6
	ldr	r0, [sp, #36]
	sub	r3, r3, r0
	str	r3, [r1, r2, lsl #2]
	ldr	r3, [sp, #40]
	ldrh	r3, [r3]	@ unaligned
	cmp	r3, ip
	bhi	.L1623
.L1622:
	ldr	r0, [sp, #48]
	bl	up_read
	ldr	r3, [r7, #28]
	ldr	r2, [r3, #32]
	cmp	r2, #0
	movne	r4, #0
	bne	.L1611
	b	.L1612
.L1624:
	ldr	r3, [r1, #12]
	add	r3, r3, r2, lsr #6
	str	r3, [r1, #12]
.L1626:
	ldr	r3, [r7, #28]
	add	r4, r4, #1
	ldr	r2, [r3, #32]
	cmp	r4, r2
	bcs	.L1612
.L1611:
	ldr	r1, [r3]
	add	r2, r4, r4, lsl #1
	lsl	r2, r2, #3
	ldr	r0, [r1, #60]
	ldrh	r2, [r0, r2]
	bic	r0, r2, #63
	cmp	r0, #0
	bne	.L1624
	ldr	r6, [r3, #4]
	ldr	r5, [r7, #504]
	add	r8, r6, #12
	mov	r0, r8
	udiv	r9, r4, r5
	bl	_raw_spin_lock
	mov	r0, r4
	ldr	r1, [r6, #16]
	bl	_clear_bit
	ldr	r3, [r6, #4]
	ldr	r0, [r6, #16]
	add	r3, r3, #1
	mul	r5, r9, r5
	str	r3, [r6, #4]
	ldr	r1, [r7, #504]
	mov	r2, r5
	add	r1, r5, r1
	bl	_find_next_bit_le
	ldr	r2, [r7, #504]
	add	r5, r5, r2
	cmp	r0, r5
	bcs	.L1845
.L1625:
	mov	r0, r8
	bl	_raw_spin_unlock
	b	.L1626
.L1843:
	ldr	r3, [r4, #4]
	add	r4, r3, #64
.L1606:
	ldr	lr, [r3]	@ unaligned
	add	r3, r3, #16
	add	r0, r0, #16
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r1, [r3, #-8]	@ unaligned
	ldr	r2, [r3, #-4]	@ unaligned
	cmp	r3, r4
	str	lr, [r0, #-16]	@ unaligned
	str	ip, [r0, #-12]	@ unaligned
	str	r1, [r0, #-8]	@ unaligned
	str	r2, [r0, #-4]	@ unaligned
	bne	.L1606
	ldr	r1, [r7, #500]
	ldr	r3, [r7, #552]
	ldrh	r2, [r5, r8]
	add	r3, r3, r1
	sub	r3, r3, r2, lsr #6
	str	r3, [r7, #552]
	b	.L1605
.L1600:
	movw	r1, #666
	ldr	r0, [sp, #36]
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1601
.L1841:
	movw	r1, #629
	ldr	r0, [sp, #36]
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1596
.L1842:
	movw	r1, #1740
	ldr	r0, [sp, #44]
	bl	warn_slowpath_null
	ldr	r3, [r10, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1599
.L1620:
	ldr	r2, [sp, #16]
	add	r9, r9, #78
	ldr	r3, [sp, #40]
	add	r2, r2, #1
	ldrh	r3, [r3]	@ unaligned
	str	r2, [sp, #16]
	cmp	r2, r3
	bcc	.L1623
	b	.L1622
.L1844:
	ldr	r3, [r5, #4]
	add	r5, r3, #64
.L1619:
	ldr	lr, [r3]	@ unaligned
	add	r3, r3, #16
	add	r0, r0, #16
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r1, [r3, #-8]	@ unaligned
	ldr	r2, [r3, #-4]	@ unaligned
	cmp	r3, r5
	str	lr, [r0, #-16]	@ unaligned
	str	ip, [r0, #-12]	@ unaligned
	str	r1, [r0, #-8]	@ unaligned
	str	r2, [r0, #-4]	@ unaligned
	bne	.L1619
	ldr	r1, [sp, #36]
	ldr	r3, [r7, #552]
	ldrh	r2, [r4, r8]
	add	r3, r1, r3
	sub	r3, r3, r2, lsr #6
	str	r3, [r7, #552]
	b	.L1618
.L1613:
	movw	r1, #666
	ldr	r0, [sp, #52]
	str	r3, [sp, #44]
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp, #44]
	b	.L1614
.L1612:
	mov	r5, #0
	b	.L1631
.L1628:
	mov	r0, r6
	add	r5, r5, #64
	bl	_raw_spin_unlock
	cmp	r5, #384
	beq	.L1630
	ldr	r3, [r7, #28]
.L1631:
	ldr	r4, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r9, [r7, #504]
	add	r6, r4, #12
	add	r3, r2, r5
	mov	r0, r6
	ldr	r8, [r3, #48]
	bl	_raw_spin_lock
	ldr	r1, [r4, #16]
	mov	r0, r8
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1628
	ldr	r3, [r4, #4]
	udiv	r0, r8, r9
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	str	r3, [r4, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1628
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1628
.L1845:
	mov	r0, r9
	ldr	r1, [r6, #20]
	bl	_clear_bit
	ldr	r3, [r6, #8]
	add	r3, r3, #1
	str	r3, [r6, #8]
	b	.L1625
.L1825:
	ldr	r3, [r7, #28]
	movw	r8, #:lower16:.LC0
	mov	r5, #0
	movt	r8, #:upper16:.LC0
	ldr	r6, [r3, #4]
	ldr	r2, [r3, #8]
	ldr	r9, [r3, #32]
	add	r4, r6, #12
	add	fp, r2, #36
.L1635:
	mov	r0, r4
	bl	_raw_spin_lock
	mov	r1, r9
	mov	r2, r5
	ldr	r0, [r6, #16]
	bl	_find_next_bit_le
	mov	r10, r0
	mov	r0, r4
	bl	_raw_spin_unlock
	ldr	r3, [r7, #28]
	ldr	r9, [r3, #32]
	cmp	r10, r9
	bcs	.L1636
	ldr	r1, [r3]
	add	r3, r10, r10, lsl #1
	add	r5, r10, #1
	ldr	r2, [r7, #500]
	lsl	r3, r3, #3
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	moveq	r1, #1
	movne	r1, #0
	cmp	r3, r2
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L1635
	cmp	r3, r2
	bhi	.L1846
	mov	r0, fp
	bl	mutex_lock
	mov	r1, r10
	mov	r2, #6
	mov	r0, r7
	bl	__locate_dirty_segment
	mov	r0, fp
	bl	mutex_unlock
	ldr	r3, [r7, #28]
	ldr	r9, [r3, #32]
	b	.L1635
.L1846:
	movw	r1, #3287
	mov	r0, r8
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [r7, #28]
	ldr	r9, [r3, #32]
	b	.L1635
.L1636:
	ldr	r4, [r7, #512]
	movw	r1, #33488
	ldr	r5, [r3, #8]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #88]
	beq	.L1847
.L1653:
	ldr	r3, [r7, #28]
	ldr	r8, [r3]
	add	r9, r8, #40
	mov	r0, r9
	bl	mutex_lock
	mvn	r2, #0
	mvn	r3, #-2147483648
	strd	r2, [r8, #88]
	ldr	r10, [r7, #28]
	ldr	r1, [r10, #32]
	cmp	r1, #0
	beq	.L1640
	mov	fp, r7
	mov	r0, r2
	ldr	r4, [r7, #504]
	mov	r5, #0
	mov	r1, r3
	mov	r6, r2
	mov	r7, r3
.L1641:
	cmp	r4, #0
	moveq	r0, #0
	moveq	r1, r0
	beq	.L1647
	ldr	ip, [r10]
	add	lr, r4, r5
	add	r3, r5, r5, lsl #1
	add	r2, lr, lr, lsl #1
	mov	r0, #0
	mov	r1, r0
	ldr	lr, [ip, #60]
	add	r3, lr, r3, lsl #3
	add	lr, lr, r2, lsl #3
.L1642:
	ldr	r2, [r3, #16]
	ldr	ip, [r3, #20]
	add	r3, r3, #24
	adds	r0, r0, r2
	adc	r1, r1, ip
	cmp	lr, r3
	bne	.L1642
.L1647:
	.syntax divided
@ 55 "/home/jprim/hlte/lolz/include/linux/math64.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, r7
	mov	r0, r2
	cmpeq	r2, r6
	mov	r1, r3
	bcs	.L1643
	strd	r0, [r8, #88]
	ldr	r10, [fp, #28]
	ldr	r4, [fp, #504]
	ldr	r3, [r10, #32]
	add	r5, r5, r4
	cmp	r5, r3
	bcs	.L1640
	mov	r6, r0
	mov	r7, r1
	b	.L1641
.L1643:
	ldr	r3, [r10, #32]
	add	r5, r5, r4
	cmp	r5, r3
	bcc	.L1641
.L1640:
	ldr	r5, [r10]
	mov	r4, #0
	ldrd	r6, [r5, #72]
	bl	get_seconds
	ldr	r3, [r5, #80]
	mov	r1, r0
	mov	r0, r9
	ldr	r2, [r5, #84]
	adds	r6, r6, r1
	adc	r7, r7, r1, asr #31
	subs	r3, r6, r3
	sbc	r2, r7, r2
	str	r3, [r8, #96]
	str	r2, [r8, #100]
	bl	mutex_unlock
	b	.L1512
.L1828:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r6
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #16]
	bne	.L1664
	b	.L1521
.L1829:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r4
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #20]
	bne	.L1663
	b	.L1521
.L1686:
	mov	r5, #16
	b	.L1632
.L1827:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r5
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4, #64]
	bne	.L1540
	b	.L1521
.L1833:
	ldr	r9, [r7, #172]
	mov	r2, r3
	mov	r0, r3
	ldr	r3, [r9, #132]	@ unaligned
	b	.L1555
.L1847:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #88]
	bne	.L1653
	b	.L1521
.L1823:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r10, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1587
.L1834:
	movw	r0, #:lower16:.LC3
	movw	r1, #1740
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1575
.L1684:
	mvn	r4, #21
	b	.L1512
.L1824:
	bl	__stack_chk_fail
	.fnend
	.size	build_segment_manager, .-build_segment_manager
	.align	2
	.global	destroy_segment_manager
	.syntax unified
	.arm
	.fpu softvfp
	.type	destroy_segment_manager, %function
destroy_segment_manager:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r7, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	cmp	r7, #0
	beq	.L1850
	ldr	r5, [r7, #76]
	mov	r4, r0
	cmp	r5, #0
	beq	.L1852
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1852
	mov	r3, #0
	str	r3, [r5]
	bl	kthread_stop
.L1852:
	mov	r0, r5
	bl	kfree
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3, #76]
	ldr	r3, [r4, #28]
	ldr	r5, [r3, #80]
	cmp	r5, r2
	beq	.L1853
	ldr	r0, [r5]
	cmp	r0, r2
	beq	.L1854
	str	r2, [r5]
	bl	kthread_stop
.L1854:
	mov	r0, r5
	bl	kfree
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3, #80]
	ldr	r3, [r4, #28]
.L1853:
	ldr	r8, [r3, #8]
	cmp	r8, #0
	beq	.L1855
	mov	r5, #0
	mov	r6, r8
	b	.L1859
.L1913:
	bl	vfree
	mov	r3, #0
	add	r5, r5, #1
	mov	r0, fp
	str	r3, [r6, #56]
	bl	mutex_unlock
	cmp	r5, #8
	beq	.L1858
.L1857:
	ldr	r3, [r4, #28]
	ldr	r6, [r3, #8]
.L1859:
	add	fp, r6, #36
	add	r6, r6, r5, lsl #2
	mov	r0, fp
	bl	mutex_lock
	ldr	r9, [r6, #4]
	mov	r0, r9
	bl	is_vmalloc_addr
	mov	r10, r0
	mov	r0, r9
	cmp	r10, #0
	bne	.L1913
	bl	kfree
	add	r5, r5, #1
	mov	r0, fp
	str	r10, [r6, #56]
	bl	mutex_unlock
	cmp	r5, #8
	bne	.L1857
.L1858:
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #8]
	ldr	r5, [r3, #88]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L1860
	bl	vfree
.L1861:
	ldr	r3, [r4, #28]
	mov	r2, #0
	mov	r0, r8
	str	r2, [r3, #8]
	bl	kfree
	ldr	r3, [r4, #28]
.L1855:
	ldr	r6, [r3, #12]
	cmp	r6, #0
	beq	.L1862
	mov	r2, #0
	mov	r5, r6
	add	r8, r6, #384
	str	r2, [r3, #12]
.L1863:
	ldr	r0, [r5, #20]
	add	r5, r5, #64
	bl	kfree
	ldr	r0, [r5, #-24]
	bl	kfree
	cmp	r8, r5
	bne	.L1863
	mov	r0, r6
	bl	kfree
	ldr	r3, [r4, #28]
.L1862:
	ldr	r5, [r3, #4]
	cmp	r5, #0
	beq	.L1864
	mov	r2, #0
	str	r2, [r3, #4]
	ldr	r6, [r5, #16]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1865
	bl	vfree
.L1866:
	ldr	r6, [r5, #20]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1867
	bl	vfree
.L1868:
	mov	r0, r5
	bl	kfree
	ldr	r3, [r4, #28]
.L1864:
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L1869
	ldr	r2, [r5, #60]
	cmp	r2, #0
	beq	.L1870
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1870
	mov	r6, #0
	mov	r8, r6
	b	.L1871
.L1914:
	ldr	r2, [r5, #60]
.L1871:
	add	r2, r2, r6
	add	r8, r8, #1
	ldr	r0, [r2, #4]
	bl	kfree
	ldr	r3, [r5, #60]
	add	r3, r3, r6
	ldr	r0, [r3, #8]
	bl	kfree
	ldr	r3, [r5, #60]
	add	r3, r3, r6
	add	r6, r6, #24
	ldr	r0, [r3, #12]
	bl	kfree
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #32]
	cmp	r8, r3
	bcc	.L1914
.L1870:
	ldr	r0, [r5, #24]
	bl	kfree
	ldr	r6, [r5, #60]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1872
	bl	vfree
.L1873:
	ldr	r6, [r5, #64]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1874
	bl	vfree
.L1875:
	ldr	r6, [r5, #28]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1876
	bl	vfree
.L1877:
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3]
	ldr	r0, [r5, #16]
	bl	kfree
	mov	r0, r5
	bl	kfree
.L1869:
	mov	r3, #0
	mov	r0, r7
	str	r3, [r4, #28]
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	kfree
.L1860:
	bl	kfree
	b	.L1861
.L1872:
	bl	kfree
	b	.L1873
.L1850:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1876:
	bl	kfree
	b	.L1877
.L1874:
	bl	kfree
	b	.L1875
.L1867:
	bl	kfree
	b	.L1868
.L1865:
	bl	kfree
	b	.L1866
	.fnend
	.size	destroy_segment_manager, .-destroy_segment_manager
	.align	2
	.global	destroy_segment_manager_caches
	.syntax unified
	.arm
	.fpu softvfp
	.type	destroy_segment_manager_caches, %function
destroy_segment_manager_caches:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	ldr	r0, [r4, #4]
	bl	kmem_cache_destroy
	ldr	r0, [r4, #8]
	bl	kmem_cache_destroy
	ldr	r0, [r4]
	bl	kmem_cache_destroy
	ldr	lr, [sp, #4]
	ldr	r0, [r4, #12]
	ldr	r4, [sp]
	add	sp, sp, #8
	b	kmem_cache_destroy
	.fnend
	.size	destroy_segment_manager_caches, .-destroy_segment_manager_caches
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	default_salloc_ops, %object
	.size	default_salloc_ops, 4
default_salloc_ops:
	.word	allocate_segment_by_default
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	discard_entry_slab, %object
	.size	discard_entry_slab, 4
discard_entry_slab:
	.space	4
	.type	sit_entry_set_slab, %object
	.size	sit_entry_set_slab, 4
sit_entry_set_slab:
	.space	4
	.type	discard_cmd_slab, %object
	.size	discard_cmd_slab, 4
discard_cmd_slab:
	.space	4
	.type	__key.7565, %object
	.size	__key.7565, 0
__key.7565:
	.type	inmem_entry_slab, %object
	.size	inmem_entry_slab, 4
inmem_entry_slab:
	.space	4
	.type	__key.33549, %object
	.size	__key.33549, 0
__key.33549:
	.type	__key.33973, %object
	.size	__key.33973, 0
__key.33973:
	.type	__key.33975, %object
	.size	__key.33975, 0
__key.33975:
	.type	__key.34563, %object
	.size	__key.34563, 0
__key.34563:
	.type	__key.34582, %object
	.size	__key.34582, 0
__key.34582:
	.type	__key.34583, %object
	.size	__key.34583, 0
__key.34583:
	.type	__key.34655, %object
	.size	__key.34655, 0
__key.34655:
	.ident	"GCC: (GNU) 9.2.1 20191004"
	.section	.note.GNU-stack,"",%progbits
// Generated by Lolz Kernel

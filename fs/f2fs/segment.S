__find_rev_next_zero_bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, r1
	bcs	.L26
	lsr	r3, r2, #5
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	bic	r4, r2, #31
	str	r6, [sp, #8]
	sub	r4, r1, r4
	add	r3, r0, r3, lsl #2
	and	r2, r2, #31
	str	lr, [sp, #12]
	mvn	r6, #0
	sub	r3, r3, #4
.L8:
	ldr	r0, [r3, #4]
	add	r5, r3, #4
	cmn	r0, #1
	beq	.L3
	add	r3, r3, #3
	mov	ip, #0
	mov	r0, #24
.L4:
	ldrb	lr, [r3, #1]!	@ zero_extendqisi2
	orr	ip, ip, lr, lsl r0
	sub	r0, r0, #8
	cmn	r0, #8
	bne	.L4
	cmp	r2, #0
	rsbne	r2, r2, #32
	orrne	ip, ip, r6, lsl r2
	cmp	r4, #31
	orrls	ip, ip, r6, lsr r4
	cmn	ip, #1
	bne	.L7
.L3:
	cmp	r4, #32
	bls	.L2
	sub	r4, r4, #32
	mov	r3, r5
	mov	r2, #0
	b	.L8
.L7:
	mvn	ip, ip
	sub	r4, r1, r4
	lsr	r3, ip, #16
	lsl	r3, r3, #16
	cmp	r3, #0
	lsrne	ip, ip, #16
	movne	r1, #0
	moveq	r1, #16
	tst	ip, #65280
	lsrne	ip, ip, #8
	addeq	r1, r1, #8
	tst	ip, #240
	lsrne	ip, ip, #4
	addeq	r1, r1, #4
	tst	ip, #12
	lsrne	ip, ip, #2
	addeq	r1, r1, #2
	tst	ip, #2
	addeq	r1, r1, #1
	add	r1, r1, r4
.L2:
	ldrd	r4, [sp]
	mov	r0, r1
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L26:
	mov	r0, r1
	bx	lr
	.fnend
	.size	__find_rev_next_zero_bit, .-__find_rev_next_zero_bit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__next_free_blkoff, %function
__next_free_blkoff:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r7, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r1, #48]
	ldr	r1, [r0, #28]
	ldr	r0, [r1]
	add	r1, r3, r3, lsl #1
	ldr	r3, [r0, #60]
	ldr	r0, [r0, #24]
	add	r3, r3, r1, lsl #3
	sub	lr, r0, #4
	ldr	ip, [r3, #4]
	ldr	r5, [r3, #8]
	sub	ip, ip, #4
	sub	r1, r5, #4
	add	r5, r5, #60
.L31:
	ldr	r3, [r1, #4]!
	ldr	r4, [ip, #4]!
	cmp	r1, r5
	orr	r3, r3, r4
	str	r3, [lr, #4]!
	bne	.L31
	ldr	r1, [r7, #696]
	bl	__find_rev_next_zero_bit
	strh	r0, [r6, #52]	@ movhi
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	__next_free_blkoff, .-__next_free_blkoff
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
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	lr, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r3, [r1, #8]
	ldr	r5, [r0, #696]
	ldr	r7, [lr]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #3
	ldr	ip, [r7, #60]
	ldrh	r4, [ip, r3]
	add	r3, ip, r3
	cmp	r5, r4, lsr #6
	beq	.L38
	ldr	ip, [r0]
	ldr	r6, [ip, #208]
	ldr	r6, [r6, #88]
	ldr	r6, [r6, #492]
	ldr	r6, [r6, #556]
	tst	r6, #16384
	beq	.L84
.L37:
	ldr	r6, [r1]
	ldr	ip, [lr, #80]
	ldr	r8, [r7, #24]
	ldr	r7, [r3, #4]
	ands	r6, r6, #16
	ldr	lr, [r3, #8]
	ldr	r9, [r3, #12]
	str	ip, [sp, #16]
	beq	.L63
.L64:
	sub	lr, lr, #4
	sub	r4, r8, #4
	mov	ip, #0
	b	.L41
.L86:
	ldr	r10, [r9, ip, lsl #2]
	add	ip, ip, #1
	cmp	ip, #16
	orr	r3, r3, r10
	mvn	r3, r3
	str	r3, [r4, #4]!
	beq	.L85
.L41:
	cmp	r6, #0
	ldr	r3, [lr, #4]!
	bne	.L86
	ldr	r10, [r7, ip, lsl #2]
	add	ip, ip, #1
	cmp	ip, #16
	bic	r3, r3, r10
	str	r3, [r4, #4]!
	bne	.L41
.L85:
	mov	r3, #0
	str	r2, [sp, #12]
	mov	r9, #0
	subs	r2, r6, r3
	movt	r3, 65535
	movne	r2, #1
	mov	r7, r1
	strd	r8, [sp]
	mov	r10, r0
	mvn	r4, #0
	str	r3, [sp, #20]
	ldr	r3, [sp, #16]
	str	r2, [sp, #8]
	add	r3, r3, #4
	str	r3, [sp, #24]
.L42:
	cmp	r6, #0
	bne	.L62
	ldr	r3, [r10, #28]
	ldr	r3, [r3, #80]
	add	r3, r3, #4096
	ldrd	r2, [r3, #52]
	cmp	r2, r3
	bhi	.L38
.L62:
	add	r4, r4, #1
	cmp	r5, r4
	bls	.L38
	ldrd	r8, [sp]
	lsr	r3, r4, #5
	bic	r1, r4, #31
	sub	r1, r5, r1
	and	r4, r4, #31
	mvn	r0, #0
	add	r3, r8, r3, lsl #2
	sub	r3, r3, #4
	b	.L47
.L43:
	cmp	r1, #32
	bls	.L38
	sub	r1, r1, #32
	mov	r3, lr
	mov	r4, #0
.L47:
	ldr	r2, [r3, #4]
	add	lr, r3, #4
	cmp	r2, #0
	beq	.L43
	add	r3, r3, #3
	mov	ip, #0
	mov	r2, #24
.L44:
	ldrb	fp, [r3, #1]!	@ zero_extendqisi2
	orr	ip, ip, fp, lsl r2
	sub	r2, r2, #8
	cmn	r2, #8
	bne	.L44
	cmp	r1, #31
	and	ip, ip, r0, lsr r4
	rsbls	r3, r1, #32
	andls	ip, ip, r0, lsl r3
	cmp	ip, #0
	beq	.L43
.L46:
	ldr	r3, [sp, #20]
	mov	r4, ip
	sub	r1, r5, r1
	strd	r8, [sp]
	tst	ip, r3
	lsrne	r4, ip, #16
	moveq	fp, #16
	movne	fp, #0
	tst	r4, #65280
	lsrne	r4, r4, #8
	addeq	fp, fp, #8
	tst	r4, #240
	lsrne	r4, r4, #4
	addeq	fp, fp, #4
	tst	r4, #12
	lsrne	r4, r4, #2
	addeq	fp, fp, #2
	tst	r4, #2
	addeq	fp, fp, #1
	add	fp, fp, r1
	cmp	r5, fp
	bls	.L38
	add	r2, fp, #1
	mov	r1, r5
	ldr	r0, [sp]
	bl	__find_rev_next_zero_bit
	ldr	r3, [sp, #8]
	cmp	fp, #0
	mov	r4, r0
	moveq	r3, #0
	cmp	r5, r0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L56
	sub	r2, r0, fp
	ldrd	r0, [r7, #24]
	mov	r3, #0
	cmp	r3, r1
	cmpeq	r2, r0
	bcc	.L42
.L56:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L66
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L87
.L58:
	cmp	r4, fp
	mov	r3, fp
	bls	.L60
	ldrd	r8, [sp]
	mov	ip, #1
	add	r0, r9, #12
.L61:
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
	bhi	.L61
	strd	r8, [sp]
.L60:
	ldr	r3, [r10, #28]
	ldr	r2, [r3, #80]
	add	r2, r2, #4096
	ldr	r3, [r2, #52]
	sub	fp, r3, fp
	add	fp, fp, r4
	str	fp, [r2, #52]
	b	.L42
.L84:
	ldr	ip, [ip, #616]
	ldr	ip, [ip, #8]
	ldr	ip, [ip, #2180]	@ unaligned
	tst	ip, #2
	bne	.L37
.L38:
	mov	r0, #0
.L82:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L87:
	movw	r3, #:lower16:.LANCHOR0
	movw	r1, #32848
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3]
	mov	r0, r3
	str	r3, [sp, #28]
	bl	kmem_cache_alloc
	subs	r3, r0, #0
	str	r3, [sp, #4]
	ldr	r3, [sp, #28]
	beq	.L88
.L59:
	ldr	r3, [r10, #28]
	ldrd	r8, [r7, #8]
	ldr	ip, [r10, #692]
	ldr	lr, [sp, #4]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r2, [sp, #24]
	mov	r0, lr
	ldr	r1, [r1]
	adds	r8, r8, r1
	add	r3, r3, r8, lsl ip
	str	r3, [lr, #8]
	ldr	r3, [sp, #16]
	ldr	r1, [r3, #8]
	bl	__list_add
	b	.L58
.L63:
	ldr	r3, [r0, #864]
	tst	r3, #4
	beq	.L38
	bic	r4, r4, #63
	cmp	r4, #0
	beq	.L38
	ldr	r3, [sp, #16]
	add	r3, r3, #4096
	ldr	ip, [r3, #52]
	ldr	r3, [r3, #56]
	cmp	ip, r3
	bcc	.L64
	b	.L38
.L66:
	ldr	r0, [sp, #12]
	b	.L82
.L88:
	mov	r0, r3
	movw	r1, #34896
	bl	kmem_cache_alloc
	str	r0, [sp, #4]
	b	.L59
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
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	mvn	ip, #0
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r1, #5
	strd	r8, [sp, #16]
	mov	r9, r2
	mov	r8, #0
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #28]
	ldr	r4, [r3, #12]
	add	r4, r4, r6, lsl #6
	ldr	r7, [r4, #20]
	ldr	r3, [r4, #60]
	str	r3, [r4, #48]
	ldr	r0, [r0, #700]
	ldr	r2, [r5, #704]
	strh	r8, [r4, #52]	@ movhi
	str	ip, [r4, #60]
	udiv	r3, r3, r0
	add	r0, r7, #4080
	add	r0, r0, #11
	udiv	r3, r3, r2
	str	r3, [r4, #56]
	bl	__memzero
	cmp	r6, #2
	movgt	r3, #1
	strble	r8, [r7, #4091]
	strbgt	r3, [r7, #4091]
	ldr	r2, [r5, #28]
	cmp	r9, #0
	ldr	r3, [r4, #48]
	ldr	r1, [r2]
	add	r2, r3, r3, lsl #1
	lsl	r2, r2, #3
	ldr	r1, [r1, #60]
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	bfi	r0, r6, #0, #6
	strb	r0, [r1, r2]
	beq	.L89
	ldr	r0, [r5, #28]
	rsbs	r2, r3, #0
	and	r1, r3, #31
	and	r2, r2, #31
	add	ip, r3, #31
	rsbpl	r1, r2, #0
	mov	r2, #1
	cmp	r3, #0
	lsl	r2, r2, r1
	ldr	r0, [r0]
	movlt	r3, ip
	asr	r3, r3, #5
	ldr	r1, [r0, #28]
	ldr	ip, [r1, r3, lsl #2]
	tst	r2, ip
	orr	r2, r2, ip
	str	r2, [r1, r3, lsl #2]
	bne	.L89
	ldr	r3, [r0, #32]
	add	r3, r3, #1
	str	r3, [r0, #32]
.L89:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
	.fnend
	.size	reset_curseg, .-reset_curseg
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
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	ip, [r0, #28]
	ldr	r3, [ip, #12]
	ldr	lr, [r3, #48]
	cmp	lr, r1
	beq	.L96
	ldr	lr, [r3, #112]
	cmp	lr, r1
	beq	.L96
	ldr	lr, [r3, #176]
	cmp	lr, r1
	beq	.L96
	ldr	lr, [r3, #240]
	cmp	lr, r1
	beq	.L96
	ldr	lr, [r3, #304]
	cmp	lr, r1
	beq	.L96
	ldr	r3, [r3, #368]
	cmp	r3, r1
	beq	.L96
	ldr	r6, [ip, #8]
	mov	r4, r1
	mov	r8, r0
	mov	r0, r1
	mov	r5, r2
	add	r7, r6, r2, lsl #2
	ldr	r1, [r7, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L100
	ldr	r3, [r7, #56]
	add	r3, r3, #1
	str	r3, [r7, #56]
.L100:
	cmp	r5, #6
	beq	.L103
.L96:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L103:
	ldr	r2, [r8, #28]
	add	r3, r4, r4, lsl #1
	ldr	r2, [r2]
	ldr	r2, [r2, #60]
	ldrb	r3, [r2, r3, lsl #3]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r3, #5
	bhi	.L104
	add	r6, r6, r3, lsl #2
	mov	r0, r4
	ldr	r1, [r6, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L96
	ldr	r3, [r6, #56]
	add	r3, r3, #1
	str	r3, [r6, #56]
	b	.L96
.L104:
	movw	r0, #:lower16:.LC0
	movw	r1, #677
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldrd	r4, [sp]
	add	r1, r8, #16
	mov	r0, #2
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
	.type	__relocate_discard_cmd, %function
__relocate_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	add	r5, r1, #24
	strd	r6, [sp, #8]
	mov	r6, r0
	mov	r0, r5
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r4, [r1, #16]
	cmp	r4, #512
	movcs	r4, #512
	lsl	r4, r4, #3
	add	r7, r4, #4
	add	r4, r6, r4
	bl	__list_del_entry
	add	r7, r6, r7
	mov	r0, r5
	ldr	r1, [r4, #8]
	mov	r2, r7
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	__list_add
	.fnend
	.size	__relocate_discard_cmd, .-__relocate_discard_cmd
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
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	movt	r3, 10724
	str	r6, [sp, #8]
	mov	r6, #55
	str	lr, [sp, #12]
	ldr	r4, [r1]
	umull	r2, r3, r3, r0
	cmp	r1, r4
	sub	r0, r0, r3
	add	r3, r3, r0, lsr #1
	lsr	r3, r3, #5
	mul	r6, r6, r3
	beq	.L108
	ldr	r3, [r4, #8]
	cmp	r6, r3
	bne	.L110
	b	.L109
.L115:
	ldr	r3, [r4, #8]
	cmp	r3, r6
	beq	.L109
.L110:
	ldr	r4, [r4]
	cmp	r4, r5
	bne	.L115
.L108:
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #80
	movt	r3, #:upper16:.LANCHOR0
	ldr	r4, [r3, #4]
	mov	r0, r4
	bl	kmem_cache_alloc
	subs	r3, r0, #0
	beq	.L123
.L116:
	mov	r2, #1
	str	r3, [r3]
	mov	r0, r3
	stmib	r3, {r3, r6}
	mov	r1, r5
	str	r2, [r3, #12]
	ldr	r2, [r5]
.L121:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	__list_add
.L109:
	ldr	r6, [r4]
	ldr	r3, [r4, #12]
	cmp	r5, r6
	add	r3, r3, #1
	str	r3, [r4, #12]
	beq	.L107
	cmp	r6, r5
	bne	.L114
	b	.L112
.L124:
	ldr	r6, [r6]
	cmp	r5, r6
	beq	.L112
.L114:
	ldr	r2, [r6, #12]
	cmp	r3, r2
	bhi	.L124
	mov	r5, r6
.L112:
	mov	r0, r4
	bl	__list_del_entry
	mov	r2, r5
	mov	r0, r4
	ldr	r1, [r6, #4]
	b	.L121
.L123:
	mov	r0, r4
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r3, r0
	b	.L116
.L107:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
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
	strd	r6, [sp, #8]
	mov	r7, r0
	mov	r6, r1
	strd	r8, [sp, #16]
	mov	r0, #16
	mov	r1, #0
	str	lr, [sp, #24]
	.pad #12
	sub	sp, sp, #12
	bl	bio_alloc
	subs	r4, r0, #0
	beq	.L140
.L126:
	mov	r3, #1
	mov	r1, r4
	str	r6, [r4, #12]
	movw	r0, #2577
	str	r3, [r4, #20]
	bl	submit_bio_wait
	mov	r5, r0
	mov	r0, r4
	bl	bio_put
	movw	r2, #:lower16:__tracepoint_f2fs_issue_flush
	movt	r2, #:upper16:__tracepoint_f2fs_issue_flush
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L141
.L125:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L140:
	mov	r1, r4
	mov	r0, #2064
	bl	bio_alloc
	mov	r4, r0
	b	.L126
.L141:
	mov	r3, sp
	ldr	r8, [r7, #864]
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #4]
	add	r1, r1, #1
	str	r1, [r3, #4]
	ldr	r4, [r2, #16]
	cmp	r4, #0
	beq	.L129
	ldr	r7, [r4]
	and	r9, r8, #2048
	and	r8, r8, #1024
.L130:
	ldr	r0, [r4, #4]
	mov	r3, r8
	mov	r2, r9
	mov	r1, r6
	str	r5, [sp]
	blx	r7
	ldr	r7, [r4, #8]!
	cmp	r7, #0
	bne	.L130
.L129:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L125
	bl	preempt_schedule
	b	.L125
	.fnend
	.size	__submit_flush_wait, .-__submit_flush_wait
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
	bl	complete
	ldr	lr, [sp, #4]
	mov	r0, r4
	ldr	r4, [sp]
	add	sp, sp, #8
	b	bio_put
	.fnend
	.size	f2fs_submit_discard_endio, .-f2fs_submit_discard_endio
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
	str	lr, [sp, #12]
	ldr	r3, [r1, #56]
	ldr	r2, [r0, #28]
	cmn	r3, #95
	moveq	r3, #0
	ldr	r4, [r2, #80]
	streq	r3, [r1, #56]
	beq	.L146
	cmp	r3, #0
	beq	.L146
	movw	r2, #:lower16:.LC1
	movw	r1, #:lower16:.LC2
	ldr	r0, [r0]
	movt	r2, #:upper16:.LC1
	movt	r1, #:upper16:.LC2
	bl	f2fs_msg
.L146:
	ldrb	r3, [r5, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L147
	add	r3, r4, #4160
	add	r3, r3, #4
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L147:
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
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	__remove_discard_cmd, .-__remove_discard_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__wait_discard_cmd, %function
__wait_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	mov	r9, r1
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #28]
	ldr	r4, [r3, #80]
	add	r6, r4, #4096
	add	r4, r4, #4096
	mov	r8, r6
	add	r6, r6, #32
	mov	r0, r6
	add	r8, r8, #12
	bl	mutex_lock
	ldr	r5, [r4, #12]
	cmp	r8, r5
	ldr	r3, [r5]
	beq	.L153
	sub	r5, r5, #24
	sub	r4, r3, #24
	b	.L156
.L162:
	ldrb	r3, [r5, #54]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L154
.L155:
	mov	r3, r4
	mov	r5, r4
	ldr	r4, [r3, #24]!
	cmp	r3, r8
	sub	r4, r4, #24
	beq	.L153
.L156:
	cmp	r9, #0
	bne	.L162
.L154:
	ldrh	r3, [r5, #52]
	add	r0, r5, #32
	cmp	r3, #0
	bne	.L155
	bl	wait_for_completion_io
	mov	r1, r5
	mov	r0, r7
	bl	__remove_discard_cmd
	b	.L155
.L153:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	mutex_unlock
	.fnend
	.size	__wait_discard_cmd, .-__wait_discard_cmd
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
	mov	r5, r0
	sub	r3, r1, #1
	strd	r6, [sp, #8]
	cmn	r3, #3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	fp, r2
	str	lr, [sp, #32]
	ldr	r0, [r0, #28]
	.pad #20
	sub	sp, sp, #20
	ldr	r6, [r0, #16]
	sub	r1, r1, r6
	bhi	.L181
	ldr	r2, [r0, #4]
	mov	r10, #1
	ldr	r3, [r5, #692]
	ldr	r8, [r2]
	rsb	r8, r8, r1, lsr r3
	rsbs	r3, r8, #0
	and	r2, r8, #31
	and	r3, r3, #31
	add	r9, r8, #31
	rsbpl	r2, r3, #0
	cmp	r8, #0
	movge	r9, r8
	add	r4, r8, r8, lsl r10
	asr	r9, r9, #5
	lsl	r10, r10, r2
	lsl	r9, r9, #2
	lsl	r3, r4, #3
.L164:
	ldr	r0, [r0]
	ldr	r2, [r5, #696]
	ldr	r4, [r0, #60]
	sub	r6, r2, #1
	and	r6, r6, r1
	ldrh	r7, [r4, r3]
	add	r4, r4, r3
	add	r7, fp, r7, lsr #6
	lsrs	r3, r7, #16
	bne	.L165
	cmp	r2, r7
	bcc	.L165
.L166:
	ldrh	r3, [r4]
	bfi	r3, r7, #6, #10
	strh	r3, [r4]	@ movhi
	ldr	r3, [r5, #28]
	ldr	r7, [r3]
	ldr	r2, [r7, #72]
	ldr	r1, [r7, #76]
	str	r1, [sp, #8]
	str	r2, [sp, #12]
	bl	get_seconds
	ldr	ip, [r7, #80]
	mvn	r3, r6
	ldr	r2, [sp, #12]
	and	r3, r3, #7
	ldr	lr, [r7, #84]
	mov	r7, #1
	ldr	r1, [sp, #8]
	lsl	r7, r7, r3
	subs	r3, r2, ip
	sxtb	ip, r7
	str	r3, [sp]
	sbc	r3, r1, lr
	str	r3, [sp, #4]
	ldrd	r2, [sp]
	adds	r2, r2, r0
	adc	r3, r3, r0, asr #31
	mov	r0, r2
	cmp	fp, #1
	mov	r1, r3
	strd	r0, [r4, #16]
	ldr	r2, [r5, #28]
	ldr	r2, [r2]
	strd	r0, [r2, #96]
	ldr	r1, [r4, #4]
	bne	.L167
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r7
	orr	r2, ip, r2
	strb	r2, [r1, r6, lsr #3]
	bne	.L187
.L168:
	ldr	r2, [r5]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L188
.L169:
	ldr	r1, [r4, #12]
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r7
	orr	r2, ip, r2
	strb	r2, [r1, r6, lsr #3]
	bne	.L170
	ldr	r2, [r5, #744]
	sub	r2, r2, #1
	str	r2, [r5, #744]
.L170:
	ldr	r0, [r4, #8]
	ldrb	r2, [r4]	@ zero_extendqisi2
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, #63
	cmp	r2, #4
	and	r2, r1, r7
	beq	.L189
.L171:
	cmp	r2, #0
	bne	.L175
	ldrh	r3, [r4, #2]
	ubfx	r2, r3, #0, #10
	add	r2, fp, r2
	bfi	r3, r2, #0, #10
	strh	r3, [r4, #2]	@ movhi
.L175:
	ldr	r3, [r5, #28]
	ldr	r2, [r3]
	ldr	r1, [r2, #28]
	ldr	r3, [r1, r9]
	tst	r3, r10
	orr	r10, r3, r10
	str	r10, [r1, r9]
	bne	.L176
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	str	r3, [r2, #32]
.L176:
	ldr	r3, [r5, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, fp
	str	r3, [r2, #12]
	ldr	r3, [r5, #700]
	cmp	r3, #1
	bls	.L163
	ldr	r2, [r5, #28]
	udiv	r8, r8, r3
	ldr	r3, [r2]
	ldr	r3, [r3, #64]
	ldr	r2, [r3, r8, lsl #2]
	add	fp, r2, fp
	str	fp, [r3, r8, lsl #2]
.L163:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L181:
	mov	r9, #0
	mvn	r3, #23
	mov	r10, r9
	mvn	r8, #0
	b	.L164
.L188:
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L169
	b	.L170
.L187:
	movw	r0, #:lower16:.LC0
	movw	r1, #1603
	str	ip, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	ldr	ip, [sp]
	b	.L168
.L167:
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	mvn	r3, ip
	tst	r2, r7
	and	r2, r2, r3
	strb	r2, [r1, r6, lsr #3]
	beq	.L190
.L173:
	ldr	r2, [r5]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L191
.L174:
	ldr	r2, [r4, #12]
	ldrb	r1, [r2, r6, lsr #3]	@ zero_extendqisi2
	and	r3, r3, r1
	tst	r1, r7
	strb	r3, [r2, r6, lsr #3]
	beq	.L186
	ldr	r3, [r5, #744]
	add	r3, r3, #1
	str	r3, [r5, #744]
.L186:
	ldr	r3, [r4, #8]
	ldrb	r2, [r3, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r7
	b	.L171
.L189:
	orr	r3, ip, r1
	cmp	r2, #0
	strb	r3, [r0, r6, lsr #3]
	bne	.L186
	ldrh	r3, [r4, #2]
	ldr	r2, [r4, #8]
	add	r1, r3, #1
	bfi	r3, r1, #0, #10
	strh	r3, [r4, #2]	@ movhi
	ldrb	r2, [r2, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r7
	b	.L171
.L191:
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L174
	b	.L186
.L165:
	movw	r0, #:lower16:.LC0
	movw	r1, #1587
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	b	.L166
.L190:
	movw	r0, #:lower16:.LC0
	movw	r1, #1624
	str	r3, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp]
	b	.L173
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
	mov	r4, r2
	strd	r6, [sp, #8]
	mov	r7, r0
	mov	r6, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	mov	r0, r1
	ldr	r8, [r3, #8]
	add	r5, r8, r2, lsl #2
	ldr	r1, [r5, #4]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L193
	ldr	r3, [r5, #56]
	sub	r3, r3, #1
	str	r3, [r5, #56]
.L193:
	cmp	r4, #6
	beq	.L207
.L192:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L207:
	ldr	r3, [r7, #28]
	add	r5, r6, r6, lsl #1
	mov	r0, r6
	lsl	r5, r5, #3
	ldr	r3, [r3]
	ldr	r3, [r3, #60]
	ldrb	r4, [r3, r5]	@ zero_extendqisi2
	and	r4, r4, #63
	add	r4, r8, r4, lsl #2
	ldr	r1, [r4, #4]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L196
	ldr	r3, [r4, #56]
	sub	r3, r3, #1
	str	r3, [r4, #56]
.L196:
	ldr	r3, [r7, #28]
	ldr	r0, [r7, #700]
	ldr	r2, [r3]
	cmp	r0, #1
	bls	.L197
	udiv	r3, r6, r0
	ldr	r2, [r2, #64]
	ldr	r3, [r2, r3, lsl #2]
.L198:
	cmp	r3, #0
	bne	.L192
	udiv	r0, r6, r0
	ldr	r1, [r8, #88]
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	_clear_bit
.L197:
	ldr	r3, [r2, #60]
	ldrh	r3, [r3, r5]
	lsr	r3, r3, #6
	b	.L198
	.fnend
	.size	__remove_dirty_segment, .-__remove_dirty_segment
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
	ldr	r2, [r0, #28]
	ldr	r3, [r2, #12]
	ldr	ip, [r3, #48]
	cmp	ip, r1
	bxeq	lr
	ldr	ip, [r3, #112]
	cmp	ip, r1
	bxeq	lr
	ldr	ip, [r3, #176]
	cmp	ip, r1
	bxeq	lr
	ldr	ip, [r3, #240]
	cmp	ip, r1
	bxeq	lr
	ldr	ip, [r3, #304]
	cmp	ip, r1
	bxeq	lr
	ldr	r3, [r3, #368]
	cmp	r3, r1
	bxeq	lr
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r6, [r2, #8]
	add	r6, r6, #36
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r5, #28]
	add	r3, r4, r4, lsl #1
	lsl	r3, r3, #3
	ldr	r2, [r2]
	ldr	r2, [r2, #60]
	ldrh	r3, [r2, r3]
	lsrs	r3, r3, #6
	beq	.L219
	ldr	r2, [r5, #696]
	mov	r1, r4
	mov	r0, r5
	cmp	r2, r3
	mov	r2, #6
	bls	.L212
	bl	__locate_dirty_segment
.L211:
	mov	r0, r6
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	mutex_unlock
.L219:
	mov	r1, r4
	mov	r0, r5
	mov	r2, #7
	bl	__locate_dirty_segment
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L211
.L212:
	bl	__remove_dirty_segment
	b	.L211
	.fnend
	.size	locate_dirty_segment, .-locate_dirty_segment
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__add_sum_entry, %function
__add_sum_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	ldr	ip, [r2]	@ unaligned
	ldr	r3, [r3, #12]
	add	r1, r3, r1, lsl #6
	ldrh	r3, [r1, #52]
	ldr	r0, [r1, #20]
	rsb	r3, r3, r3, lsl #3
	add	r1, r0, r3
	str	ip, [r0, r3]	@ unaligned
	ldrh	r0, [r2, #4]	@ unaligned
	ldrb	r3, [r2, #6]	@ zero_extendqisi2
	strh	r0, [r1, #4]	@ unaligned
	strb	r3, [r1, #6]
	bx	lr
	.fnend
	.size	__add_sum_entry, .-__add_sum_entry
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
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	ldr	r5, [r3, #12]
	add	r5, r5, r1, lsl #6
	mov	r1, r2
	bl	grab_meta_page
	mov	r6, r0
	ldr	r4, [r5, #20]
	add	r8, r5, #24
	bl	page_address
	mov	r7, r0
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r8
	bl	down_read
	movw	r2, #507
	ldr	r1, [r5, #40]
	add	r0, r7, #3584
	bl	memcpy
	mov	r0, r8
	bl	up_read
	mov	r1, r4
	mov	r2, #3584
	mov	r0, r7
	bl	memcpy
	ldr	r3, [r4, #4091]	@ unaligned
	mov	r0, r5
	str	r3, [r7, #4091]	@ unaligned
	ldrb	r3, [r4, #4095]	@ zero_extendqisi2
	strb	r3, [r7, #4095]
	bl	mutex_unlock
	mov	r0, r6
	bl	set_page_dirty
	cmp	r6, #0
	beq	.L221
	ldr	r3, [r6]
	tst	r3, #1
	beq	.L225
.L223:
	mov	r0, r6
	bl	unlock_page
	ldrd	r4, [sp]
	mov	r0, r6
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	put_page
.L221:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L225:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r6, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L223
	.fnend
	.size	write_current_sum_page, .-write_current_sum_page
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	submit_flush_wait, %function
submit_flush_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0]
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r4, #1076]
	adds	r3, r0, #0
	movne	r3, #1
	cmp	r2, #0
	moveq	r3, #1
	cmp	r3, #0
	beq	.L233
.L226:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L233:
	cmp	r2, #1
	movgt	r5, #80
	movgt	r6, #1
	ble	.L229
.L228:
	ldr	r3, [r4, #1080]
	mov	r0, r4
	add	r6, r6, #1
	ldr	r1, [r3, r5]
	add	r5, r5, #80
	bl	__submit_flush_wait
	cmp	r0, #0
	bne	.L226
	ldr	r3, [r4, #1076]
	cmp	r6, r3
	blt	.L228
.L229:
	mov	r0, #0
	b	.L226
	.fnend
	.size	submit_flush_wait, .-submit_flush_wait
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
	mov	r5, r0
	strd	r6, [sp, #8]
	movw	r7, #:lower16:autoremove_wake_function
	strd	r8, [sp, #16]
	mov	r8, #57344
	movt	r7, #:upper16:autoremove_wake_function
	str	r10, [sp, #24]
	movt	r8, 65535
	str	lr, [sp, #28]
	ldr	r3, [r0, #28]
	.pad #24
	sub	sp, sp, #24
	ldr	r4, [r3, #76]
	add	r6, r4, #4
.L235:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L254
.L257:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L237
	.syntax divided
@ 37 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r2, r4, #24
	.syntax divided
@ 52 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r3, [r2]
	strex	r1, r0, [r2]
	teq	r1, #0
	bne	1b
@ 0 "" 2
@ 98 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	str	r3, [r4, #28]
	bne	.L239
	b	.L238
.L246:
	mov	r3, r2
.L239:
	ldr	r2, [r3]
	str	r0, [r3]
	mov	r0, r3
	cmp	r2, #0
	bne	.L246
.L238:
	str	r3, [r4, #28]
	mov	r0, r5
	bl	submit_flush_wait
	mov	r9, r0
	add	r3, r4, #16
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #28]
	cmp	r0, #0
	sub	r0, r0, #16
	beq	.L240
.L241:
	ldr	r10, [r0, #16]
	str	r9, [r0, #20]
	bl	complete
	cmp	r10, #0
	sub	r0, r10, #16
	bne	.L241
.L240:
	mov	r3, #0
	str	r3, [r4, #28]
.L237:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L235
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L235
	mov	r2, sp
	str	r3, [sp, #4]
	and	r2, r2, r8
	str	r3, [sp, #8]
	str	r3, [sp, #12]
	mov	r9, r2
	str	r7, [sp, #12]
	str	r3, [sp, #16]
	str	r3, [sp, #20]
	ldr	r2, [r2, #12]
	add	r3, sp, #16
	str	r2, [sp, #8]
	str	r3, [sp, #16]
	str	r3, [sp, #20]
	b	.L244
.L256:
	bl	schedule
.L244:
	mov	r2, #1
	add	r1, sp, #4
	mov	r0, r6
	bl	prepare_to_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L243
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L243
	ldr	r3, [r9, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L256
.L243:
	add	r1, sp, #4
	mov	r0, r6
	bl	finish_wait
	bl	kthread_should_stop
	cmp	r0, #0
	beq	.L257
.L254:
	mov	r0, #0
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
	.fnend
	.size	issue_flush_thread, .-issue_flush_thread
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__insert_discard_tree.constprop.3, %function
__insert_discard_tree.constprop.3:
	.fnstart
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r2
	strd	r10, [sp, #24]
	mov	r10, r1
	mov	fp, r3
	str	lr, [sp, #32]
	ldr	lr, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	add	ip, sp, #24
	mov	r3, r2
	ldr	r6, [sp, #64]
	str	r5, [ip, #-4]!
	mov	r2, ip
	ldr	r1, [lr, #80]
	add	r1, r1, #4160
	add	r1, r1, #12
	bl	__lookup_rb_tree_for_insert
	ldr	r2, [sp, #20]
	cmp	r6, r5
	ldr	r3, [r4, #28]
	stm	sp, {r0, r2}
	ldr	r7, [r3, #80]
	beq	.L262
.L259:
	movw	r3, #:lower16:.LANCHOR0
	cmp	r6, #512
	movt	r3, #:upper16:.LANCHOR0
	movcc	r2, r6
	ldr	r5, [r3, #8]
	movcs	r2, #512
	mov	r1, #80
	sub	r3, r2, #1
	add	r8, r7, r2, lsl #3
	str	r3, [sp, #8]
	add	r8, r8, #4
	mov	r0, r5
	bl	kmem_cache_alloc
	subs	r4, r0, #0
	beq	.L263
.L260:
	add	r3, r4, #24
	mov	r5, #0
	ldr	r2, .L264
	movw	r1, #:lower16:.LC4
	add	r0, r4, #36
	str	r9, [r4, #12]
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
	mov	r2, r8
	add	r1, r7, r3, lsl #3
	ldr	r3, [sp, #12]
	ldr	r1, [r1, #16]
	mov	r0, r3
	bl	__list_add
	add	r3, r7, #4160
	add	r3, r3, #8
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L263:
	mov	r0, r5
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r4, r0
	b	.L260
.L262:
	movw	r0, #:lower16:.LC0
	mov	r1, #744
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L259
.L265:
	.align	2
.L264:
	.word	.LANCHOR0+12
	.fnend
	.size	__insert_discard_tree.constprop.3, .-__insert_discard_tree.constprop.3
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__queue_discard_cmd, %function
__queue_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:__tracepoint_f2fs_queue_discard
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r3
	movt	ip, #:upper16:__tracepoint_f2fs_queue_discard
	strd	r6, [sp, #8]
	mov	r6, r2
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	r10, r1
	mov	fp, r0
	str	lr, [sp, #32]
	ldr	r1, [ip, #4]
	.pad #60
	sub	sp, sp, #60
	cmp	r1, #0
	bne	.L343
.L268:
	ldr	r3, [fp, #1076]
	cmp	r3, #0
	moveq	r9, r6
	beq	.L272
	mov	r1, r6
	mov	r0, fp
	bl	f2fs_target_device_index
	ldr	r3, [fp, #1080]
	add	r0, r0, r0, lsl #2
	add	r3, r3, r0, lsl #4
	ldr	r9, [r3, #72]
	sub	r9, r6, r9
.L272:
	ldr	r3, [fp, #28]
	mov	r4, #0
	add	r8, r6, r5
	str	r4, [sp, #40]
	str	r4, [sp, #44]
	ldr	r3, [r3, #80]
	add	r1, r3, #4160
	add	r2, r3, #4096
	str	r3, [sp, #20]
	add	r7, r1, #12
	add	r3, r2, #32
	mov	r0, r3
	str	r7, [sp, #16]
	str	r3, [sp, #24]
	str	r4, [sp, #48]
	str	r4, [sp, #52]
	bl	mutex_lock
	add	r0, sp, #52
	add	r3, sp, #48
	add	r1, sp, #44
	mov	r2, #1
	stm	sp, {r1, r3}
	mov	r1, r4
	add	r3, sp, #40
	str	r0, [sp, #8]
	mov	r0, r7
	str	r2, [sp, #12]
	mov	r2, r6
	bl	__lookup_rb_tree_ret
	cmp	r0, #0
	beq	.L273
	mov	r5, r4
	mov	r7, r4
	str	r0, [sp, #40]
.L274:
	ldr	r2, [sp, #20]
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	add	r2, r2, #4096
	strd	r2, [sp, #28]
	b	.L291
.L344:
	ldr	r2, [r0, #12]
	ldr	r1, [r0, #16]
	add	r2, r1, r2
	cmp	r6, r2
	movcs	r4, r6
	movcc	r4, r2
	cmp	r8, r4
	bls	.L297
	ldr	r3, [sp, #44]
	cmp	r3, #0
	beq	.L278
	ldr	r5, [r3, #12]
	cmp	r8, r5
	bcc	.L278
	subs	r5, r5, r4
	sub	r7, r9, r6
	add	r7, r7, r4
	bne	.L336
.L339:
	str	r3, [sp, #40]
.L298:
	mov	r0, r3
	bl	rb_next
	str	r0, [sp, #44]
	ldr	r0, [sp, #40]
.L291:
	cmp	r0, #0
	bne	.L344
	cmp	r5, #0
	ldr	r3, [sp, #44]
	beq	.L280
.L284:
	cmp	r3, #0
	beq	.L293
.L292:
	ldrb	r1, [r3, #54]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L293
	ldr	r2, [r3, #48]
	cmp	r10, r2
	bne	.L293
	ldr	r2, [r3, #12]
	add	r0, r5, r4
	cmp	r0, r2
	moveq	r2, r1
	bne	.L293
.L303:
	ldr	ip, [r3, #16]
	str	r2, [sp, #36]
	mov	r1, r3
	str	r4, [r3, #12]
	ldr	r0, [sp, #20]
	ldr	r2, [sp, #28]
	str	r7, [r3, #20]
	add	ip, ip, r5
	str	ip, [r3, #16]
	ldr	r3, [r2, #60]
	add	r3, r3, r5
	str	r3, [r2, #60]
	bl	__relocate_discard_cmd
	ldr	r2, [sp, #36]
	cmp	r2, #0
	beq	.L288
	mov	r1, r2
	mov	r0, fp
	bl	__remove_discard_cmd
.L288:
	mov	r0, fp
	ldr	r1, [sp, #16]
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	bne	.L341
	movw	r1, #1080
	b	.L342
.L347:
	ldrb	r0, [r3, #54]	@ zero_extendqisi2
	ldr	r2, [sp, #40]
	cmp	r0, #0
	add	r4, r2, #12
	ldm	r4, {r4, r5, r7}
	bne	.L339
	ldr	r0, [r3, #48]
	cmp	r10, r0
	beq	.L345
.L300:
	mov	r3, r1
.L280:
	cmp	r3, #0
	str	r3, [sp, #40]
	bne	.L298
.L297:
	ldr	r0, [sp, #24]
	bl	mutex_unlock
	mov	r0, #0
	add	sp, sp, #60
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L278:
	subs	r5, r8, r4
	sub	r7, r9, r6
	add	r7, r7, r4
	beq	.L280
	ldrb	ip, [r0, #54]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L284
.L302:
	ldr	ip, [r0, #48]
	cmp	r10, ip
	bne	.L284
	cmp	r6, r2
	bhi	.L284
	ldr	r2, [sp, #28]
	add	r3, r1, r5
	mov	r1, r0
	str	r3, [r0, #16]
	ldr	r0, [sp, #20]
	ldr	r3, [r2, #60]
	add	r5, r3, r5
	str	r5, [r2, #60]
	bl	__relocate_discard_cmd
	ldr	r1, [sp, #16]
	mov	r0, fp
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	beq	.L346
.L285:
	ldr	r3, [sp, #44]
	cmp	r3, #0
	mov	r1, r3
	bne	.L347
	str	r3, [sp, #40]
	b	.L297
.L293:
	mov	r3, r7
	mov	r2, r4
	str	r5, [sp]
	mov	r1, r10
	mov	r0, fp
	bl	__insert_discard_tree.constprop.3
	ldr	r1, [sp, #16]
	mov	r0, fp
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	beq	.L290
.L341:
	ldr	r3, [sp, #44]
	cmp	r3, #0
	str	r3, [sp, #40]
	bne	.L298
	b	.L297
.L336:
	ldrb	ip, [r0, #54]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L302
	b	.L292
.L273:
	ldr	r0, [sp, #40]
	cmp	r0, #0
	bne	.L305
	ldr	r3, [sp, #44]
	cmp	r3, #0
	beq	.L275
	ldr	r3, [r3, #12]
	sub	r3, r3, r6
	cmp	r5, r3
	movcs	r5, r3
.L275:
	mov	r7, r9
	mov	r4, r6
	b	.L274
.L290:
	mov	r1, #1088
.L342:
	ldr	r0, [sp, #32]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L341
.L343:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r4, [ip, #16]
	cmp	r4, #0
	beq	.L269
	ldr	r7, [r4]
.L270:
	ldr	r0, [r4, #4]
	mov	r3, r5
	mov	r2, r6
	mov	r1, r10
	blx	r7
	ldr	r7, [r4, #8]!
	cmp	r7, #0
	bne	.L270
.L269:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L268
	bl	preempt_schedule
	b	.L268
.L346:
	movw	r1, #1063
	ldr	r0, [sp, #32]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L285
.L305:
	mov	r5, r4
	mov	r7, r4
	b	.L274
.L345:
	ldr	r0, [r3, #12]
	add	ip, r4, r5
	cmp	ip, r0
	bne	.L300
	b	.L303
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
	add	r9, r1, r2
	mov	r2, #0
	strd	r10, [sp, #24]
	mov	r8, r0
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	bl	f2fs_target_device
	cmp	r4, r9
	bcs	.L349
	mov	fp, r0
	mov	r2, r4
	mov	r3, #0
	add	r4, r4, #1
	stm	sp, {r9, fp}
	mov	r6, #0
	mov	r7, #0
	mov	r5, #0
	mov	r10, r2
	mov	fp, r3
	b	.L350
.L355:
	cmp	fp, r5
	cmpeq	r10, r4
	beq	.L352
	mov	r2, #0
	mov	r0, r8
	bl	f2fs_target_device
	ldr	r1, [sp, #4]
	mov	r9, r0
	cmp	r1, r0
	beq	.L352
	mov	r3, r6
	mov	r2, r10
	mov	r0, r8
	bl	__queue_discard_cmd
	cmp	r0, #0
	bne	.L348
	mov	r10, r4
	mov	fp, r5
	str	r9, [sp, #4]
	mov	r6, #0
	mov	r7, #0
.L352:
	adds	r4, r4, #1
	adc	r5, r5, #0
.L350:
	ldr	ip, [r8, #28]
	cmp	r4, #1
	sub	r3, r4, #1
	mov	r1, r4
	mvnls	r0, #23
	ldr	r2, [ip, #16]
	sub	r2, r3, r2
	bls	.L353
	ldr	r0, [ip, #4]
	ldr	r3, [r8, #692]
	ldr	r0, [r0]
	rsb	r0, r0, r2, lsr r3
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #3
.L353:
	ldr	ip, [ip]
	ldr	r3, [r8, #696]
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
	bne	.L354
	ldr	r3, [r8, #744]
	sub	r3, r3, #1
	str	r3, [r8, #744]
.L354:
	ldr	r3, [sp]
	adds	r6, r6, #1
	adc	r7, r7, #0
	cmp	r3, r1
	bhi	.L355
	orrs	r3, r6, r7
	ldr	fp, [sp, #4]
	bne	.L364
.L349:
	mov	r0, #0
.L348:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L364:
	mov	r3, r6
	mov	r2, r10
	mov	r1, fp
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
	.type	__issue_discard_cmd, %function
__issue_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, r0
	movw	r2, #:lower16:__tracepoint_f2fs_issue_discard
	strd	r6, [sp, #8]
	movt	r2, #:upper16:__tracepoint_f2fs_issue_discard
	movw	r0, #:lower16:f2fs_submit_discard_endio
	strd	r8, [sp, #16]
	movt	r0, #:upper16:f2fs_submit_discard_endio
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #116
	sub	sp, sp, #116
	str	r3, [sp, #32]
	ldr	r3, [r3, #28]
	str	r1, [sp, #36]
	str	r2, [sp, #64]
	mov	r2, #0
	str	r0, [sp, #72]
	ldr	r3, [r3, #80]
	str	r2, [sp, #24]
	add	r2, r3, #4096
	add	r3, r3, #4
	add	r0, r2, #32
	add	r2, r2, #4
	str	r2, [sp, #28]
	str	r3, [sp, #68]
	str	r0, [sp, #76]
	bl	mutex_lock
	add	r0, sp, #88
	bl	blk_start_plug
.L394:
	ldr	r1, [sp, #28]
	ldr	r3, [r1]
	ldr	r2, [r3]
	mov	r9, r3
	sub	r3, r3, #24
	cmp	r1, r9
	str	r3, [sp, #8]
	sub	r3, r2, #24
	str	r3, [sp, #12]
	bne	.L393
	b	.L366
.L399:
	ldr	r3, [sp, #32]
	ldr	r3, [r3]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #492]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L369
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L425
.L369:
	ldr	r3, [sp, #24]
	cmp	r3, #8
	add	r3, r3, #1
	bgt	.L401
.L433:
	str	r3, [sp, #24]
.L396:
	ldr	r9, [sp, #12]
	ldr	r2, [sp, #28]
	str	r9, [sp, #8]
	ldr	r3, [r9, #24]!
	sub	r3, r3, #24
	cmp	r9, r2
	str	r3, [sp, #12]
	beq	.L366
.L393:
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #54]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L426
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L399
.L420:
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #32]
	ldr	r4, [r2, #16]
	ldr	r3, [r3, #28]
	ldr	r6, [r2, #20]
	ldr	r2, [r2, #48]
	ldr	r3, [r3, #80]
	str	r2, [sp, #16]
	str	r3, [sp, #56]
	ldr	r3, [sp, #64]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L427
.L372:
	ldr	r3, [sp, #16]
	lsr	r2, r6, #29
	lsr	fp, r4, #29
	lsl	r10, r4, #3
	lsl	r6, r6, #3
	str	r2, [sp, #4]
	ldr	r3, [r3, #88]
	ldr	r1, [r3, #492]
	cmp	r1, #0
	beq	.L428
	ldr	r3, [r1, #556]
	tst	r3, #16384
	beq	.L429
	add	r3, r1, #776
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L379
	lsr	r2, r3, #9
	ldr	r0, [sp, #4]
	orr	r3, r6, r10
	sub	r2, r2, #1
	and	r3, r2, r3
	asr	r5, r2, #31
	orr	r0, r0, fp
	str	r3, [sp, #48]
	and	r3, r5, r0
	str	r3, [sp, #52]
	ldrd	r2, [sp, #48]
	orrs	r3, r2, r3
	bne	.L430
.L379:
	ldr	r0, [sp, #16]
	mov	r5, #0
	ldr	r2, [r1, #768]
	ldr	r3, [r0, #68]
	lsr	r2, r2, #9
	cmp	r2, #1
	movcc	r2, #1
	cmp	r3, r0
	ldrne	r3, [r0, #76]
	ldreq	r3, [r1, #772]
	str	r2, [sp, #20]
	ldr	r1, [sp, #20]
	ldrne	r3, [r3, #24]
	orrs	r2, r10, fp
	asr	r3, r3, #9
	udiv	r2, r3, r1
	mls	r3, r1, r2, r3
	str	r3, [sp, #40]
	beq	.L382
	str	r3, [sp, #44]
	str	r9, [sp, #60]
	b	.L391
.L388:
	ldr	r1, [sp, #4]
	lsl	r3, r8, #9
	mov	r2, #129
	subs	r10, r10, r8
	str	r6, [r5]
	sbc	fp, fp, #0
	str	r9, [sp, #4]
	mov	r6, r7
	str	r1, [r5, #4]
	ldr	r1, [sp, #16]
	str	r3, [r5, #32]
	str	r1, [r5, #12]
	str	r2, [r5, #20]
	bl	_cond_resched
	orrs	r3, r10, fp
	beq	.L431
.L391:
	mov	r3, #0
	movw	r2, #65535
	movt	r2, 127
	cmp	fp, r3
	cmpeq	r10, r2
	mov	r3, fp
	mov	r2, r10
	bls	.L383
	movw	r2, #65535
	mov	r3, #0
	movt	r2, 127
.L383:
	ldr	r1, [sp, #4]
	adds	r7, r6, r2
	mov	r8, r2
	adc	r9, r1, r3
	cmp	r3, fp
	cmpeq	r2, r10
	bcs	.L384
	mov	r0, r7
	mov	r1, r9
	ldr	r4, [sp, #20]
	.syntax divided
@ 866 "/home/Jprimero15/hlte/lolz/fs/f2fs/segment.c" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [sp, #40]
	cmp	r3, r1
	beq	.L384
	ldr	r8, [sp, #44]
	mov	r3, #0
	subs	r0, r7, r8
	sbc	r1, r9, r3
	.syntax divided
@ 868 "/home/Jprimero15/hlte/lolz/fs/f2fs/segment.c" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [sp, #20]
	umull	r0, r1, ip, r2
	mla	r1, ip, r3, r1
	adds	r7, r0, r8
	sub	r8, r7, r6
	adc	r9, r1, #0
.L384:
	cmp	r5, #0
	beq	.L390
	mov	r1, r5
	mov	r0, #0
	bl	submit_bio_wait
	mov	r4, r0
	mov	r0, r5
	bl	bio_put
	cmp	r4, #0
	bne	.L432
.L390:
	mov	r1, #1
	mov	r0, #16
	bl	bio_alloc
	subs	r5, r0, #0
	bne	.L388
	mov	r1, #1
	mov	r0, #2064
	bl	bio_alloc
	mov	r5, r0
	b	.L388
.L431:
	ldr	r9, [sp, #60]
.L382:
	ldr	r1, [sp, #8]
	mov	r2, #0
	mov	r3, #1
	ldr	r0, [sp, #56]
	strb	r3, [r1, #54]
	str	r2, [r1, #56]
	add	r3, r0, #4160
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
	beq	.L392
	ldr	r3, [sp, #72]
	mov	r1, r5
	mov	r0, #16
	str	r3, [r5, #56]
	ldr	r3, [sp, #8]
	str	r3, [r5, #60]
	bl	submit_bio
	mov	r0, r9
	bl	__list_del_entry
	ldr	r2, [sp, #56]
	mov	r0, r9
	add	r3, r2, #4096
	add	r2, r3, #12
	ldr	r1, [r3, #16]
	bl	__list_add
.L392:
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L396
	b	.L369
.L425:
	ldr	r4, [sp, #32]
	add	r0, sp, #80
	ldr	r2, [r4, #476]
	strd	r2, [sp, #80]
	bl	timespec_to_jiffies
	movw	r2, #:lower16:jiffies
	ldr	r3, [r4, #468]
	movt	r2, #:upper16:jiffies
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L369
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #54]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L420
	ldr	r3, [sp, #24]
	cmp	r3, #8
	add	r3, r3, #1
	ble	.L433
.L401:
	add	r0, sp, #88
	bl	blk_finish_plug
	ldr	r0, [sp, #76]
	bl	mutex_unlock
	add	sp, sp, #116
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L426:
	movw	r0, #:lower16:.LC0
	movw	r1, #1131
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldr	r3, [sp, #32]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L399
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #54]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L396
	b	.L420
.L366:
	ldr	r3, [sp, #28]
	ldr	r2, [sp, #68]
	sub	r3, r3, #8
	cmp	r2, r3
	str	r3, [sp, #28]
	bne	.L394
	b	.L401
.L432:
	ldr	r3, [sp, #8]
	str	r4, [r3, #56]
.L377:
	ldr	r1, [sp, #8]
	ldr	r0, [sp, #32]
	bl	__remove_discard_cmd
	b	.L392
.L427:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #64]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L373
	ldr	r7, [r5]
	ldr	r8, [sp, #16]
.L374:
	ldr	r0, [r5, #4]
	mov	r3, r4
	mov	r2, r6
	mov	r1, r8
	blx	r7
	ldr	r7, [r5, #8]!
	cmp	r7, #0
	bne	.L374
.L373:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L375
.L423:
	ldr	r3, [sp, #8]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #20]
	ldr	r3, [r3, #48]
	str	r3, [sp, #16]
	b	.L372
.L429:
	ldr	r2, [sp, #8]
	mvn	r3, #94
	str	r3, [r2, #56]
	b	.L377
.L430:
	ldr	r2, [sp, #8]
	mvn	r3, #21
	str	r3, [r2, #56]
	b	.L377
.L375:
	bl	preempt_schedule
	b	.L423
.L428:
	ldr	r2, [sp, #8]
	mvn	r3, #5
	str	r3, [r2, #56]
	b	.L377
	.fnend
	.size	__issue_discard_cmd, .-__issue_discard_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	issue_discard_thread, %function
issue_discard_thread:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	.pad #24
	sub	sp, sp, #24
	mov	r3, sp
	bic	r7, r3, #8128
	ldr	r3, [r0, #28]
	bic	r7, r7, #63
	ldr	r8, [r3, #80]
	add	r6, r8, #4096
	add	r6, r6, #20
.L435:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L440
.L443:
	mov	r1, #1
	mov	r0, r4
	bl	__issue_discard_cmd
	mov	r1, #1
	mov	r0, r4
	bl	__wait_discard_cmd
	mov	r1, #2
	mov	r0, #1
	bl	congestion_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L435
	add	r5, r8, #4096
	ldr	r3, [r5, #72]
	cmp	r3, #0
	bne	.L435
	ldr	r0, [r7, #12]
	movw	r2, #:lower16:autoremove_wake_function
	add	r1, sp, #16
	movt	r2, #:upper16:autoremove_wake_function
	str	r3, [sp, #4]
	str	r1, [sp, #16]
	str	r0, [sp, #8]
	str	r2, [sp, #12]
	str	r1, [sp, #20]
	b	.L439
.L442:
	bl	schedule
.L439:
	mov	r2, #1
	add	r1, sp, #4
	mov	r0, r6
	bl	prepare_to_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L438
	ldr	r3, [r5, #72]
	cmp	r3, #0
	bne	.L438
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L442
.L438:
	add	r1, sp, #4
	mov	r0, r6
	bl	finish_wait
	bl	kthread_should_stop
	cmp	r0, #0
	beq	.L443
.L440:
	mov	r0, #0
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	issue_discard_thread, .-issue_discard_thread
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
	beq	.L444
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
	beq	.L446
	movw	r0, #:lower16:.LC7
	mov	r3, #131072
	str	r4, [sp]
	movt	r0, #:upper16:.LC7
	mov	r2, r4
	mov	r1, #16
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5, #4]
	beq	.L447
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
	bne	.L444
.L448:
	ldr	r0, [r5, #4]
	bl	kmem_cache_destroy
.L447:
	ldr	r0, [r5, #8]
	bl	kmem_cache_destroy
.L446:
	ldr	r0, [r5]
	bl	kmem_cache_destroy
	mvn	r0, #11
.L444:
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
	movne	r2, #0
	bne	.L460
	b	.L459
.L461:
	mov	r0, r3
.L460:
	ldr	r3, [r0]
	str	r2, [r0]
	mov	r2, r0
	cmp	r3, #0
	bne	.L461
.L459:
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
	beq	.L486
.L466:
	add	r7, r6, #432
	str	r5, [r5]
	mov	r0, r7
	str	r5, [r5, #4]
	str	r4, [r5, #8]
	bl	mutex_lock
	ldr	r3, [r4]
	tst	r3, #32768
	bne	.L467
.L469:
	mov	r3, r4
	ldr	r2, [r3, #16]!
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L468:
	add	r2, r6, #424
	mov	r0, r5
	ldr	r1, [r6, #428]
	bl	__list_add
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #616]
	add	r2, r3, #772
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
	bne	.L487
.L465:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L486:
	mov	r0, r7
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r5, r0
	b	.L466
.L467:
	mov	r0, r4
	bl	__get_page_tail
	cmp	r0, #0
	bne	.L468
	b	.L469
.L487:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L472
	ldr	r3, [r5]
.L473:
	ldr	r0, [r5, #4]
	mov	r2, #5
	mov	r1, r4
	blx	r3
	ldr	r3, [r5, #8]!
	cmp	r3, #0
	bne	.L473
.L472:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L465
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
	bne	.L521
.L489:
	add	r8, r4, #432
	mov	r0, r8
	bl	mutex_lock
	ldr	r4, [r4, #424]
	cmp	r4, r6
	mov	r0, r4
	bne	.L493
	b	.L490
.L522:
	ldr	r4, [r4]
	cmp	r4, r6
	mov	r0, r4
	beq	.L490
.L493:
	ldr	r3, [r4, #8]
	cmp	r3, r5
	bne	.L522
	cmp	r4, #0
	beq	.L523
.L495:
	bl	list_del
	mov	r0, r8
	bl	mutex_unlock
	add	r3, r7, #772
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
	beq	.L496
	mov	r0, r5
	bl	put_page
.L496:
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L524
.L488:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L490:
	cmp	r4, #0
	beq	.L494
	ldr	r3, [r4, #8]
	cmp	r3, r5
	moveq	r0, r6
	beq	.L495
.L494:
	movw	r0, #:lower16:.LC0
	movw	r1, #327
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r7, #16
	bl	_set_bit
	mov	r0, r6
	b	.L495
.L524:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r4, [r3, #16]
	cmp	r4, #0
	beq	.L499
	ldr	r3, [r4]
.L500:
	ldr	r0, [r4, #4]
	mov	r2, #7
	mov	r1, r5
	blx	r3
	ldr	r3, [r4, #8]!
	cmp	r3, #0
	bne	.L500
.L499:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L488
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	preempt_schedule
.L521:
	movw	r0, #:lower16:.LC0
	movw	r1, #319
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L489
.L523:
	mov	r6, r4
	b	.L494
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
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r1, #4
	mov	r4, r0
	str	lr, [sp, #4]
	.pad #24
	sub	sp, sp, #24
	bl	available_free_memory
	cmp	r0, #0
	beq	.L550
.L526:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L551
.L527:
	mov	r1, #0
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L528
	movw	r1, #3640
	mov	r0, r4
	bl	try_to_free_nids
.L529:
	ldr	r3, [r4]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #492]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L530
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L552
.L530:
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcc	.L525
.L538:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L553
.L539:
	ldr	r3, [r4, #864]
	tst	r3, #32768
	bne	.L554
.L537:
	mov	r1, #1
	ldr	r0, [r4]
	bl	f2fs_sync_fs
	ldr	r2, [r4, #908]
	ldr	r3, [r2, #308]
	add	r3, r3, #1
	str	r3, [r2, #308]
.L525:
	add	sp, sp, #24
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L528:
	mov	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	build_free_nids
	b	.L529
.L550:
	mov	r1, #128
	mov	r0, r4
	bl	f2fs_shrink_extent_tree
	b	.L526
.L551:
	movw	r1, #455
	mov	r0, r4
	bl	try_to_free_nats
	b	.L527
.L553:
	mov	r1, #3
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L539
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #8]
	ldr	r3, [r3, #44]
	ldr	r2, [r2, #84]
	cmp	r2, r3
	bhi	.L539
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcs	.L539
	ldr	r3, [r4, #472]
	mov	r2, #0
	mov	r0, sp
	str	r3, [sp]
	str	r2, [sp, #4]
	bl	timespec_to_jiffies
	movw	r2, #:lower16:jiffies
	ldr	r3, [r4, #464]
	movt	r2, #:upper16:jiffies
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L525
	b	.L539
.L554:
	mov	r0, sp
	bl	blk_start_plug
	mov	r1, #1
	mov	r0, r4
	bl	sync_dirty_inodes
	mov	r0, sp
	bl	blk_finish_plug
	b	.L537
.L552:
	ldr	r2, [r4, #476]
	mov	r0, sp
	strd	r2, [sp]
	bl	timespec_to_jiffies
	movw	r2, #:lower16:jiffies
	ldr	r3, [r4, #468]
	movt	r2, #:upper16:jiffies
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L530
	b	.L538
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
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	beq	.L556
	ldr	r2, [r0, #20]
	movw	r3, #34463
	movt	r3, 1
	ldr	r2, [r2, #76]
	cmp	r2, r3
	bhi	.L565
.L556:
	ldr	r2, [r4, #692]
	mov	r1, #0
	ldr	r0, [r4, #696]
	ldr	lr, [r4, #700]
	ldr	r3, [r4, #764]
	rsb	r5, r2, #32
	mul	r0, r0, lr
	adds	r6, r0, r3
	adc	r7, r1, r3, asr #31
	subs	r3, r6, #1
	lsr	r3, r3, r2
	sbc	ip, r7, #0
	subs	r6, r2, #32
	orr	r3, r3, ip, lsl r5
	orrpl	r3, r3, ip, asr r6
	ldr	ip, [r4, #756]
	ldr	r8, [r4, #776]
	udiv	r3, r3, lr
	adds	r6, r0, ip
	adc	r7, r1, ip, asr #31
	subs	ip, r6, #1
	lsr	ip, ip, r2
	sbc	r6, r7, #0
	subs	r7, r2, #32
	orr	ip, ip, r6, lsl r5
	orrpl	ip, ip, r6, asr r7
	adds	r6, r0, r8
	adc	r7, r1, r8, asr #31
	subs	r1, r6, #1
	lsr	r1, r1, r2
	udiv	ip, ip, lr
	sbc	r0, r7, #0
	subs	r2, r2, #32
	orr	r1, r1, r0, lsl r5
	ldr	r5, [r4, #16]
	orrpl	r1, r1, r0, asr r2
	ubfx	r5, r5, #3, #1
	cmp	r5, #0
	udiv	r1, r1, lr
	bne	.L555
	ldr	r2, [r4, #28]
	add	r3, r3, ip, lsl #1
	add	r1, r3, r1
	ldr	r3, [r2, #36]
	ldr	r2, [r2, #4]
	udiv	lr, r3, lr
	ldr	r3, [r2, #8]
	add	r1, r1, lr
	cmp	r3, r1
	bls	.L566
.L555:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L566:
	add	r0, r4, #868
	bl	mutex_lock
	ldrd	r6, [sp, #8]
	mov	r0, r4
	mov	r2, r5
	mov	r1, r5
	mvn	r3, #0
	ldrd	r4, [sp]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	f2fs_gc
.L565:
	bl	f2fs_balance_fs_bg
	b	.L556
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #864]
	ands	ip, r2, #2048
	bne	.L576
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	tst	r2, #1024
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #28]
	.pad #24
	sub	sp, sp, #24
	ldr	r5, [r3, #76]
	beq	.L583
	mov	r6, r5
	ldr	r3, [r6, #20]!
	cmp	r3, #0
	beq	.L584
	movw	r1, #:lower16:.LC4
	ldr	r2, .L587
	add	r0, sp, #4
	movt	r1, #:upper16:.LC4
	str	ip, [sp]
	bl	__init_waitqueue_head
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r6]
	add	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r4, r5
	add	r2, sp, #16
	ldr	r3, [r4, #24]!
.L572:
	str	r3, [sp, #16]
	.syntax divided
@ 193 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
.L571:
	.syntax divided
@ 170 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@ __cmpxchg4
	ldrex	r0, [r4]
	mov	r1, #0
	teq	r0, r3
	strexeq r1, r2, [r4]

@ 0 "" 2
	.arm
	.syntax unified
	cmp	r1, #0
	bne	.L571
	.syntax divided
@ 195 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, r0
	beq	.L585
	mov	r3, r0
	b	.L572
.L576:
	mov	r0, #0
	bx	lr
.L585:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L586
.L573:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L574
	mov	r0, sp
	bl	wait_for_completion
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r6]
	sub	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L575:
	ldr	r0, [sp, #20]
	b	.L567
.L583:
	bl	submit_flush_wait
	add	r3, r5, #16
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L567:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L574:
	.syntax divided
@ 37 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
@ 52 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r2, [r4]
	strex	r1, r3, [r4]
	teq	r1, #0
	bne	1b
@ 0 "" 2
@ 98 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [r5, #20]
	b	.L575
.L584:
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r6]
	add	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	bl	submit_flush_wait
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r6]
	sub	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r5, #16
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	b	.L567
.L586:
	mov	r2, #1
	mov	r1, #3
	add	r0, r5, #4
	bl	__wake_up
	b	.L573
.L588:
	.align	2
.L587:
	.word	.LANCHOR0+12
	.fnend
	.size	f2fs_issue_flush, .-f2fs_issue_flush
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
	mov	r5, r0
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	ldr	r3, [r0]
	.pad #12
	sub	sp, sp, #12
	ldr	r2, [r0, #28]
	ldr	r3, [r3, #208]
	ldr	r4, [r2, #76]
	ldr	r6, [r3]
	cmp	r4, #0
	beq	.L598
.L590:
	lsr	r2, r6, #20
	ubfx	r6, r6, #0, #20
	movw	r3, #:lower16:.LC10
	movw	r0, #:lower16:issue_flush_thread
	movt	r3, #:upper16:.LC10
	stm	sp, {r2, r6}
	movt	r0, #:upper16:issue_flush_thread
	mov	r1, r5
	mvn	r2, #0
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r7, r0
	bhi	.L593
	mov	r6, #0
	bl	wake_up_process
	str	r7, [r4]
.L589:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L598:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L594
	mov	r2, #32
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L599
.L591:
	mov	r7, #0
	movw	r1, #:lower16:.LC9
	ldr	r2, .L600
	movt	r1, #:upper16:.LC9
	add	r0, r4, #4
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	bl	__init_waitqueue_head
	str	r7, [r4, #24]
	ldr	r3, [r5, #28]
	str	r4, [r3, #76]
	ldr	r3, [r5, #864]
	ands	r3, r3, #1024
	moveq	r6, r3
	bne	.L590
	b	.L589
.L594:
	mov	r4, #16
	b	.L591
.L593:
	mov	r0, r4
	str	r7, [r4]
	mov	r6, r7
	bl	kfree
	ldr	r3, [r5, #28]
	mov	r2, #0
	str	r2, [r3, #76]
	b	.L589
.L599:
	mvn	r6, #11
	b	.L589
.L601:
	.align	2
.L600:
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
	mov	r5, r0
	str	r6, [sp, #8]
	mov	r6, r1
	str	lr, [sp, #12]
	ldr	r3, [r0, #28]
	ldr	r4, [r3, #76]
	cmp	r4, #0
	beq	.L603
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L603
	mov	r3, #0
	str	r3, [r4]
	bl	kthread_stop
.L603:
	cmp	r6, #0
	beq	.L602
	mov	r0, r4
	bl	kfree
	ldr	r3, [r5, #28]
	mov	r2, #0
	str	r2, [r3, #76]
.L602:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r1
	mov	r6, r0
	strd	r8, [sp, #16]
	movw	r8, #4172
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r3, #80]
	add	r4, r5, #4096
	add	r4, r4, #32
	mov	r0, r4
	bl	mutex_lock
	add	r0, r5, r8
	mov	r2, r7
	mov	r1, #0
	bl	__lookup_rb_tree
	subs	r5, r0, #0
	beq	.L630
	ldrb	r3, [r5, #54]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L636
	ldrh	r3, [r5, #52]
	mov	r0, r4
	add	r3, r3, #1
	strh	r3, [r5, #52]	@ movhi
	bl	mutex_unlock
	add	r0, r5, #32
	bl	wait_for_completion_io
	mov	r0, r4
	bl	mutex_lock
	ldrb	r3, [r5, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L637
.L629:
	ldrh	r3, [r5, #52]
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r5, #52]	@ movhi
	beq	.L634
.L630:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L636:
	ldr	r1, [r5, #16]
	cmp	r1, #1
	beq	.L634
	ldr	r3, [r6, #28]
	ldr	r9, [r5, #12]
	ldr	r2, [r5, #20]
	ldr	r10, [r3, #80]
	add	fp, r9, r1
	cmp	r7, r9
	sub	r3, fp, #1
	add	ip, r10, #4096
	ldr	r0, [ip, #60]
	sub	r1, r0, r1
	str	r1, [ip, #60]
	bhi	.L619
	cmp	r7, r3
	bcs	.L630
	ldr	r0, [r5, #12]
	mov	r1, r5
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	add	r0, r0, #1
	sub	r3, r3, #1
	add	r2, r2, #1
	str	r0, [r5, #12]
	mov	r0, r10
	str	r3, [r5, #16]
	str	r2, [r5, #20]
	ldr	r2, [ip, #60]
	add	r3, r2, r3
	str	r3, [ip, #60]
	bl	__relocate_discard_cmd
	add	r1, r10, r8
	mov	r0, r6
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	bne	.L630
	movw	r0, #:lower16:.LC0
	movw	r1, #1001
.L635:
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L630
.L634:
	mov	r1, r5
	mov	r0, r6
	bl	__remove_discard_cmd
	b	.L630
.L619:
	ldr	lr, [r5, #12]
	mov	r0, r10
	add	r8, r10, r8
	mov	r1, r5
	strd	r2, [sp, #8]
	sub	lr, r7, lr
	str	lr, [r5, #16]
	ldr	r10, [ip, #60]
	add	lr, r10, lr
	str	lr, [ip, #60]
	bl	__relocate_discard_cmd
	mov	r1, r8
	mov	r0, r6
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	ldrd	r2, [sp, #8]
	beq	.L638
	cmp	r7, r3
	bcs	.L630
.L626:
	mvn	r3, r7
	add	r7, r7, #1
	ldr	r1, [r5, #48]
	add	fp, r3, fp
	add	r3, r2, r7
	sub	r3, r3, r9
	mov	r2, r7
	mov	r0, r6
	str	fp, [sp]
	bl	__insert_discard_tree.constprop.3
	mov	r1, r8
	mov	r0, r6
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	bne	.L630
	movw	r0, #:lower16:.LC0
	movw	r1, #993
	b	.L635
.L637:
	movw	r0, #:lower16:.LC0
	mov	r1, #1184
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L629
.L638:
	movw	r0, #:lower16:.LC0
	movw	r1, #982
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	ldrd	r2, [sp, #8]
	cmp	r7, r3
	bcc	.L626
	b	.L630
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r1, #0
	mov	r4, r0
	str	lr, [sp, #4]
	bl	__issue_discard_cmd
	ldr	lr, [sp, #4]
	mov	r0, r4
	mov	r1, #0
	ldr	r4, [sp]
	add	sp, sp, #8
	b	__wait_discard_cmd
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
	beq	.L641
	movw	r7, #:lower16:.LANCHOR0
	mov	r0, r5
	movt	r7, #:upper16:.LANCHOR0
.L643:
	bl	list_del
	mov	r1, r5
	ldr	r0, [r7]
	mov	r5, r4
	bl	kmem_cache_free
	cmp	r4, r6
	mov	r0, r4
	ldr	r4, [r4]
	bne	.L643
.L641:
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
	strd	r6, [sp, #8]
	mov	r7, r0
	mvn	r6, #0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	fp, r1
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r2, [r1]
	ldr	r10, [r3, #8]
	ldr	r3, [r3, #80]
	and	r2, r2, #16
	ldr	r5, [r10, #32]
	str	r3, [sp]
	add	r3, r3, #4
	str	r2, [sp, #12]
	add	r2, r10, #36
	mov	r0, r2
	str	r2, [sp, #4]
	str	r3, [sp, #24]
	bl	mutex_lock
	ldr	ip, [r7, #28]
.L647:
	ldr	r1, [ip, #32]
	add	r2, r6, #1
	mov	r0, r5
	bl	_find_next_bit_le
	ldr	r3, [r7, #28]
	mov	r9, r0
	mov	r4, r0
	ldr	r1, [r3, #32]
	cmp	r1, r0
	bls	.L648
	add	r8, r0, #1
	mov	r0, r5
	mov	r2, r8
	bl	_find_next_zero_bit_le
	cmp	r9, r0
	mov	r6, r0
	bcs	.L649
	mov	r0, r9
.L650:
	mov	r1, r5
	bl	_clear_bit
	cmp	r6, r8
	mov	r0, r8
	add	r8, r8, #1
	bne	.L650
.L649:
	ldr	r3, [r10, #84]
	add	r3, r4, r3
	sub	r3, r3, r6
	str	r3, [r10, #84]
	ldr	lr, [r7, #864]
	tst	lr, #4
	beq	.L651
	ldr	r3, [sp, #12]
	ldr	ip, [r7, #28]
	cmp	r3, #0
	beq	.L652
	ldrd	r2, [fp, #8]
	mov	r1, #0
	cmp	r1, r3
	cmpeq	r4, r2
	bcc	.L652
	ldrd	r0, [fp, #16]
	mov	r3, #0
	sub	r2, r6, #1
	cmp	r3, r1
	cmpeq	r2, r0
	bls	.L647
.L652:
	tst	lr, #262144
	beq	.L654
	ldr	r2, [r7, #700]
	cmp	r2, #1
	beq	.L654
.L655:
	ldr	r0, [ip, #12]
	udiv	r3, r4, r2
	ldr	r1, [r0, #48]
	udiv	r1, r1, r2
	mul	r8, r2, r3
	cmp	r1, r3
	beq	.L656
	ldr	r1, [r0, #112]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L656
	ldr	r1, [r0, #176]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L656
	ldr	r1, [r0, #240]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L656
	ldr	r1, [r0, #304]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L656
	ldr	r1, [r0, #368]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L656
	cmp	r2, #1
	ldr	r1, [ip]
	bls	.L657
	ldr	r1, [r1, #64]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r3, #0
	beq	.L683
.L656:
	add	r4, r8, r2
	cmp	r6, r4
	bhi	.L655
	sub	r6, r4, #1
	b	.L647
.L651:
	ldr	ip, [r7, #28]
	b	.L647
.L654:
	ldr	r3, [ip, #4]
	sub	r2, r6, r4
	mov	r0, r7
	ldr	r1, [r7, #692]
	ldr	ip, [ip, #16]
	ldr	r3, [r3]
	lsl	r2, r2, r1
	add	r4, r4, r3
	add	r1, ip, r4, lsl r1
	bl	f2fs_issue_discard
	ldr	ip, [r7, #28]
	b	.L647
.L648:
	ldr	r0, [sp, #4]
	bl	mutex_unlock
	ldr	r3, [sp]
	ldr	r2, [sp, #24]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	ldr	r2, [r3]
	str	r3, [sp, #8]
	str	r3, [sp, #16]
	str	r2, [sp, #20]
	beq	.L659
	movw	r3, #:lower16:.LANCHOR0
	mov	r10, r7
	movt	r3, #:upper16:.LANCHOR0
	str	r3, [sp, #28]
.L664:
	ldr	r5, [sp, #8]
	mov	r6, #0
	mov	r4, r6
	ldr	ip, [r10, #696]
	str	r6, [sp, #4]
	ldr	r3, [r5, #12]!
	and	r7, r3, #1
	str	r7, [sp]
	b	.L660
.L685:
	bl	_find_next_zero_bit_le
	ldr	r2, [sp, #12]
	mov	r3, r0
	mov	r9, #0
	sub	ip, r3, r4
	mov	r0, r10
	mov	r8, ip
	cmp	r2, #0
	mov	r2, ip
	beq	.L662
	ldrd	r6, [fp, #24]
	cmp	r7, r9
	cmpeq	r6, ip
	movhi	r4, r3
	bhi	.L663
.L662:
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
.L663:
	ldr	r3, [sp]
	ldr	ip, [r10, #696]
	eor	r3, r3, #1
	cmp	ip, r4
	str	r3, [sp]
	bls	.L684
.L660:
	ldr	r3, [sp]
	mov	r2, r4
	mov	r1, ip
	mov	r0, r5
	cmp	r3, #0
	bne	.L685
	bl	_find_next_bit_le
	mov	r4, r0
	b	.L663
.L684:
	ldr	r6, [sp, #4]
	ldr	r4, [sp, #20]
	ldr	r0, [sp, #16]
	str	r4, [sp, #16]
	bl	list_del
	ldr	r3, [r10, #28]
	ldr	r1, [sp, #8]
	str	r4, [sp, #8]
	ldr	r2, [sp, #28]
	ldr	r3, [r3, #80]
	ldr	r0, [r2]
	add	r3, r3, #4096
	ldr	r2, [r3, #52]
	sub	r2, r2, r6
	str	r2, [r3, #52]
	bl	kmem_cache_free
	ldr	r3, [sp, #24]
	cmp	r4, r3
	ldr	r3, [r4]
	str	r3, [sp, #20]
	bne	.L664
	mov	r7, r10
.L659:
	ldr	r0, [r7, #28]
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
.L657:
	add	r4, r4, r4, lsl #1
	ldr	r1, [r1, #60]
	lsl	r3, r4, #3
	ldrh	r3, [r1, r3]
	lsr	r3, r3, #6
	cmp	r3, #0
	bne	.L656
.L683:
	ldr	r3, [ip, #4]
	mov	r0, r7
	ldr	r1, [r7, #692]
	ldr	ip, [ip, #16]
	ldr	r3, [r3]
	lsl	r2, r2, r1
	add	r3, r8, r3
	add	r1, ip, r3, lsl r1
	bl	f2fs_issue_discard
	ldr	ip, [r7, #28]
	ldr	r2, [r7, #700]
	b	.L656
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
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r2
	mov	r2, #1
	str	r6, [sp, #8]
	mov	r6, r1
	mov	r1, r5
	mov	r4, r0
	str	lr, [sp, #12]
	bl	update_sit_entry
	sub	r3, r6, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L687
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r3, r6, r3
	rsb	r1, r1, r3, lsr r2
	cmn	r1, #1
	bne	.L696
.L687:
	mov	r0, r4
	bl	locate_dirty_segment
	sub	r3, r5, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L689
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r5, r5, r3
	rsb	r1, r1, r5, lsr r2
.L689:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	locate_dirty_segment
.L696:
	mov	r1, r6
	mvn	r2, #0
	mov	r0, r4
	bl	update_sit_entry
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r6, r6, r3
	rsb	r1, r1, r6, lsr r2
	b	.L687
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
	mov	r5, r0
	strd	r6, [sp, #8]
	cmn	r2, #3
	mov	r4, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	ldr	r6, [r3]
	bhi	.L698
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r2, [r0, #692]
	ldr	r7, [r1]
	sub	r3, r4, r3
	rsb	r7, r7, r3, lsr r2
.L699:
	add	r6, r6, #40
	mov	r0, r6
	bl	mutex_lock
	mov	r1, r4
	mov	r0, r5
	mvn	r2, #0
	bl	update_sit_entry
	mov	r0, r5
	mov	r1, r7
	bl	locate_dirty_segment
	ldrd	r4, [sp]
	mov	r0, r6
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L698:
	cmp	r1, #0
	beq	.L703
	cmn	r1, #1
	bne	.L704
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L703:
	movw	r0, #:lower16:.LC0
	movw	r1, #1658
	movt	r0, #:upper16:.LC0
	mvn	r7, #0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	b	.L699
.L704:
	mvn	r7, #0
	b	.L699
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
	str	lr, [sp, #12]
	movhi	r4, #1
	bhi	.L706
	ldr	r3, [r0, #28]
	mov	r4, r0
	mov	r5, r1
	ldr	r6, [r3]
	add	r6, r6, #40
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r4, #28]
	mov	r0, r6
	mov	ip, #1
	ldr	r6, [r4, #692]
	ldr	r3, [r4, #696]
	ldr	lr, [r2]
	ldr	r4, [r2, #4]
	ldr	r1, [r2, #16]
	sub	r3, r3, #1
	ldr	lr, [lr, #60]
	ldr	r2, [r4]
	sub	r1, r5, r1
	and	r3, r3, r1
	rsb	r1, r2, r1, lsr r6
	mvn	r2, r3
	and	r2, r2, #7
	add	r1, r1, r1, lsl ip
	add	r1, lr, r1, lsl #3
	ldr	r1, [r1, #8]
	ldrb	r3, [r1, r3, lsr #3]	@ zero_extendqisi2
	ands	r3, r3, ip, lsl r2
	movne	r4, ip
	moveq	r4, #0
	bl	mutex_unlock
.L706:
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
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r3, #0
	str	lr, [sp, #4]
	ldr	r4, [r0, #368]
	mov	ip, r3
	add	lr, r4, #176
.L713:
	ldrb	r2, [lr], #1	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L719
	cmp	r1, #0
	add	r2, r3, #56
	add	r2, r4, r2, lsl #1
	beq	.L712
	ldrh	r2, [r2, #4]	@ unaligned
	add	ip, ip, r2
.L711:
	add	r3, r3, #1
	cmp	r3, #3
	bne	.L713
	cmp	ip, #440
	movlt	r3, #1
	blt	.L709
	sub	ip, ip, #436
	sub	ip, ip, #3
	cmp	ip, #584
	movle	r3, #2
.L709:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, r3
	ldr	pc, [sp], #4
.L719:
	ldr	r2, [r0, #696]
	add	ip, ip, r2
	b	.L711
.L712:
	ldr	r2, [r0, #28]
	ldr	r2, [r2, #12]
	add	r2, r2, r3, lsl #6
	ldrh	r2, [r2, #52]
	add	ip, ip, r2
	b	.L711
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
	beq	.L722
	mov	r1, r5
	mov	r2, #4096
	bl	memcpy
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	beq	.L721
.L728:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L727
.L725:
	mov	r0, r4
	bl	unlock_page
	ldr	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	put_page
.L722:
	mov	r1, #4096
	bl	__memzero
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	bne	.L728
.L721:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L727:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L725
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
	mov	r4, r2
	mov	r5, r0
	strd	r6, [sp, #8]
	lsl	r7, r1, #6
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	str	r1, [sp, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #24]
	add	r1, r2, r7
	ldr	r2, [r1, #48]
	str	r1, [sp, #8]
	ldr	r1, [r1, #20]
	add	r2, r2, r3
	bl	update_meta_page
	ldr	r3, [r5, #864]
	tst	r3, #8
	movne	r8, #0
	bne	.L730
	sub	r8, r6, #1
	cmp	r8, #1
	movls	r8, #0
	movhi	r8, #1
.L730:
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #700]
	cmp	r3, #1
	beq	.L731
	ldr	r1, [r2, #12]
	add	r7, r1, r7
	ldr	r6, [r7, #48]
	udiv	r10, r6, r3
.L732:
	ldr	r7, [r2, #4]
	ldr	r2, [r5, #704]
	ldr	r3, [r5, #708]
	add	r1, r7, #12
	mov	r0, r1
	udiv	r9, r10, r2
	udiv	r3, r3, r2
	str	r3, [sp]
	str	r1, [sp, #12]
	bl	_raw_spin_lock
	cmp	r4, #0
	bne	.L735
	ldr	r1, [r5, #700]
	add	r2, r6, #1
	udiv	r0, r2, r1
	mls	r0, r1, r0, r2
	cmp	r0, #0
	bne	.L786
.L735:
	movw	r3, #:lower16:.LC0
	mov	fp, r10
	movt	r3, #:upper16:.LC0
	mov	r6, #0
	mov	r4, #1
	str	r3, [sp, #16]
.L734:
	mov	r2, r10
	ldr	r1, [r5, #708]
	ldr	r0, [r7, #20]
	bl	_find_next_zero_bit_le
	ldr	r1, [r5, #708]
	mov	r2, r0
	cmp	r0, r1
	bcc	.L737
	cmp	r8, #0
	ldr	r0, [r7, #20]
	subne	fp, r10, #1
	beq	.L787
.L739:
	cmp	fp, #0
	add	r3, fp, #31
	movge	r3, fp
	and	r6, fp, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	r6, r3, r6
	ands	r6, r6, #1
	beq	.L758
.L743:
	cmp	fp, #0
	beq	.L742
	sub	fp, fp, #1
	cmp	fp, #0
	add	r3, fp, #31
	movge	r3, fp
	and	r2, fp, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	r3, r3, r2
	tst	r3, #1
	bne	.L743
	mov	r2, fp
	b	.L740
.L787:
	mov	r2, r8
	bl	_find_next_zero_bit_le
	ldr	r3, [r5, #708]
	mov	r2, r0
	cmp	r0, r3
	bcc	.L737
	movw	r1, #1833
	ldr	r0, [sp, #16]
	str	r2, [sp, #20]
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp, #20]
.L737:
	cmp	r6, #0
	bne	.L788
.L740:
	eor	ip, r4, #1
	ldr	r0, [r5, #700]
	ldr	lr, [r5, #704]
	mul	r4, r0, r2
	udiv	r1, r2, lr
	cmp	lr, #1
	orreq	ip, ip, #1
	cmp	r9, r1
	orreq	ip, ip, #1
	cmp	ip, #0
	bne	.L736
	cmp	r8, #1
	beq	.L789
.L745:
	ldr	r3, [r5, #28]
	ldr	r3, [r3, #12]
	add	r2, r3, #384
.L748:
	ldr	ip, [r3, #56]
	add	r3, r3, #64
	cmp	r1, ip
	beq	.L747
	cmp	r2, r3
	bne	.L748
.L736:
	cmp	r4, #0
	ldr	r2, [r7, #16]
	add	r3, r4, #31
	movge	r3, r4
	and	r1, r4, #31
	asr	r3, r3, #5
	ldr	r2, [r2, r3, lsl #2]
	lsr	r3, r2, r1
	tst	r3, #1
	bne	.L790
.L750:
	ldr	r3, [r5, #28]
	udiv	r6, r4, r0
	mov	r0, r4
	ldr	r7, [r3, #4]
	ldr	r1, [r7, #16]
	bl	_set_bit
	ldr	r3, [r7, #4]
	mov	r0, r6
	ldr	r1, [r7, #20]
	sub	r3, r3, #1
	str	r3, [r7, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L751
	ldr	r3, [r7, #8]
	sub	r3, r3, #1
	str	r3, [r7, #8]
.L751:
	ldr	r0, [sp, #12]
	bl	_raw_spin_unlock
	ldmib	sp, {r1, r6}
	mov	r0, r5
	mov	r2, #1
	str	r4, [r6, #60]
	bl	reset_curseg
	mov	r3, #0
	strb	r3, [r6, #44]
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L747:
	cmp	r6, #0
	beq	.L791
	mul	r3, r1, lr
	sub	r10, r3, #1
.L749:
	mov	r4, #0
	b	.L734
.L791:
	ldr	r2, [sp]
	add	r3, r1, #1
	cmp	r2, r3
	movls	r10, r6
	mulhi	r10, r3, lr
	b	.L749
.L789:
	cmp	r6, #0
	bne	.L746
	ldr	r2, [sp]
	add	r3, r1, #1
	cmp	r2, r3
	bhi	.L745
	b	.L736
.L742:
	mov	r2, #0
	ldr	r1, [r5, #708]
	bl	_find_next_zero_bit_le
	ldr	r3, [r5, #708]
	mov	r2, r0
	cmp	r0, r3
	movcc	fp, r0
	bcc	.L740
	movw	r1, #1849
	ldr	r0, [sp, #16]
	str	r2, [sp, #20]
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp, #20]
	mov	fp, r2
	b	.L740
.L746:
	cmp	r1, #0
	bne	.L745
	b	.L736
.L788:
	ldr	r0, [r7, #20]
	b	.L739
.L731:
	ldr	r1, [sp, #4]
	cmp	r1, #2
	movle	r3, #0
	movgt	r3, #1
	cmp	r1, #0
	moveq	r3, #1
	cmp	r3, #0
	movne	r10, #0
	movne	r6, r10
	bne	.L732
	ldr	r3, [r2]
	ldr	r6, [r3, #112]
	cmp	r6, #0
	ldreq	r3, [r2, #12]
	addeq	r7, r3, r7
	ldreq	r6, [r7, #48]
	mov	r10, r6
	b	.L732
.L758:
	mov	r2, fp
	mov	r6, #1
	b	.L740
.L786:
	add	r6, r10, #1
	ldr	r0, [r7, #16]
	mul	r1, r6, r1
	bl	_find_next_zero_bit_le
	mov	r4, r0
	ldr	r0, [r5, #700]
	mul	r6, r0, r6
	cmp	r4, r6
	bcc	.L736
	b	.L735
.L790:
	movw	r0, #:lower16:.LC0
	mov	r1, #1888
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r5, #16
	bl	_set_bit
	ldr	r0, [r5, #700]
	b	.L750
	.fnend
	.size	new_curseg, .-new_curseg
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	change_curseg.constprop.5, %function
change_curseg.constprop.5:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	ldr	r7, [r3, #8]
	ldr	r5, [r3, #12]
	ldr	r2, [r3, #24]
	add	r5, r5, r1, lsl #6
	ldr	r1, [r5, #20]
	ldr	r3, [r5, #48]
	ldr	r6, [r5, #60]
	add	r2, r2, r3
	bl	update_meta_page
	ldr	r3, [r4, #28]
	ldr	fp, [r4, #700]
	ldr	r8, [r3, #4]
	add	r10, r8, #12
	mov	r0, r10
	bl	_raw_spin_lock
	mov	r0, r6
	ldr	r1, [r8, #16]
	bl	_test_and_set_bit
	cmp	r0, #0
	beq	.L799
.L794:
	mov	r0, r10
	add	r7, r7, #36
	bl	_raw_spin_unlock
	mov	r0, r7
	bl	mutex_lock
	mov	r0, r4
	mov	r2, #7
	mov	r1, r6
	bl	__remove_dirty_segment
	mov	r2, #6
	mov	r1, r6
	mov	r0, r4
	bl	__remove_dirty_segment
	mov	r0, r7
	bl	mutex_unlock
	mov	r0, r4
	mov	r1, r9
	mov	r2, #1
	bl	reset_curseg
	mov	r3, #1
	mov	r2, #0
	mov	r0, r4
	mov	r1, r5
	strb	r3, [r5, #44]
	bl	__next_free_blkoff
	ldr	r3, [r4, #28]
	mov	r0, r4
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
	beq	.L792
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L800
.L797:
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
.L792:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L799:
	ldr	r3, [r8, #4]
	udiv	r0, r6, fp
	ldr	r1, [r8, #20]
	sub	r3, r3, #1
	str	r3, [r8, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L794
	ldr	r3, [r8, #8]
	sub	r3, r3, #1
	str	r3, [r8, #8]
	b	.L794
.L800:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L797
	.fnend
	.size	change_curseg.constprop.5, .-change_curseg.constprop.5
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	allocate_segment_by_default, %function
allocate_segment_by_default:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r3, r2, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	str	r3, [sp, #8]
	ldr	r3, [r0, #28]
	ldr	ip, [r3, #12]
	add	r9, ip, r1, lsl #6
	bne	.L831
	sub	ip, r1, #4
	mov	r5, r1
	ldr	r1, [r0, #368]
	clz	ip, ip
	lsr	ip, ip, #5
	ldr	r1, [r1, #132]	@ unaligned
	eor	r1, r1, #64
	ands	r1, ip, r1, lsr #6
	bne	.L832
	ldrb	r2, [r9, #44]	@ zero_extendqisi2
	ldr	ip, [r0, #700]
	cmp	r2, #0
	beq	.L833
.L805:
	ldr	r7, [r4, #764]
	ldr	r2, [r4, #864]
	ldr	r8, [r4, #756]
	ldr	r6, [r4, #776]
	tst	r2, #262144
	bne	.L806
	ldr	r1, [r3, #4]
	mov	fp, #0
	ldr	r0, [r4, #696]
	ldr	r2, [r4, #692]
	str	r1, [sp, #12]
	mul	r0, r0, ip
	rsb	lr, r2, #32
	mov	r10, r0
	adds	r0, r0, r8
	adc	r1, fp, r8, asr #31
	subs	r8, r0, #1
	lsr	r8, r8, r2
	sbc	r1, r1, #0
	subs	r0, r2, #32
	orr	r8, r8, r1, lsl lr
	orrpl	r8, r8, r1, asr r0
	adds	r0, r10, r7
	adc	r1, fp, r7, asr #31
	subs	r7, r0, #1
	udiv	r8, r8, ip
	sbc	r0, r1, #0
	lsr	r1, r7, r2
	subs	r7, r2, #32
	orr	r1, r1, r0, lsl lr
	orrpl	r1, r1, r0, asr r7
	adds	r10, r10, r6
	adc	fp, fp, r6, asr #31
	subs	r0, r10, #1
	udiv	r7, r1, ip
	lsr	r0, r0, r2
	sbc	r6, fp, #0
	subs	r2, r2, #32
	orr	r0, r0, r6, lsl lr
	lsl	r8, r8, #1
	orrpl	r0, r0, r6, asr r2
	ldr	r2, [sp, #12]
	udiv	r0, r0, ip
	ldr	r2, [r2, #8]
	add	r8, r8, r7
	ldr	r7, [r3, #36]
	udiv	ip, r7, ip
	add	r0, r8, r0
	add	r0, r0, ip, lsl #1
	cmp	r2, r0
	bls	.L834
.L806:
	mov	r1, r5
	mov	r2, #0
	mov	r0, r4
	bl	new_curseg
.L803:
	ldrb	r3, [r9, #44]	@ zero_extendqisi2
	add	r4, r4, r3, lsl #2
	ldr	r3, [r4, #912]
	add	r3, r3, #1
	str	r3, [r4, #912]
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L833:
	ldr	r1, [r9, #48]
	ldr	r0, [r3, #32]
	add	r2, r1, #1
	cmp	r2, r0
	bcs	.L805
	udiv	r0, r2, ip
	mls	r0, ip, r0, r2
	cmp	r0, #0
	beq	.L805
	ldr	lr, [r3, #4]
	cmp	r2, #0
	and	r0, r2, #31
	addlt	r2, r1, #32
	asr	r2, r2, #5
	ldr	r1, [lr, #16]
	ldr	r2, [r1, r2, lsl #2]
	mvn	r2, r2, lsr r0
	tst	r2, #1
	bne	.L806
	b	.L805
.L831:
	mov	r2, #1
	bl	new_curseg
	b	.L803
.L834:
	ldr	lr, [r3, #8]
	add	r7, sp, #24
	mvn	r1, #0
	mov	ip, #1
	mov	r2, #0
	mov	r0, r4
	mov	r3, r5
	ldr	r10, [lr]
	str	r1, [r7, #-4]!
	mov	r1, r7
	str	ip, [sp]
	ldr	r6, [r10]
	blx	r6
	subs	r6, r0, #0
	bne	.L830
	cmp	r5, #2
	bgt	.L835
	ldr	r3, [sp, #8]
	cmp	r5, #0
	movgt	r3, #1
	movgt	r6, #2
	str	r3, [sp, #8]
.L814:
	mov	r3, r7
	mov	r8, #3
	mov	r7, r9
	mov	fp, #1
	mov	r9, r3
.L818:
	cmp	r5, r6
	mov	r3, r6
	mov	r2, #0
	mov	r1, r9
	mov	r0, r4
	beq	.L815
	str	fp, [sp]
	ldr	ip, [r10]
	blx	ip
	cmp	r0, #0
	bne	.L836
.L815:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	subne	r6, r6, #1
	addeq	r6, r6, #1
	subs	r8, r8, #1
	bne	.L818
	mov	r9, r7
	b	.L806
.L836:
	mov	r9, r7
.L830:
	ldr	r3, [sp, #20]
	mov	r1, r5
	mov	r0, r4
	str	r3, [r9, #60]
	bl	change_curseg.constprop.5
	b	.L803
.L832:
	mov	r1, #4
	bl	new_curseg
	b	.L803
.L835:
	ldr	r3, [sp, #8]
	cmp	r5, #3
	movne	r3, #1
	movne	r6, #5
	moveq	r6, #3
	str	r3, [sp, #8]
	b	.L814
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
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
.L838:
	ldr	r3, [r5, #28]
	mov	r2, #1
	mov	r1, r4
	mov	r0, r5
	ldr	ip, [r3]
	ldr	r3, [r3, #12]
	ldr	ip, [ip]
	add	r3, r3, r4, lsl #6
	add	r4, r4, r2
	ldr	r6, [r3, #48]
	ldr	r3, [ip]
	blx	r3
	mov	r0, r5
	mov	r1, r6
	bl	locate_dirty_segment
	cmp	r4, #3
	bne	.L838
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
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
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	mov	r6, r1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #28]
	ldrd	r8, [r1, #8]
	ldr	r0, [r3]
	add	r0, r0, #40
	bl	mutex_lock
	ldrd	r0, [r6, #8]
	ldrd	r2, [r6, #16]
	cmp	r1, r3
	cmpeq	r0, r2
	bls	.L844
	b	.L842
.L848:
	ldr	r1, [r6, #8]
	ldr	r0, [r6, #12]
	ldrd	r2, [r6, #16]
	adds	r4, r1, #1
	adc	r5, r0, #0
	cmp	r5, r3
	cmpeq	r4, r2
	strd	r4, [r6, #8]
	bhi	.L842
.L844:
	mov	r2, #1
	mov	r1, r6
	mov	r0, r7
	bl	add_discard_addrs
	cmp	r0, #0
	beq	.L848
	mov	r4, #1
	b	.L843
.L842:
	mov	r4, #0
.L843:
	ldr	r3, [r7, #28]
	ldr	r0, [r3]
	add	r0, r0, #40
	bl	mutex_unlock
	strd	r8, [r6, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
	.fnend
	.size	exist_trim_candidates, .-exist_trim_candidates
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
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	lr, [r1]
	.pad #44
	sub	sp, sp, #44
	ldr	ip, [r0, #28]
	ldrd	r10, [r1, #8]
	ldr	r5, [r1, #4]
	lsr	r2, lr, #12
	ldr	lr, [r0, #692]
	ldr	r8, [ip, #16]
	lsr	r4, r10, #12
	ldr	r9, [ip, #28]
	orr	r2, r2, r5, lsl #20
	orr	r4, r4, fp, lsl #20
	lsr	r3, r5, #12
	lsr	r5, fp, #12
	adds	r4, r4, r2
	adc	r5, r5, r3
	add	r8, r8, r9, lsl lr
	subs	r6, r4, #1
	mov	r9, #0
	sbc	r7, r5, #0
	cmp	r9, r3
	cmpeq	r8, r2
	bls	.L866
	ldr	r8, [r0, #676]
	mov	r9, #0
	cmp	fp, r9
	cmpeq	r10, r8
	bcc	.L866
	mov	r4, r0
	mov	r5, r1
	mov	r0, #0
	mov	r1, #0
	strd	r0, [sp, #32]
	ldr	r0, [ip, #20]
	mov	r1, #0
	cmp	r1, r7
	cmpeq	r0, r6
	bcc	.L851
.L858:
	mov	r2, #0
	mov	r3, r2
	mov	r9, r2
.L852:
	strd	r2, [r5, #8]
.L849:
	mov	r0, r9
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L851:
	ldr	r8, [r4, #16]
	ubfx	r8, r8, #2, #1
	cmp	r8, #0
	bne	.L874
	cmp	r1, r3
	ldr	r1, [ip, #16]
	cmpeq	r0, r2
	movcs	r0, r8
	bcs	.L854
	orrs	r0, r2, r3
	mvneq	r0, #0
	beq	.L854
	ldr	r8, [ip, #4]
	subs	r10, r2, r1
	rsb	r9, lr, #32
	sbc	fp, r3, #0
	lsr	r0, r10, lr
	orr	r0, r0, fp, lsl r9
	ldr	r2, [r8]
	sub	r8, lr, #32
	orr	r0, r0, fp, lsr r8
	sub	r0, r0, r2
.L854:
	ldr	r2, [ip, #28]
	mov	r3, #0
	cmp	r3, r7
	add	r2, r1, r2, lsl lr
	cmpeq	r2, r6
	bls	.L875
	ldr	r2, [ip, #4]
	subs	r8, r6, r1
	rsb	r3, lr, #32
	sbc	r9, r7, #0
	lsr	r6, r8, lr
	orr	r6, r6, r9, lsl r3
	ldr	r3, [r2]
	sub	r2, lr, #32
	orr	r6, r6, r9, lsr r2
	sub	r6, r6, r3
.L856:
	ldr	r1, [r5, #16]
	mov	r3, #16
	ldr	r7, [r5, #20]
	str	r3, [sp]
	lsr	r1, r1, #12
	lsr	r3, r7, #12
	orr	r2, r1, r7, lsl #20
	orrs	r1, r2, r3
	moveq	r2, #1
	moveq	r3, #0
	cmp	r0, r6
	strd	r2, [sp, #24]
	bhi	.L858
	ldr	r2, [r4, #744]
	mov	r8, #0
	str	r0, [sp, #8]
	str	r8, [sp, #12]
	cmp	r2, r8
	beq	.L858
	add	r7, r4, #868
	b	.L859
.L863:
	bl	schedule
	ldr	r0, [sp, #16]
	add	r0, r0, #1
	cmp	r6, r0
	bcc	.L873
	ldr	r2, [r4, #744]
	str	r0, [sp, #8]
	str	r9, [sp, #12]
	cmp	r2, #0
	beq	.L873
	ldr	ip, [r4, #28]
	ldr	lr, [r4, #692]
.L859:
	ldr	r1, [r4, #700]
	ldr	r3, [ip, #48]
	mul	r3, r3, r1
	add	r0, r3, r0
	cmp	r2, r3, lsl lr
	sub	r3, r0, #1
	strcc	r6, [sp, #16]
	strcc	r8, [sp, #20]
	bcc	.L862
	udiv	r2, r0, r1
	str	r8, [sp, #20]
	mls	r0, r1, r2, r0
	sub	r0, r3, r0
	cmp	r0, r6
	movcs	r0, r6
	str	r0, [sp, #16]
.L862:
	mov	r0, r7
	bl	mutex_lock
	mov	r1, sp
	mov	r0, r4
	bl	write_checkpoint
	mov	r9, r0
	mov	r0, r7
	bl	mutex_unlock
	cmp	r9, #0
	beq	.L863
.L873:
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
	b	.L852
.L875:
	ldr	r6, [ip, #32]
	sub	r6, r6, #1
	b	.L856
.L874:
	movw	r2, #:lower16:.LC11
	movw	r1, #:lower16:.LC12
	ldr	r0, [r4]
	movt	r2, #:upper16:.LC11
	movt	r1, #:upper16:.LC12
	bl	f2fs_msg
	ldr	r1, [sp, #32]
	mov	r9, #0
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
	b	.L852
.L866:
	mvn	r9, #21
	b	.L849
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
	@ args = 8, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r3
	strd	r10, [sp, #24]
	mov	r10, r1
	str	lr, [sp, #32]
	ldr	r1, [r0, #28]
	.pad #12
	sub	sp, sp, #12
	ldr	r6, [sp, #52]
	str	r2, [sp]
	ldr	r2, [sp, #48]
	ldr	fp, [r1]
	ldr	r5, [r1, #12]
	lsl	r9, r6, #6
	str	r2, [sp, #4]
	add	r7, fp, #40
	add	r5, r5, r9
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r7
	bl	mutex_lock
	ldr	r1, [r4, #28]
	mov	r0, r4
	ldr	r3, [r5, #48]
	ldrh	ip, [r5, #52]
	ldr	lr, [r1, #4]
	ldr	r1, [r1, #16]
	ldr	lr, [lr]
	add	ip, ip, r1
	add	lr, lr, r3
	ldr	r3, [r4, #692]
	add	ip, ip, lr, lsl r3
	mov	r1, ip
	str	ip, [r8]
	bl	f2fs_wait_discard_bio
	ldr	r2, [sp, #4]
	mov	r1, r6
	mov	r0, r4
	bl	__add_sum_entry
	ldrb	r2, [r5, #44]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L889
	ldrh	r1, [r5, #52]
	add	r1, r1, #1
	strh	r1, [r5, #52]	@ movhi
.L878:
	add	r2, r4, r2, lsl #2
	ldr	r1, [r2, #920]
	add	r1, r1, #1
	str	r1, [r2, #920]
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #696]
	ldr	r2, [r2, #12]
	add	r9, r2, r9
	ldrh	r2, [r9, #52]
	cmp	r2, r1
	bcc	.L879
	ldr	r3, [fp]
	mov	r2, #0
	mov	r1, r6
	mov	r0, r4
	ldr	r3, [r3]
	blx	r3
.L879:
	mov	r0, r4
	ldr	r2, [r8]
	ldr	r1, [sp]
	bl	refresh_sit_entry
	mov	r0, r7
	bl	mutex_unlock
	cmp	r10, #0
	cmpne	r6, #2
	bgt	.L890
.L880:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L890:
	ldr	r3, [r10, #4]
	mov	r0, r10
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #692]
	ldr	ip, [r5, #48]
	ldr	r6, [r3]
	ldr	r3, [r2, #4]
	ldr	lr, [r2, #16]
	ldrh	r4, [r5, #52]
	ldr	r2, [r6, #28]
	ldr	r3, [r3]
	add	r4, r4, lr
	ldr	r2, [r2, #616]
	add	r3, r3, ip
	add	r4, r4, r3, lsl r1
	ldr	r6, [r2, #368]
	bl	page_address
	ldr	r1, [r6, #132]	@ unaligned
	ldr	r2, [r6]	@ unaligned
	ldr	r3, [r6, #4]	@ unaligned
	tst	r1, #64
	beq	.L881
	ldr	r1, [r6, #164]	@ unaligned
	ldr	r1, [r6, r1]
	orr	r3, r1, r3
.L881:
	str	r2, [r0, #4084]	@ unaligned
	str	r3, [r0, #4088]	@ unaligned
	str	r4, [r0, #4092]	@ unaligned
	b	.L880
.L889:
	ldrh	r2, [r5, #52]
	mov	r1, r5
	mov	r0, r4
	add	r2, r2, #1
	bl	__next_free_blkoff
	ldrb	r2, [r5, #44]	@ zero_extendqisi2
	b	.L878
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
	mov	r4, r1
	strd	r6, [sp, #8]
	mov	r6, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	.pad #8
	sub	sp, sp, #8
	ldr	r7, [r1, #4]
	ldr	r8, [r1, #24]
	ldr	r3, [r8, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r2, [r2, #616]
	ldr	r5, [r2, #728]
	cmp	r5, #2
	beq	.L893
	cmp	r5, #4
	bne	.L935
	cmp	r7, #0
	bne	.L897
	ldrh	r3, [r3]
	and	r3, r3, #61440
	cmp	r3, #16384
	movne	r5, #2
	moveq	r5, #0
.L912:
	add	r3, r7, r7, lsl #2
	ldr	r0, [r4]
	lsl	r3, r3, #2
	add	r3, r3, #320
	add	r0, r0, r3
	bl	mutex_lock
.L908:
	add	r7, r4, #16
	ldr	r2, [r4, #20]
	b	.L910
.L936:
	ldr	r2, [r4, #16]
	str	r2, [r4, #20]
.L910:
	ldr	r0, [r4]
	mov	r3, r7
	str	r6, [sp]
	ldr	r1, [r4, #24]
	str	r5, [sp, #4]
	bl	allocate_data_block
	mov	r0, r4
	bl	f2fs_submit_page_mbio
	cmn	r0, #11
	beq	.L936
	ldr	r3, [r4, #4]
	cmp	r3, #1
	bls	.L937
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L935:
	cmp	r5, #6
	bne	.L938
.L902:
	cmp	r7, #0
	bne	.L903
	ldr	r3, [r8]
	ldr	r7, [r4, #4]
	tst	r3, #256
	bne	.L916
	ldr	r3, [r8, #4]
	ldr	r3, [r3]
	ldrb	r2, [r3, #340]	@ zero_extendqisi2
	tst	r2, #1
	bne	.L916
	ldr	r5, [r3, #356]
	mvn	r5, r5, lsr #24
	and	r5, r5, #1
.L896:
	cmp	r7, #1
	bhi	.L908
	b	.L912
.L893:
	cmp	r7, #0
	moveq	r5, r7
	beq	.L912
.L907:
	mov	r5, #3
	b	.L896
.L937:
	add	r3, r3, r3, lsl #2
	ldr	r0, [r4]
	lsl	r3, r3, #2
	add	r3, r3, #320
	add	r0, r0, r3
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L916:
	mov	r5, #2
	b	.L896
.L897:
	mov	r0, r8
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L898
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L906
	cmp	r3, r1
	bls	.L898
	sub	r3, r3, #2032
	movw	r1, #12863
	sub	r3, r3, #10
	movt	r1, 8232
	asr	r2, r3, #31
	movw	r0, #1019
	smull	ip, r1, r1, r3
	rsb	r2, r2, r1, asr #7
	mls	r3, r0, r2, r3
	cmp	r3, #0
	beq	.L906
.L898:
	mov	r0, r8
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	ldr	r7, [r4, #4]
	tst	r3, #1
	beq	.L934
	b	.L896
.L903:
	mov	r0, r8
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L904
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	beq	.L905
.L906:
	ldr	r7, [r4, #4]
.L934:
	mov	r5, #5
	b	.L896
.L905:
	cmp	r3, r1
	bls	.L904
	sub	r3, r3, #2032
	movw	r1, #12863
	sub	r3, r3, #10
	movt	r1, 8232
	asr	r2, r3, #31
	movw	r0, #1019
	smull	ip, r1, r1, r3
	rsb	r2, r2, r1, asr #7
	mls	r3, r0, r2, r3
	cmp	r3, #0
	beq	.L906
.L904:
	mov	r0, r8
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	ldr	r7, [r4, #4]
	tst	r3, #1
	movne	r5, #4
	bne	.L896
	b	.L907
.L938:
	movw	r0, #:lower16:.LC0
	movw	r1, #2237
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldr	r3, [r8, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L902
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
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	ldr	r3, [r1, #8]
	mov	r4, #0
	str	lr, [sp, #8]
	ldr	r2, [r0, #28]
	.pad #44
	sub	sp, sp, #44
	mov	r5, #0
	mov	lr, #2
	mov	ip, #1
	str	r1, [sp, #28]
	str	r3, [sp, #24]
	stmib	sp, {r0, lr}
	mov	r0, #624
	strd	r4, [sp, #32]
	ldr	r2, [r2, #20]
	str	ip, [sp, #12]
	str	r3, [sp, #20]
	str	r0, [sp, #16]
	mov	r0, r1
	cmp	r3, r2
	movcs	r3, #592
	strcs	r3, [sp, #16]
	bl	test_set_page_writeback
	add	r0, sp, #4
	bl	f2fs_submit_page_mbio
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
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
	.save {lr}
	str	lr, [sp, #-4]!
	.pad #12
	sub	sp, sp, #12
	mov	r3, #0
	str	r0, [sp, #1]	@ unaligned
	add	r0, sp, #1
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
	beq	.L947
.L945:
	mov	r0, r6
	ldr	r1, [r4, #12]
	add	r2, sp, #8
	bl	get_node_info
	ldrb	r2, [sp, #20]	@ zero_extendqisi2
	mov	r1, r5
	add	r0, sp, #1
	ldr	r3, [r4, #12]
	ldr	ip, [r4, #16]
	str	r3, [sp, #1]	@ unaligned
	strb	r2, [sp, #5]
	strh	ip, [sp, #6]	@ unaligned
	bl	do_write_page
	ldr	r1, [r5, #16]
	mov	r0, r4
	bl	f2fs_update_data_blkaddr
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L947:
	movw	r0, #:lower16:.LC0
	movw	r1, #2338
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L945
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
	ldr	ip, [r0, #20]
	add	r2, r3, #928
	str	ip, [r0, #16]
	.syntax divided
@ 45 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	ip, r1, [r2]
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
	strd	r8, [sp, #16]
	mov	r8, r3
	sub	r3, r3, #1
	strd	r10, [sp, #24]
	cmn	r3, #3
	mov	fp, r2
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	ldr	r0, [r0, #28]
	ldrb	r9, [sp, #64]	@ zero_extendqisi2
	mvnhi	r2, #23
	str	r3, [sp, #4]
	ldrb	r3, [sp, #68]	@ zero_extendqisi2
	str	r1, [sp, #8]
	ldr	r6, [r0]
	str	r3, [sp, #12]
	mvnhi	r3, #0
	bhi	.L950
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	r1, [r4, #692]
	ldr	r3, [r3]
	sub	r2, r8, r2
	rsb	r3, r3, r2, lsr r1
	add	r2, r3, r3, lsl #1
	lsl	r2, r2, #3
.L950:
	ldr	r1, [r6, #60]
	eor	ip, r9, #1
	cmp	r9, #0
	ldr	r5, [r0, #12]
	str	ip, [sp, #16]
	ldrb	r7, [r1, r2]	@ zero_extendqisi2
	and	r7, r7, #63
	bne	.L951
	ldrh	r2, [r1, r2]
	bic	r2, r2, #63
	cmp	r2, #0
	beq	.L952
.L988:
	lsl	r2, r7, #6
.L953:
	add	r5, r5, r2
	str	r3, [sp, #16]
	mov	r0, r5
	add	r6, r6, #40
	bl	mutex_lock
	mov	r0, r6
	bl	mutex_lock
	ldrh	r3, [r5, #52]
	ldr	r10, [r5, #48]
	str	r3, [sp, #20]
	ldr	r3, [sp, #16]
	cmp	r3, r10
	beq	.L965
	mov	r1, r7
	mov	r0, r4
	str	r3, [r5, #60]
	bl	change_curseg.constprop.5
.L965:
	ldr	r3, [r4, #28]
	mov	r1, r7
	mov	r0, r4
	ldr	ip, [r4, #696]
	ldr	r2, [sp, #8]
	ldr	r3, [r3, #16]
	sub	ip, ip, #1
	sub	r3, r8, r3
	and	r3, r3, ip
	strh	r3, [r5, #52]	@ movhi
	bl	__add_sum_entry
	ldr	r2, [sp, #12]
	eor	r3, r9, #1
	orrs	r3, r3, r2
	bne	.L989
.L966:
	sub	r3, fp, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L967
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r3, fp, r3
	rsb	r1, r1, r3, lsr r2
	cmn	r1, #1
	bne	.L990
.L967:
	mov	r0, r4
	bl	locate_dirty_segment
	ldr	r3, [sp, #4]
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L969
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r8, r8, r3
	rsb	r1, r1, r8, lsr r2
.L969:
	mov	r0, r4
	bl	locate_dirty_segment
	mov	r1, r10
	mov	r0, r4
	bl	locate_dirty_segment
	cmp	r9, #0
	beq	.L970
	ldr	r3, [r5, #48]
	cmp	r3, r10
	bne	.L991
.L971:
	ldr	r3, [sp, #20]
	strh	r3, [r5, #52]	@ movhi
.L970:
	mov	r0, r6
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
.L951:
	ldr	r2, [r5, #48]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #112]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #176]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #240]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #304]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #368]
	cmp	r2, r3
	movne	r2, #64
	movne	r7, #1
	bne	.L953
	b	.L988
.L991:
	mov	r1, r7
	mov	r0, r4
	str	r10, [r5, #60]
	bl	change_curseg.constprop.5
	b	.L971
.L952:
	ldr	r2, [r5, #48]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #112]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #176]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #240]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #304]
	cmp	r2, r3
	beq	.L988
	ldr	r2, [r5, #368]
	cmp	r2, r3
	beq	.L988
	cmp	fp, #0
	moveq	r2, #128
	movne	r2, #64
	moveq	r7, #2
	movne	r7, #1
	b	.L953
.L990:
	mvn	r2, #0
	mov	r1, fp
	mov	r0, r4
	bl	update_sit_entry
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r3, fp, r3
	rsb	r1, r1, r3, lsr r2
	b	.L967
.L989:
	mov	r2, #1
	mov	r1, r8
	mov	r0, r4
	bl	update_sit_entry
	b	.L966
	.fnend
	.size	__f2fs_replace_block, .-__f2fs_replace_block
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
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	mov	r5, r3
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	.pad #20
	sub	sp, sp, #20
	ldr	lr, [r4, #12]
	ldrb	ip, [sp, #44]	@ zero_extendqisi2
	add	r1, sp, #9
	ldrb	r6, [sp, #48]	@ zero_extendqisi2
	ldr	r7, [r4, #16]
	str	ip, [sp]
	ldrb	ip, [sp, #40]	@ zero_extendqisi2
	str	r6, [sp, #4]
	str	lr, [sp, #9]	@ unaligned
	strb	ip, [sp, #13]
	strh	r7, [sp, #14]	@ unaligned
	bl	__f2fs_replace_block
	mov	r1, r5
	mov	r0, r4
	bl	f2fs_update_data_blkaddr
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
	.fnend
	.size	f2fs_replace_block, .-f2fs_replace_block
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
	str	lr, [sp, #32]
	ldr	ip, [r0, #28]
	.pad #100
	sub	sp, sp, #100
	ldr	r6, [r1]
	ldr	ip, [ip, #616]
	cmp	r6, r1
	ldr	r5, [r6]
	str	ip, [sp, #44]
	beq	.L1020
	mov	r10, r2
	str	r1, [sp, #28]
	movw	r2, #:lower16:__tracepoint_f2fs_commit_inmem_page
	str	r3, [sp, #32]
	mov	r1, #57344
	movw	r3, #:lower16:.LANCHOR0
	mov	r8, #0
	movt	r2, #:upper16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:.LANCHOR0
	movt	r1, 65535
	mov	r7, r6
	mov	r9, r0
	str	r2, [sp, #20]
	str	r3, [sp, #24]
	str	r8, [sp, #36]
	str	r1, [sp, #40]
	b	.L1018
.L1054:
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L1050
.L1004:
	mov	r1, #28
	add	r0, sp, #68
	bl	__memzero
	add	r0, sp, #68
	mov	r2, #1
	str	r9, [sp, #68]
	str	r8, [sp, #76]
	str	r8, [sp, #80]
	ldr	r1, [r4, #8]
	str	r8, [sp, #72]
	bl	get_dnode_of_data
	cmp	r0, #0
	beq	.L1008
	mvn	r3, #10
	str	r3, [sp, #36]
.L1009:
	mov	r1, r4
	mov	r0, #3
	bl	_clear_bit
.L1015:
	mov	r1, r4
	mov	r0, #11
	str	r8, [r4, #28]
	bl	_clear_bit
	cmp	r4, #0
	beq	.L1016
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1051
.L1017:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1016:
	mov	r0, r7
	bl	list_del
	ldr	r3, [sp, #24]
	mov	r1, r6
	ldr	r0, [r3, #12]
	bl	kmem_cache_free
	ldr	r3, [r9, #28]
	ldr	r3, [r3, #616]
	add	r2, r3, #772
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [sp, #28]
	mov	r7, r5
	mov	r6, r5
	ldr	r5, [r5]
	cmp	r7, r3
	beq	.L994
.L1018:
	cmp	r10, #0
	ldr	r4, [r6, #8]
	beq	.L997
	ldr	r3, [sp, #20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L1052
.L997:
	mov	r1, r4
	mov	r0, #0
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1053
.L1001:
	ldr	r3, [sp, #32]
	cmp	r3, #0
	bne	.L1054
.L1002:
	cmp	r10, #0
	beq	.L1015
	b	.L1009
.L1020:
	mov	r3, #0
	str	r3, [sp, #36]
.L994:
	ldr	r0, [sp, #36]
	add	sp, sp, #100
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1008:
	ldr	fp, [sp, #44]
	add	r2, sp, #52
	ldr	r1, [sp, #80]
	mov	r0, fp
	bl	get_node_info
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	mov	ip, #1
	mov	r0, fp
	ldr	r3, [r6, #12]
	add	r1, sp, #68
	ldr	r2, [sp, #92]
	str	lr, [sp]
	str	ip, [sp, #4]
	str	ip, [sp, #8]
	bl	f2fs_replace_block
	ldr	fp, [sp, #76]
	cmp	fp, #0
	beq	.L1010
	ldr	r3, [fp]
	tst	r3, #1
	beq	.L1055
.L1011:
	mov	r0, fp
	bl	unlock_page
	mov	r0, fp
	bl	put_page
	ldr	r0, [sp, #72]
	cmp	r0, #0
	beq	.L1009
	ldr	r3, [sp, #76]
	cmp	r0, r3
	beq	.L1009
	bl	put_page
	b	.L1009
.L1053:
	mov	r0, r4
	bl	__lock_page
	b	.L1001
.L1051:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1017
.L1050:
	ldr	r2, [sp, #40]
	mov	r3, sp
	and	r2, r3, r2
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [sp, #20]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L1005
	ldr	r3, [fp]
.L1006:
	ldr	r0, [fp, #4]
	mov	r2, #8
	mov	r1, r4
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L1006
.L1005:
	ldr	r2, [sp, #40]
	mov	r3, sp
	and	r3, r3, r2
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L1004
	bl	preempt_schedule
	b	.L1004
.L1052:
	ldr	r2, [sp, #40]
	mov	r3, sp
	and	r2, r3, r2
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [sp, #20]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L999
	ldr	r3, [fp]
.L1000:
	ldr	r0, [fp, #4]
	mov	r2, #6
	mov	r1, r4
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L1000
.L999:
	ldr	r2, [sp, #40]
	mov	r3, sp
	and	r3, r3, r2
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L997
	bl	preempt_schedule
	b	.L997
.L1010:
	ldr	r0, [sp, #72]
	cmp	r0, #0
	beq	.L1009
	bl	put_page
	b	.L1009
.L1055:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [fp, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1011
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
	beq	.L1057
	add	r1, r4, #356
	mov	r0, #15
	bl	_clear_bit
.L1057:
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #616]
	add	r2, r3, #980
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
	.fnend
	.size	drop_inmem_pages, .-drop_inmem_pages
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
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	ip, r1
	mov	r4, r0
	str	lr, [sp, #8]
	ldmib	r0, {r1, r3}
	.pad #12
	sub	sp, sp, #12
	mov	lr, #1
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, [r1, #28]
	ldr	r0, [r0, #616]
	stm	sp, {ip, lr}
	bl	f2fs_submit_merged_bio_cond
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1076
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1076:
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
	.global	commit_inmem_pages
	.syntax unified
	.arm
	.fpu softvfp
	.type	commit_inmem_pages, %function
commit_inmem_pages:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r2, r0, #356
	mov	r1, #1
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #92
	sub	sp, sp, #92
	add	r10, sp, #44
	str	r2, [sp, #36]
	str	r10, [sp, #44]
	ldr	r0, [r3, #616]
	str	r10, [sp, #48]
	add	r3, r0, #404
	mov	r4, r3
	str	r3, [sp, #28]
	bl	f2fs_balance_fs
	mov	r0, r4
	bl	down_read
	ldr	r3, [r7, #356]
	tst	r3, #65536
	beq	.L1120
.L1078:
	add	r3, r7, #432
	mov	r9, r7
	mov	r0, r3
	str	r3, [sp, #24]
	bl	mutex_lock
	ldr	r0, [r7, #28]
	mov	r3, #0
	mov	r2, #0
	ldr	r8, [r9, #424]!
	mov	r1, #1
	strd	r2, [sp, #56]
	str	r1, [sp, #60]
	ldr	r0, [r0, #616]
	strd	r2, [sp, #64]
	strd	r2, [sp, #72]
	cmp	r8, r9
	mov	r6, r8
	strd	r2, [sp, #80]
	mov	r3, #80
	str	r0, [sp, #32]
	str	r0, [sp, #52]
	str	r3, [sp, #64]
	ldr	r5, [r8]
	beq	.L1099
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	mov	r2, #61440
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	mov	r1, #53248
	movt	r2, 65535
	movt	r1, 65535
	str	r3, [sp, #12]
	mvn	r3, #0
	str	r3, [sp, #8]
	str	r2, [sp, #16]
	str	r1, [sp, #20]
	b	.L1092
.L1081:
	mov	r0, r4
	mov	r8, r5
	bl	unlock_page
	mov	r0, r6
	bl	__list_del_entry
	ldr	r1, [sp, #48]
	mov	r0, r6
	mov	r2, r10
	bl	__list_add
	cmp	r5, r9
	mov	r6, r5
	ldr	r5, [r5]
	beq	.L1121
.L1092:
	ldr	r4, [r8, #8]
	mov	r0, #0
	mov	r1, r4
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1122
.L1080:
	ldr	r2, [r4, #4]
	ldr	r3, [r7, #32]
	cmp	r2, r3
	bne	.L1081
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L1123
.L1083:
	mov	r0, r4
	bl	set_page_dirty
	mov	r2, #1
	mov	r1, #0
	mov	r0, r4
	bl	f2fs_wait_on_page_writeback
	mov	r0, r4
	bl	clear_page_dirty_for_io
	cmp	r0, #0
	beq	.L1087
	ldrh	r2, [r7]
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #20]
	and	r3, r2, r3
	and	r2, r2, r1
	cmp	r3, #16384
	cmpne	r2, #32768
	bne	.L1088
	add	r2, r7, #376
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r1, [r7, #28]
	cmp	r3, #16384
	movne	r2, #760
	moveq	r2, #756
	ldr	r3, [r1, #616]
	add	r3, r3, r2
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L1088:
	mov	r0, r7
	bl	remove_dirty_inode
.L1087:
	mov	fp, #0
	add	r0, sp, #52
	str	fp, [sp, #72]
	str	r4, [sp, #76]
	str	fp, [sp, #80]
	strb	fp, [sp, #85]
	bl	do_write_data_page
	cmp	r0, #0
	bne	.L1124
	ldr	r3, [sp, #72]
	str	r3, [r8, #12]
	ldr	r3, [r4, #8]
	str	r3, [sp, #8]
	b	.L1081
.L1122:
	mov	r0, r4
	bl	__lock_page
	b	.L1080
.L1121:
	ldr	r3, [sp, #8]
	cmn	r3, #1
	beq	.L1099
	mov	ip, #1
	mov	r2, #0
	ldr	r3, [sp, #8]
	mov	r1, r7
	ldr	r0, [sp, #32]
	stm	sp, {r2, ip}
	bl	f2fs_submit_merged_bio_cond
.L1099:
	mov	r3, #0
	mov	r1, r10
	mov	r2, r3
	mov	r0, r7
	mov	fp, r3
	bl	__revoke_inmem_pages
.L1094:
	ldr	r0, [sp, #24]
	bl	mutex_unlock
	ldr	r3, [r7, #356]
	tst	r3, #65536
	beq	.L1095
	mov	r0, #16
	ldr	r1, [sp, #36]
	bl	_clear_bit
.L1095:
	ldr	r0, [sp, #28]
	bl	up_read
	mov	r0, fp
	add	sp, sp, #92
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1123:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #12]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L1084
	ldr	r3, [fp]
.L1085:
	ldr	r0, [fp, #4]
	mov	r2, #5
	mov	r1, r4
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L1085
.L1084:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L1083
	bl	preempt_schedule
	b	.L1083
.L1120:
	add	r1, r7, #356
	mov	r0, #16
	bl	_set_bit
	b	.L1078
.L1124:
	mov	r5, r0
	mov	r0, r4
	bl	unlock_page
	ldr	r3, [sp, #8]
	cmn	r3, #1
	beq	.L1091
	mov	r1, #1
	mov	r2, fp
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #32]
	str	fp, [sp]
	str	r1, [sp, #4]
	mov	r1, r7
	bl	f2fs_submit_merged_bio_cond
.L1091:
	mov	r1, r10
	mov	r3, #1
	mov	r2, #0
	mov	r0, r7
	bl	__revoke_inmem_pages
	cmp	r0, #0
	mov	fp, r5
	mov	r1, r9
	movne	fp, r0
	mov	r3, #0
	mov	r2, #1
	mov	r0, r7
	bl	__revoke_inmem_pages
	b	.L1094
	.fnend
	.size	commit_inmem_pages, .-commit_inmem_pages
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
	ldr	r3, [r0, #380]
	ldr	r0, [r3, #32]
	bl	find_lock_page
	subs	r4, r0, #0
	beq	.L1125
	mov	r2, #1
	mov	r1, #0
	bl	f2fs_wait_on_page_writeback
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1137
.L1129:
	mov	r0, r4
	bl	unlock_page
	ldr	lr, [sp, #4]
	mov	r0, r4
	ldr	r4, [sp]
	add	sp, sp, #8
	b	put_page
.L1125:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L1137:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1129
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #368]
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r3, #132]	@ unaligned
	ands	r4, r4, #4
	bne	.L1162
.L1139:
	add	r2, r4, r6
	mov	r1, r4
	mov	r0, r7
	add	r4, r4, #1
	bl	write_current_sum_page
	cmp	r4, #3
	bne	.L1139
.L1138:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1162:
	bl	grab_meta_page
	mov	r5, r0
	movw	r4, #507
	bl	page_address
	ldr	r3, [r7, #28]
	movw	r1, #:lower16:.LC3
	add	r2, r6, #1
	movt	r1, #:upper16:.LC3
	mov	r10, r0
	str	r2, [sp, #4]
	mov	r2, r4
	mov	r9, #0
	str	r1, [sp, #12]
	ldr	r3, [r3, #12]
	ldr	r1, [r3, #40]
	bl	memcpy
	ldr	r3, [r7, #28]
	mov	r2, r4
	add	r0, r10, r4
	ldr	r3, [r3, #12]
	ldr	r1, [r3, #168]
	bl	memcpy
	movw	r1, #1014
.L1147:
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #368]
	ldr	fp, [r2, #12]
	add	r3, r3, r9
	ldrb	r3, [r3, #176]	@ zero_extendqisi2
	add	fp, fp, r9, lsl #6
	cmp	r3, #1
	ldreq	r8, [r7, #696]
	ldrhne	r8, [fp, #52]
	uxtheq	r8, r8
	cmp	r8, #0
	beq	.L1142
	mov	r4, #0
	str	r9, [sp, #8]
	b	.L1146
.L1143:
	ldr	lr, [fp, #20]
	movw	r9, #4091
	cmp	ip, r9
	add	r3, lr, r3
	ldr	ip, [r3]	@ unaligned
	str	ip, [r10, r1]	@ unaligned
	ldrh	r1, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r1, [r2, #4]	@ unaligned
	movls	r1, r6
	strb	r3, [r2, #6]
	bls	.L1144
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1163
.L1145:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	mov	r5, #0
	bl	put_page
	mov	r1, r6
.L1144:
	add	r4, r4, #1
	cmp	r4, r8
	beq	.L1164
.L1146:
	cmp	r5, #0
	rsb	r3, r4, r4, lsl #3
	mov	r0, r5
	add	ip, r1, #14
	add	r2, r10, r1
	add	r6, r1, #7
	bne	.L1143
	ldr	r6, [sp, #4]
	mov	r0, r7
	mov	r1, r6
	bl	grab_meta_page
	mov	r5, r0
	bl	page_address
	ldr	r2, [fp, #20]
	rsb	r3, r4, r4, lsl #3
	add	r4, r4, #1
	add	r1, r6, #1
	cmp	r4, r8
	mov	r10, r0
	str	r1, [sp, #4]
	mov	r1, #7
	add	r3, r2, r3
	ldr	r2, [r3]	@ unaligned
	str	r2, [r0]	@ unaligned
	ldrh	r2, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r2, [r0, #4]	@ unaligned
	strb	r3, [r0, #6]
	bne	.L1146
.L1164:
	ldr	r9, [sp, #8]
.L1142:
	add	r9, r9, #1
	cmp	r9, #3
	bne	.L1147
	cmp	r5, #0
	beq	.L1138
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1165
.L1149:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	put_page
.L1163:
	movw	r1, #1716
	ldr	r0, [sp, #12]
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1145
.L1165:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1149
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
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r2, r1
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
	ldr	r6, [sp, #8]
	add	r2, r4, #2
	mov	r0, r5
	mov	r1, #5
	ldrd	r4, [sp]
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
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	ip, r0
	str	lr, [sp, #4]
	bne	.L1169
	ldrh	r0, [r0]	@ unaligned
	cmp	r0, #0
	beq	.L1170
	ldr	lr, [ip, #2]	@ unaligned
	cmp	r2, lr
	beq	.L1178
	mov	r4, #13
	b	.L1172
.L1173:
	ldr	lr, [lr, #2]	@ unaligned
	cmp	lr, r2
	beq	.L1178
.L1172:
	add	r1, r1, #1
	cmp	r1, r0
	mla	lr, r4, r1, ip
	bne	.L1173
.L1170:
	cmp	r3, #0
	cmpne	r0, #38
	beq	.L1182
	add	r3, r0, #1
	strh	r3, [ip]	@ unaligned
.L1168:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L1169:
	cmp	r1, #1
	bne	.L1182
	ldrh	lr, [r0]	@ unaligned
	cmp	lr, #0
	beq	.L1174
	ldr	r1, [r0, #2]	@ unaligned
	mov	r0, #0
	cmp	r2, r1
	beq	.L1168
	mov	r4, #78
	b	.L1175
.L1176:
	ldr	r1, [r1, #2]	@ unaligned
	cmp	r2, r1
	beq	.L1168
.L1175:
	add	r0, r0, #1
	cmp	r0, lr
	mla	r1, r4, r0, ip
	bne	.L1176
.L1174:
	cmp	lr, #6
	cmpne	r3, #0
	beq	.L1182
	add	r3, lr, #1
	mov	r0, lr
	strh	r3, [ip]	@ unaligned
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L1178:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, r1
	ldr	pc, [sp], #4
.L1182:
	mvn	r0, #0
	b	.L1168
	.fnend
	.size	lookup_journal_in_cursum, .-lookup_journal_in_cursum
	.align	2
	.global	flush_sit_entries
	.syntax unified
	.arm
	.fpu softvfp
	.type	flush_sit_entries, %function
flush_sit_entries:
	.fnstart
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	mov	r9, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #100
	sub	sp, sp, #100
	ldr	r4, [r3]
	str	r3, [sp, #76]
	ldr	r2, [r4, #28]
	add	r0, r4, #40
	ldr	r3, [r3, #12]
	str	r2, [sp, #4]
	ldr	r8, [r3, #168]
	str	r4, [sp, #52]
	str	r0, [sp, #64]
	str	r3, [sp, #68]
	bl	mutex_lock
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L1288
.L1192:
	ldr	r3, [r9]
	tst	r3, #16
	beq	.L1230
	ldrd	r4, [r9, #8]
	ldrd	r2, [r9, #16]
	cmp	r3, r5
	cmpeq	r2, r4
	bcc	.L1231
	mov	r8, r7
.L1232:
	mov	r2, #0
	mov	r1, r9
	mov	r0, r8
	bl	add_discard_addrs
	ldr	r1, [r9, #8]
	ldr	r0, [r9, #12]
	ldrd	r2, [r9, #16]
	adds	r6, r1, #1
	adc	r7, r0, #0
	cmp	r7, r3
	cmpeq	r6, r2
	strd	r6, [r9, #8]
	bls	.L1232
	mov	r7, r8
.L1231:
	strd	r4, [r9, #8]
.L1230:
	ldr	r0, [sp, #64]
	bl	mutex_unlock
	ldr	r3, [r7, #28]
	ldr	fp, [r3, #8]
	add	r8, fp, #36
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [r7, #28]
	ldr	r0, [fp, #32]
	ldr	r1, [r3, #32]
	bl	_find_first_bit_le
	ldr	r3, [r7, #28]
	mov	r5, r0
	ldr	r2, [r3, #32]
	cmp	r2, r0
	bhi	.L1237
	b	.L1233
.L1235:
	mov	r0, r9
	bl	_raw_spin_unlock
	ldr	r3, [r7, #28]
	add	r2, r5, #1
	ldr	r0, [fp, #32]
	ldr	r1, [r3, #32]
	bl	_find_next_bit_le
	ldr	r3, [r7, #28]
	mov	r5, r0
	ldr	r2, [r3, #32]
	cmp	r0, r2
	bcs	.L1233
.L1237:
	ldr	r4, [r3, #4]
	ldr	r6, [r7, #700]
	add	r9, r4, #12
	mov	r0, r9
	bl	_raw_spin_lock
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1235
	udiv	r10, r5, r6
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #16]
	add	r3, r3, #1
	str	r3, [r4, #4]
	ldr	r1, [r7, #700]
	mul	r6, r10, r6
	mov	r2, r6
	add	r1, r6, r1
	bl	_find_next_bit_le
	ldr	r3, [r7, #700]
	add	r6, r6, r3
	cmp	r0, r6
	bcc	.L1235
	mov	r0, r10
	ldr	r1, [r4, #20]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1235
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1235
.L1233:
	mov	r0, r8
	add	sp, sp, #100
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L1288:
	ldr	r3, [r7, #28]
	ldr	r2, [r3]
	add	r5, r3, #52
	ldr	r1, [r3, #32]
	ldr	r4, [r2, #28]
	mov	r0, r4
	bl	_find_first_bit_le
	b	.L1287
.L1289:
	mov	r1, r5
	bl	add_sit_entry
	ldr	r3, [r7, #28]
	add	r2, r6, #1
	mov	r0, r4
	ldr	r1, [r3, #32]
	bl	_find_next_bit_le
.L1287:
	ldr	r3, [r7, #28]
	mov	r6, r0
	ldr	r2, [r3, #32]
	cmp	r0, r2
	bcc	.L1289
	ldr	r1, [sp, #52]
	ldrh	r2, [r8]	@ unaligned
	ldr	r1, [r1, #32]
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1290
.L1195:
	ldr	r2, [sp, #76]
	ldr	r3, [r2, #52]
	add	r2, r2, #52
	cmp	r3, r2
	str	r2, [sp, #56]
	ldr	r2, [r3]
	mov	r1, r3
	str	r3, [sp, #44]
	str	r2, [sp, #48]
	beq	.L1199
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC3
	ldr	r10, [sp, #4]
	movt	r2, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC0
	str	r7, [sp, #12]
	movw	ip, #4767
	movt	r1, #:upper16:.LC3
	str	r9, [sp, #20]
	movt	r0, #:upper16:.LC0
	movt	ip, 10724
	str	r2, [sp, #60]
	mov	r2, #1
	mov	fp, r8
	mov	r8, r3
	str	r2, [sp, #16]
	str	ip, [sp, #72]
	strd	r0, [sp, #88]
	b	.L1227
.L1294:
	ldrh	r2, [fp]	@ unaligned
	ldr	r1, [r8, #12]
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1200
	ldr	r3, [sp, #68]
	add	r6, r3, #152
	mov	r0, r6
	bl	down_write
	mov	r2, r5
	mov	r1, r4
	mov	r0, r10
	mov	r5, r4
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r3, r5
	movls	r3, #1
	mov	r4, r0
	strls	r3, [sp, #16]
	bhi	.L1291
.L1202:
	mov	r0, r6
	bl	up_write
.L1224:
	ldr	r3, [r8, #12]
	cmp	r3, #0
	bne	.L1292
.L1226:
	ldr	r0, [sp, #44]
	ldr	r4, [sp, #48]
	str	r4, [sp, #44]
	bl	list_del
	ldr	r3, [sp, #60]
	mov	r1, r8
	mov	r8, r4
	ldr	r0, [r3, #4]
	bl	kmem_cache_free
	ldr	r3, [sp, #56]
	cmp	r4, r3
	ldr	r3, [r4]
	str	r3, [sp, #48]
	beq	.L1293
.L1227:
	ldr	r3, [sp, #12]
	ldr	r5, [r8, #8]
	ldr	r3, [r3, #28]
	add	r1, r5, #55
	ldr	r2, [r3, #32]
	cmp	r1, r2
	movcs	r4, r2
	ldr	r2, [sp, #16]
	movcc	r4, r1
	str	r4, [sp, #24]
	cmp	r2, #0
	bne	.L1294
.L1200:
	ldr	r2, [sp, #72]
	ldr	r7, [r3]
	umull	r2, r4, r2, r5
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #4]
	sub	r1, r5, r4
	sub	r2, r2, #1
	add	r4, r4, r1, lsr #1
	cmp	r5, r2
	movls	r2, r7
	lsr	r4, r4, #5
	add	r6, r4, r3
	bhi	.L1295
.L1203:
	ldr	r0, [r7, #16]
	mvn	r9, r4
	mov	r1, #1
	and	r9, r9, #7
	ldr	r2, [r2, #8]
	lsl	r9, r1, r9
	ldrb	r1, [r0, r4, lsr #3]	@ zero_extendqisi2
	ldr	r0, [sp, #12]
	tst	r1, r9
	ldrne	r1, [r7, #8]
	addne	r6, r6, r1
	sub	r1, r6, r3
	cmp	r1, r2
	addcc	r2, r1, r2
	subcs	r2, r1, r2
	add	r3, r2, r3
	mov	r1, r6
	str	r3, [sp, #4]
	bl	get_meta_page
	ldr	r3, [sp, #4]
	mov	r6, r0
	ldr	r0, [sp, #12]
	mov	r1, r3
	bl	grab_meta_page
	ldr	r3, [r6]
	str	r0, [sp, #28]
	tst	r3, #16
	bne	.L1296
.L1207:
	mov	r0, r6
	bl	page_address
	mov	r1, r0
	ldr	r0, [sp, #28]
	str	r1, [sp, #4]
	bl	page_address
	ldr	r1, [sp, #4]
	mov	r2, #4096
	bl	memcpy
	ldr	r0, [sp, #28]
	bl	set_page_dirty
	cmp	r6, #0
	beq	.L1208
	ldr	r3, [r6]
	tst	r3, #1
	beq	.L1297
.L1209:
	mov	r0, r6
	bl	unlock_page
	mov	r0, r6
	bl	put_page
.L1208:
	ldr	r2, [r7, #16]
	ldr	r0, [sp, #28]
	ldrb	r3, [r2, r4, lsr #3]	@ zero_extendqisi2
	eor	r9, r9, r3
	strb	r9, [r2, r4, lsr #3]
	bl	page_address
	mov	r2, r5
	ldr	r5, [sp, #24]
	str	r0, [sp, #32]
	mov	r0, r10
	mov	r1, r5
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r3, #0
	mov	r4, r0
	str	r3, [sp, #16]
	bls	.L1210
.L1201:
	ldr	r9, [sp, #52]
	mov	r6, #78
.L1223:
	ldr	r3, [sp, #12]
	add	r7, r4, r4, lsl #1
	ldr	r2, [sp, #20]
	lsl	r0, r7, #3
	ldr	r3, [r3, #28]
	ldr	r2, [r2]
	str	r0, [sp, #8]
	ldr	r1, [r3]
	ands	r3, r2, #16
	ldr	r5, [r1, #60]
	add	r2, r5, r0
	str	r2, [sp, #4]
	beq	.L1298
.L1211:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L1212
	ldrh	r2, [fp]	@ unaligned
	cmp	r2, #0
	beq	.L1217
	ldr	r3, [fp, #2]	@ unaligned
	cmp	r4, r3
	beq	.L1243
	mov	r1, #0
	b	.L1215
.L1216:
	add	r0, fp, r3
	ldr	r0, [r0, #2]	@ unaligned
	cmp	r4, r0
	beq	.L1299
.L1215:
	add	r1, r1, #1
	cmp	r2, r1
	mul	r3, r6, r1
	bne	.L1216
	cmp	r2, #6
	beq	.L1300
.L1217:
	mul	r3, r6, r2
	add	r1, r2, #1
	strh	r1, [fp]	@ unaligned
	add	r3, r3, #8
.L1214:
	ldr	r1, [sp, #8]
	mla	ip, r6, r2, fp
	add	r3, fp, r3
	mov	r0, r3
	str	r9, [sp, #36]
	str	r10, [sp, #40]
	str	r4, [ip, #2]	@ unaligned
	ldrb	lr, [r5, r7, lsl #3]	@ zero_extendqisi2
	ldrh	r1, [r5, r1]
	and	lr, lr, #63
	ubfx	r1, r1, #6, #10
	orr	r1, r1, lr, lsl #10
	strh	r1, [ip, #6]	@ unaligned
	ldr	r1, [sp, #4]
	ldr	r1, [r1, #4]
	add	ip, r1, #64
.L1218:
	ldr	r10, [r1]	@ unaligned
	add	r1, r1, #16
	add	r0, r0, #16
	ldr	r9, [r1, #-12]	@ unaligned
	ldr	r7, [r1, #-8]	@ unaligned
	ldr	lr, [r1, #-4]	@ unaligned
	cmp	r1, ip
	str	r10, [r0, #-16]	@ unaligned
	str	r9, [r0, #-12]	@ unaligned
	str	r7, [r0, #-8]	@ unaligned
	str	lr, [r0, #-4]	@ unaligned
	bne	.L1218
	ldr	r1, [sp, #4]
	add	r0, r3, #64
	ldr	r10, [sp, #40]
	ldr	r1, [r1, #8]
.L1219:
	ldr	r9, [r3]	@ unaligned
	add	r3, r3, #16
	add	r1, r1, #16
	ldr	r7, [r3, #-12]	@ unaligned
	ldr	lr, [r3, #-8]	@ unaligned
	ldr	ip, [r3, #-4]	@ unaligned
	cmp	r3, r0
	str	r9, [r1, #-16]	@ unaligned
	str	r7, [r1, #-12]	@ unaligned
	str	lr, [r1, #-8]	@ unaligned
	str	ip, [r1, #-4]	@ unaligned
	bne	.L1219
	ldr	lr, [sp, #4]
	mla	r2, r6, r2, fp
	ldr	r3, [sp, #8]
	ldr	r9, [sp, #36]
	ldrh	r1, [lr, #2]
	ldrh	r3, [r5, r3]
	ldr	r0, [lr, #16]
	ldr	ip, [lr, #20]
	lsr	r3, r3, #6
	bfi	r1, r3, #0, #10
	strh	r1, [lr, #2]	@ movhi
	str	r0, [r2, #72]	@ unaligned
	str	ip, [r2, #76]	@ unaligned
.L1220:
	cmp	r4, #0
	add	r3, r4, #31
	ldr	r7, [sp, #24]
	movge	r3, r4
	rsbs	r2, r4, #0
	asr	r3, r3, #5
	and	r2, r2, #31
	and	lr, r4, #31
	ldr	ip, [r10, r3, lsl #2]
	rsbpl	lr, r2, #0
	mov	r5, #1
	add	r2, r4, r5
	mov	r0, r10
	mov	r1, r7
	bic	ip, ip, r5, lsl lr
	str	ip, [r10, r3, lsl #2]
	ldr	r3, [r9, #32]
	sub	r3, r3, #1
	str	r3, [r9, #32]
	ldr	r3, [r8, #12]
	sub	r3, r3, #1
	str	r3, [r8, #12]
	bl	_find_next_bit_le
	cmp	r7, r0
	mov	r4, r0
	bhi	.L1223
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L1301
.L1210:
	ldr	r3, [sp, #28]
	cmp	r3, #0
	beq	.L1224
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1302
.L1225:
	ldr	r4, [sp, #28]
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
	ldr	r3, [r8, #12]
	cmp	r3, #0
	beq	.L1226
.L1292:
	mov	r1, #2944
	ldr	r0, [sp, #88]
	bl	warn_slowpath_null
	ldr	r3, [sp, #12]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	b	.L1226
.L1212:
	ldr	r1, [r9, #36]
	mov	r3, #74
	str	r9, [sp, #36]
	ldr	r2, [sp, #8]
	str	r10, [sp, #40]
	ldrb	ip, [r5, r7, lsl #3]	@ zero_extendqisi2
	udiv	r0, r4, r1
	ldrh	r2, [r5, r2]
	and	ip, ip, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, ip, lsl #10
	mls	r0, r1, r0, r4
	ldr	r1, [sp, #32]
	mul	r3, r3, r0
	strh	r2, [r1, r3]	@ unaligned
	ldr	r2, [sp, #4]
	add	r3, r3, #2
	add	r3, r1, r3
	mov	r1, r3
	ldr	r2, [r2, #4]
	add	ip, r2, #64
.L1221:
	ldr	r10, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r9, [r2, #-12]	@ unaligned
	ldr	r7, [r2, #-8]	@ unaligned
	ldr	lr, [r2, #-4]	@ unaligned
	cmp	r2, ip
	str	r10, [r1, #-16]	@ unaligned
	str	r9, [r1, #-12]	@ unaligned
	str	r7, [r1, #-8]	@ unaligned
	str	lr, [r1, #-4]	@ unaligned
	bne	.L1221
	ldr	r2, [sp, #4]
	add	r1, r3, #64
	ldr	r10, [sp, #40]
	ldr	r2, [r2, #8]
.L1222:
	ldr	r9, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	r7, [r3, #-12]	@ unaligned
	ldr	lr, [r3, #-8]	@ unaligned
	ldr	ip, [r3, #-4]	@ unaligned
	cmp	r3, r1
	str	r9, [r2, #-16]	@ unaligned
	str	r7, [r2, #-12]	@ unaligned
	str	lr, [r2, #-8]	@ unaligned
	str	ip, [r2, #-4]	@ unaligned
	bne	.L1222
	ldr	lr, [sp, #4]
	mov	r1, #74
	ldr	r3, [sp, #8]
	ldr	ip, [sp, #32]
	ldr	r9, [sp, #36]
	ldrh	r2, [lr, #2]
	ldrh	r3, [r5, r3]
	mla	r0, r1, r0, ip
	ldr	ip, [lr, #16]
	ldr	r1, [lr, #20]
	lsr	r3, r3, #6
	bfi	r2, r3, #0, #10
	strh	r2, [lr, #2]	@ movhi
	str	ip, [r0, #66]	@ unaligned
	str	r1, [r0, #70]	@ unaligned
	b	.L1220
.L1298:
	ldr	r0, [sp, #20]
	mov	r2, r3
	mov	r1, r0
	str	r4, [r0, #8]
	str	r3, [r0, #12]
	ldr	r0, [sp, #12]
	bl	add_discard_addrs
	b	.L1211
.L1299:
	add	r3, r3, #8
	mov	r2, r1
	b	.L1214
.L1300:
	movw	r1, #2923
	ldr	r0, [sp, #88]
	bl	warn_slowpath_null
	ldr	r3, [sp, #12]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	mvn	r3, #69
	mvn	r2, #0
	b	.L1214
.L1243:
	mov	r3, #8
	mov	r2, #0
	b	.L1214
.L1301:
	ldr	r3, [sp, #68]
	add	r6, r3, #152
	b	.L1202
.L1293:
	ldr	r7, [sp, #12]
	ldr	r3, [sp, #76]
	ldr	r9, [sp, #20]
	ldr	r3, [r3, #52]
	mov	r1, r3
.L1199:
	ldr	r3, [sp, #56]
	cmp	r3, r1
	bne	.L1303
.L1228:
	ldr	r3, [sp, #52]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1192
	movw	r0, #:lower16:.LC0
	movw	r1, #2949
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1192
.L1291:
	mov	r3, #0
	mov	r2, #1
	str	r2, [sp, #16]
	str	r3, [sp, #28]
	str	r3, [sp, #32]
	b	.L1201
.L1295:
	movw	r0, #:lower16:.LC13
	movw	r1, #625
	movt	r0, #:upper16:.LC13
	bl	warn_slowpath_null
	ldr	r9, [sp, #12]
	mov	r0, #2
	add	r1, r9, #16
	bl	_set_bit
	ldr	r3, [r9, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #4]
	b	.L1203
.L1296:
	movw	r1, #2753
	ldr	r0, [sp, #88]
	bl	warn_slowpath_null
	ldr	r3, [sp, #12]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	b	.L1207
.L1290:
	ldr	r3, [r3, #12]
	ldr	r5, [r3, #168]
	add	r10, r3, #152
	mov	r0, r10
	bl	down_write
	ldrh	r2, [r5]	@ unaligned
	cmp	r2, #0
	moveq	r3, r2
	beq	.L1196
	mov	r4, #0
	mov	r6, #78
	mov	fp, #1
	b	.L1198
.L1197:
	ldrh	r2, [r5]	@ unaligned
	add	r3, r4, #1
	cmp	r3, r2
	bge	.L1304
	mov	r4, r3
.L1198:
	mla	r3, r6, r4, r5
	ldr	r2, [r7, #28]
	ldr	r0, [r3, #2]	@ unaligned
	ldr	r1, [r2]
	rsbs	lr, r0, #0
	and	r3, r0, #31
	and	lr, lr, #31
	ldr	ip, [r1, #28]
	add	r2, r0, #31
	rsbpl	r3, lr, #0
	cmp	r0, #0
	movge	r2, r0
	lsl	r3, fp, r3
	asr	r2, r2, #5
	ldr	lr, [ip, r2, lsl #2]
	tst	r3, lr
	orr	r3, r3, lr
	str	r3, [ip, r2, lsl #2]
	bne	.L1197
	ldr	r3, [r1, #32]
	add	r3, r3, #1
	str	r3, [r1, #32]
	ldr	r1, [r7, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1197
.L1304:
	mvn	r3, r4
	uxth	r3, r3
.L1196:
	add	r3, r2, r3
	mov	r0, r10
	strh	r3, [r5]	@ unaligned
	bl	up_write
	b	.L1195
.L1297:
	movw	r1, #1716
	ldr	r0, [sp, #92]
	bl	warn_slowpath_null
	ldr	r3, [r6, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1209
.L1302:
	movw	r1, #1716
	ldr	r0, [sp, #92]
	bl	warn_slowpath_null
	ldr	r3, [sp, #28]
	mov	r0, #2
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1225
.L1303:
	movw	r0, #:lower16:.LC0
	movw	r1, #2948
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1228
	.fnend
	.size	flush_sit_entries, .-flush_sit_entries
	.align	2
	.global	build_segment_manager
	.syntax unified
	.arm
	.fpu softvfp
	.type	build_segment_manager, %function
build_segment_manager:
	.fnstart
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	movw	r9, #:lower16:kmalloc_caches
	movt	r9, #:upper16:kmalloc_caches
	strd	r10, [sp, #24]
	movw	r10, #:lower16:__stack_chk_guard
	str	lr, [sp, #32]
	ldr	r3, [r9, #28]
	movt	r10, #:upper16:__stack_chk_guard
	ldr	r2, [r10]
	.pad #148
	sub	sp, sp, #148
	mov	fp, r0
	ldr	r4, [r0, #8]
	ldr	r5, [r0, #368]
	cmp	r3, #0
	str	r2, [sp, #140]
	beq	.L1452
	mov	r0, r3
	mov	r2, #84
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	beq	.L1314
.L1306:
	str	r0, [fp, #28]
	ldr	r3, [r4, #72]	@ unaligned
	movw	r1, #34079
	movt	r1, 20971
	mov	ip, #2048
	str	r3, [r0, #16]
	ldr	r3, [r4, #92]	@ unaligned
	str	r3, [r0, #20]
	ldr	r3, [r4, #48]	@ unaligned
	str	r3, [r0, #28]
	ldr	r3, [r5, #24]	@ unaligned
	str	r3, [r0, #36]
	ldr	r3, [r5, #28]	@ unaligned
	str	r3, [r0, #40]
	ldr	r2, [r4, #68]	@ unaligned
	add	r3, r2, r2, lsl #2
	str	r2, [r0, #32]
	ldr	r2, [r4, #88]	@ unaligned
	umull	r1, r3, r1, r3
	mov	r1, #8
	str	r2, [r0, #24]
	mov	r2, #16
	lsr	r3, r3, #5
	cmp	r3, #4096
	movhi	r3, #4096
	str	r3, [r0, #44]
	ldr	r3, [fp, #864]
	str	ip, [r0, #48]
	str	r1, [r0, #68]
	str	r2, [r0, #72]
	tst	r3, #262144
	moveq	r3, #16
	streq	r3, [r0, #60]
	mov	r3, #70
	str	r3, [r0, #64]
	add	r3, r0, #52
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	ldr	r3, [fp]
	ldr	r2, [r3, #52]
	tst	r2, #1
	bne	.L1311
	mov	r0, fp
	bl	create_flush_cmd_control
	subs	r5, r0, #0
	bne	.L1305
	ldr	r3, [fp]
.L1311:
	ldr	r2, [fp, #28]
	ldr	r3, [r3, #208]
	ldr	r4, [r2, #80]
	ldr	r5, [r3]
	cmp	r4, #0
	beq	.L1589
.L1312:
	lsr	r2, r5, #20
	ubfx	r5, r5, #0, #20
	movw	r3, #:lower16:.LC16
	movw	r0, #:lower16:issue_discard_thread
	movt	r3, #:upper16:.LC16
	stm	sp, {r2, r5}
	movt	r0, #:upper16:issue_discard_thread
	mov	r1, fp
	mvn	r2, #0
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L1316
	bl	wake_up_process
	str	r5, [r4]
.L1428:
	ldr	r0, [r9, #28]
	ldr	r7, [fp, #8]
	cmp	r0, #0
	beq	.L1454
	mov	r2, #120
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r6, r0, #0
	beq	.L1314
.L1317:
	ldr	r3, [fp, #28]
	movw	r1, #33488
	str	r6, [r3]
	ldr	r3, [fp, #28]
	ldr	r3, [r3, #32]
	add	r3, r3, r3, lsl #1
	lsl	r4, r3, #3
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #60]
	beq	.L1590
.L1429:
	ldr	r3, [fp, #28]
	movw	r1, #33488
	ldr	r4, [r3, #32]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #28]
	beq	.L1591
.L1320:
	ldr	r3, [fp, #28]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1325
	mov	r5, #0
	ldr	r3, [r6, #60]
	mov	r8, r5
	b	.L1324
.L1575:
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1430:
	str	r0, [r4, #12]
	ldr	r3, [r6, #60]
	add	r2, r3, r5
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L1314
.L1326:
	ldr	r2, [fp, #28]
	add	r8, r8, #1
	add	r5, r5, #24
	ldr	r2, [r2, #32]
	cmp	r8, r2
	bcs	.L1325
.L1324:
	ldr	r0, [r9, #24]
	add	r4, r3, r5
	cmp	r0, #0
	moveq	r0, #16
	beq	.L1321
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1321:
	str	r0, [r4, #4]
	ldr	r0, [r9, #24]
	ldr	r4, [r6, #60]
	cmp	r0, #0
	add	r4, r4, r5
	moveq	r0, #16
	beq	.L1322
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1322:
	str	r0, [r4, #8]
	ldr	r3, [r6, #60]
	add	r4, r3, r5
	ldr	r2, [r4, #4]
	cmp	r2, #0
	beq	.L1314
	ldr	r2, [r4, #8]
	cmp	r2, #0
	beq	.L1314
	ldr	r2, [fp]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	bne	.L1323
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	beq	.L1326
.L1323:
	ldr	r0, [r9, #24]
	cmp	r0, #0
	bne	.L1575
	mov	r0, #16
	b	.L1430
.L1589:
	ldr	r0, [r9, #52]
	cmp	r0, #0
	beq	.L1453
	movw	r2, #4176
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L1314
.L1313:
	add	ip, r4, #4096
	add	r2, r4, #4
	add	ip, ip, #12
	add	r3, r4, #12
	str	r2, [r4, #4]
	str	r2, [r4, #8]
.L1315:
	str	r3, [r3]
	str	r3, [r3, #4]
	add	r3, r3, #8
	cmp	ip, r3
	bne	.L1315
	add	r6, r4, #4096
	movw	r1, #:lower16:.LC14
	ldr	r2, .L1617
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
	ldr	r2, [fp, #28]
	ldr	lr, [fp, #692]
	ldr	ip, [r2, #32]
	str	r3, [r6, #60]
	str	r3, [r6, #76]
	ldr	r2, .L1617
	lsl	r3, ip, lr
	str	r3, [r6, #56]
	bl	__init_waitqueue_head
	ldr	r3, [fp, #28]
	str	r4, [r3, #80]
	b	.L1312
.L1608:
	mov	r2, r0
	mov	r1, r10
	mov	r0, fp
	bl	restore_node_summary
	cmp	r0, #0
	beq	.L1373
	cmp	r9, #0
	mov	r4, r9
	ldr	r10, [sp, #16]
	mov	r5, r0
	beq	.L1305
	ldr	r3, [r9]
	tst	r3, #1
	beq	.L1592
.L1374:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1305:
	ldr	r2, [sp, #140]
	mov	r0, r5
	ldr	r3, [r10]
	cmp	r2, r3
	bne	.L1593
	add	sp, sp, #148
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1452:
	mov	r0, #16
	b	.L1306
.L1616:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #88]
	bne	.L1450
.L1314:
	mvn	r5, #11
	b	.L1305
.L1453:
	mov	r4, #16
	b	.L1313
.L1454:
	mov	r6, #16
	b	.L1317
.L1325:
	ldr	r0, [r9, #24]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r6, #24]
	beq	.L1328
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r6, #24]
	beq	.L1314
.L1328:
	ldr	r3, [fp, #700]
	cmp	r3, #1
	bls	.L1330
	ldr	r4, [fp, #708]
	movw	r1, #33488
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #64]
	beq	.L1594
.L1330:
	ldr	r3, [fp, #8]
	mov	r2, #208
	ldr	r0, [fp, #368]
	ldr	r4, [r7, #56]	@ unaligned
	ldr	r3, [r3, #1664]	@ unaligned
	ldr	r5, [r0, #156]	@ unaligned
	lsr	r4, r4, #1
	cmp	r3, #0
	addne	r0, r0, #4096
	addeq	r0, r0, #192
	mov	r1, r5
	bl	kmemdup
	cmp	r0, #0
	str	r0, [r6, #16]
	beq	.L1314
	movw	r3, #:lower16:.LANCHOR1
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	mov	r1, #55
	str	r3, [r6]
	ldr	r3, [r7, #80]	@ unaligned
	str	r3, [r6, #4]
	ldr	r3, [fp, #692]
	str	r2, [r6, #12]
	str	r5, [r6, #20]
	str	r2, [r6, #32]
	str	r1, [r6, #36]
	lsl	r4, r4, r3
	str	r4, [r6, #8]
	ldr	r3, [fp, #368]
	ldr	r2, [r3, #168]	@ unaligned
	ldr	r3, [r3, #172]	@ unaligned
	strd	r2, [r6, #72]
	bl	get_seconds
	asr	r5, r0, #31
	mov	r4, r0
	ldr	r2, .L1617
	movw	r1, #:lower16:.LC17
	add	r0, r6, #40
	movt	r1, #:upper16:.LC17
	strd	r4, [r6, #80]
	bl	__mutex_init
	ldr	r0, [r9, #24]
	cmp	r0, #0
	beq	.L1457
	mov	r2, #24
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r6, r0, #0
	beq	.L1314
.L1335:
	ldr	r3, [fp, #28]
	mov	r1, #720
	str	r6, [r3, #4]
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #16]
	beq	.L1595
.L1432:
	ldr	r5, [fp, #708]
	mov	r1, #720
	add	r5, r5, #31
	lsr	r5, r5, #5
	lsl	r5, r5, #2
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #20]
	beq	.L1596
.L1433:
	cmp	r4, #0
	bne	.L1597
.L1338:
	cmp	r5, #0
	bne	.L1598
.L1339:
	ldr	r3, [fp, #28]
	mov	r2, #0
	movw	r1, #32976
	ldr	r0, [fp, #692]
	ldr	ip, [r3, #16]
	ldr	r3, [r3, #20]
	str	r2, [r6, #4]
	str	r2, [r6, #8]
	str	r2, [r6, #12]
	sub	r3, r3, ip
	lsr	r3, r3, r0
	mov	r0, #384
	str	r3, [r6]
	bl	__kmalloc
	cmp	r0, #0
	beq	.L1314
	ldr	r3, [fp, #28]
	movw	r6, #:lower16:.LC18
	movw	r7, #:lower16:.LC19
	ldr	r5, .L1617
	mov	r4, r0
	movt	r6, #:upper16:.LC18
	movt	r7, #:upper16:.LC19
	add	r8, r0, #384
	str	r0, [r3, #12]
.L1344:
	mov	r0, r4
	mov	r2, r5
	mov	r1, r6
	bl	__mutex_init
	ldr	r0, [r9, #48]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #20]
	beq	.L1341
	mov	r2, #4096
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #20]
	beq	.L1314
.L1341:
	add	r0, r4, #24
	mov	r2, r5
	mov	r1, r7
	bl	__init_rwsem
	ldr	r0, [r9, #36]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #40]
	beq	.L1343
	movw	r2, #507
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #40]
	beq	.L1314
.L1343:
	mvn	r3, #0
	mov	r2, #0
	add	r4, r4, #64
	str	r3, [r4, #-16]
	strh	r2, [r4, #-12]	@ movhi
	cmp	r8, r4
	bne	.L1344
	ldr	r8, [fp, #368]
	ldr	r3, [r8, #132]	@ unaligned
	ands	r4, r3, #4
	beq	.L1345
	mov	r3, r2
	add	r0, r8, #176
.L1348:
	ldrb	r1, [r0], #1	@ zero_extendqisi2
	cmp	r1, #1
	addne	r1, r2, #56
	ldreq	r1, [fp, #696]
	add	r2, r2, #1
	addne	r1, r8, r1, lsl #1
	ldrhne	r1, [r1, #4]	@ unaligned
	cmp	r2, #3
	add	r3, r3, r1
	bne	.L1348
	cmp	r3, #440
	blt	.L1349
	ldr	r1, [fp, #8]
	sub	r3, r3, #436
	ldr	r0, [fp, #372]
	sub	r3, r3, #3
	cmp	r3, #584
	ldr	ip, [r8, #140]	@ unaligned
	movle	r2, #2
	ldr	r1, [r1, #76]	@ unaligned
	cmp	r0, #2
	mov	r0, #1
	ldreq	r3, [fp, #696]
	str	r0, [sp]
	mov	r0, fp
	addeq	r1, r1, r3
	mov	r3, #0
	add	r1, ip, r1
	bl	ra_meta_pages
	ldr	r8, [fp, #368]
.L1349:
	ldr	r3, [fp, #8]
	movw	r1, #:lower16:.LC3
	mov	r0, fp
	ldr	r2, [fp, #372]
	movt	r1, #:upper16:.LC3
	movw	r7, #507
	movw	r6, #1014
	mov	r4, #0
	ldr	r3, [r3, #76]	@ unaligned
	cmp	r2, #2
	ldreq	r2, [fp, #696]
	addeq	r3, r3, r2
	ldr	r2, [r8, #140]	@ unaligned
	str	r1, [sp, #16]
	add	r3, r2, r3
	mov	r1, r3
	add	r3, r3, #1
	str	r3, [sp, #12]
	bl	get_meta_page
	mov	r5, r0
	bl	page_address
	ldr	r3, [fp, #28]
	mov	r1, r0
	mov	r2, r7
	str	r1, [sp, #8]
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #40]
	bl	memcpy
	ldr	r3, [fp, #28]
	mov	r2, r7
	ldr	r1, [sp, #8]
	ldr	r3, [r3, #12]
	add	r1, r1, r7
	ldr	r0, [r3, #168]
	bl	memcpy
	strd	r8, [sp, #20]
	str	r10, [sp, #28]
.L1360:
	ldr	r0, [fp, #28]
	add	r2, r4, #20
	add	r3, r4, #56
	ldr	r10, [sp, #20]
	mov	r1, r4
	ldr	r7, [r0, #12]
	mov	r0, fp
	add	r2, r10, r2, lsl #2
	add	r3, r10, r3, lsl #1
	ldr	ip, [r2, #4]	@ unaligned
	mov	r2, #0
	add	r7, r7, r4, lsl #6
	ldrh	r8, [r3, #4]	@ unaligned
	str	ip, [r7, #60]
	bl	reset_curseg
	add	r2, r10, r4
	uxth	r9, r8
	ldrb	r2, [r2, #176]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r2, [r7, #44]
	strh	r8, [r7, #52]	@ movhi
	ldreq	r9, [fp, #696]
	uxtheq	r9, r9
	cmp	r9, #0
	beq	.L1354
	str	r4, [sp, #32]
	ldr	r0, [sp, #8]
	mov	r10, r7
	ldr	r4, [sp, #12]
	mov	r8, #0
	mov	r7, r5
.L1359:
	add	r3, r0, r6
	ldr	r1, [r10, #20]
	rsb	r2, r8, r8, lsl #3
	ldr	ip, [r3]	@ unaligned
	add	lr, r6, #14
	movw	r5, #4091
	cmp	lr, r5
	add	lr, r1, r2
	addls	r6, r6, #7
	str	ip, [r1, r2]	@ unaligned
	ldrh	r2, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r2, [lr, #4]	@ unaligned
	strb	r3, [lr, #6]
	bls	.L1356
	cmp	r7, #0
	beq	.L1357
	ldr	r3, [r7]
	tst	r3, #1
	beq	.L1599
.L1358:
	mov	r0, r7
	bl	unlock_page
	mov	r0, r7
	bl	put_page
.L1357:
	mov	r1, r4
	mov	r0, fp
	bl	get_meta_page
	add	r4, r4, #1
	mov	r6, #0
	mov	r7, r0
	bl	page_address
.L1356:
	add	r8, r8, #1
	cmp	r8, r9
	bne	.L1359
	mov	r5, r7
	str	r0, [sp, #8]
	str	r4, [sp, #12]
	ldr	r4, [sp, #32]
.L1354:
	add	r4, r4, #1
	cmp	r4, #3
	bne	.L1360
	cmp	r5, #0
	ldr	r9, [sp, #24]
	ldr	r10, [sp, #28]
	beq	.L1588
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1600
.L1362:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	bl	put_page
.L1588:
	ldr	r8, [fp, #368]
	ldr	r3, [r8, #132]	@ unaligned
.L1345:
	ands	r3, r3, #33
	beq	.L1364
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #372]
	ldr	ip, [r3, #76]	@ unaligned
	cmp	r2, #2
	beq	.L1601
.L1435:
	ldr	r1, [r8, #136]	@ unaligned
	mov	r0, #1
	mov	r3, #0
	rsb	r2, r4, #6
	str	r0, [sp]
	mov	r0, fp
	add	r1, r1, r4
	sub	r1, r1, #7
	add	r1, r1, ip
	bl	ra_meta_pages
	ldr	r8, [fp, #368]
	ldr	r3, [r8, #132]	@ unaligned
	and	r3, r3, #33
.L1364:
	movw	r2, #:lower16:.LC3
	lsl	r1, r4, #6
	movt	r2, #:upper16:.LC3
	mov	r7, #0
	str	r1, [sp, #8]
	str	r10, [sp, #16]
	str	r2, [sp, #20]
	mov	r2, r3
	str	r9, [sp, #24]
	b	.L1378
.L1605:
	add	ip, r4, #56
	cmp	r2, #0
	ldr	r1, [fp, #8]
	add	r2, r8, ip, lsl #1
	add	lr, r4, #20
	ldr	r0, [fp, #372]
	add	lr, r8, lr, lsl #2
	ldrh	r3, [r2, #4]	@ unaligned
	ldr	r10, [lr, #4]	@ unaligned
	str	r3, [sp, #12]
	ldr	r1, [r1, #76]	@ unaligned
	beq	.L1602
	cmp	r0, #2
	beq	.L1603
.L1439:
	ldr	r2, [r8, #136]	@ unaligned
	add	r2, r2, r4
	sub	r2, r2, #7
	add	r1, r2, r1
.L1368:
	mov	r0, fp
	bl	get_meta_page
	mov	r9, r0
	bl	page_address
	mov	r6, r0
.L1373:
	ldr	r2, [fp, #28]
	ldr	r3, [sp, #8]
	ldr	r5, [r2, #12]
	add	r5, r5, r3
	mov	r0, r5
	bl	mutex_lock
	add	r0, r5, #24
	bl	down_write
	movw	r2, #507
	add	r1, r6, #3584
	ldr	r0, [r5, #40]
	bl	memcpy
	add	r0, r5, #24
	bl	up_write
	mov	r2, #3584
	mov	r1, r6
	ldr	r0, [r5, #20]
	bl	memcpy
	ldr	lr, [r6, #4091]	@ unaligned
	mov	r2, #0
	mov	r1, r4
	ldr	ip, [r5, #20]
	mov	r0, fp
	str	lr, [ip, #4091]	@ unaligned
	ldrb	lr, [r6, #4095]	@ zero_extendqisi2
	strb	lr, [ip, #4095]
	str	r10, [r5, #60]
	bl	reset_curseg
	add	r3, r8, r4
	ldr	r2, [sp, #12]
	mov	r0, r5
	ldrb	r3, [r3, #176]	@ zero_extendqisi2
	strb	r3, [r5, #44]
	strh	r2, [r5, #52]	@ movhi
	bl	mutex_unlock
	cmp	r9, #0
	beq	.L1375
	ldr	r3, [r9]
	tst	r3, #1
	beq	.L1604
.L1376:
	mov	r0, r9
	bl	unlock_page
	mov	r0, r9
	bl	put_page
.L1375:
	ldr	r3, [sp, #8]
	add	r4, r4, #1
	cmp	r4, #6
	add	r3, r3, #64
	str	r3, [sp, #8]
	beq	.L1377
	ldr	r8, [fp, #368]
	ldr	r2, [r8, #132]	@ unaligned
	and	r2, r2, #33
.L1378:
	cmp	r4, #2
	ble	.L1605
	add	r1, r4, #29
	cmp	r2, #0
	add	r2, r8, r1, lsl #1
	add	r0, r4, #5
	add	r0, r8, r0, lsl #2
	ldrh	r3, [r2, #4]	@ unaligned
	ldr	r10, [r0, #4]	@ unaligned
	sub	r0, r4, #3
	str	r3, [sp, #12]
	beq	.L1606
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #372]
	ldr	r2, [r2, #76]	@ unaligned
	cmp	r1, #2
	beq	.L1607
.L1441:
	ldr	r1, [r8, #136]	@ unaligned
	sub	r1, r1, #4
	add	r1, r1, r0
	add	r1, r1, r2
.L1371:
	mov	r0, fp
	bl	get_meta_page
	mov	r9, r0
	bl	page_address
	ldr	r2, [fp, #368]
	mov	r6, r0
	ldr	r2, [r2, #132]	@ unaligned
	tst	r2, #33
	beq	.L1608
	ldr	r2, [fp, #696]
	cmp	r2, #0
	movne	r2, r0
	movne	r1, #0
	beq	.L1373
.L1372:
	strb	r7, [r2, #4]
	add	r1, r1, #1
	add	r2, r2, #7
	strb	r7, [r2, #-2]
	strb	r7, [r2, #-1]
	ldr	r3, [fp, #696]
	cmp	r3, r1
	bhi	.L1372
	b	.L1373
.L1316:
	mov	r0, r4
	str	r5, [r4]
	bl	kfree
	ldr	r3, [fp, #28]
	mov	r2, #0
	cmp	r5, #0
	str	r2, [r3, #80]
	bne	.L1305
	b	.L1428
.L1594:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #64]
	bne	.L1330
	b	.L1314
.L1457:
	mov	r6, #16
	b	.L1335
.L1606:
	ldr	r2, [fp, #28]
	ldr	r1, [r2, #24]
	add	r1, r10, r1
	b	.L1371
.L1590:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #60]
	bne	.L1429
	b	.L1314
.L1602:
	cmp	r0, #2
	bne	.L1437
	ldr	r2, [fp, #696]
	add	r1, r1, r2
.L1437:
	ldr	r2, [r8, #136]	@ unaligned
	add	r2, r2, r4
	sub	r2, r2, #4
	add	r1, r2, r1
	b	.L1368
.L1591:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #28]
	bne	.L1320
	b	.L1314
.L1598:
	mov	r2, r5
	mov	r1, #255
	ldr	r0, [r6, #20]
	bl	memset
	b	.L1339
.L1597:
	mov	r2, r4
	mov	r1, #255
	ldr	r0, [r6, #16]
	bl	memset
	b	.L1338
.L1603:
	ldr	r2, [fp, #696]
	add	r1, r1, r2
	b	.L1439
.L1607:
	ldr	r1, [fp, #696]
	add	r2, r2, r1
	b	.L1441
.L1377:
	ldr	r1, [fp, #28]
	movw	r2, #:lower16:.LC13
	movw	r0, #:lower16:.LC3
	movt	r2, #:upper16:.LC13
	movt	r0, #:upper16:.LC3
	ldr	r10, [sp, #16]
	movw	r3, #4767
	ldr	r9, [sp, #24]
	str	r2, [sp, #36]
	mov	r2, #0
	movt	r3, 10724
	str	r0, [sp, #52]
	ldr	r0, [r1, #12]
	str	r2, [sp, #28]
	ldr	r2, [r1, #32]
	ldr	r1, [r1]
	add	r2, r2, #54
	str	r0, [sp, #48]
	ldr	r0, [r0, #168]
	str	r9, [sp, #56]
	mov	r9, r1
	str	r10, [sp, #60]
	str	r0, [sp, #32]
	umull	r0, r3, r3, r2
	str	r1, [sp, #40]
	sub	r2, r2, r3
	add	r3, r3, r2, lsr #1
	lsr	r3, r3, #5
	str	r3, [sp, #44]
.L1393:
	ldr	r4, [sp, #28]
	mov	r0, #1
	mov	r3, #2
	mov	r2, #256
	str	r0, [sp]
	mov	r0, fp
	mov	r1, r4
	bl	ra_meta_pages
	ldr	r3, [r9, #36]
	add	r2, r4, r0
	str	r2, [sp, #28]
	mul	r5, r3, r4
	mul	r3, r2, r3
	cmp	r5, r3
	str	r3, [sp, #16]
	bcs	.L1379
	ldr	r2, [fp, #28]
	ldr	r3, [r2, #32]
	cmp	r5, r3
	bcs	.L1379
	add	r3, sp, #66
	add	r8, r5, r5, lsl #1
	str	r3, [sp, #20]
	add	r3, sp, #68
	lsl	r8, r8, #3
	str	r3, [sp, #12]
	add	r3, sp, #132
	str	r3, [sp, #8]
.L1392:
	movw	r3, #4767
	ldr	r10, [r2]
	movt	r3, 10724
	ldr	r2, [r2, #28]
	ldr	r4, [r9, #60]
	umull	r1, r3, r3, r5
	ldr	r7, [r10, #4]
	sub	r2, r2, #1
	cmp	r2, r5
	add	r4, r4, r8
	sub	r6, r5, r3
	add	r3, r3, r6, lsr #1
	lsr	r6, r3, #5
	add	r7, r6, r7
	bcc	.L1609
.L1380:
	ldr	r2, [r10, #16]
	mvn	r3, r6
	mov	r1, #1
	and	r3, r3, #7
	mov	r0, fp
	ldrb	r2, [r2, r6, lsr #3]	@ zero_extendqisi2
	ands	r3, r2, r1, lsl r3
	ldrne	r3, [r10, #8]
	addne	r7, r7, r3
	mov	r1, r7
	bl	get_meta_page
	mov	r7, r0
	bl	page_address
	ldr	r1, [r9, #36]
	mov	r3, #74
	mov	r2, r3
	udiv	r6, r5, r1
	mls	r6, r1, r6, r5
	mla	r6, r3, r6, r0
	ldr	r0, [sp, #20]
	mov	r1, r6
	bl	memcpy
	ldr	r3, [r6, #66]	@ unaligned
	cmp	r7, #0
	ldrh	r10, [r6]	@ unaligned
	ldr	r6, [r6, #70]	@ unaligned
	str	r3, [sp, #24]
	beq	.L1382
	ldr	r2, [r7]
	tst	r2, #1
	beq	.L1610
.L1383:
	mov	r0, r7
	bl	unlock_page
	mov	r0, r7
	bl	put_page
.L1382:
	ldr	r2, [fp, #696]
	ubfx	r7, r10, #0, #10
	cmp	r7, r2
	bhi	.L1384
	ldr	r2, [fp, #28]
	ldr	r2, [r2, #28]
	sub	r2, r2, #1
	cmp	r2, r5
	bcc	.L1384
.L1385:
	ldrh	r0, [r4]
	uxth	r7, r7
	ldrh	ip, [r4, #2]
	ldr	r1, [r4, #4]
	ldr	r2, [sp, #12]
	bfi	r0, r7, #6, #10
	bfi	ip, r7, #0, #10
	strh	r0, [r4]	@ movhi
	strh	ip, [r4, #2]	@ movhi
.L1386:
	ldr	r7, [sp, #8]
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	lr, [r2, #-16]	@ unaligned
	ldr	ip, [r2, #-12]	@ unaligned
	ldr	r0, [r2, #-8]	@ unaligned
	ldr	r3, [r2, #-4]	@ unaligned
	cmp	r2, r7
	str	lr, [r1, #-16]	@ unaligned
	str	ip, [r1, #-12]	@ unaligned
	str	r0, [r1, #-8]	@ unaligned
	str	r3, [r1, #-4]	@ unaligned
	bne	.L1386
	ldr	r1, [r4, #8]
	ldr	r2, [sp, #12]
.L1387:
	ldr	r7, [sp, #8]
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	lr, [r2, #-16]	@ unaligned
	ldr	ip, [r2, #-12]	@ unaligned
	ldr	r0, [r2, #-8]	@ unaligned
	ldr	r3, [r2, #-4]	@ unaligned
	cmp	r2, r7
	str	lr, [r1, #-16]	@ unaligned
	str	ip, [r1, #-12]	@ unaligned
	str	r0, [r1, #-8]	@ unaligned
	str	r3, [r1, #-4]	@ unaligned
	bne	.L1387
	ldrb	r2, [r4]	@ zero_extendqisi2
	asr	r3, r10, #10
	str	r6, [r4, #20]
	ldr	r1, [sp, #24]
	bfi	r2, r3, #0, #6
	strb	r2, [r4]
	str	r1, [r4, #16]
	ldr	r3, [fp]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1388
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1389
.L1388:
	ldr	r3, [fp, #368]
	ldr	r0, [r4, #12]
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #256
	beq	.L1611
	mov	r2, #64
	mov	r1, #255
	bl	memset
.L1389:
	ldr	r3, [fp, #700]
	cmp	r3, #1
	bls	.L1391
	ldr	r2, [fp, #28]
	udiv	r3, r5, r3
	ldrh	r0, [r4]
	ldr	r2, [r2]
	ldr	r1, [r2, #64]
	ldr	r2, [r1, r3, lsl #2]
	add	r2, r2, r0, lsr #6
	str	r2, [r1, r3, lsl #2]
.L1391:
	ldr	r3, [sp, #16]
	add	r5, r5, #1
	cmp	r3, r5
	beq	.L1379
	ldr	r2, [fp, #28]
	add	r8, r8, #24
	ldr	r3, [r2, #32]
	cmp	r5, r3
	bcc	.L1392
.L1379:
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #44]
	cmp	r3, r2
	bhi	.L1393
	ldr	r3, [sp, #48]
	ldr	r9, [sp, #56]
	ldr	r10, [sp, #60]
	add	r3, r3, #152
	mov	r0, r3
	str	r3, [sp, #48]
	bl	down_read
	ldr	r2, [sp, #32]
	ldrh	r3, [r2]	@ unaligned
	cmp	r3, #0
	beq	.L1394
	movw	r3, #:lower16:.LC13
	add	r5, r2, #6
	str	r9, [sp, #56]
	movt	r3, #:upper16:.LC13
	str	r3, [sp, #52]
	mov	r3, #0
	str	r10, [sp, #60]
	str	r3, [sp, #8]
	add	r3, sp, #66
	str	r3, [sp, #36]
	add	r3, sp, #68
	str	r3, [sp, #16]
	add	r3, sp, #132
	str	r3, [sp, #20]
.L1403:
	ldr	r3, [sp, #8]
	mov	r2, #78
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #36]
	mla	r3, r2, r3, r1
	ldr	r2, [sp, #40]
	mov	r1, r5
	ldr	r8, [r3, #2]	@ unaligned
	ldr	r4, [r2, #60]
	mov	r2, #74
	bl	memcpy
	ldr	r3, [r5, #66]	@ unaligned
	ldrh	r9, [r5]	@ unaligned
	add	r10, r8, r8, lsl #1
	ldr	r2, [fp, #696]
	lsl	r7, r10, #3
	str	r3, [sp, #24]
	ldr	r3, [r5, #70]	@ unaligned
	add	r6, r4, r7
	str	r3, [sp, #28]
	ubfx	r3, r9, #0, #10
	cmp	r3, r2
	ldrh	r2, [r4, r7]
	lsr	r2, r2, #6
	str	r2, [sp, #12]
	bhi	.L1395
	ldr	r2, [fp, #28]
	ldr	r2, [r2, #28]
	sub	r2, r2, #1
	cmp	r8, r2
	bhi	.L1395
.L1396:
	ldrh	r2, [r4, r7]
	uxth	r0, r3
	str	r4, [sp, #44]
	ldr	r3, [sp, #16]
	bfi	r2, r0, #6, #10
	strh	r2, [r4, r7]	@ movhi
	ldrh	r1, [r6, #2]
	ldr	r2, [r6, #4]
	bfi	r1, r0, #0, #10
	strh	r1, [r6, #2]	@ movhi
.L1397:
	ldr	r4, [sp, #20]
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-16]	@ unaligned
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r4
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1397
	ldr	r2, [r6, #8]
	ldr	r3, [sp, #16]
	ldr	r4, [sp, #44]
.L1398:
	ldr	r1, [r3, #12]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-16]	@ unaligned
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	str	r1, [sp, #44]
	ldr	r1, [sp, #20]
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	cmp	r3, r1
	ldr	r1, [sp, #44]
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1398
	ldrb	r3, [r4, r10, lsl #3]	@ zero_extendqisi2
	asr	r9, r9, #10
	bfi	r3, r9, #0, #6
	strb	r3, [r4, r10, lsl #3]
	ldr	r3, [sp, #24]
	str	r3, [r6, #16]
	ldr	r3, [sp, #28]
	str	r3, [r6, #20]
	ldr	r3, [fp]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1399
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1400
.L1399:
	ldr	r3, [fp, #368]
	ldr	r0, [r6, #12]
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #256
	beq	.L1612
	mov	r2, #64
	mov	r1, #255
	bl	memset
.L1400:
	ldr	r3, [fp, #700]
	cmp	r3, #1
	bls	.L1402
	ldr	r2, [fp, #28]
	udiv	r8, r8, r3
	ldrh	r1, [r4, r7]
	ldr	r3, [r2]
	ldr	r2, [r3, #64]
	ldr	r3, [r2, r8, lsl #2]
	add	r3, r3, r1, lsr #6
	ldr	r1, [sp, #12]
	sub	r3, r3, r1
	str	r3, [r2, r8, lsl #2]
.L1402:
	ldr	r2, [sp, #8]
	add	r5, r5, #78
	ldr	r3, [sp, #32]
	add	r2, r2, #1
	ldrh	r3, [r3]	@ unaligned
	str	r2, [sp, #8]
	cmp	r2, r3
	bcc	.L1403
	ldr	r9, [sp, #56]
	ldr	r10, [sp, #60]
.L1394:
	ldr	r0, [sp, #48]
	bl	up_read
	ldr	r2, [fp, #28]
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L1404
	mov	r6, #0
	mov	r5, r6
	b	.L1408
.L1618:
	.align	2
.L1617:
	.word	.LANCHOR0+16
.L1405:
	ldr	r2, [r3, #12]
	add	r1, r2, r1, lsr #6
	str	r1, [r3, #12]
.L1407:
	ldr	r2, [fp, #28]
	add	r5, r5, #1
	add	r6, r6, #24
	ldr	r3, [r2, #32]
	cmp	r5, r3
	bcs	.L1404
.L1408:
	ldr	r3, [r2]
	ldr	r1, [r3, #60]
	ldrh	r1, [r1, r6]
	bic	r0, r1, #63
	cmp	r0, #0
	bne	.L1405
	ldr	r7, [fp, #700]
	ldr	r4, [r2, #4]
	udiv	r3, r5, r7
	add	r8, r4, #12
	mov	r0, r8
	mul	r7, r3, r7
	str	r3, [sp, #8]
	bl	_raw_spin_lock
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	_clear_bit
	ldr	r1, [r4, #4]
	mov	r2, r7
	ldr	r0, [r4, #16]
	add	r1, r1, #1
	str	r1, [r4, #4]
	ldr	r1, [fp, #700]
	add	r1, r7, r1
	bl	_find_next_bit_le
	ldr	r2, [fp, #700]
	ldr	r3, [sp, #8]
	add	r7, r7, r2
	cmp	r0, r7
	bcs	.L1613
.L1406:
	mov	r0, r8
	bl	_raw_spin_unlock
	b	.L1407
.L1611:
	ldr	r3, [r4, #4]
	add	r2, r3, #64
.L1390:
	ldr	r6, [r3]	@ unaligned
	add	r3, r3, #16
	add	r0, r0, #16
	ldr	lr, [r3, #-12]	@ unaligned
	ldr	ip, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r2
	str	r6, [r0, #-16]	@ unaligned
	str	lr, [r0, #-12]	@ unaligned
	str	ip, [r0, #-8]	@ unaligned
	str	r1, [r0, #-4]	@ unaligned
	bne	.L1390
	ldr	r1, [fp, #696]
	ldr	r3, [fp, #744]
	ldrh	r2, [r4]
	add	r3, r3, r1
	sub	r3, r3, r2, lsr #6
	str	r3, [fp, #744]
	b	.L1389
.L1384:
	movw	r1, #663
	ldr	r0, [sp, #36]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1385
.L1609:
	movw	r1, #625
	ldr	r0, [sp, #36]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1380
.L1610:
	movw	r1, #1716
	ldr	r0, [sp, #52]
	bl	warn_slowpath_null
	ldr	r2, [r7, #4]
	mov	r0, #2
	ldr	r2, [r2]
	ldr	r2, [r2, #28]
	ldr	r1, [r2, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1383
.L1612:
	ldr	r2, [r6, #4]
	mov	r3, r0
	add	r1, r2, #64
.L1401:
	ldr	r6, [r2]	@ unaligned
	add	r2, r2, #16
	add	r3, r3, #16
	ldr	lr, [r2, #-12]	@ unaligned
	ldr	ip, [r2, #-8]	@ unaligned
	ldr	r0, [r2, #-4]	@ unaligned
	cmp	r2, r1
	str	r6, [r3, #-16]	@ unaligned
	str	lr, [r3, #-12]	@ unaligned
	str	ip, [r3, #-8]	@ unaligned
	str	r0, [r3, #-4]	@ unaligned
	bne	.L1401
	ldr	r3, [fp, #744]
	ldr	r1, [sp, #12]
	ldrh	r2, [r4, r7]
	add	r3, r1, r3
	sub	r3, r3, r2, lsr #6
	str	r3, [fp, #744]
	b	.L1400
.L1395:
	movw	r1, #663
	ldr	r0, [sp, #52]
	str	r3, [sp, #44]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp, #44]
	b	.L1396
.L1404:
	mov	r5, #0
	b	.L1413
.L1410:
	mov	r0, r7
	add	r5, r5, #64
	bl	_raw_spin_unlock
	cmp	r5, #384
	beq	.L1412
	ldr	r2, [fp, #28]
.L1413:
	ldr	r4, [r2, #4]
	ldr	r3, [r2, #12]
	ldr	r6, [fp, #700]
	add	r7, r4, #12
	add	r3, r3, r5
	mov	r0, r7
	ldr	r8, [r3, #48]
	bl	_raw_spin_lock
	ldr	r1, [r4, #16]
	mov	r0, r8
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1410
	ldr	r3, [r4, #4]
	udiv	r0, r8, r6
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	str	r3, [r4, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1410
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1410
.L1412:
	ldr	r0, [r9, #28]
	cmp	r0, #0
	beq	.L1460
	mov	r2, #92
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L1314
.L1414:
	ldr	ip, [fp, #28]
	add	r6, r7, #36
	movw	r1, #:lower16:.LC20
	mov	r0, r6
	movt	r1, #:upper16:.LC20
	ldr	r2, .L1617
	movw	r5, #:lower16:pgprot_kernel
	movt	r5, #:upper16:pgprot_kernel
	str	r7, [ip, #8]
	add	r7, r7, #4
	bl	__mutex_init
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	b	.L1416
.L1449:
	add	r7, r7, #4
	cmp	r6, r7
	beq	.L1614
.L1416:
	movw	r1, #33488
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r7]
	bne	.L1449
	ldr	r2, [r5]
	movw	r1, #32976
	mov	r0, r4
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r7]
	bne	.L1449
	b	.L1314
.L1596:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r5
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #20]
	bne	.L1433
	b	.L1314
.L1595:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r4
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #16]
	bne	.L1432
	b	.L1314
.L1604:
	movw	r1, #1716
	ldr	r0, [sp, #20]
	bl	warn_slowpath_null
	ldr	r3, [r9, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1376
.L1599:
	movw	r1, #1716
	ldr	r0, [sp, #16]
	bl	warn_slowpath_null
	ldr	r3, [r7, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1358
.L1613:
	mov	r0, r3
	ldr	r1, [r4, #20]
	bl	_clear_bit
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1406
.L1614:
	ldr	r3, [fp, #28]
	movw	r6, #:lower16:.LC0
	mov	r9, #0
	movt	r6, #:upper16:.LC0
	ldr	r8, [r3, #4]
	ldr	r5, [r3, #8]
	ldr	r4, [r3, #32]
	add	r3, r8, #12
	add	r5, r5, #36
	str	r3, [sp, #8]
.L1417:
	ldr	r0, [sp, #8]
	bl	_raw_spin_lock
	mov	r1, r4
	mov	r2, r9
	ldr	r0, [r8, #16]
	bl	_find_next_bit_le
	mov	r7, r0
	ldr	r0, [sp, #8]
	bl	_raw_spin_unlock
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	cmp	r7, r4
	bcs	.L1418
	ldr	r1, [r3]
	add	r3, r7, r7, lsl #1
	add	r9, r7, #1
	ldr	r2, [fp, #696]
	lsl	r3, r3, #3
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	moveq	r1, #1
	movne	r1, #0
	cmp	r3, r2
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L1417
	cmp	r3, r2
	bhi	.L1615
	mov	r0, r5
	bl	mutex_lock
	mov	r1, r7
	mov	r2, #6
	mov	r0, fp
	bl	__locate_dirty_segment
	mov	r0, r5
	bl	mutex_unlock
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	b	.L1417
.L1418:
	ldr	r4, [fp, #708]
	movw	r1, #33488
	ldr	r5, [r3, #8]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #88]
	beq	.L1616
.L1450:
	ldr	r3, [fp, #28]
	ldr	r6, [r3]
	add	r7, r6, #40
	mov	r0, r7
	bl	mutex_lock
	mvn	r3, #-2147483648
	mvn	r2, #0
	strd	r2, [r6, #88]
	ldr	r8, [fp, #28]
	ldr	r3, [r8, #32]
	cmp	r3, #0
	beq	.L1422
	ldr	r9, [fp, #700]
	mov	r5, #0
.L1423:
	cmp	r9, #0
	moveq	r0, #0
	moveq	r1, r0
	beq	.L1427
	ldr	lr, [r8]
	add	ip, r9, r5
	add	r3, r5, r5, lsl #1
	add	r2, ip, ip, lsl #1
	mov	r0, #0
	mov	r1, r0
	ldr	ip, [lr, #60]
	add	r3, ip, r3, lsl #3
	add	ip, ip, r2, lsl #3
.L1424:
	ldr	r2, [r3, #16]
	ldr	lr, [r3, #20]
	add	r3, r3, #24
	adds	r0, r0, r2
	adc	r1, r1, lr
	cmp	ip, r3
	bne	.L1424
.L1427:
	mov	r4, r9
	.syntax divided
@ 55 "/home/Jprimero15/hlte/lolz/include/linux/math64.h" 1
	.ifnc r1,r1 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r4,r4 ; .err ; .endif
	bl	__do_div64
@ 0 "" 2
	.arm
	.syntax unified
	ldrd	r0, [r6, #88]
	cmp	r3, r1
	cmpeq	r2, r0
	bcs	.L1425
	strd	r2, [r6, #88]
	ldr	r8, [fp, #28]
	ldr	r9, [fp, #700]
.L1425:
	ldr	r3, [r8, #32]
	add	r5, r5, r9
	cmp	r5, r3
	bcc	.L1423
.L1422:
	ldr	r4, [r8]
	mov	r5, #0
	ldrd	r8, [r4, #72]
	bl	get_seconds
	ldr	r1, [r4, #80]
	ldr	ip, [r4, #84]
	adds	r2, r8, r0
	adc	r3, r9, r0, asr #31
	mov	r8, r2
	mov	r0, r7
	mov	r9, r3
	subs	r3, r8, r1
	sbc	r2, r9, ip
	str	r3, [r6, #96]
	str	r2, [r6, #100]
	bl	mutex_unlock
	b	.L1305
.L1615:
	movw	r1, #3240
	mov	r0, r6
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	b	.L1417
.L1460:
	mov	r7, #16
	b	.L1414
.L1601:
	ldr	r3, [fp, #696]
	add	ip, ip, r3
	b	.L1435
.L1600:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1362
.L1592:
	movw	r0, #:lower16:.LC3
	movw	r1, #1716
	movt	r0, #:upper16:.LC3
	bl	warn_slowpath_null
	ldr	r3, [r9, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1374
.L1593:
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
	ldr	r9, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	cmp	r9, #0
	beq	.L1619
	mov	r6, r0
	mov	r1, #1
	bl	destroy_flush_cmd_control
	ldr	r2, [r6, #28]
	ldr	r4, [r2, #80]
	cmp	r4, #0
	beq	.L1621
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1622
	mov	r3, #0
	str	r3, [r4]
	bl	kthread_stop
.L1622:
	mov	r0, r4
	bl	kfree
	ldr	r3, [r6, #28]
	mov	r2, #0
	str	r2, [r3, #80]
	ldr	r2, [r6, #28]
.L1621:
	ldr	r10, [r2, #8]
	cmp	r10, #0
	beq	.L1623
	mov	r5, #0
	mov	r4, r10
	mov	r8, r5
	b	.L1627
.L1624:
	bl	kfree
.L1625:
	mov	r0, r7
	add	r5, r5, #1
	str	r8, [r4, #56]
	bl	mutex_unlock
	cmp	r5, #8
	ldr	r3, [r6, #28]
	beq	.L1626
	ldr	r4, [r3, #8]
.L1627:
	add	r7, r4, #36
	add	r4, r4, r5, lsl #2
	mov	r0, r7
	bl	mutex_lock
	ldr	fp, [r4, #4]
	mov	r0, fp
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, fp
	beq	.L1624
	bl	vfree
	b	.L1625
.L1626:
	ldr	r3, [r3, #8]
	ldr	r4, [r3, #88]
	mov	r0, r4
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r4
	bne	.L1672
	bl	kfree
.L1629:
	ldr	r3, [r6, #28]
	mov	r2, #0
	mov	r0, r10
	str	r2, [r3, #8]
	bl	kfree
	ldr	r2, [r6, #28]
.L1623:
	ldr	r7, [r2, #12]
	cmp	r7, #0
	beq	.L1630
	mov	r3, #0
	mov	r4, r7
	add	r5, r7, #384
	str	r3, [r2, #12]
.L1631:
	ldr	r0, [r4, #20]
	add	r4, r4, #64
	bl	kfree
	ldr	r0, [r4, #-24]
	bl	kfree
	cmp	r5, r4
	bne	.L1631
	mov	r0, r7
	bl	kfree
	ldr	r2, [r6, #28]
.L1630:
	ldr	r4, [r2, #4]
	cmp	r4, #0
	beq	.L1632
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r5, [r4, #16]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	bne	.L1673
	bl	kfree
.L1634:
	ldr	r5, [r4, #20]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L1635
	bl	vfree
.L1636:
	mov	r0, r4
	bl	kfree
	ldr	r2, [r6, #28]
.L1632:
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L1637
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L1638
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	.L1638
	mov	r5, #0
	mov	r7, r5
	b	.L1639
.L1674:
	ldr	r3, [r4, #60]
.L1639:
	add	r3, r3, r5
	add	r7, r7, #1
	ldr	r0, [r3, #4]
	bl	kfree
	ldr	r3, [r4, #60]
	add	r3, r3, r5
	ldr	r0, [r3, #8]
	bl	kfree
	ldr	r3, [r4, #60]
	add	r3, r3, r5
	add	r5, r5, #24
	ldr	r0, [r3, #12]
	bl	kfree
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #32]
	cmp	r7, r3
	bcc	.L1674
.L1638:
	ldr	r0, [r4, #24]
	bl	kfree
	ldr	r5, [r4, #60]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L1640
	bl	vfree
.L1641:
	ldr	r5, [r4, #64]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L1642
	bl	vfree
.L1643:
	ldr	r5, [r4, #28]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L1644
	bl	vfree
.L1645:
	ldr	r3, [r6, #28]
	mov	r2, #0
	str	r2, [r3]
	ldr	r0, [r4, #16]
	bl	kfree
	mov	r0, r4
	bl	kfree
.L1637:
	mov	r3, #0
	mov	r0, r9
	str	r3, [r6, #28]
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	kfree
.L1619:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1644:
	bl	kfree
	b	.L1645
.L1642:
	bl	kfree
	b	.L1643
.L1640:
	bl	kfree
	b	.L1641
.L1673:
	bl	vfree
	b	.L1634
.L1672:
	bl	vfree
	b	.L1629
.L1635:
	bl	kfree
	b	.L1636
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
	.type	__key.7528, %object
	.size	__key.7528, 0
__key.7528:
	.type	inmem_entry_slab, %object
	.size	inmem_entry_slab, 4
inmem_entry_slab:
	.space	4
	.type	__key.33489, %object
	.size	__key.33489, 0
__key.33489:
	.type	__key.33913, %object
	.size	__key.33913, 0
__key.33913:
	.type	__key.33915, %object
	.size	__key.33915, 0
__key.33915:
	.type	__key.34498, %object
	.size	__key.34498, 0
__key.34498:
	.type	__key.34517, %object
	.size	__key.34517, 0
__key.34517:
	.type	__key.34518, %object
	.size	__key.34518, 0
__key.34518:
	.type	__key.34590, %object
	.size	__key.34590, 0
__key.34590:
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/home/Jprimero15/hlte/lolz/fs/f2fs/segment.c\000"
	.space	3
.LC1:
	.ascii	"Issue discard failed, ret: %d\000"
	.space	2
.LC2:
	.ascii	"<6>\000"
.LC3:
	.ascii	"/home/Jprimero15/hlte/lolz/fs/f2fs/f2fs.h\000"
	.space	2
.LC4:
	.ascii	"&x->wait\000"
	.space	3
.LC5:
	.ascii	"discard_entry\000"
	.space	2
.LC6:
	.ascii	"discard_cmd\000"
.LC7:
	.ascii	"sit_entry_set\000"
	.space	2
.LC8:
	.ascii	"inmem_page_entry\000"
	.space	3
.LC9:
	.ascii	"&fcc->flush_wait_queue\000"
	.space	1
.LC10:
	.ascii	"f2fs_flush-%u:%u\000"
	.space	3
.LC11:
	.ascii	"Found FS corruption, run fsck to fix.\000"
	.space	2
.LC12:
	.ascii	"<4>\000"
.LC13:
	.ascii	"/home/Jprimero15/hlte/lolz/fs/f2fs/segment.h\000"
	.space	3
.LC14:
	.ascii	"&dcc->cmd_lock\000"
	.space	1
.LC15:
	.ascii	"&dcc->discard_wait_queue\000"
	.space	3
.LC16:
	.ascii	"f2fs_discard-%u:%u\000"
	.space	1
.LC17:
	.ascii	"&sit_i->sentry_lock\000"
.LC18:
	.ascii	"&array[i].curseg_mutex\000"
	.space	1
.LC19:
	.ascii	"&array[i].journal_rwsem\000"
.LC20:
	.ascii	"&dirty_i->seglist_lock\000"
	.ident	"GCC: (Linaro GCC 7.5-2019.12) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
// Generated by Lolz Kernel

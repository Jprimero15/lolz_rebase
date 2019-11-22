__find_rev_next_bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, r1
	bcs	.L23
	lsr	r3, r2, #5
	bic	ip, r2, #31
	.save {r4, lr}
	str	r4, [sp, #-8]!
	sub	ip, r1, ip
	str	lr, [sp, #4]
	add	r0, r0, r3, lsl #2
	and	r2, r2, #31
	mvn	lr, #0
	sub	r0, r0, #4
	b	.L6
.L3:
	cmp	ip, #32
	mov	r2, #0
	sub	ip, ip, #32
	bls	.L2
.L6:
	ldr	r3, [r0, #4]!
	cmp	r3, #0
	beq	.L3
	rev	r3, r3
	cmp	ip, #31
	rsb	r4, ip, #32
	and	r3, r3, lr, lsr r2
	andls	r3, r3, lr, lsl r4
	cmp	r3, #0
	beq	.L3
.L5:
	lsr	r2, r3, #16
	sub	ip, r1, ip
	lsl	r2, r2, #16
	cmp	r2, #0
	moveq	r1, #24
	moveq	r2, #16
	beq	.L7
	lsr	r3, r3, #16
	mov	r1, #8
	mov	r2, #0
.L7:
	tst	r3, #65280
	lsrne	r3, r3, #8
	movne	r1, r2
	tst	r3, #240
	lsrne	r3, r3, #4
	addeq	r1, r1, #4
	tst	r3, #12
	lsrne	r3, r3, #2
	addeq	r1, r1, #2
	tst	r3, #2
	addeq	r1, r1, #1
	add	r1, r1, ip
.L2:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, r1
	ldr	pc, [sp], #4
.L23:
	mov	r0, r1
	bx	lr
	.fnend
	.size	__find_rev_next_bit, .-__find_rev_next_bit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__find_rev_next_zero_bit, %function
__find_rev_next_zero_bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, r1
	bcs	.L53
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
.L33:
	ldr	r3, [r0, #4]!
	cmn	r3, #1
	rev	r3, r3
	beq	.L29
	cmp	r2, #0
	rsb	lr, r2, #32
	orrne	r3, r3, r4, lsl lr
	cmp	ip, #31
	orrls	r3, r3, r4, lsr ip
	cmn	r3, #1
	bne	.L32
.L29:
	cmp	ip, #32
	mov	r2, #0
	sub	ip, ip, #32
	bhi	.L33
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, r1
	ldr	pc, [sp], #4
.L53:
	mov	r0, r1
	bx	lr
.L32:
	mvn	r3, r3
	sub	ip, r1, ip
	lsr	r2, r3, #16
	lsl	r2, r2, #16
	cmp	r2, #0
	moveq	r1, #24
	moveq	r2, #16
	beq	.L34
	lsr	r3, r3, #16
	mov	r1, #8
	mov	r2, #0
.L34:
	tst	r3, #65280
	ldr	r4, [sp]
	add	sp, sp, #4
	lsrne	r3, r3, #8
	movne	r1, r2
	tst	r3, #240
	lsrne	r3, r3, #4
	addeq	r1, r1, #4
	tst	r3, #12
	lsrne	r3, r3, #2
	addeq	r1, r1, #2
	tst	r3, #2
	addeq	r1, r1, #1
	add	r1, r1, ip
	mov	r0, r1
	ldr	pc, [sp], #4
	.fnend
	.size	__find_rev_next_zero_bit, .-__find_rev_next_zero_bit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	add_discard_addrs, %function
add_discard_addrs:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	lr, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r1, #8]
	ldr	r7, [r0, #696]
	ldr	r5, [lr]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #3
	ldr	ip, [r5, #60]
	ldrh	r4, [ip, r3]
	add	r3, ip, r3
	cmp	r7, r4, lsr #6
	beq	.L60
	ldr	ip, [r0]
	ldr	r6, [ip, #208]
	ldr	r6, [r6, #88]
	ldr	r6, [r6, #492]
	ldr	r6, [r6, #556]
	tst	r6, #16384
	beq	.L89
.L59:
	ldr	ip, [r1]
	ldr	lr, [lr, #80]
	ldr	r6, [r5, #24]
	ands	ip, ip, #16
	str	ip, [sp, #4]
	ldr	ip, [r3, #8]
	str	lr, [sp, #12]
	ldr	lr, [r3, #4]
	ldr	r3, [r3, #12]
	beq	.L71
	ldr	r4, [r3]
	ldr	lr, [ip]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6]
	ldr	r4, [r3, #4]
	ldr	lr, [ip, #4]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #4]
	ldr	r4, [r3, #8]
	ldr	lr, [ip, #8]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #8]
	ldr	r4, [r3, #12]
	ldr	lr, [ip, #12]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #12]
	ldr	r4, [r3, #16]
	ldr	lr, [ip, #16]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #16]
	ldr	r4, [r3, #20]
	ldr	lr, [ip, #20]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #20]
	ldr	r4, [r3, #24]
	ldr	lr, [ip, #24]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #24]
	ldr	r4, [r3, #28]
	ldr	lr, [ip, #28]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #28]
	ldr	r4, [r3, #32]
	ldr	lr, [ip, #32]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #32]
	ldr	r4, [r3, #36]
	ldr	lr, [ip, #36]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #36]
	ldr	r4, [r3, #40]
	ldr	lr, [ip, #40]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #40]
	ldr	r4, [r3, #44]
	ldr	lr, [ip, #44]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #44]
	ldr	r4, [r3, #48]
	ldr	lr, [ip, #48]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #48]
	ldr	r4, [r3, #52]
	ldr	lr, [ip, #52]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #52]
	ldr	r4, [r3, #56]
	ldr	lr, [ip, #56]
	orr	lr, lr, r4
	mvn	lr, lr
	str	lr, [r6, #56]
	ldr	r3, [r3, #60]
	ldr	ip, [ip, #60]
	orr	r3, r3, ip
	mvn	r3, r3
	str	r3, [r6, #60]
.L61:
	movw	r3, #:lower16:.LANCHOR0
	mov	r10, r1
	str	r0, [sp]
	movt	r3, #:upper16:.LANCHOR0
	mov	fp, #0
	str	r2, [sp, #8]
	mvn	r5, #0
	str	r3, [sp, #16]
.L62:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L69
.L91:
	ldr	r3, [sp]
	ldr	r3, [r3, #28]
	ldr	r3, [r3, #80]
	add	r3, r3, #4096
	ldrd	r2, [r3, #52]
	cmp	r2, r3
	bhi	.L60
	add	r2, r5, #1
	mov	r1, r7
	mov	r0, r6
	bl	__find_rev_next_bit
	cmp	r7, r0
	mov	r4, r0
	bls	.L60
	add	r2, r4, #1
	mov	r1, r7
	mov	r0, r6
	bl	__find_rev_next_zero_bit
	mov	r5, r0
.L63:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L74
	cmp	fp, #0
	beq	.L90
.L65:
	cmp	r4, r5
	mov	r3, r4
	bcs	.L67
	ldr	r8, [sp]
	add	ip, fp, #12
.L68:
	cmp	r3, #0
	add	r2, r3, #31
	movge	r2, r3
	rsbs	r1, r3, #0
	asr	r2, r2, #5
	and	r1, r1, #31
	and	r0, r3, #31
	rsbpl	r0, r1, #0
	ldr	r1, [ip, r2, lsl #2]
	mov	lr, #1
	add	r3, r3, #1
	cmp	r3, r5
	orr	r1, r1, lr, lsl r0
	str	r1, [ip, r2, lsl #2]
	bne	.L68
	str	r8, [sp]
.L67:
	ldr	r3, [sp]
	ldr	r3, [r3, #28]
	ldr	r2, [r3, #80]
	add	r2, r2, #4096
	ldr	r3, [r2, #52]
	add	r3, r5, r3
	sub	r4, r3, r4
	ldr	r3, [sp, #4]
	str	r4, [r2, #52]
	cmp	r3, #0
	beq	.L91
.L69:
	add	r2, r5, #1
	mov	r1, r7
	mov	r0, r6
	bl	__find_rev_next_bit
	cmp	r7, r0
	mov	r4, r0
	bls	.L60
	add	r2, r0, #1
	mov	r1, r7
	mov	r0, r6
	bl	__find_rev_next_zero_bit
	cmp	r4, #0
	cmpne	r7, r0
	mov	r5, r0
	beq	.L63
	sub	r2, r0, r4
	ldrd	r0, [r10, #24]
	mov	r3, #0
	cmp	r3, r1
	cmpeq	r2, r0
	bcs	.L63
	b	.L62
.L89:
	ldr	ip, [ip, #616]
	ldr	ip, [ip, #8]
	ldr	ip, [ip, #2180]	@ unaligned
	tst	ip, #2
	bne	.L59
.L60:
	mov	r0, #0
.L85:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L71:
	ldr	r3, [r0, #864]
	tst	r3, #4
	beq	.L60
	bic	r4, r4, #63
	cmp	r4, #0
	beq	.L60
	ldr	r3, [sp, #12]
	add	r3, r3, #4096
	ldr	r4, [r3, #52]
	ldr	r3, [r3, #56]
	cmp	r4, r3
	bcs	.L60
	ldr	r4, [lr]
	ldr	r3, [ip]
	bic	r3, r3, r4
	str	r3, [r6]
	ldr	r4, [lr, #4]
	ldr	r3, [ip, #4]
	bic	r3, r3, r4
	str	r3, [r6, #4]
	ldr	r4, [lr, #8]
	ldr	r3, [ip, #8]
	bic	r3, r3, r4
	str	r3, [r6, #8]
	ldr	r4, [lr, #12]
	ldr	r3, [ip, #12]
	bic	r3, r3, r4
	str	r3, [r6, #12]
	ldr	r4, [lr, #16]
	ldr	r3, [ip, #16]
	bic	r3, r3, r4
	str	r3, [r6, #16]
	ldr	r4, [lr, #20]
	ldr	r3, [ip, #20]
	bic	r3, r3, r4
	str	r3, [r6, #20]
	ldr	r4, [lr, #24]
	ldr	r3, [ip, #24]
	bic	r3, r3, r4
	str	r3, [r6, #24]
	ldr	r4, [lr, #28]
	ldr	r3, [ip, #28]
	bic	r3, r3, r4
	str	r3, [r6, #28]
	ldr	r4, [lr, #32]
	ldr	r3, [ip, #32]
	bic	r3, r3, r4
	str	r3, [r6, #32]
	ldr	r4, [lr, #36]
	ldr	r3, [ip, #36]
	bic	r3, r3, r4
	str	r3, [r6, #36]
	ldr	r4, [lr, #40]
	ldr	r3, [ip, #40]
	bic	r3, r3, r4
	str	r3, [r6, #40]
	ldr	r4, [lr, #44]
	ldr	r3, [ip, #44]
	bic	r3, r3, r4
	str	r3, [r6, #44]
	ldr	r4, [lr, #48]
	ldr	r3, [ip, #48]
	bic	r3, r3, r4
	str	r3, [r6, #48]
	ldr	r4, [lr, #52]
	ldr	r3, [ip, #52]
	bic	r3, r3, r4
	str	r3, [r6, #52]
	ldr	r4, [lr, #56]
	ldr	r3, [ip, #56]
	bic	r3, r3, r4
	str	r3, [r6, #56]
	ldr	r3, [ip, #60]
	ldr	lr, [lr, #60]
	bic	r3, r3, lr
	str	r3, [r6, #60]
	b	.L61
.L90:
	ldr	r3, [sp, #16]
	movw	r1, #32848
	ldr	r3, [r3]
	mov	r0, r3
	str	r3, [sp, #20]
	bl	kmem_cache_alloc
	subs	fp, r0, #0
	ldr	r3, [sp, #20]
	beq	.L92
.L66:
	ldr	ip, [sp]
	mov	r0, fp
	ldrd	r8, [r10, #8]
	ldr	lr, [sp, #12]
	ldr	r3, [ip, #28]
	ldr	ip, [ip, #692]
	add	r2, lr, #4
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	adds	r8, r8, r1
	add	r3, r3, r8, lsl ip
	str	r3, [fp, #8]
	ldr	r1, [lr, #8]
	bl	__list_add
	b	.L65
.L74:
	mov	r0, r3
	b	.L85
.L92:
	mov	r0, r3
	movw	r1, #34896
	bl	kmem_cache_alloc
	mov	fp, r0
	b	.L66
	.fnend
	.size	add_discard_addrs, .-add_discard_addrs
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
	beq	.L93
	ldr	lr, [r3, #112]
	cmp	lr, r1
	beq	.L93
	ldr	lr, [r3, #176]
	cmp	lr, r1
	beq	.L93
	ldr	lr, [r3, #240]
	cmp	lr, r1
	beq	.L93
	ldr	lr, [r3, #304]
	cmp	lr, r1
	beq	.L93
	ldr	r3, [r3, #368]
	cmp	r3, r1
	beq	.L93
	ldr	r6, [ip, #8]
	mov	r4, r1
	mov	r8, r0
	mov	r0, r1
	mov	r5, r2
	add	r7, r6, r2, lsl #2
	ldr	r1, [r7, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L97
	ldr	r3, [r7, #56]
	add	r3, r3, #1
	str	r3, [r7, #56]
.L97:
	cmp	r5, #6
	beq	.L100
.L93:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L100:
	ldr	r2, [r8, #28]
	add	r3, r4, r4, lsl #1
	ldr	r2, [r2]
	ldr	r2, [r2, #60]
	ldrb	r3, [r2, r3, lsl #3]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r3, #5
	bhi	.L101
	add	r6, r6, r3, lsl #2
	mov	r0, r4
	ldr	r1, [r6, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L93
	ldr	r3, [r6, #56]
	add	r3, r3, #1
	str	r3, [r6, #56]
	b	.L93
.L101:
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
	beq	.L103
	ldr	r3, [r4, #8]
	cmp	r6, r3
	bne	.L105
	b	.L104
.L110:
	ldr	r3, [r4, #8]
	cmp	r3, r6
	beq	.L104
.L105:
	ldr	r4, [r4]
	cmp	r4, r5
	bne	.L110
.L103:
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #80
	movt	r3, #:upper16:.LANCHOR0
	ldr	r4, [r3, #4]
	mov	r0, r4
	bl	kmem_cache_alloc
	subs	r3, r0, #0
	beq	.L118
.L111:
	mov	r2, #1
	str	r3, [r3]
	mov	r0, r3
	stmib	r3, {r3, r6}
	mov	r1, r5
	str	r2, [r3, #12]
	ldr	r2, [r5]
.L116:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	__list_add
.L104:
	ldr	r6, [r4]
	ldr	r3, [r4, #12]
	cmp	r5, r6
	add	r3, r3, #1
	str	r3, [r4, #12]
	beq	.L102
	cmp	r6, r5
	bne	.L109
	b	.L107
.L119:
	ldr	r6, [r6]
	cmp	r5, r6
	beq	.L107
.L109:
	ldr	r2, [r6, #12]
	cmp	r3, r2
	bhi	.L119
	mov	r5, r6
.L107:
	mov	r0, r4
	bl	__list_del_entry
	mov	r2, r5
	mov	r0, r4
	ldr	r1, [r6, #4]
	b	.L116
.L118:
	mov	r0, r4
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r3, r0
	b	.L111
.L102:
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
	beq	.L135
.L121:
	mov	r3, #1
	mov	r1, r4
	str	r6, [r4, #12]
	movw	r0, #2577
	str	r3, [r4, #20]
	bl	submit_bio_wait
	mov	r5, r0
	mov	r0, r4
	bl	bio_put
	movw	r3, #:lower16:__tracepoint_f2fs_issue_flush
	movt	r3, #:upper16:__tracepoint_f2fs_issue_flush
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L136
.L120:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L135:
	mov	r1, r4
	mov	r0, #2064
	bl	bio_alloc
	mov	r4, r0
	b	.L121
.L136:
	mov	r2, sp
	ldr	r8, [r7, #864]
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r4, [r3, #16]
	cmp	r4, #0
	beq	.L124
	and	r9, r8, #1024
	and	r8, r8, #2048
.L125:
	ldr	r0, [r4, #4]
	mov	r3, r9
	str	r5, [sp]
	mov	r2, r8
	ldr	r7, [r4]
	mov	r1, r6
	blx	r7
	ldr	r3, [r4, #8]!
	cmp	r3, #0
	bne	.L125
.L124:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L120
	bl	preempt_schedule
	b	.L120
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
	bhi	.L157
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
.L140:
	ldr	r0, [r0]
	ldr	r2, [r5, #696]
	ldr	r4, [r0, #60]
	sub	r6, r2, #1
	and	r6, r6, r1
	ldrh	r7, [r4, r3]
	add	r4, r4, r3
	add	r7, fp, r7, lsr #6
	lsrs	r3, r7, #16
	bne	.L141
	cmp	r2, r7
	bcc	.L141
.L142:
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
	bne	.L143
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r7
	orr	r2, ip, r2
	strb	r2, [r1, r6, lsr #3]
	bne	.L163
.L144:
	ldr	r2, [r5]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L164
.L145:
	ldr	r1, [r4, #12]
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r7
	orr	r2, ip, r2
	strb	r2, [r1, r6, lsr #3]
	bne	.L146
	ldr	r2, [r5, #744]
	sub	r2, r2, #1
	str	r2, [r5, #744]
.L146:
	ldr	r0, [r4, #8]
	ldrb	r2, [r4]	@ zero_extendqisi2
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, #63
	cmp	r2, #4
	and	r2, r1, r7
	beq	.L165
.L147:
	cmp	r2, #0
	bne	.L151
	ldrh	r3, [r4, #2]
	ubfx	r2, r3, #0, #10
	add	r2, fp, r2
	bfi	r3, r2, #0, #10
	strh	r3, [r4, #2]	@ movhi
.L151:
	ldr	r3, [r5, #28]
	ldr	r2, [r3]
	ldr	r1, [r2, #28]
	ldr	r3, [r1, r9]
	tst	r3, r10
	orr	r10, r3, r10
	str	r10, [r1, r9]
	bne	.L152
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	str	r3, [r2, #32]
.L152:
	ldr	r3, [r5, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, fp
	str	r3, [r2, #12]
	ldr	r3, [r5, #700]
	cmp	r3, #1
	bls	.L139
	ldr	r2, [r5, #28]
	udiv	r8, r8, r3
	ldr	r3, [r2]
	ldr	r3, [r3, #64]
	ldr	r2, [r3, r8, lsl #2]
	add	fp, r2, fp
	str	fp, [r3, r8, lsl #2]
.L139:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L157:
	mov	r9, #0
	mvn	r3, #23
	mov	r10, r9
	mvn	r8, #0
	b	.L140
.L164:
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L145
	b	.L146
.L163:
	movw	r0, #:lower16:.LC0
	movw	r1, #1603
	str	ip, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	ldr	ip, [sp]
	b	.L144
.L143:
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	mvn	r3, ip
	tst	r2, r7
	and	r2, r2, r3
	strb	r2, [r1, r6, lsr #3]
	beq	.L166
.L149:
	ldr	r2, [r5]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L167
.L150:
	ldr	r2, [r4, #12]
	ldrb	r1, [r2, r6, lsr #3]	@ zero_extendqisi2
	and	r3, r3, r1
	tst	r1, r7
	strb	r3, [r2, r6, lsr #3]
	beq	.L162
	ldr	r3, [r5, #744]
	add	r3, r3, #1
	str	r3, [r5, #744]
.L162:
	ldr	r3, [r4, #8]
	ldrb	r2, [r3, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r7
	b	.L147
.L165:
	orr	r3, ip, r1
	cmp	r2, #0
	strb	r3, [r0, r6, lsr #3]
	bne	.L162
	ldrh	r3, [r4, #2]
	ldr	r2, [r4, #8]
	add	r1, r3, #1
	bfi	r3, r1, #0, #10
	strh	r3, [r4, #2]	@ movhi
	ldrb	r2, [r2, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r7
	b	.L147
.L167:
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L150
	b	.L162
.L141:
	movw	r0, #:lower16:.LC0
	movw	r1, #1587
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	b	.L142
.L166:
	movw	r0, #:lower16:.LC0
	movw	r1, #1624
	str	r3, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r5, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp]
	b	.L149
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
	beq	.L169
	ldr	r3, [r5, #56]
	sub	r3, r3, #1
	str	r3, [r5, #56]
.L169:
	cmp	r4, #6
	beq	.L183
.L168:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L183:
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
	beq	.L172
	ldr	r3, [r4, #56]
	sub	r3, r3, #1
	str	r3, [r4, #56]
.L172:
	ldr	r3, [r7, #28]
	ldr	r0, [r7, #700]
	ldr	r2, [r3]
	cmp	r0, #1
	bls	.L173
	udiv	r3, r6, r0
	ldr	r2, [r2, #64]
	ldr	r3, [r2, r3, lsl #2]
.L174:
	cmp	r3, #0
	bne	.L168
	udiv	r0, r6, r0
	ldr	r1, [r8, #88]
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	_clear_bit
.L173:
	ldr	r3, [r2, #60]
	ldrh	r3, [r3, r5]
	lsr	r3, r3, #6
	b	.L174
	.fnend
	.size	__remove_dirty_segment, .-__remove_dirty_segment
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__insert_discard_tree.constprop.8, %function
__insert_discard_tree.constprop.8:
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
	beq	.L188
.L185:
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
	beq	.L189
.L186:
	add	r3, r4, #24
	mov	r5, #0
	ldr	r2, .L190
	movw	r1, #:lower16:.LC1
	add	r0, r4, #36
	str	r9, [r4, #12]
	movt	r1, #:upper16:.LC1
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
.L189:
	mov	r0, r5
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r4, r0
	b	.L186
.L188:
	movw	r0, #:lower16:.LC0
	mov	r1, #744
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L185
.L191:
	.align	2
.L190:
	.word	.LANCHOR0+12
	.fnend
	.size	__insert_discard_tree.constprop.8, .-__insert_discard_tree.constprop.8
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__revoke_inmem_pages.constprop.10, %function
__revoke_inmem_pages.constprop.10:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r6, [r1]
	.pad #20
	sub	sp, sp, #20
	cmp	r6, r1
	ldr	r5, [r6]
	beq	.L215
	mov	r8, r2
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	mov	r2, #57344
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	movt	r2, 65535
	movw	r10, #:lower16:.LANCHOR0
	mov	r7, r6
	mov	r9, r0
	stm	sp, {r1, r3}
	movt	r10, #:upper16:.LANCHOR0
	mov	fp, #0
	str	r2, [sp, #8]
	b	.L204
.L225:
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L223
.L196:
	mov	r1, r4
	mov	r0, #0
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L200
.L206:
	mov	r1, r4
	mov	r0, #3
	bl	_clear_bit
.L201:
	mov	r1, r4
	mov	r0, #11
	str	fp, [r4, #28]
	bl	_clear_bit
	cmp	r4, #0
	beq	.L202
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L224
.L203:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L202:
	mov	r0, r7
	bl	list_del
	mov	r1, r6
	ldr	r0, [r10, #12]
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
	ldr	r3, [sp]
	mov	r7, r5
	mov	r6, r5
	ldr	r5, [r5]
	cmp	r3, r7
	beq	.L215
.L204:
	cmp	r8, #0
	ldr	r4, [r6, #8]
	bne	.L225
	mov	r1, r4
	mov	r0, r8
	bl	_test_and_set_bit
	cmp	r0, #0
	beq	.L201
	mov	r0, r4
	bl	__lock_page
	b	.L201
.L215:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L224:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L203
.L200:
	mov	r0, r4
	bl	__lock_page
	b	.L206
.L223:
	ldr	r2, [sp, #8]
	mov	r3, sp
	and	r2, r3, r2
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L197
	str	r5, [sp, #12]
	mov	r5, r3
.L198:
	ldr	r3, [r5]
	mov	r2, #6
	mov	r1, r4
	ldr	r0, [r5, #4]
	blx	r3
	ldr	r3, [r5, #8]!
	cmp	r3, #0
	bne	.L198
	ldr	r5, [sp, #12]
.L197:
	ldr	r2, [sp, #8]
	mov	r3, sp
	and	r3, r3, r2
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L196
	bl	preempt_schedule
	b	.L196
	.fnend
	.size	__revoke_inmem_pages.constprop.10, .-__revoke_inmem_pages.constprop.10
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
	mov	r1, #5
	str	r8, [sp, #16]
	mov	r8, r2
	str	lr, [sp, #20]
	ldr	r3, [r0, #28]
	mvn	r0, #0
	ldr	r4, [r3, #12]
	add	r4, r4, r6, lsl #6
	ldr	r7, [r4, #20]
	ldr	r3, [r4, #60]
	str	r3, [r4, #48]
	ldr	r2, [r5, #700]
	udiv	r3, r3, r2
	ldr	r2, [r5, #704]
	strh	ip, [r4, #52]	@ movhi
	str	r0, [r4, #60]
	add	r0, r7, #4080
	add	r0, r0, #11
	udiv	r3, r3, r2
	str	r3, [r4, #56]
	bl	__memzero
	cmp	r6, #2
	movle	r3, #0
	movgt	r3, #1
	cmp	r8, #0
	strb	r3, [r7, #4091]
	ldr	r2, [r5, #28]
	ldr	r3, [r4, #48]
	ldr	r1, [r2]
	add	r2, r3, r3, lsl #1
	lsl	r2, r2, #3
	ldr	r1, [r1, #60]
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	bfi	r0, r6, #0, #6
	strb	r0, [r1, r2]
	beq	.L226
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
	bne	.L226
	ldr	r3, [r0, #32]
	add	r3, r3, #1
	str	r3, [r0, #32]
.L226:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	reset_curseg, .-reset_curseg
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	issue_flush_thread, %function
issue_flush_thread:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	movw	r7, #:lower16:autoremove_wake_function
	strd	r8, [sp, #16]
	mov	r8, #57344
	movt	r7, #:upper16:autoremove_wake_function
	strd	r10, [sp, #24]
	movt	r8, 65535
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r4, [r3, #76]
	add	r6, r4, #4
.L232:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L256
.L260:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L234
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
	bne	.L236
	b	.L235
.L246:
	mov	r3, r2
.L236:
	ldr	r2, [r3]
	str	r0, [r3]
	mov	r0, r3
	cmp	r2, #0
	bne	.L246
.L235:
	str	r3, [r4, #28]
	ldr	r3, [r5]
	mov	r0, r5
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r5, #1076]
	adds	r3, r0, #0
	mov	r9, r0
	movne	r3, #1
	cmp	r2, #0
	moveq	r3, #1
	cmp	r3, #0
	beq	.L258
.L237:
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
.L234:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L232
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L232
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
.L259:
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
	beq	.L259
.L243:
	add	r1, sp, #4
	mov	r0, r6
	bl	finish_wait
	bl	kthread_should_stop
	cmp	r0, #0
	beq	.L260
.L256:
	mov	r0, #0
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L258:
	cmp	r2, #1
	movgt	r10, #80
	movgt	fp, #1
	ble	.L239
.L238:
	ldr	r3, [r5, #1080]
	mov	r0, r5
	add	fp, fp, #1
	ldr	r1, [r3, r10]
	add	r10, r10, #80
	bl	__submit_flush_wait
	subs	r9, r0, #0
	bne	.L237
	ldr	r3, [r5, #1076]
	cmp	fp, r3
	blt	.L238
.L239:
	mov	r9, #0
	b	.L237
	.fnend
	.size	issue_flush_thread, .-issue_flush_thread
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__queue_discard_cmd, %function
__queue_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
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
	mov	fp, r1
	mov	r10, r0
	str	lr, [sp, #32]
	ldr	r1, [ip, #4]
	.pad #76
	sub	sp, sp, #76
	cmp	r1, #0
	bne	.L345
.L263:
	ldr	r3, [r10, #1076]
	cmp	r3, #0
	moveq	r9, r6
	beq	.L267
	mov	r1, r6
	mov	r0, r10
	bl	f2fs_target_device_index
	ldr	r3, [r10, #1080]
	add	r0, r0, r0, lsl #2
	add	r3, r3, r0, lsl #4
	ldr	r3, [r3, #72]
	sub	r3, r6, r3
	mov	r9, r3
.L267:
	ldr	r3, [r10, #28]
	mov	r4, #0
	add	r8, r6, r5
	str	r4, [sp, #56]
	str	r4, [sp, #60]
	ldr	r3, [r3, #80]
	add	r1, r3, #4160
	add	r2, r3, #4096
	str	r3, [sp, #16]
	add	r7, r1, #12
	add	r3, r2, #32
	mov	r0, r3
	str	r7, [sp, #24]
	str	r3, [sp, #28]
	str	r4, [sp, #64]
	str	r4, [sp, #68]
	bl	mutex_lock
	add	r0, sp, #68
	add	r3, sp, #64
	add	r1, sp, #60
	mov	r2, #1
	stm	sp, {r1, r3}
	add	r3, sp, #56
	mov	r1, r4
	str	r0, [sp, #8]
	mov	r0, r7
	str	r2, [sp, #12]
	mov	r2, r6
	bl	__lookup_rb_tree_ret
	subs	r3, r0, #0
	beq	.L268
	mov	r5, r4
	mov	r7, r4
	str	r3, [sp, #56]
.L269:
	movw	r1, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC0
	str	r10, [sp, #20]
	movt	r1, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC3
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC3
	mov	r10, r9
	str	r1, [sp, #36]
	mov	r1, r3
	cmp	r1, #0
	str	r2, [sp, #32]
	str	r0, [sp, #40]
	beq	.L271
.L347:
	ldr	r3, [r1, #12]
	ldr	r0, [r1, #16]
	add	r3, r0, r3
	cmp	r6, r3
	movcs	r4, r6
	movcc	r4, r3
	cmp	r8, r4
	bls	.L296
	ldr	r2, [sp, #60]
	cmp	r2, #0
	beq	.L273
	ldr	r5, [r2, #12]
	cmp	r8, r5
	bcc	.L273
	subs	r5, r5, r4
	sub	r7, r10, r6
	add	r7, r7, r4
	beq	.L283
	ldrb	ip, [r1, #54]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L300
.L291:
	ldrb	r9, [r2, #54]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L292
	ldr	r3, [r2, #48]
	cmp	fp, r3
	bne	.L292
	ldr	r3, [r2, #12]
	add	r1, r4, r5
	cmp	r1, r3
	bne	.L292
	ldr	r3, [sp, #16]
	add	r3, r3, #4096
.L301:
	ldr	r1, [r2, #16]
	str	r4, [r2, #12]
	add	r0, r2, #24
	str	r7, [r2, #20]
	str	r0, [sp, #44]
	add	r1, r1, r5
	str	r1, [r2, #16]
	ldr	r1, [r3, #60]
	add	r1, r1, r5
	str	r1, [r3, #60]
	ldr	r3, [r2, #16]
	cmp	r3, #512
	movcs	r3, #512
	lsl	r3, r3, #3
	add	r2, r3, #4
	str	r3, [sp, #52]
	ldr	r3, [sp, #16]
	add	r2, r3, r2
	str	r2, [sp, #48]
	bl	__list_del_entry
	ldr	r2, [sp, #16]
	ldr	r0, [sp, #44]
	ldr	r3, [sp, #52]
	add	r3, r2, r3
	ldr	r2, [sp, #48]
	ldr	r1, [r3, #8]
	bl	__list_add
	cmp	r9, #0
	beq	.L284
	ldr	r2, [sp, #20]
	ldr	r3, [r9, #56]
	ldr	r2, [r2, #28]
	cmn	r3, #95
	moveq	r3, #0
	ldr	r2, [r2, #80]
	streq	r3, [r9, #56]
	str	r2, [sp, #44]
	beq	.L286
	cmp	r3, #0
	beq	.L286
	ldr	r2, [sp, #20]
	movw	r1, #:lower16:.LC4
	movt	r1, #:upper16:.LC4
	ldr	r0, [r2]
	ldr	r2, [sp, #40]
	bl	f2fs_msg
.L286:
	ldrb	r3, [r9, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L287
	ldr	r3, [sp, #44]
	add	r3, r3, #4160
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
.L287:
	add	r0, r9, #24
	bl	list_del
	ldr	r3, [sp, #44]
	mov	r0, r9
	add	r1, r3, #4160
	add	r1, r1, #12
	bl	rb_erase
	ldr	ip, [r9, #16]
	mov	r1, r9
	ldr	r3, [sp, #44]
	ldr	r0, [sp, #36]
	add	r2, r3, #4096
	ldr	r3, [r2, #60]
	ldr	r0, [r0, #8]
	sub	r3, r3, ip
	str	r3, [r2, #60]
	bl	kmem_cache_free
	ldr	r3, [sp, #44]
	add	r3, r3, #4160
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
.L284:
	ldrd	r0, [sp, #20]
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	bne	.L342
	movw	r1, #1080
	b	.L343
.L273:
	subs	r5, r8, r4
	sub	r7, r10, r6
	add	r7, r7, r4
	beq	.L275
	ldrb	ip, [r1, #54]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L279
.L300:
	ldr	ip, [r1, #48]
	cmp	fp, ip
	beq	.L346
.L279:
	cmp	r2, #0
	bne	.L291
.L292:
	ldr	r9, [sp, #20]
	mov	r3, r7
	mov	r2, r4
	mov	r1, fp
	str	r5, [sp]
	mov	r0, r9
	bl	__insert_discard_tree.constprop.8
	ldr	r1, [sp, #24]
	mov	r0, r9
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	beq	.L289
.L342:
	ldr	r2, [sp, #60]
.L275:
	cmp	r2, #0
	str	r2, [sp, #56]
	beq	.L296
.L297:
	mov	r0, r2
	bl	rb_next
	ldr	r1, [sp, #56]
	str	r0, [sp, #60]
	cmp	r1, #0
	bne	.L347
.L271:
	cmp	r5, #0
	ldr	r2, [sp, #60]
	bne	.L279
	cmp	r2, #0
	str	r2, [sp, #56]
	bne	.L297
.L296:
	ldr	r0, [sp, #28]
	bl	mutex_unlock
	mov	r0, #0
	add	sp, sp, #76
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L346:
	cmp	r6, r3
	bhi	.L279
	ldr	r9, [sp, #16]
	add	r0, r0, r5
	add	r4, r1, #24
	str	r0, [r1, #16]
	mov	r0, r4
	add	r3, r9, #4096
	ldr	r2, [r3, #60]
	str	r3, [sp, #44]
	add	r5, r2, r5
	str	r5, [r3, #60]
	ldr	r2, [r1, #16]
	cmp	r2, #512
	movcs	r2, #512
	lsl	r5, r2, #3
	add	r7, r5, #4
	add	r5, r9, r5
	add	r7, r9, r7
	bl	__list_del_entry
	mov	r2, r7
	mov	r0, r4
	ldr	r1, [r5, #8]
	bl	__list_add
	ldrd	r0, [sp, #20]
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	ldr	r3, [sp, #44]
	beq	.L348
.L280:
	ldr	r9, [sp, #56]
	ldr	r2, [sp, #60]
	add	r4, r9, #12
	cmp	r2, #0
	ldm	r4, {r4, r5, r7}
	beq	.L349
	ldrb	r1, [r2, #54]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L350
.L283:
	str	r2, [sp, #56]
	b	.L297
.L268:
	ldr	r3, [sp, #56]
	cmp	r3, #0
	bne	.L303
	ldr	r2, [sp, #60]
	cmp	r2, #0
	beq	.L270
	ldr	r2, [r2, #12]
	sub	r2, r2, r6
	cmp	r5, r2
	movcs	r5, r2
.L270:
	mov	r7, r9
	mov	r4, r6
	b	.L269
.L289:
	mov	r1, #1088
.L343:
	ldr	r0, [sp, #32]
	bl	warn_slowpath_null
	ldr	r3, [sp, #20]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	b	.L342
.L345:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r4, [ip, #16]
	cmp	r4, #0
	beq	.L264
.L265:
	mov	r3, r5
	ldr	r7, [r4]
	mov	r2, r6
	ldr	r0, [r4, #4]
	mov	r1, fp
	blx	r7
	ldr	r3, [r4, #8]!
	cmp	r3, #0
	bne	.L265
.L264:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L263
	bl	preempt_schedule
	b	.L263
.L348:
	movw	r1, #1063
	ldr	r0, [sp, #32]
	bl	warn_slowpath_null
	ldr	r3, [sp, #20]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	ldr	r3, [sp, #44]
	b	.L280
.L303:
	mov	r5, r4
	mov	r7, r4
	b	.L269
.L350:
	ldr	r1, [r2, #48]
	cmp	fp, r1
	bne	.L283
	ldr	r1, [r2, #12]
	add	r0, r4, r5
	cmp	r0, r1
	bne	.L283
	b	.L301
.L349:
	str	r2, [sp, #56]
	b	.L296
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
	bcs	.L352
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
	b	.L353
.L358:
	cmp	fp, r5
	cmpeq	r10, r4
	beq	.L355
	mov	r2, #0
	mov	r0, r8
	bl	f2fs_target_device
	ldr	r1, [sp, #4]
	mov	r9, r0
	cmp	r1, r0
	beq	.L355
	mov	r3, r6
	mov	r2, r10
	mov	r0, r8
	bl	__queue_discard_cmd
	cmp	r0, #0
	bne	.L351
	mov	r10, r4
	mov	fp, r5
	str	r9, [sp, #4]
	mov	r6, #0
	mov	r7, #0
.L355:
	adds	r4, r4, #1
	adc	r5, r5, #0
.L353:
	ldr	ip, [r8, #28]
	cmp	r4, #1
	sub	r3, r4, #1
	mov	r1, r4
	mvnls	r0, #23
	ldr	r2, [ip, #16]
	sub	r2, r3, r2
	bls	.L356
	ldr	r0, [ip, #4]
	ldr	r3, [r8, #692]
	ldr	r0, [r0]
	rsb	r0, r0, r2, lsr r3
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #3
.L356:
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
	bne	.L357
	ldr	r3, [r8, #744]
	sub	r3, r3, #1
	str	r3, [r8, #744]
.L357:
	ldr	r3, [sp]
	adds	r6, r6, #1
	adc	r7, r7, #0
	cmp	r3, r1
	bhi	.L358
	orrs	r3, r6, r7
	ldr	fp, [sp, #4]
	bne	.L367
.L352:
	mov	r0, #0
.L351:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L367:
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
	.type	new_curseg, %function
new_curseg:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r2
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	lsl	r8, r1, #6
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #24]
	add	r2, r2, r8
	ldr	r6, [r2, #20]
	stmib	sp, {r1, r2}
	ldr	r1, [r2, #48]
	add	r1, r1, r3
	bl	grab_meta_page
	mov	r4, r0
	bl	page_address
	cmp	r6, #0
	beq	.L369
	mov	r1, r6
	mov	r2, #4096
	bl	memcpy
.L370:
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	beq	.L371
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L431
.L372:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L371:
	ldr	r3, [r7, #864]
	tst	r3, #8
	movne	r9, #0
	bne	.L373
	ldr	r3, [sp, #4]
	sub	r9, r3, #1
	cmp	r9, #1
	movls	r9, #0
	movhi	r9, #1
.L373:
	ldr	r3, [r7, #28]
	ldr	r4, [r7, #700]
	cmp	r4, #1
	beq	.L374
	ldr	r2, [r3, #12]
	add	r8, r2, r8
	ldr	r6, [r8, #48]
	udiv	r4, r6, r4
.L375:
	ldr	r8, [r3, #4]
	ldr	r3, [r7, #704]
	ldr	fp, [r7, #708]
	add	r2, r8, #12
	udiv	r10, r4, r3
	mov	r0, r2
	udiv	r3, fp, r3
	str	r3, [sp]
	str	r2, [sp, #12]
	bl	_raw_spin_lock
	cmp	r5, #0
	bne	.L378
	ldr	r1, [r7, #700]
	add	r2, r6, #1
	udiv	r3, r2, r1
	mls	r3, r1, r3, r2
	cmp	r3, #0
	bne	.L432
.L378:
	movw	r3, #:lower16:.LC0
	mov	fp, r4
	movt	r3, #:upper16:.LC0
	mov	r6, #0
	mov	r5, #1
	str	r3, [sp, #16]
.L377:
	mov	r2, r4
	ldr	r1, [r7, #708]
	ldr	r0, [r8, #20]
	bl	_find_next_zero_bit_le
	ldr	r1, [r7, #708]
	mov	r2, r0
	cmp	r0, r1
	bcc	.L380
	cmp	r9, #0
	ldr	r0, [r8, #20]
	subne	fp, r4, #1
	beq	.L433
.L382:
	cmp	fp, #0
	add	r2, fp, #31
	movge	r2, fp
	and	r6, fp, #31
	asr	r2, r2, #5
	ldr	r2, [r0, r2, lsl #2]
	lsr	r6, r2, r6
	ands	r6, r6, #1
	beq	.L404
.L386:
	cmp	fp, #0
	beq	.L385
	sub	fp, fp, #1
	cmp	fp, #0
	add	r3, fp, #31
	movge	r3, fp
	and	r2, fp, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	r3, r3, r2
	tst	r3, #1
	bne	.L386
	mov	r2, fp
	mov	lr, #1
	b	.L383
.L433:
	mov	r2, r9
	bl	_find_next_zero_bit_le
	ldr	r1, [r7, #708]
	mov	r2, r0
	cmp	r0, r1
	bcc	.L380
	movw	r1, #1833
	ldr	r0, [sp, #16]
	str	r2, [sp, #20]
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp, #20]
.L380:
	cmp	r6, #0
	moveq	lr, r6
	bne	.L434
.L383:
	eor	ip, r5, #1
	ldr	r0, [r7, #700]
	ldr	r4, [r7, #704]
	mul	r5, r2, r0
	udiv	r1, r2, r4
	cmp	r4, #1
	orreq	ip, ip, #1
	cmp	r10, r1
	orreq	ip, ip, #1
	cmp	ip, #0
	bne	.L379
	cmp	r9, #1
	beq	.L435
	ldr	r2, [r7, #28]
	ldr	r2, [r2, #12]
	ldr	ip, [r2, #56]
	cmp	r1, ip
	beq	.L392
.L398:
	ldr	ip, [r2, #120]
	cmp	ip, r1
	beq	.L392
	ldr	ip, [r2, #184]
	cmp	r1, ip
	beq	.L392
	ldr	ip, [r2, #248]
	cmp	r1, ip
	beq	.L392
	ldr	ip, [r2, #312]
	cmp	r1, ip
	beq	.L392
	ldr	r2, [r2, #376]
	cmp	r1, r2
	beq	.L392
.L379:
	cmp	r5, #0
	ldr	r2, [r8, #16]
	add	r3, r5, #31
	movge	r3, r5
	and	r1, r5, #31
	asr	r3, r3, #5
	ldr	r2, [r2, r3, lsl #2]
	lsr	r3, r2, r1
	tst	r3, #1
	bne	.L436
.L395:
	ldr	r3, [r7, #28]
	udiv	r4, r5, r0
	mov	r0, r5
	ldr	r6, [r3, #4]
	ldr	r1, [r6, #16]
	bl	_set_bit
	ldr	r3, [r6, #4]
	mov	r0, r4
	ldr	r1, [r6, #20]
	sub	r3, r3, #1
	str	r3, [r6, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L396
	ldr	r3, [r6, #8]
	sub	r3, r3, #1
	str	r3, [r6, #8]
.L396:
	ldr	r0, [sp, #12]
	bl	_raw_spin_unlock
	ldmib	sp, {r1, r4}
	mov	r0, r7
	mov	r2, #1
	str	r5, [r4, #60]
	bl	reset_curseg
	mov	r3, #0
	strb	r3, [r4, #44]
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L392:
	cmp	r6, #0
	bne	.L397
	ldr	r3, [sp]
	add	ip, r1, #1
.L393:
	cmp	r3, ip
	movls	r6, #0
	movls	r4, r6
	bls	.L394
	mul	r4, ip, r4
	mov	r6, #0
.L394:
	mov	r5, #0
	b	.L377
.L389:
	cmp	r1, #0
	movne	lr, #0
	cmp	lr, #0
	bne	.L379
	ldr	r2, [r7, #28]
	ldr	r2, [r2, #12]
	ldr	ip, [r2, #56]
	cmp	r1, ip
	bne	.L398
.L397:
	mul	r4, r1, r4
	mov	r6, #1
	sub	r4, r4, #1
	b	.L394
.L435:
	cmp	r6, #0
	bne	.L389
	ldr	r3, [sp]
	add	ip, r1, #1
	cmp	r3, ip
	bls	.L379
	ldr	r2, [r7, #28]
	ldr	r2, [r2, #12]
	ldr	lr, [r2, #56]
	cmp	r1, lr
	bne	.L398
	b	.L393
.L385:
	mov	r2, #0
	ldr	r1, [r7, #708]
	bl	_find_next_zero_bit_le
	ldr	r3, [r7, #708]
	mov	r2, r0
	cmp	r0, r3
	movcc	fp, r0
	movcc	lr, #1
	bcc	.L383
	movw	r1, #1849
	ldr	r0, [sp, #16]
	str	r2, [sp, #20]
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp, #20]
	mov	lr, #1
	mov	fp, r2
	b	.L383
.L434:
	ldr	r0, [r8, #20]
	b	.L382
.L374:
	ldr	r1, [sp, #4]
	cmp	r1, #2
	movle	r2, #0
	movgt	r2, #1
	cmp	r1, #0
	moveq	r2, #1
	cmp	r2, #0
	movne	r4, #0
	movne	r6, r4
	bne	.L375
	ldr	r2, [r3]
	ldr	r6, [r2, #112]
	cmp	r6, #0
	ldreq	r2, [r3, #12]
	addeq	r8, r2, r8
	ldreq	r6, [r8, #48]
	mov	r4, r6
	b	.L375
.L369:
	mov	r1, #4096
	bl	__memzero
	b	.L370
.L404:
	mov	lr, #1
	mov	r2, fp
	mov	r6, lr
	b	.L383
.L432:
	add	r6, r4, #1
	ldr	r0, [r8, #16]
	mul	r1, r6, r1
	bl	_find_next_zero_bit_le
	mov	r5, r0
	ldr	r0, [r7, #700]
	mul	r6, r0, r6
	cmp	r5, r6
	bcc	.L379
	b	.L378
.L436:
	movw	r0, #:lower16:.LC0
	mov	r1, #1888
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r7, #16
	bl	_set_bit
	ldr	r0, [r7, #700]
	b	.L395
.L431:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L372
	.fnend
	.size	new_curseg, .-new_curseg
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	change_curseg.constprop.11, %function
change_curseg.constprop.11:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	ldr	r9, [r3, #8]
	ldr	r5, [r3, #12]
	ldr	r1, [r3, #24]
	add	r5, r5, r8, lsl #6
	ldr	r10, [r5, #20]
	ldr	r3, [r5, #48]
	ldr	r6, [r5, #60]
	add	r1, r1, r3
	bl	grab_meta_page
	mov	r7, r0
	bl	page_address
	cmp	r10, #0
	beq	.L438
	mov	r1, r10
	mov	r2, #4096
	bl	memcpy
.L439:
	mov	r0, r7
	bl	set_page_dirty
	cmp	r7, #0
	beq	.L440
	ldr	r3, [r7]
	tst	r3, #1
	beq	.L455
.L441:
	mov	r0, r7
	bl	unlock_page
	mov	r0, r7
	bl	put_page
.L440:
	ldr	r3, [r4, #28]
	ldr	fp, [r4, #700]
	ldr	r7, [r3, #4]
	add	r10, r7, #12
	mov	r0, r10
	bl	_raw_spin_lock
	mov	r0, r6
	ldr	r1, [r7, #16]
	bl	_test_and_set_bit
	cmp	r0, #0
	beq	.L456
.L443:
	mov	r0, r10
	add	r7, r9, #36
	bl	_raw_spin_unlock
	mov	r0, r7
	bl	mutex_lock
	ldr	r3, [r4, #28]
	mov	r0, r6
	ldr	r9, [r3, #8]
	ldr	r1, [r9, #32]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L445
	ldr	r3, [r9, #84]
	sub	r3, r3, #1
	str	r3, [r9, #84]
.L445:
	mov	r2, #6
	mov	r1, r6
	mov	r0, r4
	bl	__remove_dirty_segment
	mov	r0, r7
	bl	mutex_unlock
	mov	r0, r4
	mov	r1, r8
	mov	r2, #1
	bl	reset_curseg
	mov	r3, #1
	ldr	r0, [r5, #48]
	mov	r2, #0
	strb	r3, [r5, #44]
	ldr	r3, [r4, #28]
	add	r1, r0, r0, lsl #1
	ldr	r3, [r3]
	ldr	r0, [r3, #60]
	ldr	r3, [r3, #24]
	add	r0, r0, r1, lsl #3
	ldmib	r0, {r1, ip}
	mov	r0, r3
	ldr	r7, [ip]
	ldr	lr, [r1]
	orr	lr, lr, r7
	str	lr, [r3]
	ldr	r7, [r1, #4]
	ldr	lr, [ip, #4]
	orr	lr, lr, r7
	str	lr, [r3, #4]
	ldr	r7, [ip, #8]
	ldr	lr, [r1, #8]
	orr	lr, lr, r7
	str	lr, [r3, #8]
	ldr	r7, [r1, #12]
	ldr	lr, [ip, #12]
	orr	lr, lr, r7
	str	lr, [r3, #12]
	ldr	r7, [r1, #16]
	ldr	lr, [ip, #16]
	orr	lr, lr, r7
	str	lr, [r3, #16]
	ldr	r7, [r1, #20]
	ldr	lr, [ip, #20]
	orr	lr, lr, r7
	str	lr, [r3, #20]
	ldr	r7, [r1, #24]
	ldr	lr, [ip, #24]
	orr	lr, lr, r7
	str	lr, [r3, #24]
	ldr	r7, [r1, #28]
	ldr	lr, [ip, #28]
	orr	lr, lr, r7
	str	lr, [r3, #28]
	ldr	lr, [ip, #32]
	ldr	r7, [r1, #32]
	orr	lr, lr, r7
	str	lr, [r3, #32]
	ldr	r7, [r1, #36]
	ldr	lr, [ip, #36]
	orr	lr, lr, r7
	str	lr, [r3, #36]
	ldr	r7, [r1, #40]
	ldr	lr, [ip, #40]
	orr	lr, lr, r7
	str	lr, [r3, #40]
	ldr	r7, [r1, #44]
	ldr	lr, [ip, #44]
	orr	lr, lr, r7
	str	lr, [r3, #44]
	ldr	r7, [r1, #48]
	ldr	lr, [ip, #48]
	orr	lr, lr, r7
	str	lr, [r3, #48]
	ldr	r7, [r1, #52]
	ldr	lr, [ip, #52]
	orr	lr, lr, r7
	str	lr, [r3, #52]
	ldr	r7, [r1, #56]
	ldr	lr, [ip, #56]
	orr	lr, lr, r7
	str	lr, [r3, #56]
	ldr	ip, [ip, #60]
	ldr	r1, [r1, #60]
	orr	r1, ip, r1
	str	r1, [r3, #60]
	ldr	r1, [r4, #696]
	bl	__find_rev_next_zero_bit
	strh	r0, [r5, #52]	@ movhi
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
	beq	.L437
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L457
.L447:
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
.L456:
	ldr	r3, [r7, #4]
	udiv	r0, r6, fp
	ldr	r1, [r7, #20]
	sub	r3, r3, #1
	str	r3, [r7, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L443
	ldr	r3, [r7, #8]
	sub	r3, r3, #1
	str	r3, [r7, #8]
	b	.L443
.L438:
	mov	r1, #4096
	bl	__memzero
	b	.L439
.L437:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L457:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L447
.L455:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r7, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L441
	.fnend
	.size	change_curseg.constprop.11, .-change_curseg.constprop.11
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
	ldr	r5, [ip, #12]
	add	r5, r5, r1, lsl #6
	bne	.L493
	ldr	r3, [r0, #368]
	mov	r6, r1
	sub	r1, r1, #4
	clz	r1, r1
	lsr	r1, r1, #5
	ldr	r3, [r3, #132]	@ unaligned
	eor	r3, r3, #64
	ands	r3, r1, r3, lsr #6
	bne	.L494
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	ldr	r2, [r0, #700]
	cmp	r3, #0
	beq	.L495
.L462:
	ldr	r9, [r4, #764]
	ldr	r3, [r4, #864]
	ldr	r10, [r4, #756]
	ldr	r7, [r4, #776]
	tst	r3, #262144
	str	r10, [sp, #16]
	bne	.L463
	ldr	r10, [sp, #16]
	mov	fp, #0
	ldr	r0, [r4, #696]
	mov	r1, fp
	ldr	r3, [r4, #692]
	ldr	r8, [ip, #4]
	mul	r0, r0, r2
	rsb	lr, r3, #32
	strd	r0, [sp, #8]
	adds	r0, r0, r10
	adc	r1, fp, r10, asr #31
	subs	r10, r0, #1
	lsr	r10, r10, r3
	sbc	r1, r1, #0
	subs	r0, r3, #32
	orr	r10, r10, r1, lsl lr
	orrpl	r10, r10, r1, asr r0
	ldrd	r0, [sp, #8]
	udiv	r10, r10, r2
	adds	r0, r0, r9
	adc	r1, r1, r9, asr #31
	strd	r0, [sp, #16]
	subs	r0, r0, #1
	ldr	r1, [sp, #20]
	lsl	r10, r10, #1
	sbc	r9, r1, #0
	lsr	r1, r0, r3
	subs	r0, r3, #32
	orr	r1, r1, r9, lsl lr
	orrpl	r1, r1, r9, asr r0
	udiv	r9, r1, r2
	ldrd	r0, [sp, #8]
	adds	r0, r0, r7
	adc	r1, r1, r7, asr #31
	strd	r0, [sp, #8]
	subs	r0, r0, #1
	ldr	r1, [sp, #12]
	add	r10, r10, r9
	lsr	r0, r0, r3
	ldr	r9, [ip, #36]
	sbc	r1, r1, #0
	subs	r3, r3, #32
	orr	r0, r0, r1, lsl lr
	udiv	r9, r9, r2
	orrpl	r0, r0, r1, asr r3
	ldr	r3, [r8, #8]
	udiv	r0, r0, r2
	add	r2, r10, r0
	add	r2, r2, r9, lsl #1
	cmp	r3, r2
	bls	.L496
.L463:
	mov	r1, r6
	mov	r2, #0
	mov	r0, r4
	bl	new_curseg
.L460:
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	add	r4, r4, r3, lsl #2
	ldr	r3, [r4, #912]
	add	r3, r3, #1
	str	r3, [r4, #912]
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L495:
	ldr	r1, [r5, #48]
	ldr	r0, [ip, #32]
	add	r3, r1, #1
	cmp	r3, r0
	bcs	.L462
	udiv	r0, r3, r2
	mls	r0, r2, r0, r3
	cmp	r0, #0
	beq	.L462
	ldr	lr, [ip, #4]
	cmp	r3, #0
	and	r0, r3, #31
	addlt	r3, r1, #32
	asr	r3, r3, #5
	ldr	r1, [lr, #16]
	ldr	r3, [r1, r3, lsl #2]
	mvn	r3, r3, lsr r0
	tst	r3, #1
	bne	.L463
	b	.L462
.L493:
	mov	r2, #1
	bl	new_curseg
	b	.L460
.L496:
	ldr	lr, [ip, #8]
	add	r7, sp, #32
	mvn	r1, #0
	mov	ip, #1
	mov	r3, r6
	mov	r2, #0
	mov	r0, r4
	ldr	r9, [lr]
	str	r1, [r7, #-4]!
	mov	r1, r7
	str	ip, [sp]
	ldr	r8, [r9]
	blx	r8
	subs	r8, r0, #0
	bne	.L476
	cmp	r6, #2
	bgt	.L497
	cmp	r6, #0
	movgt	r8, #2
	ble	.L471
.L470:
	sub	fp, r8, #3
	mov	r10, #1
.L473:
	cmp	r6, r8
	mov	r3, r8
	mov	r2, #0
	mov	r1, r7
	mov	r0, r4
	sub	r8, r8, #1
	beq	.L472
	str	r10, [sp]
	ldr	ip, [r9]
	blx	ip
	cmp	r0, #0
	bne	.L476
.L472:
	cmp	fp, r8
	bne	.L473
	b	.L463
.L476:
	ldr	r3, [sp, #28]
	mov	r1, r6
	mov	r0, r4
	str	r3, [r5, #60]
	bl	change_curseg.constprop.11
	b	.L460
.L494:
	mov	r1, #4
	bl	new_curseg
	b	.L460
.L497:
	cmp	r6, #3
	moveq	r8, r6
	beq	.L471
	mov	r8, #5
	b	.L470
.L471:
	add	fp, r8, #3
	mov	r10, #1
.L477:
	cmp	r6, r8
	mov	r3, r8
	mov	r2, #0
	mov	r1, r7
	mov	r0, r4
	add	r8, r8, #1
	beq	.L475
	str	r10, [sp]
	ldr	ip, [r9]
	blx	ip
	cmp	r0, #0
	bne	.L476
.L475:
	cmp	r8, fp
	bne	.L477
	b	.L463
	.fnend
	.size	allocate_segment_by_default, .-allocate_segment_by_default
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__submit_discard_cmd, %function
__submit_discard_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r3, [r1, #54]	@ zero_extendqisi2
	cmp	r3, #0
	bxne	lr
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, r1
	movw	r3, #:lower16:__tracepoint_f2fs_issue_discard
	strd	r6, [sp, #8]
	movt	r3, #:upper16:__tracepoint_f2fs_issue_discard
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r1, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r4, [r2, #16]
	str	r2, [sp, #16]
	ldr	r6, [r2, #20]
	str	r0, [sp, #28]
	ldr	r1, [r1, #80]
	str	r1, [sp, #24]
	ldr	r1, [r2, #48]
	ldr	r2, [r3, #4]
	str	r1, [sp, #4]
	cmp	r2, #0
	bne	.L552
.L501:
	ldr	r3, [sp, #4]
	lsr	r2, r6, #29
	lsr	fp, r4, #29
	lsl	r6, r6, #3
	lsl	r10, r4, #3
	str	r2, [sp]
	ldr	r3, [r3, #88]
	ldr	ip, [r3, #492]
	cmp	ip, #0
	beq	.L553
	ldr	r3, [ip, #556]
	tst	r3, #16384
	beq	.L554
	add	r3, ip, #776
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L507
	mov	lr, r2
	lsr	r2, r3, #9
	orr	lr, lr, fp
	sub	r2, r2, #1
	orr	r3, r6, r10
	asr	r5, r2, #31
	and	r0, r2, r3
	and	r1, r5, lr
	orrs	r3, r0, r1
	bne	.L508
.L507:
	ldr	r1, [sp, #4]
	ldr	r2, [ip, #768]
	ldr	r3, [r1, #68]
	lsr	r2, r2, #9
	cmp	r2, #1
	movcc	r2, #1
	cmp	r3, r1
	str	r2, [sp, #8]
	beq	.L509
	ldr	r3, [r1, #76]
	mov	r1, r2
	ldr	r3, [r3, #24]
.L510:
	asr	r3, r3, #9
	orrs	r2, r10, fp
	mov	r5, #0
	udiv	r2, r3, r1
	mls	r3, r1, r2, r3
	str	r3, [sp, #12]
	strne	r3, [sp, #20]
	bne	.L511
	b	.L512
.L543:
	ldr	r1, [sp]
	subs	r10, r10, r8
	lsl	r3, r8, #9
	mov	r2, #129
	str	r6, [r5]
	sbc	fp, fp, #0
	str	r1, [r5, #4]
.L549:
	ldr	r1, [sp, #4]
	str	r1, [r5, #12]
	str	r2, [r5, #20]
	str	r3, [r5, #32]
	bl	_cond_resched
	orrs	r3, r10, fp
	beq	.L512
	mov	r6, r7
	str	r9, [sp]
.L511:
	mov	r3, #0
	movw	r2, #65535
	movt	r2, 127
	cmp	fp, r3
	cmpeq	r10, r2
	mov	r3, fp
	mov	r2, r10
	bls	.L513
	movw	r2, #65535
	mov	r3, #0
	movt	r2, 127
.L513:
	ldr	r1, [sp]
	adds	r7, r2, r6
	mov	r8, r2
	adc	r9, r3, r1
	cmp	r3, fp
	cmpeq	r2, r10
	bcs	.L514
	mov	r0, r7
	mov	r1, r9
	ldr	r4, [sp, #8]
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
	ldr	r3, [sp, #12]
	cmp	r3, r1
	beq	.L514
	ldr	r8, [sp, #20]
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
	ldr	ip, [sp, #8]
	umull	r0, r1, ip, r2
	mla	r1, ip, r3, r1
	adds	r7, r0, r8
	sub	r8, r7, r6
	adc	r9, r1, #0
.L514:
	cmp	r5, #0
	beq	.L520
	mov	r1, r5
	mov	r0, #0
	bl	submit_bio_wait
	mov	r4, r0
	mov	r0, r5
	bl	bio_put
	cmp	r4, #0
	bne	.L555
.L520:
	mov	r1, #1
	mov	r0, #16
	bl	bio_alloc
	subs	r5, r0, #0
	bne	.L543
	mov	r1, #1
	mov	r0, #2064
	bl	bio_alloc
	ldr	r1, [sp]
	subs	r10, r10, r8
	mov	r5, r0
	lsl	r3, r8, #9
	mov	r2, #129
	str	r6, [r0]
	sbc	fp, fp, #0
	str	r1, [r0, #4]
	b	.L549
.L512:
	ldr	ip, [sp, #16]
	mov	r2, #0
	mov	r1, #1
	ldr	r0, [sp, #24]
	strb	r1, [ip, #54]
	add	r3, r0, #4160
	str	r2, [ip, #56]
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
	beq	.L498
	movw	r3, #:lower16:f2fs_submit_discard_endio
	add	r4, ip, #24
	str	ip, [r5, #60]
	movt	r3, #:upper16:f2fs_submit_discard_endio
	mov	r1, r5
	mov	r0, #16
	str	r3, [r5, #56]
	bl	submit_bio
	mov	r0, r4
	bl	__list_del_entry
	ldr	r2, [sp, #24]
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
.L555:
	ldr	r3, [sp, #16]
	cmn	r4, #95
	str	r4, [r3, #56]
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #28]
	ldr	r5, [r3, #80]
	beq	.L556
.L523:
	ldr	r3, [sp, #28]
	movw	r2, #:lower16:.LC3
	movw	r1, #:lower16:.LC4
	movt	r2, #:upper16:.LC3
	movt	r1, #:upper16:.LC4
	ldr	r0, [r3]
	mov	r3, r4
	bl	f2fs_msg
	ldr	r3, [sp, #16]
.L528:
	ldrb	r3, [r3, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L522
	add	r3, r5, #4160
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
.L522:
	ldr	r4, [sp, #16]
	add	r0, r4, #24
	bl	list_del
	add	r1, r5, #4160
	mov	r0, r4
	add	r1, r1, #12
	bl	rb_erase
	add	ip, r5, #4096
	ldr	lr, [r4, #16]
	movw	r2, #:lower16:.LANCHOR0
	ldr	r3, [ip, #60]
	movt	r2, #:upper16:.LANCHOR0
	mov	r1, r4
	ldr	r0, [r2, #8]
	sub	r3, r3, lr
	str	r3, [ip, #60]
	bl	kmem_cache_free
	add	r3, r5, #4160
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
.L498:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L552:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L502
	ldr	r8, [sp, #4]
.L503:
	mov	r3, r4
	ldr	r7, [r5]
	mov	r2, r6
	ldr	r0, [r5, #4]
	mov	r1, r8
	blx	r7
	ldr	r3, [r5, #8]!
	cmp	r3, #0
	bne	.L503
.L502:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L504
.L550:
	ldr	r3, [sp, #16]
	ldr	r4, [r3, #16]
	ldr	r6, [r3, #20]
	ldr	r3, [r3, #48]
	str	r3, [sp, #4]
	b	.L501
.L509:
	mov	r1, r2
	ldr	r3, [ip, #772]
	b	.L510
.L556:
	ldr	r2, [sp, #16]
.L506:
	mov	r3, #0
	str	r3, [r2, #56]
	mov	r3, r2
	b	.L528
.L504:
	bl	preempt_schedule
	b	.L550
.L553:
	mvn	r3, #5
.L551:
	ldr	r2, [sp, #16]
	mov	r4, r3
	str	r3, [r2, #56]
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #28]
	ldr	r5, [r3, #80]
	b	.L523
.L554:
	ldr	r2, [sp, #16]
	mvn	r3, #94
	str	r3, [r2, #56]
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #28]
	ldr	r5, [r3, #80]
	b	.L506
.L508:
	mvn	r3, #21
	b	.L551
	.fnend
	.size	__submit_discard_cmd, .-__submit_discard_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	issue_discard_thread, %function
issue_discard_thread:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r2, #:lower16:.LC0
	movw	r1, #:lower16:jiffies
	strd	r6, [sp, #8]
	movt	r2, #:upper16:.LC0
	movt	r1, #:upper16:jiffies
	strd	r10, [sp, #24]
	mov	r10, r0
	movw	r0, #:lower16:.LANCHOR0
	strd	r8, [sp, #16]
	movt	r0, #:upper16:.LANCHOR0
	str	lr, [sp, #32]
	ldr	r3, [r10, #28]
	.pad #68
	sub	sp, sp, #68
	str	r2, [sp, #12]
	str	r1, [sp, #16]
	ldr	r3, [r3, #80]
	str	r0, [sp, #20]
	str	r3, [sp, #24]
	add	r3, r3, #4096
	add	r3, r3, #20
	str	r3, [sp, #28]
.L558:
	bl	kthread_should_stop
	subs	r5, r0, #0
	bne	.L586
.L591:
	ldr	r3, [r10, #28]
	ldr	r6, [r3, #80]
	add	r7, r6, #4096
	add	r6, r6, #4
	mov	r9, r7
	add	r7, r7, #32
	mov	r0, r7
	add	r9, r9, #4
	bl	mutex_lock
	add	r0, sp, #40
	bl	blk_start_plug
	ldr	fp, [sp, #16]
.L567:
	ldr	r8, [r9]
	ldr	r3, [r8]
	cmp	r9, r8
	sub	r8, r8, #24
	sub	r4, r3, #24
	bne	.L566
	b	.L560
.L562:
	add	r5, r5, #1
	mov	r8, r4
	sub	r3, r5, #1
	cmp	r3, #8
	bgt	.L565
	ldr	r3, [r4, #24]!
	cmp	r9, r4
	sub	r4, r3, #24
	beq	.L560
.L566:
	ldrb	r3, [r8, #54]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L589
.L561:
	ldr	r3, [r10]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #492]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L562
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L562
	ldr	r2, [r10, #476]
	add	r0, sp, #32
	strd	r2, [sp, #32]
	bl	timespec_to_jiffies
	ldr	r3, [r10, #468]
	ldr	r2, [fp]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L562
	mov	r1, r8
	mov	r0, r10
	bl	__submit_discard_cmd
	b	.L562
.L589:
	movw	r1, #1131
	ldr	r0, [sp, #12]
	bl	warn_slowpath_null
	add	r1, r10, #16
	mov	r0, #2
	bl	_set_bit
	b	.L561
.L560:
	sub	r9, r9, #8
	cmp	r6, r9
	bne	.L567
.L565:
	add	r0, sp, #40
	bl	blk_finish_plug
	mov	r0, r7
	bl	mutex_unlock
	ldr	r3, [r10, #28]
	ldr	r4, [r3, #80]
	add	r9, r4, #4096
	add	r4, r4, #4096
	mov	r8, r9
	add	r9, r9, #32
	mov	r0, r9
	add	r8, r8, #12
	bl	mutex_lock
	ldr	r6, [r4, #12]
	ldr	r5, [r6]
	mov	r4, r6
	sub	r6, r6, #24
	cmp	r8, r4
	sub	r5, r5, #24
	beq	.L568
	movw	fp, #:lower16:.LC3
	movw	r3, #:lower16:.LC4
	movt	fp, #:upper16:.LC3
	movt	r3, #:upper16:.LC4
	stmib	sp, {r3, fp}
	b	.L573
.L569:
	mov	r4, r5
	mov	r6, r5
	ldr	r5, [r4, #24]!
	cmp	r8, r4
	sub	r5, r5, #24
	beq	.L568
.L573:
	ldrb	r3, [r6, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L569
	ldrh	fp, [r6, #52]
	add	r0, r6, #32
	cmp	fp, #0
	bne	.L569
	bl	wait_for_completion_io
	ldr	r3, [r6, #56]
	ldr	r1, [r10, #28]
	cmn	r3, #95
	ldr	r7, [r1, #80]
	streq	fp, [r6, #56]
	beq	.L571
	cmp	r3, #0
	ldmib	sp, {r1, r2}
	beq	.L571
	ldr	r0, [r10]
	bl	f2fs_msg
.L571:
	ldrb	r3, [r6, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L572
	add	r3, r7, #4160
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
.L572:
	mov	r0, r4
	bl	list_del
	add	r1, r7, #4160
	mov	r0, r6
	add	r1, r1, #12
	bl	rb_erase
	add	r2, r7, #4096
	ldr	ip, [r6, #16]
	mov	r1, r6
	ldr	r3, [r2, #60]
	ldr	r0, [sp, #20]
	sub	r3, r3, ip
	ldr	r0, [r0, #8]
	str	r3, [r2, #60]
	bl	kmem_cache_free
	add	r3, r7, #4160
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
	b	.L569
.L568:
	mov	r0, r9
	bl	mutex_unlock
	mov	r1, #6
	mov	r0, #1
	bl	congestion_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L558
	ldr	r3, [sp, #24]
	add	r4, r3, #4096
	ldr	r3, [r4, #72]
	cmp	r3, #0
	bne	.L558
	mov	r2, sp
	str	r3, [sp, #40]
	add	r1, sp, #52
	bic	r5, r2, #8128
	str	r3, [sp, #44]
	movw	r2, #:lower16:autoremove_wake_function
	bic	r5, r5, #63
	movt	r2, #:upper16:autoremove_wake_function
	ldr	r6, [sp, #28]
	ldr	r0, [r5, #12]
	str	r1, [sp, #52]
	str	r1, [sp, #56]
	str	r0, [sp, #44]
	str	r2, [sp, #48]
	b	.L576
.L590:
	bl	schedule
.L576:
	mov	r2, #1
	add	r1, sp, #40
	mov	r0, r6
	bl	prepare_to_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L575
	ldr	r3, [r4, #72]
	cmp	r3, #0
	bne	.L575
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L590
.L575:
	add	r1, sp, #40
	ldr	r0, [sp, #28]
	bl	finish_wait
	bl	kthread_should_stop
	subs	r5, r0, #0
	beq	.L591
.L586:
	mov	r0, #0
	add	sp, sp, #68
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
	.fnend
	.size	issue_discard_thread, .-issue_discard_thread
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
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r4, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
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
	beq	.L605
	ldr	r2, [r5, #696]
	cmp	r2, r3
	bls	.L596
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__locate_dirty_segment
.L598:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L605:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r4, r1
	beq	.L596
	ldr	r1, [r3, #112]
	cmp	r4, r1
	beq	.L596
	ldr	r1, [r3, #176]
	cmp	r4, r1
	beq	.L596
	ldr	r1, [r3, #240]
	cmp	r4, r1
	beq	.L596
	ldr	r1, [r3, #304]
	cmp	r4, r1
	beq	.L596
	ldr	r3, [r3, #368]
	cmp	r4, r3
	beq	.L596
	ldr	r7, [r2, #8]
	mov	r0, r4
	ldr	r1, [r7, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L596
	ldr	r3, [r7, #84]
	add	r3, r3, #1
	str	r3, [r7, #84]
.L596:
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L598
	.fnend
	.size	locate_dirty_segment, .-locate_dirty_segment
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
	beq	.L606
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
	beq	.L608
	movw	r0, #:lower16:.LC7
	mov	r3, #131072
	str	r4, [sp]
	movt	r0, #:upper16:.LC7
	mov	r2, r4
	mov	r1, #16
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5, #4]
	beq	.L609
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
	bne	.L606
.L610:
	ldr	r0, [r5, #4]
	bl	kmem_cache_destroy
.L609:
	ldr	r0, [r5, #8]
	bl	kmem_cache_destroy
.L608:
	ldr	r0, [r5]
	bl	kmem_cache_destroy
	mvn	r0, #11
.L606:
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
	bne	.L622
	b	.L621
.L623:
	mov	r0, r3
.L622:
	ldr	r3, [r0]
	str	r2, [r0]
	mov	r2, r0
	cmp	r3, #0
	bne	.L623
.L621:
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
	beq	.L648
.L628:
	add	r7, r6, #432
	str	r5, [r5]
	mov	r0, r7
	str	r5, [r5, #4]
	str	r4, [r5, #8]
	bl	mutex_lock
	ldr	r3, [r4]
	tst	r3, #32768
	bne	.L629
.L631:
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
.L630:
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
	bne	.L649
.L627:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L648:
	mov	r0, r7
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r5, r0
	b	.L628
.L629:
	mov	r0, r4
	bl	__get_page_tail
	cmp	r0, #0
	bne	.L630
	b	.L631
.L649:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L634
.L635:
	ldr	r3, [r5]
	mov	r2, #5
	mov	r1, r4
	ldr	r0, [r5, #4]
	blx	r3
	ldr	r3, [r5, #8]!
	cmp	r3, #0
	bne	.L635
.L634:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L627
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	preempt_schedule
	.fnend
	.size	register_inmem_page, .-register_inmem_page
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
	add	r1, r4, #424
	mov	r2, #1
	mov	r0, r4
	bl	__revoke_inmem_pages.constprop.10
	mov	r0, r5
	bl	mutex_unlock
	ldr	r3, [r4, #356]
	tst	r3, #32768
	beq	.L651
	add	r1, r4, #356
	mov	r0, #15
	bl	_clear_bit
.L651:
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
	bne	.L689
.L657:
	add	r8, r4, #432
	mov	r0, r8
	bl	mutex_lock
	ldr	r4, [r4, #424]
	cmp	r4, r6
	mov	r0, r4
	bne	.L661
	b	.L658
.L690:
	ldr	r4, [r4]
	cmp	r4, r6
	mov	r0, r4
	beq	.L658
.L661:
	ldr	r3, [r4, #8]
	cmp	r3, r5
	bne	.L690
	cmp	r4, #0
	beq	.L691
.L663:
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
	beq	.L664
	mov	r0, r5
	bl	put_page
.L664:
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L692
.L656:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L658:
	cmp	r4, #0
	beq	.L662
	ldr	r3, [r4, #8]
	cmp	r3, r5
	moveq	r0, r6
	beq	.L663
.L662:
	movw	r0, #:lower16:.LC0
	movw	r1, #327
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r7, #16
	bl	_set_bit
	mov	r0, r6
	b	.L663
.L692:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r4, [r3, #16]
	cmp	r4, #0
	beq	.L667
.L668:
	ldr	r3, [r4]
	mov	r2, #7
	mov	r1, r5
	ldr	r0, [r4, #4]
	blx	r3
	ldr	r3, [r4, #8]!
	cmp	r3, #0
	bne	.L668
.L667:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L656
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	preempt_schedule
.L689:
	movw	r0, #:lower16:.LC0
	movw	r1, #319
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r7, #16
	mov	r0, #2
	bl	_set_bit
	b	.L657
.L691:
	mov	r6, r4
	b	.L662
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
	beq	.L718
.L694:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L719
.L695:
	mov	r1, #0
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L696
	movw	r1, #3640
	mov	r0, r4
	bl	try_to_free_nids
.L697:
	ldr	r3, [r4]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #492]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L698
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L720
.L698:
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcc	.L693
.L706:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L721
.L707:
	ldr	r3, [r4, #864]
	tst	r3, #32768
	bne	.L722
.L705:
	mov	r1, #1
	ldr	r0, [r4]
	bl	f2fs_sync_fs
	ldr	r2, [r4, #908]
	ldr	r3, [r2, #308]
	add	r3, r3, #1
	str	r3, [r2, #308]
.L693:
	add	sp, sp, #24
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L696:
	mov	r2, #0
	mov	r0, r4
	mov	r1, r2
	bl	build_free_nids
	b	.L697
.L718:
	mov	r1, #128
	mov	r0, r4
	bl	f2fs_shrink_extent_tree
	b	.L694
.L719:
	movw	r1, #455
	mov	r0, r4
	bl	try_to_free_nats
	b	.L695
.L721:
	mov	r1, #3
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L707
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #8]
	ldr	r3, [r3, #44]
	ldr	r2, [r2, #84]
	cmp	r2, r3
	bhi	.L707
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcs	.L707
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
	bpl	.L693
	b	.L707
.L722:
	mov	r0, sp
	bl	blk_start_plug
	mov	r1, #1
	mov	r0, r4
	bl	sync_dirty_inodes
	mov	r0, sp
	bl	blk_finish_plug
	b	.L705
.L720:
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
	bpl	.L698
	b	.L706
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
	beq	.L724
	ldr	r2, [r0, #20]
	movw	r3, #34463
	movt	r3, 1
	ldr	r2, [r2, #76]
	cmp	r2, r3
	bhi	.L733
.L724:
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
	bne	.L723
	ldr	r2, [r4, #28]
	add	r3, r3, ip, lsl #1
	add	r1, r3, r1
	ldr	r3, [r2, #36]
	ldr	r2, [r2, #4]
	udiv	lr, r3, lr
	ldr	r3, [r2, #8]
	add	r1, r1, lr
	cmp	r3, r1
	bls	.L734
.L723:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L734:
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
.L733:
	bl	f2fs_balance_fs_bg
	b	.L724
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
	ldr	r3, [r0, #864]
	ands	ip, r3, #2048
	bne	.L750
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	tst	r3, #1024
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r2, [r0, #28]
	.pad #24
	sub	sp, sp, #24
	ldr	r5, [r2, #76]
	beq	.L762
	mov	r6, r5
	ldr	r3, [r6, #20]!
	cmp	r3, #0
	beq	.L763
	movw	r1, #:lower16:.LC1
	ldr	r2, .L768
	add	r0, sp, #4
	movt	r1, #:upper16:.LC1
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
.L746:
	str	r3, [sp, #16]
	.syntax divided
@ 193 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
.L745:
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
	bne	.L745
	.syntax divided
@ 195 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, r0
	beq	.L764
	mov	r3, r0
	b	.L746
.L750:
	mov	r0, #0
	bx	lr
.L764:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L765
.L747:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L748
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
.L749:
	ldr	r0, [sp, #20]
	b	.L735
.L762:
	ldr	r3, [r0]
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r4, #1076]
	cmp	r0, #0
	clz	r3, r2
	lsr	r3, r3, #5
	movne	r3, #1
	cmp	r3, #0
	beq	.L766
.L761:
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
.L735:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L748:
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
	b	.L749
.L763:
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
	ldr	r3, [r0]
	ldr	r1, [r3, #208]
	bl	__submit_flush_wait
	ldr	r2, [r4, #1076]
	adds	r3, r0, #0
	movne	r3, #1
	cmp	r2, #0
	moveq	r3, #1
	cmp	r3, #0
	beq	.L767
.L742:
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
	b	.L761
.L767:
	cmp	r2, #1
	movgt	r7, #80
	movgt	r8, #1
	ble	.L744
.L743:
	ldr	r3, [r4, #1080]
	mov	r0, r4
	add	r8, r8, #1
	ldr	r1, [r3, r7]
	add	r7, r7, #80
	bl	__submit_flush_wait
	cmp	r0, #0
	bne	.L742
	ldr	r3, [r4, #1076]
	cmp	r8, r3
	blt	.L743
.L744:
	mov	r0, #0
	b	.L742
.L765:
	mov	r2, #1
	mov	r1, #3
	add	r0, r5, #4
	bl	__wake_up
	b	.L747
.L766:
	cmp	r2, #1
	movgt	r6, #80
	movgt	r7, #1
	ble	.L740
.L739:
	ldr	r3, [r4, #1080]
	mov	r0, r4
	add	r7, r7, #1
	ldr	r1, [r3, r6]
	add	r6, r6, #80
	bl	__submit_flush_wait
	cmp	r0, #0
	bne	.L761
	ldr	r3, [r4, #1076]
	cmp	r7, r3
	blt	.L739
.L740:
	mov	r0, #0
	b	.L761
.L769:
	.align	2
.L768:
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
	beq	.L779
.L771:
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
	bhi	.L774
	mov	r6, #0
	bl	wake_up_process
	str	r7, [r4]
.L770:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L779:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L775
	mov	r2, #32
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L780
.L772:
	mov	r7, #0
	movw	r1, #:lower16:.LC9
	ldr	r2, .L781
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
	bne	.L771
	b	.L770
.L775:
	mov	r4, #16
	b	.L772
.L774:
	mov	r0, r4
	str	r7, [r4]
	mov	r6, r7
	bl	kfree
	ldr	r3, [r5, #28]
	mov	r2, #0
	str	r2, [r3, #76]
	b	.L770
.L780:
	mvn	r6, #11
	b	.L770
.L782:
	.align	2
.L781:
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
	beq	.L784
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L784
	mov	r3, #0
	str	r3, [r4]
	bl	kthread_stop
.L784:
	cmp	r6, #0
	beq	.L783
	mov	r0, r4
	bl	kfree
	ldr	r3, [r5, #28]
	mov	r2, #0
	str	r2, [r3, #76]
.L783:
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
	@ args = 0, pretend = 0, frame = 24
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
	.pad #36
	sub	sp, sp, #36
	ldr	r4, [r3, #80]
	add	r5, r4, #4096
	add	r5, r5, #32
	mov	r0, r5
	bl	mutex_lock
	add	r0, r4, r8
	mov	r2, r7
	mov	r1, #0
	bl	__lookup_rb_tree
	subs	r4, r0, #0
	beq	.L815
	ldrb	r2, [r4, #54]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L827
	ldrh	r3, [r4, #52]
	mov	r0, r5
	add	r3, r3, #1
	strh	r3, [r4, #52]	@ movhi
	bl	mutex_unlock
	add	r0, r4, #32
	bl	wait_for_completion_io
	mov	r0, r5
	bl	mutex_lock
	ldrb	r3, [r4, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L828
.L814:
	ldrh	r2, [r4, #52]
	sub	r2, r2, #1
	uxth	r2, r2
	cmp	r2, #0
	strh	r2, [r4, #52]	@ movhi
	beq	.L829
.L815:
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L827:
	ldr	r3, [r4, #16]
	ldr	r1, [r6, #28]
	cmp	r3, #1
	ldr	r9, [r1, #80]
	beq	.L830
	add	r2, r9, #4096
	ldr	r10, [r4, #12]
	ldr	r1, [r2, #60]
	ldr	r0, [r4, #20]
	cmp	r7, r10
	add	fp, r10, r3
	sub	r1, r1, r3
	sub	r3, fp, #1
	str	r0, [sp, #12]
	str	r1, [r2, #60]
	bhi	.L804
	cmp	r3, r7
	bls	.L815
	ldr	r0, [r4, #12]
	add	r7, r4, #24
	ldr	r3, [r4, #16]
	ldr	r1, [r4, #20]
	add	r0, r0, #1
	sub	r3, r3, #1
	add	r1, r1, #1
	str	r0, [r4, #12]
	mov	r0, r7
	str	r3, [r4, #16]
	str	r1, [r4, #20]
	ldr	r1, [r2, #60]
	add	r3, r1, r3
	str	r3, [r2, #60]
	ldr	r4, [r4, #16]
	cmp	r4, #512
	movcs	r4, #512
	lsl	r4, r4, #3
	add	r10, r4, #4
	add	r4, r9, r4
	add	r10, r9, r10
	bl	__list_del_entry
	mov	r2, r10
	mov	r0, r7
	ldr	r1, [r4, #8]
	bl	__list_add
	add	r1, r9, r8
	mov	r0, r6
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	bne	.L815
	movw	r0, #:lower16:.LC0
	movw	r1, #1001
.L826:
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L815
.L829:
	ldr	r3, [r4, #56]
	ldr	r1, [r6, #28]
	cmn	r3, #95
	ldr	r7, [r1, #80]
	streq	r2, [r4, #56]
	beq	.L817
	cmp	r3, #0
	beq	.L817
	movw	r2, #:lower16:.LC3
	movw	r1, #:lower16:.LC4
	ldr	r0, [r6]
	movt	r2, #:upper16:.LC3
	movt	r1, #:upper16:.LC4
	bl	f2fs_msg
.L817:
	ldrb	r3, [r4, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L818
	add	r3, r7, #4160
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
.L818:
	add	r0, r4, #24
	bl	list_del
	add	r1, r7, #4160
	mov	r0, r4
	add	r1, r1, #12
	bl	rb_erase
	add	ip, r7, #4096
	ldr	lr, [r4, #16]
	movw	r2, #:lower16:.LANCHOR0
	ldr	r3, [ip, #60]
	movt	r2, #:upper16:.LANCHOR0
	mov	r1, r4
	ldr	r0, [r2, #8]
	sub	r3, r3, lr
	str	r3, [ip, #60]
	bl	kmem_cache_free
	add	r3, r7, #4160
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
	b	.L815
.L830:
	ldr	r3, [r4, #56]
	cmn	r3, #95
	streq	r2, [r4, #56]
	beq	.L803
	cmp	r3, #0
	beq	.L803
	movw	r2, #:lower16:.LC3
	movw	r1, #:lower16:.LC4
	ldr	r0, [r6]
	movt	r2, #:upper16:.LC3
	movt	r1, #:upper16:.LC4
	bl	f2fs_msg
	ldrb	r3, [r4, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L803
	add	r3, r9, #4160
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
.L803:
	add	r0, r4, #24
	bl	list_del
	add	r1, r9, #4160
	mov	r0, r4
	add	r1, r1, #12
	bl	rb_erase
	add	ip, r9, #4096
	ldr	lr, [r4, #16]
	movw	r2, #:lower16:.LANCHOR0
	ldr	r3, [ip, #60]
	movt	r2, #:upper16:.LANCHOR0
	mov	r1, r4
	ldr	r0, [r2, #8]
	add	r9, r9, #4160
	add	r9, r9, #8
	sub	r3, r3, lr
	str	r3, [ip, #60]
	bl	kmem_cache_free
	.syntax divided
@ 83 "/home/Jprimero15/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r9]
	sub	r3, r3, #1
	strex	r2, r3, [r9]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	b	.L815
.L804:
	ldr	r1, [r4, #12]
	str	r3, [sp, #28]
	add	r3, r9, r8
	add	r0, r4, #24
	str	r3, [sp, #16]
	mov	r8, r0
	sub	r1, r7, r1
	str	r1, [r4, #16]
	ldr	ip, [r2, #60]
	add	r1, ip, r1
	str	r1, [r2, #60]
	ldr	r1, [r4, #16]
	cmp	r1, #512
	movcs	r1, #512
	lsl	r1, r1, #3
	add	r2, r1, #4
	add	r2, r9, r2
	str	r2, [sp, #20]
	str	r1, [sp, #24]
	bl	__list_del_entry
	ldr	r2, [sp, #20]
	mov	r0, r8
	ldr	r1, [sp, #24]
	add	r9, r9, r1
	ldr	r1, [r9, #8]
	bl	__list_add
	ldr	r1, [sp, #16]
	mov	r0, r6
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	ldr	r3, [sp, #28]
	beq	.L831
.L825:
	cmp	r3, r7
	bls	.L815
	mvn	r3, r7
	add	r2, r7, #1
	ldr	r1, [r4, #48]
	add	fp, r3, fp
	ldr	r3, [sp, #12]
	mov	r0, r6
	str	fp, [sp]
	add	r3, r3, r2
	sub	r3, r3, r10
	bl	__insert_discard_tree.constprop.8
	ldr	r1, [sp, #16]
	mov	r0, r6
	bl	__check_rb_tree_consistence
	cmp	r0, #0
	movweq	r0, #:lower16:.LC0
	movweq	r1, #993
	bne	.L815
	b	.L826
.L828:
	movw	r0, #:lower16:.LC0
	mov	r1, #1184
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L814
.L831:
	movw	r0, #:lower16:.LC0
	movw	r1, #982
	str	r3, [sp, #20]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp, #20]
	b	.L825
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
	mov	r4, r0
	strd	r6, [sp, #8]
	add	r7, r0, #16
	movw	r6, #:lower16:.LC0
	strd	r8, [sp, #16]
	movt	r6, #:upper16:.LC0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #44
	sub	sp, sp, #44
	ldr	r8, [r3, #80]
	add	r9, r8, #4096
	add	r8, r8, #4
	mov	r5, r9
	add	r9, r9, #32
	mov	r0, r9
	add	r5, r5, #4
	bl	mutex_lock
	add	r0, sp, #16
	bl	blk_start_plug
.L837:
	ldr	fp, [r5]
	ldr	r10, [fp]
	cmp	r5, fp
	sub	fp, fp, #24
	sub	r10, r10, #24
	bne	.L833
	b	.L834
.L835:
	bl	__submit_discard_cmd
	mov	r2, r10
	ldr	r3, [r2, #24]!
	cmp	r5, r2
	sub	r3, r3, #24
	beq	.L834
	mov	fp, r10
	mov	r10, r3
.L833:
	ldrb	r3, [fp, #54]	@ zero_extendqisi2
	mov	r1, fp
	mov	r0, r4
	cmp	r3, #0
	beq	.L835
	movw	r1, #1131
	mov	r0, r6
	bl	warn_slowpath_null
	mov	r1, r7
	mov	r0, #2
	bl	_set_bit
	mov	r1, fp
	mov	r0, r4
	b	.L835
.L834:
	sub	r5, r5, #8
	cmp	r8, r5
	bne	.L837
.L838:
	add	r0, sp, #16
	bl	blk_finish_plug
	mov	r0, r9
	bl	mutex_unlock
	ldr	r3, [r4, #28]
	ldr	r5, [r3, #80]
	add	r10, r5, #4096
	add	r5, r5, #4096
	mov	r9, r10
	add	r10, r10, #32
	mov	r0, r10
	add	r9, r9, #12
	bl	mutex_lock
	ldr	r6, [r5, #12]
	ldr	r8, [r6]
	mov	r7, r6
	sub	r6, r6, #24
	cmp	r9, r7
	sub	r8, r8, #24
	beq	.L839
	movw	fp, #:lower16:.LANCHOR0
	movw	r3, #:lower16:.LC3
	str	r10, [sp, #12]
	movw	r2, #:lower16:.LC4
	movt	r3, #:upper16:.LC3
	movt	r2, #:upper16:.LC4
	movt	fp, #:upper16:.LANCHOR0
	str	r3, [sp, #4]
	str	r2, [sp, #8]
.L844:
	ldrh	r10, [r6, #52]
	add	r0, r6, #32
	cmp	r10, #0
	bne	.L840
	bl	wait_for_completion_io
	ldr	r3, [r6, #56]
	ldr	r1, [r4, #28]
	cmn	r3, #95
	ldr	r5, [r1, #80]
	streq	r10, [r6, #56]
	beq	.L842
	cmp	r3, #0
	ldr	r2, [sp, #4]
	ldr	r1, [sp, #8]
	beq	.L842
	ldr	r0, [r4]
	bl	f2fs_msg
.L842:
	ldrb	r3, [r6, #54]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L843
	add	r3, r5, #4160
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
.L843:
	mov	r0, r7
	bl	list_del
	add	r1, r5, #4160
	mov	r0, r6
	add	r1, r1, #12
	bl	rb_erase
	add	r2, r5, #4096
	ldr	ip, [r6, #16]
	mov	r1, r6
	ldr	r3, [r2, #60]
	ldr	r0, [fp, #8]
	sub	r3, r3, ip
	str	r3, [r2, #60]
	bl	kmem_cache_free
	add	r3, r5, #4160
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
.L840:
	mov	r7, r8
	mov	r6, r8
	ldr	r8, [r7, #24]!
	cmp	r9, r7
	sub	r8, r8, #24
	bne	.L844
	ldr	r10, [sp, #12]
.L839:
	mov	r0, r10
	bl	mutex_unlock
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
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
	beq	.L852
	movw	r7, #:lower16:.LANCHOR0
	mov	r0, r5
	movt	r7, #:upper16:.LANCHOR0
.L854:
	bl	list_del
	mov	r1, r5
	ldr	r0, [r7]
	mov	r5, r4
	bl	kmem_cache_free
	cmp	r4, r6
	mov	r0, r4
	ldr	r4, [r4]
	bne	.L854
.L852:
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
	str	r2, [sp, #20]
	add	r2, r10, #36
	mov	r0, r2
	str	r2, [sp, #4]
	str	r3, [sp, #24]
	bl	mutex_lock
	ldr	ip, [r7, #28]
.L858:
	ldr	r1, [ip, #32]
	add	r2, r6, #1
	mov	r0, r5
	bl	_find_next_bit_le
	ldr	r3, [r7, #28]
	mov	r9, r0
	mov	r4, r0
	ldr	r1, [r3, #32]
	cmp	r1, r0
	bls	.L859
	add	r8, r0, #1
	mov	r0, r5
	mov	r2, r8
	bl	_find_next_zero_bit_le
	cmp	r9, r0
	mov	r6, r0
	bcs	.L860
	mov	r0, r9
.L861:
	mov	r1, r5
	bl	_clear_bit
	cmp	r6, r8
	mov	r0, r8
	add	r8, r8, #1
	bne	.L861
.L860:
	ldr	r3, [r10, #84]
	add	r3, r4, r3
	sub	r3, r3, r6
	str	r3, [r10, #84]
	ldr	lr, [r7, #864]
	tst	lr, #4
	beq	.L862
	ldr	r3, [sp, #20]
	ldr	ip, [r7, #28]
	cmp	r3, #0
	beq	.L863
	ldrd	r2, [fp, #8]
	mov	r1, #0
	cmp	r1, r3
	cmpeq	r4, r2
	bcc	.L863
	ldrd	r0, [fp, #16]
	mov	r3, #0
	sub	r2, r6, #1
	cmp	r3, r1
	cmpeq	r2, r0
	bls	.L858
.L863:
	tst	lr, #262144
	beq	.L865
	ldr	r2, [r7, #700]
	cmp	r2, #1
	beq	.L865
.L866:
	ldr	r0, [ip, #12]
	udiv	r3, r4, r2
	ldr	r1, [r0, #48]
	udiv	r1, r1, r2
	mul	r8, r2, r3
	cmp	r1, r3
	beq	.L867
	ldr	r1, [r0, #112]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L867
	ldr	r1, [r0, #176]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L867
	ldr	r1, [r0, #240]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L867
	ldr	r1, [r0, #304]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L867
	ldr	r1, [r0, #368]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L867
	cmp	r2, #1
	ldr	r1, [ip]
	bls	.L868
	ldr	r1, [r1, #64]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r3, #0
	beq	.L899
.L867:
	add	r4, r8, r2
	cmp	r6, r4
	bhi	.L866
	sub	r6, r4, #1
	b	.L858
.L862:
	ldr	ip, [r7, #28]
	b	.L858
.L865:
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
	b	.L858
.L859:
	ldr	r0, [sp, #4]
	bl	mutex_unlock
	ldr	r3, [sp]
	ldr	r6, [r3, #4]
	ldr	r3, [sp, #24]
	str	r6, [sp, #16]
	cmp	r3, r6
	ldr	r3, [r6]
	str	r3, [sp, #12]
	beq	.L870
	movw	r3, #:lower16:.LANCHOR0
	mov	r5, r7
	movt	r3, #:upper16:.LANCHOR0
	str	r3, [sp, #28]
.L880:
	ldr	r3, [sp, #20]
	mov	r10, r6
	ldr	ip, [r5, #696]
	cmp	r3, #0
	ldr	r3, [r10, #12]!
	and	r8, r3, #1
	beq	.L900
	mov	r7, #0
	mov	r3, r8
	str	r8, [sp]
	mov	r4, r7
	str	r7, [sp, #4]
	str	r6, [sp, #8]
	b	.L871
.L902:
	bl	_find_next_zero_bit_le
	ldrd	r8, [fp, #24]
	mov	r3, r0
	mov	r7, #0
	sub	ip, r3, r4
	mov	r0, r5
	mov	r2, ip
	mov	r6, ip
	cmp	r9, r7
	cmpeq	r8, ip
	movhi	r4, r3
	bhi	.L879
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
	adds	r3, r3, r6
	adc	r2, r2, r7
	str	r3, [fp, #32]
	str	r2, [fp, #36]
.L879:
	ldr	r3, [sp]
	ldr	ip, [r5, #696]
	eor	r3, r3, #1
	cmp	ip, r4
	str	r3, [sp]
	bls	.L901
.L871:
	cmp	r3, #0
	mov	r2, r4
	mov	r1, ip
	mov	r0, r10
	bne	.L902
	bl	_find_next_bit_le
	mov	r4, r0
	b	.L879
.L901:
	ldr	r7, [sp, #4]
	ldr	r6, [sp, #8]
.L876:
	ldr	r4, [sp, #12]
	ldr	r0, [sp, #16]
	str	r4, [sp, #16]
	bl	list_del
	ldr	r3, [r5, #28]
	mov	r1, r6
	mov	r6, r4
	ldr	r2, [sp, #28]
	ldr	r3, [r3, #80]
	ldr	r0, [r2]
	add	r3, r3, #4096
	ldr	r2, [r3, #52]
	sub	r2, r2, r7
	str	r2, [r3, #52]
	bl	kmem_cache_free
	ldr	r3, [sp, #24]
	cmp	r4, r3
	ldr	r3, [r4]
	str	r3, [sp, #12]
	bne	.L880
	mov	r7, r5
.L870:
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
.L900:
	cmp	r8, #0
	mov	r1, ip
	ldr	r7, [sp, #20]
	bne	.L882
	mov	r4, r7
	b	.L873
.L874:
	mov	r0, r10
	bl	_find_next_zero_bit_le
	ldr	r1, [r6, #8]
	mov	r4, r0
	mov	r0, r5
	sub	r8, r4, r9
	mov	r2, r8
	add	r7, r7, r8
	add	r1, r9, r1
	bl	f2fs_issue_discard
	ldrd	r2, [fp, #32]
	adds	r0, r2, r8
	adc	r1, r3, #0
	strd	r0, [fp, #32]
	ldr	r1, [r5, #696]
	cmp	r1, r4
	bls	.L876
.L873:
	mov	r2, r4
	mov	r0, r10
	bl	_find_next_bit_le
	ldr	r1, [r5, #696]
	mov	r2, r0
	mov	r9, r0
	cmp	r1, r0
	bhi	.L874
	b	.L876
.L882:
	mov	r2, r7
	mov	r9, r7
	b	.L874
.L868:
	add	r4, r4, r4, lsl #1
	ldr	r1, [r1, #60]
	lsl	r3, r4, #3
	ldrh	r3, [r1, r3]
	lsr	r3, r3, #6
	cmp	r3, #0
	bne	.L867
.L899:
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
	b	.L867
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	sub	r3, r2, #1
	strd	r6, [sp, #8]
	cmn	r3, #3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r0, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	str	r3, [sp, #8]
	str	r1, [sp, #16]
	ldr	r6, [r0, #16]
	str	r2, [sp, #20]
	sub	r2, r2, r6
	bhi	.L932
	ldr	r1, [r0, #4]
	mov	r9, #1
	ldr	r3, [r4, #692]
	ldr	r8, [r1]
	rsb	r8, r8, r2, lsr r3
	rsbs	r1, r8, #0
	and	ip, r8, #31
	and	r1, r1, #31
	add	r3, r8, #31
	rsbpl	ip, r1, #0
	cmp	r8, #0
	movge	r3, r8
	add	r5, r8, r8, lsl r9
	asr	r3, r3, #5
	lsl	r9, r9, ip
	lsl	r3, r3, #2
	lsl	r1, r5, #3
	str	r3, [sp, #12]
.L904:
	ldr	ip, [r0]
	ldr	r0, [r4, #696]
	ldr	r5, [ip, #60]
	sub	r6, r0, #1
	and	r6, r6, r2
	ldrh	r7, [r5, r1]
	add	r5, r5, r1
	lsr	r7, r7, #6
	add	r7, r7, #1
	cmp	r0, r7
	bcc	.L946
.L905:
	ldrh	r2, [r5]
	bfi	r2, r7, #6, #10
	strh	r2, [r5]	@ movhi
	ldr	r2, [r4, #28]
	ldr	r7, [r2]
	ldrd	r10, [r7, #72]
	bl	get_seconds
	ldr	r1, [r7, #80]
	mvn	r2, r6
	ldr	ip, [r7, #84]
	and	r2, r2, #7
	mov	r7, #1
	lsl	r7, r7, r2
	subs	r3, r10, r1
	sxtb	r2, r7
	str	r3, [sp]
	sbc	r3, fp, ip
	str	r3, [sp, #4]
	ldrd	r10, [sp]
	adds	r10, r10, r0
	adc	fp, fp, r0, asr #31
	mov	r0, r10
	mov	r1, fp
	strd	r0, [r5, #16]
	ldr	ip, [r4, #28]
	ldr	ip, [ip]
	strd	r0, [ip, #96]
	ldr	r0, [r5, #4]
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	tst	r1, r7
	orr	r1, r2, r1
	strb	r1, [r0, r6, lsr #3]
	bne	.L947
.L906:
	ldr	r1, [r4]
	ldr	r0, [r1, #208]
	ldr	r0, [r0, #88]
	ldr	r0, [r0, #492]
	ldr	r0, [r0, #556]
	tst	r0, #16384
	bne	.L907
	ldr	r1, [r1, #616]
	ldr	r1, [r1, #8]
	ldr	r1, [r1, #2180]	@ unaligned
	tst	r1, #2
	bne	.L907
.L908:
	ldr	ip, [r5, #8]
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldrb	r0, [ip, r6, lsr #3]	@ zero_extendqisi2
	and	r1, r1, #63
	cmp	r1, #4
	and	r1, r0, r7
	beq	.L948
.L909:
	cmp	r1, #0
	bne	.L911
	ldrh	r2, [r5, #2]
	ubfx	r1, r2, #0, #10
	add	r1, r1, #1
	bfi	r2, r1, #0, #10
	strh	r2, [r5, #2]	@ movhi
.L911:
	ldr	r2, [r4, #28]
	ldr	r3, [sp, #12]
	ldr	r1, [r2]
	ldr	r0, [r1, #28]
	ldr	r2, [r0, r3]
	tst	r2, r9
	orr	r9, r2, r9
	str	r9, [r0, r3]
	bne	.L912
	ldr	r3, [r1, #32]
	add	r3, r3, #1
	str	r3, [r1, #32]
.L912:
	ldr	r3, [r4, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, #1
	str	r3, [r2, #12]
	ldr	r3, [r4, #700]
	cmp	r3, #1
	bls	.L913
	ldr	r2, [r4, #28]
	udiv	r8, r8, r3
	ldr	r3, [r2]
	ldr	r2, [r3, #64]
	ldr	r3, [r2, r8, lsl #2]
	add	r3, r3, #1
	str	r3, [r2, r8, lsl #2]
.L913:
	ldr	r0, [sp, #16]
	sub	r3, r0, #1
	cmn	r3, #3
	bhi	.L915
	ldr	r2, [r4, #28]
	mov	r5, r0
	ldr	r1, [r4, #692]
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #16]
	ldr	r3, [r3]
	sub	r2, r0, r2
	rsb	r3, r3, r2, lsr r1
	cmn	r3, #1
	bne	.L949
.L915:
	ldr	r3, [sp, #8]
	cmn	r3, #3
	bhi	.L903
	ldr	r0, [r4, #28]
	ldr	ip, [sp, #20]
	ldr	r1, [r4, #692]
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #16]
	ldr	r2, [r2]
	sub	r10, ip, r3
	rsb	r10, r2, r10, lsr r1
	cmn	r10, #1
	beq	.L903
	ldr	r3, [r0, #12]
	ldr	r2, [r3, #48]
	cmp	r10, r2
	beq	.L903
	ldr	r2, [r3, #112]
	cmp	r10, r2
	beq	.L903
	ldr	r2, [r3, #176]
	cmp	r10, r2
	beq	.L903
	ldr	r2, [r3, #240]
	cmp	r10, r2
	beq	.L903
	ldr	r2, [r3, #304]
	cmp	r10, r2
	beq	.L903
	ldr	r3, [r3, #368]
	cmp	r10, r3
	beq	.L903
	ldr	r5, [r0, #8]
	add	r5, r5, #36
	mov	r0, r5
	bl	mutex_lock
	ldr	r2, [r4, #28]
	add	r3, r10, r10, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L950
	ldr	r2, [r4, #696]
	mov	r1, r10
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcs	.L929
	bl	__locate_dirty_segment
.L928:
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
.L907:
	ldr	r0, [r5, #12]
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	tst	r1, r7
	orr	r1, r2, r1
	strb	r1, [r0, r6, lsr #3]
	bne	.L908
	ldr	r1, [r4, #744]
	sub	r1, r1, #1
	str	r1, [r4, #744]
	b	.L908
.L903:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L932:
	mov	r3, #0
	mvn	r1, #23
	mov	r9, r3
	mvn	r8, #0
	str	r3, [sp, #12]
	b	.L904
.L949:
	mov	r1, r0
	mvn	r2, #0
	mov	r0, r4
	bl	update_sit_entry
	ldr	r1, [r4, #28]
	ldr	r0, [r4, #692]
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #16]
	ldr	r2, [r2]
	sub	fp, r5, r3
	rsb	fp, r2, fp, lsr r0
	cmn	fp, #1
	beq	.L915
	ldr	r3, [r1, #12]
	ldr	r2, [r3, #48]
	cmp	fp, r2
	beq	.L915
	ldr	r2, [r3, #112]
	cmp	fp, r2
	beq	.L915
	ldr	r2, [r3, #176]
	cmp	fp, r2
	beq	.L915
	ldr	r2, [r3, #240]
	cmp	fp, r2
	beq	.L915
	ldr	r2, [r3, #304]
	cmp	fp, r2
	beq	.L915
	ldr	r3, [r3, #368]
	cmp	fp, r3
	beq	.L915
	ldr	r5, [r1, #8]
	add	r5, r5, #36
	mov	r0, r5
	bl	mutex_lock
	ldr	r2, [r4, #28]
	add	r3, fp, fp, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L951
	ldr	r2, [r4, #696]
	mov	r1, fp
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcs	.L922
	bl	__locate_dirty_segment
.L921:
	mov	r0, r5
	bl	mutex_unlock
	b	.L915
.L948:
	orr	r2, r2, r0
	cmp	r1, #0
	strb	r2, [ip, r6, lsr #3]
	bne	.L952
	ldrh	r2, [r5, #2]
	ldr	r1, [r5, #8]
	add	r0, r2, #1
	bfi	r2, r0, #0, #10
	strh	r2, [r5, #2]	@ movhi
	ldrb	r1, [r1, r6, lsr #3]	@ zero_extendqisi2
	and	r1, r1, r7
	b	.L909
.L947:
	movw	r0, #:lower16:.LC0
	movw	r1, #1603
	str	r2, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp]
	b	.L906
.L952:
	ldr	r2, [r5, #8]
	ldrb	r1, [r2, r6, lsr #3]	@ zero_extendqisi2
	and	r1, r1, r7
	b	.L909
.L946:
	movw	r0, #:lower16:.LC0
	movw	r1, #1587
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L905
.L950:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r10, r1
	beq	.L926
	ldr	r1, [r3, #112]
	cmp	r10, r1
	beq	.L926
	ldr	r1, [r3, #176]
	cmp	r10, r1
	beq	.L926
	ldr	r1, [r3, #240]
	cmp	r10, r1
	beq	.L926
	ldr	r1, [r3, #304]
	cmp	r10, r1
	beq	.L926
	ldr	r3, [r3, #368]
	cmp	r10, r3
	beq	.L926
	ldr	r6, [r2, #8]
	mov	r0, r10
	ldr	r1, [r6, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L926
	ldr	r3, [r6, #84]
	add	r3, r3, #1
	str	r3, [r6, #84]
.L926:
	mov	r1, r10
	mov	r0, r4
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L928
.L951:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	fp, r1
	beq	.L919
	ldr	r1, [r3, #112]
	cmp	fp, r1
	beq	.L919
	ldr	r1, [r3, #176]
	cmp	fp, r1
	beq	.L919
	ldr	r1, [r3, #240]
	cmp	fp, r1
	beq	.L919
	ldr	r1, [r3, #304]
	cmp	fp, r1
	beq	.L919
	ldr	r3, [r3, #368]
	cmp	fp, r3
	beq	.L919
	ldr	r6, [r2, #8]
	mov	r0, fp
	ldr	r1, [r6, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L919
	ldr	r3, [r6, #84]
	add	r3, r3, #1
	str	r3, [r6, #84]
.L919:
	mov	r1, fp
	mov	r2, #6
	mov	r0, r4
	bl	__remove_dirty_segment
	b	.L921
.L922:
	bl	__remove_dirty_segment
	b	.L921
.L929:
	bl	__remove_dirty_segment
	b	.L928
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	r2, r1, #1
	mov	r4, r0
	strd	r6, [sp, #8]
	cmn	r2, #3
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r9, [r3]
	bhi	.L968
	ldr	r1, [r3, #4]
	add	r9, r9, #40
	mov	r10, #1
	ldr	r3, [r3, #16]
	mov	r0, r9
	ldr	r2, [r4, #692]
	ldr	fp, [r1]
	sub	r3, r6, r3
	rsb	r3, fp, r3, lsr r2
	str	r3, [sp, #20]
	bl	mutex_lock
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #692]
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r8, [r0]
	sub	r6, r6, r2
	rsb	r8, r8, r6, lsr r1
	rsbs	r1, r8, #0
	and	r0, r8, #31
	and	r1, r1, #31
	add	r2, r8, #31
	rsbpl	r0, r1, #0
	cmp	r8, #0
	movge	r2, r8
	add	r5, r8, r8, lsl r10
	asr	r2, r2, #5
	lsl	r10, r10, r0
	lsl	fp, r2, #2
	lsl	r1, r5, #3
.L966:
	ldr	r0, [r3]
	ldr	r3, [r4, #696]
	ldr	r5, [r0, #60]
	sub	r0, r3, #1
	and	r6, r6, r0
	ldrh	r7, [r5, r1]
	add	r5, r5, r1
	lsr	r7, r7, #6
	subs	r7, r7, #1
	bmi	.L956
	cmp	r3, r7
	bcc	.L956
.L957:
	ldrh	r3, [r5]
	bfi	r3, r7, #6, #10
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4, #28]
	ldr	r7, [r3]
	ldr	r1, [r7, #72]
	ldr	r3, [r7, #76]
	str	r3, [sp, #12]
	str	r1, [sp, #16]
	bl	get_seconds
	mvn	r3, r6
	ldr	ip, [r7, #80]
	ldr	lr, [r7, #84]
	and	r3, r3, #7
	mov	r7, #1
	ldr	r1, [sp, #16]
	lsl	r7, r7, r3
	ldr	r3, [sp, #12]
	subs	r2, r1, ip
	mvn	ip, r7
	sbc	r3, r3, lr
	strd	r2, [sp]
	ldrd	r2, [sp]
	adds	r2, r2, r0
	adc	r3, r3, r0, asr #31
	mov	r0, r2
	mov	r1, r3
	sxtb	r3, ip
	strd	r0, [r5, #16]
	ldr	ip, [r4, #28]
	ldr	ip, [ip]
	strd	r0, [ip, #96]
	ldr	r0, [r5, #4]
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	tst	r1, r7
	and	r1, r1, r3
	strb	r1, [r0, r6, lsr #3]
	beq	.L969
.L958:
	ldr	r1, [r4]
	ldr	r0, [r1, #208]
	ldr	r0, [r0, #88]
	ldr	r0, [r0, #492]
	ldr	r0, [r0, #556]
	tst	r0, #16384
	bne	.L959
	ldr	r1, [r1, #616]
	ldr	r1, [r1, #8]
	ldr	r1, [r1, #2180]	@ unaligned
	tst	r1, #2
	bne	.L959
.L960:
	ldr	r3, [r5, #8]
	ldrb	r3, [r3, r6, lsr #3]	@ zero_extendqisi2
	tst	r3, r7
	bne	.L961
	ldrh	r3, [r5, #2]
	ubfx	r1, r3, #0, #10
	sub	r1, r1, #1
	bfi	r3, r1, #0, #10
	strh	r3, [r5, #2]	@ movhi
.L961:
	ldr	r3, [r4, #28]
	ldr	r1, [r3]
	ldr	r0, [r1, #28]
	ldr	r3, [r0, fp]
	tst	r3, r10
	orr	r10, r3, r10
	str	r10, [r0, fp]
	bne	.L962
	ldr	r3, [r1, #32]
	add	r3, r3, #1
	str	r3, [r1, #32]
.L962:
	ldr	r3, [r4, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	str	r3, [r2, #12]
	ldr	r3, [r4, #700]
	cmp	r3, #1
	bls	.L963
	ldr	r2, [r4, #28]
	udiv	r8, r8, r3
	ldr	r3, [r2]
	ldr	r2, [r3, #64]
	ldr	r3, [r2, r8, lsl #2]
	sub	r3, r3, #1
	str	r3, [r2, r8, lsl #2]
.L963:
	ldr	r1, [sp, #20]
	mov	r0, r4
	bl	locate_dirty_segment
	mov	r0, r9
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L968:
	cmp	r1, #0
	beq	.L970
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L959:
	ldr	r1, [r5, #12]
	ldrb	r0, [r1, r6, lsr #3]	@ zero_extendqisi2
	and	r3, r3, r0
	tst	r0, r7
	strb	r3, [r1, r6, lsr #3]
	beq	.L960
	ldr	r3, [r4, #744]
	add	r3, r3, #1
	str	r3, [r4, #744]
	b	.L960
.L970:
	movw	r0, #:lower16:.LC0
	movw	r1, #1658
	movt	r0, #:upper16:.LC0
	add	r9, r9, #40
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	mov	r0, r9
	mov	fp, r6
	bl	mutex_lock
	ldr	r3, [r4, #28]
	mov	r10, r6
	mvn	r2, #0
	mov	r8, r2
	mvn	r1, #23
	str	r2, [sp, #20]
	ldr	r6, [r3, #16]
	rsb	r6, r6, #0
	b	.L966
.L956:
	movw	r0, #:lower16:.LC0
	movw	r1, #1587
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L957
.L969:
	movw	r0, #:lower16:.LC0
	movw	r1, #1624
	str	r3, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp]
	b	.L958
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
	bhi	.L972
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
.L972:
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
	ldr	r2, [r0, #368]
	cmp	r1, #0
	ldrb	r3, [r2, #176]	@ zero_extendqisi2
	bne	.L976
	cmp	r3, #1
	ldrb	r1, [r2, #177]	@ zero_extendqisi2
	ldrne	r3, [r0, #28]
	ldreq	r3, [r0, #696]
	ldrb	r2, [r2, #178]	@ zero_extendqisi2
	ldrne	r3, [r3, #12]
	ldrhne	r3, [r3, #52]
	cmp	r1, #1
	ldrne	r1, [r0, #28]
	ldreq	r1, [r0, #696]
	ldrne	r1, [r1, #12]
	ldrhne	r1, [r1, #116]
	cmp	r2, #1
	add	r3, r3, r1
	beq	.L993
	ldr	r2, [r0, #28]
	ldr	r2, [r2, #12]
	ldrh	r2, [r2, #180]
	add	r3, r2, r3
	cmp	r3, #440
	bge	.L994
.L991:
	mov	r0, #1
	bx	lr
.L993:
	ldr	r2, [r0, #696]
	add	r3, r3, r2
.L983:
	cmp	r3, #440
	blt	.L991
.L994:
	sub	r3, r3, #436
	sub	r3, r3, #3
	cmp	r3, #584
	movle	r0, #2
	movgt	r0, #3
	bx	lr
.L976:
	ldrb	r1, [r2, #177]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhne	r3, [r2, #116]	@ unaligned
	ldreq	r3, [r0, #696]
	cmp	r1, #1
	ldrhne	r1, [r2, #118]	@ unaligned
	ldreq	r1, [r0, #696]
	add	r3, r3, r1
	ldrb	r1, [r2, #178]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L993
	ldrh	r2, [r2, #120]	@ unaligned
	add	r3, r2, r3
	b	.L983
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
	beq	.L997
	mov	r1, r5
	mov	r2, #4096
	bl	memcpy
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	beq	.L996
.L1003:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1002
.L1000:
	mov	r0, r4
	bl	unlock_page
	ldr	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	put_page
.L997:
	mov	r1, #4096
	bl	__memzero
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	bne	.L1003
.L996:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1002:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1000
	.fnend
	.size	update_meta_page, .-update_meta_page
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
	mov	r4, #0
	strd	r6, [sp, #8]
	mov	r6, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
.L1012:
	ldr	ip, [r6, #28]
	mov	r2, #1
	mov	r1, r4
	mov	r0, r6
	ldr	r3, [ip, #12]
	ldr	ip, [ip]
	add	r3, r3, r4, lsl #6
	ldr	ip, [ip]
	ldr	r5, [r3, #48]
	ldr	r3, [ip]
	blx	r3
	cmn	r5, #1
	beq	.L1005
	ldr	r2, [r6, #28]
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r5, r1
	beq	.L1005
	ldr	r1, [r3, #112]
	cmp	r5, r1
	beq	.L1005
	ldr	r1, [r3, #176]
	cmp	r5, r1
	beq	.L1005
	ldr	r1, [r3, #240]
	cmp	r5, r1
	beq	.L1005
	ldr	r1, [r3, #304]
	cmp	r5, r1
	beq	.L1005
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L1005
	ldr	r7, [r2, #8]
	add	r7, r7, #36
	mov	r0, r7
	bl	mutex_lock
	ldr	r2, [r6, #28]
	add	r3, r5, r5, lsl #1
	lsl	r3, r3, #3
	ldr	r1, [r2]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	beq	.L1018
	ldr	r2, [r6, #696]
	mov	r1, r5
	mov	r0, r6
	cmp	r3, r2
	mov	r2, #6
	bcs	.L1011
	bl	__locate_dirty_segment
.L1010:
	mov	r0, r7
	bl	mutex_unlock
.L1005:
	add	r4, r4, #1
	cmp	r4, #3
	bne	.L1012
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1011:
	bl	__remove_dirty_segment
	b	.L1010
.L1018:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r5, r1
	beq	.L1008
	ldr	r1, [r3, #112]
	cmp	r5, r1
	beq	.L1008
	ldr	r1, [r3, #176]
	cmp	r5, r1
	beq	.L1008
	ldr	r1, [r3, #240]
	cmp	r5, r1
	beq	.L1008
	ldr	r1, [r3, #304]
	cmp	r5, r1
	beq	.L1008
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L1008
	ldr	r8, [r2, #8]
	mov	r0, r5
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1008
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L1008:
	mov	r1, r5
	mov	r2, #6
	mov	r0, r6
	bl	__remove_dirty_segment
	b	.L1010
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #12
	sub	sp, sp, #12
	ldrd	r0, [r1, #8]
	strd	r0, [sp]
	ldr	r0, [r3]
	add	r0, r0, #40
	bl	mutex_lock
	ldrd	r0, [r7, #8]
	ldrd	r8, [r7, #16]
	cmp	r1, r9
	cmpeq	r0, r8
	bhi	.L1020
.L1027:
	ldr	lr, [r5, #28]
	add	r3, r0, r0, lsl #1
	ldr	r6, [r5, #696]
	lsl	r3, r3, #3
	ldr	ip, [lr]
	ldr	r2, [ip, #60]
	ldrh	r10, [r2, r3]
	add	r3, r2, r3
	cmp	r6, r10, lsr #6
	beq	.L1021
	ldr	r2, [r5]
	ldr	r4, [r2, #208]
	ldr	r4, [r4, #88]
	ldr	r4, [r4, #492]
	ldr	r4, [r4, #556]
	tst	r4, #16384
	bne	.L1022
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	beq	.L1021
.L1022:
	ldr	r2, [r7]
	ldr	r4, [ip, #24]
	ldr	ip, [r3, #8]
	ands	r2, r2, #16
	bne	.L1046
	ldr	fp, [r5, #864]
	tst	fp, #4
	beq	.L1021
	bic	r10, r10, #63
	cmp	r10, #0
	beq	.L1021
	ldr	lr, [lr, #80]
	add	lr, lr, #4096
	ldr	r10, [lr, #52]
	ldr	lr, [lr, #56]
	cmp	r10, lr
	bcs	.L1021
	ldr	r3, [r3, #4]
	ldr	r1, [ip]
	ldr	r0, [r3]
	bic	r1, r1, r0
	str	r1, [r4]
	ldr	r0, [r3, #4]
	ldr	r1, [ip, #4]
	bic	r1, r1, r0
	str	r1, [r4, #4]
	ldr	r0, [r3, #8]
	ldr	r1, [ip, #8]
	bic	r1, r1, r0
	str	r1, [r4, #8]
	ldr	r0, [r3, #12]
	ldr	r1, [ip, #12]
	bic	r1, r1, r0
	str	r1, [r4, #12]
	ldr	r0, [r3, #16]
	ldr	r1, [ip, #16]
	bic	r1, r1, r0
	str	r1, [r4, #16]
	ldr	r0, [r3, #20]
	ldr	r1, [ip, #20]
	bic	r1, r1, r0
	str	r1, [r4, #20]
	ldr	r0, [r3, #24]
	ldr	r1, [ip, #24]
	bic	r1, r1, r0
	str	r1, [r4, #24]
	ldr	r0, [r3, #28]
	ldr	r1, [ip, #28]
	bic	r1, r1, r0
	str	r1, [r4, #28]
	ldr	r0, [r3, #32]
	ldr	r1, [ip, #32]
	bic	r1, r1, r0
	str	r1, [r4, #32]
	ldr	r0, [r3, #36]
	ldr	r1, [ip, #36]
	bic	r1, r1, r0
	str	r1, [r4, #36]
	ldr	r0, [r3, #40]
	ldr	r1, [ip, #40]
	bic	r1, r1, r0
	str	r1, [r4, #40]
	ldr	r0, [r3, #44]
	ldr	r1, [ip, #44]
	bic	r1, r1, r0
	str	r1, [r4, #44]
	ldr	r0, [r3, #48]
	ldr	r1, [ip, #48]
	bic	r1, r1, r0
	str	r1, [r4, #48]
	ldr	r0, [r3, #52]
	ldr	r1, [ip, #52]
	bic	r1, r1, r0
	str	r1, [r4, #52]
	ldr	r0, [r3, #56]
	ldr	r1, [ip, #56]
	bic	r1, r1, r0
	str	r1, [r4, #56]
	ldr	r1, [r3, #60]
	ldr	r3, [ip, #60]
	bic	r3, r3, r1
	str	r3, [r4, #60]
	ldr	r8, [r5, #28]
	ldr	r3, [r8, #80]
	add	r3, r3, #4096
	ldr	r1, [r3, #52]
	ldr	r3, [r3, #56]
	cmp	r3, r1
	bcc	.L1024
	mov	r1, r6
	mov	r0, r4
	bl	__find_rev_next_bit
	cmp	r6, r0
	bls	.L1024
	add	r2, r0, #1
	mov	r1, r6
	mov	r0, r4
	mov	r4, #1
	bl	__find_rev_next_zero_bit
	b	.L1025
.L1024:
	ldrd	r0, [r7, #8]
	ldrd	r8, [r7, #16]
.L1021:
	adds	r0, r0, #1
	adc	r1, r1, #0
	cmp	r1, r9
	cmpeq	r0, r8
	strd	r0, [r7, #8]
	bls	.L1027
.L1020:
	ldr	r8, [r5, #28]
	mov	r4, #0
.L1025:
	ldr	r0, [r8]
	add	r0, r0, #40
	bl	mutex_unlock
	ldrd	r2, [sp]
	mov	r0, r4
	strd	r2, [r7, #8]
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1046:
	ldr	r3, [r3, #12]
	mvn	r0, #0
	ldr	r1, [ip]
	ldr	r2, [r3]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4]
	ldr	r2, [r3, #4]
	ldr	r1, [ip, #4]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #4]
	ldr	r1, [r3, #8]
	ldr	r2, [ip, #8]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #8]
	ldr	r1, [r3, #12]
	ldr	r2, [ip, #12]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #12]
	ldr	r1, [r3, #16]
	ldr	r2, [ip, #16]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #16]
	ldr	r1, [r3, #20]
	ldr	r2, [ip, #20]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #20]
	ldr	r1, [r3, #24]
	ldr	r2, [ip, #24]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #24]
	ldr	r1, [r3, #28]
	ldr	r2, [ip, #28]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #28]
	ldr	r1, [r3, #32]
	ldr	r2, [ip, #32]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #32]
	ldr	r1, [r3, #36]
	ldr	r2, [ip, #36]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #36]
	ldr	r2, [ip, #40]
	ldr	r1, [r3, #40]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #40]
	ldr	r1, [r3, #44]
	ldr	r2, [ip, #44]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #44]
	ldr	r1, [r3, #48]
	ldr	r2, [ip, #48]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #48]
	ldr	r1, [r3, #52]
	ldr	r2, [ip, #52]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #52]
	ldr	r1, [r3, #56]
	ldr	r2, [ip, #56]
	orr	r2, r2, r1
	mvn	r2, r2
	str	r2, [r4, #56]
	ldr	r3, [r3, #60]
	ldr	r1, [ip, #60]
	orr	r3, r1, r3
	mvn	r3, r3
	str	r3, [r4, #60]
.L1031:
	add	r2, r0, #1
	mov	r1, r6
	mov	r0, r4
	bl	__find_rev_next_bit
	mov	r8, r0
	mov	r1, r6
	cmp	r6, r8
	mov	r0, r4
	add	r2, r8, #1
	bls	.L1024
	bl	__find_rev_next_zero_bit
	cmp	r8, #0
	cmpne	r6, r0
	sub	r3, r0, r8
	mov	r9, #0
	beq	.L1033
	ldrd	r10, [r7, #24]
	cmp	r9, fp
	cmpeq	r3, r10
	bcc	.L1031
.L1033:
	mov	r4, #1
	ldr	r8, [r5, #28]
	b	.L1025
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
	bls	.L1064
	ldr	r8, [r0, #676]
	mov	r9, #0
	cmp	fp, r9
	cmpeq	r10, r8
	bcc	.L1064
	mov	r4, r0
	mov	r5, r1
	mov	r0, #0
	mov	r1, #0
	strd	r0, [sp, #32]
	ldr	r0, [ip, #20]
	mov	r1, #0
	cmp	r1, r7
	cmpeq	r0, r6
	bcc	.L1049
.L1056:
	mov	r2, #0
	mov	r3, r2
	mov	r9, r2
.L1050:
	strd	r2, [r5, #8]
.L1047:
	mov	r0, r9
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1049:
	ldr	r8, [r4, #16]
	ubfx	r8, r8, #2, #1
	cmp	r8, #0
	bne	.L1072
	cmp	r1, r3
	ldr	r1, [ip, #16]
	cmpeq	r0, r2
	movcs	r0, r8
	bcs	.L1052
	orrs	r0, r2, r3
	mvneq	r0, #0
	beq	.L1052
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
.L1052:
	ldr	r2, [ip, #28]
	mov	r3, #0
	cmp	r3, r7
	add	r2, r1, r2, lsl lr
	cmpeq	r2, r6
	bls	.L1073
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
.L1054:
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
	bhi	.L1056
	ldr	r2, [r4, #744]
	mov	r8, #0
	str	r0, [sp, #8]
	str	r8, [sp, #12]
	cmp	r2, r8
	beq	.L1056
	add	r7, r4, #868
	b	.L1057
.L1061:
	bl	schedule
	ldr	r0, [sp, #16]
	add	r0, r0, #1
	cmp	r6, r0
	bcc	.L1071
	ldr	r2, [r4, #744]
	str	r0, [sp, #8]
	str	r9, [sp, #12]
	cmp	r2, #0
	beq	.L1071
	ldr	ip, [r4, #28]
	ldr	lr, [r4, #692]
.L1057:
	ldr	r3, [ip, #48]
	mov	ip, r6
	ldr	r1, [r4, #700]
	mul	r3, r3, r1
	add	r0, r3, r0
	cmp	r2, r3, lsl lr
	sub	r3, r0, #1
	bcc	.L1060
	udiv	r2, r0, r1
	mls	r0, r1, r2, r0
	sub	r0, r3, r0
	cmp	r0, r6
	movcc	ip, r0
	movcs	ip, r6
.L1060:
	mov	r0, r7
	str	ip, [sp, #16]
	str	r8, [sp, #20]
	bl	mutex_lock
	mov	r1, sp
	mov	r0, r4
	bl	write_checkpoint
	mov	r9, r0
	mov	r0, r7
	bl	mutex_unlock
	cmp	r9, #0
	beq	.L1061
.L1071:
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
	b	.L1050
.L1073:
	ldr	r6, [ip, #32]
	sub	r6, r6, #1
	b	.L1054
.L1072:
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
	b	.L1050
.L1064:
	mvn	r9, #21
	b	.L1047
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
	mov	r9, r3
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	ldr	fp, [sp, #48]
	stm	sp, {r1, r2}
	ldr	r1, [r0, #28]
	ldr	r7, [sp, #52]
	ldr	r10, [r1]
	ldr	r5, [r1, #12]
	lsl	r6, r7, #6
	add	r8, r10, #40
	add	r5, r5, r6
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r8
	bl	mutex_lock
	ldr	r1, [r4, #28]
	mov	r0, r4
	ldrh	r3, [r5, #52]
	ldr	ip, [r5, #48]
	ldr	lr, [r4, #692]
	ldr	r2, [r1, #4]
	ldr	r1, [r1, #16]
	ldr	r2, [r2]
	add	r3, r3, r1
	add	r2, r2, ip
	add	r3, r3, r2, lsl lr
	mov	r1, r3
	str	r3, [r9]
	bl	f2fs_wait_discard_bio
	ldr	r3, [r4, #28]
	ldr	r1, [fp]	@ unaligned
	ldr	r2, [r3, #12]
	add	r2, r2, r6
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
	beq	.L1087
	ldrh	r2, [r5, #52]
	add	r2, r2, #1
	strh	r2, [r5, #52]	@ movhi
.L1076:
	add	r3, r4, r3, lsl #2
	ldr	r2, [r3, #920]
	add	r2, r2, #1
	str	r2, [r3, #920]
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #696]
	ldr	r3, [r3, #12]
	add	r6, r3, r6
	ldrh	r3, [r6, #52]
	cmp	r3, r2
	bcc	.L1077
	ldr	r3, [r10]
	mov	r2, #0
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r3]
	blx	r3
.L1077:
	mov	r0, r4
	ldr	r2, [r9]
	ldr	r1, [sp, #4]
	bl	refresh_sit_entry
	mov	r0, r8
	bl	mutex_unlock
	ldr	r3, [sp]
	cmp	r3, #0
	cmpne	r7, #2
	bgt	.L1088
.L1078:
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
.L1088:
	mov	r0, r3
	ldr	r3, [r3, #4]
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
	beq	.L1079
	ldr	r1, [r6, #164]	@ unaligned
	ldr	r1, [r6, r1]
	orr	r3, r1, r3
.L1079:
	str	r2, [r0, #4084]	@ unaligned
	str	r3, [r0, #4088]	@ unaligned
	str	r4, [r0, #4092]	@ unaligned
	b	.L1078
.L1087:
	ldr	r3, [r4, #28]
	ldr	ip, [r5, #48]
	ldrh	r2, [r5, #52]
	ldr	r3, [r3]
	add	r1, ip, ip, lsl #1
	add	r2, r2, #1
	ldr	ip, [r3, #60]
	ldr	r3, [r3, #24]
	add	ip, ip, r1, lsl #3
	mov	r0, r3
	ldmib	ip, {r1, ip}
	ldr	fp, [ip]
	ldr	lr, [r1]
	orr	lr, lr, fp
	str	lr, [r3]
	ldr	fp, [r1, #4]
	ldr	lr, [ip, #4]
	orr	lr, lr, fp
	str	lr, [r3, #4]
	ldr	fp, [r1, #8]
	ldr	lr, [ip, #8]
	orr	lr, lr, fp
	str	lr, [r3, #8]
	ldr	fp, [r1, #12]
	ldr	lr, [ip, #12]
	orr	lr, lr, fp
	str	lr, [r3, #12]
	ldr	fp, [r1, #16]
	ldr	lr, [ip, #16]
	orr	lr, lr, fp
	str	lr, [r3, #16]
	ldr	fp, [r1, #20]
	ldr	lr, [ip, #20]
	orr	lr, lr, fp
	str	lr, [r3, #20]
	ldr	fp, [r1, #24]
	ldr	lr, [ip, #24]
	orr	lr, lr, fp
	str	lr, [r3, #24]
	ldr	fp, [r1, #28]
	ldr	lr, [ip, #28]
	orr	lr, lr, fp
	str	lr, [r3, #28]
	ldr	lr, [ip, #32]
	ldr	fp, [r1, #32]
	orr	lr, lr, fp
	str	lr, [r3, #32]
	ldr	fp, [r1, #36]
	ldr	lr, [ip, #36]
	orr	lr, lr, fp
	str	lr, [r3, #36]
	ldr	fp, [r1, #40]
	ldr	lr, [ip, #40]
	orr	lr, lr, fp
	str	lr, [r3, #40]
	ldr	fp, [r1, #44]
	ldr	lr, [ip, #44]
	orr	lr, lr, fp
	str	lr, [r3, #44]
	ldr	fp, [r1, #48]
	ldr	lr, [ip, #48]
	orr	lr, lr, fp
	str	lr, [r3, #48]
	ldr	fp, [r1, #52]
	ldr	lr, [ip, #52]
	orr	lr, lr, fp
	str	lr, [r3, #52]
	ldr	fp, [r1, #56]
	ldr	lr, [ip, #56]
	orr	lr, lr, fp
	str	lr, [r3, #56]
	ldr	ip, [ip, #60]
	ldr	r1, [r1, #60]
	orr	r1, ip, r1
	str	r1, [r3, #60]
	ldr	r1, [r4, #696]
	bl	__find_rev_next_zero_bit
	strh	r0, [r5, #52]	@ movhi
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	b	.L1076
	.fnend
	.size	allocate_data_block, .-allocate_data_block
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1, #4]
	ldr	r5, [r1, #24]
	str	r0, [sp, #8]
	ldr	r3, [r5, #4]
	ldr	r3, [r3]
	ldr	r2, [r3, #28]
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #728]
	cmp	r2, #2
	str	r2, [sp, #4]
	beq	.L1094
	cmp	r2, #4
	bne	.L1147
	cmp	r4, #0
	bne	.L1098
	ldrh	r3, [r3]
	and	r3, r3, #61440
	cmp	r3, #16384
	moveq	r3, r4
	movne	r3, #2
	moveq	r7, r4
	movne	r7, #128
	str	r3, [sp, #4]
.L1096:
	mov	r3, #0
	str	r3, [sp, #12]
.L1118:
	add	r3, r4, r4, lsl #2
	ldr	r0, [r6]
	lsl	r3, r3, #2
	add	r3, r3, #320
	add	r0, r0, r3
	bl	mutex_lock
.L1109:
	ldr	fp, [r6, #20]
	b	.L1116
.L1113:
	mov	r0, r5
	bl	mutex_unlock
	mov	r0, r6
	bl	f2fs_submit_page_mbio
	cmn	r0, #11
	bne	.L1115
	ldr	fp, [r6, #16]
	str	fp, [r6, #20]
.L1116:
	ldr	r4, [r6]
	ldr	r3, [r6, #24]
	str	r3, [sp]
	ldr	r3, [r4, #28]
	ldr	r9, [r3]
	ldr	r5, [r3, #12]
	add	r8, r9, #40
	add	r5, r5, r7
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [r4, #28]
	mov	r0, r4
	ldrh	r1, [r5, #52]
	ldr	ip, [r5, #48]
	ldr	lr, [r4, #692]
	ldr	r2, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r2, [r2]
	add	r3, r1, r3
	add	r2, r2, ip
	add	lr, r3, r2, lsl lr
	mov	r1, lr
	str	lr, [r6, #16]
	bl	f2fs_wait_discard_bio
	ldr	r3, [r4, #28]
	mov	r1, #0	@ movhi
	ldr	ip, [sp, #8]
	ldr	r2, [r3, #12]
	add	r2, r2, r7
	ldrh	r3, [r2, #52]
	ldr	r0, [r2, #20]
	rsb	r3, r3, r3, lsl #3
	add	r2, r0, r3
	str	ip, [r0, r3]	@ unaligned
	mov	r3, #0
	strb	r3, [r2, #4]
	strh	r1, [r2, #5]	@ unaligned
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1148
	ldrh	r2, [r5, #52]
	add	r2, r2, #1
	strh	r2, [r5, #52]	@ movhi
.L1111:
	add	r3, r4, r3, lsl #2
	ldr	r2, [r3, #920]
	add	r2, r2, #1
	str	r2, [r3, #920]
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #696]
	ldr	r3, [r3, #12]
	add	r3, r3, r7
	ldrh	r3, [r3, #52]
	cmp	r3, r2
	bcc	.L1112
	ldr	r3, [r9]
	mov	r2, #0
	mov	r0, r4
	ldr	r1, [sp, #4]
	ldr	r3, [r3]
	blx	r3
.L1112:
	ldr	r2, [r6, #16]
	mov	r1, fp
	mov	r0, r4
	bl	refresh_sit_entry
	mov	r0, r8
	bl	mutex_unlock
	ldr	r2, [sp]
	ldr	r3, [sp, #12]
	cmp	r2, #0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1113
	ldr	r3, [r2, #4]
	mov	r0, r2
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #692]
	ldr	ip, [r5, #48]
	ldr	r8, [r3]
	ldr	r3, [r2, #4]
	ldr	lr, [r2, #16]
	ldrh	r4, [r5, #52]
	ldr	r2, [r8, #28]
	ldr	r3, [r3]
	add	r4, r4, lr
	ldr	r2, [r2, #616]
	add	r3, r3, ip
	add	r4, r4, r3, lsl r1
	ldr	r8, [r2, #368]
	bl	page_address
	ldr	r1, [r8, #132]	@ unaligned
	ldr	r2, [r8]	@ unaligned
	ldr	r3, [r8, #4]	@ unaligned
	tst	r1, #64
	beq	.L1114
	ldr	r1, [r8, #164]	@ unaligned
	ldr	r1, [r8, r1]
	orr	r3, r1, r3
.L1114:
	str	r2, [r0, #4084]	@ unaligned
	str	r3, [r0, #4088]	@ unaligned
	str	r4, [r0, #4092]	@ unaligned
	b	.L1113
.L1147:
	cmp	r2, #6
	bne	.L1149
.L1103:
	cmp	r4, #0
	bne	.L1104
	ldr	r3, [r5]
	ldr	r4, [r6, #4]
	ubfx	r3, r3, #8, #1
	cmp	r3, #0
	bne	.L1121
	ldr	r2, [r5, #4]
	ldr	r1, [r2]
	ldrb	r2, [r1, #340]	@ zero_extendqisi2
	ands	r2, r2, #1
	bne	.L1122
	ldr	r3, [r1, #356]
	str	r2, [sp, #12]
	mvn	r3, r3, lsr #24
	and	r3, r3, #1
	lsl	r7, r3, #6
	str	r3, [sp, #4]
.L1097:
	cmp	r4, #1
	bhi	.L1109
	b	.L1118
.L1148:
	ldr	r3, [r4, #28]
	ldr	ip, [r5, #48]
	ldrh	r2, [r5, #52]
	ldr	r3, [r3]
	add	r1, ip, ip, lsl #1
	add	r2, r2, #1
	ldr	ip, [r3, #60]
	ldr	r3, [r3, #24]
	add	ip, ip, r1, lsl #3
	mov	r0, r3
	ldmib	ip, {r1, ip}
	ldr	r10, [r1]
	ldr	lr, [ip]
	orr	lr, lr, r10
	str	lr, [r3]
	ldr	r10, [r1, #4]
	ldr	lr, [ip, #4]
	orr	lr, lr, r10
	str	lr, [r3, #4]
	ldr	r10, [r1, #8]
	ldr	lr, [ip, #8]
	orr	lr, lr, r10
	str	lr, [r3, #8]
	ldr	r10, [r1, #12]
	ldr	lr, [ip, #12]
	orr	lr, lr, r10
	str	lr, [r3, #12]
	ldr	r10, [r1, #16]
	ldr	lr, [ip, #16]
	orr	lr, lr, r10
	str	lr, [r3, #16]
	ldr	r10, [r1, #20]
	ldr	lr, [ip, #20]
	orr	lr, lr, r10
	str	lr, [r3, #20]
	ldr	r10, [r1, #24]
	ldr	lr, [ip, #24]
	orr	lr, lr, r10
	str	lr, [r3, #24]
	ldr	r10, [r1, #28]
	ldr	lr, [ip, #28]
	orr	lr, lr, r10
	str	lr, [r3, #28]
	ldr	lr, [ip, #32]
	ldr	r10, [r1, #32]
	orr	lr, lr, r10
	str	lr, [r3, #32]
	ldr	r10, [r1, #36]
	ldr	lr, [ip, #36]
	orr	lr, lr, r10
	str	lr, [r3, #36]
	ldr	r10, [r1, #40]
	ldr	lr, [ip, #40]
	orr	lr, lr, r10
	str	lr, [r3, #40]
	ldr	r10, [r1, #44]
	ldr	lr, [ip, #44]
	orr	lr, lr, r10
	str	lr, [r3, #44]
	ldr	r10, [r1, #48]
	ldr	lr, [ip, #48]
	orr	lr, lr, r10
	str	lr, [r3, #48]
	ldr	r10, [r1, #52]
	ldr	lr, [ip, #52]
	orr	lr, lr, r10
	str	lr, [r3, #52]
	ldr	r10, [r1, #56]
	ldr	lr, [ip, #56]
	orr	lr, lr, r10
	str	lr, [r3, #56]
	ldr	ip, [ip, #60]
	ldr	r1, [r1, #60]
	orr	r1, ip, r1
	str	r1, [r3, #60]
	ldr	r1, [r4, #696]
	bl	__find_rev_next_zero_bit
	strh	r0, [r5, #52]	@ movhi
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	b	.L1111
.L1115:
	ldr	r3, [r6, #4]
	cmp	r3, #1
	bls	.L1150
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1094:
	cmp	r4, #0
	moveq	r7, r4
	streq	r4, [sp, #4]
	beq	.L1096
	mov	r3, #1
	mov	r7, #192
	str	r3, [sp, #12]
	mov	r3, #3
	str	r3, [sp, #4]
	b	.L1097
.L1150:
	add	r3, r3, r3, lsl #2
	ldr	r0, [r6]
	lsl	r3, r3, #2
	add	r3, r3, #320
	add	r0, r0, r3
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L1121:
	mov	r3, #0
	mov	r7, #128
	str	r3, [sp, #12]
	mov	r3, #2
	str	r3, [sp, #4]
	b	.L1097
.L1104:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L1105
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L1107
	cmp	r3, r1
	bls	.L1105
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
	beq	.L1107
.L1105:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	ldr	r4, [r6, #4]
	tst	r3, #1
	mov	r3, #1
	movne	r7, #256
	moveq	r7, #192
	str	r3, [sp, #12]
	movne	r3, #4
	moveq	r3, #3
	str	r3, [sp, #4]
	b	.L1097
.L1098:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L1099
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L1107
	cmp	r3, r1
	bls	.L1099
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
	beq	.L1107
.L1099:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	ldr	r4, [r6, #4]
	tst	r3, #1
	mov	r3, #1
	movne	r7, #256
	str	r3, [sp, #12]
	bne	.L1097
.L1146:
	mov	r3, #5
	mov	r7, #320
	str	r3, [sp, #4]
	b	.L1097
.L1107:
	mov	r3, #1
	ldr	r4, [r6, #4]
	str	r3, [sp, #12]
	b	.L1146
.L1122:
	str	r3, [sp, #12]
	mov	r3, #2
	mov	r7, #128
	str	r3, [sp, #4]
	b	.L1097
.L1149:
	movw	r0, #:lower16:.LC0
	movw	r1, #2237
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1103
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
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #24]
	.pad #52
	sub	sp, sp, #52
	ldr	r4, [r1]
	str	r0, [sp, #28]
	cmp	r3, #0
	beq	.L1208
.L1152:
	mov	r0, r4
	ldr	r4, [sp, #28]
	add	r2, sp, #32
	ldr	r1, [r4, #12]
	bl	get_node_info
	mov	r3, r4
	ldr	r5, [r6, #24]
	ldrh	r3, [r3, #16]
	ldr	r2, [r4, #12]
	ldr	r4, [r6, #4]
	str	r3, [sp, #20]
	ldr	r3, [r5, #4]
	str	r2, [sp, #12]
	ldrb	r2, [sp, #44]	@ zero_extendqisi2
	ldr	r3, [r3]
	str	r2, [sp, #16]
	ldr	r2, [r3, #28]
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #728]
	cmp	r2, #2
	str	r2, [sp, #8]
	beq	.L1154
	cmp	r2, #4
	bne	.L1209
	cmp	r4, #0
	bne	.L1158
	ldrh	r3, [r3]
	and	r3, r3, #61440
	cmp	r3, #16384
	moveq	r3, r4
	movne	r3, #2
	moveq	r7, r4
	movne	r7, #128
	str	r3, [sp, #8]
.L1156:
	mov	r3, #0
	str	r3, [sp, #24]
.L1178:
	add	r3, r4, r4, lsl #2
	ldr	r0, [r6]
	lsl	r3, r3, #2
	add	r3, r3, #320
	add	r0, r0, r3
	bl	mutex_lock
.L1169:
	ldr	fp, [r6, #20]
	b	.L1176
.L1173:
	mov	r0, r5
	bl	mutex_unlock
	mov	r0, r6
	bl	f2fs_submit_page_mbio
	cmn	r0, #11
	bne	.L1175
	ldr	fp, [r6, #16]
	str	fp, [r6, #20]
.L1176:
	ldr	r4, [r6]
	ldr	r3, [r6, #24]
	str	r3, [sp, #4]
	ldr	r3, [r4, #28]
	ldr	r9, [r3]
	ldr	r5, [r3, #12]
	add	r8, r9, #40
	add	r5, r5, r7
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [r4, #28]
	mov	r0, r4
	ldrh	r1, [r5, #52]
	ldr	ip, [r5, #48]
	ldr	lr, [r4, #692]
	ldr	r2, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r2, [r2]
	add	r3, r1, r3
	add	r2, r2, ip
	add	lr, r3, r2, lsl lr
	mov	r1, lr
	str	lr, [r6, #16]
	bl	f2fs_wait_discard_bio
	ldr	r3, [r4, #28]
	ldr	r0, [sp, #12]
	ldr	r2, [r3, #12]
	add	r2, r2, r7
	ldrh	r3, [r2, #52]
	ldr	r1, [r2, #20]
	rsb	r3, r3, r3, lsl #3
	add	r2, r1, r3
	str	r0, [r1, r3]	@ unaligned
	ldr	r3, [sp, #16]
	strb	r3, [r2, #4]
	ldr	r3, [sp, #20]
	strh	r3, [r2, #5]	@ unaligned
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1210
	ldrh	r2, [r5, #52]
	add	r2, r2, #1
	strh	r2, [r5, #52]	@ movhi
.L1171:
	add	r3, r4, r3, lsl #2
	ldr	r2, [r3, #920]
	add	r2, r2, #1
	str	r2, [r3, #920]
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #696]
	ldr	r3, [r3, #12]
	add	r3, r3, r7
	ldrh	r3, [r3, #52]
	cmp	r3, r2
	bcc	.L1172
	ldr	r3, [r9]
	mov	r2, #0
	mov	r0, r4
	ldr	r1, [sp, #8]
	ldr	r3, [r3]
	blx	r3
.L1172:
	ldr	r2, [r6, #16]
	mov	r1, fp
	mov	r0, r4
	bl	refresh_sit_entry
	mov	r0, r8
	bl	mutex_unlock
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #24]
	cmp	r2, #0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1173
	ldr	r3, [r2, #4]
	mov	r0, r2
	ldr	r2, [r4, #28]
	ldrh	lr, [r5, #52]
	ldr	r8, [r5, #48]
	ldr	ip, [r3]
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #16]
	ldr	r1, [r4, #692]
	ldr	ip, [ip, #28]
	ldr	r3, [r3]
	add	r2, lr, r2
	ldr	ip, [ip, #616]
	add	r8, r3, r8
	add	r8, r2, r8, lsl r1
	ldr	r4, [ip, #368]
	bl	page_address
	ldr	r1, [r4, #132]	@ unaligned
	ldr	r2, [r4]	@ unaligned
	ldr	r3, [r4, #4]	@ unaligned
	tst	r1, #64
	beq	.L1174
	ldr	r1, [r4, #164]	@ unaligned
	ldr	r1, [r4, r1]
	orr	r3, r1, r3
.L1174:
	str	r2, [r0, #4084]	@ unaligned
	str	r3, [r0, #4088]	@ unaligned
	str	r8, [r0, #4092]	@ unaligned
	b	.L1173
.L1209:
	cmp	r2, #6
	bne	.L1211
.L1163:
	cmp	r4, #0
	bne	.L1164
	ldr	r3, [r5]
	ldr	r4, [r6, #4]
	ubfx	r3, r3, #8, #1
	cmp	r3, #0
	bne	.L1181
	ldr	r2, [r5, #4]
	ldr	r1, [r2]
	ldrb	r2, [r1, #340]	@ zero_extendqisi2
	ands	r2, r2, #1
	bne	.L1182
	ldr	r3, [r1, #356]
	str	r2, [sp, #24]
	mvn	r3, r3, lsr #24
	and	r3, r3, #1
	lsl	r7, r3, #6
	str	r3, [sp, #8]
.L1157:
	cmp	r4, #1
	bhi	.L1169
	b	.L1178
.L1210:
	ldr	r3, [r4, #28]
	ldr	ip, [r5, #48]
	ldrh	r2, [r5, #52]
	ldr	r3, [r3]
	add	r1, ip, ip, lsl #1
	add	r2, r2, #1
	ldr	ip, [r3, #60]
	ldr	r3, [r3, #24]
	add	ip, ip, r1, lsl #3
	mov	r0, r3
	ldmib	ip, {r1, ip}
	ldr	r10, [r1]
	ldr	lr, [ip]
	orr	lr, lr, r10
	str	lr, [r3]
	ldr	r10, [r1, #4]
	ldr	lr, [ip, #4]
	orr	lr, lr, r10
	str	lr, [r3, #4]
	ldr	r10, [r1, #8]
	ldr	lr, [ip, #8]
	orr	lr, lr, r10
	str	lr, [r3, #8]
	ldr	r10, [r1, #12]
	ldr	lr, [ip, #12]
	orr	lr, lr, r10
	str	lr, [r3, #12]
	ldr	r10, [r1, #16]
	ldr	lr, [ip, #16]
	orr	lr, lr, r10
	str	lr, [r3, #16]
	ldr	r10, [r1, #20]
	ldr	lr, [ip, #20]
	orr	lr, lr, r10
	str	lr, [r3, #20]
	ldr	r10, [r1, #24]
	ldr	lr, [ip, #24]
	orr	lr, lr, r10
	str	lr, [r3, #24]
	ldr	r10, [r1, #28]
	ldr	lr, [ip, #28]
	orr	lr, lr, r10
	str	lr, [r3, #28]
	ldr	lr, [ip, #32]
	ldr	r10, [r1, #32]
	orr	lr, lr, r10
	str	lr, [r3, #32]
	ldr	r10, [r1, #36]
	ldr	lr, [ip, #36]
	orr	lr, lr, r10
	str	lr, [r3, #36]
	ldr	r10, [r1, #40]
	ldr	lr, [ip, #40]
	orr	lr, lr, r10
	str	lr, [r3, #40]
	ldr	r10, [r1, #44]
	ldr	lr, [ip, #44]
	orr	lr, lr, r10
	str	lr, [r3, #44]
	ldr	r10, [r1, #48]
	ldr	lr, [ip, #48]
	orr	lr, lr, r10
	str	lr, [r3, #48]
	ldr	r10, [r1, #52]
	ldr	lr, [ip, #52]
	orr	lr, lr, r10
	str	lr, [r3, #52]
	ldr	r10, [r1, #56]
	ldr	lr, [ip, #56]
	orr	lr, lr, r10
	str	lr, [r3, #56]
	ldr	ip, [ip, #60]
	ldr	r1, [r1, #60]
	orr	r1, ip, r1
	str	r1, [r3, #60]
	ldr	r1, [r4, #696]
	bl	__find_rev_next_zero_bit
	strh	r0, [r5, #52]	@ movhi
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	b	.L1171
.L1175:
	ldr	r3, [r6, #4]
	cmp	r3, #1
	bls	.L1212
.L1177:
	ldr	r1, [r6, #16]
	ldr	r0, [sp, #28]
	bl	f2fs_update_data_blkaddr
	add	sp, sp, #52
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1154:
	cmp	r4, #0
	moveq	r7, r4
	streq	r4, [sp, #8]
	beq	.L1156
	mov	r3, #1
	mov	r7, #192
	str	r3, [sp, #24]
	mov	r3, #3
	str	r3, [sp, #8]
	b	.L1157
.L1212:
	add	r3, r3, r3, lsl #2
	ldr	r0, [r6]
	lsl	r3, r3, #2
	add	r3, r3, #320
	add	r0, r0, r3
	bl	mutex_unlock
	b	.L1177
.L1181:
	mov	r3, #0
	mov	r7, #128
	str	r3, [sp, #24]
	mov	r3, #2
	str	r3, [sp, #8]
	b	.L1157
.L1164:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L1165
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L1167
	cmp	r3, r1
	bls	.L1165
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
	beq	.L1167
.L1165:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	ldr	r4, [r6, #4]
	tst	r3, #1
	mov	r3, #1
	movne	r7, #256
	moveq	r7, #192
	str	r3, [sp, #24]
	movne	r3, #4
	moveq	r3, #3
	str	r3, [sp, #8]
	b	.L1157
.L1158:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L1159
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L1167
	cmp	r3, r1
	bls	.L1159
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
	beq	.L1167
.L1159:
	mov	r0, r5
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	ldr	r4, [r6, #4]
	tst	r3, #1
	mov	r3, #1
	movne	r7, #256
	str	r3, [sp, #24]
	bne	.L1157
.L1207:
	mov	r3, #5
	mov	r7, #320
	str	r3, [sp, #8]
	b	.L1157
.L1208:
	movw	r0, #:lower16:.LC0
	movw	r1, #2338
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1152
.L1167:
	mov	r3, #1
	ldr	r4, [r6, #4]
	str	r3, [sp, #24]
	b	.L1207
.L1182:
	str	r3, [sp, #24]
	mov	r3, #2
	mov	r7, #128
	str	r3, [sp, #8]
	b	.L1157
.L1211:
	movw	r0, #:lower16:.LC0
	movw	r1, #2237
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1163
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
	mov	r7, r3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	r10, r2
	sub	fp, r3, #1
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	ldr	r0, [r0, #28]
	ldrb	r2, [sp, #68]	@ zero_extendqisi2
	cmn	fp, #3
	mov	r3, r1
	ldrb	r8, [sp, #64]	@ zero_extendqisi2
	mvnhi	r1, #0
	ldr	r6, [r0]
	str	r2, [sp, #4]
	mvnhi	r2, #23
	bhi	.L1215
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	ip, [r4, #692]
	ldr	r1, [r1]
	sub	r2, r7, r2
	rsb	r1, r1, r2, lsr ip
	add	r2, r1, r1, lsl #1
	lsl	r2, r2, #3
.L1215:
	ldr	ip, [r6, #60]
	cmp	r8, #0
	ldr	r5, [r0, #12]
	ldrb	r0, [ip, r2]	@ zero_extendqisi2
	and	r0, r0, #63
	str	r0, [sp]
	bne	.L1216
	ldrh	r2, [ip, r2]
	bic	r2, r2, #63
	cmp	r2, #0
	lslne	r2, r0, #6
	beq	.L1254
.L1218:
	add	r5, r5, r2
	add	r6, r6, #40
	str	r2, [sp, #8]
	mov	r0, r5
	str	r1, [sp, #12]
	str	r3, [sp, #16]
	bl	mutex_lock
	mov	r0, r6
	bl	mutex_lock
	ldr	r9, [r5, #48]
	ldr	r1, [sp, #12]
	ldrh	r3, [r5, #52]
	ldr	r2, [sp, #8]
	cmp	r1, r9
	str	r3, [sp, #20]
	ldr	r3, [sp, #16]
	beq	.L1230
	str	r1, [r5, #60]
	mov	r0, r4
	ldr	r1, [sp]
	str	r3, [sp, #12]
	bl	change_curseg.constprop.11
	ldrd	r2, [sp, #8]
.L1230:
	ldr	r1, [r4, #28]
	eor	r0, r8, #1
	ldr	ip, [sp, #4]
	ldr	r1, [r1, #16]
	orrs	r0, r0, ip
	ldr	r0, [r4, #696]
	sub	r1, r7, r1
	sub	r0, r0, #1
	and	r1, r1, r0
	strh	r1, [r5, #52]	@ movhi
	ldr	r1, [r4, #28]
	ldr	r0, [r3]	@ unaligned
	ldr	r1, [r1, #12]
	add	r1, r1, r2
	ldrh	r2, [r1, #52]
	ldr	ip, [r1, #20]
	rsb	r2, r2, r2, lsl #3
	add	r1, ip, r2
	str	r0, [ip, r2]	@ unaligned
	ldrh	r2, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r2, [r1, #4]	@ unaligned
	strb	r3, [r1, #6]
	bne	.L1255
.L1231:
	sub	r3, r10, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L1232
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r3, r10, r3
	rsb	r1, r1, r3, lsr r2
	cmn	r1, #1
	bne	.L1256
.L1232:
	mov	r0, r4
	bl	locate_dirty_segment
	cmn	fp, #3
	mvnhi	r1, #0
	bhi	.L1234
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r7, r7, r3
	rsb	r1, r1, r7, lsr r2
.L1234:
	mov	r0, r4
	bl	locate_dirty_segment
	mov	r1, r9
	mov	r0, r4
	bl	locate_dirty_segment
	cmp	r8, #0
	beq	.L1235
	ldr	r3, [r5, #48]
	cmp	r3, r9
	bne	.L1257
.L1236:
	ldr	r3, [sp, #20]
	strh	r3, [r5, #52]	@ movhi
.L1235:
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
.L1216:
	ldr	r2, [r5, #48]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #112]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #176]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #240]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #304]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #368]
	cmp	r2, r1
	movne	r0, #1
	movne	r2, #64
	strne	r0, [sp]
	bne	.L1218
.L1253:
	lsl	r2, r0, #6
	b	.L1218
.L1257:
	mov	r0, r4
	ldr	r1, [sp]
	str	r9, [r5, #60]
	bl	change_curseg.constprop.11
	b	.L1236
.L1254:
	ldr	r2, [r5, #48]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #112]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #176]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #240]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #304]
	cmp	r2, r1
	beq	.L1253
	ldr	r2, [r5, #368]
	cmp	r2, r1
	beq	.L1253
	cmp	r10, #0
	moveq	r0, #2
	movne	r0, #1
	moveq	r2, #128
	movne	r2, #64
	str	r0, [sp]
	b	.L1218
.L1256:
	mov	r1, r10
	mvn	r2, #0
	mov	r0, r4
	bl	update_sit_entry
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r10, r10, r3
	rsb	r1, r1, r10, lsr r2
	b	.L1232
.L1255:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	update_sit_entry
	b	.L1231
	.fnend
	.size	__f2fs_replace_block, .-__f2fs_replace_block
	.align	2
	.global	commit_inmem_pages
	.syntax unified
	.arm
	.fpu softvfp
	.type	commit_inmem_pages, %function
commit_inmem_pages:
	.fnstart
	@ args = 0, pretend = 0, frame = 120
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
	.pad #132
	sub	sp, sp, #132
	add	fp, sp, #68
	str	r2, [sp, #40]
	str	fp, [sp, #68]
	ldr	r0, [r3, #616]
	str	fp, [sp, #72]
	add	r3, r0, #404
	mov	r4, r3
	str	r3, [sp, #32]
	bl	f2fs_balance_fs
	mov	r0, r4
	bl	down_read
	ldr	r3, [r7, #356]
	tst	r3, #65536
	beq	.L1340
.L1259:
	add	r3, r7, #432
	mov	r0, r3
	str	r3, [sp, #28]
	bl	mutex_lock
	ldr	ip, [r7, #28]
	mov	lr, r7
	mov	r2, #0
	ldr	r8, [lr, #424]!
	mov	r3, #0
	mov	r0, #1
	mov	r1, #80
	ldr	r4, [ip, #616]
	cmp	lr, r8
	mov	r6, r8
	str	r4, [sp, #36]
	str	lr, [sp, #44]
	str	r4, [sp, #92]
	strd	r2, [sp, #96]
	str	r0, [sp, #100]
	strd	r2, [sp, #104]
	str	r1, [sp, #104]
	strd	r2, [sp, #112]
	strd	r2, [sp, #120]
	ldr	r5, [r8]
	beq	.L1299
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	mov	r2, #61440
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	mov	r10, #53248
	movt	r10, 65535
	movt	r2, 65535
	str	r3, [sp, #12]
	mvn	r3, #0
	str	r3, [sp, #16]
	str	r2, [sp, #20]
	str	r10, [sp, #24]
	mov	r10, lr
	b	.L1276
.L1262:
	mov	r0, r4
	mov	r8, r5
	bl	unlock_page
	mov	r0, r6
	bl	__list_del_entry
	ldr	r1, [sp, #72]
	mov	r0, r6
	mov	r2, fp
	bl	__list_add
	cmp	r5, r10
	mov	r6, r5
	ldr	r5, [r5]
	beq	.L1341
.L1276:
	ldr	r4, [r8, #8]
	mov	r0, #0
	mov	r1, r4
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1342
.L1261:
	ldr	r2, [r4, #4]
	ldr	r3, [r7, #32]
	cmp	r2, r3
	bne	.L1262
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L1343
.L1264:
	mov	r0, r4
	bl	set_page_dirty
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1344
.L1269:
	mov	r0, r4
	bl	clear_page_dirty_for_io
	cmp	r0, #0
	beq	.L1271
	ldrh	r2, [r7]
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #24]
	and	r3, r2, r3
	and	r2, r2, r1
	cmp	r3, #16384
	cmpne	r2, #32768
	bne	.L1272
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
.L1272:
	mov	r0, r7
	bl	remove_dirty_inode
.L1271:
	mov	r9, #0
	add	r0, sp, #92
	str	r9, [sp, #112]
	str	r4, [sp, #116]
	str	r9, [sp, #120]
	strb	r9, [sp, #125]
	bl	do_write_data_page
	cmp	r0, #0
	bne	.L1345
	ldr	r3, [sp, #112]
	str	r3, [r8, #12]
	ldr	r3, [r4, #8]
	str	r3, [sp, #16]
	b	.L1262
.L1344:
	ldmib	r4, {r1, r3}
	mov	ip, #0
	mov	lr, #1
	mov	r2, ip
	ldr	r1, [r1]
	ldr	r0, [r1, #28]
	ldr	r0, [r0, #616]
	stm	sp, {ip, lr}
	bl	f2fs_submit_merged_bio_cond
	ldr	r3, [r4]
	tst	r3, #8192
	beq	.L1269
	mov	r1, #13
	mov	r0, r4
	bl	wait_on_page_bit
	b	.L1269
.L1342:
	mov	r0, r4
	bl	__lock_page
	b	.L1261
.L1341:
	ldr	r3, [sp, #16]
	cmn	r3, #1
	beq	.L1299
	mov	ip, #1
	mov	r2, #0
	ldr	r0, [sp, #36]
	mov	r1, r7
	stm	sp, {r2, ip}
	bl	f2fs_submit_merged_bio_cond
.L1299:
	mov	r2, #0
	mov	r1, fp
	mov	r0, r7
	str	r2, [sp, #16]
	bl	__revoke_inmem_pages.constprop.10
.L1278:
	ldr	r0, [sp, #28]
	bl	mutex_unlock
	ldr	r3, [r7, #356]
	tst	r3, #65536
	beq	.L1296
	mov	r0, #16
	ldr	r1, [sp, #40]
	bl	_clear_bit
.L1296:
	ldr	r0, [sp, #32]
	bl	up_read
	ldr	r0, [sp, #16]
	add	sp, sp, #132
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1343:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [sp, #12]
	ldr	r9, [r3, #16]
	cmp	r9, #0
	beq	.L1265
.L1266:
	ldr	r3, [r9]
	mov	r2, #5
	mov	r1, r4
	ldr	r0, [r9, #4]
	blx	r3
	ldr	r3, [r9, #8]!
	cmp	r3, #0
	bne	.L1266
.L1265:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L1264
	bl	preempt_schedule
	b	.L1264
.L1340:
	add	r1, r7, #356
	mov	r0, #16
	bl	_set_bit
	b	.L1259
.L1345:
	str	r0, [sp, #52]
	mov	r0, r4
	bl	unlock_page
	ldr	r3, [sp, #16]
	cmn	r3, #1
	bne	.L1346
.L1275:
	ldr	r3, [r7, #28]
	ldr	r5, [sp, #68]
	ldr	r3, [r3, #616]
	cmp	r5, fp
	ldr	r6, [r5]
	mov	r10, r5
	str	r3, [sp, #24]
	beq	.L1298
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #57344
	movw	r1, #:lower16:.LC2
	mov	r8, #0
	movt	r3, #:upper16:.LANCHOR0
	movt	r2, 65535
	movt	r1, #:upper16:.LC2
	str	r8, [sp, #16]
	str	r3, [sp, #20]
	str	r2, [sp, #36]
	str	r1, [sp, #48]
	b	.L1294
.L1351:
	mvn	r3, #10
	str	r3, [sp, #16]
.L1286:
	mov	r1, r4
	mov	r0, #3
	bl	_clear_bit
	mov	r1, r4
	mov	r0, #11
	str	r8, [r4, #28]
	bl	_clear_bit
	cmp	r4, #0
	beq	.L1292
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1347
.L1293:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1292:
	mov	r0, r10
	bl	list_del
	ldr	r3, [sp, #20]
	mov	r1, r5
	ldr	r0, [r3, #12]
	bl	kmem_cache_free
	ldr	r3, [r7, #28]
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
	cmp	r6, fp
	mov	r10, r6
	mov	r5, r6
	ldr	r6, [r6]
	beq	.L1348
.L1294:
	ldr	r4, [r5, #8]
	mov	r0, #0
	mov	r1, r4
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1349
.L1279:
	ldr	r3, [sp, #12]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L1350
.L1281:
	mov	r1, #28
	add	r0, sp, #92
	bl	__memzero
	str	r7, [sp, #92]
	mov	r2, #1
	add	r0, sp, #92
	str	r8, [sp, #96]
	str	r8, [sp, #100]
	str	r8, [sp, #104]
	ldr	r1, [r4, #8]
	bl	get_dnode_of_data
	cmp	r0, #0
	bne	.L1351
	add	r2, sp, #76
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #104]
	bl	get_node_info
	ldrb	lr, [sp, #88]	@ zero_extendqisi2
	mov	r3, #1
	add	r1, sp, #61
	ldr	r9, [r5, #12]
	ldr	r0, [sp, #24]
	str	r3, [sp]
	ldr	ip, [sp, #108]
	str	r3, [sp, #4]
	strb	lr, [sp, #65]
	ldr	lr, [sp, #104]
	mov	r3, r9
	ldr	r2, [sp, #116]
	str	lr, [sp, #61]	@ unaligned
	strh	ip, [sp, #66]	@ unaligned
	bl	__f2fs_replace_block
	add	r0, sp, #92
	mov	r1, r9
	bl	f2fs_update_data_blkaddr
	ldr	r9, [sp, #100]
	cmp	r9, #0
	beq	.L1287
	ldr	r3, [r9]
	tst	r3, #1
	beq	.L1352
.L1288:
	mov	r0, r9
	bl	unlock_page
	mov	r0, r9
	bl	put_page
	ldr	r0, [sp, #96]
	cmp	r0, #0
	beq	.L1286
	ldr	r3, [sp, #100]
	cmp	r0, r3
	beq	.L1286
	bl	put_page
	b	.L1286
.L1348:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L1298
	mov	r2, #1
	mov	r0, r7
	ldr	r1, [sp, #44]
	bl	__revoke_inmem_pages.constprop.10
	b	.L1278
.L1298:
	mov	r2, #1
	mov	r0, r7
	ldr	r1, [sp, #44]
	ldr	r3, [sp, #52]
	str	r3, [sp, #16]
	bl	__revoke_inmem_pages.constprop.10
	b	.L1278
.L1350:
	ldr	r2, [sp, #36]
	mov	r3, sp
	and	r2, r3, r2
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [sp, #12]
	ldr	r9, [r3, #16]
	cmp	r9, #0
	beq	.L1282
.L1283:
	ldr	r3, [r9]
	mov	r2, #8
	mov	r1, r4
	ldr	r0, [r9, #4]
	blx	r3
	ldr	r3, [r9, #8]!
	cmp	r3, #0
	bne	.L1283
.L1282:
	ldr	r2, [sp, #36]
	mov	r3, sp
	and	r3, r3, r2
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L1281
	bl	preempt_schedule
	b	.L1281
.L1349:
	mov	r0, r4
	bl	__lock_page
	b	.L1279
.L1287:
	ldr	r0, [sp, #96]
	cmp	r0, #0
	beq	.L1286
	bl	put_page
	b	.L1286
.L1347:
	movw	r1, #1716
	ldr	r0, [sp, #48]
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1293
.L1352:
	movw	r1, #1716
	ldr	r0, [sp, #48]
	bl	warn_slowpath_null
	ldr	r3, [r9, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1288
.L1346:
	mov	r1, #1
	mov	r2, r9
	ldr	r3, [sp, #16]
	ldr	r0, [sp, #36]
	str	r9, [sp]
	str	r1, [sp, #4]
	mov	r1, r7
	bl	f2fs_submit_merged_bio_cond
	b	.L1275
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
	@ args = 12, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r7, r3
	strd	r8, [sp, #16]
	mov	r8, r1
	strd	r10, [sp, #24]
	mov	fp, r2
	str	lr, [sp, #32]
	.pad #44
	sub	sp, sp, #44
	ldr	r0, [r0, #28]
	ldrb	r3, [sp, #80]	@ zero_extendqisi2
	ldrb	r9, [sp, #84]	@ zero_extendqisi2
	ldr	r6, [r0]
	str	r3, [sp, #20]
	sub	r3, r7, #1
	cmn	r3, #3
	str	r3, [sp, #16]
	ldr	r3, [r1, #12]
	mvnhi	r2, #23
	str	r3, [sp, #8]
	ldrh	r3, [r1, #16]
	str	r3, [sp, #12]
	ldrb	r3, [sp, #88]	@ zero_extendqisi2
	str	r3, [sp, #24]
	mvnhi	r3, #0
	bhi	.L1354
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	r1, [r4, #692]
	ldr	r3, [r3]
	sub	r2, r7, r2
	rsb	r3, r3, r2, lsr r1
	add	r2, r3, r3, lsl #1
	lsl	r2, r2, #3
.L1354:
	ldr	r1, [r6, #60]
	cmp	r9, #0
	ldr	r5, [r0, #12]
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	and	r0, r0, #63
	str	r0, [sp, #4]
	bne	.L1355
	ldrh	r2, [r1, r2]
	bic	r2, r2, #63
	cmp	r2, #0
	lslne	r2, r0, #6
	beq	.L1393
.L1357:
	add	r5, r5, r2
	add	r6, r6, #40
	strd	r2, [sp, #28]
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r6
	bl	mutex_lock
	ldrh	r3, [r5, #52]
	ldr	r10, [r5, #48]
	ldr	r2, [sp, #28]
	str	r3, [sp, #36]
	ldr	r3, [sp, #32]
	cmp	r3, r10
	beq	.L1369
	mov	r0, r4
	ldr	r1, [sp, #4]
	str	r3, [r5, #60]
	bl	change_curseg.constprop.11
	ldr	r2, [sp, #28]
.L1369:
	ldr	r3, [r4, #28]
	eor	r0, r9, #1
	ldr	r1, [sp, #24]
	ldr	r3, [r3, #16]
	orrs	r1, r1, r0
	ldr	r1, [r4, #696]
	ldr	r0, [sp, #8]
	sub	r3, r7, r3
	sub	r1, r1, #1
	and	r3, r3, r1
	strh	r3, [r5, #52]	@ movhi
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #12]
	add	r2, r3, r2
	ldrh	r3, [r2, #52]
	ldr	r1, [r2, #20]
	rsb	r3, r3, r3, lsl #3
	add	r2, r1, r3
	str	r0, [r1, r3]	@ unaligned
	ldr	r3, [sp, #20]
	strb	r3, [r2, #4]
	ldr	r3, [sp, #12]
	strh	r3, [r2, #5]	@ unaligned
	bne	.L1394
.L1370:
	sub	r3, fp, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L1371
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r3, fp, r3
	rsb	r1, r1, r3, lsr r2
	cmn	r1, #1
	bne	.L1395
.L1371:
	mov	r0, r4
	bl	locate_dirty_segment
	ldr	r3, [sp, #16]
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L1373
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #692]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r3, r7, r3
	rsb	r1, r1, r3, lsr r2
.L1373:
	mov	r0, r4
	bl	locate_dirty_segment
	mov	r1, r10
	mov	r0, r4
	bl	locate_dirty_segment
	cmp	r9, #0
	beq	.L1374
	ldr	r3, [r5, #48]
	cmp	r10, r3
	bne	.L1396
.L1375:
	ldr	r3, [sp, #36]
	strh	r3, [r5, #52]	@ movhi
.L1374:
	mov	r0, r6
	bl	mutex_unlock
	mov	r0, r5
	bl	mutex_unlock
	mov	r1, r7
	mov	r0, r8
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	f2fs_update_data_blkaddr
.L1355:
	ldr	r2, [r5, #48]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #112]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #176]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #240]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #304]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #368]
	cmp	r3, r2
	movne	r1, #1
	movne	r2, #64
	strne	r1, [sp, #4]
	bne	.L1357
.L1392:
	lsl	r2, r0, #6
	b	.L1357
.L1396:
	mov	r0, r4
	ldr	r1, [sp, #4]
	str	r10, [r5, #60]
	bl	change_curseg.constprop.11
	b	.L1375
.L1393:
	ldr	r2, [r5, #48]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #112]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #176]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #240]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #304]
	cmp	r3, r2
	beq	.L1392
	ldr	r2, [r5, #368]
	cmp	r3, r2
	beq	.L1392
	cmp	fp, #0
	moveq	r1, #2
	movne	r1, #1
	moveq	r2, #128
	movne	r2, #64
	str	r1, [sp, #4]
	b	.L1357
.L1395:
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
	b	.L1371
.L1394:
	mov	r2, #1
	mov	r1, r7
	mov	r0, r4
	bl	update_sit_entry
	b	.L1370
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
	bne	.L1411
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1411:
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
	ldr	r3, [r0, #380]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r3, #32]
	bl	find_lock_page
	subs	r4, r0, #0
	beq	.L1412
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L1430
.L1417:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1431
.L1419:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	b	put_page
.L1412:
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L1430:
	ldmib	r4, {r1, r3}
	mov	ip, #0
	mov	lr, #1
	mov	r2, ip
	ldr	r1, [r1]
	ldr	r0, [r1, #28]
	ldr	r0, [r0, #616]
	stm	sp, {ip, lr}
	bl	f2fs_submit_merged_bio_cond
	ldr	r3, [r4]
	tst	r3, #8192
	beq	.L1417
	mov	r1, #13
	mov	r0, r4
	bl	wait_on_page_bit
	b	.L1417
.L1431:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1419
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
	strd	r8, [sp, #16]
	mov	r9, r0
	strd	r10, [sp, #24]
	mov	fp, r1
	str	lr, [sp, #32]
	ldr	r3, [r0, #368]
	.pad #20
	sub	sp, sp, #20
	ldr	r6, [r3, #132]	@ unaligned
	ands	r6, r6, #4
	bne	.L1460
	movw	r3, #:lower16:.LC2
	movt	r3, #:upper16:.LC2
	str	r3, [sp, #4]
.L1433:
	ldr	r3, [r9, #28]
	mov	r1, fp
	mov	r0, r9
	add	fp, fp, #1
	ldr	r5, [r3, #12]
	bl	grab_meta_page
	mov	r7, r0
	add	r5, r5, r6
	add	r6, r6, #64
	ldr	r4, [r5, #20]
	add	r10, r5, #24
	bl	page_address
	mov	r8, r0
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r10
	bl	down_read
	movw	r2, #507
	ldr	r1, [r5, #40]
	add	r0, r8, #3584
	bl	memcpy
	mov	r0, r10
	bl	up_read
	mov	r1, r4
	mov	r2, #3584
	mov	r0, r8
	bl	memcpy
	ldr	r3, [r4, #4091]	@ unaligned
	mov	r0, r5
	str	r3, [r8, #4091]	@ unaligned
	ldrb	r3, [r4, #4095]	@ zero_extendqisi2
	strb	r3, [r8, #4095]
	bl	mutex_unlock
	mov	r0, r7
	bl	set_page_dirty
	cmp	r7, #0
	beq	.L1444
	ldr	r3, [r7]
	tst	r3, #1
	beq	.L1462
.L1445:
	mov	r0, r7
	bl	unlock_page
	mov	r0, r7
	bl	put_page
.L1444:
	cmp	r6, #192
	bne	.L1433
.L1432:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1460:
	bl	grab_meta_page
	mov	r4, r0
	movw	r6, #507
	bl	page_address
	ldr	r3, [r9, #28]
	movw	r1, #:lower16:.LC2
	add	r2, fp, #1
	movt	r1, #:upper16:.LC2
	mov	r5, r0
	str	r2, [sp, #4]
	mov	r2, r6
	mov	r8, #0
	str	r1, [sp, #12]
	ldr	r3, [r3, #12]
	ldr	r1, [r3, #40]
	bl	memcpy
	ldr	r3, [r9, #28]
	mov	r2, r6
	add	r0, r5, r6
	ldr	r3, [r3, #12]
	ldr	r1, [r3, #168]
	bl	memcpy
	movw	r1, #1014
.L1441:
	ldr	r2, [r9, #28]
	ldr	r3, [r9, #368]
	ldr	fp, [r2, #12]
	add	r3, r3, r8
	ldrb	r3, [r3, #176]	@ zero_extendqisi2
	add	fp, fp, r8, lsl #6
	cmp	r3, #1
	ldreq	r10, [r9, #696]
	ldrhne	r10, [fp, #52]
	uxtheq	r10, r10
	cmp	r10, #0
	beq	.L1436
	mov	r6, #0
	str	r8, [sp, #8]
	b	.L1440
.L1437:
	ldr	lr, [fp, #20]
	movw	r8, #4091
	cmp	ip, r8
	add	r3, lr, r3
	ldr	ip, [r3]	@ unaligned
	str	ip, [r5, r1]	@ unaligned
	ldrh	r1, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r1, [r2, #4]	@ unaligned
	movls	r1, r7
	strb	r3, [r2, #6]
	bls	.L1438
	bl	set_page_dirty
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1463
.L1439:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	mov	r4, #0
	bl	put_page
	mov	r1, r7
.L1438:
	add	r6, r6, #1
	cmp	r6, r10
	beq	.L1464
.L1440:
	cmp	r4, #0
	rsb	r3, r6, r6, lsl #3
	mov	r0, r4
	add	ip, r1, #14
	add	r2, r5, r1
	add	r7, r1, #7
	bne	.L1437
	ldr	r7, [sp, #4]
	mov	r0, r9
	mov	r1, r7
	bl	grab_meta_page
	mov	r4, r0
	bl	page_address
	ldr	r2, [fp, #20]
	rsb	r3, r6, r6, lsl #3
	add	r6, r6, #1
	add	r1, r7, #1
	cmp	r6, r10
	mov	r5, r0
	str	r1, [sp, #4]
	mov	r1, #7
	add	r3, r2, r3
	ldr	r2, [r3]	@ unaligned
	str	r2, [r0]	@ unaligned
	ldrh	r2, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r2, [r0, #4]	@ unaligned
	strb	r3, [r0, #6]
	bne	.L1440
.L1464:
	ldr	r8, [sp, #8]
.L1436:
	add	r8, r8, #1
	cmp	r8, #3
	bne	.L1441
	cmp	r4, #0
	beq	.L1432
	mov	r0, r4
	bl	set_page_dirty
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1465
.L1443:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	put_page
.L1463:
	movw	r1, #1716
	ldr	r0, [sp, #12]
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1439
.L1462:
	movw	r1, #1716
	ldr	r0, [sp, #4]
	bl	warn_slowpath_null
	ldr	r3, [r7, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1445
.L1465:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1443
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LC2
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r3, #:upper16:.LC2
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r1
	mov	r8, #192
	strd	r10, [sp, #24]
	mov	fp, r0
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	str	r3, [sp, #4]
.L1469:
	ldr	r3, [fp, #28]
	mov	r1, r9
	mov	r0, fp
	add	r9, r9, #1
	ldr	r5, [r3, #12]
	bl	grab_meta_page
	mov	r6, r0
	add	r5, r5, r8
	add	r8, r8, #64
	ldr	r4, [r5, #20]
	add	r10, r5, #24
	bl	page_address
	mov	r7, r0
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r10
	bl	down_read
	movw	r2, #507
	ldr	r1, [r5, #40]
	add	r0, r7, #3584
	bl	memcpy
	mov	r0, r10
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
	beq	.L1467
	ldr	r3, [r6]
	tst	r3, #1
	beq	.L1475
.L1468:
	mov	r0, r6
	bl	unlock_page
	mov	r0, r6
	bl	put_page
.L1467:
	cmp	r8, #384
	bne	.L1469
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1475:
	movw	r1, #1716
	ldr	r0, [sp, #4]
	bl	warn_slowpath_null
	ldr	r3, [r6, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1468
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
	bne	.L1477
	ldrh	r0, [r0]	@ unaligned
	cmp	r0, #0
	beq	.L1478
	ldr	lr, [ip, #2]	@ unaligned
	cmp	r2, lr
	beq	.L1488
	mov	r4, #13
	b	.L1480
.L1481:
	ldr	lr, [lr, #2]	@ unaligned
	cmp	lr, r2
	beq	.L1485
.L1480:
	add	r1, r1, #1
	cmp	r1, r0
	mla	lr, r4, r1, ip
	bne	.L1481
.L1478:
	cmp	r3, #0
	cmpne	r0, #38
	beq	.L1493
.L1516:
	add	r3, r0, #1
	strh	r3, [ip]	@ unaligned
.L1476:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L1477:
	cmp	r1, #1
	bne	.L1493
	ldrh	r0, [r0]	@ unaligned
	cmp	r0, #0
	beq	.L1482
	ldr	lr, [ip, #2]	@ unaligned
	cmp	r2, lr
	beq	.L1488
	cmp	r0, #1
	beq	.L1482
	ldr	lr, [ip, #80]	@ unaligned
	cmp	r2, lr
	beq	.L1485
	cmp	r0, #2
	beq	.L1482
	ldr	r1, [ip, #158]	@ unaligned
	cmp	r2, r1
	beq	.L1490
	cmp	r0, #3
	beq	.L1482
	ldr	r1, [ip, #236]	@ unaligned
	cmp	r2, r1
	beq	.L1491
	cmp	r0, #4
	beq	.L1482
	ldr	r1, [ip, #314]	@ unaligned
	cmp	r2, r1
	beq	.L1492
	cmp	r0, #5
	beq	.L1482
	ldr	r1, [ip, #392]	@ unaligned
	cmp	r2, r1
	moveq	r0, #5
	beq	.L1476
.L1482:
	cmp	r0, #6
	cmpne	r3, #0
	bne	.L1516
.L1493:
	mvn	r0, #0
	b	.L1476
.L1485:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, r1
	ldr	pc, [sp], #4
.L1488:
	mov	r0, #0
	b	.L1476
.L1490:
	mov	r0, #2
	b	.L1476
.L1491:
	mov	r0, #3
	b	.L1476
.L1492:
	mov	r0, #4
	b	.L1476
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
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r1
	strd	r10, [sp, #24]
	mov	fp, r0
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #92
	sub	sp, sp, #92
	ldr	r9, [r3]
	str	r3, [sp, #68]
	ldr	r3, [r3, #12]
	add	r2, r9, #40
	ldr	r7, [r9, #28]
	str	r3, [sp, #56]
	ldr	r3, [r3, #168]
	mov	r0, r2
	str	r3, [sp, #44]
	str	r2, [sp, #60]
	bl	mutex_lock
	ldr	r3, [r9, #32]
	cmp	r3, #0
	bne	.L1640
.L1519:
	ldr	r3, [r8]
	tst	r3, #16
	beq	.L1561
	ldrd	r4, [r8, #8]
	ldrd	r2, [r8, #16]
	cmp	r3, r5
	cmpeq	r2, r4
	bcc	.L1562
.L1563:
	mov	r2, #0
	mov	r1, r8
	mov	r0, fp
	bl	add_discard_addrs
	ldr	r1, [r8, #8]
	ldr	r0, [r8, #12]
	ldrd	r2, [r8, #16]
	adds	r6, r1, #1
	adc	r7, r0, #0
	cmp	r7, r3
	cmpeq	r6, r2
	strd	r6, [r8, #8]
	bls	.L1563
.L1562:
	strd	r4, [r8, #8]
.L1561:
	ldr	r0, [sp, #60]
	bl	mutex_unlock
	ldr	r3, [fp, #28]
	ldr	r7, [r3, #8]
	add	r8, r7, #36
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [fp, #28]
	ldr	r0, [r7, #32]
	ldr	r1, [r3, #32]
	bl	_find_first_bit_le
	ldr	r3, [fp, #28]
	mov	r5, r0
	ldr	r2, [r3, #32]
	cmp	r2, r0
	bhi	.L1568
	b	.L1564
.L1566:
	mov	r0, r9
	bl	_raw_spin_unlock
	ldr	r3, [fp, #28]
	add	r2, r5, #1
	ldr	r0, [r7, #32]
	ldr	r1, [r3, #32]
	bl	_find_next_bit_le
	ldr	r3, [fp, #28]
	mov	r5, r0
	ldr	r2, [r3, #32]
	cmp	r0, r2
	bcs	.L1564
.L1568:
	ldr	r4, [r3, #4]
	ldr	r6, [fp, #700]
	add	r9, r4, #12
	mov	r0, r9
	bl	_raw_spin_lock
	mov	r0, r5
	ldr	r1, [r4, #16]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1566
	udiv	r10, r5, r6
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #16]
	add	r3, r3, #1
	str	r3, [r4, #4]
	ldr	r1, [fp, #700]
	mul	r6, r10, r6
	mov	r2, r6
	add	r1, r6, r1
	bl	_find_next_bit_le
	ldr	r3, [fp, #700]
	add	r6, r6, r3
	cmp	r0, r6
	bcc	.L1566
	mov	r0, r10
	ldr	r1, [r4, #20]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1566
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1566
.L1564:
	mov	r0, r8
	add	sp, sp, #92
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L1640:
	ldr	r3, [fp, #28]
	ldr	r2, [r3]
	add	r5, r3, #52
	ldr	r1, [r3, #32]
	ldr	r4, [r2, #28]
	mov	r0, r4
	bl	_find_first_bit_le
	ldr	r3, [fp, #28]
	mov	r6, r0
	ldr	r2, [r3, #32]
	cmp	r2, r0
	bls	.L1520
.L1521:
	mov	r0, r6
	mov	r1, r5
	bl	add_sit_entry
	ldr	r3, [fp, #28]
	add	r2, r6, #1
	mov	r0, r4
	ldr	r1, [r3, #32]
	bl	_find_next_bit_le
	ldr	r3, [fp, #28]
	mov	r6, r0
	ldr	r2, [r3, #32]
	cmp	r0, r2
	bcc	.L1521
.L1520:
	ldr	r2, [sp, #44]
	ldr	r1, [r9, #32]
	ldrh	r2, [r2]	@ unaligned
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1641
.L1522:
	ldr	r3, [sp, #68]
	ldr	r6, [r3, #52]
	add	r3, r3, #52
	cmp	r6, r3
	str	r3, [sp, #48]
	ldr	r3, [r6]
	str	r3, [sp, #36]
	str	r6, [sp, #40]
	beq	.L1532
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC2
	str	fp, [sp]
	movt	r3, #:upper16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	str	r8, [sp, #12]
	movw	r0, #4767
	movt	r2, #:upper16:.LC2
	movt	r1, #:upper16:.LC0
	movt	r0, 10724
	str	r3, [sp, #52]
	mov	fp, r9
	mov	r3, #1
	mov	r8, r7
	str	r3, [sp, #4]
	str	r0, [sp, #64]
	str	r1, [sp, #80]
	str	r2, [sp, #84]
.L1531:
	ldr	r3, [sp]
	ldr	r5, [r6, #8]
	ldr	r3, [r3, #28]
	add	r1, r5, #55
	ldr	r2, [r3, #32]
	cmp	r1, r2
	movcs	r4, r2
	ldr	r2, [sp, #4]
	movcc	r4, r1
	str	r4, [sp, #16]
	cmp	r2, #0
	beq	.L1533
	ldr	r2, [sp, #44]
	ldr	r1, [r6, #12]
	ldrh	r2, [r2]	@ unaligned
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1533
	ldr	r3, [sp, #56]
	add	r7, r3, #152
	mov	r0, r7
	bl	down_write
	mov	r2, r5
	mov	r1, r4
	mov	r0, r8
	mov	r5, r4
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r3, r5
	movls	r3, #1
	mov	r4, r0
	strls	r3, [sp, #4]
	bls	.L1535
	mov	r3, #0
	mov	r2, #1
	str	r2, [sp, #4]
	str	r3, [sp, #20]
	str	r3, [sp, #24]
.L1534:
	ldr	r10, [sp, #44]
	mov	r9, r6
.L1553:
	ldr	r3, [sp]
	add	r7, r4, r4, lsl #1
	ldr	r2, [sp, #12]
	lsl	r6, r7, #3
	ldr	r3, [r3, #28]
	ldr	r2, [r2]
	ldr	r1, [r3]
	ands	r3, r2, #16
	ldr	r5, [r1, #60]
	add	r2, r5, r6
	str	r2, [sp, #8]
	beq	.L1642
.L1544:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L1545
	ldrh	r1, [r10]	@ unaligned
	cmp	r1, #0
	beq	.L1546
	ldr	r3, [r10, #2]	@ unaligned
	cmp	r3, r4
	beq	.L1579
	cmp	r1, #1
	beq	.L1546
	ldr	r3, [r10, #80]	@ unaligned
	cmp	r3, r4
	beq	.L1580
	cmp	r1, #2
	beq	.L1546
	ldr	r3, [r10, #158]	@ unaligned
	cmp	r4, r3
	beq	.L1581
	cmp	r1, #3
	beq	.L1546
	ldr	r3, [r10, #236]	@ unaligned
	cmp	r4, r3
	beq	.L1582
	cmp	r1, #4
	beq	.L1546
	ldr	r3, [r10, #314]	@ unaligned
	cmp	r4, r3
	beq	.L1583
	cmp	r1, #5
	beq	.L1546
	ldr	r3, [r10, #392]	@ unaligned
	cmp	r4, r3
	beq	.L1584
	movw	r1, #2923
	ldr	r0, [sp, #80]
	bl	warn_slowpath_null
	ldr	r3, [sp]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	mvn	r3, #69
	mvn	r1, #0
.L1547:
	mov	ip, #78
	add	r3, r10, r3
	str	fp, [sp, #28]
	mov	r0, r3
	str	r8, [sp, #32]
	mla	ip, ip, r1, r10
	str	r4, [ip, #2]	@ unaligned
	ldrb	lr, [r5, r7, lsl #3]	@ zero_extendqisi2
	ldrh	r2, [r5, r6]
	and	lr, lr, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, lr, lsl #10
	strh	r2, [ip, #6]	@ unaligned
	add	r2, r5, r6
	ldr	r2, [r2, #4]
	add	ip, r2, #64
.L1548:
	ldr	fp, [r2]	@ unaligned
	add	r2, r2, #16
	add	r0, r0, #16
	ldr	r8, [r2, #-12]	@ unaligned
	ldr	r7, [r2, #-8]	@ unaligned
	ldr	lr, [r2, #-4]	@ unaligned
	cmp	r2, ip
	str	fp, [r0, #-16]	@ unaligned
	str	r8, [r0, #-12]	@ unaligned
	str	r7, [r0, #-8]	@ unaligned
	str	lr, [r0, #-4]	@ unaligned
	bne	.L1548
	ldr	r2, [sp, #8]
	add	r0, r3, #64
	ldr	r8, [sp, #32]
	ldr	r2, [r2, #8]
.L1549:
	ldr	fp, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	r7, [r3, #-12]	@ unaligned
	ldr	lr, [r3, #-8]	@ unaligned
	ldr	ip, [r3, #-4]	@ unaligned
	cmp	r3, r0
	str	fp, [r2, #-16]	@ unaligned
	str	r7, [r2, #-12]	@ unaligned
	str	lr, [r2, #-8]	@ unaligned
	str	ip, [r2, #-4]	@ unaligned
	bne	.L1549
	ldr	lr, [sp, #8]
	mov	r0, #78
	ldrh	r3, [r5, r6]
	mla	r1, r0, r1, r10
	ldr	fp, [sp, #28]
	ldrh	r2, [lr, #2]
	ldr	ip, [lr, #16]
	lsr	r3, r3, #6
	ldr	r0, [lr, #20]
	bfi	r2, r3, #0, #10
	strh	r2, [lr, #2]	@ movhi
	str	ip, [r1, #72]	@ unaligned
	str	r0, [r1, #76]	@ unaligned
.L1550:
	cmp	r4, #0
	add	r3, r4, #31
	ldr	r5, [sp, #16]
	movge	r3, r4
	rsbs	r2, r4, #0
	asr	r3, r3, #5
	and	r2, r2, #31
	and	lr, r4, #31
	ldr	ip, [r8, r3, lsl #2]
	rsbpl	lr, r2, #0
	add	r2, r4, #1
	mov	r4, #1
	mov	r0, r8
	mov	r1, r5
	bic	ip, ip, r4, lsl lr
	str	ip, [r8, r3, lsl #2]
	ldr	r3, [fp, #32]
	sub	r3, r3, #1
	str	r3, [fp, #32]
	ldr	r3, [r9, #12]
	sub	r3, r3, #1
	str	r3, [r9, #12]
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r4, r0
	bhi	.L1553
	ldr	r3, [sp, #4]
	mov	r6, r9
	cmp	r3, #0
	bne	.L1643
.L1543:
	ldr	r3, [sp, #20]
	cmp	r3, #0
	beq	.L1554
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1644
.L1555:
	ldr	r4, [sp, #20]
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1554:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	bne	.L1645
.L1556:
	ldr	r4, [sp, #36]
	ldr	r0, [sp, #40]
	str	r4, [sp, #40]
	bl	list_del
	ldr	r3, [sp, #52]
	mov	r1, r6
	ldr	r0, [r3, #4]
	bl	kmem_cache_free
	ldr	r3, [sp, #48]
	cmp	r4, r3
	ldr	r3, [r4]
	beq	.L1639
.L1557:
	ldr	r6, [sp, #36]
	str	r3, [sp, #36]
	b	.L1531
.L1545:
	ldr	r1, [fp, #36]
	mov	r3, #74
	str	fp, [sp, #28]
	ldrb	ip, [r5, r7, lsl #3]	@ zero_extendqisi2
	str	r8, [sp, #32]
	ldrh	r2, [r5, r6]
	udiv	r0, r4, r1
	and	ip, ip, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, ip, lsl #10
	mls	r0, r1, r0, r4
	ldr	r1, [sp, #24]
	mul	r3, r3, r0
	strh	r2, [r1, r3]	@ unaligned
	add	r2, r5, r6
	add	r3, r3, #2
	ldr	r2, [r2, #4]
	add	r3, r1, r3
	mov	r1, r3
	add	ip, r2, #64
.L1551:
	ldr	fp, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r8, [r2, #-12]	@ unaligned
	ldr	r7, [r2, #-8]	@ unaligned
	ldr	lr, [r2, #-4]	@ unaligned
	cmp	r2, ip
	str	fp, [r1, #-16]	@ unaligned
	str	r8, [r1, #-12]	@ unaligned
	str	r7, [r1, #-8]	@ unaligned
	str	lr, [r1, #-4]	@ unaligned
	bne	.L1551
	ldr	r2, [sp, #8]
	add	r1, r3, #64
	ldr	r8, [sp, #32]
	ldr	r2, [r2, #8]
.L1552:
	ldr	fp, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	r7, [r3, #-12]	@ unaligned
	ldr	lr, [r3, #-8]	@ unaligned
	ldr	ip, [r3, #-4]	@ unaligned
	cmp	r3, r1
	str	fp, [r2, #-16]	@ unaligned
	str	r7, [r2, #-12]	@ unaligned
	str	lr, [r2, #-8]	@ unaligned
	str	ip, [r2, #-4]	@ unaligned
	bne	.L1552
	ldr	lr, [sp, #8]
	mov	r1, #74
	ldrh	r3, [r5, r6]
	ldr	ip, [sp, #24]
	ldr	fp, [sp, #28]
	ldrh	r2, [lr, #2]
	lsr	r3, r3, #6
	mla	r0, r1, r0, ip
	ldr	ip, [lr, #16]
	ldr	r1, [lr, #20]
	bfi	r2, r3, #0, #10
	strh	r2, [lr, #2]	@ movhi
	str	ip, [r0, #66]	@ unaligned
	str	r1, [r0, #70]	@ unaligned
	b	.L1550
.L1546:
	mov	r3, #78
	add	r2, r1, #1
	mul	r3, r3, r1
	strh	r2, [r10]	@ unaligned
	add	r3, r3, #8
	b	.L1547
.L1642:
	ldr	r0, [sp, #12]
	mov	r2, r3
	mov	r1, r0
	str	r4, [r0, #8]
	str	r3, [r0, #12]
	ldr	r0, [sp]
	bl	add_discard_addrs
	b	.L1544
.L1533:
	ldr	r2, [sp, #64]
	ldr	r0, [r3]
	umull	r2, r4, r2, r5
	ldr	r2, [r3, #28]
	ldr	r3, [r0, #4]
	str	r0, [sp, #4]
	sub	r1, r5, r4
	sub	r2, r2, #1
	add	r4, r4, r1, lsr #1
	cmp	r5, r2
	movls	r2, r0
	lsr	r4, r4, #5
	movls	ip, r2
	add	r7, r4, r3
	bhi	.L1646
.L1536:
	ldr	r0, [ip, #16]
	mvn	r10, r4
	mov	r1, #1
	and	r10, r10, #7
	ldr	r2, [r2, #8]
	lsl	r10, r1, r10
	ldrb	r1, [r0, r4, lsr #3]	@ zero_extendqisi2
	ldr	r0, [sp]
	tst	r1, r10
	ldrne	r1, [ip, #8]
	addne	r7, r7, r1
	sub	r9, r7, r3
	mov	r1, r7
	cmp	r9, r2
	addcc	r9, r9, r2
	subcs	r9, r9, r2
	add	r9, r9, r3
	bl	get_meta_page
	mov	r7, r0
	mov	r1, r9
	ldr	r0, [sp]
	bl	grab_meta_page
	ldr	r3, [r7]
	str	r0, [sp, #20]
	tst	r3, #16
	bne	.L1647
.L1540:
	mov	r0, r7
	bl	page_address
	mov	r9, r0
	ldr	r0, [sp, #20]
	bl	page_address
	mov	r1, r9
	mov	r2, #4096
	bl	memcpy
	ldr	r0, [sp, #20]
	bl	set_page_dirty
	cmp	r7, #0
	beq	.L1541
	ldr	r3, [r7]
	tst	r3, #1
	beq	.L1648
.L1542:
	mov	r0, r7
	bl	unlock_page
	mov	r0, r7
	bl	put_page
.L1541:
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #20]
	ldr	r2, [r3, #16]
	ldrb	r3, [r2, r4, lsr #3]	@ zero_extendqisi2
	eor	r10, r10, r3
	strb	r10, [r2, r4, lsr #3]
	bl	page_address
	mov	r2, r5
	ldr	r5, [sp, #16]
	str	r0, [sp, #24]
	mov	r0, r8
	mov	r1, r5
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r3, #0
	mov	r4, r0
	str	r3, [sp, #4]
	bhi	.L1534
	b	.L1543
.L1643:
	ldr	r3, [sp, #56]
	add	r7, r3, #152
.L1535:
	mov	r0, r7
	bl	up_write
	ldr	r3, [r6, #12]
	cmp	r3, #0
	beq	.L1556
.L1645:
	mov	r1, #2944
	ldr	r0, [sp, #80]
	bl	warn_slowpath_null
	ldr	r3, [sp]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	ldr	r4, [sp, #36]
	ldr	r0, [sp, #40]
	str	r4, [sp, #40]
	bl	list_del
	ldr	r3, [sp, #52]
	mov	r1, r6
	ldr	r0, [r3, #4]
	bl	kmem_cache_free
	ldr	r3, [sp, #48]
	cmp	r3, r4
	ldr	r3, [r4]
	bne	.L1557
.L1639:
	mov	r9, fp
	ldr	fp, [sp]
	ldr	r3, [sp, #68]
	ldr	r8, [sp, #12]
	ldr	r6, [r3, #52]
.L1532:
	ldr	r3, [sp, #48]
	cmp	r3, r6
	bne	.L1649
.L1559:
	ldr	r3, [r9, #32]
	cmp	r3, #0
	beq	.L1519
	movw	r0, #:lower16:.LC0
	movw	r1, #2949
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1519
.L1579:
	mov	r3, #8
	mov	r1, #0
	b	.L1547
.L1580:
	mov	r3, #86
	mov	r1, #1
	b	.L1547
.L1581:
	mov	r3, #164
	mov	r1, #2
	b	.L1547
.L1582:
	mov	r3, #242
	mov	r1, #3
	b	.L1547
.L1583:
	mov	r3, #320
	mov	r1, #4
	b	.L1547
.L1584:
	movw	r3, #398
	mov	r1, #5
	b	.L1547
.L1647:
	movw	r1, #2753
	ldr	r0, [sp, #80]
	bl	warn_slowpath_null
	ldr	r3, [sp]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	b	.L1540
.L1646:
	movw	r0, #:lower16:.LC13
	movw	r1, #625
	movt	r0, #:upper16:.LC13
	bl	warn_slowpath_null
	ldr	r9, [sp]
	mov	r0, #2
	add	r1, r9, #16
	bl	_set_bit
	ldr	r3, [r9, #28]
	ldr	ip, [sp, #4]
	ldr	r2, [r3]
	ldr	r3, [r2, #4]
	b	.L1536
.L1641:
	ldr	r5, [r3, #12]
	ldr	r4, [r5, #168]
	add	r5, r5, #152
	mov	r0, r5
	bl	down_write
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #0
	moveq	r2, r3
	beq	.L1523
	ldr	r3, [fp, #28]
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
	bne	.L1524
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	ldr	r1, [fp, #28]
	add	r1, r1, #52
	bl	add_sit_entry
.L1524:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #1
	movls	r2, #1
	bls	.L1525
	ldr	r3, [fp, #28]
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
	beq	.L1650
.L1526:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #2
	movls	r2, #2
	bls	.L1525
	ldr	r3, [fp, #28]
	mov	r6, #1
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
	lsl	r2, r6, r2
	asr	r3, r3, #5
	ldr	r1, [lr, r3, lsl #2]
	tst	r1, r2
	orr	r2, r1, r2
	str	r2, [lr, r3, lsl #2]
	beq	.L1651
.L1527:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #3
	movls	r2, #3
	bls	.L1525
	ldr	r3, [fp, #28]
	mov	r6, #1
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
	lsl	r2, r6, r2
	asr	r3, r3, #5
	ldr	r1, [lr, r3, lsl #2]
	tst	r1, r2
	orr	r2, r1, r2
	str	r2, [lr, r3, lsl #2]
	beq	.L1652
.L1528:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #4
	movls	r2, #4
	bls	.L1525
	ldr	r3, [fp, #28]
	mov	r6, #1
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
	lsl	r2, r6, r2
	asr	r3, r3, #5
	ldr	r1, [lr, r3, lsl #2]
	tst	r1, r2
	orr	r2, r1, r2
	str	r2, [lr, r3, lsl #2]
	beq	.L1653
.L1529:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #5
	movls	r2, #5
	bls	.L1525
	ldr	r3, [fp, #28]
	mov	lr, #1
	ldr	r0, [r4, #392]	@ unaligned
	ldr	r1, [r3]
	rsbs	ip, r0, #0
	and	r3, r0, #31
	and	ip, ip, #31
	add	r2, r0, #31
	rsbpl	r3, ip, #0
	cmp	r0, #0
	ldr	ip, [r1, #28]
	movge	r2, r0
	lsl	r3, lr, r3
	asr	r2, r2, #5
	ldr	lr, [ip, r2, lsl #2]
	tst	r3, lr
	orr	r3, r3, lr
	str	r3, [ip, r2, lsl #2]
	bne	.L1530
	ldr	r3, [r1, #32]
	add	r3, r3, #1
	str	r3, [r1, #32]
	ldr	r1, [fp, #28]
	add	r1, r1, #52
	bl	add_sit_entry
.L1530:
	ldrh	r3, [r4]	@ unaligned
	mov	r2, #6
.L1525:
	rsb	r2, r2, #0
	uxth	r2, r2
.L1523:
	add	r3, r3, r2
	mov	r0, r5
	strh	r3, [r4]	@ unaligned
	bl	up_write
	b	.L1522
.L1648:
	movw	r1, #1716
	ldr	r0, [sp, #84]
	bl	warn_slowpath_null
	ldr	r3, [r7, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1542
.L1644:
	movw	r1, #1716
	ldr	r0, [sp, #84]
	bl	warn_slowpath_null
	ldr	r3, [sp, #20]
	mov	r0, #2
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1555
.L1652:
	ldr	r3, [ip, #32]
	add	r3, r3, r6
	str	r3, [ip, #32]
	ldr	r1, [fp, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1528
.L1653:
	ldr	r3, [ip, #32]
	add	r3, r3, r6
	str	r3, [ip, #32]
	ldr	r1, [fp, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1529
.L1649:
	movw	r0, #:lower16:.LC0
	movw	r1, #2948
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1559
.L1650:
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	ldr	r1, [fp, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1526
.L1651:
	ldr	r3, [ip, #32]
	add	r3, r3, r6
	str	r3, [ip, #32]
	ldr	r1, [fp, #28]
	add	r1, r1, #52
	bl	add_sit_entry
	b	.L1527
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
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r10, [sp, #24]
	movw	r10, #:lower16:kmalloc_caches
	mov	fp, r0
	movt	r10, #:upper16:kmalloc_caches
	strd	r8, [sp, #16]
	movw	r9, #:lower16:__stack_chk_guard
	str	lr, [sp, #32]
	ldr	r3, [r10, #28]
	movt	r9, #:upper16:__stack_chk_guard
	ldr	r2, [r9]
	.pad #156
	sub	sp, sp, #156
	ldr	r4, [r0, #8]
	ldr	r5, [r0, #368]
	cmp	r3, #0
	str	r2, [sp, #148]
	beq	.L1808
	mov	r0, r3
	mov	r2, #84
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	beq	.L1663
.L1655:
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
	bne	.L1660
	mov	r0, fp
	bl	create_flush_cmd_control
	subs	r4, r0, #0
	bne	.L1654
	ldr	r3, [fp]
.L1660:
	ldr	r2, [fp, #28]
	ldr	r3, [r3, #208]
	ldr	r5, [r2, #80]
	ldr	r4, [r3]
	cmp	r5, #0
	beq	.L1946
.L1661:
	lsr	r2, r4, #20
	ubfx	r4, r4, #0, #20
	movw	r3, #:lower16:.LC16
	movw	r0, #:lower16:issue_discard_thread
	movt	r3, #:upper16:.LC16
	stm	sp, {r2, r4}
	movt	r0, #:upper16:issue_discard_thread
	mov	r1, fp
	mvn	r2, #0
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L1665
	bl	wake_up_process
	str	r4, [r5]
.L1784:
	ldr	r0, [r10, #28]
	ldr	r7, [fp, #8]
	cmp	r0, #0
	beq	.L1810
	mov	r2, #120
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r6, r0, #0
	beq	.L1663
.L1666:
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
	beq	.L1947
.L1785:
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
	beq	.L1948
.L1669:
	ldr	r3, [fp, #28]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1678
	mov	r5, #0
	ldr	r3, [r6, #60]
	mov	r8, r5
	b	.L1674
.L1930:
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1786:
	str	r0, [r4, #12]
	ldr	r3, [r6, #60]
	add	r2, r3, r5
	ldr	r2, [r2, #12]
	cmp	r2, #0
	beq	.L1663
.L1673:
	ldr	r2, [fp, #28]
	add	r8, r8, #1
	add	r5, r5, #24
	ldr	r2, [r2, #32]
	cmp	r8, r2
	bcs	.L1678
.L1674:
	ldr	r0, [r10, #24]
	add	r4, r3, r5
	cmp	r0, #0
	moveq	r0, #16
	beq	.L1670
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1670:
	str	r0, [r4, #4]
	ldr	r0, [r10, #24]
	ldr	r4, [r6, #60]
	cmp	r0, #0
	add	r4, r4, r5
	moveq	r0, #16
	beq	.L1671
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1671:
	str	r0, [r4, #8]
	ldr	r3, [r6, #60]
	add	r4, r3, r5
	ldr	r2, [r4, #4]
	cmp	r2, #0
	beq	.L1663
	ldr	r2, [r4, #8]
	cmp	r2, #0
	beq	.L1663
	ldr	r2, [fp]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #492]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	bne	.L1672
	ldr	r2, [r2, #616]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	beq	.L1673
.L1672:
	ldr	r0, [r10, #24]
	cmp	r0, #0
	bne	.L1930
	mov	r0, #16
	b	.L1786
.L1946:
	ldr	r0, [r10, #52]
	cmp	r0, #0
	beq	.L1809
	movw	r2, #4176
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L1663
.L1662:
	add	ip, r5, #4096
	add	r2, r5, #4
	add	ip, ip, #12
	add	r3, r5, #12
	str	r2, [r5, #4]
	str	r2, [r5, #8]
.L1664:
	str	r3, [r3]
	str	r3, [r3, #4]
	add	r3, r3, #8
	cmp	ip, r3
	bne	.L1664
	add	r6, r5, #4096
	movw	r1, #:lower16:.LC14
	ldr	r2, .L1976
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
	ldr	r2, .L1976
	lsl	r3, ip, lr
	str	r3, [r6, #56]
	bl	__init_waitqueue_head
	ldr	r3, [fp, #28]
	str	r5, [r3, #80]
	b	.L1661
.L1967:
	mov	r2, r0
	ldr	r1, [sp, #20]
	mov	r0, fp
	bl	restore_node_summary
	cmp	r0, #0
	beq	.L1727
	cmp	r9, #0
	mov	r3, r9
	mov	r5, r9
	mov	r4, r0
	ldr	r9, [sp, #28]
	beq	.L1654
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1949
.L1728:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	bl	put_page
.L1654:
	ldr	r2, [sp, #148]
	mov	r0, r4
	ldr	r3, [r9]
	cmp	r2, r3
	bne	.L1950
	add	sp, sp, #156
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1808:
	mov	r0, #16
	b	.L1655
.L1975:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #88]
	bne	.L1806
.L1663:
	mvn	r4, #11
	b	.L1654
.L1809:
	mov	r5, #16
	b	.L1662
.L1810:
	mov	r6, #16
	b	.L1666
.L1678:
	ldr	r0, [r10, #24]
	cmp	r0, #0
	beq	.L1951
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r6, #24]
	beq	.L1663
.L1679:
	ldr	r3, [fp, #700]
	cmp	r3, #1
	bls	.L1681
	ldr	r4, [fp, #708]
	movw	r1, #33488
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #64]
	beq	.L1952
.L1681:
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
	beq	.L1663
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
	ldr	r2, .L1976
	movw	r1, #:lower16:.LC17
	add	r0, r6, #40
	movt	r1, #:upper16:.LC17
	strd	r4, [r6, #80]
	bl	__mutex_init
	ldr	r0, [r10, #24]
	cmp	r0, #0
	beq	.L1813
	mov	r2, #24
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r6, r0, #0
	beq	.L1663
.L1686:
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
	beq	.L1953
.L1788:
	ldr	r5, [fp, #708]
	mov	r1, #720
	add	r5, r5, #31
	lsr	r5, r5, #5
	lsl	r5, r5, #2
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r6, #20]
	beq	.L1954
.L1789:
	cmp	r4, #0
	bne	.L1955
.L1689:
	cmp	r5, #0
	bne	.L1956
.L1690:
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
	beq	.L1663
	ldr	r3, [fp, #28]
	movw	r6, #:lower16:.LC18
	movw	r7, #:lower16:.LC19
	ldr	r5, .L1976
	mov	r4, r0
	movt	r6, #:upper16:.LC18
	movt	r7, #:upper16:.LC19
	add	r8, r0, #384
	str	r0, [r3, #12]
.L1695:
	mov	r0, r4
	mov	r2, r5
	mov	r1, r6
	bl	__mutex_init
	ldr	r0, [r10, #48]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #20]
	beq	.L1692
	mov	r2, #4096
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #20]
	beq	.L1663
.L1692:
	add	r0, r4, #24
	mov	r2, r5
	mov	r1, r7
	bl	__init_rwsem
	ldr	r0, [r10, #36]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #40]
	beq	.L1694
	movw	r2, #507
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #40]
	beq	.L1663
.L1694:
	mvn	r2, #0
	mov	r3, #0
	add	r4, r4, #64
	str	r2, [r4, #-16]
	strh	r3, [r4, #-12]	@ movhi
	cmp	r8, r4
	bne	.L1695
	ldr	r8, [fp, #368]
	ldr	r3, [r8, #132]	@ unaligned
	ands	r0, r3, #4
	moveq	r2, #6
	moveq	r7, r0
	beq	.L1696
	ldrb	r3, [r8, #176]	@ zero_extendqisi2
	ldrb	r2, [r8, #177]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhne	r3, [r8, #116]	@ unaligned
	ldreq	r3, [fp, #696]
	cmp	r2, #1
	ldrhne	r2, [r8, #118]	@ unaligned
	ldreq	r2, [fp, #696]
	add	r3, r3, r2
	ldrb	r2, [r8, #178]	@ zero_extendqisi2
	cmp	r2, #1
	ldreq	r2, [fp, #696]
	ldrhne	r2, [r8, #120]	@ unaligned
	add	r3, r2, r3
	cmp	r3, #440
	blt	.L1703
	ldr	r1, [fp, #8]
	sub	r3, r3, #436
	ldr	r0, [fp, #372]
	sub	r3, r3, #3
	cmp	r3, #584
	ldr	ip, [r8, #140]	@ unaligned
	movle	r2, #2
	movgt	r2, #3
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
.L1703:
	ldr	r3, [fp, #8]
	movw	r1, #:lower16:.LC2
	mov	r0, fp
	ldr	r2, [fp, #372]
	movt	r1, #:upper16:.LC2
	movw	r5, #507
	mov	r7, #0
	ldr	r3, [r3, #76]	@ unaligned
	cmp	r2, #2
	ldreq	r2, [fp, #696]
	addeq	r3, r3, r2
	ldr	r2, [r8, #140]	@ unaligned
	str	r1, [sp, #28]
	add	r3, r2, r3
	mov	r1, r3
	add	r3, r3, #1
	str	r3, [sp, #20]
	bl	get_meta_page
	mov	r4, r0
	bl	page_address
	ldr	r3, [fp, #28]
	mov	r6, r0
	mov	r1, r0
	mov	r2, r5
	str	r6, [sp, #24]
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #40]
	bl	memcpy
	ldr	r3, [fp, #28]
	add	r1, r6, r5
	mov	r2, r5
	movw	r6, #1014
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #168]
	bl	memcpy
	str	r8, [sp, #8]
	mov	r8, fp
	str	r10, [sp, #32]
	str	r9, [sp, #36]
.L1714:
	ldr	lr, [r8, #28]
	add	r3, r7, #20
	lsl	r0, r7, #6
	ldr	r2, [sp, #8]
	add	r1, r7, #56
	ldr	fp, [lr, #12]
	add	r3, r2, r3, lsl #2
	ldr	ip, [r3, #4]	@ unaligned
	add	r3, r2, r1, lsl #1
	mov	r1, #5
	add	fp, fp, r0
	ldrh	r3, [r3, #4]	@ unaligned
	str	ip, [fp, #60]
	ldr	ip, [r8, #28]
	uxth	r9, r3
	str	r3, [sp, #40]
	mov	r3, #0	@ movhi
	ldr	r5, [ip, #12]
	add	r5, r5, r0
	ldr	r10, [r5, #20]
	ldr	r0, [r5, #60]
	str	r0, [r5, #48]
	ldr	lr, [r8, #700]
	ldr	ip, [r8, #704]
	strh	r3, [r5, #52]	@ movhi
	mvn	r3, #0
	str	r3, [r5, #60]
	udiv	lr, r0, lr
	add	r0, r10, #4080
	add	r0, r0, #11
	udiv	ip, lr, ip
	str	ip, [r5, #56]
	bl	__memzero
	mov	r3, #0
	ldr	r2, [sp, #8]
	strb	r3, [r10, #4091]
	ldr	ip, [r8, #28]
	ldr	r1, [r5, #48]
	add	r0, r2, r7
	ldr	r3, [sp, #40]
	ldr	ip, [ip]
	add	r1, r1, r1, lsl #1
	ldr	ip, [ip, #60]
	ldrb	lr, [ip, r1, lsl #3]	@ zero_extendqisi2
	bfi	lr, r7, #0, #6
	strb	lr, [ip, r1, lsl #3]
	ldrb	r1, [r0, #176]	@ zero_extendqisi2
	cmp	r1, #1
	strb	r1, [fp, #44]
	strh	r3, [fp, #52]	@ movhi
	ldreq	r9, [r8, #696]
	uxtheq	r9, r9
	cmp	r9, #0
	beq	.L1708
	str	r7, [sp, #40]
	ldr	r7, [sp, #20]
	mov	r5, #0
	ldr	r0, [sp, #24]
	movw	r10, #4091
.L1713:
	add	r3, r0, r6
	ldr	ip, [fp, #20]
	rsb	r1, r5, r5, lsl #3
	ldr	lr, [r3]	@ unaligned
	add	r2, r6, #14
	cmp	r2, r10
	addls	r6, r6, #7
	add	r2, ip, r1
	str	lr, [ip, r1]	@ unaligned
	ldrh	r1, [r3, #4]	@ unaligned
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	strh	r1, [r2, #4]	@ unaligned
	strb	r3, [r2, #6]
	bls	.L1710
	cmp	r4, #0
	beq	.L1711
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1957
.L1712:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1711:
	mov	r1, r7
	mov	r0, r8
	bl	get_meta_page
	add	r7, r7, #1
	mov	r6, #0
	mov	r4, r0
	bl	page_address
.L1710:
	add	r5, r5, #1
	cmp	r5, r9
	bne	.L1713
	str	r7, [sp, #20]
	ldr	r7, [sp, #40]
	str	r0, [sp, #24]
.L1708:
	add	r7, r7, #1
	cmp	r7, #3
	bne	.L1714
	cmp	r4, #0
	mov	fp, r8
	ldr	r10, [sp, #32]
	ldr	r9, [sp, #36]
	beq	.L1958
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1959
.L1716:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
	ldr	r8, [fp, #368]
	mov	r2, #3
	mov	r0, r2
	ldr	r3, [r8, #132]	@ unaligned
.L1696:
	ands	r3, r3, #33
	beq	.L1718
	ldr	r3, [fp, #8]
	ldr	r1, [fp, #372]
	ldr	ip, [r3, #76]	@ unaligned
	cmp	r1, #2
	beq	.L1960
.L1791:
	ldr	lr, [r8, #136]	@ unaligned
	sub	r1, r0, #7
	mov	r3, #1
	mov	r0, fp
	str	r3, [sp]
	mov	r3, #0
	add	r1, r1, lr
	add	r1, r1, ip
	bl	ra_meta_pages
	ldr	r8, [fp, #368]
	ldr	r3, [r8, #132]	@ unaligned
	and	r3, r3, #33
.L1718:
	movw	r2, #:lower16:.LC2
	lsl	r1, r7, #6
	movt	r2, #:upper16:.LC2
	mov	r5, #0
	str	r1, [sp, #8]
	str	r9, [sp, #28]
	str	r2, [sp, #32]
	mov	r2, r3
	str	r10, [sp, #36]
	mov	r10, r8
	b	.L1732
.L1964:
	add	lr, r7, #20
	add	ip, r7, #56
	ldr	r1, [fp, #8]
	add	lr, r10, lr, lsl #2
	cmp	r2, #0
	ldr	r0, [fp, #372]
	add	r2, r10, ip, lsl #1
	ldr	r3, [lr, #4]	@ unaligned
	str	r3, [sp, #20]
	ldrh	r3, [r2, #4]	@ unaligned
	str	r3, [sp, #24]
	ldr	r1, [r1, #76]	@ unaligned
	beq	.L1961
	cmp	r0, #2
	beq	.L1962
.L1795:
	ldr	r2, [r10, #136]	@ unaligned
	add	r2, r2, r7
	sub	r2, r2, #7
	add	r1, r2, r1
.L1722:
	mov	r0, fp
	bl	get_meta_page
	mov	r9, r0
	bl	page_address
	mov	r6, r0
.L1727:
	ldr	r2, [fp, #28]
	ldr	r3, [sp, #8]
	ldr	r4, [r2, #12]
	add	r4, r4, r3
	add	r8, r4, #24
	mov	r0, r4
	bl	mutex_lock
	mov	r0, r8
	bl	down_write
	add	r1, r6, #3584
	movw	r2, #507
	ldr	r0, [r4, #40]
	bl	memcpy
	mov	r0, r8
	bl	up_write
	mov	r1, r6
	mov	r2, #3584
	ldr	r0, [r4, #20]
	bl	memcpy
	movw	r0, #4091
	ldr	r2, [r4, #20]
	mvn	r3, #0
	add	r6, r6, r0
	mov	r1, #5
	ldr	ip, [r6]	@ unaligned
	str	ip, [r2, #4091]	@ unaligned
	ldrb	ip, [r6, #4]	@ zero_extendqisi2
	strb	ip, [r2, #4095]
	ldr	ip, [sp, #20]
	str	ip, [r4, #60]
	ldr	r2, [fp, #28]
	ldr	r6, [r2, #12]
	ldr	r2, [sp, #8]
	add	r6, r6, r2
	ldr	r8, [r6, #20]
	ldr	r2, [r6, #60]
	add	r0, r8, r0
	str	r2, [r6, #48]
	ldr	lr, [fp, #700]
	ldr	ip, [fp, #704]
	strh	r5, [r6, #52]	@ movhi
	str	r3, [r6, #60]
	udiv	r2, r2, lr
	udiv	ip, r2, ip
	str	ip, [r6, #56]
	bl	__memzero
	cmp	r7, #2
	add	r3, r10, r7
	movle	r2, #0
	movgt	r2, #1
	mov	r0, r4
	strb	r2, [r8, #4091]
	ldr	r2, [r6, #48]
	ldr	r1, [fp, #28]
	add	r2, r2, r2, lsl #1
	ldr	r1, [r1]
	ldr	r1, [r1, #60]
	ldrb	ip, [r1, r2, lsl #3]	@ zero_extendqisi2
	bfi	ip, r7, #0, #6
	strb	ip, [r1, r2, lsl #3]
	ldr	r2, [sp, #24]
	ldrb	r3, [r3, #176]	@ zero_extendqisi2
	strb	r3, [r4, #44]
	strh	r2, [r4, #52]	@ movhi
	bl	mutex_unlock
	cmp	r9, #0
	beq	.L1729
	ldr	r3, [r9]
	tst	r3, #1
	beq	.L1963
.L1730:
	mov	r0, r9
	bl	unlock_page
	mov	r0, r9
	bl	put_page
.L1729:
	ldr	r3, [sp, #8]
	add	r7, r7, #1
	cmp	r7, #6
	add	r3, r3, #64
	str	r3, [sp, #8]
	beq	.L1731
	ldr	r10, [fp, #368]
	ldr	r2, [r10, #132]	@ unaligned
	and	r2, r2, #33
.L1732:
	cmp	r7, #2
	ble	.L1964
	add	r0, r7, #5
	add	r1, r7, #29
	add	r0, r10, r0, lsl #2
	cmp	r2, #0
	add	r2, r10, r1, lsl #1
	ldr	r3, [r0, #4]	@ unaligned
	sub	r0, r7, #3
	str	r3, [sp, #20]
	ldrh	r3, [r2, #4]	@ unaligned
	str	r3, [sp, #24]
	beq	.L1965
	ldr	r2, [fp, #8]
	ldr	r1, [fp, #372]
	ldr	r2, [r2, #76]	@ unaligned
	cmp	r1, #2
	beq	.L1966
.L1797:
	ldr	r1, [r10, #136]	@ unaligned
	sub	r1, r1, #4
	add	r1, r1, r0
	add	r1, r1, r2
.L1725:
	mov	r0, fp
	bl	get_meta_page
	mov	r9, r0
	bl	page_address
	ldr	r2, [fp, #368]
	mov	r6, r0
	ldr	r2, [r2, #132]	@ unaligned
	tst	r2, #33
	beq	.L1967
	ldr	r2, [fp, #696]
	cmp	r2, #0
	movne	r2, r0
	movne	r1, #0
	beq	.L1727
.L1726:
	strb	r5, [r2, #4]
	add	r1, r1, #1
	add	r2, r2, #7
	strb	r5, [r2, #-2]
	strb	r5, [r2, #-1]
	ldr	r3, [fp, #696]
	cmp	r3, r1
	bhi	.L1726
	b	.L1727
.L1665:
	mov	r0, r5
	str	r4, [r5]
	bl	kfree
	ldr	r3, [fp, #28]
	mov	r2, #0
	cmp	r4, #0
	str	r2, [r3, #80]
	bne	.L1654
	b	.L1784
.L1951:
	mov	r3, #16
	str	r3, [r6, #24]
	b	.L1679
.L1813:
	mov	r6, #16
	b	.L1686
.L1961:
	cmp	r0, #2
	bne	.L1793
	ldr	r2, [fp, #696]
	add	r1, r1, r2
.L1793:
	ldr	r2, [r10, #136]	@ unaligned
	add	r2, r2, r7
	sub	r2, r2, #4
	add	r1, r2, r1
	b	.L1722
.L1947:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #60]
	bne	.L1785
	b	.L1663
.L1965:
	ldr	r2, [fp, #28]
	ldr	r3, [sp, #20]
	ldr	r1, [r2, #24]
	add	r1, r3, r1
	b	.L1725
.L1948:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #28]
	bne	.L1669
	b	.L1663
.L1956:
	mov	r2, r5
	mov	r1, #255
	bl	memset
	b	.L1690
.L1955:
	mov	r2, r4
	mov	r1, #255
	ldr	r0, [r6, #16]
	bl	memset
	ldr	r0, [r6, #20]
	b	.L1689
.L1966:
	ldr	r1, [fp, #696]
	add	r2, r2, r1
	b	.L1797
.L1954:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r5
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #20]
	bne	.L1789
	b	.L1663
.L1953:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r4
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #16]
	bne	.L1788
	b	.L1663
.L1962:
	ldr	r2, [fp, #696]
	add	r1, r1, r2
	b	.L1795
.L1977:
	.align	2
.L1976:
	.word	.LANCHOR0+16
.L1731:
	ldr	r1, [fp, #28]
	movw	r2, #:lower16:.LC13
	movw	r0, #:lower16:.LC2
	movt	r2, #:upper16:.LC13
	movt	r0, #:upper16:.LC2
	ldr	r9, [sp, #28]
	ldr	r10, [sp, #36]
	movw	r3, #4767
	str	r2, [sp, #44]
	mov	r2, #0
	movt	r3, 10724
	str	r0, [sp, #60]
	ldr	r0, [r1, #12]
	str	r2, [sp, #36]
	ldr	r2, [r1, #32]
	ldr	r1, [r1]
	add	r2, r2, #54
	str	r0, [sp, #56]
	ldr	r0, [r0, #168]
	str	r9, [sp, #68]
	mov	r9, r1
	str	r0, [sp, #40]
	umull	r0, r3, r3, r2
	str	r1, [sp, #48]
	str	r10, [sp, #64]
	sub	r2, r2, r3
	add	r3, r3, r2, lsr #1
	lsr	r3, r3, #5
	str	r3, [sp, #52]
.L1747:
	ldr	r4, [sp, #36]
	mov	r0, #1
	mov	r3, #2
	mov	r2, #256
	str	r0, [sp]
	mov	r0, fp
	mov	r1, r4
	bl	ra_meta_pages
	ldr	r3, [r9, #36]
	add	r2, r4, r0
	str	r2, [sp, #36]
	mul	r5, r3, r4
	mul	r3, r2, r3
	cmp	r5, r3
	str	r3, [sp, #24]
	bcs	.L1733
	ldr	r2, [fp, #28]
	ldr	r3, [r2, #32]
	cmp	r5, r3
	bcs	.L1733
	add	r3, sp, #74
	add	r8, r5, r5, lsl #1
	str	r3, [sp, #28]
	add	r3, sp, #76
	lsl	r8, r8, #3
	str	r3, [sp, #20]
	add	r3, sp, #140
	str	r3, [sp, #8]
.L1746:
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
	bcc	.L1968
.L1734:
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
	ldr	r0, [sp, #28]
	mov	r1, r6
	bl	memcpy
	ldr	r3, [r6, #66]	@ unaligned
	cmp	r7, #0
	ldrh	r10, [r6]	@ unaligned
	ldr	r6, [r6, #70]	@ unaligned
	str	r3, [sp, #32]
	beq	.L1736
	ldr	r2, [r7]
	tst	r2, #1
	beq	.L1969
.L1737:
	mov	r0, r7
	bl	unlock_page
	mov	r0, r7
	bl	put_page
.L1736:
	ldr	r2, [fp, #696]
	ubfx	r7, r10, #0, #10
	cmp	r7, r2
	bhi	.L1738
	ldr	r2, [fp, #28]
	ldr	r2, [r2, #28]
	sub	r2, r2, #1
	cmp	r2, r5
	bcc	.L1738
.L1739:
	ldrh	r0, [r4]
	uxth	r7, r7
	ldrh	ip, [r4, #2]
	ldr	r1, [r4, #4]
	ldr	r2, [sp, #20]
	bfi	r0, r7, #6, #10
	bfi	ip, r7, #0, #10
	strh	r0, [r4]	@ movhi
	strh	ip, [r4, #2]	@ movhi
.L1740:
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
	bne	.L1740
	ldr	r1, [r4, #8]
	ldr	r2, [sp, #20]
.L1741:
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
	bne	.L1741
	ldrb	r2, [r4]	@ zero_extendqisi2
	asr	r3, r10, #10
	str	r6, [r4, #20]
	ldr	r1, [sp, #32]
	bfi	r2, r3, #0, #6
	strb	r2, [r4]
	str	r1, [r4, #16]
	ldr	r3, [fp]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1742
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1743
.L1742:
	ldr	r3, [fp, #368]
	ldr	r0, [r4, #12]
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #256
	beq	.L1970
	mov	r2, #64
	mov	r1, #255
	bl	memset
.L1743:
	ldr	r3, [fp, #700]
	cmp	r3, #1
	bls	.L1745
	ldr	r2, [fp, #28]
	udiv	r3, r5, r3
	ldrh	r0, [r4]
	ldr	r2, [r2]
	ldr	r1, [r2, #64]
	ldr	r2, [r1, r3, lsl #2]
	add	r2, r2, r0, lsr #6
	str	r2, [r1, r3, lsl #2]
.L1745:
	ldr	r3, [sp, #24]
	add	r5, r5, #1
	cmp	r3, r5
	beq	.L1733
	ldr	r2, [fp, #28]
	add	r8, r8, #24
	ldr	r3, [r2, #32]
	cmp	r5, r3
	bcc	.L1746
.L1733:
	ldr	r2, [sp, #36]
	ldr	r3, [sp, #52]
	cmp	r3, r2
	bhi	.L1747
	ldr	r3, [sp, #56]
	ldr	r10, [sp, #64]
	ldr	r9, [sp, #68]
	add	r3, r3, #152
	mov	r0, r3
	str	r3, [sp, #64]
	bl	down_read
	ldr	r2, [sp, #40]
	ldrh	r3, [r2]	@ unaligned
	cmp	r3, #0
	beq	.L1748
	movw	r3, #:lower16:.LC13
	add	r5, r2, #6
	str	r10, [sp, #52]
	add	r2, sp, #74
	movt	r3, #:upper16:.LC13
	str	r2, [sp, #44]
	add	r2, sp, #76
	str	r9, [sp, #56]
	str	r3, [sp, #68]
	mov	r3, #0
	str	r2, [sp, #20]
	mov	r9, r3
	add	r2, sp, #140
	str	r2, [sp, #24]
.L1749:
	ldr	r2, [sp, #40]
	mov	r3, #78
	mov	r1, r5
	ldr	r0, [sp, #44]
	mla	r3, r3, r9, r2
	ldr	r2, [sp, #48]
	ldr	r8, [r3, #2]	@ unaligned
	ldr	r4, [r2, #60]
	mov	r2, #74
	bl	memcpy
	ldrh	r3, [r5]	@ unaligned
	ldr	r2, [fp, #696]
	add	r10, r8, r8, lsl #1
	ldr	r1, [r5, #66]	@ unaligned
	lsl	r7, r10, #3
	str	r3, [sp, #28]
	ubfx	r3, r3, #0, #10
	cmp	r3, r2
	ldrh	r2, [r4, r7]
	add	r6, r4, r7
	str	r1, [sp, #32]
	ldr	r1, [r5, #70]	@ unaligned
	lsr	r2, r2, #6
	str	r2, [sp, #8]
	str	r1, [sp, #36]
	bhi	.L1750
	ldr	r2, [fp, #28]
	ldr	r2, [r2, #28]
	sub	r2, r2, #1
	cmp	r8, r2
	bhi	.L1750
.L1751:
	ldrh	r2, [r4, r7]
	uxth	r0, r3
	str	r4, [sp, #60]
	ldr	r3, [sp, #20]
	bfi	r2, r0, #6, #10
	strh	r2, [r4, r7]	@ movhi
	ldrh	r1, [r6, #2]
	ldr	r2, [r6, #4]
	bfi	r1, r0, #0, #10
	strh	r1, [r6, #2]	@ movhi
.L1752:
	ldr	r4, [sp, #24]
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
	bne	.L1752
	ldr	r2, [r6, #8]
	ldr	r3, [sp, #20]
	ldr	r4, [sp, #60]
.L1753:
	ldr	r1, [r3, #12]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-16]	@ unaligned
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	str	r1, [sp, #60]
	ldr	r1, [sp, #24]
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	cmp	r3, r1
	ldr	r1, [sp, #60]
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1753
	ldr	r3, [sp, #28]
	ldrb	r2, [r4, r10, lsl #3]	@ zero_extendqisi2
	asr	r3, r3, #10
	bfi	r2, r3, #0, #6
	ldr	r3, [sp, #32]
	strb	r2, [r4, r10, lsl #3]
	str	r3, [r6, #16]
	ldr	r3, [sp, #36]
	str	r3, [r6, #20]
	ldr	r3, [fp]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #492]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1754
	ldr	r3, [r3, #616]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1755
.L1754:
	ldr	r3, [fp, #368]
	ldr	r0, [r6, #12]
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #256
	beq	.L1971
	mov	r2, #64
	mov	r1, #255
	bl	memset
.L1755:
	ldr	r3, [fp, #700]
	cmp	r3, #1
	bls	.L1757
	ldr	r2, [fp, #28]
	udiv	r8, r8, r3
	add	r9, r9, #1
	ldrh	r1, [r4, r7]
	add	r5, r5, #78
	ldr	r3, [r2]
	ldr	r2, [r3, #64]
	ldr	r3, [r2, r8, lsl #2]
	add	r3, r3, r1, lsr #6
	ldr	r1, [sp, #8]
	sub	r3, r3, r1
	str	r3, [r2, r8, lsl #2]
	ldr	r3, [sp, #40]
	ldrh	r3, [r3]	@ unaligned
	cmp	r9, r3
	bcc	.L1749
.L1945:
	ldr	r10, [sp, #52]
	ldr	r9, [sp, #56]
.L1748:
	ldr	r0, [sp, #64]
	bl	up_read
	ldr	r2, [fp, #28]
	ldr	r3, [r2, #32]
	cmp	r3, #0
	beq	.L1759
	mov	r6, #0
	mov	r5, r6
	b	.L1763
.L1760:
	ldr	r2, [r3, #12]
	add	r1, r2, r1, lsr #6
	str	r1, [r3, #12]
.L1762:
	ldr	r2, [fp, #28]
	add	r5, r5, #1
	add	r6, r6, #24
	ldr	r3, [r2, #32]
	cmp	r5, r3
	bcs	.L1759
.L1763:
	ldr	r3, [r2]
	ldr	r1, [r3, #60]
	ldrh	r1, [r1, r6]
	bic	r0, r1, #63
	cmp	r0, #0
	bne	.L1760
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
	bcs	.L1972
.L1761:
	mov	r0, r8
	bl	_raw_spin_unlock
	b	.L1762
.L1970:
	ldr	r3, [r4, #4]
	add	r2, r3, #64
.L1744:
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
	bne	.L1744
	ldr	r1, [fp, #696]
	ldr	r3, [fp, #744]
	ldrh	r2, [r4]
	add	r3, r3, r1
	sub	r3, r3, r2, lsr #6
	str	r3, [fp, #744]
	b	.L1743
.L1738:
	movw	r1, #663
	ldr	r0, [sp, #44]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1739
.L1968:
	movw	r1, #625
	ldr	r0, [sp, #44]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1734
.L1969:
	movw	r1, #1716
	ldr	r0, [sp, #60]
	bl	warn_slowpath_null
	ldr	r2, [r7, #4]
	mov	r0, #2
	ldr	r2, [r2]
	ldr	r2, [r2, #28]
	ldr	r1, [r2, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1737
.L1757:
	ldr	r3, [sp, #40]
	add	r9, r9, #1
	add	r5, r5, #78
	ldrh	r3, [r3]	@ unaligned
	cmp	r9, r3
	bcc	.L1749
	b	.L1945
.L1971:
	ldr	r2, [r6, #4]
	mov	r3, r0
	add	r1, r2, #64
.L1756:
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
	bne	.L1756
	ldr	r3, [fp, #744]
	ldr	r1, [sp, #8]
	ldrh	r2, [r4, r7]
	add	r3, r1, r3
	sub	r3, r3, r2, lsr #6
	str	r3, [fp, #744]
	b	.L1755
.L1750:
	movw	r1, #663
	ldr	r0, [sp, #68]
	str	r3, [sp, #60]
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp, #60]
	b	.L1751
.L1759:
	mov	r5, #0
	b	.L1768
.L1765:
	mov	r0, r7
	add	r5, r5, #64
	bl	_raw_spin_unlock
	cmp	r5, #384
	beq	.L1767
	ldr	r2, [fp, #28]
.L1768:
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
	bne	.L1765
	ldr	r3, [r4, #4]
	udiv	r0, r8, r6
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	str	r3, [r4, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1765
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1765
.L1767:
	ldr	r0, [r10, #28]
	cmp	r0, #0
	beq	.L1816
	mov	r2, #92
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L1663
.L1769:
	ldr	ip, [fp, #28]
	add	r6, r7, #36
	movw	r1, #:lower16:.LC20
	mov	r0, r6
	movt	r1, #:upper16:.LC20
	ldr	r2, .L1976
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
	b	.L1771
.L1805:
	add	r7, r7, #4
	cmp	r6, r7
	beq	.L1973
.L1771:
	movw	r1, #33488
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r7]
	bne	.L1805
	ldr	r2, [r5]
	movw	r1, #32976
	mov	r0, r4
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r7]
	bne	.L1805
	b	.L1663
.L1963:
	movw	r1, #1716
	ldr	r0, [sp, #32]
	bl	warn_slowpath_null
	ldr	r3, [r9, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1730
.L1957:
	movw	r1, #1716
	ldr	r0, [sp, #28]
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1712
.L1972:
	mov	r0, r3
	ldr	r1, [r4, #20]
	bl	_clear_bit
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1761
.L1973:
	ldr	r3, [fp, #28]
	movw	r6, #:lower16:.LC0
	mov	r2, #0
	movt	r6, #:upper16:.LC0
	str	r2, [sp, #8]
	ldr	r8, [r3, #4]
	ldr	r5, [r3, #8]
	ldr	r4, [r3, #32]
	add	r7, r8, #12
	add	r5, r5, #36
.L1772:
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r2, [sp, #8]
	mov	r1, r4
	ldr	r0, [r8, #16]
	bl	_find_next_bit_le
	mov	r10, r0
	mov	r0, r7
	bl	_raw_spin_unlock
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	cmp	r10, r4
	bcs	.L1773
	ldr	r1, [r3]
	add	r3, r10, r10, lsl #1
	add	r2, r10, #1
	lsl	r3, r3, #3
	str	r2, [sp, #8]
	ldr	r2, [fp, #696]
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	moveq	r1, #1
	movne	r1, #0
	cmp	r3, r2
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L1772
	cmp	r3, r2
	bhi	.L1974
	mov	r0, r5
	bl	mutex_lock
	mov	r1, r10
	mov	r2, #6
	mov	r0, fp
	bl	__locate_dirty_segment
	mov	r0, r5
	bl	mutex_unlock
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	b	.L1772
.L1952:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r6, #64]
	bne	.L1681
	b	.L1663
.L1974:
	movw	r1, #3240
	mov	r0, r6
	bl	warn_slowpath_null
	add	r1, fp, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [fp, #28]
	ldr	r4, [r3, #32]
	b	.L1772
.L1773:
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
	beq	.L1975
.L1806:
	ldr	r3, [fp, #28]
	ldr	r6, [r3]
	add	r0, r6, #40
	str	r0, [sp, #20]
	bl	mutex_lock
	mvn	r2, #0
	mvn	r3, #-2147483648
	strd	r2, [r6, #88]
	ldr	r7, [fp, #28]
	ldr	r1, [r7, #32]
	cmp	r1, #0
	beq	.L1777
	ldr	r8, [fp, #700]
	mov	r5, #0
	strd	r2, [sp, #8]
.L1778:
	cmp	r8, #0
	moveq	r0, #0
	moveq	r1, r0
	beq	.L1783
	ldr	lr, [r7]
	add	ip, r8, r5
	add	r3, r5, r5, lsl #1
	add	r2, ip, ip, lsl #1
	mov	r0, #0
	mov	r1, r0
	ldr	ip, [lr, #60]
	add	r3, ip, r3, lsl #3
	add	ip, ip, r2, lsl #3
.L1779:
	ldr	r2, [r3, #16]
	ldr	lr, [r3, #20]
	add	r3, r3, #24
	adds	r0, r0, r2
	adc	r1, r1, lr
	cmp	ip, r3
	bne	.L1779
.L1783:
	mov	r4, r8
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
	ldrd	r0, [sp, #8]
	cmp	r3, r1
	cmpeq	r2, r0
	bcs	.L1780
	strd	r2, [r6, #88]
	ldr	r7, [fp, #28]
	ldr	r8, [fp, #700]
	ldr	r1, [r7, #32]
	add	r5, r5, r8
	cmp	r1, r5
	bls	.L1777
	strd	r2, [sp, #8]
	b	.L1778
.L1780:
	ldr	r3, [r7, #32]
	add	r5, r5, r8
	cmp	r5, r3
	bcc	.L1778
.L1777:
	ldr	r5, [r7]
	mov	r4, #0
	ldrd	r10, [r5, #72]
	bl	get_seconds
	ldr	r1, [r5, #80]
	ldr	ip, [r5, #84]
	adds	r2, r10, r0
	adc	r3, fp, r0, asr #31
	mov	r10, r2
	ldr	r0, [sp, #20]
	mov	fp, r3
	subs	r3, r10, r1
	sbc	r2, fp, ip
	str	r3, [r6, #96]
	str	r2, [r6, #100]
	bl	mutex_unlock
	b	.L1654
.L1816:
	mov	r7, #16
	b	.L1769
.L1960:
	ldr	r3, [fp, #696]
	add	ip, ip, r3
	b	.L1791
.L1958:
	ldr	r8, [r8, #368]
	mov	r2, r7
	mov	r0, r7
	ldr	r3, [r8, #132]	@ unaligned
	b	.L1696
.L1959:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1716
.L1950:
	bl	__stack_chk_fail
.L1949:
	movw	r0, #:lower16:.LC2
	movw	r1, #1716
	movt	r0, #:upper16:.LC2
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #616]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1728
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
	ldr	r8, [r0, #28]
	.pad #4
	sub	sp, sp, #4
	cmp	r8, #0
	beq	.L1978
	ldr	r4, [r8, #76]
	mov	r6, r0
	cmp	r4, #0
	beq	.L1980
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1980
	mov	r3, #0
	str	r3, [r4]
	bl	kthread_stop
.L1980:
	mov	r0, r4
	bl	kfree
	ldr	r2, [r6, #28]
	mov	r3, #0
	str	r3, [r2, #76]
	ldr	r2, [r6, #28]
	ldr	r4, [r2, #80]
	cmp	r4, r3
	beq	.L1981
	ldr	r0, [r4]
	cmp	r0, r3
	beq	.L1982
	str	r3, [r4]
	bl	kthread_stop
.L1982:
	mov	r0, r4
	bl	kfree
	ldr	r3, [r6, #28]
	mov	r2, #0
	str	r2, [r3, #80]
	ldr	r2, [r6, #28]
.L1981:
	ldr	r9, [r2, #8]
	cmp	r9, #0
	beq	.L1983
	mov	r5, #0
	mov	r4, r9
	b	.L1987
.L1984:
	bl	kfree
	add	r5, r5, #1
	mov	r0, r7
	str	r10, [r4, #56]
	bl	mutex_unlock
	cmp	r5, #8
	beq	.L1986
.L1985:
	ldr	r3, [r6, #28]
	ldr	r4, [r3, #8]
.L1987:
	add	r7, r4, #36
	add	r4, r4, r5, lsl #2
	mov	r0, r7
	bl	mutex_lock
	ldr	fp, [r4, #4]
	mov	r0, fp
	bl	is_vmalloc_addr
	subs	r10, r0, #0
	mov	r0, fp
	beq	.L1984
	bl	vfree
	mov	r3, #0
	add	r5, r5, #1
	mov	r0, r7
	str	r3, [r4, #56]
	bl	mutex_unlock
	cmp	r5, #8
	bne	.L1985
.L1986:
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #8]
	ldr	r4, [r3, #88]
	mov	r0, r4
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r4
	bne	.L2041
	bl	kfree
.L1989:
	ldr	r3, [r6, #28]
	mov	r2, #0
	mov	r0, r9
	str	r2, [r3, #8]
	bl	kfree
	ldr	r2, [r6, #28]
.L1983:
	ldr	r7, [r2, #12]
	cmp	r7, #0
	beq	.L1990
	mov	r3, #0
	mov	r4, r7
	add	r5, r7, #384
	str	r3, [r2, #12]
.L1991:
	ldr	r0, [r4, #20]
	add	r4, r4, #64
	bl	kfree
	ldr	r0, [r4, #-24]
	bl	kfree
	cmp	r5, r4
	bne	.L1991
	mov	r0, r7
	bl	kfree
	ldr	r2, [r6, #28]
.L1990:
	ldr	r4, [r2, #4]
	cmp	r4, #0
	beq	.L1992
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r5, [r4, #16]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	bne	.L2042
	bl	kfree
.L1994:
	ldr	r5, [r4, #20]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L1995
	bl	vfree
.L1996:
	mov	r0, r4
	bl	kfree
	ldr	r2, [r6, #28]
.L1992:
	ldr	r4, [r2]
	cmp	r4, #0
	beq	.L1997
	ldr	r3, [r4, #60]
	cmp	r3, #0
	beq	.L1998
	ldr	r2, [r2, #32]
	cmp	r2, #0
	beq	.L1998
	mov	r5, #0
	mov	r7, r5
	b	.L1999
.L2043:
	ldr	r3, [r4, #60]
.L1999:
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
	bcc	.L2043
.L1998:
	ldr	r0, [r4, #24]
	bl	kfree
	ldr	r5, [r4, #60]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L2000
	bl	vfree
.L2001:
	ldr	r5, [r4, #64]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L2002
	bl	vfree
.L2003:
	ldr	r5, [r4, #28]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	beq	.L2004
	bl	vfree
.L2005:
	ldr	r3, [r6, #28]
	mov	r2, #0
	str	r2, [r3]
	ldr	r0, [r4, #16]
	bl	kfree
	mov	r0, r4
	bl	kfree
.L1997:
	mov	r3, #0
	mov	r0, r8
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
.L1978:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L2004:
	bl	kfree
	b	.L2005
.L2002:
	bl	kfree
	b	.L2003
.L2000:
	bl	kfree
	b	.L2001
.L2042:
	bl	vfree
	b	.L1994
.L2041:
	bl	vfree
	b	.L1989
.L1995:
	bl	kfree
	b	.L1996
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
	.type	__key.7523, %object
	.size	__key.7523, 0
__key.7523:
	.type	inmem_entry_slab, %object
	.size	inmem_entry_slab, 4
inmem_entry_slab:
	.space	4
	.type	__key.33400, %object
	.size	__key.33400, 0
__key.33400:
	.type	__key.33824, %object
	.size	__key.33824, 0
__key.33824:
	.type	__key.33826, %object
	.size	__key.33826, 0
__key.33826:
	.type	__key.34409, %object
	.size	__key.34409, 0
__key.34409:
	.type	__key.34428, %object
	.size	__key.34428, 0
__key.34428:
	.type	__key.34429, %object
	.size	__key.34429, 0
__key.34429:
	.type	__key.34501, %object
	.size	__key.34501, 0
__key.34501:
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"/home/Jprimero15/hlte/lolz/fs/f2fs/segment.c\000"
	.space	3
.LC1:
	.ascii	"&x->wait\000"
	.space	3
.LC2:
	.ascii	"/home/Jprimero15/hlte/lolz/fs/f2fs/f2fs.h\000"
	.space	2
.LC3:
	.ascii	"Issue discard failed, ret: %d\000"
	.space	2
.LC4:
	.ascii	"<6>\000"
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
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
// Generated by Lolz Kernel

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
	ldr	r2, [r5, #640]
	udiv	r3, r3, r2
	ldr	r2, [r5, #644]
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
	beq	.L35
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
	beq	.L40
.L35:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L40:
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	b	.L35
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
	beq	.L41
	mov	r5, r2
	ldr	r2, [r3, #112]
	cmp	r2, r4
	beq	.L41
	ldr	r2, [r3, #176]
	cmp	r2, r4
	beq	.L41
	ldr	r2, [r3, #240]
	cmp	r2, r4
	beq	.L41
	ldr	r2, [r3, #304]
	cmp	r2, r4
	beq	.L41
	ldr	r3, [r3, #368]
	cmp	r3, r4
	beq	.L41
	ldr	r7, [r1, #8]
	mov	r6, r0
	mov	r0, r4
	add	r8, r7, r5, lsl #2
	ldr	r1, [r8, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L45
	ldr	r3, [r8, #56]
	add	r3, r3, #1
	str	r3, [r8, #56]
.L45:
	cmp	r5, #6
	beq	.L48
.L41:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L48:
	ldr	r2, [r6, #28]
	add	r3, r4, r4, lsl #1
	ldr	r2, [r2]
	ldr	r2, [r2, #60]
	ldrb	r3, [r2, r3, lsl #3]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r3, #5
	bhi	.L49
	add	r7, r7, r3, lsl #2
	mov	r0, r4
	ldr	r1, [r7, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L41
	ldr	r3, [r7, #56]
	add	r3, r3, #1
	str	r3, [r7, #56]
	b	.L41
.L49:
	movw	r0, #:lower16:.LC0
	mov	r1, #636
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
	beq	.L51
	mov	r7, r4
	b	.L56
.L52:
	cmp	r4, r5
	mov	r7, r4
	beq	.L51
.L56:
	ldr	r3, [r4, #8]
	mov	r2, r4
	ldr	r4, [r4]
	cmp	r3, r6
	bne	.L52
	ldr	r1, [r2, #12]
	cmp	r5, r4
	add	r1, r1, #1
	str	r1, [r2, #12]
	beq	.L50
	cmp	r4, r5
	bne	.L55
	b	.L54
.L63:
	ldr	r4, [r4]
	cmp	r5, r4
	beq	.L54
.L55:
	ldr	r3, [r4, #12]
	cmp	r1, r3
	bhi	.L63
.L54:
	mov	r0, r7
	bl	__list_del_entry
	mov	r2, r4
	mov	r0, r7
	ldr	r1, [r4, #4]
	b	.L62
.L51:
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #80
	movt	r3, #:upper16:.LANCHOR0
	ldr	r4, [r3]
	mov	r0, r4
	bl	kmem_cache_alloc
	cmp	r0, #0
	beq	.L64
.L57:
	mov	r3, #1
	str	r0, [r0]
	mov	r1, r5
	stmib	r0, {r0, r6}
	str	r3, [r0, #12]
	ldr	r2, [r5]
.L62:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	__list_add
.L64:
	mov	r0, r4
	mov	r1, #2128
	bl	kmem_cache_alloc
	b	.L57
.L50:
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
	.type	__submit_bio_wait_endio, %function
__submit_bio_wait_endio:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #60]
	str	r1, [r0, #16]
	b	complete
	.fnend
	.size	__submit_bio_wait_endio, .-__submit_bio_wait_endio
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2fs_issue_discard, %function
f2fs_issue_discard:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	add	ip, r1, r2
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	cmp	r1, ip
	mov	r5, r1
	strd	r6, [sp, #8]
	movcc	r0, #1
	mov	r6, r2
	strd	r8, [sp, #16]
	lsr	r9, r1, #29
	lsl	r8, r2, #3
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	lsl	r10, r1, #3
	lsr	fp, r2, #29
	.pad #28
	sub	sp, sp, #28
	bcs	.L72
.L67:
	ldr	r7, [r4, #28]
	sub	r3, r1, #1
	mvn	lr, #23
	cmn	r3, #3
	ldr	r3, [r7, #16]
	sub	r2, r1, r3
	bhi	.L70
	ldr	lr, [r7, #4]
	ldr	r3, [r4, #632]
	ldr	lr, [lr]
	rsb	lr, lr, r2, lsr r3
	add	lr, lr, lr, lsl #1
	lsl	lr, lr, #3
.L70:
	ldr	r7, [r7]
	add	r1, r1, #1
	ldr	r3, [r4, #636]
	ldr	r7, [r7, #60]
	sub	r3, r3, #1
	and	r3, r3, r2
	mvn	r2, r3
	add	lr, r7, lr
	and	r2, r2, #7
	ldr	lr, [lr, #12]
	lsl	r2, r0, r2
	ldrb	r7, [lr, r3, lsr #3]	@ zero_extendqisi2
	tst	r7, r2
	orr	r2, r7, r2
	strb	r2, [lr, r3, lsr #3]
	bne	.L71
	ldr	r3, [r4, #688]
	sub	r3, r3, #1
	str	r3, [r4, #688]
.L71:
	cmp	r1, ip
	bne	.L67
.L72:
	movw	r3, #:lower16:__tracepoint_f2fs_issue_discard
	ldr	r1, [r4]
	movt	r3, #:upper16:__tracepoint_f2fs_issue_discard
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L85
.L69:
	mov	ip, #80
	ldr	r0, [r1, #208]
	mov	r1, #0
	mov	r2, r10
	mov	r3, r9
	stm	sp, {r8, fp, ip}
	str	r1, [sp, #12]
	bl	blkdev_issue_discard
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L85:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r0, [r2, #4]
	add	r0, r0, #1
	str	r0, [r2, #4]
	ldr	r7, [r3, #16]
	cmp	r7, #0
	beq	.L77
	str	r4, [sp, #20]
	mov	r4, r6
	mov	r6, r5
	mov	r5, r1
.L76:
	mov	r2, r6
	mov	r3, r4
	ldr	ip, [r7]
	mov	r1, r5
	ldr	r0, [r7, #4]
	blx	ip
	ldr	r2, [r7, #8]!
	cmp	r2, #0
	bne	.L76
	ldr	r4, [sp, #20]
.L77:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L86
.L84:
	ldr	r1, [r4]
	b	.L69
.L86:
	bl	preempt_schedule
	b	.L84
	.fnend
	.size	f2fs_issue_discard, .-f2fs_issue_discard
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
	bhi	.L103
	ldr	r2, [r0, #4]
	mov	fp, #1
	ldr	r3, [r4, #632]
	ldr	r8, [r2]
	rsb	r8, r8, r1, lsr r3
	rsbs	r3, r8, #0
	and	r2, r8, #31
	and	r3, r3, #31
	add	r9, r8, #31
	rsbpl	r2, r3, #0
	cmp	r8, #0
	movge	r9, r8
	add	r5, r8, r8, lsl fp
	asr	r9, r9, #5
	lsl	fp, fp, r2
	lsl	r9, r9, #2
	lsl	r3, r5, #3
.L88:
	ldr	r0, [r0]
	ldr	r2, [r4, #636]
	ldr	r5, [r0, #60]
	sub	r6, r2, #1
	and	r6, r6, r1
	ldrh	r10, [r5, r3]
	add	r5, r5, r3
	add	r10, r7, r10, lsr #6
	lsrs	r3, r10, #16
	bne	.L89
	cmp	r2, r10
	bcc	.L89
.L90:
	ldrh	r3, [r5]
	bfi	r3, r10, #6, #10
	strh	r3, [r5]	@ movhi
	ldr	r3, [r4, #28]
	ldr	r10, [r3]
	ldr	r3, [r10, #72]
	ldr	r1, [r10, #76]
	str	r1, [sp, #8]
	str	r3, [sp, #12]
	bl	get_seconds
	ldr	ip, [r10, #80]
	mov	r2, r0
	mvn	r0, r6
	ldr	r3, [sp, #12]
	and	r0, r0, #7
	ldr	r1, [sp, #8]
	ldr	lr, [r10, #84]
	mov	r10, #1
	lsl	r10, r10, r0
	subs	r3, r3, ip
	str	r3, [sp]
	sbc	r3, r1, lr
	str	r3, [sp, #4]
	sxtb	r3, r10
	ldrd	r0, [sp]
	adds	r0, r0, r2
	adc	r1, r1, r2, asr #31
	cmp	r7, #1
	strd	r0, [r5, #16]
	ldr	r2, [r4, #28]
	ldr	r2, [r2]
	strd	r0, [r2, #96]
	bne	.L91
	ldr	r1, [r5, #4]
	ldrb	r2, [r1, r6, lsr #3]	@ zero_extendqisi2
	tst	r2, r10
	orr	r2, r3, r2
	strb	r2, [r1, r6, lsr #3]
	bne	.L108
.L92:
	ldr	r2, [r4]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #500]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L109
.L93:
	ldr	r2, [r5, #12]
	ldrb	r1, [r2, r6, lsr #3]	@ zero_extendqisi2
	orr	r3, r3, r1
	tst	r1, r10
	strb	r3, [r2, r6, lsr #3]
	beq	.L101
.L94:
	ldr	r3, [r5, #8]
	ldrb	r3, [r3, r6, lsr #3]	@ zero_extendqisi2
	tst	r3, r10
	bne	.L98
	ldrh	r3, [r5, #2]
	ubfx	r2, r3, #0, #10
	add	r2, r7, r2
	bfi	r3, r2, #0, #10
	strh	r3, [r5, #2]	@ movhi
.L98:
	ldr	r3, [r4, #28]
	ldr	r1, [r3]
	ldr	r2, [r1, #28]
	ldr	r3, [r2, r9]
	tst	r3, fp
	orr	fp, r3, fp
	str	fp, [r2, r9]
	bne	.L99
	ldr	r3, [r1, #32]
	add	r3, r3, #1
	str	r3, [r1, #32]
.L99:
	ldr	r3, [r4, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #12]
	add	r3, r3, r7
	str	r3, [r2, #12]
	ldr	r3, [r4, #640]
	cmp	r3, #1
	bls	.L87
	ldr	r2, [r4, #28]
	udiv	r8, r8, r3
	ldr	r3, [r2]
	ldr	r3, [r3, #64]
	ldr	r2, [r3, r8, lsl #2]
	add	r7, r2, r7
	str	r7, [r3, r8, lsl #2]
.L87:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L103:
	mov	r9, #0
	mvn	r3, #23
	mov	fp, r9
	mvn	r8, #0
	b	.L88
.L109:
	ldr	r2, [r2, #488]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L93
	b	.L94
.L91:
	ldr	r0, [r5, #4]
	mvn	r2, r3
	ldrb	r1, [r0, r6, lsr #3]	@ zero_extendqisi2
	bic	r3, r1, r3
	tst	r1, r10
	strb	r3, [r0, r6, lsr #3]
	beq	.L110
.L95:
	ldr	r3, [r4]
	ldr	r1, [r3, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #500]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	bne	.L96
	ldr	r3, [r3, #488]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L94
.L96:
	ldr	r3, [r5, #12]
	ldrb	r1, [r3, r6, lsr #3]	@ zero_extendqisi2
	and	r2, r2, r1
	tst	r1, r10
	strb	r2, [r3, r6, lsr #3]
	beq	.L94
	ldr	r3, [r4, #688]
	add	r3, r3, #1
	str	r3, [r4, #688]
	b	.L94
.L108:
	movw	r0, #:lower16:.LC0
	mov	r1, #956
	str	r3, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp]
	b	.L92
.L101:
	ldr	r3, [r4, #688]
	sub	r3, r3, #1
	str	r3, [r4, #688]
	b	.L94
.L89:
	movw	r0, #:lower16:.LC0
	movw	r1, #946
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	b	.L90
.L110:
	movw	r0, #:lower16:.LC0
	movw	r1, #962
	str	r2, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp]
	b	.L95
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
	beq	.L112
	ldr	r3, [r6, #56]
	sub	r3, r3, #1
	str	r3, [r6, #56]
.L112:
	cmp	r4, #6
	beq	.L126
.L111:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L126:
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
	beq	.L115
	ldr	r3, [r4, #56]
	sub	r3, r3, #1
	str	r3, [r4, #56]
.L115:
	ldr	r3, [r7, #28]
	ldr	r0, [r7, #640]
	ldr	r2, [r3]
	cmp	r0, #1
	ble	.L116
	udiv	r3, r5, r0
	ldr	r2, [r2, #64]
	ldr	r3, [r2, r3, lsl #2]
.L117:
	cmp	r3, #0
	bne	.L111
	udiv	r0, r5, r0
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #20]
	ldr	r1, [r8, #88]
	ldr	r8, [sp, #16]
	add	sp, sp, #24
	b	_clear_bit
.L116:
	ldr	r3, [r2, #60]
	ldrh	r3, [r3, r6]
	lsr	r3, r3, #6
	b	.L117
	.fnend
	.size	__remove_dirty_segment, .-__remove_dirty_segment
	.section	.rodata.str1.4
	.align	2
.LC1:
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
	beq	.L127
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L134
.L129:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	put_page
.L127:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L134:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L129
	.fnend
	.size	write_current_sum_page, .-write_current_sum_page
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
	mov	r5, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r0, [r0, #28]
	.pad #36
	sub	sp, sp, #36
	ldr	r3, [r1, #8]
	ldr	r10, [r5, #636]
	str	r1, [sp, #16]
	ldr	ip, [r0]
	add	r3, r3, r3, lsl #1
	lsl	r3, r3, #3
	ldr	r2, [ip, #60]
	ldrh	lr, [r2, r3]
	add	r3, r2, r3
	cmp	r10, lr, lsr #6
	beq	.L135
	ldr	r2, [r5]
	ldr	r1, [r2, #208]
	ldr	r1, [r1, #88]
	ldr	r1, [r1, #500]
	ldr	r1, [r1, #556]
	tst	r1, #16384
	beq	.L191
.L137:
	ldr	r2, [sp, #16]
	ldr	r1, [r3, #4]
	ldr	r7, [ip, #24]
	ldr	r4, [r2]
	ldrd	r2, [r3, #8]
	cmp	r4, #4
	str	r4, [sp, #20]
	beq	.L192
	ldr	r3, [r5, #800]
	tst	r3, #4
	beq	.L135
	bic	lr, lr, #63
	cmp	lr, #0
	beq	.L135
	ldr	ip, [r0, #56]
	ldr	r3, [r0, #60]
	cmp	ip, r3
	bge	.L135
	add	r3, r2, #8
	add	lr, r7, #8
	add	r0, r1, #8
	cmp	r2, lr
	cmpcc	r7, r3
	orr	ip, r1, r2
	movcs	r3, #1
	movcc	r3, #0
	orr	ip, r7, ip
	cmp	r1, lr
	cmpcc	r7, r0
	movcs	r0, #1
	movcc	r0, #0
	tst	ip, #7
	andeq	r3, r3, r0
	movne	r3, #0
	cmp	r3, #0
	beq	.L139
	ldr	lr, [r1]
	ldm	r2, {r0, r3}
	ldr	ip, [r1, #4]
	bic	r0, r0, lr
	bic	r3, r3, ip
	stm	r7, {r0, r3}
	ldr	lr, [r1, #8]
	ldr	r0, [r2, #8]
	ldr	ip, [r1, #12]
	ldr	r3, [r2, #12]
	bic	r0, r0, lr
	bic	r3, r3, ip
	str	r0, [r7, #8]
	str	r3, [r7, #12]
	ldr	lr, [r1, #16]
	ldr	r0, [r2, #16]
	ldr	ip, [r1, #20]
	ldr	r3, [r2, #20]
	bic	r0, r0, lr
	bic	r3, r3, ip
	str	r0, [r7, #16]
	str	r3, [r7, #20]
	ldr	lr, [r1, #24]
	ldr	r0, [r2, #24]
	ldr	ip, [r1, #28]
	ldr	r3, [r2, #28]
	bic	r0, r0, lr
	bic	r3, r3, ip
	str	r0, [r7, #24]
	str	r3, [r7, #28]
	ldr	lr, [r1, #32]
	ldr	r0, [r2, #32]
	ldr	ip, [r1, #36]
	ldr	r3, [r2, #36]
	bic	r0, r0, lr
	bic	r3, r3, ip
	str	r0, [r7, #32]
	str	r3, [r7, #36]
	ldr	r0, [r2, #40]
	ldr	r3, [r2, #44]
	ldr	lr, [r1, #40]
	ldr	ip, [r1, #44]
	bic	r0, r0, lr
	bic	r3, r3, ip
	str	r0, [r7, #40]
	str	r3, [r7, #44]
	ldr	lr, [r1, #48]
	ldr	r0, [r2, #48]
	ldr	ip, [r1, #52]
	ldr	r3, [r2, #52]
	bic	r0, r0, lr
	bic	r3, r3, ip
	str	r0, [r7, #48]
	str	r3, [r7, #52]
	ldr	ip, [r1, #56]
	ldr	r0, [r2, #56]
	ldr	r3, [r2, #60]
	ldr	r1, [r1, #60]
	bic	r2, r0, ip
	bic	r3, r3, r1
	strd	r2, [r7, #56]
	mov	r2, r4
	b	.L142
.L191:
	ldr	r2, [r2, #488]
	ldr	r2, [r2, #8]
	ldr	r2, [r2, #2180]	@ unaligned
	tst	r2, #2
	bne	.L137
.L135:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L192:
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
	beq	.L141
	ldrd	r0, [r2]
	ldr	lr, [r3]
	ldr	ip, [r3, #4]
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
	mov	r2, r4
	mvn	r3, r3
	str	r1, [r7, #56]
	str	r3, [r7, #60]
.L142:
	sub	r2, r2, #4
	mov	r3, #0
	clz	r2, r2
	movt	r3, 65535
	lsr	r2, r2, #5
	mvn	fp, #0
	strd	r2, [sp, #24]
.L144:
	ldr	r3, [sp, #20]
	cmp	r3, #4
	beq	.L162
	ldr	r3, [r5, #28]
	ldrd	r2, [r3, #56]
	cmp	r2, r3
	bgt	.L135
.L162:
	add	fp, fp, #1
	cmp	r10, fp
	bls	.L135
	lsr	r2, fp, #5
	bic	r4, fp, #31
	sub	r4, r10, r4
	add	r2, r7, r2, lsl #2
	and	r0, fp, #31
	mvn	r1, #0
	sub	r2, r2, #4
	b	.L156
.L145:
	cmp	r4, #32
	mov	r0, #0
	sub	r4, r4, #32
	bls	.L135
.L156:
	ldr	r3, [r2, #4]!
	cmp	r3, #0
	rev	r3, r3
	and	fp, r3, r1, lsr r0
	beq	.L145
	cmp	r4, #31
	bhi	.L146
	rsb	r3, r4, #32
	ands	fp, fp, r1, lsl r3
	beq	.L135
.L147:
	ldr	r3, [sp, #28]
	sub	r4, r10, r4
	tst	fp, r3
	moveq	r3, #24
	moveq	r2, #16
	beq	.L148
	lsr	fp, fp, #16
	mov	r3, #8
	mov	r2, #0
.L148:
	tst	fp, #65280
	lsrne	fp, fp, #8
	movne	r3, r2
	tst	fp, #240
	lsrne	fp, fp, #4
	addeq	r3, r3, #4
	tst	fp, #12
	lsrne	fp, fp, #2
	addeq	r3, r3, #2
	tst	fp, #2
	addeq	r3, r3, #1
	add	r4, r3, r4
	cmp	r10, r4
	bls	.L135
	add	r2, r4, #1
	mov	r1, r10
	mov	r0, r7
	bl	__find_rev_next_zero_bit
	ldr	r3, [sp, #24]
	cmp	r4, #0
	mov	fp, r0
	moveq	r3, #0
	cmp	r10, r0
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	bne	.L193
.L157:
	ldr	r6, [r5, #28]
	ldr	r3, [r6, #48]
	add	r8, r6, #48
	cmp	r8, r3
	beq	.L159
	ldr	r0, [r6, #4]
	ldr	r3, [sp, #16]
	ldr	r1, [r5, #632]
	ldr	ip, [r6, #52]
	ldr	r9, [r0]
	ldrd	r2, [r3, #8]
	sub	lr, r1, #32
	rsb	r0, r1, #32
	adds	r2, r2, r9
	adc	r3, r3, #0
	strd	r2, [sp, #8]
	lsl	r3, r3, r1
	ldr	r9, [sp, #8]
	str	r3, [sp, #4]
	ldr	r3, [ip, #8]
	ldr	r2, [sp, #4]
	orr	r2, r2, r9, lsl lr
	ldr	lr, [ip, #12]
	orr	r2, r2, r9, lsr r0
	str	r2, [sp, #4]
	lsl	r2, r9, r1
	str	r2, [sp]
	add	r2, lr, r3
	ldr	r3, [r6, #16]
	ldrd	r0, [sp]
	adds	r0, r0, r3
	mov	r3, #0
	adc	r1, r1, #0
	adds	r0, r0, r4
	adc	r1, r1, #0
	cmp	r1, r3
	cmpeq	r0, r2
	subeq	lr, lr, r4
	addeq	lr, lr, fp
	streq	lr, [ip, #12]
	beq	.L160
.L159:
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, #80
	movt	r3, #:upper16:.LANCHOR0
	ldr	r9, [r3, #4]
	mov	r0, r9
	bl	kmem_cache_alloc
	cmp	r0, #0
	beq	.L194
.L161:
	str	r0, [r0]
	ldr	r1, [sp, #16]
	mov	r2, r8
	str	r0, [r0, #4]
	ldr	r3, [r5, #28]
	sub	lr, fp, r4
	ldrd	r8, [r1, #8]
	ldr	ip, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r5, #632]
	ldr	ip, [ip]
	str	lr, [r0, #12]
	adds	r8, r8, ip
	add	r3, r3, r8, lsl r1
	add	r3, r3, r4
	str	r3, [r0, #8]
	ldr	r1, [r6, #52]
	bl	__list_add
.L160:
	ldr	r2, [r5, #28]
	ldr	r3, [r2, #56]
	sub	r4, r3, r4
	add	r4, r4, fp
	str	r4, [r2, #56]
	b	.L144
.L146:
	cmp	fp, #0
	beq	.L145
	b	.L147
.L193:
	ldr	r3, [sp, #16]
	sub	r2, r0, r4
	ldrd	r0, [r3, #24]
	mov	r3, #0
	cmp	r3, r1
	cmpeq	r2, r0
	bcs	.L157
	b	.L144
.L194:
	mov	r0, r9
	mov	r1, #2128
	bl	kmem_cache_alloc
	b	.L161
.L139:
	ldr	r0, [r1]
	ldr	r3, [r2]
	bic	r3, r3, r0
	str	r3, [r7]
	ldr	r0, [r1, #4]
	ldr	r3, [r2, #4]
	bic	r3, r3, r0
	str	r3, [r7, #4]
	ldr	r0, [r1, #8]
	ldr	r3, [r2, #8]
	bic	r3, r3, r0
	str	r3, [r7, #8]
	ldr	r0, [r1, #12]
	ldr	r3, [r2, #12]
	bic	r3, r3, r0
	str	r3, [r7, #12]
	ldr	r0, [r1, #16]
	ldr	r3, [r2, #16]
	bic	r3, r3, r0
	str	r3, [r7, #16]
	ldr	r0, [r1, #20]
	ldr	r3, [r2, #20]
	bic	r3, r3, r0
	str	r3, [r7, #20]
	ldr	r0, [r1, #24]
	ldr	r3, [r2, #24]
	bic	r3, r3, r0
	str	r3, [r7, #24]
	ldr	r0, [r1, #28]
	ldr	r3, [r2, #28]
	bic	r3, r3, r0
	str	r3, [r7, #28]
	ldr	r0, [r1, #32]
	ldr	r3, [r2, #32]
	bic	r3, r3, r0
	str	r3, [r7, #32]
	ldr	r0, [r1, #36]
	ldr	r3, [r2, #36]
	bic	r3, r3, r0
	str	r3, [r7, #36]
	ldr	r0, [r1, #40]
	ldr	r3, [r2, #40]
	bic	r3, r3, r0
	str	r3, [r7, #40]
	ldr	r0, [r1, #44]
	ldr	r3, [r2, #44]
	bic	r3, r3, r0
	str	r3, [r7, #44]
	ldr	r0, [r1, #48]
	ldr	r3, [r2, #48]
	bic	r3, r3, r0
	str	r3, [r7, #48]
	ldr	r0, [r1, #52]
	ldr	r3, [r2, #52]
	bic	r3, r3, r0
	str	r3, [r7, #52]
	ldr	r0, [r1, #56]
	ldr	r3, [r2, #56]
	bic	r3, r3, r0
	str	r3, [r7, #56]
	ldr	r3, [r2, #60]
	mov	r2, r4
	ldr	r1, [r1, #60]
	bic	r3, r3, r1
	str	r3, [r7, #60]
	b	.L142
.L141:
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
	mov	r2, r4
	mvn	r3, r3
	str	r3, [r7, #60]
	b	.L142
	.fnend
	.size	add_discard_addrs, .-add_discard_addrs
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"&x->wait\000"
	.text
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
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r0
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	.pad #24
	sub	sp, sp, #24
	mov	r3, sp
	bic	r7, r3, #8128
	ldr	r3, [r0, #28]
	bic	r7, r7, #63
	ldr	r4, [r3, #88]
	add	r9, r4, #4
.L196:
	bl	kthread_should_stop
	subs	r1, r0, #0
	bne	.L216
.L220:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L218
.L198:
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L196
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L196
	ldr	r0, [r7, #12]
	movw	r2, #:lower16:autoremove_wake_function
	add	r1, sp, #16
	movt	r2, #:upper16:autoremove_wake_function
	str	r3, [sp, #4]
	str	r1, [sp, #16]
	str	r0, [sp, #8]
	str	r2, [sp, #12]
	str	r1, [sp, #20]
	b	.L206
.L219:
	bl	schedule
.L206:
	mov	r2, #1
	add	r1, sp, #4
	mov	r0, r9
	bl	prepare_to_wait
	bl	kthread_should_stop
	cmp	r0, #0
	bne	.L205
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L205
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L219
.L205:
	add	r1, sp, #4
	mov	r0, r9
	bl	finish_wait
	bl	kthread_should_stop
	subs	r1, r0, #0
	beq	.L220
.L216:
	mov	r0, #0
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L218:
	mov	r0, #16
	bl	bio_alloc
	subs	r5, r0, #0
	beq	.L221
.L199:
	.syntax divided
@ 37 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	mov	r1, #0
	add	r2, r4, #20
	.syntax divided
@ 52 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r3, [r2]
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
@ 98 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, r1
	str	r3, [r4, #24]
	bne	.L201
	b	.L200
.L208:
	mov	r3, r2
.L201:
	ldr	r2, [r3]
	str	r1, [r3]
	mov	r1, r3
	cmp	r2, #0
	bne	.L208
.L200:
	str	r3, [r4, #24]
	ldr	ip, [r8]
	mov	r3, #0
	movw	r1, #:lower16:.LC2
	ldr	r2, .L222
	add	r0, sp, #8
	movt	r1, #:upper16:.LC2
	add	r6, sp, #4
	ldr	ip, [ip, #208]
	str	ip, [r5, #12]
	str	r3, [sp, #4]
	bl	__init_waitqueue_head
	movw	r3, #:lower16:__submit_bio_wait_endio
	mov	r1, r5
	str	r6, [r5, #60]
	movt	r3, #:upper16:__submit_bio_wait_endio
	movw	r0, #2577
	str	r3, [r5, #56]
	bl	submit_bio
	mov	r0, r6
	bl	wait_for_completion
	ldr	r0, [r4, #24]
	ldr	r6, [sp, #20]
	cmp	r0, #0
	sub	r0, r0, #16
	beq	.L202
.L203:
	ldr	r10, [r0, #16]
	str	r6, [r0, #20]
	bl	complete
	cmp	r10, #0
	sub	r0, r10, #16
	bne	.L203
.L202:
	mov	r0, r5
	bl	bio_put
	mov	r3, #0
	str	r3, [r4, #24]
	b	.L198
.L221:
	mov	r1, r5
	mov	r0, #2064
	bl	bio_alloc
	mov	r5, r0
	b	.L199
.L223:
	.align	2
.L222:
	.word	.LANCHOR0+8
	.fnend
	.size	issue_flush_thread, .-issue_flush_thread
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
	beq	.L224
	ldr	r1, [r3, #112]
	cmp	r1, r4
	beq	.L224
	ldr	r1, [r3, #176]
	cmp	r1, r4
	beq	.L224
	ldr	r1, [r3, #240]
	cmp	r1, r4
	beq	.L224
	ldr	r1, [r3, #304]
	cmp	r1, r4
	beq	.L224
	ldr	r3, [r3, #368]
	cmp	r3, r4
	beq	.L224
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
	beq	.L238
	ldr	r2, [r5, #636]
	cmp	r2, r3
	bls	.L228
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__locate_dirty_segment
.L230:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L224:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L238:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r4, r1
	beq	.L228
	ldr	r1, [r3, #112]
	cmp	r4, r1
	beq	.L228
	ldr	r1, [r3, #176]
	cmp	r4, r1
	beq	.L228
	ldr	r1, [r3, #240]
	cmp	r4, r1
	beq	.L228
	ldr	r1, [r3, #304]
	cmp	r4, r1
	beq	.L228
	ldr	r3, [r3, #368]
	cmp	r4, r3
	beq	.L228
	ldr	r7, [r2, #8]
	mov	r0, r4
	ldr	r1, [r7, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L228
	ldr	r3, [r7, #84]
	add	r3, r3, #1
	str	r3, [r7, #84]
.L228:
	mov	r1, r4
	mov	r0, r5
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L230
	.fnend
	.size	locate_dirty_segment, .-locate_dirty_segment
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"discard_entry\000"
	.align	2
.LC4:
	.ascii	"sit_entry_set\000"
	.align	2
.LC5:
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
	movw	r0, #:lower16:.LC3
	mov	r3, #131072
	mov	r2, r4
	movt	r0, #:upper16:.LC3
	mov	r1, #16
	str	r4, [sp]
	bl	kmem_cache_create
	movw	r3, #:lower16:.LANCHOR0
	cmp	r0, r4
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #4]
	mvneq	r0, #11
	beq	.L239
	movw	r0, #:lower16:.LC4
	mov	r5, r3
	str	r4, [sp]
	mov	r3, #131072
	movt	r0, #:upper16:.LC4
	mov	r2, r4
	mov	r1, #16
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5]
	beq	.L241
	movw	r0, #:lower16:.LC5
	mov	r3, #131072
	str	r4, [sp]
	movt	r0, #:upper16:.LC5
	mov	r2, r4
	mov	r1, #16
	bl	kmem_cache_create
	cmp	r0, r4
	str	r0, [r5, #8]
	movne	r0, r4
	bne	.L239
	ldr	r0, [r5]
	bl	kmem_cache_destroy
.L241:
	ldr	r0, [r5, #4]
	bl	kmem_cache_destroy
	mvn	r0, #11
.L239:
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
	beq	.L249
	mov	r2, #0
	b	.L250
.L251:
	mov	r0, r3
.L250:
	ldr	r3, [r0]
	str	r2, [r0]
	mov	r2, r0
	cmp	r3, #0
	bne	.L251
.L249:
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
	ldr	r7, [r3, #8]
	mov	r0, r7
	bl	kmem_cache_alloc
	subs	r5, r0, #0
	beq	.L276
.L256:
	add	r7, r6, #432
	str	r5, [r5]
	mov	r0, r7
	str	r5, [r5, #4]
	str	r4, [r5, #8]
	bl	mutex_lock
	ldr	r3, [r4]
	tst	r3, #32768
	bne	.L257
.L259:
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
.L258:
	add	r2, r6, #424
	mov	r0, r5
	ldr	r1, [r6, #428]
	bl	__list_add
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #488]
	add	r2, r3, #716
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
	bne	.L277
.L255:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L276:
	mov	r0, r7
	mov	r1, #2128
	bl	kmem_cache_alloc
	mov	r5, r0
	b	.L256
.L257:
	mov	r0, r4
	bl	__get_page_tail
	cmp	r0, #0
	bne	.L258
	b	.L259
.L277:
	mov	r2, sp
	bic	r2, r2, #8128
	bic	r2, r2, #63
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L262
.L263:
	mov	r2, #5
	mov	r1, r4
	ldr	r3, [r5]
	ldr	r0, [r5, #4]
	blx	r3
	ldr	r3, [r5, #8]!
	cmp	r3, #0
	bne	.L263
.L262:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	beq	.L255
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	preempt_schedule
	.fnend
	.size	register_inmem_page, .-register_inmem_page
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
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	.pad #24
	sub	sp, sp, #24
	bl	available_free_memory
	cmp	r0, #0
	beq	.L299
.L279:
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L300
.L280:
	mov	r1, #0
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L281
	movw	r1, #3640
	mov	r0, r4
	bl	try_to_free_nids
.L282:
	ldr	r3, [r4]
	ldr	r3, [r3, #208]
	ldr	r3, [r3, #88]
	ldr	r3, [r3, #500]
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L278
	ldr	r5, [r3, #16]
	cmp	r5, #0
	beq	.L301
.L278:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L301:
	ldr	r3, [r4, #420]
	movw	r6, #:lower16:jiffies
	mov	r0, sp
	movt	r6, #:upper16:jiffies
	stm	sp, {r3, r5}
	bl	timespec_to_jiffies
	ldr	r2, [r6]
	ldr	r3, [r4, #412]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L278
	mov	r1, #1
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	bne	.L302
.L290:
	ldr	r3, [r4, #800]
	tst	r3, #32768
	bne	.L303
.L289:
	mov	r1, #1
	ldr	r0, [r4]
	bl	f2fs_sync_fs
	ldr	r2, [r4, #836]
	ldr	r3, [r2, #256]
	add	r3, r3, #1
	str	r3, [r2, #256]
	b	.L278
.L281:
	mov	r1, #0
	mov	r0, r4
	bl	build_free_nids
	b	.L282
.L300:
	movw	r1, #455
	mov	r0, r4
	bl	try_to_free_nats
	b	.L280
.L299:
	mov	r1, #128
	mov	r0, r4
	bl	f2fs_shrink_extent_tree
	b	.L279
.L302:
	mov	r1, #3
	mov	r0, r4
	bl	available_free_memory
	cmp	r0, #0
	beq	.L290
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #8]
	ldr	r3, [r3, #44]
	ldr	r2, [r2, #84]
	cmp	r2, r3
	bhi	.L290
	ldr	r2, [r4, #20]
	movw	r1, #34079
	movt	r1, 20971
	ldr	r0, [r2, #4]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #80]
	mul	r3, r3, r0
	umull	r1, r3, r1, r3
	cmp	r2, r3, lsr #5
	bcs	.L290
	ldr	r3, [r4, #416]
	mov	r0, sp
	stm	sp, {r3, r5}
	bl	timespec_to_jiffies
	ldr	r2, [r6]
	ldr	r3, [r4, #408]
	sub	r3, r3, r2
	cmn	r3, r0
	bpl	.L278
	b	.L290
.L303:
	mov	r0, sp
	bl	blk_start_plug
	mov	r1, #1
	mov	r0, r4
	bl	sync_dirty_inodes
	mov	r0, sp
	bl	blk_finish_plug
	b	.L289
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
	bxeq	lr
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r3, #34464
	mov	r4, r0
	strd	r6, [sp, #8]
	movt	r3, 1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r2, [r0, #20]
	ldr	r2, [r2, #76]
	cmp	r2, r3
	bcs	.L316
.L307:
	add	r3, r4, #632
	ldr	r0, [r4, #708]
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
	ldr	r0, [r4, #700]
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
	ldr	r0, [r4, #720]
	udiv	r6, r6, ip
	asr	r9, r0, #31
	subs	r0, r0, #1
	sbc	r1, r9, #0
	adds	r5, r0, r5
	adc	lr, r1, lr
	lsr	r5, r5, r3
	subs	r3, r3, #32
	orr	r5, r5, lr, lsl r2
	ldr	r2, [r4, #16]
	orrpl	r5, r5, lr, asr r3
	tst	r2, #8
	ubfx	r8, r2, #3, #1
	udiv	r5, r5, ip
	bne	.L304
	ldr	r3, [r4, #28]
	add	r7, r7, r5
	ldr	r5, [r3, #36]
	ldr	r3, [r3, #4]
	udiv	ip, r5, ip
	ldr	r3, [r3, #8]
	add	r5, ip, r7
	add	r6, r5, r6, lsl #1
	cmp	r3, r6
	bls	.L317
.L304:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L316:
	bl	f2fs_balance_fs_bg
	b	.L307
.L317:
	add	r0, r4, #804
	bl	mutex_lock
	mov	r2, r8
	mov	r1, r8
	ldrd	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	f2fs_gc
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
	movw	r3, #:lower16:__tracepoint_f2fs_issue_flush
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	movt	r3, #:upper16:__tracepoint_f2fs_issue_flush
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r0, [r3, #4]
	.pad #24
	sub	sp, sp, #24
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #800]
	cmp	r0, #0
	ldr	r5, [r1, #88]
	and	r7, r2, #2048
	bne	.L347
.L319:
	cmp	r7, #0
	movne	r4, #0
	bne	.L318
	tst	r2, #1024
	add	r6, r5, #16
	beq	.L326
	ldr	r3, [r5, #16]
	cmp	r3, #0
	bne	.L327
.L326:
	mov	r1, #0
	mov	r0, #16
	bl	bio_alloc
	subs	r7, r0, #0
	beq	.L348
.L328:
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r6]
	add	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	ldr	ip, [r4]
	mov	r3, #0
	movw	r1, #:lower16:.LC2
	ldr	r2, .L352
	movt	r1, #:upper16:.LC2
	add	r0, sp, #4
	ldr	ip, [ip, #208]
	str	ip, [r7, #12]
	str	r3, [sp]
	bl	__init_waitqueue_head
	movw	r3, #:lower16:__submit_bio_wait_endio
	mov	r1, r7
	str	sp, [r7, #60]
	movt	r3, #:upper16:__submit_bio_wait_endio
	movw	r0, #2577
	str	r3, [r7, #56]
	bl	submit_bio
	mov	r0, sp
	bl	wait_for_completion
	ldr	r4, [sp, #16]
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r6]
	sub	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, r7
	bl	bio_put
.L318:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L327:
	movw	r1, #:lower16:.LC2
	ldr	r2, .L352
	add	r0, sp, #4
	movt	r1, #:upper16:.LC2
	str	r7, [sp]
	bl	__init_waitqueue_head
	.syntax divided
@ 45 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
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
	ldr	r3, [r4, #20]!
.L330:
	str	r3, [sp, #16]
	.syntax divided
@ 193 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
.L329:
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
	bne	.L329
	.syntax divided
@ 195 "/home/jprim/hlte/lolz/arch/arm/include/asm/cmpxchg.h" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, r0
	beq	.L349
	mov	r3, r0
	b	.L330
.L349:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L350
.L331:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L332
	mov	r0, sp
	bl	wait_for_completion
	.syntax divided
@ 83 "/home/jprim/hlte/lolz/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r6]
	sub	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L333:
	ldr	r4, [sp, #20]
	b	.L318
.L332:
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
	str	r3, [r5, #16]
	b	.L333
.L347:
	mov	r1, sp
	ldr	r9, [r4]
	bic	r1, r1, #8128
	bic	r1, r1, #63
	ldr	r0, [r1, #4]
	add	r0, r0, #1
	str	r0, [r1, #4]
	ldr	r8, [r3, #16]
	cmp	r8, #0
	andne	r6, r2, #1024
	beq	.L324
.L323:
	mov	r3, r6
	mov	r2, r7
	ldr	r10, [r8]
	mov	r1, r9
	ldr	r0, [r8, #4]
	blx	r10
	ldr	r3, [r8, #8]!
	cmp	r3, #0
	bne	.L323
.L324:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r2, [r3, #4]
	sub	r2, r2, #1
	str	r2, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #2
	bne	.L351
.L346:
	ldr	r2, [r4, #800]
	and	r7, r2, #2048
	b	.L319
.L348:
	mov	r1, r7
	mov	r0, #2064
	bl	bio_alloc
	mov	r7, r0
	b	.L328
.L350:
	mov	r2, #1
	mov	r1, #3
	add	r0, r5, #4
	bl	__wake_up
	b	.L331
.L351:
	bl	preempt_schedule
	b	.L346
.L353:
	.align	2
.L352:
	.word	.LANCHOR0+8
	.fnend
	.size	f2fs_issue_flush, .-f2fs_issue_flush
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"&fcc->flush_wait_queue\000"
	.align	2
.LC7:
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
	ldr	r5, [r2, #88]
	ldr	r6, [r3]
	cmp	r5, #0
	beq	.L363
.L355:
	lsr	r1, r6, #20
	ubfx	r6, r6, #0, #20
	movw	r3, #:lower16:.LC7
	movw	r0, #:lower16:issue_flush_thread
	movt	r3, #:upper16:.LC7
	movt	r0, #:upper16:issue_flush_thread
	mvn	r2, #0
	stm	sp, {r1, r6}
	mov	r1, r4
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L358
	mov	r7, #0
	bl	wake_up_process
	str	r6, [r5]
.L354:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L363:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L359
	mov	r2, #28
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L364
.L356:
	mov	r7, #0
	movw	r1, #:lower16:.LC6
	ldr	r2, .L365
	movt	r1, #:upper16:.LC6
	add	r0, r5, #4
	str	r7, [r5, #16]
	bl	__init_waitqueue_head
	str	r7, [r5, #20]
	ldr	r3, [r4, #28]
	str	r5, [r3, #88]
	ldr	r7, [r4, #800]
	ands	r7, r7, #1024
	bne	.L355
	b	.L354
.L359:
	mov	r5, #16
	b	.L356
.L358:
	mov	r0, r5
	str	r6, [r5]
	mov	r7, r6
	bl	kfree
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3, #88]
	b	.L354
.L364:
	mvn	r7, #11
	b	.L354
.L366:
	.align	2
.L365:
	.word	.LANCHOR0+12
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
	ldr	r6, [r3, #88]
	cmp	r6, #0
	beq	.L368
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L368
	mov	r3, #0
	str	r3, [r6]
	bl	kthread_stop
.L368:
	cmp	r5, #0
	bne	.L380
.L367:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L380:
	mov	r0, r6
	bl	kfree
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3, #88]
	b	.L367
	.fnend
	.size	destroy_flush_cmd_control, .-destroy_flush_cmd_control
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
	ldr	r6, [r0, #28]
	ldr	r5, [r6, #48]
	add	r6, r6, #48
	cmp	r6, r5
	ldr	r4, [r5]
	beq	.L381
	movw	r7, #:lower16:.LANCHOR0
	mov	r0, r5
	movt	r7, #:upper16:.LANCHOR0
.L383:
	bl	list_del
	mov	r1, r5
	ldr	r0, [r7, #4]
	mov	r5, r4
	bl	kmem_cache_free
	cmp	r4, r6
	mov	r0, r4
	ldr	r4, [r4]
	bne	.L383
.L381:
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	r4, #0
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	mov	r8, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #20
	sub	sp, sp, #20
	ldr	r2, [r1]
	ldr	r9, [r3, #8]
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r3, r3, #48
	str	r3, [sp, #8]
	add	r3, r9, #36
	ldr	r6, [r9, #32]
	mov	r0, r3
	str	r3, [sp, #4]
	bl	mutex_lock
	ldr	lr, [r7, #28]
.L387:
	add	r2, r4, #1
	mov	r0, r6
	ldr	r1, [lr, #32]
	bl	_find_next_bit_le
	ldr	r3, [r7, #28]
	mov	r10, r0
	mov	fp, r0
	ldr	r1, [r3, #32]
	cmp	r1, r0
	bls	.L388
	add	r5, r0, #1
	mov	r0, r6
	mov	r2, r5
	bl	_find_next_zero_bit_le
	cmp	r10, r0
	mov	r4, r0
	movcc	r0, r10
	bcs	.L392
.L389:
	mov	r1, r6
	bl	_clear_bit
	cmp	r4, r5
	mov	r0, r5
	add	r5, r5, #1
	bne	.L389
.L392:
	ldr	r3, [r9, #84]
	ldr	r2, [sp]
	add	r3, fp, r3
	sub	r3, r3, r4
	cmp	r2, #4
	str	r3, [r9, #84]
	beq	.L424
	ldr	lr, [r7, #28]
	ldr	r3, [r7, #800]
	tst	r3, #4
	beq	.L387
	tst	r3, #262144
	beq	.L394
	ldr	r2, [r7, #640]
	cmp	r2, #1
	bne	.L395
	b	.L394
.L426:
	ldr	r1, [r1, #64]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r3, #0
	beq	.L425
.L396:
	add	fp, r5, r2
	cmp	r4, fp
	bls	.L387
.L395:
	ldr	r0, [lr, #12]
	udiv	r3, fp, r2
	ldr	r1, [r0, #48]
	udiv	r1, r1, r2
	mul	r5, r2, r3
	cmp	r1, r3
	beq	.L396
	ldr	r1, [r0, #112]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L396
	ldr	r1, [r0, #176]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L396
	ldr	r1, [r0, #240]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L396
	ldr	r1, [r0, #304]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L396
	ldr	r1, [r0, #368]
	udiv	r1, r1, r2
	cmp	r1, r3
	beq	.L396
	cmp	r2, #1
	ldr	r1, [lr]
	bgt	.L426
	add	fp, fp, fp, lsl #1
	ldr	r1, [r1, #60]
	lsl	r3, fp, #3
	ldrh	r3, [r1, r3]
	lsr	r3, r3, #6
	cmp	r3, #0
	bne	.L396
.L425:
	ldr	r3, [lr, #4]
	mov	r0, r7
	ldr	ip, [lr, #16]
	ldr	r1, [r7, #632]
	ldr	r3, [r3]
	lsl	r2, r2, r1
	add	r3, r5, r3
	add	r1, ip, r3, lsl r1
	bl	f2fs_issue_discard
	ldr	lr, [r7, #28]
	ldr	r2, [r7, #640]
	b	.L396
.L394:
	ldr	ip, [lr, #4]
	sub	r2, r4, fp
	mov	r0, r7
	ldr	r1, [lr, #16]
	ldr	r3, [r7, #632]
	ldr	ip, [ip]
	lsl	r2, r2, r3
	add	fp, fp, ip
	add	r1, r1, fp, lsl r3
	bl	f2fs_issue_discard
	ldr	lr, [r7, #28]
	b	.L387
.L424:
	ldr	lr, [r7, #28]
	b	.L387
.L388:
	ldr	r0, [sp, #4]
	bl	mutex_unlock
	ldr	r3, [sp, #12]
	ldr	r4, [r3, #48]
	ldr	r3, [sp, #8]
	mov	r6, r4
	ldr	r5, [r4]
	cmp	r3, r4
	beq	.L386
	ldr	r3, [sp]
	movw	r9, #:lower16:.LANCHOR0
	movt	r9, #:upper16:.LANCHOR0
	cmp	r3, #4
	streq	r7, [sp]
	streq	r4, [sp, #4]
	beq	.L400
	ldr	r10, [sp, #8]
.L401:
	mov	r0, r7
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #12]
	bl	f2fs_issue_discard
	ldr	r1, [r4, #12]
	mov	r0, r6
	mov	r6, r5
	ldrd	r2, [r8, #32]
	adds	r2, r2, r1
	adc	r3, r3, r1, asr #31
	strd	r2, [r8, #32]
	bl	list_del
	ldr	r2, [r7, #28]
	mov	r1, r4
	ldr	ip, [r4, #12]
	mov	r4, r5
	ldr	r0, [r9, #4]
	ldr	r3, [r2, #56]
	sub	r3, r3, ip
	str	r3, [r2, #56]
	bl	kmem_cache_free
	cmp	r10, r5
	ldr	r5, [r5]
	bne	.L401
.L386:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L427:
	ldr	r1, [r4, #8]
	bl	f2fs_issue_discard
	ldr	r2, [r4, #12]
	ldrd	r10, [r8, #32]
	ldr	r0, [sp, #4]
	str	r5, [sp, #4]
	adds	r10, r10, r2
	adc	fp, fp, r2, asr #31
	strd	r10, [r8, #32]
	bl	list_del
	ldr	r3, [sp]
	mov	r1, r4
	ldr	lr, [r4, #12]
	ldr	r0, [r9, #4]
	ldr	ip, [r3, #28]
	ldr	r2, [ip, #56]
	sub	r2, r2, lr
	str	r2, [ip, #56]
	bl	kmem_cache_free
	ldr	r3, [sp, #8]
	ldr	r2, [r5]
	cmp	r3, r5
	beq	.L386
.L404:
	mov	r4, r5
	mov	r5, r2
.L400:
	ldr	r2, [r4, #12]
	ldrd	r6, [r8, #24]
	ldr	r0, [sp]
	asr	fp, r2, #31
	cmp	fp, r7
	cmpeq	r2, r6
	bcs	.L427
.L403:
	ldr	r0, [sp, #4]
	str	r5, [sp, #4]
	bl	list_del
	ldr	r3, [sp]
	mov	r1, r4
	ldr	lr, [r4, #12]
	ldr	r0, [r9, #4]
	ldr	ip, [r3, #28]
	ldr	r2, [ip, #56]
	sub	r2, r2, lr
	str	r2, [ip, #56]
	bl	kmem_cache_free
	ldr	r3, [sp, #8]
	ldr	r2, [r5]
	cmp	r5, r3
	bne	.L404
	b	.L386
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
	bhi	.L430
	ldr	r2, [r4, #28]
	ldr	r1, [r4, #632]
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #16]
	ldr	r3, [r3]
	sub	r2, r6, r2
	rsb	r3, r3, r2, lsr r1
	cmn	r3, #1
	bne	.L455
.L430:
	sub	r3, r5, #1
	cmn	r3, #3
	bhi	.L428
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #632]
	ldr	r3, [r1, #4]
	ldr	r0, [r1, #16]
	ldr	r3, [r3]
	sub	r5, r5, r0
	rsb	r5, r3, r5, lsr r2
	cmn	r5, #1
	beq	.L428
	ldr	r3, [r1, #12]
	ldr	r2, [r3, #48]
	cmp	r5, r2
	beq	.L428
	ldr	r2, [r3, #112]
	cmp	r5, r2
	beq	.L428
	ldr	r2, [r3, #176]
	cmp	r5, r2
	beq	.L428
	ldr	r2, [r3, #240]
	cmp	r5, r2
	beq	.L428
	ldr	r2, [r3, #304]
	cmp	r5, r2
	beq	.L428
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L428
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
	beq	.L456
	ldr	r2, [r4, #636]
	mov	r1, r5
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcs	.L444
	bl	__locate_dirty_segment
.L443:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L428:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L455:
	mov	r1, r6
	mvn	r2, #0
	mov	r0, r4
	bl	update_sit_entry
	ldr	r0, [r4, #28]
	ldr	r2, [r4, #632]
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #16]
	ldr	r3, [r3]
	sub	r6, r6, r1
	rsb	r6, r3, r6, lsr r2
	cmn	r6, #1
	beq	.L430
	ldr	r3, [r0, #12]
	ldr	r2, [r3, #48]
	cmp	r6, r2
	beq	.L430
	ldr	r2, [r3, #112]
	cmp	r6, r2
	beq	.L430
	ldr	r2, [r3, #176]
	cmp	r6, r2
	beq	.L430
	ldr	r2, [r3, #240]
	cmp	r6, r2
	beq	.L430
	ldr	r2, [r3, #304]
	cmp	r6, r2
	beq	.L430
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L430
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
	beq	.L457
	ldr	r2, [r4, #636]
	mov	r1, r6
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcs	.L437
	bl	__locate_dirty_segment
.L436:
	mov	r0, r7
	bl	mutex_unlock
	b	.L430
.L437:
	bl	__remove_dirty_segment
	b	.L436
.L444:
	bl	__remove_dirty_segment
	b	.L443
.L457:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r6, r1
	beq	.L434
	ldr	r1, [r3, #112]
	cmp	r6, r1
	beq	.L434
	ldr	r1, [r3, #176]
	cmp	r6, r1
	beq	.L434
	ldr	r1, [r3, #240]
	cmp	r6, r1
	beq	.L434
	ldr	r1, [r3, #304]
	cmp	r6, r1
	beq	.L434
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L434
	ldr	r8, [r2, #8]
	mov	r0, r6
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L434
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L434:
	mov	r1, r6
	mov	r2, #6
	mov	r0, r4
	bl	__remove_dirty_segment
	b	.L436
.L456:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r5, r1
	beq	.L441
	ldr	r1, [r3, #112]
	cmp	r5, r1
	beq	.L441
	ldr	r1, [r3, #176]
	cmp	r5, r1
	beq	.L441
	ldr	r1, [r3, #240]
	cmp	r5, r1
	beq	.L441
	ldr	r1, [r3, #304]
	cmp	r5, r1
	beq	.L441
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L441
	ldr	r7, [r2, #8]
	mov	r0, r5
	ldr	r1, [r7, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L441
	ldr	r3, [r7, #84]
	add	r3, r3, #1
	str	r3, [r7, #84]
.L441:
	mov	r1, r5
	mov	r0, r4
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L443
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
	bhi	.L459
	ldr	r1, [r3, #4]
	add	r7, r7, #40
	ldr	r3, [r3, #16]
	mov	r0, r7
	ldr	r2, [r4, #632]
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
	beq	.L460
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r6, r1
	beq	.L460
	ldr	r1, [r3, #112]
	cmp	r6, r1
	beq	.L460
	ldr	r1, [r3, #176]
	cmp	r6, r1
	beq	.L460
	ldr	r1, [r3, #240]
	cmp	r6, r1
	beq	.L460
	ldr	r1, [r3, #304]
	cmp	r6, r1
	beq	.L460
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L460
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
	beq	.L474
	ldr	r2, [r4, #636]
	mov	r1, r6
	mov	r0, r4
	cmp	r3, r2
	mov	r2, #6
	bcc	.L475
	bl	__remove_dirty_segment
.L467:
	mov	r0, r5
	bl	mutex_unlock
.L460:
	mov	r0, r7
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	mutex_unlock
.L459:
	cmp	r1, #0
	beq	.L476
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L476:
	movw	r0, #:lower16:.LC0
	movw	r1, #994
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
	b	.L460
.L475:
	bl	__locate_dirty_segment
	b	.L467
.L474:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r6, r1
	beq	.L465
	ldr	r1, [r3, #112]
	cmp	r6, r1
	beq	.L465
	ldr	r1, [r3, #176]
	cmp	r6, r1
	beq	.L465
	ldr	r1, [r3, #240]
	cmp	r6, r1
	beq	.L465
	ldr	r1, [r3, #304]
	cmp	r6, r1
	beq	.L465
	ldr	r3, [r3, #368]
	cmp	r6, r3
	beq	.L465
	ldr	r8, [r2, #8]
	mov	r0, r6
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L465
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L465:
	mov	r1, r6
	mov	r0, r4
	mov	r2, #6
	bl	__remove_dirty_segment
	b	.L467
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
	bhi	.L478
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
	ldr	lr, [r5, #632]
	ldr	r3, [r5, #636]
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
.L478:
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
	ldr	r2, [r0, #328]
	cmp	r1, #0
	ldrb	r3, [r2, #176]	@ zero_extendqisi2
	bne	.L482
	cmp	r3, #1
	ldrb	r1, [r2, #177]	@ zero_extendqisi2
	ldrne	r3, [r0, #28]
	ldreq	r3, [r0, #636]
	ldrb	r2, [r2, #178]	@ zero_extendqisi2
	ldrne	r3, [r3, #12]
	ldrhne	r3, [r3, #52]
	cmp	r1, #1
	ldrne	r1, [r0, #28]
	ldreq	r1, [r0, #636]
	ldrne	r1, [r1, #12]
	ldrhne	r1, [r1, #116]
	cmp	r2, #1
	add	r3, r3, r1
	beq	.L499
	ldr	r2, [r0, #28]
	ldr	r2, [r2, #12]
	ldrh	r2, [r2, #180]
	add	r3, r2, r3
	cmp	r3, #440
	bge	.L500
.L497:
	mov	r0, #1
	bx	lr
.L482:
	ldrb	r1, [r2, #177]	@ zero_extendqisi2
	cmp	r3, #1
	ldrhne	r3, [r2, #116]	@ unaligned
	ldreq	r3, [r0, #636]
	cmp	r1, #1
	ldrhne	r1, [r2, #118]	@ unaligned
	ldreq	r1, [r0, #636]
	add	r3, r3, r1
	ldrb	r1, [r2, #178]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L499
	ldrh	r2, [r2, #120]	@ unaligned
	add	r3, r2, r3
	b	.L489
.L499:
	ldr	r2, [r0, #636]
	add	r3, r3, r2
.L489:
	cmp	r3, #440
	blt	.L497
.L500:
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
	beq	.L503
	mov	r1, r5
	mov	r2, #4096
	bl	memcpy
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	beq	.L502
.L512:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L511
.L506:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	put_page
.L503:
	mov	r1, #4096
	bl	__memzero
	mov	r0, r4
	bl	set_page_dirty
	cmp	r4, #0
	bne	.L512
.L502:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L511:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L506
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
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r6, r2
	mov	r7, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	str	r1, [sp, #16]
	ldr	r8, [r3, #12]
	ldr	r2, [r3, #24]
	add	r8, r8, r1, lsl #6
	ldr	r1, [r8, #20]
	ldr	r5, [r8, #48]
	add	r2, r5, r2
	bl	update_meta_page
	ldr	r3, [r4, #800]
	tst	r3, #8
	movne	r10, #0
	bne	.L514
	sub	r10, r7, #1
	cmp	r10, #1
	movls	r10, #0
	movhi	r10, #1
.L514:
	ldr	r1, [r4, #28]
	ldr	r7, [r4, #640]
	ldr	r3, [r4, #644]
	ldr	r2, [r4, #648]
	ldr	r9, [r1, #4]
	udiv	r7, r5, r7
	udiv	r2, r2, r3
	udiv	r3, r7, r3
	str	r2, [sp]
	add	r2, r9, #12
	mov	r0, r2
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	bl	_raw_spin_lock
	cmp	r6, #0
	bne	.L517
	ldr	r1, [r4, #640]
	add	r2, r5, #1
	udiv	r3, r2, r1
	mls	r3, r1, r3, r2
	cmp	r3, #0
	bne	.L562
.L517:
	movw	r3, #:lower16:.LC0
	mov	r6, r7
	movt	r3, #:upper16:.LC0
	mov	fp, #0
	str	r3, [sp, #20]
	mov	r3, #1
	str	r3, [sp, #4]
.L516:
	mov	r2, r7
	ldr	r0, [r9, #20]
	ldr	r1, [r4, #648]
	bl	_find_next_zero_bit_le
	ldr	r1, [r4, #648]
	mov	r5, r0
	cmp	r0, r1
	bcc	.L519
	cmp	r10, #0
	ldr	r0, [r9, #20]
	subne	r6, r7, #1
	beq	.L563
.L521:
	cmp	r6, #0
	add	r3, r6, #31
	movge	r3, r6
	and	fp, r6, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	fp, r3, fp
	ands	fp, fp, #1
	moveq	r0, #1
	moveq	r5, r6
	moveq	fp, r0
	beq	.L522
.L525:
	cmp	r6, #0
	beq	.L524
	sub	r6, r6, #1
	cmp	r6, #0
	add	r3, r6, #31
	movge	r3, r6
	and	r2, r6, #31
	asr	r3, r3, #5
	ldr	r3, [r0, r3, lsl #2]
	lsr	r3, r3, r2
	tst	r3, #1
	bne	.L525
	mov	r5, r6
	mov	r0, #1
	b	.L522
.L563:
	mov	r2, r10
	bl	_find_next_zero_bit_le
	ldr	r3, [r4, #648]
	mov	r5, r0
	cmp	r0, r3
	bcc	.L519
	movw	r1, #1169
	ldr	r0, [sp, #20]
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
.L519:
	cmp	fp, #0
	moveq	r0, fp
	bne	.L564
.L522:
	ldmib	sp, {r3, r7}
	ldr	lr, [r4, #640]
	ldr	r1, [r4, #644]
	eor	ip, r3, #1
	mul	r2, r5, lr
	udiv	r3, r5, r1
	cmp	r1, #1
	orreq	ip, ip, #1
	cmp	r7, r3
	orreq	ip, ip, #1
	cmp	ip, #0
	str	ip, [sp, #4]
	bne	.L561
	cmp	r10, #1
	beq	.L565
	ldr	r0, [r4, #28]
	ldr	ip, [r0, #12]
	ldr	r0, [ip, #56]
	cmp	r0, r3
	beq	.L532
.L538:
	ldr	r0, [ip, #120]
	cmp	r0, r3
	beq	.L532
	ldr	r0, [ip, #184]
	cmp	r3, r0
	beq	.L532
	ldr	r0, [ip, #248]
	cmp	r3, r0
	beq	.L532
	ldr	r0, [ip, #312]
	cmp	r3, r0
	beq	.L532
	ldr	r0, [ip, #376]
	cmp	r3, r0
	beq	.L532
.L561:
	mov	r5, r2
.L518:
	cmp	r5, #0
	ldr	r1, [r9, #16]
	add	r3, r5, #31
	movge	r3, r5
	and	r0, r5, #31
	asr	r3, r3, #5
	ldr	r1, [r1, r3, lsl #2]
	lsr	r3, r1, r0
	tst	r3, #1
	bne	.L566
.L535:
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
	bne	.L536
	ldr	r3, [r5, #8]
	sub	r3, r3, #1
	str	r3, [r5, #8]
.L536:
	ldr	r0, [sp, #12]
	str	r2, [sp]
	bl	_raw_spin_unlock
	ldr	r2, [sp]
	mov	r0, r4
	ldr	r1, [sp, #16]
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
.L524:
	mov	r2, #0
	ldr	r1, [r4, #648]
	bl	_find_next_zero_bit_le
	ldr	r3, [r4, #648]
	mov	r5, r0
	cmp	r0, r3
	movcc	r6, r0
	movcc	r0, #1
	bcc	.L522
	movw	r1, #1185
	ldr	r0, [sp, #20]
	mov	r6, r5
	bl	warn_slowpath_null
	mov	r0, #2
	add	r1, r4, #16
	bl	_set_bit
	mov	r0, #1
	b	.L522
.L564:
	ldr	r0, [r9, #20]
	b	.L521
.L532:
	cmp	fp, #0
	addeq	r7, r3, #1
	bne	.L537
.L533:
	ldr	r3, [sp]
	cmp	r3, r7
	movls	fp, #0
	movls	r7, fp
	bls	.L516
	mul	r7, r7, r1
	mov	fp, #0
	b	.L516
.L565:
	cmp	fp, #0
	bne	.L529
	ldr	r0, [sp]
	add	r7, r3, #1
	cmp	r0, r7
	bls	.L561
	ldr	r0, [r4, #28]
	ldr	ip, [r0, #12]
	ldr	r0, [ip, #56]
	cmp	r3, r0
	bne	.L538
	b	.L533
.L529:
	cmp	r5, r1
	movcs	r0, #0
	andcc	r0, r0, #1
	cmp	r0, #0
	bne	.L561
	ldr	r0, [r4, #28]
	ldr	ip, [r0, #12]
	ldr	r0, [ip, #56]
	cmp	r3, r0
	bne	.L538
.L537:
	mul	r7, r3, r1
	mov	fp, #1
	sub	r7, r7, #1
	b	.L516
.L562:
	mla	r1, r7, r1, r1
	ldr	r0, [r9, #16]
	bl	_find_next_zero_bit_le
	ldr	lr, [r4, #640]
	add	r3, r7, #1
	mov	r5, r0
	mov	r2, r0
	mul	r3, lr, r3
	cmp	r0, r3
	bcs	.L517
	b	.L518
.L566:
	movw	r0, #:lower16:.LC0
	movw	r1, #1224
	str	r2, [sp]
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r4, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r2, [sp]
	ldr	lr, [r4, #640]
	b	.L535
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
	ldr	fp, [r4, #640]
	ldr	r9, [r3, #4]
	add	r10, r9, #12
	mov	r0, r10
	bl	_raw_spin_lock
	mov	r0, r6
	ldr	r1, [r9, #16]
	bl	_test_and_set_bit
	cmp	r0, #0
	beq	.L583
.L569:
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
	beq	.L571
	ldr	r3, [r9, #84]
	sub	r3, r3, #1
	str	r3, [r9, #84]
.L571:
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
	cmp	r3, r7
	cmpcc	r0, r1
	add	ip, r2, #8
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
	beq	.L572
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
	ldr	ip, [r2, #48]
	ldr	r7, [r3, #48]
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
.L573:
	mov	r2, #0
	ldr	r1, [r4, #636]
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
	beq	.L567
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L584
.L575:
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
.L583:
	ldr	r3, [r9, #4]
	udiv	r0, r6, fp
	ldr	r1, [r9, #20]
	sub	r3, r3, #1
	str	r3, [r9, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L569
	ldr	r3, [r9, #8]
	sub	r3, r3, #1
	str	r3, [r9, #8]
	b	.L569
.L572:
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
	b	.L573
.L567:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L584:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L575
	.fnend
	.size	change_curseg.constprop.0, .-change_curseg.constprop.0
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
	cmp	r2, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	ip, [r0, #28]
	.pad #28
	sub	sp, sp, #28
	ldr	r6, [ip, #12]
	add	r6, r6, r1, lsl #6
	bne	.L612
	cmp	r1, #4
	mov	r5, r1
	beq	.L611
	ldrb	r3, [r6, #44]	@ zero_extendqisi2
	ldr	r2, [r0, #640]
	cmp	r3, #0
	beq	.L613
.L589:
	ldr	r0, [r4, #708]
	ldr	r3, [r4, #800]
	ldr	fp, [r4, #700]
	ldr	r7, [r4, #720]
	tst	r3, #262144
	bne	.L601
	asr	r1, r0, #31
	subs	r8, r0, #1
	ldr	r3, [r4, #632]
	ldr	r10, [r4, #636]
	sbc	r9, r1, #0
	ldr	r1, [ip, #4]
	rsb	lr, r3, #32
	mul	r10, r10, r2
	ldr	r1, [r1, #8]
	adds	r8, r8, r10
	adc	r9, r9, #0
	subs	r0, r3, #32
	str	r1, [sp, #8]
	ldr	r1, [ip, #36]
	udiv	r1, r1, r2
	str	r1, [sp, #12]
	lsr	r1, r8, r3
	orr	r1, r1, r9, lsl lr
	orrpl	r1, r1, r9, asr r0
	subs	r9, r7, #1
	udiv	r8, r1, r2
	asr	r1, r7, #31
	ldr	r7, [sp, #12]
	sbc	r0, r1, #0
	adds	r1, r9, r10
	adc	r0, r0, #0
	lsr	r1, r1, r3
	subs	r9, r3, #32
	add	r7, r7, #1
	orr	r1, r1, r0, lsl lr
	orrpl	r1, r1, r0, asr r9
	mov	r0, fp
	add	r7, r8, r7
	udiv	r8, r1, r2
	asr	r1, fp, #31
	strd	r0, [sp, #16]
	subs	r0, fp, #1
	ldr	r1, [sp, #20]
	sbc	r9, r1, #0
	adds	r0, r0, r10
	adc	r9, r9, #0
	lsr	r0, r0, r3
	subs	fp, r3, #32
	add	r1, r7, r8
	orr	r0, r0, r9, lsl lr
	orrpl	r0, r0, r9, asr fp
	udiv	r0, r0, r2
	add	r0, r1, r0, lsl #1
	ldr	r1, [sp, #8]
	cmp	r1, r0
	bls	.L614
.L601:
	mov	r1, r5
	mov	r2, #0
	mov	r0, r4
.L611:
	bl	new_curseg
.L587:
	ldrb	r0, [r6, #44]	@ zero_extendqisi2
	add	r4, r4, r0, lsl #2
	ldr	r3, [r4, #840]
	add	r3, r3, #1
	str	r3, [r4, #840]
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L612:
	mov	r2, #1
	bl	new_curseg
	b	.L587
.L613:
	ldr	r1, [r6, #48]
	ldr	r0, [ip, #32]
	add	r3, r1, #1
	cmp	r3, r0
	bcs	.L589
	udiv	r0, r3, r2
	mls	r0, r2, r0, r3
	cmp	r0, #0
	beq	.L589
	ldr	lr, [ip, #4]
	cmp	r3, #0
	and	r0, r3, #31
	addlt	r3, r1, #32
	asr	r3, r3, #5
	ldr	r1, [lr, #16]
	ldr	r3, [r1, r3, lsl #2]
	mvn	r3, r3, lsr r0
	tst	r3, #1
	bne	.L601
	b	.L589
.L614:
	ldr	r1, [ip, #8]
	cmp	r5, #2
	ldr	r7, [r1]
	bgt	.L594
	ldr	r0, [r4, #708]
	asr	r1, r0, #31
	subs	ip, r0, #1
	sbc	r1, r1, #0
	adds	ip, ip, r10
	adc	r1, r1, #0
	lsr	ip, ip, r3
	subs	r0, r3, #32
	orr	ip, ip, r1, lsl lr
	orrpl	ip, ip, r1, asr r0
	ldr	r0, [r4, #700]
	udiv	ip, ip, r2
	asr	r1, r0, #31
	subs	r8, r0, #1
	sbc	r1, r1, #0
	adds	r8, r8, r10
	adc	r1, r1, #0
	lsr	r8, r8, r3
	subs	r0, r3, #32
	orr	r8, r8, r1, lsl lr
	orrpl	r8, r8, r1, asr r0
	ldr	r0, [r4, #720]
	udiv	fp, r8, r2
	asr	r9, r0, #31
	subs	r0, r0, #1
	sbc	r1, r9, #0
	adds	r10, r0, r10
	adc	r1, r1, #0
	lsr	r10, r10, r3
	subs	r3, r3, #32
	orr	r10, r10, r1, lsl lr
	orrpl	r10, r10, r1, asr r3
	ldr	r3, [r4, #16]
	udiv	r2, r10, r2
	tst	r3, #8
	bne	.L594
	ldr	r3, [sp, #12]
	add	ip, ip, r2
	add	ip, ip, r3
	ldr	r3, [sp, #8]
	add	r8, ip, fp, lsl #1
	cmp	r3, r8
	bhi	.L594
	cmp	r5, #0
	addge	fp, r6, #60
	movge	r8, r5
	movge	r10, #1
	bge	.L600
	b	.L601
.L615:
	cmn	r8, #1
	beq	.L601
.L600:
	mov	r3, r8
	mov	r2, #0
	str	r10, [sp]
	mov	r1, fp
	mov	r0, r4
	ldr	r9, [r7]
	blx	r9
	cmp	r0, #0
	sub	r8, r8, #1
	beq	.L615
.L599:
	mov	r1, r5
	mov	r0, r4
	bl	change_curseg.constprop.0
	b	.L587
.L594:
	mov	r0, #1
	mov	r3, r5
	mov	r2, #0
	add	r1, r6, #60
	str	r0, [sp]
	mov	r0, r4
	ldr	r7, [r7]
	blx	r7
	cmp	r0, #0
	beq	.L601
	b	.L599
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
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r4, [r0, #800]
	ands	r4, r4, #262144
	bne	.L616
	mov	r6, r0
.L625:
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
	beq	.L618
	ldr	r2, [r6, #28]
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r5, r1
	beq	.L618
	ldr	r1, [r3, #112]
	cmp	r5, r1
	beq	.L618
	ldr	r1, [r3, #176]
	cmp	r5, r1
	beq	.L618
	ldr	r1, [r3, #240]
	cmp	r5, r1
	beq	.L618
	ldr	r1, [r3, #304]
	cmp	r5, r1
	beq	.L618
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L618
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
	beq	.L631
	ldr	r2, [r6, #636]
	mov	r1, r5
	mov	r0, r6
	cmp	r3, r2
	mov	r2, #6
	bcc	.L632
	bl	__remove_dirty_segment
.L623:
	mov	r0, r7
	bl	mutex_unlock
.L618:
	add	r4, r4, #1
	cmp	r4, #3
	bne	.L625
.L616:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L632:
	bl	__locate_dirty_segment
	b	.L623
.L631:
	ldr	r3, [r2, #12]
	ldr	r1, [r3, #48]
	cmp	r5, r1
	beq	.L621
	ldr	r1, [r3, #112]
	cmp	r5, r1
	beq	.L621
	ldr	r1, [r3, #176]
	cmp	r5, r1
	beq	.L621
	ldr	r1, [r3, #240]
	cmp	r5, r1
	beq	.L621
	ldr	r1, [r3, #304]
	cmp	r5, r1
	beq	.L621
	ldr	r3, [r3, #368]
	cmp	r5, r3
	beq	.L621
	ldr	r8, [r2, #8]
	mov	r0, r5
	ldr	r1, [r8, #32]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L621
	ldr	r3, [r8, #84]
	add	r3, r3, #1
	str	r3, [r8, #84]
.L621:
	mov	r1, r5
	mov	r2, #6
	mov	r0, r6
	bl	__remove_dirty_segment
	b	.L623
	.fnend
	.size	allocate_new_segments, .-allocate_new_segments
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"Found FS corruption, run fsck to fix.\000"
	.align	2
.LC9:
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
	ldr	lr, [r0, #632]
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
	bls	.L649
	ldr	r0, [r4, #616]
	mov	r1, #0
	cmp	r7, r1
	cmpeq	r6, r0
	bcc	.L649
	mov	r0, #0
	mov	r1, #0
	strd	r0, [sp, #32]
	ldr	r0, [ip, #20]
	mov	r1, #0
	cmp	r1, r9
	cmpeq	r0, r8
	bcs	.L642
	ldr	r6, [r4, #16]
	tst	r6, #4
	ubfx	r6, r6, #2, #1
	bne	.L655
	cmp	r1, r3
	cmpeq	r0, r2
	ldr	r0, [ip, #16]
	movcs	r1, r6
	bcs	.L638
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
.L638:
	ldr	r2, [ip, #28]
	mov	r3, #0
	cmp	r3, r9
	add	r2, r0, r2, lsl lr
	cmpeq	r2, r8
	bls	.L656
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
.L640:
	ldr	r0, [r5, #16]
	mov	r3, #4
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
	bhi	.L642
	mov	r7, #0
	add	r8, r4, #804
	b	.L647
.L643:
	ldr	r3, [r4, #28]
	ldr	lr, [r4, #632]
	ldr	r2, [r4, #640]
	ldr	r3, [r3, #64]
	mul	r3, r3, r2
	add	r1, r3, r1
	cmp	r0, r3, lsl lr
	sub	r3, r1, #1
	bcc	.L645
	udiv	r0, r1, r2
	mls	r1, r2, r0, r1
	sub	r1, r3, r1
	cmp	r1, r6
	movcc	ip, r1
	movcs	ip, r6
.L645:
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
	bne	.L654
	bl	schedule
	ldr	r1, [sp, #16]
	add	r1, r1, #1
	cmp	r6, r1
	bcc	.L654
.L647:
	ldr	r0, [r4, #688]
	mov	ip, r6
	str	r1, [sp, #8]
	str	r7, [sp, #12]
	cmp	r0, #0
	bne	.L643
.L653:
	ldr	r1, [sp, #32]
	mov	r9, #0
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
.L636:
	strd	r2, [r5, #8]
.L633:
	mov	r0, r9
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L656:
	ldr	r6, [ip, #32]
	sub	r6, r6, #1
	b	.L640
.L642:
	mov	r2, #0
	mov	r3, r2
	mov	r9, r2
	b	.L636
.L654:
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #36]
	lsl	r2, r1, #12
	lsl	r3, r3, #12
	orr	r3, r3, r1, lsr #20
	b	.L636
.L655:
	movw	r2, #:lower16:.LC8
	movw	r1, #:lower16:.LC9
	ldr	r0, [r4]
	movt	r2, #:upper16:.LC8
	movt	r1, #:upper16:.LC9
	bl	f2fs_msg
	b	.L653
.L649:
	mvn	r9, #21
	b	.L633
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
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r7, r3
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r0, [r0, #28]
	.pad #20
	sub	sp, sp, #20
	ldr	fp, [sp, #56]
	ldr	r8, [sp, #60]
	ldr	r3, [r0]
	ldr	r5, [r0, #12]
	lsl	r10, r8, #6
	add	r9, r3, #40
	strd	r2, [sp, #4]
	add	r5, r5, r10
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r9
	bl	mutex_lock
	ldr	r3, [r4, #28]
	ldrh	r0, [r5, #52]
	ldr	r1, [r5, #48]
	ldr	ip, [r4, #632]
	ldr	r2, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r2, [r2]
	add	r3, r0, r3
	add	r2, r2, r1
	add	ip, r3, r2, lsl ip
	str	ip, [r7]
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
	beq	.L672
	ldrh	r2, [r5, #52]
	add	r2, r2, #1
	strh	r2, [r5, #52]	@ movhi
.L661:
	add	r3, r4, r3, lsl #2
	ldr	r2, [r3, #848]
	add	r2, r2, #1
	str	r2, [r3, #848]
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #636]
	ldr	r3, [r3, #12]
	add	r10, r3, r10
	ldrh	r3, [r10, #52]
	cmp	r3, r2
	bcc	.L662
	ldr	r3, [sp, #8]
	mov	r2, #0
	mov	r1, r8
	mov	r0, r4
	ldr	r3, [r3]
	ldr	r3, [r3]
	blx	r3
.L662:
	mov	r0, r4
	ldr	r2, [r7]
	ldr	r1, [sp, #4]
	bl	refresh_sit_entry
	mov	r0, r9
	bl	mutex_unlock
	cmp	r6, #0
	cmpne	r8, #2
	bgt	.L673
.L663:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L673:
	ldr	r3, [r6, #4]
	mov	r0, r6
	ldr	r2, [r4, #28]
	ldr	ip, [r5, #48]
	ldr	r1, [r4, #632]
	ldr	r6, [r3]
	ldr	r3, [r2, #4]
	ldr	lr, [r2, #16]
	ldrh	r4, [r5, #52]
	ldr	r2, [r6, #28]
	ldr	r3, [r3]
	add	r4, r4, lr
	ldr	r2, [r2, #488]
	add	r3, r3, ip
	add	r4, r4, r3, lsl r1
	ldr	r6, [r2, #328]
	bl	page_address
	ldr	r1, [r6, #132]	@ unaligned
	ldr	r2, [r6]	@ unaligned
	ldr	r3, [r6, #4]	@ unaligned
	tst	r1, #64
	beq	.L664
	ldr	r1, [r6, #164]	@ unaligned
	ldr	r1, [r6, r1]
	orr	r3, r1, r3
.L664:
	str	r2, [r0, #4084]	@ unaligned
	str	r3, [r0, #4088]	@ unaligned
	str	r4, [r0, #4092]	@ unaligned
	b	.L663
.L672:
	ldr	r3, [r4, #28]
	ldrh	r0, [r5, #52]
	ldr	r2, [r5, #48]
	ldr	r1, [r3]
	add	r3, r2, r2, lsl #1
	add	r2, r0, #1
	str	r2, [sp, #12]
	ldr	r0, [r1, #24]
	ldr	r2, [r1, #60]
	add	r1, r0, #8
	add	r2, r2, r3, lsl #3
	ldr	r3, [r2, #4]
	ldr	r2, [r2, #8]
	cmp	r1, r3
	add	lr, r3, #8
	movhi	ip, #0
	movls	ip, #1
	cmp	r1, r2
	movhi	r1, #0
	movls	r1, #1
	cmp	r0, lr
	orrcs	ip, ip, #1
	add	lr, r2, #8
	mov	fp, lr
	orr	lr, r3, r2
	orr	lr, r0, lr
	cmp	r0, fp
	orrcs	r1, r1, #1
	tst	lr, #7
	andeq	r1, ip, r1
	movne	r1, #0
	cmp	r1, #0
	beq	.L659
	ldm	r2, {fp, lr}
	ldr	ip, [r3]
	ldr	r1, [r3, #4]
	orr	ip, fp, ip
	orr	r1, lr, r1
	str	ip, [r0]
	str	r1, [r0, #4]
	ldr	fp, [r2, #8]
	ldr	ip, [r3, #8]
	ldr	lr, [r2, #12]
	ldr	r1, [r3, #12]
	orr	ip, fp, ip
	orr	r1, lr, r1
	str	ip, [r0, #8]
	str	r1, [r0, #12]
	ldr	fp, [r2, #16]
	ldr	ip, [r3, #16]
	ldr	lr, [r2, #20]
	ldr	r1, [r3, #20]
	orr	ip, fp, ip
	orr	r1, lr, r1
	str	ip, [r0, #16]
	str	r1, [r0, #20]
	ldr	fp, [r2, #24]
	ldr	ip, [r3, #24]
	ldr	lr, [r2, #28]
	ldr	r1, [r3, #28]
	orr	ip, fp, ip
	orr	r1, lr, r1
	str	ip, [r0, #24]
	str	r1, [r0, #28]
	ldr	fp, [r2, #32]
	ldr	ip, [r3, #32]
	ldr	lr, [r2, #36]
	ldr	r1, [r3, #36]
	orr	ip, fp, ip
	orr	r1, lr, r1
	str	ip, [r0, #32]
	str	r1, [r0, #36]
	ldr	ip, [r3, #40]
	ldr	lr, [r2, #44]
	ldr	r1, [r3, #44]
	ldr	fp, [r2, #40]
	orr	r1, lr, r1
	orr	ip, fp, ip
	str	ip, [r0, #40]
	str	r1, [r0, #44]
	ldr	ip, [r2, #48]
	ldr	fp, [r3, #48]
	ldr	r1, [r2, #52]
	ldr	lr, [r3, #52]
	orr	ip, fp, ip
	orr	r1, lr, r1
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
.L660:
	ldr	r2, [sp, #12]
	ldr	r1, [r4, #636]
	bl	__find_rev_next_zero_bit
	ldrb	r3, [r5, #44]	@ zero_extendqisi2
	strh	r0, [r5, #52]	@ movhi
	b	.L661
.L659:
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
	b	.L660
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r0
	.save {lr}
	str	lr, [sp, #-4]!
	mov	r0, r1
	ldr	lr, [r3, #28]
	.pad #36
	sub	sp, sp, #36
	mov	ip, #2
	mov	r1, #0
	ldr	r2, [r0, #8]
	stmib	sp, {r3, ip}
	strd	r0, [sp, #24]
	ldr	r3, [lr, #20]
	movw	r1, #625
	str	r1, [sp, #12]
	str	r2, [sp, #16]
	cmp	r2, r3
	str	r2, [sp, #20]
	movwcs	r3, #593
	strcs	r3, [sp, #12]
	bl	test_set_page_writeback
	add	r0, sp, #4
	bl	f2fs_submit_page_mbio
	add	sp, sp, #36
	@ sp needed
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
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r3, #0
	mov	r4, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	.pad #16
	sub	sp, sp, #16
	ldr	r5, [r1, #4]
	ldr	r6, [r1, #20]
	str	r0, [sp, #9]	@ unaligned
	strb	r3, [sp, #13]
	strb	r3, [sp, #14]
	strb	r3, [sp, #15]
	ldr	r3, [r6, #4]
	ldr	r2, [r3]
	ldr	r3, [r2, #28]
	ldr	r3, [r3, #488]
	ldr	r3, [r3, #672]
	cmp	r3, #2
	beq	.L678
	cmp	r3, #4
	beq	.L679
	cmp	r3, #6
	bne	.L704
.L687:
	cmp	r5, #0
	bne	.L688
	ldr	r3, [r6, #4]
	ldr	r5, [r4, #4]
	ldr	r2, [r3]
	ldrh	r3, [r2]
	and	r3, r3, #61440
	cmp	r3, #16384
	moveq	r6, #0
	beq	.L682
	ldr	r3, [r6]
	tst	r3, #256
	movne	r6, #2
	bne	.L682
	ldrb	r6, [r2, #340]	@ zero_extendqisi2
	and	r6, r6, #1
	add	r6, r6, #1
.L682:
	cmp	r5, #1
	bls	.L694
.L692:
	add	r2, sp, #9
	add	r3, r4, #12
	str	r6, [sp, #4]
	ldr	r0, [r4]
	str	r2, [sp]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #20]
	bl	allocate_data_block
	mov	r0, r4
	bl	f2fs_submit_page_mbio
	ldr	r0, [r4, #4]
	cmp	r0, #1
	bls	.L705
.L677:
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L678:
	cmp	r5, #0
	movne	r6, #3
	bne	.L682
	mov	r6, r5
.L694:
	add	r5, r5, r5, lsl #2
	ldr	r0, [r4]
	lsl	r5, r5, #2
	add	r5, r5, #288
	add	r0, r0, r5
	bl	mutex_lock
	b	.L692
.L679:
	cmp	r5, #0
	bne	.L683
	ldrh	r3, [r2]
	and	r3, r3, #61440
	cmp	r3, #16384
	moveq	r6, #0
	movne	r6, #2
	b	.L694
.L705:
	add	r0, r0, r0, lsl #2
	ldr	r3, [r4]
	lsl	r0, r0, #2
	add	r0, r0, #288
	add	r0, r3, r0
	bl	mutex_unlock
	b	.L677
.L688:
	mov	r0, r6
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L690
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L690
	cmp	r3, r1
	bls	.L691
	sub	r3, r3, #2032
	movw	r2, #36659
	sub	r3, r3, #10
	movt	r2, 10354
	movw	r1, #20580
	mul	r3, r2, r3
	movt	r1, 64
	cmp	r3, r1
	bls	.L690
.L691:
	mov	r0, r6
	bl	page_address
	ldr	r6, [r0, #4080]	@ unaligned
	ldr	r5, [r4, #4]
	and	r6, r6, #1
	add	r6, r6, #3
	b	.L682
.L683:
	mov	r0, r6
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L690
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	beq	.L706
.L690:
	mov	r6, #5
	ldr	r5, [r4, #4]
	b	.L682
.L706:
	cmp	r3, r1
	bls	.L686
	sub	r3, r3, #2032
	movw	r2, #36659
	sub	r3, r3, #10
	movt	r2, 10354
	movw	r1, #20580
	mul	r3, r2, r3
	movt	r1, 64
	cmp	r3, r1
	bls	.L690
.L686:
	mov	r0, r6
	bl	page_address
	ldr	r6, [r0, #4080]	@ unaligned
	ldr	r5, [r4, #4]
	and	r6, r6, #1
	rsb	r6, r6, #5
	b	.L682
.L704:
	movw	r0, #:lower16:.LC0
	movw	r1, #1516
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldr	r3, [r6, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L687
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
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	mov	r4, r1
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	ldr	r3, [r0, #24]
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [r1]
	cmp	r3, #0
	beq	.L736
.L708:
	mov	r0, r6
	add	r2, sp, #16
	ldr	r1, [r5, #12]
	bl	get_node_info
	ldrb	r1, [sp, #28]	@ zero_extendqisi2
	ldrh	r3, [r5, #16]
	ldr	r2, [r5, #12]
	ldr	r7, [r4, #20]
	ldr	r6, [r4, #4]
	strb	r1, [sp, #13]
	strh	r3, [sp, #14]	@ unaligned
	ldr	r3, [r7, #4]
	str	r2, [sp, #9]	@ unaligned
	ldr	r2, [r3]
	ldr	r3, [r2, #28]
	ldr	r3, [r3, #488]
	ldr	r3, [r3, #672]
	cmp	r3, #2
	beq	.L709
	cmp	r3, #4
	beq	.L710
	cmp	r3, #6
	bne	.L737
.L718:
	cmp	r6, #0
	bne	.L719
	ldr	r3, [r7, #4]
	ldr	r6, [r4, #4]
	ldr	r2, [r3]
	ldrh	r3, [r2]
	and	r3, r3, #61440
	cmp	r3, #16384
	moveq	r7, #0
	beq	.L713
	ldr	r3, [r7]
	tst	r3, #256
	movne	r7, #2
	bne	.L713
	ldrb	r7, [r2, #340]	@ zero_extendqisi2
	and	r7, r7, #1
	add	r7, r7, #1
.L713:
	cmp	r6, #1
	bls	.L725
.L723:
	add	r2, sp, #9
	add	r3, r4, #12
	str	r7, [sp, #4]
	ldr	r0, [r4]
	str	r2, [sp]
	ldr	r2, [r4, #16]
	ldr	r1, [r4, #20]
	bl	allocate_data_block
	mov	r0, r4
	bl	f2fs_submit_page_mbio
	ldr	r0, [r4, #4]
	cmp	r0, #1
	bls	.L738
.L724:
	ldr	r1, [r4, #12]
	mov	r0, r5
	bl	f2fs_update_data_blkaddr
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L709:
	cmp	r6, #0
	movne	r7, #3
	bne	.L713
	mov	r7, r6
.L725:
	add	r6, r6, r6, lsl #2
	ldr	r0, [r4]
	lsl	r6, r6, #2
	add	r6, r6, #288
	add	r0, r0, r6
	bl	mutex_lock
	b	.L723
.L710:
	cmp	r6, #0
	bne	.L714
	ldrh	r3, [r2]
	and	r3, r3, #61440
	cmp	r3, #16384
	moveq	r7, #0
	movne	r7, #2
	b	.L725
.L738:
	add	r0, r0, r0, lsl #2
	ldr	r3, [r4]
	lsl	r0, r0, #2
	add	r0, r0, #288
	add	r0, r3, r0
	bl	mutex_unlock
	b	.L724
.L714:
	mov	r0, r7
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L721
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	bne	.L721
	cmp	r3, r1
	bls	.L717
	sub	r3, r3, #2032
	movw	r2, #36659
	sub	r3, r3, #10
	movt	r2, 10354
	movw	r1, #20580
	mul	r3, r2, r3
	movt	r1, 64
	cmp	r3, r1
	bls	.L721
.L717:
	mov	r0, r7
	bl	page_address
	ldr	r7, [r0, #4080]	@ unaligned
	ldr	r6, [r4, #4]
	and	r7, r7, #1
	rsb	r7, r7, #5
	b	.L713
.L719:
	mov	r0, r7
	bl	page_address
	ldr	r3, [r0, #4080]	@ unaligned
	lsr	r3, r3, #3
	cmn	r3, #-536870911
	beq	.L721
	movw	r2, #1022
	movw	r1, #2041
	cmp	r3, r2
	cmpne	r3, #3
	moveq	r2, #1
	movne	r2, #0
	cmp	r3, r1
	orreq	r2, r2, #1
	cmp	r2, #0
	beq	.L739
.L721:
	mov	r7, #5
	ldr	r6, [r4, #4]
	b	.L713
.L736:
	movw	r0, #:lower16:.LC0
	movw	r1, #1610
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L708
.L739:
	cmp	r3, r1
	bls	.L722
	sub	r3, r3, #2032
	movw	r2, #36659
	sub	r3, r3, #10
	movt	r2, 10354
	movw	r1, #20580
	mul	r3, r2, r3
	movt	r1, 64
	cmp	r3, r1
	bls	.L721
.L722:
	mov	r0, r7
	bl	page_address
	ldr	r7, [r0, #4080]	@ unaligned
	ldr	r6, [r4, #4]
	and	r7, r7, #1
	add	r7, r7, #3
	b	.L713
.L737:
	movw	r0, #:lower16:.LC0
	movw	r1, #1516
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	ldr	r3, [r7, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L718
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
	ldr	ip, [r0, #16]
	add	r1, r3, #856
	str	ip, [r0, #12]
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
	b	f2fs_submit_page_mbio
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
	bhi	.L742
	ldr	ip, [r0, #4]
	ldr	r2, [r0, #16]
	ldr	r1, [r4, #632]
	ldr	r7, [ip]
	sub	r2, r6, r2
	rsb	r7, r7, r2, lsr r1
	add	r2, r7, r7, lsl #1
	lsl	r2, r2, #3
.L742:
	ldr	r1, [r8, #60]
	eor	ip, r10, #1
	cmp	r10, #0
	ldr	r5, [r0, #12]
	str	ip, [sp, #12]
	ldrb	r9, [r1, r2]	@ zero_extendqisi2
	and	r9, r9, #63
	bne	.L743
	ldrh	r2, [r1, r2]
	bic	r2, r2, #63
	cmp	r2, #0
	beq	.L744
.L780:
	lsl	r2, r9, #6
.L745:
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
	beq	.L757
	mov	r1, r9
	mov	r0, r4
	str	r7, [r5, #60]
	bl	change_curseg.constprop.0
	ldrd	r2, [sp, #12]
.L757:
	ldr	ip, [sp, #8]
	eor	r0, r10, #1
	ldr	r1, [r4, #28]
	orrs	r0, r0, ip
	ldr	r0, [r4, #636]
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
	bne	.L781
.L758:
	ldr	ip, [sp]
	sub	r3, ip, #1
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L759
	ldr	r3, [r4, #28]
	mov	r7, ip
	ldr	r0, [r4, #632]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r1, [r1]
	sub	r2, ip, r2
	rsb	r1, r1, r2, lsr r0
	cmn	r1, #1
	bne	.L782
.L759:
	mov	r0, r4
	bl	locate_dirty_segment
	ldr	r3, [sp, #4]
	cmn	r3, #3
	mvnhi	r1, #0
	bhi	.L761
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #632]
	ldr	r1, [r3, #4]
	ldr	r3, [r3, #16]
	ldr	r1, [r1]
	sub	r6, r6, r3
	rsb	r1, r1, r6, lsr r2
.L761:
	mov	r0, r4
	bl	locate_dirty_segment
	mov	r1, fp
	mov	r0, r4
	bl	locate_dirty_segment
	cmp	r10, #0
	beq	.L762
	ldr	r3, [r5, #48]
	cmp	r3, fp
	bne	.L783
.L763:
	ldr	r3, [sp, #20]
	strh	r3, [r5, #52]	@ movhi
.L762:
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
.L743:
	ldr	r2, [r5, #48]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #112]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #176]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #240]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #304]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #368]
	cmp	r2, r7
	movne	r2, #64
	movne	r9, #1
	bne	.L745
	b	.L780
.L744:
	ldr	r2, [r5, #48]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #112]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #176]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #240]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #304]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [r5, #368]
	cmp	r2, r7
	beq	.L780
	ldr	r2, [sp]
	cmp	r2, #0
	moveq	r2, #128
	movne	r2, #64
	moveq	r9, #2
	movne	r9, #1
	b	.L745
.L783:
	mov	r1, r9
	mov	r0, r4
	str	fp, [r5, #60]
	bl	change_curseg.constprop.0
	b	.L763
.L782:
	mvn	r2, #0
	mov	r1, ip
	mov	r0, r4
	bl	update_sit_entry
	ldr	r3, [r4, #28]
	ldr	r0, [r4, #632]
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #16]
	ldr	r1, [r1]
	sub	r2, r7, r2
	rsb	r1, r1, r2, lsr r0
	b	.L759
.L781:
	mov	r2, #1
	mov	r1, r6
	mov	r0, r4
	bl	update_sit_entry
	b	.L758
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
	ldr	r3, [r1, #488]
	str	r3, [sp, #20]
	beq	.L814
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
	b	.L812
.L842:
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L837
.L796:
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
	bne	.L803
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
	beq	.L804
	ldr	r3, [fp]
	tst	r3, #1
	beq	.L838
.L805:
	mov	r0, fp
	bl	unlock_page
	mov	r0, fp
	bl	put_page
	ldr	r0, [sp, #64]
	cmp	r0, #0
	beq	.L803
	ldr	r3, [sp, #68]
	cmp	r0, r3
	bne	.L813
.L803:
	mov	r1, r4
	mov	r0, #3
	bl	_clear_bit
.L809:
	mov	r3, #0
	mov	r1, r4
	mov	r0, #11
	str	r3, [r4, #28]
	bl	_clear_bit
	cmp	r4, #0
	beq	.L810
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L839
.L811:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L810:
	mov	r0, r7
	bl	list_del
	ldr	r3, [sp, #16]
	mov	r1, r6
	ldr	r0, [r3, #8]
	bl	kmem_cache_free
	ldr	r3, [r9, #28]
	ldr	r3, [r3, #488]
	add	r2, r3, #716
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
	beq	.L784
	mov	r5, r3
.L812:
	cmp	r8, #0
	ldr	r4, [r6, #8]
	beq	.L787
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L840
.L787:
	mov	r1, r4
	mov	r0, #0
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L841
.L793:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L842
.L794:
	cmp	r8, #0
	beq	.L809
	b	.L803
.L814:
	mov	r3, #0
	str	r3, [sp, #24]
.L784:
	ldr	r0, [sp, #24]
	add	sp, sp, #92
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L841:
	mov	r0, r4
	bl	__lock_page
	b	.L793
.L804:
	ldr	r0, [sp, #64]
	cmp	r0, #0
	beq	.L803
.L813:
	bl	put_page
	b	.L803
.L839:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L811
.L840:
	ldr	r1, [sp, #28]
	ldr	r2, [r1, #4]
	add	r2, r2, #1
	str	r2, [r1, #4]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L792
.L791:
	mov	r2, #6
	mov	r1, r4
	ldr	r3, [fp]
	ldr	r0, [fp, #4]
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L791
.L792:
	ldr	r2, [sp, #28]
	ldr	r3, [r2, #4]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r2]
	tst	r3, #2
	beq	.L787
	bl	preempt_schedule
	b	.L787
.L837:
	ldr	r1, [sp, #28]
	ldr	r2, [r1, #4]
	add	r2, r2, #1
	str	r2, [r1, #4]
	ldr	fp, [r3, #16]
	cmp	fp, #0
	beq	.L801
.L800:
	mov	r2, #7
	mov	r1, r4
	ldr	r3, [fp]
	ldr	r0, [fp, #4]
	blx	r3
	ldr	r3, [fp, #8]!
	cmp	r3, #0
	bne	.L800
.L801:
	ldr	r2, [sp, #28]
	ldr	r3, [r2, #4]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	ldr	r3, [r2]
	tst	r3, #2
	beq	.L796
	bl	preempt_schedule
	b	.L796
.L838:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [fp, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L805
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
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #356]
	tst	r3, #32768
	bne	.L849
.L844:
	add	r5, r4, #432
	mov	r0, r5
	bl	mutex_lock
	add	r1, r4, #424
	mov	r0, r4
	mov	r3, #0
	mov	r2, #1
	bl	__revoke_inmem_pages
	mov	r0, r5
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	mutex_unlock
.L849:
	add	r1, r0, #356
	mov	r0, #15
	bl	_clear_bit
	b	.L844
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
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r3, #34464
	strd	r6, [sp, #8]
	movt	r3, 1
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r2, [r0, #28]
	.pad #68
	sub	sp, sp, #68
	add	r1, sp, #28
	str	r1, [sp, #28]
	ldr	r4, [r2, #488]
	str	r1, [sp, #32]
	ldr	r2, [r4, #20]
	ldr	r2, [r2, #76]
	cmp	r2, r3
	bcs	.L896
.L851:
	add	r3, r4, #632
	ldr	r0, [r4, #708]
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
	ldr	r0, [r4, #700]
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
	ldr	r0, [r4, #720]
	ldr	r9, [r4, #16]
	udiv	r6, r6, ip
	asr	fp, r0, #31
	subs	r0, r0, #1
	sbc	r1, fp, #0
	adds	r5, r0, r5
	adc	lr, r1, lr
	lsr	r5, r5, r3
	subs	r3, r3, #32
	orr	r5, r5, lr, lsl r2
	orrpl	r5, r5, lr, asr r3
	tst	r9, #8
	ubfx	r9, r9, #3, #1
	udiv	r5, r5, ip
	bne	.L855
	ldr	r3, [r4, #28]
	add	r7, r7, r5
	ldr	r5, [r3, #36]
	ldr	r3, [r3, #4]
	udiv	ip, r5, ip
	ldr	r3, [r3, #8]
	add	r5, ip, r7
	add	r6, r5, r6, lsl #1
	cmp	r3, r6
	bls	.L897
.L855:
	add	r3, r4, #364
	add	r4, r8, #432
	mov	r0, r3
	mov	r9, r8
	str	r4, [sp, #12]
	str	r3, [sp, #16]
	bl	down_read
	mov	r0, r4
	bl	mutex_lock
	ldr	r1, [r8, #28]
	mov	r2, #0
	mov	r3, #0
	ldr	r6, [r9, #424]!
	movw	r0, #593
	strd	r2, [sp, #40]
	str	r0, [sp, #44]
	ldr	r1, [r1, #488]
	cmp	r6, r9
	mov	fp, r6
	str	r1, [sp, #20]
	str	r1, [sp, #36]
	strd	r2, [sp, #48]
	strd	r2, [sp, #56]
	ldr	r4, [r6]
	beq	.L879
	mov	r3, sp
	bic	r10, r3, #8128
	mov	r3, #0
	bic	r10, r10, #63
	str	r3, [sp, #8]
	b	.L874
.L858:
	mov	r0, r5
	mov	r6, r4
	bl	unlock_page
	mov	r0, fp
	bl	__list_del_entry
	add	r2, sp, #28
	mov	r0, fp
	ldr	r1, [sp, #32]
	bl	__list_add
	cmp	r4, r9
	mov	fp, r4
	ldr	r4, [r4]
	beq	.L898
.L874:
	ldr	r5, [r6, #8]
	mov	r0, #0
	mov	r1, r5
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L899
.L857:
	ldr	r2, [r5, #4]
	ldr	r3, [r8, #32]
	cmp	r2, r3
	bne	.L858
	movw	r3, #:lower16:__tracepoint_f2fs_commit_inmem_page
	movt	r3, #:upper16:__tracepoint_f2fs_commit_inmem_page
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L900
.L860:
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #8192
	bne	.L901
.L867:
	mov	r0, r5
	bl	clear_page_dirty_for_io
	cmp	r0, #0
	beq	.L869
	ldrh	r2, [r8]
	and	r3, r2, #61440
	and	r2, r2, #53248
	cmp	r3, #16384
	cmpne	r2, #32768
	bne	.L870
	add	r2, r8, #376
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
	ldr	r1, [r8, #28]
	cmp	r3, #16384
	movne	r2, #704
	moveq	r2, #700
	ldr	r3, [r1, #488]
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
.L870:
	mov	r0, r8
	bl	remove_dirty_inode
.L869:
	add	r0, sp, #36
	str	r5, [sp, #56]
	bl	do_write_data_page
	subs	r7, r0, #0
	bne	.L902
	ldr	r3, [sp, #52]
	mov	r2, #1
	str	r2, [sp, #8]
	str	r3, [r6, #12]
	b	.L858
.L901:
	ldr	r0, [r5, #4]
	mov	r3, #0
	mov	ip, #1
	mov	r1, r3
	mov	r2, r5
	ldr	r0, [r0]
	ldr	r0, [r0, #28]
	ldr	r0, [r0, #488]
	stm	sp, {r3, ip}
	bl	f2fs_submit_merged_bio_cond
	ldr	r3, [r5]
	tst	r3, #8192
	beq	.L867
	mov	r1, #13
	mov	r0, r5
	bl	wait_on_page_bit
	b	.L867
.L899:
	mov	r0, r5
	bl	__lock_page
	b	.L857
.L898:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	beq	.L879
	mov	r3, #0
	mov	ip, #1
	ldr	r0, [sp, #20]
	mov	r2, r3
	mov	r1, r8
	stm	sp, {r3, ip}
	bl	f2fs_submit_merged_bio_cond
.L879:
	mov	r3, #0
	add	r1, sp, #28
	mov	r0, r8
	mov	r2, r3
	mov	r7, r3
	bl	__revoke_inmem_pages
.L877:
	ldr	r0, [sp, #12]
	bl	mutex_unlock
	ldr	r0, [sp, #16]
	bl	up_read
	mov	r0, r7
	add	sp, sp, #68
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L900:
	ldr	r2, [r10, #4]
	add	r2, r2, #1
	str	r2, [r10, #4]
	ldr	r7, [r3, #16]
	cmp	r7, #0
	beq	.L865
.L864:
	mov	r2, #5
	mov	r1, r5
	ldr	r3, [r7]
	ldr	r0, [r7, #4]
	blx	r3
	ldr	r3, [r7, #8]!
	cmp	r3, #0
	bne	.L864
.L865:
	ldr	r3, [r10, #4]
	sub	r3, r3, #1
	str	r3, [r10, #4]
	ldr	r3, [r10]
	tst	r3, #2
	beq	.L860
	bl	preempt_schedule
	b	.L860
.L896:
	mov	r0, r4
	bl	f2fs_balance_fs_bg
	b	.L851
.L902:
	mov	r0, r5
	bl	unlock_page
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L903
.L873:
	add	r1, sp, #28
	mov	r3, #1
	mov	r2, #0
	mov	r0, r8
	bl	__revoke_inmem_pages
	mov	ip, r0
	mov	r3, #0
	cmp	ip, r3
	mov	r1, r9
	mov	r0, r8
	mov	r2, #1
	movne	r7, ip
	bl	__revoke_inmem_pages
	b	.L877
.L897:
	add	r0, r4, #804
	bl	mutex_lock
	mov	r2, r9
	mov	r1, r9
	mov	r0, r4
	bl	f2fs_gc
	b	.L855
.L903:
	mov	r3, #0
	mov	ip, #1
	ldr	r0, [sp, #20]
	mov	r2, r3
	mov	r1, r8
	stm	sp, {r3, ip}
	bl	f2fs_submit_merged_bio_cond
	b	.L873
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
	mov	r2, r0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	str	lr, [sp, #8]
	ldr	r0, [r0, #4]
	mov	ip, r1
	.pad #12
	sub	sp, sp, #12
	mov	lr, #1
	mov	r3, #0
	mov	r1, r3
	ldr	r0, [r0]
	ldr	r0, [r0, #28]
	ldr	r0, [r0, #488]
	stm	sp, {ip, lr}
	bl	f2fs_submit_merged_bio_cond
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L920
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L920:
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
	ldr	r3, [r0, #340]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r3, #32]
	bl	find_lock_page
	subs	r4, r0, #0
	beq	.L921
	ldr	r3, [r4]
	tst	r3, #8192
	bne	.L942
.L926:
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L943
.L928:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	b	put_page
.L921:
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L942:
	ldr	r0, [r4, #4]
	mov	r3, #0
	mov	ip, #1
	mov	r1, r3
	mov	r2, r4
	ldr	r0, [r0]
	ldr	r0, [r0, #28]
	ldr	r0, [r0, #488]
	stm	sp, {r3, ip}
	bl	f2fs_submit_merged_bio_cond
	ldr	r3, [r4]
	tst	r3, #8192
	beq	.L926
	mov	r1, #13
	mov	r0, r4
	bl	wait_on_page_bit
	b	.L926
.L943:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L928
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
	ldr	r3, [r0, #328]
	.pad #12
	sub	sp, sp, #12
	ldr	r4, [r3, #132]	@ unaligned
	ands	r4, r4, #4
	bne	.L974
.L945:
	add	r2, r4, r7
	mov	r1, r4
	mov	r0, r8
	add	r4, r4, #1
	bl	write_current_sum_page
	cmp	r4, #3
	bne	.L945
.L944:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L974:
	bl	grab_meta_page
	mov	r5, r0
	movw	r4, #507
	bl	page_address
	ldr	r3, [r8, #28]
	movw	r1, #:lower16:.LC1
	mov	r2, r4
	movt	r1, #:upper16:.LC1
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
.L952:
	ldr	r0, [sp]
	ldr	r2, [r8, #28]
	ldr	r3, [r8, #328]
	ldr	r2, [r2, #12]
	add	r3, r3, r0
	ldrb	r3, [r3, #176]	@ zero_extendqisi2
	add	r10, r2, r0, lsl #6
	cmp	r3, #1
	ldreq	r9, [r8, #636]
	ldrhne	r9, [r10, #52]
	uxtheq	r9, r9
	cmp	r9, #0
	beq	.L948
	mov	r4, #0
	b	.L951
.L949:
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
	bls	.L950
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L975
.L956:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	mov	r5, #0
	bl	put_page
	mov	r1, fp
.L950:
	add	r4, r4, #1
	cmp	r4, r9
	beq	.L948
.L951:
	cmp	r5, #0
	rsb	r0, r4, r4, lsl #3
	add	ip, r1, #14
	add	r2, r6, r1
	add	fp, r1, #7
	bne	.L949
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
	bne	.L951
.L948:
	ldr	r3, [sp]
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [sp]
	bne	.L952
	cmp	r5, #0
	beq	.L944
	mov	r0, r5
	bl	set_page_dirty
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L976
.L954:
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
.L975:
	movw	r1, #1522
	ldr	r0, [sp, #4]
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L956
.L976:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L954
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
	bne	.L980
	ldrh	r6, [r0]	@ unaligned
	cmp	r6, #0
	mov	r4, r6
	mov	r0, r6
	beq	.L981
	mov	r5, #13
	b	.L983
.L1018:
	add	r1, r1, #1
	cmp	r1, r4
	beq	.L981
.L983:
	mla	lr, r5, r1, ip
	ldr	lr, [lr, #2]	@ unaligned
	cmp	lr, r2
	bne	.L1018
.L986:
	mov	r0, r1
	b	.L979
.L980:
	cmp	r1, #1
	bne	.L994
	ldrh	r0, [r0]	@ unaligned
	cmp	r0, #0
	beq	.L984
	ldr	lr, [ip, #2]	@ unaligned
	cmp	r2, lr
	beq	.L989
	cmp	r0, #1
	beq	.L984
	ldr	lr, [ip, #80]	@ unaligned
	cmp	lr, r2
	beq	.L986
	cmp	r0, #2
	beq	.L984
	ldr	r1, [ip, #158]	@ unaligned
	cmp	r1, r2
	beq	.L991
	cmp	r0, #3
	beq	.L984
	ldr	r1, [ip, #236]	@ unaligned
	cmp	r2, r1
	beq	.L992
	cmp	r0, #4
	beq	.L984
	ldr	r1, [ip, #314]	@ unaligned
	cmp	r2, r1
	beq	.L993
	cmp	r0, #5
	beq	.L984
	ldr	r1, [ip, #392]	@ unaligned
	cmp	r2, r1
	moveq	r0, #5
	beq	.L979
.L984:
	cmp	r3, #0
	cmpne	r0, #6
	beq	.L994
	add	r3, r0, #1
	strh	r3, [ip]	@ unaligned
.L979:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L981:
	cmp	r3, #0
	cmpne	r4, #38
	beq	.L994
	add	r6, r6, #1
	strh	r6, [ip]	@ unaligned
	b	.L979
.L994:
	mvn	r0, #0
	b	.L979
.L989:
	mov	r0, #0
	b	.L979
.L991:
	mov	r0, #2
	b	.L979
.L992:
	mov	r0, #3
	b	.L979
.L993:
	mov	r0, #4
	b	.L979
	.fnend
	.size	lookup_journal_in_cursum, .-lookup_journal_in_cursum
	.section	.rodata.str1.4
	.align	2
.LC10:
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
	mov	r7, r1
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #28]
	.pad #92
	sub	sp, sp, #92
	str	r3, [sp, #72]
	ldr	r4, [r3]
	ldr	r3, [r3, #12]
	add	r0, r4, #40
	str	r4, [sp, #4]
	ldr	r9, [r4, #28]
	str	r3, [sp, #60]
	ldr	r3, [r3, #168]
	str	r0, [sp, #68]
	mov	r10, r3
	bl	mutex_lock
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L1144
.L1021:
	ldr	r3, [r7]
	cmp	r3, #4
	beq	.L1066
.L1069:
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
	bhi	.L1067
	b	.L1068
.L1072:
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
	bcs	.L1068
.L1067:
	ldr	r5, [r3, #4]
	ldr	r6, [r8, #640]
	add	r9, r5, #12
	mov	r0, r9
	bl	_raw_spin_lock
	mov	r0, r4
	ldr	r1, [r5, #16]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1072
	udiv	r10, r4, r6
	ldr	r3, [r5, #4]
	ldr	r0, [r5, #16]
	add	r3, r3, #1
	str	r3, [r5, #4]
	ldr	r1, [r8, #640]
	mul	r6, r10, r6
	mov	r2, r6
	add	r1, r6, r1
	bl	_find_next_bit_le
	ldr	r2, [r8, #640]
	add	r6, r6, r2
	cmp	r0, r6
	bcc	.L1072
	mov	r0, r10
	ldr	r1, [r5, #20]
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L1072
	ldr	r3, [r5, #8]
	add	r3, r3, #1
	str	r3, [r5, #8]
	b	.L1072
.L1068:
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
.L1144:
	ldr	r5, [r8, #28]
	ldr	r1, [r5, #32]
	ldr	r3, [r5], #68
	ldr	r4, [r3, #28]
	mov	r0, r4
	bl	_find_first_bit_le
	ldr	r3, [r8, #28]
	mov	r6, r0
	ldr	r2, [r3, #32]
	cmp	r2, r0
	bls	.L1022
.L1023:
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
	bcc	.L1023
.L1022:
	ldr	r1, [sp, #4]
	ldrh	r2, [r10]	@ unaligned
	ldr	r1, [r1, #32]
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1145
.L1024:
	ldr	r2, [sp, #72]
	ldr	r3, [r2, #68]
	add	r2, r2, #68
	cmp	r2, r3
	str	r3, [sp, #8]
	str	r3, [sp, #44]
	ldr	r3, [r3]
	str	r2, [sp, #48]
	str	r3, [sp, #40]
	beq	.L1064
	movw	r0, #4767
	movw	r3, #:lower16:.LANCHOR0
	str	r8, [sp, #12]
	movt	r0, 10724
	movt	r3, #:upper16:.LANCHOR0
	str	r7, [sp, #28]
	movw	r2, #:lower16:.LC1
	movw	r1, #:lower16:.LC0
	movt	r2, #:upper16:.LC1
	movt	r1, #:upper16:.LC0
	str	r3, [sp, #52]
	str	r0, [sp, #56]
	ldr	r0, [sp, #8]
	mov	r3, #1
	mov	fp, r10
	str	r3, [sp, #16]
	str	r1, [sp, #64]
	str	r2, [sp, #76]
.L1063:
	ldr	r3, [sp, #12]
	ldr	r4, [r0, #8]
	ldr	r3, [r3, #28]
	add	r1, r4, #55
	ldr	r2, [r3, #32]
	cmp	r1, r2
	movcs	r6, r2
	ldr	r2, [sp, #16]
	movcc	r6, r1
	str	r6, [sp, #20]
	cmp	r2, #0
	beq	.L1034
	ldrh	r2, [fp]	@ unaligned
	ldr	r1, [r0, #12]
	rsb	r2, r2, #6
	cmp	r1, r2
	bhi	.L1034
	ldr	r3, [sp, #60]
	add	r5, r3, #152
	mov	r0, r5
	bl	down_write
	mov	r2, r4
	mov	r1, r6
	mov	r0, r9
	bl	_find_next_bit_le
	cmp	r6, r0
	mov	r4, r0
	movhi	r3, #0
	strhi	r3, [sp, #24]
	strhi	r3, [sp, #36]
	bls	.L1036
.L1056:
	ldr	r0, [sp, #12]
	add	r8, r4, r4, lsl #1
	ldr	r1, [sp, #28]
	lsl	r7, r8, #3
	ldr	r3, [r0, #28]
	ldr	r2, [r1]
	ldr	r3, [r3]
	cmp	r2, #4
	ldr	r6, [r3, #60]
	add	r5, r6, r7
	beq	.L1045
	mov	r2, #0
	str	r4, [r1, #8]
	str	r2, [r1, #12]
	bl	add_discard_addrs
.L1045:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L1046
	ldrh	r0, [fp]	@ unaligned
	cmp	r0, #0
	beq	.L1050
	ldr	r3, [fp, #2]	@ unaligned
	cmp	r3, r4
	beq	.L1083
	cmp	r0, #1
	beq	.L1050
	ldr	r3, [fp, #80]	@ unaligned
	cmp	r4, r3
	beq	.L1084
	cmp	r0, #2
	beq	.L1050
	ldr	r3, [fp, #158]	@ unaligned
	cmp	r4, r3
	beq	.L1085
	cmp	r0, #3
	beq	.L1050
	ldr	r3, [fp, #236]	@ unaligned
	cmp	r4, r3
	beq	.L1086
	cmp	r0, #4
	beq	.L1050
	ldr	r3, [fp, #314]	@ unaligned
	cmp	r4, r3
	beq	.L1087
	cmp	r0, #5
	beq	.L1050
	ldr	r3, [fp, #392]	@ unaligned
	cmp	r3, r4
	moveq	r0, #5
	beq	.L1048
	cmp	r0, #6
	beq	.L1146
.L1050:
	mov	r3, #78
	add	r2, r0, #1
	mul	r3, r3, r0
	strh	r2, [fp]	@ unaligned
	add	r3, r3, #8
.L1049:
	mov	ip, #78
	add	r3, fp, r3
	mov	r1, r3
	mla	ip, ip, r0, fp
	str	r3, [sp, #32]
	str	r4, [ip, #2]	@ unaligned
	ldrb	lr, [r6, r8, lsl #3]	@ zero_extendqisi2
	ldrh	r2, [r6, r7]
	and	lr, lr, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, lr, lsl #10
	strh	r2, [ip, #6]	@ unaligned
	ldr	r2, [r5, #4]
	add	r3, r2, #64
.L1051:
	ldr	r10, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r8, [r2, #-12]	@ unaligned
	ldr	lr, [r2, #-8]	@ unaligned
	ldr	ip, [r2, #-4]	@ unaligned
	cmp	r2, r3
	str	r10, [r1, #-16]	@ unaligned
	str	r8, [r1, #-12]	@ unaligned
	str	lr, [r1, #-8]	@ unaligned
	str	ip, [r1, #-4]	@ unaligned
	bne	.L1051
	ldr	r3, [sp, #32]
	ldr	r2, [r5, #8]
	add	r10, r3, #64
.L1052:
	ldr	r8, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-12]	@ unaligned
	ldr	ip, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r10
	str	r8, [r2, #-16]	@ unaligned
	str	lr, [r2, #-12]	@ unaligned
	str	ip, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1052
	ldrh	r3, [r6, r7]
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
.L1053:
	cmp	r4, #0
	add	r3, r4, #31
	ldr	r5, [sp, #20]
	movge	r3, r4
	rsbs	r2, r4, #0
	asr	r3, r3, #5
	and	r2, r2, #31
	and	lr, r4, #31
	ldr	ip, [r9, r3, lsl #2]
	rsbpl	lr, r2, #0
	add	r2, r4, #1
	mov	r4, #1
	mov	r0, r9
	mov	r1, r5
	bic	ip, ip, r4, lsl lr
	str	ip, [r9, r3, lsl #2]
	ldr	ip, [sp, #4]
	ldr	r3, [ip, #32]
	sub	r3, r3, #1
	str	r3, [ip, #32]
	ldr	ip, [sp, #8]
	ldr	r3, [ip, #12]
	sub	r3, r3, #1
	str	r3, [ip, #12]
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r4, r0
	bhi	.L1056
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L1147
.L1044:
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L1058
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1148
.L1059:
	ldr	r4, [sp, #36]
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1058:
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L1149
.L1060:
	ldr	r4, [sp, #40]
	ldr	r0, [sp, #44]
	str	r4, [sp, #44]
	bl	list_del
	ldr	r1, [sp, #8]
	ldr	r3, [sp, #52]
	ldr	r0, [r3]
	bl	kmem_cache_free
	ldr	r3, [sp, #48]
	cmp	r4, r3
	ldr	r3, [r4]
	beq	.L1141
.L1061:
	ldr	r2, [sp, #40]
	mov	r0, r2
	str	r2, [sp, #8]
	str	r3, [sp, #40]
	b	.L1063
.L1046:
	ldr	r3, [sp, #4]
	ldrb	ip, [r6, r8, lsl #3]	@ zero_extendqisi2
	ldrh	r2, [r6, r7]
	ldr	r1, [r3, #36]
	mov	r3, #74
	and	ip, ip, #63
	ubfx	r2, r2, #6, #10
	orr	r2, r2, ip, lsl #10
	udiv	r0, r4, r1
	mls	r1, r1, r0, r4
	mul	r3, r3, r1
	str	r1, [sp, #32]
	ldr	r1, [sp, #24]
	strh	r2, [r1, r3]	@ unaligned
	ldr	r2, [r5, #4]
	add	r3, r3, #2
	add	r3, r1, r3
	mov	r1, r3
	add	r0, r2, #64
.L1054:
	ldr	r10, [r2]	@ unaligned
	add	r2, r2, #16
	add	r1, r1, #16
	ldr	r8, [r2, #-12]	@ unaligned
	ldr	lr, [r2, #-8]	@ unaligned
	ldr	ip, [r2, #-4]	@ unaligned
	cmp	r2, r0
	str	r10, [r1, #-16]	@ unaligned
	str	r8, [r1, #-12]	@ unaligned
	str	lr, [r1, #-8]	@ unaligned
	str	ip, [r1, #-4]	@ unaligned
	bne	.L1054
	ldr	r2, [r5, #8]
	add	r10, r3, #64
.L1055:
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
	bne	.L1055
	ldrh	r3, [r6, r7]
	mov	r1, #74
	ldr	ip, [sp, #24]
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
	b	.L1053
.L1084:
	mov	r0, #1
.L1048:
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1049
.L1034:
	ldr	r2, [sp, #56]
	ldr	r6, [r3]
	umull	r2, r7, r2, r4
	ldr	r2, [r3, #28]
	ldr	r3, [r6, #4]
	sub	r1, r4, r7
	sub	r2, r2, #1
	add	r7, r7, r1, lsr #1
	cmp	r4, r2
	movls	r2, r6
	lsr	r7, r7, #5
	add	r5, r7, r3
	bhi	.L1150
.L1037:
	ldr	r0, [r6, #16]
	mvn	r8, r7
	mov	r1, #1
	and	r8, r8, #7
	ldr	r10, [r2, #8]
	lsl	r8, r1, r8
	ldrb	r1, [r0, r7, lsr #3]	@ zero_extendqisi2
	ldr	r0, [sp, #12]
	tst	r1, r8
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
	ldr	r0, [sp, #12]
	bl	grab_meta_page
	ldr	r3, [r5]
	str	r0, [sp, #36]
	tst	r3, #16
	bne	.L1151
.L1041:
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
	beq	.L1042
	ldr	r3, [r5]
	tst	r3, #1
	beq	.L1152
.L1043:
	mov	r0, r5
	bl	unlock_page
	mov	r0, r5
	bl	put_page
.L1042:
	ldr	r2, [r6, #16]
	ldr	r0, [sp, #36]
	ldrb	r3, [r2, r7, lsr #3]	@ zero_extendqisi2
	eor	r8, r8, r3
	strb	r8, [r2, r7, lsr #3]
	bl	page_address
	ldr	r5, [sp, #20]
	mov	r3, r0
	mov	r2, r4
	mov	r0, r9
	str	r3, [sp, #24]
	mov	r1, r5
	bl	_find_next_bit_le
	cmp	r5, r0
	mov	r3, #0
	mov	r4, r0
	str	r3, [sp, #16]
	bhi	.L1056
	b	.L1044
.L1146:
	movw	r1, #2194
	ldr	r0, [sp, #64]
	bl	warn_slowpath_null
	ldr	r3, [sp, #12]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	mvn	r3, #69
	mvn	r0, #0
	b	.L1049
.L1147:
	ldr	r3, [sp, #60]
	add	r5, r3, #152
.L1036:
	mov	r0, r5
	bl	up_write
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1060
.L1149:
	movw	r1, #2215
	ldr	r0, [sp, #64]
	bl	warn_slowpath_null
	ldr	r3, [sp, #12]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	ldr	r4, [sp, #40]
	ldr	r0, [sp, #44]
	str	r4, [sp, #44]
	bl	list_del
	ldr	r1, [sp, #8]
	ldr	r3, [sp, #52]
	ldr	r0, [r3]
	bl	kmem_cache_free
	ldr	r3, [sp, #48]
	cmp	r3, r4
	ldr	r3, [r4]
	bne	.L1061
.L1141:
	ldr	r8, [sp, #12]
	ldr	r3, [sp, #72]
	ldr	r2, [sp, #48]
	ldr	r7, [sp, #28]
	ldr	r3, [r3, #68]
	cmp	r2, r3
	bne	.L1153
.L1064:
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1021
	movw	r0, #:lower16:.LC0
	movw	r1, #2220
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r8, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1021
.L1083:
	mov	r0, #0
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1049
.L1085:
	mov	r0, #2
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1049
.L1086:
	mov	r0, #3
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1049
.L1087:
	mov	r0, #4
	mov	r3, #78
	mul	r3, r3, r0
	add	r3, r3, #8
	b	.L1049
.L1066:
	ldrd	r2, [r7, #8]
	ldrd	r0, [r7, #16]
	cmp	r1, r3
	cmpeq	r0, r2
	bcc	.L1069
.L1070:
	mov	r1, r7
	mov	r0, r8
	bl	add_discard_addrs
	ldr	r1, [r7, #8]
	ldr	ip, [r7, #12]
	ldrd	r2, [r7, #16]
	adds	r4, r1, #1
	adc	r5, ip, #0
	cmp	r5, r3
	cmpeq	r4, r2
	strd	r4, [r7, #8]
	bls	.L1070
	b	.L1069
.L1151:
	movw	r1, #2024
	ldr	r0, [sp, #64]
	bl	warn_slowpath_null
	ldr	r3, [sp, #12]
	mov	r0, #2
	add	r1, r3, #16
	bl	_set_bit
	b	.L1041
.L1150:
	movw	r0, #:lower16:.LC10
	movw	r1, #586
	movt	r0, #:upper16:.LC10
	bl	warn_slowpath_null
	ldr	r8, [sp, #12]
	mov	r0, #2
	add	r1, r8, #16
	bl	_set_bit
	ldr	r3, [r8, #28]
	ldr	r2, [r3]
	ldr	r3, [r2, #4]
	b	.L1037
.L1152:
	movw	r1, #1522
	ldr	r0, [sp, #76]
	bl	warn_slowpath_null
	ldr	r3, [r5, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1043
.L1148:
	movw	r1, #1522
	ldr	r0, [sp, #76]
	bl	warn_slowpath_null
	ldr	r3, [sp, #36]
	mov	r0, #2
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1059
.L1145:
	ldr	r6, [r3, #12]
	ldr	r4, [r6, #168]
	add	r6, r6, #152
	mov	r0, r6
	bl	down_write
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #0
	moveq	r2, r3
	beq	.L1025
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
	bne	.L1026
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #68
	bl	add_sit_entry
.L1026:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #1
	movls	r2, #1
	bls	.L1027
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
	bne	.L1028
	ldr	r3, [ip, #32]
	add	r3, r3, #1
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #68
	bl	add_sit_entry
.L1028:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #2
	movls	r2, #2
	bls	.L1027
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
	bne	.L1029
	ldr	r3, [ip, #32]
	add	r3, r3, r5
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #68
	bl	add_sit_entry
.L1029:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #3
	movls	r2, #3
	bls	.L1027
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
	bne	.L1030
	ldr	r3, [ip, #32]
	add	r3, r3, r5
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #68
	bl	add_sit_entry
.L1030:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #4
	movls	r2, #4
	bls	.L1027
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
	beq	.L1154
.L1031:
	ldrh	r3, [r4]	@ unaligned
	cmp	r3, #5
	movls	r2, #5
	bls	.L1027
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
	beq	.L1155
.L1032:
	ldrh	r3, [r4]	@ unaligned
	mov	r2, #6
.L1027:
	rsb	r2, r2, #0
	sxth	r2, r2
.L1025:
	add	r3, r2, r3
	mov	r0, r6
	strh	r3, [r4]	@ unaligned
	bl	up_write
	b	.L1024
.L1153:
	movw	r0, #:lower16:.LC0
	movw	r1, #2219
	movt	r0, #:upper16:.LC0
	bl	warn_slowpath_null
	add	r1, r8, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1064
.L1154:
	ldr	r3, [ip, #32]
	add	r3, r3, r5
	str	r3, [ip, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #68
	bl	add_sit_entry
	b	.L1031
.L1155:
	ldr	r3, [r1, #32]
	add	r3, r3, r5
	str	r3, [r1, #32]
	ldr	r1, [r8, #28]
	add	r1, r1, #68
	bl	add_sit_entry
	b	.L1032
	.fnend
	.size	flush_sit_entries, .-flush_sit_entries
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"&sit_i->sentry_lock\000"
	.align	2
.LC12:
	.ascii	"&array[i].curseg_mutex\000"
	.align	2
.LC13:
	.ascii	"&array[i].journal_rwsem\000"
	.align	2
.LC14:
	.ascii	"&dirty_i->seglist_lock\000"
	.section	.rodata.cst4,"aM",%progbits,4
	.align	2
.LC15:
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
	movw	r2, #:lower16:.LC15
	movt	r3, #:upper16:kmalloc_caches
	strd	r6, [sp, #8]
	movt	r2, #:upper16:.LC15
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	r10, r0
	str	lr, [sp, #32]
	ldr	r0, [r3, #28]
	.pad #140
	sub	sp, sp, #140
	ldr	r2, [r2]
	str	r2, [sp, #132]
	mov	r2,#0
	ldr	r4, [r10, #8]
	str	r3, [sp, #8]
	ldr	r5, [r10, #328]
	cmp	r0, #0
	beq	.L1312
	mov	r2, #92
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	beq	.L1166
.L1157:
	str	r0, [r10, #28]
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
	bls	.L1449
.L1160:
	ldr	r3, [r10, #800]
	add	r1, r0, #48
	mov	r2, #0
	mov	ip, #8
	mov	lr, #2
	str	r1, [r0, #48]
	str	r1, [r0, #52]
	tst	r3, #262144
	str	r2, [r0, #56]
	moveq	r3, #16
	str	r2, [r0, #60]
	str	lr, [r0, #64]
	streq	r3, [r0, #76]
	mov	r3, #70
	str	r3, [r0, #80]
	add	r3, r0, #68
	str	ip, [r0, #84]
	str	r3, [r0, #68]
	str	r3, [r0, #72]
	ldr	r3, [r10]
	ldr	r3, [r3, #52]
	tst	r3, #1
	bne	.L1165
	mov	r0, r10
	bl	create_flush_cmd_control
	subs	r4, r0, #0
	bne	.L1156
.L1165:
	ldr	r3, [sp, #8]
	ldr	r7, [r10, #8]
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L1450
	mov	r2, #104
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L1166
.L1163:
	ldr	r3, [r10, #28]
	movw	r1, #33488
	str	r4, [r3]
	ldr	r3, [r10, #28]
	ldr	r0, [r3, #32]
	add	r0, r0, r0, lsl #1
	lsl	r5, r0, #3
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4, #60]
	beq	.L1451
.L1305:
	ldr	r3, [r10, #28]
	movw	r1, #33488
	ldr	r5, [r3, #32]
	add	r5, r5, #31
	lsr	r5, r5, #5
	lsl	r5, r5, #2
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4, #28]
	beq	.L1452
.L1173:
	ldr	r3, [r10, #28]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1179
	mov	r6, #0
	ldr	r9, [sp, #8]
	mov	r8, r6
	ldr	r5, [r4, #60]
	b	.L1178
.L1442:
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1303:
	str	r0, [fp, #12]
	ldr	r5, [r4, #60]
	add	r3, r5, r6
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1166
.L1177:
	ldr	r3, [r10, #28]
	add	r8, r8, #1
	add	r6, r6, #24
	ldr	r3, [r3, #32]
	cmp	r8, r3
	bcs	.L1179
.L1178:
	ldr	r0, [r9, #24]
	add	r5, r5, r6
	cmp	r0, #0
	moveq	r0, #16
	beq	.L1174
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1174:
	str	r0, [r5, #4]
	ldr	r0, [r9, #24]
	ldr	r5, [r4, #60]
	cmp	r0, #0
	add	r5, r5, r6
	moveq	r0, #16
	beq	.L1175
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
.L1175:
	str	r0, [r5, #8]
	ldr	r5, [r4, #60]
	add	fp, r5, r6
	ldr	r3, [fp, #4]
	cmp	r3, #0
	beq	.L1166
	ldr	r3, [fp, #8]
	cmp	r3, #0
	beq	.L1166
	ldr	r3, [r10]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #500]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	bne	.L1176
	ldr	r3, [r3, #488]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	beq	.L1177
.L1176:
	ldr	r0, [r9, #24]
	cmp	r0, #0
	bne	.L1442
	mov	r0, #16
	b	.L1303
.L1268:
	ldr	r3, [sp, #8]
	ldr	r0, [r3, #28]
	cmp	r0, #0
	beq	.L1320
	mov	r2, #92
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L1166
.L1270:
	ldr	r3, [r10, #28]
	add	r6, r4, #36
	movw	r1, #:lower16:.LC14
	ldr	r2, .L1479
	mov	r0, r6
	movt	r1, #:upper16:.LC14
	movw	r7, #:lower16:pgprot_kernel
	movt	r7, #:upper16:pgprot_kernel
	str	r4, [r3, #8]
	add	r4, r4, #4
	bl	__mutex_init
	ldr	r3, [r10, #28]
	ldr	r5, [r3, #32]
	add	r5, r5, #31
	lsr	r5, r5, #5
	lsl	r5, r5, #2
	b	.L1272
.L1290:
	add	r4, r4, #4
	cmp	r6, r4
	beq	.L1453
.L1272:
	movw	r1, #33488
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4]
	bne	.L1290
	ldr	r2, [r7]
	movw	r1, #32976
	mov	r0, r5
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4]
	bne	.L1290
.L1166:
	mvn	r4, #11
.L1156:
	movw	r3, #:lower16:.LC15
	movt	r3, #:upper16:.LC15
	ldr	r2, [r3]
	ldr	r3, [sp, #132]
	eors	r2, r3, r2
	bne	.L1454
	mov	r0, r4
	add	sp, sp, #140
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1449:
	movw	r2, #34079
	movt	r2, 20971
	umull	r2, r3, r2, r3
	lsr	r3, r3, #5
	str	r3, [r0, #44]
	b	.L1160
.L1450:
	mov	r4, #16
	b	.L1163
.L1312:
	mov	r0, #16
	b	.L1157
.L1179:
	ldr	r3, [sp, #8]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1455
	mov	r2, #64
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #24]
	beq	.L1166
.L1180:
	ldr	r3, [r10, #640]
	cmp	r3, #1
	bls	.L1182
	ldr	r5, [r10, #648]
	movw	r1, #33488
	lsl	r5, r5, #2
	mov	r0, r5
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r4, #64]
	beq	.L1456
.L1182:
	ldr	r2, [r10, #8]
	ldr	r0, [r10, #328]
	ldr	r3, [r7, #56]	@ unaligned
	ldr	r2, [r2, #1664]	@ unaligned
	ldr	r8, [r0, #156]	@ unaligned
	lsr	r5, r3, #1
	cmp	r2, #0
	mov	r2, #208
	addne	r0, r0, #4096
	addeq	r0, r0, #192
	mov	r1, r8
	bl	kmemdup
	cmp	r0, #0
	beq	.L1166
	movw	r3, #:lower16:.LANCHOR1
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	mov	r6, #0
	str	r3, [r4]
	ldr	r3, [r7, #80]	@ unaligned
	mov	r7, #55
	str	r3, [r4, #4]
	ldr	r3, [r10, #632]
	str	r2, [r4, #12]
	str	r0, [r4, #16]
	str	r8, [r4, #20]
	lsl	r3, r5, r3
	str	r3, [r4, #8]
	strd	r6, [r4, #32]
	ldr	r3, [r10, #328]
	ldr	r2, [r3, #168]	@ unaligned
	ldr	r3, [r3, #172]	@ unaligned
	strd	r2, [r4, #72]
	bl	get_seconds
	asr	r7, r0, #31
	mov	r6, r0
	ldr	r2, .L1479
	movw	r1, #:lower16:.LC11
	add	r0, r4, #40
	movt	r1, #:upper16:.LC11
	strd	r6, [r4, #80]
	bl	__mutex_init
	ldr	r3, [sp, #8]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1316
	mov	r2, #24
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L1166
.L1187:
	ldr	r3, [r10, #28]
	mov	r1, #720
	str	r5, [r3, #4]
	ldr	r3, [r10, #28]
	ldr	r6, [r3, #32]
	add	r6, r6, #31
	lsr	r6, r6, #5
	lsl	r6, r6, #2
	mov	r0, r6
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #16]
	beq	.L1457
.L1302:
	ldr	r4, [r10, #648]
	mov	r1, #720
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #20]
	beq	.L1458
.L1301:
	cmp	r6, #0
	bne	.L1459
	cmp	r4, #0
	bne	.L1460
.L1191:
	ldr	r0, [r10, #28]
	mov	r2, #0
	movw	r1, #32976
	ldr	ip, [r10, #632]
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
	beq	.L1166
	ldr	r5, .L1479
	movw	r6, #:lower16:.LC12
	movw	r7, #:lower16:.LC13
	ldr	r9, [sp, #8]
	mov	r4, r0
	movt	r6, #:upper16:.LC12
	ldr	r3, [r10, #28]
	movt	r7, #:upper16:.LC13
	add	r8, r0, #384
	str	r0, [r3, #12]
.L1196:
	mov	r0, r4
	mov	r2, r5
	mov	r1, r6
	bl	__mutex_init
	ldr	r0, [r9, #48]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #20]
	beq	.L1193
	mov	r2, #4096
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #20]
	beq	.L1166
.L1193:
	add	r0, r4, #24
	mov	r2, r5
	mov	r1, r7
	bl	__init_rwsem
	ldr	r0, [r9, #36]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, #40]
	beq	.L1195
	movw	r2, #507
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, #40]
	beq	.L1166
.L1195:
	mvn	r2, #0
	mov	r3, #0
	add	r4, r4, #64
	str	r2, [r4, #-16]
	strh	r3, [r4, #-12]	@ movhi
	cmp	r8, r4
	bne	.L1196
	ldr	r2, [r10, #328]
	str	r2, [sp, #12]
	ldr	r3, [r2, #132]	@ unaligned
	ands	r0, r3, #4
	moveq	r2, #6
	moveq	fp, r0
	beq	.L1197
	ldrb	r3, [r2, #176]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r1, r2
	moveq	r1, r2
	ldrhne	r3, [r2, #116]	@ unaligned
	ldrb	r2, [r1, #177]	@ zero_extendqisi2
	ldreq	r3, [r10, #636]
	cmp	r2, #1
	ldrhne	r2, [r1, #118]	@ unaligned
	ldreq	r2, [r10, #636]
	add	r3, r3, r2
	ldrb	r2, [r1, #178]	@ zero_extendqisi2
	cmp	r2, #1
	ldrne	r2, [sp, #12]
	ldreq	r2, [r10, #636]
	ldrhne	r2, [r2, #120]	@ unaligned
	add	r3, r2, r3
	cmp	r3, #440
	blt	.L1204
	sub	r3, r3, #436
	ldr	r1, [r10, #8]
	ldr	r0, [r10, #332]
	sub	r3, r3, #3
	cmp	r3, #584
	movle	r2, #2
	movgt	r2, #3
	ldr	r1, [r1, #76]	@ unaligned
	cmp	r0, #2
	mov	r0, #1
	ldreq	r3, [r10, #636]
	addeq	r1, r1, r3
	ldr	r3, [sp, #12]
	ldr	ip, [r3, #140]	@ unaligned
	mov	r3, #0
	str	r0, [sp]
	mov	r0, r10
	add	r1, ip, r1
	bl	ra_meta_pages
	ldr	r3, [r10, #328]
	str	r3, [sp, #12]
.L1204:
	ldr	r3, [r10, #8]
	mov	r0, r10
	movw	r7, #507
	ldr	r2, [r10, #332]
	mov	fp, #0
	ldr	r8, [sp, #12]
	ldr	r3, [r3, #76]	@ unaligned
	cmp	r2, #2
	ldreq	r2, [r10, #636]
	ldr	r1, [r8, #140]	@ unaligned
	addeq	r3, r3, r2
	movw	r2, #:lower16:.LC1
	movt	r2, #:upper16:.LC1
	add	r1, r1, r3
	add	r5, r1, #1
	str	r2, [sp, #32]
	bl	get_meta_page
	mov	r4, r0
	bl	page_address
	ldr	r3, [r10, #28]
	mov	r6, r0
	mov	r1, r0
	add	r0, r8, #176
	mov	r2, r7
	movw	r8, #1014
	str	r0, [sp, #20]
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #40]
	bl	memcpy
	ldr	r3, [r10, #28]
	add	r1, r6, r7
	mov	r2, r7
	ldr	r3, [r3, #12]
	ldr	r0, [r3, #168]
	bl	memcpy
	str	r6, [sp, #24]
	mov	r6, r8
.L1215:
	ldr	r2, [sp, #12]
	add	r1, fp, #20
	lsl	r7, fp, #6
	ldr	ip, [r10, #28]
	add	r3, fp, #56
	add	r1, r2, r1, lsl #2
	add	r3, r2, r3, lsl #1
	ldr	r9, [ip, #12]
	ldr	r0, [r1, #4]	@ unaligned
	mov	r1, #5
	ldrh	r3, [r3, #4]	@ unaligned
	add	r9, r9, r7
	str	r0, [r9, #60]
	ldr	r0, [r10, #28]
	uxth	r2, r3
	str	r3, [sp, #28]
	mov	r3, #0	@ movhi
	ldr	r0, [r0, #12]
	str	r2, [sp, #16]
	add	r7, r0, r7
	ldr	r8, [r7, #20]
	ldr	r0, [r7, #60]
	str	r0, [r7, #48]
	ldr	ip, [r10, #640]
	ldr	lr, [r10, #644]
	strh	r3, [r7, #52]	@ movhi
	mvn	r3, #0
	str	r3, [r7, #60]
	udiv	ip, r0, ip
	add	r0, r8, #4080
	add	r0, r0, #11
	udiv	ip, ip, lr
	str	ip, [r7, #56]
	bl	__memzero
	mov	r3, #0
	strb	r3, [r8, #4091]
	ldr	r0, [r10, #28]
	ldr	r1, [r7, #48]
	ldr	r3, [sp, #20]
	ldr	r0, [r0]
	add	r1, r1, r1, lsl #1
	ldr	r0, [r0, #60]
	ldrb	ip, [r0, r1, lsl #3]	@ zero_extendqisi2
	bfi	ip, fp, #0, #6
	strb	ip, [r0, r1, lsl #3]
	ldrb	r1, [r3], #1	@ zero_extendqisi2
	str	r3, [sp, #20]
	ldr	r3, [sp, #28]
	cmp	r1, #1
	strb	r1, [r9, #44]
	strh	r3, [r9, #52]	@ movhi
	bne	.L1208
	ldr	r3, [r10, #636]
	uxth	r3, r3
	str	r3, [sp, #16]
.L1208:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L1209
	ldr	r0, [sp, #24]
	mov	r7, #0
	movw	r8, #4091
	str	fp, [sp, #16]
	mov	fp, r3
.L1214:
	ldr	ip, [r0, r6]	@ unaligned
	rsb	r1, r7, r7, lsl #3
	add	r2, r0, r6
	ldr	r3, [r9, #20]
	add	lr, r6, #14
	cmp	lr, r8
	addls	r6, r6, #7
	str	ip, [r3, r1]	@ unaligned
	add	r1, r3, r1
	ldrh	ip, [r2, #4]	@ unaligned
	ldrb	r3, [r2, #6]	@ zero_extendqisi2
	strh	ip, [r1, #4]	@ unaligned
	strb	r3, [r1, #6]
	bls	.L1211
	cmp	r4, #0
	beq	.L1212
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1461
.L1213:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
.L1212:
	mov	r1, r5
	mov	r0, r10
	bl	get_meta_page
	add	r5, r5, #1
	mov	r6, #0
	mov	r4, r0
	bl	page_address
.L1211:
	add	r7, r7, #1
	cmp	r7, fp
	bne	.L1214
	ldr	fp, [sp, #16]
	str	r0, [sp, #24]
.L1209:
	add	fp, fp, #1
	cmp	fp, #3
	bne	.L1215
	cmp	r4, #0
	beq	.L1462
	ldr	r3, [r4]
	tst	r3, #1
	beq	.L1463
.L1217:
	mov	r0, r4
	bl	unlock_page
	mov	r0, r4
	bl	put_page
	ldr	r3, [r10, #328]
	mov	r2, #3
	mov	r0, r2
	str	r3, [sp, #12]
	ldr	r3, [r3, #132]	@ unaligned
.L1197:
	ands	r3, r3, #33
	beq	.L1219
	ldr	r3, [r10, #8]
	ldr	r1, [r10, #332]
	cmp	r1, #2
	ldr	r1, [r3, #76]	@ unaligned
	beq	.L1464
.L1300:
	ldr	r3, [sp, #12]
	sub	ip, r0, #7
	mov	r0, r10
	ldr	lr, [r3, #136]	@ unaligned
	mov	r3, #1
	str	r3, [sp]
	mov	r3, #0
	add	ip, lr, ip
	add	r1, ip, r1
	bl	ra_meta_pages
	ldr	r3, [r10, #328]
	str	r3, [sp, #12]
	ldr	r3, [r3, #132]	@ unaligned
	and	r3, r3, #33
.L1219:
	movw	r2, #:lower16:.LC1
	mov	r8, #0
	ldr	r7, [sp, #12]
	movt	r2, #:upper16:.LC1
	str	r2, [sp, #24]
	b	.L1234
.L1467:
	ldr	r2, [r10, #8]
	cmp	r3, #0
	ldr	r3, [r10, #332]
	ldr	r1, [r2, #76]	@ unaligned
	beq	.L1465
	cmp	r3, #2
	bne	.L1296
	ldr	r3, [r10, #636]
	add	r1, r1, r3
.L1296:
	ldr	r3, [r7, #136]	@ unaligned
	sub	r3, r3, #7
	add	r3, r3, fp
	add	r1, r3, r1
.L1223:
	add	r2, fp, #20
	add	r3, fp, #56
	add	r2, r7, r2, lsl #2
	add	r3, r7, r3, lsl #1
	ldr	r2, [r2, #4]	@ unaligned
	mov	r0, r10
	str	r2, [sp, #12]
	ldrh	r3, [r3, #4]	@ unaligned
	str	r3, [sp, #16]
	bl	get_meta_page
	mov	r6, r0
	bl	page_address
	mov	r5, r0
.L1228:
	ldr	r3, [r10, #28]
	lsl	r9, fp, #6
	str	r9, [sp, #20]
	ldr	r4, [r3, #12]
	add	r4, r4, r9
	add	r9, r4, #24
	mov	r0, r4
	bl	mutex_lock
	mov	r0, r9
	bl	down_write
	add	r1, r5, #3584
	movw	r2, #507
	ldr	r0, [r4, #40]
	bl	memcpy
	mov	r0, r9
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
	ldr	lr, [sp, #12]
	str	ip, [r3, #4091]	@ unaligned
	ldrb	ip, [r5, #4]	@ zero_extendqisi2
	strb	ip, [r3, #4095]
	ldr	ip, [sp, #20]
	str	lr, [r4, #60]
	ldr	r3, [r10, #28]
	ldr	r3, [r3, #12]
	add	r9, r3, ip
	ldr	r5, [r9, #20]
	ldr	r3, [r9, #60]
	add	r0, r5, r0
	str	r3, [r9, #48]
	ldr	ip, [r10, #640]
	ldr	lr, [r10, #644]
	strh	r8, [r9, #52]	@ movhi
	str	r2, [r9, #60]
	udiv	r3, r3, ip
	udiv	lr, r3, lr
	str	lr, [r9, #56]
	bl	__memzero
	cmp	fp, #2
	bgt	.L1230
	strb	r8, [r5, #4091]
	ldr	r2, [r10, #28]
	add	r7, r7, fp
	ldr	r3, [r9, #48]
	mov	r0, r4
	ldr	r2, [r2]
	add	r3, r3, r3, lsl #1
	ldr	r2, [r2, #60]
	ldrb	r1, [r2, r3, lsl #3]	@ zero_extendqisi2
	bfi	r1, fp, #0, #6
	strb	r1, [r2, r3, lsl #3]
	ldrb	r3, [r7, #176]	@ zero_extendqisi2
	ldr	r2, [sp, #16]
	strb	r3, [r4, #44]
	strh	r2, [r4, #52]	@ movhi
	bl	mutex_unlock
	cmp	r6, #0
	beq	.L1231
.L1307:
	ldr	r3, [r6]
	tst	r3, #1
	beq	.L1466
.L1232:
	mov	r0, r6
	bl	unlock_page
	mov	r0, r6
	bl	put_page
.L1306:
	add	fp, fp, #1
	cmp	fp, #6
	beq	.L1233
.L1310:
	ldr	r7, [r10, #328]
	ldr	r3, [r7, #132]	@ unaligned
	and	r3, r3, #33
.L1234:
	cmp	fp, #2
	ble	.L1467
	add	r1, fp, #5
	add	r2, fp, #29
	add	r1, r7, r1, lsl #2
	cmp	r3, #0
	add	r3, r7, r2, lsl #1
	ldr	r2, [r1, #4]	@ unaligned
	str	r2, [sp, #12]
	ldrh	r3, [r3, #4]	@ unaligned
	sub	r2, fp, #3
	str	r3, [sp, #16]
	beq	.L1468
	ldr	r3, [r10, #8]
	ldr	r1, [r10, #332]
	ldr	r3, [r3, #76]	@ unaligned
	cmp	r1, #2
	bne	.L1298
	ldr	r1, [r10, #636]
	add	r3, r3, r1
.L1298:
	ldr	r1, [r7, #136]	@ unaligned
	sub	r1, r1, #4
	add	r1, r1, r2
	add	r1, r1, r3
.L1226:
	mov	r0, r10
	bl	get_meta_page
	mov	r6, r0
	bl	page_address
	ldr	r3, [r10, #328]
	mov	r5, r0
	ldr	r3, [r3, #132]	@ unaligned
	tst	r3, #33
	beq	.L1469
	ldr	r3, [r10, #636]
	cmp	r3, #0
	movne	r3, r5
	movne	r2, #0
	beq	.L1228
.L1227:
	strb	r8, [r3, #4]
	add	r2, r2, #1
	add	r3, r3, #7
	strb	r8, [r3, #-2]
	strb	r8, [r3, #-1]
	ldr	r1, [r10, #636]
	cmp	r1, r2
	bhi	.L1227
	b	.L1228
.L1455:
	mov	r3, #16
	str	r3, [r4, #24]
	b	.L1180
.L1230:
	mov	r3, #1
	add	r7, r7, fp
	mov	r0, r4
	strb	r3, [r5, #4091]
	ldr	r2, [r10, #28]
	ldr	r3, [r9, #48]
	ldr	r2, [r2]
	add	r3, r3, r3, lsl #1
	ldr	r2, [r2, #60]
	ldrb	r1, [r2, r3, lsl #3]	@ zero_extendqisi2
	bfi	r1, fp, #0, #6
	strb	r1, [r2, r3, lsl #3]
	ldrb	r3, [r7, #176]	@ zero_extendqisi2
	ldr	r2, [sp, #16]
	strb	r3, [r4, #44]
	strh	r2, [r4, #52]	@ movhi
	bl	mutex_unlock
	cmp	r6, #0
	bne	.L1307
	b	.L1306
.L1468:
	ldr	r3, [r10, #28]
	ldr	r1, [r3, #24]
	ldr	r3, [sp, #12]
	add	r1, r3, r1
	b	.L1226
.L1465:
	cmp	r3, #2
	bne	.L1294
	ldr	r3, [r10, #636]
	add	r1, r1, r3
.L1294:
	ldr	r3, [r7, #136]	@ unaligned
	sub	r3, r3, #4
	add	r3, r3, fp
	add	r1, r3, r1
	b	.L1223
.L1469:
	mov	r2, r5
	mov	r0, r10
	ldr	r1, [sp, #12]
	bl	restore_node_summary
	subs	r4, r0, #0
	beq	.L1228
	cmp	r6, #0
	beq	.L1156
	ldr	r3, [r6]
	tst	r3, #1
	beq	.L1470
.L1229:
	mov	r0, r6
	bl	unlock_page
	mov	r0, r6
	bl	put_page
	b	.L1156
.L1316:
	mov	r5, #16
	b	.L1187
.L1459:
	mov	r2, r6
	mov	r1, #255
	ldr	r0, [r5, #16]
	bl	memset
	cmp	r4, #0
	ldr	r0, [r5, #20]
	beq	.L1191
.L1460:
	mov	r2, r4
	mov	r1, #255
	bl	memset
	b	.L1191
.L1451:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r5
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4, #60]
	bne	.L1305
	b	.L1166
.L1452:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r5
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4, #28]
	bne	.L1173
	b	.L1166
.L1231:
	add	fp, fp, #1
	b	.L1310
.L1480:
	.align	2
.L1479:
	.word	.LANCHOR0+12
.L1233:
	ldr	r1, [r10, #28]
	movw	r2, #:lower16:.LC10
	movw	r3, #4767
	movt	r2, #:upper16:.LC10
	movt	r3, 10724
	mov	r9, #0
	mov	r6, r10
	str	r2, [sp, #36]
	ldr	r0, [r1, #12]
	ldr	r2, [r1, #32]
	str	r9, [sp, #16]
	ldr	r1, [r1]
	add	r2, r2, #54
	str	r1, [sp, #12]
	ldr	r1, [r0, #168]
	str	r0, [sp, #52]
	str	r1, [sp, #40]
	umull	r1, r3, r3, r2
	sub	r2, r2, r3
	add	r3, r3, r2, lsr #1
	lsr	r3, r3, #5
	str	r3, [sp, #48]
.L1236:
	ldr	r4, [sp, #16]
	mov	r0, #1
	mov	r3, #2
	mov	r2, #256
	str	r0, [sp]
	mov	r0, r6
	mov	r1, r4
	bl	ra_meta_pages
	ldr	r3, [sp, #12]
	add	r2, r4, r0
	str	r2, [sp, #16]
	ldr	r3, [r3, #36]
	mul	r8, r3, r4
	mul	r3, r2, r3
	cmp	r8, r3
	str	r3, [sp, #32]
	bcs	.L1248
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	str	r3, [sp, #44]
.L1235:
	ldr	r3, [r6, #28]
	ldr	r2, [r3, #32]
	cmp	r2, r8
	bls	.L1248
	movw	r2, #4767
	ldr	fp, [r3]
	movt	r2, 10724
	ldr	r1, [sp, #12]
	ldr	r3, [r3, #28]
	umull	r2, r9, r2, r8
	add	r2, r8, r8, lsl #1
	ldr	r10, [fp, #4]
	lsl	r7, r2, #3
	ldr	r5, [r1, #60]
	str	r2, [sp, #20]
	sub	r3, r3, #1
	sub	r2, r8, r9
	cmp	r3, r8
	add	r9, r9, r2, lsr #1
	add	r4, r5, r7
	lsr	r9, r9, #5
	add	r10, r9, r10
	bcc	.L1471
.L1238:
	ldr	r2, [fp, #16]
	mvn	r3, r9
	mov	r1, #1
	and	r3, r3, #7
	mov	r0, r6
	ldrb	r2, [r2, r9, lsr #3]	@ zero_extendqisi2
	ands	r3, r2, r1, lsl r3
	ldrne	r3, [fp, #8]
	addne	r10, r10, r3
	mov	r1, r10
	bl	get_meta_page
	mov	r10, r0
	bl	page_address
	ldr	r3, [sp, #12]
	mov	r1, r0
	mov	r2, #74
	add	r0, sp, #58
	ldr	ip, [r3, #36]
	udiv	r3, r8, ip
	mls	fp, ip, r3, r8
	mla	fp, r2, fp, r1
	mov	r1, fp
	bl	memcpy
	ldr	r3, [fp, #66]	@ unaligned
	cmp	r10, #0
	ldrh	r9, [fp]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [fp, #70]	@ unaligned
	str	r3, [sp, #28]
	beq	.L1240
	ldr	r3, [r10]
	tst	r3, #1
	beq	.L1472
.L1241:
	mov	r0, r10
	bl	unlock_page
	mov	r0, r10
	bl	put_page
.L1240:
	ldr	r2, [r6, #636]
	ubfx	r3, r9, #0, #10
	mov	r10, r3
	cmp	r3, r2
	bhi	.L1242
	ldr	r3, [r6, #28]
	ldr	r3, [r3, #28]
	sub	r3, r3, #1
	cmp	r3, r8
	bcc	.L1242
.L1243:
	ldrh	r1, [r5, r7]
	uxth	ip, r10
	add	r3, sp, #60
	mov	r2, r3
	add	r0, sp, #124
	bfi	r1, ip, #6, #10
	strh	r1, [r5, r7]	@ movhi
	ldrh	lr, [r4, #2]
	ldr	r1, [r4, #4]
	bfi	lr, ip, #0, #10
	strh	lr, [r4, #2]	@ movhi
.L1244:
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
	bne	.L1244
	ldr	r2, [r4, #8]
.L1245:
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
	bne	.L1245
	ldr	r2, [sp, #20]
	asr	r9, r9, #10
	ldrb	r3, [r5, r2, lsl #3]	@ zero_extendqisi2
	bfi	r3, r9, #0, #6
	strb	r3, [r5, r2, lsl #3]
	ldr	r3, [sp, #24]
	str	r3, [r4, #16]
	ldr	r3, [sp, #28]
	str	r3, [r4, #20]
	ldr	r3, [r6]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #500]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	beq	.L1473
.L1246:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #12]
	add	r1, r3, #64
.L1286:
	ldr	r4, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	lr, [r3, #-12]	@ unaligned
	ldr	ip, [r3, #-8]	@ unaligned
	ldr	r0, [r3, #-4]	@ unaligned
	cmp	r3, r1
	str	r4, [r2, #-16]	@ unaligned
	str	lr, [r2, #-12]	@ unaligned
	str	ip, [r2, #-8]	@ unaligned
	str	r0, [r2, #-4]	@ unaligned
	bne	.L1286
	ldr	r1, [r6, #636]
	ldr	r3, [r6, #688]
	ldrh	r2, [r5, r7]
	add	r3, r3, r1
	sub	r3, r3, r2, lsr #6
	str	r3, [r6, #688]
.L1287:
	ldr	r3, [r6, #640]
	cmp	r3, #1
	bls	.L1247
	ldr	r2, [r6, #28]
	udiv	r3, r8, r3
	ldrh	r0, [r5, r7]
	ldr	r2, [r2]
	ldr	r1, [r2, #64]
	ldr	r2, [r1, r3, lsl #2]
	add	r2, r2, r0, lsr #6
	str	r2, [r1, r3, lsl #2]
.L1247:
	ldr	r3, [sp, #32]
	add	r8, r8, #1
	cmp	r3, r8
	bne	.L1235
.L1248:
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #48]
	cmp	r3, r2
	bhi	.L1236
	ldr	r3, [sp, #52]
	mov	r10, r6
	add	r3, r3, #152
	mov	r0, r3
	str	r3, [sp, #48]
	bl	down_read
	ldr	r3, [sp, #40]
	ldrh	r3, [r3]	@ unaligned
	cmp	r3, #0
	beq	.L1260
	movw	r3, #:lower16:.LC10
	ldr	r2, [sp, #40]
	mov	fp, #0
	movt	r3, #:upper16:.LC10
	str	r3, [sp, #52]
	add	r3, sp, #60
	add	r9, r2, #6
	str	r3, [sp, #20]
	add	r3, sp, #124
	str	r3, [sp, #16]
.L1261:
	mov	r3, #78
	ldr	ip, [sp, #12]
	mov	r1, r9
	ldr	r2, [sp, #40]
	add	r0, sp, #58
	ldr	r4, [ip, #60]
	mla	r3, r3, fp, r2
	mov	r2, #74
	ldr	r8, [r3, #2]	@ unaligned
	bl	memcpy
	ldrh	r6, [r9]	@ unaligned
	ldr	r3, [r10, #636]
	add	r2, r8, r8, lsl #1
	ldr	r1, [r9, #66]	@ unaligned
	lsl	r7, r2, #3
	str	r2, [sp, #28]
	ubfx	r2, r6, #0, #10
	cmp	r2, r3
	ldrh	r2, [r4, r7]
	str	r1, [sp, #32]
	ldr	r1, [r9, #70]	@ unaligned
	add	r5, r4, r7
	ubfx	r3, r6, #0, #10
	lsr	r2, r2, #6
	str	r1, [sp, #36]
	str	r2, [sp, #44]
	bhi	.L1253
	ldr	r2, [r10, #28]
	ldr	r2, [r2, #28]
	sub	r2, r2, #1
	cmp	r8, r2
	bhi	.L1253
.L1254:
	ldrh	r2, [r4, r7]
	uxth	r0, r3
	str	r4, [sp, #24]
	ldr	r3, [sp, #20]
	bfi	r2, r0, #6, #10
	strh	r2, [r4, r7]	@ movhi
	ldrh	r1, [r5, #2]
	ldr	r2, [r5, #4]
	bfi	r1, r0, #0, #10
	strh	r1, [r5, #2]	@ movhi
.L1255:
	ldr	r4, [sp, #16]
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
	bne	.L1255
	ldr	r2, [r5, #8]
	ldr	r3, [sp, #20]
.L1256:
	ldr	r4, [sp, #16]
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
	bne	.L1256
	ldr	r4, [sp, #24]
	asr	r6, r6, #10
	ldr	r2, [sp, #28]
	ldrb	r3, [r4, r2, lsl #3]	@ zero_extendqisi2
	bfi	r3, r6, #0, #6
	strb	r3, [r4, r2, lsl #3]
	ldr	r3, [sp, #32]
	str	r3, [r5, #16]
	ldr	r3, [sp, #36]
	str	r3, [r5, #20]
	ldr	r3, [r10]
	ldr	r2, [r3, #208]
	ldr	r2, [r2, #88]
	ldr	r2, [r2, #500]
	ldr	r2, [r2, #556]
	tst	r2, #16384
	beq	.L1474
.L1257:
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #12]
	add	r5, r3, #64
.L1288:
	ldr	lr, [r3]	@ unaligned
	add	r3, r3, #16
	add	r2, r2, #16
	ldr	ip, [r3, #-12]	@ unaligned
	ldr	r0, [r3, #-8]	@ unaligned
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r5
	str	lr, [r2, #-16]	@ unaligned
	str	ip, [r2, #-12]	@ unaligned
	str	r0, [r2, #-8]	@ unaligned
	str	r1, [r2, #-4]	@ unaligned
	bne	.L1288
	ldr	r1, [sp, #44]
	ldr	r3, [r10, #688]
	ldrh	r2, [r4, r7]
	add	r3, r1, r3
	sub	r3, r3, r2, lsr #6
	str	r3, [r10, #688]
	ldr	r3, [r10, #640]
	cmp	r3, #1
	bls	.L1258
.L1476:
	ldr	r1, [r10, #28]
	udiv	r2, r8, r3
	add	fp, fp, #1
	ldrh	r0, [r4, r7]
	add	r9, r9, #78
	ldr	r3, [r1]
	ldr	r1, [r3, #64]
	ldr	r3, [r1, r2, lsl #2]
	add	r3, r3, r0, lsr #6
	ldr	r0, [sp, #44]
	sub	r3, r3, r0
	str	r3, [r1, r2, lsl #2]
	ldr	r3, [sp, #40]
	ldrh	r3, [r3]	@ unaligned
	cmp	fp, r3
	bcc	.L1261
.L1260:
	ldr	r0, [sp, #48]
	bl	up_read
	ldr	r3, [r10, #28]
	ldr	r2, [r3, #32]
	cmp	r2, #0
	movne	r4, #0
	bne	.L1251
	b	.L1252
.L1262:
	ldr	r3, [r1, #12]
	add	r3, r3, r2, lsr #6
	str	r3, [r1, #12]
.L1264:
	ldr	r3, [r10, #28]
	add	r4, r4, #1
	ldr	r2, [r3, #32]
	cmp	r4, r2
	bcs	.L1252
.L1251:
	ldr	r1, [r3]
	add	r2, r4, r4, lsl #1
	lsl	r2, r2, #3
	ldr	r0, [r1, #60]
	ldrh	r2, [r0, r2]
	bic	r0, r2, #63
	cmp	r0, #0
	bne	.L1262
	ldr	r6, [r3, #4]
	ldr	r5, [r10, #640]
	add	r7, r6, #12
	mov	r0, r7
	udiv	r8, r4, r5
	bl	_raw_spin_lock
	mov	r0, r4
	ldr	r1, [r6, #16]
	bl	_clear_bit
	ldr	r3, [r6, #4]
	ldr	r0, [r6, #16]
	add	r3, r3, #1
	mul	r5, r8, r5
	str	r3, [r6, #4]
	ldr	r1, [r10, #640]
	mov	r2, r5
	add	r1, r5, r1
	bl	_find_next_bit_le
	ldr	r2, [r10, #640]
	add	r5, r5, r2
	cmp	r0, r5
	bcs	.L1475
.L1263:
	mov	r0, r7
	bl	_raw_spin_unlock
	b	.L1264
.L1473:
	ldr	r3, [r3, #488]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	bne	.L1246
	b	.L1287
.L1242:
	movw	r1, #623
	ldr	r0, [sp, #36]
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1243
.L1471:
	movw	r1, #586
	ldr	r0, [sp, #36]
	bl	warn_slowpath_null
	add	r1, r6, #16
	mov	r0, #2
	bl	_set_bit
	b	.L1238
.L1472:
	movw	r1, #1522
	ldr	r0, [sp, #44]
	bl	warn_slowpath_null
	ldr	r3, [r10, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1241
.L1474:
	ldr	r3, [r3, #488]
	ldr	r3, [r3, #8]
	ldr	r3, [r3, #2180]	@ unaligned
	tst	r3, #2
	bne	.L1257
	ldr	r3, [r10, #640]
	cmp	r3, #1
	bhi	.L1476
.L1258:
	ldr	r3, [sp, #40]
	add	fp, fp, #1
	add	r9, r9, #78
	ldrh	r3, [r3]	@ unaligned
	cmp	fp, r3
	bcc	.L1261
	b	.L1260
.L1253:
	movw	r1, #623
	ldr	r0, [sp, #52]
	str	r3, [sp, #24]
	bl	warn_slowpath_null
	add	r1, r10, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [sp, #24]
	b	.L1254
.L1252:
	mov	r5, #0
	b	.L1269
.L1266:
	mov	r0, r6
	add	r5, r5, #64
	bl	_raw_spin_unlock
	cmp	r5, #384
	beq	.L1268
	ldr	r3, [r10, #28]
.L1269:
	ldr	r4, [r3, #4]
	ldr	r2, [r3, #12]
	ldr	r8, [r10, #640]
	add	r6, r4, #12
	add	r3, r2, r5
	mov	r0, r6
	ldr	r7, [r3, #48]
	bl	_raw_spin_lock
	ldr	r1, [r4, #16]
	mov	r0, r7
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1266
	ldr	r3, [r4, #4]
	udiv	r0, r7, r8
	ldr	r1, [r4, #20]
	sub	r3, r3, #1
	str	r3, [r4, #4]
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L1266
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	str	r3, [r4, #8]
	b	.L1266
.L1461:
	movw	r1, #1522
	ldr	r0, [sp, #32]
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1213
.L1466:
	movw	r1, #1522
	ldr	r0, [sp, #24]
	bl	warn_slowpath_null
	ldr	r3, [r6, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1232
.L1475:
	mov	r0, r8
	ldr	r1, [r6, #20]
	bl	_clear_bit
	ldr	r3, [r6, #8]
	add	r3, r3, #1
	str	r3, [r6, #8]
	b	.L1263
.L1453:
	ldr	r3, [r10, #28]
	movw	r8, #:lower16:.LC0
	mov	r5, #0
	movt	r8, #:upper16:.LC0
	ldrd	r6, [r3, #4]
	ldr	r9, [r3, #32]
	add	r4, r6, #12
	add	r7, r7, #36
.L1273:
	mov	r0, r4
	bl	_raw_spin_lock
	mov	r1, r9
	mov	r2, r5
	ldr	r0, [r6, #16]
	bl	_find_next_bit_le
	mov	fp, r0
	mov	r0, r4
	bl	_raw_spin_unlock
	ldr	r3, [r10, #28]
	ldr	r9, [r3, #32]
	cmp	fp, r9
	bcs	.L1274
	ldr	r1, [r3]
	add	r3, fp, fp, lsl #1
	add	r5, fp, #1
	ldr	r2, [r10, #636]
	lsl	r3, r3, #3
	ldr	r1, [r1, #60]
	ldrh	r3, [r1, r3]
	lsrs	r3, r3, #6
	moveq	r1, #1
	movne	r1, #0
	cmp	r3, r2
	orreq	r1, r1, #1
	cmp	r1, #0
	bne	.L1273
	cmp	r3, r2
	bhi	.L1477
	mov	r0, r7
	bl	mutex_lock
	mov	r1, fp
	mov	r2, #6
	mov	r0, r10
	bl	__locate_dirty_segment
	mov	r0, r7
	bl	mutex_unlock
	ldr	r3, [r10, #28]
	ldr	r9, [r3, #32]
	b	.L1273
.L1477:
	movw	r1, #2483
	mov	r0, r8
	bl	warn_slowpath_null
	add	r1, r10, #16
	mov	r0, #2
	bl	_set_bit
	ldr	r3, [r10, #28]
	ldr	r9, [r3, #32]
	b	.L1273
.L1274:
	ldr	r4, [r10, #648]
	movw	r1, #33488
	ldr	r5, [r3, #8]
	add	r4, r4, #31
	lsr	r4, r4, #5
	lsl	r4, r4, #2
	mov	r0, r4
	bl	__kmalloc
	cmp	r0, #0
	strne	r0, [r5, #88]
	beq	.L1478
.L1291:
	ldr	r3, [r10, #28]
	ldr	r9, [r3]
	add	fp, r9, #40
	mov	r0, fp
	bl	mutex_lock
	mvn	r2, #0
	mvn	r3, #-2147483648
	strd	r2, [r9, #88]
	ldr	r8, [r10, #28]
	ldr	r1, [r8, #32]
	cmp	r1, #0
	beq	.L1278
	ldr	r4, [r10, #640]
	mov	r6, r2
	mov	r5, #0
	mov	r7, r3
.L1279:
	cmp	r4, #0
	moveq	r0, #0
	moveq	r1, r0
	beq	.L1285
	ldr	lr, [r8]
	add	ip, r4, r5
	add	r3, r5, r5, lsl #1
	add	r2, ip, ip, lsl #1
	mov	r0, #0
	mov	r1, r0
	ldr	ip, [lr, #60]
	add	r3, ip, r3, lsl #3
	add	ip, ip, r2, lsl #3
.L1280:
	ldr	r2, [r3, #16]
	ldr	lr, [r3, #20]
	add	r3, r3, #24
	adds	r0, r0, r2
	adc	r1, r1, lr
	cmp	ip, r3
	bne	.L1280
.L1285:
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
	bcs	.L1281
	strd	r0, [r9, #88]
	ldr	r8, [r10, #28]
	ldr	r4, [r10, #640]
	ldr	r3, [r8, #32]
	add	r5, r5, r4
	cmp	r5, r3
	bcs	.L1278
	mov	r6, r0
	mov	r7, r1
	b	.L1279
.L1281:
	ldr	r3, [r8, #32]
	add	r5, r5, r4
	cmp	r5, r3
	bcc	.L1279
.L1278:
	ldr	r5, [r8]
	mov	r4, #0
	ldrd	r6, [r5, #72]
	bl	get_seconds
	ldr	r3, [r5, #80]
	mov	r1, r0
	mov	r0, fp
	ldr	r2, [r5, #84]
	adds	r6, r6, r1
	adc	r7, r7, r1, asr #31
	subs	r3, r6, r3
	sbc	r2, r7, r2
	str	r3, [r9, #96]
	str	r2, [r9, #100]
	bl	mutex_unlock
	b	.L1156
.L1457:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r6
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #16]
	bne	.L1302
	b	.L1166
.L1458:
	movw	r3, #:lower16:pgprot_kernel
	mov	r1, #208
	movt	r3, #:upper16:pgprot_kernel
	mov	r0, r4
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #20]
	bne	.L1301
	b	.L1166
.L1464:
	ldr	r3, [r10, #636]
	add	r1, r1, r3
	b	.L1300
.L1320:
	mov	r4, #16
	b	.L1270
.L1456:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r5
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r4, #64]
	bne	.L1182
	b	.L1166
.L1462:
	ldr	r3, [r10, #328]
	mov	r2, fp
	mov	r0, fp
	str	r3, [sp, #12]
	ldr	r3, [r3, #132]	@ unaligned
	b	.L1197
.L1478:
	movw	r3, #:lower16:pgprot_kernel
	mov	r0, r4
	movt	r3, #:upper16:pgprot_kernel
	movw	r1, #32976
	ldr	r2, [r3]
	orr	r2, r2, #512
	bl	__vmalloc
	cmp	r0, #0
	str	r0, [r5, #88]
	bne	.L1291
	b	.L1166
.L1470:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r6, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1229
.L1463:
	movw	r0, #:lower16:.LC1
	movw	r1, #1522
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	ldr	r3, [r4, #4]
	mov	r0, #2
	ldr	r3, [r3]
	ldr	r3, [r3, #28]
	ldr	r1, [r3, #488]
	add	r1, r1, #16
	bl	_set_bit
	b	.L1217
.L1454:
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
	beq	.L1481
	ldr	r5, [r7, #88]
	mov	r4, r0
	cmp	r5, #0
	beq	.L1483
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1483
	mov	r3, #0
	str	r3, [r5]
	bl	kthread_stop
.L1483:
	mov	r0, r5
	mov	r5, #0
	bl	kfree
	ldr	r3, [r4, #28]
	str	r5, [r3, #88]
	ldr	r3, [r4, #28]
	ldr	r8, [r3, #8]
	cmp	r8, r5
	beq	.L1484
	mov	r6, r8
	b	.L1488
.L1536:
	bl	vfree
	mov	r3, #0
	add	r5, r5, #1
	mov	r0, fp
	str	r3, [r6, #56]
	bl	mutex_unlock
	cmp	r5, #8
	beq	.L1487
.L1486:
	ldr	r3, [r4, #28]
	ldr	r6, [r3, #8]
.L1488:
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
	bne	.L1536
	bl	kfree
	add	r5, r5, #1
	mov	r0, fp
	str	r10, [r6, #56]
	bl	mutex_unlock
	cmp	r5, #8
	bne	.L1486
.L1487:
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #8]
	ldr	r5, [r3, #88]
	mov	r0, r5
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r5
	bne	.L1537
	bl	kfree
.L1490:
	ldr	r3, [r4, #28]
	mov	r2, #0
	mov	r0, r8
	str	r2, [r3, #8]
	bl	kfree
	ldr	r3, [r4, #28]
.L1484:
	ldr	r6, [r3, #12]
	cmp	r6, #0
	beq	.L1491
	mov	r2, #0
	mov	r5, r6
	add	r8, r6, #384
	str	r2, [r3, #12]
.L1492:
	ldr	r0, [r5, #20]
	add	r5, r5, #64
	bl	kfree
	ldr	r0, [r5, #-24]
	bl	kfree
	cmp	r8, r5
	bne	.L1492
	mov	r0, r6
	bl	kfree
	ldr	r3, [r4, #28]
.L1491:
	ldr	r5, [r3, #4]
	cmp	r5, #0
	beq	.L1493
	mov	r2, #0
	str	r2, [r3, #4]
	ldr	r6, [r5, #16]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1494
	bl	vfree
.L1495:
	ldr	r6, [r5, #20]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1496
	bl	vfree
.L1497:
	mov	r0, r5
	bl	kfree
	ldr	r3, [r4, #28]
.L1493:
	ldr	r5, [r3]
	cmp	r5, #0
	beq	.L1498
	ldr	r2, [r5, #60]
	cmp	r2, #0
	beq	.L1499
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1499
	mov	r6, #0
	mov	r8, r6
	b	.L1500
.L1538:
	ldr	r2, [r5, #60]
.L1500:
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
	bcc	.L1538
.L1499:
	ldr	r0, [r5, #24]
	bl	kfree
	ldr	r6, [r5, #60]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	bne	.L1539
	bl	kfree
.L1502:
	ldr	r6, [r5, #64]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1503
	bl	vfree
.L1504:
	ldr	r6, [r5, #28]
	mov	r0, r6
	bl	is_vmalloc_addr
	cmp	r0, #0
	mov	r0, r6
	beq	.L1505
	bl	vfree
.L1506:
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r3]
	ldr	r0, [r5, #16]
	bl	kfree
	mov	r0, r5
	bl	kfree
.L1498:
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
.L1539:
	bl	vfree
	b	.L1502
.L1537:
	bl	vfree
	b	.L1490
.L1481:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1505:
	bl	kfree
	b	.L1506
.L1503:
	bl	kfree
	b	.L1504
.L1496:
	bl	kfree
	b	.L1497
.L1494:
	bl	kfree
	b	.L1495
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
	ldr	r0, [r4]
	bl	kmem_cache_destroy
	ldr	r0, [r4, #4]
	bl	kmem_cache_destroy
	ldr	lr, [sp, #4]
	ldr	r0, [r4, #8]
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
	.type	sit_entry_set_slab, %object
	.size	sit_entry_set_slab, 4
sit_entry_set_slab:
	.space	4
	.type	discard_entry_slab, %object
	.size	discard_entry_slab, 4
discard_entry_slab:
	.space	4
	.type	__key.7568, %object
	.size	__key.7568, 0
__key.7568:
	.type	inmem_entry_slab, %object
	.size	inmem_entry_slab, 4
inmem_entry_slab:
	.space	4
	.type	__key.31851, %object
	.size	__key.31851, 0
__key.31851:
	.type	__key.32541, %object
	.size	__key.32541, 0
__key.32541:
	.type	__key.32560, %object
	.size	__key.32560, 0
__key.32560:
	.type	__key.32561, %object
	.size	__key.32561, 0
__key.32561:
	.type	__key.32627, %object
	.size	__key.32627, 0
__key.32627:
	.ident	"GCC: (GNU) 9.2.1 20190829"
	.section	.note.GNU-stack,"",%progbits
// Generated by Lolz Kernel

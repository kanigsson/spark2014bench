(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-fun nth1 ((_ BitVec 16) Int) Bool)

(declare-fun lsr1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_right2 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left2 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun to_int2 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2int x)
                                            (- (- 65536 (bv2int x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

(declare-fun nth_bv1 ((_ BitVec 16) (_ BitVec 16)) Bool)

(declare-fun eq_sub_bv1 ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

(define-fun eq_sub1 ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 (_ BitVec 16))))))
(declare-fun power1 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min1 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

(declare-fun nth2 ((_ BitVec 32) Int) Bool)

(declare-fun lsr2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_right3 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left3 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun to_int3 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range2 ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv2 ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv2 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub2 ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth2 a j) (nth2 b j)))))

(declare-datatypes () ((t__ref2 (t__refqtmk2 (t__content2 (_ BitVec 32))))))
(declare-fun power2 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min2 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max2 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(declare-fun nth3 ((_ BitVec 64) Int) Bool)

(declare-fun lsr3 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr3 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl3 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_right4 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left4 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun to_int4 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2int x)
                                            (- (- 18446744073709551616 (bv2int x)))))

(define-fun uint_in_range3 ((i Int)) Bool (and (<= 0 i)
                                          (<= i 18446744073709551615)))

(declare-fun nth_bv3 ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun eq_sub_bv3 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(define-fun eq_sub3 ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth3 a j) (nth3 b j)))))

(declare-datatypes () ((t__ref3 (t__refqtmk3 (t__content3 (_ BitVec 64))))))
(declare-fun power3 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min3 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max3 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort unsigned8 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq (unsigned8 unsigned8) Bool)

(declare-const dummy unsigned8)

(declare-datatypes ()
((unsigned8__ref (unsigned8__refqtmk (unsigned8__content unsigned8)))))
(define-fun unsigned8__ref_unsigned8__content__projection ((a unsigned8__ref)) unsigned8 
  (unsigned8__content a))

(declare-fun to_rep (unsigned8) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) unsigned8)

;; inversion_axiom
  (assert
  (forall ((x unsigned8))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int5 ((x unsigned8)) Int (bv2int (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned8)) (! (uint_in_range
  (to_int5 x)) :pattern ((to_int5 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array (_ BitVec 64) unsigned8))))))
(declare-fun slide ((Array (_ BitVec 64) unsigned8) (_ BitVec 64)
  (_ BitVec 64)) (Array (_ BitVec 64) unsigned8))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 64) unsigned8)))
  (forall ((first (_ BitVec 64)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 64) unsigned8)))
  (forall ((old_first (_ BitVec 64)))
  (forall ((new_first (_ BitVec 64)))
  (forall ((i (_ BitVec 64)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 64) unsigned8))
  (a__first (_ BitVec 64)) (a__last (_ BitVec 64))
  (b (Array (_ BitVec 64) unsigned8)) (b__first (_ BitVec 64))
  (b__last (_ BitVec 64))) Bool (ite (and
                                     (ite (bvule a__first a__last)
                                     (and (bvule b__first b__last)
                                     (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                     (bvugt b__first b__last))
                                     (forall ((temp___idx_154 (_ BitVec 64)))
                                     (=>
                                     (and (bvule a__first temp___idx_154)
                                     (bvule temp___idx_154 a__last))
                                     (= (to_rep (select a temp___idx_154)) 
                                     (to_rep
                                     (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))
                                true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 64) unsigned8))
  (b (Array (_ BitVec 64) unsigned8)))
  (forall ((a__first (_ BitVec 64)) (a__last (_ BitVec 64))
  (b__first (_ BitVec 64)) (b__last (_ BitVec 64)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 64)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun readmem8 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) (_ BitVec 8))

(declare-fun readmem8__function_guard ((_ BitVec 8) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) Bool)

(declare-fun readmem16 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) (_ BitVec 16))

(declare-fun readmem16__function_guard ((_ BitVec 16) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) Bool)

(declare-sort unsigned64 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (unsigned64 unsigned64) Bool)

(declare-const dummy1 unsigned64)

(declare-datatypes ()
((unsigned64__ref (unsigned64__refqtmk (unsigned64__content unsigned64)))))
(define-fun unsigned64__ref_unsigned64__content__projection ((a unsigned64__ref)) unsigned64 
  (unsigned64__content a))

(define-fun dynamic_invariant ((temp___expr_206 (_ BitVec 64))
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool) (temp___do_typ_inv_205 Bool)) Bool true)

(declare-sort unsigned16 0)

(declare-const attr__ATTRIBUTE_MODULUS2 (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 16))

(declare-fun user_eq2 (unsigned16 unsigned16) Bool)

(declare-const dummy2 unsigned16)

(declare-datatypes ()
((unsigned16__ref (unsigned16__refqtmk (unsigned16__content unsigned16)))))
(define-fun unsigned16__ref_unsigned16__content__projection ((a unsigned16__ref)) unsigned16 
  (unsigned16__content a))

(define-fun dynamic_invariant1 ((temp___expr_234 (_ BitVec 16))
  (temp___is_init_230 Bool) (temp___skip_constant_231 Bool)
  (temp___do_toplevel_232 Bool) (temp___do_typ_inv_233 Bool)) Bool true)

;; readmem16__post_axiom
  (assert
  (forall ((addr (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned8)))
  (! (=> (dynamic_invariant addr true true true true)
     (let ((result (readmem16 addr x86__memory)))
     (=> (readmem16__function_guard result addr x86__memory)
     (and
     (= result (bvor ((_ zero_extend 8) (to_rep (select x86__memory addr))) 
     (ite (< 8 16)
     (bvshl ((_ zero_extend 8) (to_rep
                               (select x86__memory (bvadd addr #x0000000000000001)))) ((_ int2bv 16) 8))
     #x0000))) (dynamic_invariant1 result true false true true))))) :pattern (
  (readmem16 addr x86__memory)) ))))

(declare-fun readmem32 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) (_ BitVec 32))

(declare-fun readmem32__function_guard ((_ BitVec 32) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) Bool)

(declare-sort unsigned32 0)

(declare-const attr__ATTRIBUTE_MODULUS3 (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 32))

(declare-fun user_eq3 (unsigned32 unsigned32) Bool)

(declare-const dummy3 unsigned32)

(declare-datatypes ()
((unsigned32__ref (unsigned32__refqtmk (unsigned32__content unsigned32)))))
(define-fun unsigned32__ref_unsigned32__content__projection ((a unsigned32__ref)) unsigned32 
  (unsigned32__content a))

(define-fun dynamic_invariant2 ((temp___expr_220 (_ BitVec 32))
  (temp___is_init_216 Bool) (temp___skip_constant_217 Bool)
  (temp___do_toplevel_218 Bool) (temp___do_typ_inv_219 Bool)) Bool true)

;; readmem32__post_axiom
  (assert
  (forall ((addr (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned8)))
  (! (=> (dynamic_invariant addr true true true true)
     (let ((result (readmem32 addr x86__memory)))
     (and
     (forall ((addr1 (_ BitVec 64))
     (x86__memory1 (Array (_ BitVec 64) unsigned8)))
     (readmem16__function_guard (readmem16 addr1 x86__memory1) addr1
     x86__memory1))
     (and
     (forall ((addr1 (_ BitVec 64))
     (x86__memory1 (Array (_ BitVec 64) unsigned8)))
     (readmem16__function_guard
     (readmem16 (bvadd addr1 #x0000000000000002) x86__memory1)
     (bvadd addr1 #x0000000000000002) x86__memory1))
     (=> (readmem32__function_guard result addr x86__memory)
     (and
     (= result (bvor ((_ zero_extend 16) (readmem16 addr x86__memory)) (bvshl ((_ zero_extend 16) 
     (readmem16 (bvadd addr #x0000000000000002) x86__memory)) ((_ int2bv 32) 16))))
     (dynamic_invariant2 result true false true true))))))) :pattern (
  (readmem32 addr x86__memory)) ))))

(declare-const addr (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const val__ (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant3 ((temp___expr_248 (_ BitVec 8))
  (temp___is_init_244 Bool) (temp___skip_constant_245 Bool)
  (temp___do_toplevel_246 Bool) (temp___do_typ_inv_247 Bool)) Bool true)

;; readmem8__post_axiom
  (assert
  (forall ((addr1 (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned8)))
  (! (=> (dynamic_invariant addr1 true true true true)
     (let ((result (readmem8 addr1 x86__memory)))
     (=> (readmem8__function_guard result addr1 x86__memory)
     (and (= result (to_rep (select x86__memory addr1))) (dynamic_invariant3
     result true false true true))))) :pattern ((readmem8 addr1 x86__memory)) ))))

(declare-const memory (Array (_ BitVec 64) unsigned8))

(declare-const memory1 (Array (_ BitVec 64) unsigned8))

;; H
  (assert (= memory1 memory))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant addr true false true true))

;; Assume
  (assert (dynamic_invariant2 val__ true false true true))

(define-fun o () (_ BitVec 32) (bvand val__ #x000000FF))

(define-fun o1 () (_ BitVec 64) addr)

(declare-const memory2 (Array (_ BitVec 64) unsigned8))

;; H
  (assert (= memory2 memory))

(declare-const memory3 (Array (_ BitVec 64) unsigned8))

;; H
  (assert
  (forall ((o2 (_ BitVec 64)) (memory4 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o2 memory4) o2 memory4)))

;; H
  (assert (= (readmem8 o1 memory3) ((_ extract 7 0) o)))

;; H
  (assert
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o1))
  (= (to_rep (select memory3 i)) (to_rep (select memory2 i)))))))

;; H
  (assert true)

(define-fun o2 () (_ BitVec 32) (bvand (bvlshr val__ ((_ int2bv 32) 8)) #x000000FF))

(define-fun o3 () (_ BitVec 64) (bvadd addr #x0000000000000001))

(declare-const memory4 (Array (_ BitVec 64) unsigned8))

;; H
  (assert (= memory4 memory3))

(declare-const memory5 (Array (_ BitVec 64) unsigned8))

;; H
  (assert
  (forall ((o4 (_ BitVec 64)) (memory6 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o4 memory6) o4 memory6)))

;; H
  (assert (= (readmem8 o3 memory5) ((_ extract 7 0) o2)))

;; H
  (assert
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o3))
  (= (to_rep (select memory5 i)) (to_rep (select memory4 i)))))))

;; H
  (assert true)

(define-fun o4 () (_ BitVec 32) (bvand (bvlshr val__ ((_ int2bv 32) 16)) #x000000FF))

(define-fun o5 () (_ BitVec 64) (bvadd addr #x0000000000000002))

(declare-const memory6 (Array (_ BitVec 64) unsigned8))

;; H
  (assert (= memory6 memory5))

(declare-const memory7 (Array (_ BitVec 64) unsigned8))

;; H
  (assert
  (forall ((o6 (_ BitVec 64)) (memory8 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o6 memory8) o6 memory8)))

;; H
  (assert (= (readmem8 o5 memory7) ((_ extract 7 0) o4)))

;; H
  (assert
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o5))
  (= (to_rep (select memory7 i)) (to_rep (select memory6 i)))))))

;; H
  (assert true)

(define-fun o6 () (_ BitVec 32) (bvand (bvlshr val__ ((_ int2bv 32) 24)) #x000000FF))

(define-fun o7 () (_ BitVec 64) (bvadd addr #x0000000000000003))

(declare-const memory8 (Array (_ BitVec 64) unsigned8))

;; H
  (assert (= memory8 memory7))

(declare-const memory9 (Array (_ BitVec 64) unsigned8))

;; H
  (assert
  (forall ((o8 (_ BitVec 64)) (memory10 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o8 memory10) o8 memory10)))

;; H
  (assert (= (readmem8 o7 memory9) ((_ extract 7 0) o6)))

;; H
  (assert
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o7))
  (= (to_rep (select memory9 i)) (to_rep (select memory8 i)))))))

;; H
  (assert true)

;; Assume
  (assert
  (= ((_ zero_extend 8) (to_rep
                        (select memory9 (bvadd addr #x0000000000000002)))) ((_ extract 15 0) (bvlshr (bvand 
  val__ #x00FF0000) ((_ int2bv 32) 16)))))

(define-fun o8 () (_ BitVec 32) (bvand val__ #x0000FFFF))

(assert
;; defqtvc
 ;; File "x86.ads", line 445, characters 0-0
  (not (bvule ((_ zero_extend 16) #x0000) o8)))
(check-sat)

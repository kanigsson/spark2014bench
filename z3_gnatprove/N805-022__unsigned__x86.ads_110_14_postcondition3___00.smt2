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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort unsigned_8 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq (unsigned_8 unsigned_8) Bool)

(declare-const dummy unsigned_8)

(declare-datatypes ()
((unsigned_8__ref (unsigned_8__refqtmk (unsigned_8__content unsigned_8)))))
(define-fun unsigned_8__ref_unsigned_8__content__projection ((a unsigned_8__ref)) unsigned_8 
  (unsigned_8__content a))

(declare-fun to_rep (unsigned_8) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) unsigned_8)

;; inversion_axiom
  (assert
  (forall ((x unsigned_8))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int5 ((x unsigned_8)) Int (bv2int (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned_8)) (! (uint_in_range
  (to_int5 x)) :pattern ((to_int5 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array (_ BitVec 64) unsigned_8))))))
(declare-fun slide ((Array (_ BitVec 64) unsigned_8) (_ BitVec 64)
  (_ BitVec 64)) (Array (_ BitVec 64) unsigned_8))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 64) unsigned_8)))
  (forall ((first (_ BitVec 64)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 64) unsigned_8)))
  (forall ((old_first (_ BitVec 64)))
  (forall ((new_first (_ BitVec 64)))
  (forall ((i (_ BitVec 64)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 64) unsigned_8))
  (a__first (_ BitVec 64)) (a__last (_ BitVec 64))
  (b (Array (_ BitVec 64) unsigned_8)) (b__first (_ BitVec 64))
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
  (forall ((a (Array (_ BitVec 64) unsigned_8))
  (b (Array (_ BitVec 64) unsigned_8)))
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

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int unsigned_8))))))
(declare-fun slide1 ((Array Int unsigned_8) Int Int) (Array Int unsigned_8))

;; slide_eq
  (assert
  (forall ((a (Array Int unsigned_8)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int unsigned_8)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int unsigned_8)) (a__first Int) (a__last Int)
  (b (Array Int unsigned_8)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int unsigned_8)) (b (Array Int unsigned_8)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun ecx ((Array Int unsigned_8)) (_ BitVec 32))

(declare-fun ecx__function_guard ((_ BitVec 32) (Array Int unsigned_8)) Bool)

(declare-sort unsigned_32 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 32))

(declare-fun user_eq1 (unsigned_32 unsigned_32) Bool)

(declare-const dummy1 unsigned_32)

(declare-datatypes ()
((unsigned_32__ref (unsigned_32__refqtmk (unsigned_32__content unsigned_32)))))
(define-fun unsigned_32__ref_unsigned_32__content__projection ((a unsigned_32__ref)) unsigned_32 
  (unsigned_32__content a))

(define-fun dynamic_invariant ((temp___expr_173 (_ BitVec 32))
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool) (temp___do_typ_inv_172 Bool)) Bool true)

;; ecx__post_axiom
  (assert
  (forall ((x86__xcx (Array Int unsigned_8)))
  (! (let ((result (ecx x86__xcx)))
     (=> (ecx__function_guard result x86__xcx)
     (and
     (= result (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep
                                                        (select x86__xcx 0))) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xcx 1))) #x00000100)) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xcx 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xcx 3))) #x01000000))) (dynamic_invariant result
     true false true true)))) :pattern ((ecx x86__xcx)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun esi ((Array Int unsigned_8)) (_ BitVec 32))

(declare-fun esi__function_guard ((_ BitVec 32) (Array Int unsigned_8)) Bool)

;; esi__post_axiom
  (assert
  (forall ((x86__xsi (Array Int unsigned_8)))
  (! (let ((result (esi x86__xsi)))
     (=> (esi__function_guard result x86__xsi)
     (and
     (= result (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep
                                                        (select x86__xsi 0))) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xsi 1))) #x00000100)) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xsi 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xsi 3))) #x01000000))) (dynamic_invariant result
     true false true true)))) :pattern ((esi x86__xsi)) )))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun edi ((Array Int unsigned_8)) (_ BitVec 32))

(declare-fun edi__function_guard ((_ BitVec 32) (Array Int unsigned_8)) Bool)

;; edi__post_axiom
  (assert
  (forall ((x86__xdi (Array Int unsigned_8)))
  (! (let ((result (edi x86__xdi)))
     (=> (edi__function_guard result x86__xdi)
     (and
     (= result (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep
                                                        (select x86__xdi 0))) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xdi 1))) #x00000100)) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xdi 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
     (to_rep (select x86__xdi 3))) #x01000000))) (dynamic_invariant result
     true false true true)))) :pattern ((edi x86__xdi)) )))

(declare-fun readmem8 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned_8)) (_ BitVec 8))

(declare-fun readmem8__function_guard ((_ BitVec 8) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned_8)) Bool)

(declare-sort unsigned_64 0)

(declare-const attr__ATTRIBUTE_MODULUS2 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 64))

(declare-fun user_eq2 (unsigned_64 unsigned_64) Bool)

(declare-const dummy2 unsigned_64)

(declare-datatypes ()
((unsigned_64__ref (unsigned_64__refqtmk (unsigned_64__content unsigned_64)))))
(define-fun unsigned_64__ref_unsigned_64__content__projection ((a unsigned_64__ref)) unsigned_64 
  (unsigned_64__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 (_ BitVec 64))
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool) (temp___do_typ_inv_165 Bool)) Bool true)

(define-fun dynamic_invariant2 ((temp___expr_187 (_ BitVec 8))
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool) (temp___do_typ_inv_186 Bool)) Bool true)

;; readmem8__post_axiom
  (assert
  (forall ((addr (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned_8)))
  (! (=> (dynamic_invariant1 addr true true true true)
     (let ((result (readmem8 addr x86__memory)))
     (=> (readmem8__function_guard result addr x86__memory)
     (and
     (and (= result (to_rep (select x86__memory addr))) (bvuge result #x00))
     (dynamic_invariant2 result true false true true))))) :pattern ((readmem8
                                                                    addr
                                                                    x86__memory)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const zeroflag Bool)

(declare-const memory (Array (_ BitVec 64) unsigned_8))

(declare-const xcx (Array Int unsigned_8))

(declare-const xsi (Array Int unsigned_8))

(declare-const xdi (Array Int unsigned_8))

(declare-const val1 (_ BitVec 8))

(declare-const val2 (_ BitVec 8))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 val1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 val2 false false true true))

(declare-const zeroflag1 Bool)

(declare-const xcx1 (Array Int unsigned_8))

;; H
  (assert
  (forall ((xcx2 (Array Int unsigned_8))) (ecx__function_guard (ecx xcx2)
  xcx2)))

;; H
  (assert
  (forall ((xcx2 (Array Int unsigned_8))) (ecx__function_guard (ecx xcx2)
  xcx2)))

;; H
  (assert (ecx__function_guard (ecx xcx) xcx))

;; H
  (assert (dynamic_invariant (ecx xcx) true false true true))

;; H
  (assert
  (= (ecx xcx) (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep
                                                        (select xcx 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                   (select 
                                                                   xcx 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx 3))) #x01000000))))

;; H
  (assert
  (ite (not (= (ecx xcx) #x00000000))
  (exists ((xcx2 (Array Int unsigned_8)) (xsi1 (Array Int unsigned_8))
  (xdi1 (Array Int unsigned_8)) (val11 (_ BitVec 8)) (val21 (_ BitVec 8)))
  (and
  (= (and (ite (and (dynamic_invariant2 val21 false true true true)
               (dynamic_invariant2 val11 false true true true))
          true false) (ite (not (= (ecx xcx2) #x00000000)) true false)) true)
  (and (not (= (ecx xcx2) #x00000000))
  (let ((o (esi xsi1)))
  (and
  (and (esi__function_guard o xsi1)
  (and (dynamic_invariant o true false true true)
  (= o (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xsi1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xsi1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xsi1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xsi1 3))) #x01000000)))))
  (let ((o1 ((_ zero_extend 32) o)))
  (let ((o2 (readmem8 o1 memory)))
  (and
  (and (readmem8__function_guard o2 o1 memory)
  (and (dynamic_invariant2 o2 true false true true)
  (and (= o2 (to_rep (select memory o1))) (bvuge o2 #x00))))
  (exists ((val12 (_ BitVec 8)))
  (and (= val12 o2)
  (let ((o3 (edi xdi1)))
  (and
  (and (edi__function_guard o3 xdi1)
  (and (dynamic_invariant o3 true false true true)
  (= o3 (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xdi1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xdi1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xdi1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xdi1 3))) #x01000000)))))
  (let ((o4 ((_ zero_extend 32) o3)))
  (let ((o5 (readmem8 o4 memory)))
  (and
  (and (readmem8__function_guard o5 o4 memory)
  (and (dynamic_invariant2 o5 true false true true)
  (and (= o5 (to_rep (select memory o4))) (bvuge o5 #x00))))
  (exists ((val22 (_ BitVec 8)))
  (and (= val22 o5)
  (and (= zeroflag1 (ite (= (bvsub val12 val22) #x00) true false))
  (let ((o6 (ecx xcx2)))
  (and
  (and (ecx__function_guard o6 xcx2)
  (and (dynamic_invariant o6 true false true true)
  (= o6 (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xcx2 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx2 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xcx2 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx2 3))) #x01000000)))))
  (exists ((xcx3 (Array Int unsigned_8)))
  (and (= xcx3 xcx2)
  (and
  (and
  (= (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xcx1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select 
                                                                    xcx1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx1 3))) #x01000000)) (bvsub o6 #x00000001))
  (forall ((i Int))
  (=> (and (<= 4 i) (<= i 7))
  (= (to_rep (select xcx1 i)) (to_rep (select xcx3 i))))))
  (let ((o7 (ecx xcx1)))
  (and
  (and (ecx__function_guard o7 xcx1)
  (and (dynamic_invariant o7 true false true true)
  (= o7 (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xcx1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select 
                                                                    xcx1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx1 3))) #x01000000)))))
  (or
  (= (or (ite (= o7 #x00000000) true false) (ite (= zeroflag1 true) false
                                            true)) true)
  (let ((o8 (esi xsi1)))
  (and
  (and (esi__function_guard o8 xsi1)
  (and (dynamic_invariant o8 true false true true)
  (= o8 (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xsi1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xsi1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xsi1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xsi1 3))) #x01000000)))))
  (exists ((xsi2 (Array Int unsigned_8)))
  (and (= xsi2 xsi1)
  (exists ((xsi3 (Array Int unsigned_8)))
  (and
  (and
  (= (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xsi3 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xsi3 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xsi3 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xsi3 3))) #x01000000)) (bvadd o8 #x00000001))
  (forall ((i Int))
  (=> (and (<= 4 i) (<= i 7))
  (= (to_rep (select xsi3 i)) (to_rep (select xsi2 i))))))
  (let ((o9 (edi xdi1)))
  (and
  (and (edi__function_guard o9 xdi1)
  (and (dynamic_invariant o9 true false true true)
  (= o9 (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xdi1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xdi1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xdi1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xdi1 3))) #x01000000)))))
  (exists ((xdi2 (Array Int unsigned_8)))
  (and (= xdi2 xdi1)
  (exists ((xdi3 (Array Int unsigned_8)))
  (and
  (and
  (= (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xdi3 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xdi3 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select xdi3 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xdi3 3))) #x01000000)) (bvadd o9 #x00000001))
  (forall ((i Int))
  (=> (and (<= 4 i) (<= i 7))
  (= (to_rep (select xdi3 i)) (to_rep (select xdi2 i))))))
  (let ((o10 (ecx xcx1)))
  (and
  (and (ecx__function_guard o10 xcx1)
  (and (dynamic_invariant o10 true false true true)
  (= o10 (bvadd (bvadd (bvadd ((_ zero_extend 24) (to_rep (select xcx1 0))) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx1 1))) #x00000100)) (bvmul ((_ zero_extend 24) (to_rep
                                                                    (select 
                                                                    xcx1 2))) #x00010000)) (bvmul ((_ zero_extend 24) 
  (to_rep (select xcx1 3))) #x01000000))))) (= o10 #x00000000)))))))))))))))))))))))))))))))))))))))))
  (and (= zeroflag1 zeroflag) (= xcx1 xcx))))

;; H
  (assert
  (forall ((xcx2 (Array Int unsigned_8))) (ecx__function_guard (ecx xcx2)
  xcx2)))

;; Assume
  (assert (or (= (ecx xcx1) #x00000000) (not (= zeroflag1 true))))

(assert
;; defqtvc
 ;; File "x86.ads", line 107, characters 0-0
  (not
  (or
  (=>
  (forall ((xcx2 (Array Int unsigned_8))) (ecx__function_guard (ecx xcx2)
  xcx2)) (= (ecx xcx1) #x00000000)) (not (= zeroflag1 true)))))
(check-sat)

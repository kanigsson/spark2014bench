(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
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

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
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

(declare-fun nth1 ((_ BitVec 64) Int) Bool)

(declare-fun lsr1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_right2 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left2 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun to_int2 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i)
                                          (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left2 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right2 v (bv2nat n)))))

(declare-fun nth_bv1 ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv1 x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv1 x ((_ int2bv 64) i)) (nth1 x i)))))

(declare-fun eq_sub_bv1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv1 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub1 ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub1 a b (bv2nat i) (bv2nat n)) (eq_sub_bv1 a b i n))))

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 (_ BitVec 64))))))
(declare-fun power1 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min1 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 64))
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

(declare-datatypes ((unsigned8__ref 0))
(((unsigned8__refqtmk (unsigned8__content unsigned8)))))
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

(define-fun to_int3 ((x unsigned8)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x unsigned8)) (! (uint_in_range
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array (_ BitVec 64) unsigned8))))))
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

(declare-fun readmem64 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) (_ BitVec 64))

(declare-fun readmem64__function_guard ((_ BitVec 64) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) Bool)

(declare-fun nth2 ((_ BitVec 32) Int) Bool)

(declare-fun lsr2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_right3 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left3 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun to_int4 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2nat x)
                                            (- (- 4294967296 (bv2nat x)))))

(define-fun uint_in_range2 ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvlshr x n) (lsr2 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvashr x n) (asr2 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvshl x n) (lsl2 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_left3 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_right3 v (bv2nat n)))))

(declare-fun nth_bv2 ((_ BitVec 32) (_ BitVec 32)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (= (nth_bv2 x i) true)
  (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (nth2 x (bv2nat i)) (nth_bv2 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 32)) (i Int))
  (=> (and (<= 0 i) (< i 4294967296))
  (= (nth_bv2 x ((_ int2bv 32) i)) (nth2 x i)))))

(declare-fun eq_sub_bv2 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
  (= (eq_sub_bv2 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub2 ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth2 a j) (nth2 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (= (eq_sub2 a b (bv2nat i) (bv2nat n)) (eq_sub_bv2 a b i n))))

(declare-datatypes ((t__ref2 0))
(((t__refqtmk2 (t__content2 (_ BitVec 32))))))
(declare-fun power2 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min2 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max2 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(declare-fun readmem32 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) (_ BitVec 32))

(declare-fun readmem32__function_guard ((_ BitVec 32) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) Bool)

(declare-sort unsigned64 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (unsigned64 unsigned64) Bool)

(declare-const dummy1 unsigned64)

(declare-datatypes ((unsigned64__ref 0))
(((unsigned64__refqtmk (unsigned64__content unsigned64)))))
(define-fun unsigned64__ref_unsigned64__content__projection ((a unsigned64__ref)) unsigned64 
  (unsigned64__content a))

(define-fun dynamic_invariant ((temp___expr_206 (_ BitVec 64))
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool) (temp___do_typ_inv_205 Bool)) Bool true)

;; readmem64__post_axiom
  (assert
  (forall ((addr (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned8)))
  (! (=> (dynamic_invariant addr true true true true)
     (let ((result (readmem64 addr x86__memory)))
     (and
     (forall ((addr1 (_ BitVec 64))
     (x86__memory1 (Array (_ BitVec 64) unsigned8)))
     (readmem32__function_guard (readmem32 addr1 x86__memory1) addr1
     x86__memory1))
     (and
     (forall ((addr1 (_ BitVec 64))
     (x86__memory1 (Array (_ BitVec 64) unsigned8)))
     (readmem32__function_guard
     (readmem32 (bvadd addr1 #x0000000000000004) x86__memory1)
     (bvadd addr1 #x0000000000000004) x86__memory1))
     (=> (readmem64__function_guard result addr x86__memory)
     (and
     (= result (bvor ((_ zero_extend 32) (readmem32 addr x86__memory)) (bvshl ((_ zero_extend 32) 
     (readmem32 (bvadd addr #x0000000000000004) x86__memory)) ((_ int2bv 64) 32))))
     (dynamic_invariant result true false true true))))))) :pattern (
  (readmem64 addr x86__memory)) ))))

(declare-const addr (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const val__ (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort unsigned32 0)

(declare-const attr__ATTRIBUTE_MODULUS2 (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 32))

(declare-fun user_eq2 (unsigned32 unsigned32) Bool)

(declare-const dummy2 unsigned32)

(declare-datatypes ((unsigned32__ref 0))
(((unsigned32__refqtmk (unsigned32__content unsigned32)))))
(define-fun unsigned32__ref_unsigned32__content__projection ((a unsigned32__ref)) unsigned32 
  (unsigned32__content a))

(define-fun dynamic_invariant1 ((temp___expr_220 (_ BitVec 32))
  (temp___is_init_216 Bool) (temp___skip_constant_217 Bool)
  (temp___do_toplevel_218 Bool) (temp___do_typ_inv_219 Bool)) Bool true)

(declare-fun nth3 ((_ BitVec 16) Int) Bool)

(declare-fun lsr3 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr3 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl3 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_right4 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left4 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun to_int5 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2nat x)
                                            (- (- 65536 (bv2nat x)))))

(define-fun uint_in_range3 ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvlshr x n) (lsr3 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvashr x n) (asr3 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvshl x n) (lsl3 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvshl v (bvurem n (_ bv16 16))) (bvlshr v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_left4 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvlshr v (bvurem n (_ bv16 16))) (bvshl v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_right4 v (bv2nat n)))))

(declare-fun nth_bv3 ((_ BitVec 16) (_ BitVec 16)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (= (nth_bv3 x i) true) (not (= (bvand (bvlshr x i) #x0001) #x0000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (nth3 x (bv2nat i)) (nth_bv3 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 16)) (i Int))
  (=> (and (<= 0 i) (< i 65536))
  (= (nth_bv3 x ((_ int2bv 16) i)) (nth3 x i)))))

(declare-fun eq_sub_bv3 ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (let ((mask (bvshl (bvsub (bvshl #x0001 n) #x0001) i)))
  (= (eq_sub_bv3 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub3 ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth3 a j) (nth3 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (= (eq_sub3 a b (bv2nat i) (bv2nat n)) (eq_sub_bv3 a b i n))))

(declare-datatypes ((t__ref3 0))
(((t__refqtmk3 (t__content3 (_ BitVec 16))))))
(declare-fun power3 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min3 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max3 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

(declare-sort unsigned16 0)

(declare-const attr__ATTRIBUTE_MODULUS3 (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 16))

(declare-fun user_eq3 (unsigned16 unsigned16) Bool)

(declare-const dummy3 unsigned16)

(declare-datatypes ((unsigned16__ref 0))
(((unsigned16__refqtmk (unsigned16__content unsigned16)))))
(define-fun unsigned16__ref_unsigned16__content__projection ((a unsigned16__ref)) unsigned16 
  (unsigned16__content a))

(define-fun dynamic_invariant2 ((temp___expr_234 (_ BitVec 16))
  (temp___is_init_230 Bool) (temp___skip_constant_231 Bool)
  (temp___do_toplevel_232 Bool) (temp___do_typ_inv_233 Bool)) Bool true)

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

(declare-fun readmem16 ((_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) (_ BitVec 16))

(declare-fun readmem16__function_guard ((_ BitVec 16) (_ BitVec 64)
  (Array (_ BitVec 64) unsigned8)) Bool)

;; readmem16__post_axiom
  (assert
  (forall ((addr1 (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned8)))
  (! (=> (dynamic_invariant addr1 true true true true)
     (let ((result (readmem16 addr1 x86__memory)))
     (=> (readmem16__function_guard result addr1 x86__memory)
     (and
     (= result (bvor ((_ zero_extend 8) (to_rep (select x86__memory addr1))) 
     (ite (< 8 16)
     (bvshl ((_ zero_extend 8) (to_rep
                               (select x86__memory (bvadd addr1 #x0000000000000001)))) ((_ int2bv 16) 8))
     #x0000))) (dynamic_invariant2 result true false true true))))) :pattern (
  (readmem16 addr1 x86__memory)) ))))

;; readmem32__post_axiom
  (assert
  (forall ((addr1 (_ BitVec 64)))
  (forall ((x86__memory (Array (_ BitVec 64) unsigned8)))
  (! (=> (dynamic_invariant addr1 true true true true)
     (let ((result (readmem32 addr1 x86__memory)))
     (and
     (forall ((addr2 (_ BitVec 64))
     (x86__memory1 (Array (_ BitVec 64) unsigned8)))
     (readmem16__function_guard (readmem16 addr2 x86__memory1) addr2
     x86__memory1))
     (and
     (forall ((addr2 (_ BitVec 64))
     (x86__memory1 (Array (_ BitVec 64) unsigned8)))
     (readmem16__function_guard
     (readmem16 (bvadd addr2 #x0000000000000002) x86__memory1)
     (bvadd addr2 #x0000000000000002) x86__memory1))
     (=> (readmem32__function_guard result addr1 x86__memory)
     (and
     (= result (bvor ((_ zero_extend 16) (readmem16 addr1 x86__memory)) (bvshl ((_ zero_extend 16) 
     (readmem16 (bvadd addr1 #x0000000000000002) x86__memory)) ((_ int2bv 32) 16))))
     (dynamic_invariant1 result true false true true))))))) :pattern (
  (readmem32 addr1 x86__memory)) ))))

(assert
;; defqtvc
 ;; File "x86.ads", line 461, characters 0-0
  (not
  (forall ((memory (Array (_ BitVec 64) unsigned8)))
  (=> (dynamic_invariant addr true false true true)
  (=> (dynamic_invariant val__ true false true true)
  (let ((o addr))
  (forall ((memory1 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory1 memory)
  (forall ((memory2 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o1 (_ BitVec 64)) (memory3 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o1 memory3) o1 memory3))
  (=>
  (and
  (= (readmem8 o memory2) ((_ extract 7 0) (bvand val__ #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o))
  (= (to_rep (select memory2 i)) (to_rep (select memory1 i)))))))
  (let ((o1 (bvadd addr #x0000000000000001)))
  (forall ((memory3 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory3 memory2)
  (forall ((memory4 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o2 (_ BitVec 64)) (memory5 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o2 memory5) o2 memory5))
  (=>
  (and
  (= (readmem8 o1 memory4) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 8)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o1))
  (= (to_rep (select memory4 i)) (to_rep (select memory3 i)))))))
  (let ((o2 (bvadd addr #x0000000000000002)))
  (forall ((memory5 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory5 memory4)
  (forall ((memory6 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o3 (_ BitVec 64)) (memory7 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o3 memory7) o3 memory7))
  (=>
  (and
  (= (readmem8 o2 memory6) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 16)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o2))
  (= (to_rep (select memory6 i)) (to_rep (select memory5 i)))))))
  (let ((o3 (bvadd addr #x0000000000000003)))
  (forall ((memory7 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory7 memory6)
  (forall ((memory8 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o4 (_ BitVec 64)) (memory9 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o4 memory9) o4 memory9))
  (=>
  (and
  (= (readmem8 o3 memory8) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 24)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o3))
  (= (to_rep (select memory8 i)) (to_rep (select memory7 i)))))))
  (let ((o4 (bvadd addr #x0000000000000004)))
  (forall ((memory9 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory9 memory8)
  (forall ((memory10 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o5 (_ BitVec 64)) (memory11 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o5 memory11) o5 memory11))
  (=>
  (and
  (= (readmem8 o4 memory10) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 32)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o4))
  (= (to_rep (select memory10 i)) (to_rep (select memory9 i)))))))
  (let ((o5 (bvadd addr #x0000000000000005)))
  (forall ((memory11 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory11 memory10)
  (forall ((memory12 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o6 (_ BitVec 64)) (memory13 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o6 memory13) o6 memory13))
  (=>
  (and
  (= (readmem8 o5 memory12) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 40)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o5))
  (= (to_rep (select memory12 i)) (to_rep (select memory11 i)))))))
  (let ((o6 (bvadd addr #x0000000000000006)))
  (forall ((memory13 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory13 memory12)
  (forall ((memory14 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o7 (_ BitVec 64)) (memory15 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o7 memory15) o7 memory15))
  (=>
  (and
  (= (readmem8 o6 memory14) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 48)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o6))
  (= (to_rep (select memory14 i)) (to_rep (select memory13 i)))))))
  (let ((o7 (bvadd addr #x0000000000000007)))
  (forall ((memory15 (Array (_ BitVec 64) unsigned8)))
  (=> (= memory15 memory14)
  (forall ((memory16 (Array (_ BitVec 64) unsigned8)))
  (=>
  (forall ((o8 (_ BitVec 64)) (memory17 (Array (_ BitVec 64) unsigned8)))
  (readmem8__function_guard (readmem8 o8 memory17) o8 memory17))
  (=>
  (and
  (= (readmem8 o7 memory16) ((_ extract 7 0) (bvand (bvlshr val__ ((_ int2bv 64) 56)) #x00000000000000FF)))
  (forall ((i (_ BitVec 64)))
  (=> (and (bvule #x0000000000000000 i) (bvule i #xFFFFFFFFFFFFFFFF))
  (=> (not (= i o7))
  (= (to_rep (select memory16 i)) (to_rep (select memory15 i)))))))
  (=>
  (forall ((memory17 (Array (_ BitVec 64) unsigned8)))
  (readmem64__function_guard (readmem64 addr memory17) addr memory17))
  (=> (= (readmem64 addr memory16) val__)
  (=>
  (forall ((memory17 (Array (_ BitVec 64) unsigned8)))
  (readmem64__function_guard (readmem64 addr memory17) addr memory17))
  (= (readmem64 addr memory16) val__)))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)

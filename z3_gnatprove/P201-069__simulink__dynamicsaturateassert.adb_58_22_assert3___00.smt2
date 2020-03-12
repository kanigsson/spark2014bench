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

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

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

(declare-const value (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const max1 (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const min1 (_ BitVec 32))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort unsigned_32 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 32))

(declare-fun user_eq (unsigned_32 unsigned_32) Bool)

(declare-const dummy unsigned_32)

(declare-datatypes ()
((unsigned_32__ref (unsigned_32__refqtmk (unsigned_32__content unsigned_32)))))
(define-fun unsigned_32__ref_unsigned_32__content__projection ((a unsigned_32__ref)) unsigned_32 
  (unsigned_32__content a))

(define-fun dynamic_invariant ((temp___expr_158 (_ BitVec 32))
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool) (temp___do_typ_inv_157 Bool)) Bool true)

(declare-sort unsigned_32_m1_0_m100_0 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

(define-fun in_range ((x (_ BitVec 32))) Bool (and (bvule #x00000001 x)
                                              (bvule x #x00000064)))

(define-fun in_range_int ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 32))

(declare-fun user_eq1 (unsigned_32_m1_0_m100_0 unsigned_32_m1_0_m100_0) Bool)

(declare-const dummy1 unsigned_32_m1_0_m100_0)

(declare-datatypes ()
((unsigned_32_m1_0_m100_0__ref
 (unsigned_32_m1_0_m100_0__refqtmk
 (unsigned_32_m1_0_m100_0__content unsigned_32_m1_0_m100_0)))))
(define-fun unsigned_32_m1_0_m100_0__ref_unsigned_32_m1_0_m100_0__content__projection ((a unsigned_32_m1_0_m100_0__ref)) unsigned_32_m1_0_m100_0 
  (unsigned_32_m1_0_m100_0__content a))

(define-fun dynamic_invariant1 ((temp___expr_165 (_ BitVec 32))
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (bvule #x00000001 #x00000064)) (in_range
                                     temp___expr_165)))

(declare-const saturated_value (_ BitVec 32))

(declare-const saturation_dynamic_out1 (_ BitVec 32))

;; Assume
  (assert (dynamic_invariant1 value true false true true))

;; Assume
  (assert (dynamic_invariant1 max1 true false true true))

;; Assume
  (assert (dynamic_invariant1 min1 true false true true))

;; Assume
  (assert (dynamic_invariant saturated_value false false true true))

;; Assume
  (assert (bvuge max1 min1))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant saturation_dynamic_out1 false false true true))

(declare-const saturation_dynamic_out11 (_ BitVec 32))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (bvult value min1) true false)))

(declare-const spark__branch1 Bool)

;; H
  (assert
  (ite (= spark__branch true) (= saturation_dynamic_out11 min1)
  (and (= spark__branch1 (ite (bvugt value max1) true false))
  (ite (= spark__branch1 true) (= saturation_dynamic_out11 max1)
  (= saturation_dynamic_out11 value)))))

(assert
;; defqtvc
 ;; File "dynamicsaturateassert.ads", line 19, characters 0-0
  (not (bvule saturation_dynamic_out11 max1)))
(check-sat)

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

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2int x)
                                            (- (- 18446744073709551616 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 64))))))
(declare-fun power ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

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

(declare-fun nth1 ((_ BitVec 8) Int) Bool)

(declare-fun lsr1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_right2 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left2 ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun to_int2 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv1 ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv1 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub1 ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 (_ BitVec 8))))))
(declare-fun power1 ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min1 ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(declare-const val__ (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort unsigned64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 64))

(declare-fun user_eq (unsigned64 unsigned64) Bool)

(declare-const dummy unsigned64)

(declare-datatypes ()
((unsigned64__ref (unsigned64__refqtmk (unsigned64__content unsigned64)))))
(define-fun unsigned64__ref_unsigned64__content__projection ((a unsigned64__ref)) unsigned64 
  (unsigned64__content a))

(define-fun dynamic_invariant ((temp___expr_204 (_ BitVec 64))
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool) (temp___do_typ_inv_203 Bool)) Bool true)

(declare-sort unsigned8 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (unsigned8 unsigned8) Bool)

(declare-const dummy1 unsigned8)

(declare-datatypes ()
((unsigned8__ref (unsigned8__refqtmk (unsigned8__content unsigned8)))))
(define-fun unsigned8__ref_unsigned8__content__projection ((a unsigned8__ref)) unsigned8 
  (unsigned8__content a))

(define-fun dynamic_invariant1 ((temp___expr_246 (_ BitVec 8))
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool) (temp___do_typ_inv_245 Bool)) Bool true)

(declare-const r15 (_ BitVec 64))

(declare-const r151 (_ BitVec 64))

;; H
  (assert (= r151 r15))

;; Assume
  (assert (dynamic_invariant r15 true false true true))

;; Assume
  (assert (dynamic_invariant1 val__ true false true true))

(declare-const r152 (_ BitVec 64))

;; H
  (assert
  (= r152 (bvor (bvand r15 #xFFFFFFFFFFFFFF00) ((_ zero_extend 56) val__))))

(assert
;; defqtvc
 ;; File "x86.ads", line 403, characters 0-0
  (not
  (= r152 (bvor (bvand r151 #xFFFFFFFFFFFFFF00) ((_ zero_extend 56) val__)))))
(check-sat)

(exit)

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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-const a (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort longword_t 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (longword_t longword_t) Bool)

(declare-const dummy1 longword_t)

(declare-datatypes ()
((longword_t__ref (longword_t__refqtmk (longword_t__content longword_t)))))
(define-fun longword_t__ref_longword_t__content__projection ((a1 longword_t__ref)) longword_t 
  (longword_t__content a1))

(define-fun dynamic_invariant ((temp___expr_187 (_ BitVec 64))
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool) (temp___do_typ_inv_186 Bool)) Bool true)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

;; Assume
  (assert (dynamic_invariant a true false true true))

;; Assume
  (assert (dynamic_invariant b true false true true))

;; Assume
  (assert
  (and (and (bvule a #xFFFFFFFFFFFFFFFF) (not (= a #x0000000000000000)))
  (bvule b #x000000007FFFFFFF)))

(define-fun o () Int (bv2int b))

(assert
;; defqtvc
 ;; File "test_rotate.adb", line 8, characters 0-0
  (not (in_range o)))
(check-sat)

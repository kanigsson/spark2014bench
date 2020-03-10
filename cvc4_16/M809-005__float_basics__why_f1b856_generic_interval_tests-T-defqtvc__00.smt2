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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float64)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float64)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 9007199254740992) i)
                                             (<= i 9007199254740992)))

(define-fun same_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float64) (x Float64)
  (y Float64)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float64)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float64)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort long_float 0)

(declare-fun user_eq (long_float long_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float64)

(declare-const dummy long_float)

(declare-datatypes ((long_float__ref 0))
(((long_float__refqtmk (long_float__content long_float)))))
(define-fun long_float__ref_long_float__content__projection ((a long_float__ref)) long_float 
  (long_float__content a))

(declare-const a Float64)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Float64)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c Float64)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const d Float64)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort ft 0)

(declare-fun user_eq1 (ft ft) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float64)

(declare-const dummy1 ft)

(declare-datatypes ((ft__ref 0))
(((ft__refqtmk (ft__content ft)))))
(define-fun ft__ref_ft__content__2__projection ((a1 ft__ref)) ft (ft__content
                                                                 a1))

(define-fun dynamic_invariant ((temp___expr_168 Float64)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                     (fp.isFinite64 temp___expr_168)))

(define-fun dynamic_invariant1 ((temp___expr_67 Float64)
  (temp___is_init_63 Bool) (temp___skip_constant_64 Bool)
  (temp___do_toplevel_65 Bool)
  (temp___do_typ_inv_66 Bool)) Bool (=>
                                    (or (= temp___is_init_63 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                    (fp.isFinite64 temp___expr_67)))

(assert
;; defqtvc
 ;; File "generic_interval_tests.adb", line 171, characters 0-0
  (not
  (forall ((z Float64))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true)
  (=> (dynamic_invariant c true false true true)
  (=> (dynamic_invariant d true false true true)
  (=> (dynamic_invariant z false false true true)
  (=>
  (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) 
  a)
  (=>
  (fp.leq a (fp #b0 #b10000000001 #b0100000000000000000000000000000000000000000000000000))
  (=>
  (fp.leq (fp #b0 #b10000000001 #b0100000000000000000000000000000000000000000000000000) 
  b)
  (=>
  (fp.leq b (fp #b0 #b10000000010 #b0100000000000000000000000000000000000000000000000000))
  (=>
  (fp.leq (fp #b0 #b10000000001 #b0000000000000000000000000000000000000000000000000000) 
  c)
  (=>
  (fp.leq c (fp #b0 #b10000000001 #b1000000000000000000000000000000000000000000000000000))
  (=> (fp.lt a d)
  (=> (fp.lt d b)
  (=> (fp.leq c a)
  (=> (fp.leq b c)
  (=> (fp.lt a b)
  (=>
  (fp.eq c (fp #b0 #b10000000001 #b0100000000000000000000000000000000000000000000000000))
  (=>
  (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) 
  d)
  (=>
  (fp.leq d (fp #b0 #b10000000010 #b0100000000000000000000000000000000000000000000000000))
  (fp.isFinite64 (fp.add RNE a b))))))))))))))))))))))))
(check-sat)
(exit)

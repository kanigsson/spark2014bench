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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun sin1 (Float32) Float32)

(declare-fun sin__function_guard (Float32 Float32) Bool)

;; sin__post_axiom
  (assert
  (forall ((x1 Float32))
  (! (=> (dynamic_invariant x1 true true true true)
     (let ((result (sin1 x1)))
     (and
     (and
     (and
     (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) result)
     (fp.leq result (fp #b0 #b01111111 #b00000000000000000000000)))
     (=> (fp.eq x1 (fp #b0 #b00000000 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b00000000 #b00000000000000000000000))))
     (dynamic_invariant result true false true true)))) :pattern ((sin1 x1)) )))

(declare-sort float_with_approx 0)

(declare-fun user_eq1 (float_with_approx float_with_approx) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy1 float_with_approx)

(declare-datatypes ()
((float_with_approx__ref
 (float_with_approx__refqtmk (float_with_approx__content float_with_approx)))))
(define-fun float_with_approx__ref_float_with_approx__content__projection ((a float_with_approx__ref)) float_with_approx 
  (float_with_approx__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Float32)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_166)))

;; Assume
  (assert (dynamic_invariant1 x true false true true))

(define-fun o () Float32 x)

(define-fun o1 () Float32 (sin1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) 
  o1))

;; H
  (assert (fp.leq o1 (fp #b0 #b01111111 #b00000000000000000000000)))

;; H
  (assert
  (=> (fp.eq o (fp #b0 #b00000000 #b00000000000000000000000))
  (fp.eq o1 (fp #b0 #b00000000 #b00000000000000000000000))))

(declare-const lat_long__cos__result Float32)

;; H
  (assert (= lat_long__cos__result o1))

;; H
  (assert (fp.leq (fp.neg (fp #b0 #b10000101 #b00101100000000000000000)) 
  x))

;; H
  (assert (fp.leq x (fp #b0 #b10000101 #b00101100000000000000000)))

(assert
;; defqtvc
 ;; File "lat_long.ads", line 13, characters 0-0
  (not
  (fp.leq (fp #b0 #b01111011 #b10011001100110011001101) lat_long__cos__result)))
(check-sat)

(exit)
